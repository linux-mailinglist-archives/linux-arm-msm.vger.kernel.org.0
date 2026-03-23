Return-Path: <linux-arm-msm+bounces-99364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEniOJh/wWl2TgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:59:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6BC2FAC32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 312013092A84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903643B8959;
	Mon, 23 Mar 2026 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4ndnKk6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CB3miboz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6382C11CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285543; cv=none; b=NzZ+wBDOvoK2h4gh1K1tHSCxjNDO3l5bc60q/Y8jX7L9UGhMqMR+DEfFB7pVzvq1XnORF3GzK88QMCHCTszR0Amo/+MBiwNSm+ZX4baytoUwz24Zp8AyXRTOsq3nThcs0ue9oKtFPH7esbwbqXwdszyPj3cm+SIw2YTUVLqg5Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285543; c=relaxed/simple;
	bh=8G0K0/rTswwjMtz3qkNEDxVdQ1vnR3it33z+PjIlQHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oj7smn/E0pEd6BZMhR2qDel+HJ3mg+6pcjlE1yzyuxq3lKJC3MP+o/bNQHJM0a2WGdjm4xpxWIz/5+pwvkiNyxJbEqIdvRVk7W8BJhtDHw5pAcuZ9koRK/SEm5uBpnsgs8BZwhNrts8twKVtvYSyZ/17WTrh1EFWuiFfkmoberM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4ndnKk6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CB3miboz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFHkES1422602
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=twk35D0p9dZpOL13Q8MIfcI5
	8+PpT9w6ZoYUO9ckglM=; b=Y4ndnKk6bzgPxwbynX79MYyin0LlpLxTnyrDosDk
	pRx9aEP5AMZzhZF9r0vabFEtk4MVJo7GTz79UqwQv9ZNAg8EB5yEBXoxYXm9vx8S
	hEeDYbSQHV586WdTAnEqDkGACF9VKmQxmut1Z2ZdrnKko5C12Su0tiBXzDynoWmx
	qzafefppbSg6lPSsKD6PYUZdZMqRpHhOFDAneq5scIOvitPLpmYMJ54UwA9cJu/S
	Mm11fQ2YcgbW1I5tlBG6TS5+gFjrOU2PGz6WNN7n8rmRrl+uHVsqj5CuUsf/yVaT
	+1/DRJdAn9RCOreogvOe2W7U46aspgfcYkGKVu/1a9r0mw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f08smq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:05:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56b7c969e71so2651906e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774285540; x=1774890340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=twk35D0p9dZpOL13Q8MIfcI58+PpT9w6ZoYUO9ckglM=;
        b=CB3miboz6pnQ3OeDgT78EAjFO/EcgrNbarBko+SlVLpARHLiCz8a2/uweCoqU89rBU
         gtaTft0EG5aF0g4ARHcBrJWA2VY8EYAW7asbYQM3PrpYeYYehvnUh+tBHCOHgzjruQuS
         cQe0wwZkI65InVCnoQ4NsV1ggzbvq1zxvZFSdgiz5sfZBRcqRIUBTVmHCFZQ6Wdst+fJ
         6jxsnihEFtMkxmycxVCr9UZZQ2BzMqfIyjrIRaiPwmlzHjqv/Hh0bveH73b1qcJBlGrj
         MBh7UydFODhH9lJelpIDvkD3FwcMtvot9zkybKZGsqxg6z+WQnc1RtJDTMLqhTIZQmFf
         MHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285540; x=1774890340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twk35D0p9dZpOL13Q8MIfcI58+PpT9w6ZoYUO9ckglM=;
        b=MoElkbj5JaUR/+wqoAgTZTZdKeXit7zdqXLdlZLR6AsgHLrM5Y3CHLzekr3kTuryoU
         rHEbvJerAwgM7vnLmQlXuapO3cSYii/TRX/iddLIkJNQ3GVkdpsp7iZ2y0aDnPl0reOU
         z8/4Jhb+hNevx7v13URFi+Xg1s+fHBMU+8CNtPEPWpXsPqs+p72E3fCnwz61KatV3/7M
         ibt/SXoRVIg/Vvw58uX/8Cqo4DKlpn9jr+FU/hSZYHOeUaodBb15VDCYqQ3aHkkSTGSY
         qSH3/xEFy/7usKCTVBgT+sGkPqvO/s0HM/CzlSJQyi4VTfYOR/zJIS0oJUmvhIMK4ely
         G7XA==
X-Forwarded-Encrypted: i=1; AJvYcCXwbQKSwPwZAKwIjlLGyv5mHcGsPK2jBXg7BMGQ9uURNYVgJpX8xg0cS2gGmk6TtjGsftQcqndfsa9HRv0s@vger.kernel.org
X-Gm-Message-State: AOJu0YyAXQQUdFg9JNhel6P2cbQi/Jt/HGLMK54mAZ1mCWLZoRe0bq19
	QaXOxyU0AqQK0bXn5wxCQgIUpJB/fLtT2g9EwNS9N5ddYrxVlY+EVL95qzo5D0HNmeQaq8s0BAP
	tG6wfldKPmAGEjUlU/ihRBsICLUmK9NFIANyWrZGrzMzded/O+DPtbEj902FuOpeXKTit
X-Gm-Gg: ATEYQzzwnKK/BgcxQ8eXJXLP8dRR3fS2vyRkfjtr+FRt9Qig/SHxGQiJv0Vd9BuFV4V
	8uh2boTjyuwkObUGV9mB4Oq9prKx/F/xTgWWryatwqvvS3nxDTQqbPiP6YaaA7PBn63SOxAeTqp
	6Qk3ZMVWtRyMKAIqqgmkEEzYAfayghSPjFCYPC1FAoEgV7Se4/HRNQMQNohjS9v59xsyiEkDJoW
	o8YUhPRGnFsePR9atXKnvcQJGfoA6x0ksUp3qM7p7wyWDGxIlf9wKVoijX7jbbhkdRlB9F13/CY
	6bhbgeEiE5zsAKmuNrwu5M6WzoRm2zfYsqtry6v01nkFiDe8/4ZgdrizZaGd1wc1nL5J6Snzhns
	KcaXKS2wwK87ljdcvGWH6dCYWTi9ILI1debhM3MfkD/0TUm6x+7zKBpyFQqFpA/IouKh+hx/nBL
	X9GNPvdncfYi2V/0yTWVp9yS9KXBXiODS+ThE=
X-Received: by 2002:a05:6122:e251:b0:56b:5893:d051 with SMTP id 71dfb90a1353d-56cde437244mr6064716e0c.13.1774285540244;
        Mon, 23 Mar 2026 10:05:40 -0700 (PDT)
X-Received: by 2002:a05:6122:e251:b0:56b:5893:d051 with SMTP id 71dfb90a1353d-56cde437244mr6064665e0c.13.1774285539828;
        Mon, 23 Mar 2026 10:05:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f68sm2546288e87.52.2026.03.23.10.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:05:37 -0700 (PDT)
Date: Mon, 23 Mar 2026 19:05:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable
 onboard accelerometers
Message-ID: <l3cfeezstqrabhgba2xnzciztfwp6ijunzemlb5uanpxhgmscu@kh3jdcc2dhbj>
References: <20260228-dell-xps-9345-accel-v1-1-daf9e3b3b5ee@vinarskis.com>
 <630bcc07-5290-4099-bdf3-b7e37105619f@oss.qualcomm.com>
 <kFzSXZV8ReVKN_rvfVDZw9pOzHeLI1ia9bepKas6qG-7G4WiRKk1RcvEhMnPrKrFDvRzLMUSIZgnDY5oerb7kdSBreCjnxJEdPZG9iyYp9o=@vinarskis.com>
 <0ed387b7-c4ed-41e7-bccb-eb1a96064c69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ed387b7-c4ed-41e7-bccb-eb1a96064c69@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c172e4 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Ey-UEif9ZV65Nm3MetkA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: Xysj9rCszYyFknaEw26QipjtogihCC9h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNiBTYWx0ZWRfX1eR+8miyzGGb
 XwoDlnTofl1zo4NEWcAAWJAfzCc8yUV4LhseeijMYkOkzhi/umhVKWTEHBE8MiRYoG4mOGBdE0q
 H9z/rnYqk7jgZmGGg52h0ev0+Qh4w29DUuWo3LsemlisjYjpAqxOarehG9wTR5xZx9UQGDCqNTe
 WHUoSWjvCNBvtGNoPhMol9CLbjGfaz6C/6QUo2bPmx576dIEAc2Z8NxnIllgzs6evRO2QfnqACO
 HGaIPEyyNvoR7LycsEX1RfxViEPXzCwnYloUKefNMx15xKty/sJJ3hhwaSADD5/sib7Rd51JB50
 KsyVbNFR7ZOQTQf6xfmf0cY9Q1caMp5ED+Uv/IzT3puxwQn1oFDMs8mqzksCxFkutsCZEZRksfF
 eVbSDb9udcW+c9TGLjm8TY9E6N/Ojxj8wgMHK8ou1a0gdQ7I8QoptFjYRTatjNjHct4+l2cNqHQ
 h6ViOKo5WR0lQigmBcg==
X-Proofpoint-GUID: Xysj9rCszYyFknaEw26QipjtogihCC9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230126
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99364-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F6BC2FAC32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 04:06:53PM +0100, Konrad Dybcio wrote:
> On 3/2/26 2:25 PM, Aleksandrs Vinarskis wrote:
> > 
> > On Monday, March 2nd, 2026 at 13:14, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> > 
> >> On 2/28/26 6:46 PM, Aleksandrs Vinarskis wrote:
> >>> Particular laptop comes with two sets of sensors:
> >>> 1. Motherboard: accelerometer
> >>> 2. Display/Camera module: accelerometer, ambient ligth (and more)
> >>>    sensor
> >>>
> >>> Define both i2c busses (bitbanged), sensors and respective rotation
> >>> matrices.
> >>
> >> These GPIOs correspond to ADSP/SSC-bound QUPs. It may be that you're
> >> poking at the same bus as the DSP is, concurrently.
> > 
> > Indeed, Val already pointed out that there is hexagonrpcd to access
> > sensors behind Sensor Core from DSP. I found corresponding .json sensor
> > files in Windows for all x3 sensors, but could not make it work yet.
> > 
> > Without these additional things in userspace it does not cause any
> > conflicts: I've been using this for a week now, no i2c communication
> > issues and device orientation information is present.
> > 
> > The question is then if we want to keep this series which ignores DSP
> > capabilities with the advantage that it will work for everyone with
> > the new kernel vs doing it 'correct' way over DSP which requires
> > additional json (and binary blobs?) and userpsace configuration,
> > meaning that most users will never have these sensors?
> 
> I don't know what's the endgame for sensors. Maybe +Dmitry knows whether
> there's any action on that point.
> 
> Going through the DSP allows you to keep aggregating the data at close
> to no power cost (""low power island""), notably without waking up the
> CPUs if there's no other work. That, plus I'm somewhat skeptical about
> going behind its back, since it may be that a firmware update or some
> other trigger makes it start trying to communicate with them.

The sensors story would require DSP libraries matching the firmware,
sensors descriptions and several still-closed-source libraries to work.
There is an open-source libssc project, but I don't know if anybody has
tested it on this platform (and it will still require DSP libs to
function).

> 
> But I'm not 100% against this either

I guess it is a necessary evil until we get libssc to work on it.

-- 
With best wishes
Dmitry

