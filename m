Return-Path: <linux-arm-msm+bounces-100472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMUVGJrtxmkIQQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:50:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E1A34B4E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BF1930DFA31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C31637B00F;
	Fri, 27 Mar 2026 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oQfFE5ri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWapaQjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B18433B6DF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644332; cv=none; b=EmHaIurPBe9BVNYw4Y7Q5rx56YZxsUhjdXwj24p5qI9kaddGLcaPlu+zfl+XagJiiCGDhuNdo2GTaD0IZZO7fessT+OgOmwOgemc2ociUlC9og1kk7WMWdOnqp9jk6pUCLiHH5e8CT28zjazeUvOjVeavjwPRSKi//jLcnLEqFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644332; c=relaxed/simple;
	bh=kFZ7oITAqKriU0X5V0NSUSPeTwlu4Lr9Zbk3r69tkfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRcGdWKYHpkCd4l2tvh2toTP+FvgxTofLEjSHdcy+rnI7rnyjLQ3umQeIjfurV//qDbfwVXW3WdvaErRfBU0HVHnIl1Y4yDRjj18Asd/AsIBRWDVvpro6xd8Y5B1uBJnPnQ8kbDau7OC4KIj5iBVGh/lHMhs/nRmQqD42Tq08GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oQfFE5ri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWapaQjR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKWIoO1334770
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32/2Vswo/Z1NPaFaNOGKibtIU/RnlHV2CWWrqpTejhU=; b=oQfFE5rikHq3qd/Y
	zDpOW5Wqocoz6ejSBwWxvwtKay9iG3ccPKtf+5KFif5RxMArGYHRM+H9EkgIuBwM
	FEiN/F0pfM6amY1scL3V0wQY19vz8fsS5FFNH/zBJrLosF6unphTYRQA3h+9PwQa
	8CoO4q3fdRZs0l4ZOPpIH84rWd4bVfXktvo/xW00iet2w9Zuky1vURWp2gQyzyHv
	mlNoxpeD28Qn5Qdfug0qFnIrkRsCjvtiy9qfmlOFWeCh+ltFoTyawGsy/A7fjILU
	thBZs1y3a1oFMfvBYGmaRWCSf0WRh8f9ezc+pY8RWpb84kTaOSyEF63qP+vY0Va5
	cR8c6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6111g11u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:45:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50917996cfaso24498031cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774644328; x=1775249128; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=32/2Vswo/Z1NPaFaNOGKibtIU/RnlHV2CWWrqpTejhU=;
        b=JWapaQjRfiqBHk6wpq/0/kIBar0LjiR5QWHQIVtGbX/D30/tLybFEGz7eJw7QuxGM8
         o6qi+tQJZ5cKa5Wdvuf1ysi32jZYZuREd3MnHGFNilWDi5d2gCc4hTjbSCjDk4NQMU0c
         whac4KwZoMOJZyjlSgoakIIHAB+nOteVeDuU91zfJk/MEqrrXM0wr5V/Kx+Fb9uKV+kC
         o9GL5rrjWxMT3LDTxSXCgTMa4A1j5j8MeF0XukeS/WNuMuo6jlnI2NAQnrCQ2dL4uy3E
         CIpOgGqpF1AS/26Xed38a045U9MQjIILKA46VRu3D3Y43b/MA+ibkBNpH5o4Ch2zLlH9
         4nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774644328; x=1775249128;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32/2Vswo/Z1NPaFaNOGKibtIU/RnlHV2CWWrqpTejhU=;
        b=JSbce+WPobKnIiOU8qT+htzXP9VqMzeF7z1s/lSLe0cXdXAMZ6UY2barUshnTz8qpR
         oXzDX/RLoer6k0Az6g/0c51qa5OGbQl/L8aUzOum8WCtfTLrGjJE7uaWLyiO3+a2F5zS
         fIx10CO2pgqJDQvzVf9schk5kLty4Iwbnn0kWuxjmy0wX2ObXIbqnt0u0OmxYgD5XdYU
         jsWZuoRSdkyDV2we1WJXXC7NVyiafIlcNAGPsLAUY84l91+03w+ptSLfntPeYTo1d31F
         lSGDGgQl5T+S6WRwXAoIM79Itz9P7OPJBbjypZlh91UmFcaZfYmuI4yCFc2uWQcyXgkM
         pM/A==
X-Forwarded-Encrypted: i=1; AJvYcCXRDbJU16mExfb5Axr5T50a9K339DZ2mphOgcybvLcFirr3cOkOUjj6okLkd/QRzpCQi0tc0HOlpH2Sbroj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Hxd35foGinL0Y7WRqetkPzWAxN+rY/xNgxUlMlaCfnzueH/G
	P89qdcg7RcNU4KomJaXw2l1U9/qOT0MPozYVfFfI11r/zGTJnNjHie2nzavgyPRHLzgoeN2LWq8
	5nVP3bUdgNjSKJKfdLhg+fJxCTT93R2N/QRSUREW5tzn9NvfnAmo6r+tOLFWYnPOeZZa4
X-Gm-Gg: ATEYQzzvnrjHX8CXK3QNSpnsmMFAhMh804pXN46ROa2eTR+BPH9BL7blflfvapZJvEX
	WXQB7s71FjMc93WZt4khUFefXDYmfVtEMnySfz32+wMDgGK4e+wBcI+CZCKOjijr5wDua/KiE7k
	lnN4TY1VjqtdJfiUDTvp3CjfUZOO46k96lFpID+EFTf1Rxj4fJtYEarM1uGpaePb7tLQ1HL6CP3
	KflK4WPF9tWiS/gwc22H/rO3IYVaPvUITBd0Oi976pwim9IvmPKFRt3Oqfv45eNdaRtX+kFuKgb
	j6gJa16SN0cYbx+tYcEdqViGH8JKAXAx3Vy6iKUIH1Yk1Stn9NuxrvpwzRRn09/CRniEAUBwjIz
	GbPKbef3dCDNsKu44jdTwEOIEcwoEaagsK0pai/UI4++KbSRtNwL95zvfnwex01TaPcGiSf8n/z
	naW6HpzKFfn842yse9whlAEr5G25e+Ubb8Ig0=
X-Received: by 2002:ac8:5f12:0:b0:50b:33c7:5d97 with SMTP id d75a77b69052e-50ba38bbe0dmr53588451cf.37.1774644328306;
        Fri, 27 Mar 2026 13:45:28 -0700 (PDT)
X-Received: by 2002:ac8:5f12:0:b0:50b:33c7:5d97 with SMTP id d75a77b69052e-50ba38bbe0dmr53587981cf.37.1774644327621;
        Fri, 27 Mar 2026 13:45:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d4381sm663401fa.2.2026.03.27.13.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:45:26 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:45:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/7] MSM8953/SDM632 rpmpd/mss fixes
Message-ID: <kz2uuxipafymtvivrywsyrd2567ccnhbpicqqn7uzvdvqzp2wo@kwddn4qyshxw>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <lv2ali4zgsfdh54yd74cx5mvec2z5kg7v4rkayyukpjt6juyft@vzprb3rvewkm>
 <083d2560294855857663df23e8900f9b@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <083d2560294855857663df23e8900f9b@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0NSBTYWx0ZWRfX9SukuYW5U3g0
 10CiUfsjkY0accj0eULahh+mOQIj2qYDg0yPDI94I8yG3ltTAeQInNDItkLKG1QVafHgpxm6Ncn
 ImyXotqb+Dlhm6h3aEJ8by8o6zRB2OwTkmIASnz/LAO+Ji90bHBuidyQ/ESdp8S2uESa+1gYso7
 Bg4NlfBfher1UtHNzPbq/IX1LsBQvRFc2YlCD0CRXktbufRLY8l6Y5AW9aSpMKueV9y1fQgNIrh
 +4EF1PX7rbX+6a6Uz49Ik9gtD7WLht9VXReXwX3DXtlAYbqzZ9uqfoaKGajDokI6WWgpGziyUPP
 Xrroa+bogx+UtkkitlhcreND42qbnBAyx41Qhqdr/Mr/EHkT+/JYj3rDMGwga0/kxrlFYYZG7E4
 0VIHzmMoQitxzENLH78HRnPcZhkq27uQFvxUttDjCBcQ19Pe0AD4L4UummpQB59gvN4inlrYtmb
 Dbr2uxrXZWzC3lmmSPg==
X-Proofpoint-ORIG-GUID: vM6Msi9YJ9qfgzQDF1ZXrBkhr-5QwZeP
X-Authority-Analysis: v=2.4 cv=aoW/yCZV c=1 sm=1 tr=0 ts=69c6ec69 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=k6zDti7sIud78PQTOkIA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: vM6Msi9YJ9qfgzQDF1ZXrBkhr-5QwZeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270145
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100472-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,mainlining.org:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11E1A34B4E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:38:20PM +0100, Barnabás Czémán wrote:
> On 2026-03-27 21:33, Dmitry Baryshkov wrote:
> > On Fri, Mar 27, 2026 at 09:11:42PM +0100, Barnabás Czémán wrote:
> > > SDM632 pm domains are different from MSM8953 because MSM8953
> > > is defining pm8953_s1 as regulator but SDM632 is defining it
> > > as pm domain.
> > > 
> > > This patch series correcting the pm domains defined in rpmpd
> > > driver and splitting the MSS resources for the both SoC to match
> > > the reality.
> > > 
> > > These changes was discussed in a previous threads:
> > > https://lore.kernel.org/all/2b057aa5-4416-4fd4-aeab-6bc23acbb53d@oss.qualcomm.com/
> > 
> > Was 4.9 never expected to work on MSM8953? Or did it require firmware
> > changes?
> There is no official 4.9 kernel for MSM8953 devices, all of them are using
> 3.18.
> There are unofficial 4.9 ports for those devices but all of them defining s1
> as
> a regulator so the regulators were changed back like it was on 3.18.

Ack, thanks. I was looking at the msm-4.4 tree from the sdm660 branches,
which has msm8953.dtsi. Thanks for the confirmation.

> > 
> > > 
> > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > > ---

-- 
With best wishes
Dmitry

