Return-Path: <linux-arm-msm+bounces-93413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPb8N3ckl2mZvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:55:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAD915FD5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2EF053003820
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811F5340287;
	Thu, 19 Feb 2026 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WStp4k0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghOC1BWX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D13933FE0A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771512943; cv=none; b=ouwBfkK55jND0AYxr+CaoDH7zDgLNZHzvv3RKdSFY+T1JEV974A9wuQ0PUvoFdN9Ua6wZij+xeY/vTNaTH3tLF+w0jo3JV34PJLrpafGPWQ6ueDlwj/ImNTkMkQFAa0gpY13cjLaHn6I23XfjBall4aPgmuhEH+gB9Z2BgPKMV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771512943; c=relaxed/simple;
	bh=tbdcuT+g6r07HPBhB3hTvqmblkDZqNlP1F4Qz725D4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYQ5WxMAgyqIYsA4uk9A6kBibhZUqnAbPWeU/vSm3a6+bwGGFmUZxyzXeMJf/iWB5J+lSO8+PDo5dzdlAGo9E7qqvglh24eZe7qGKpJAPLmOw9R6conWUK+3n/gZibLxicXGaU2h5s2d6qVoBCDfdhcRS4f4OXCZPiYqonDWhps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WStp4k0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghOC1BWX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JDbrBs3272014
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZOhIku1tj9AxR9gmaDfARB9d
	FySATSSKwk2jp4g0rjE=; b=WStp4k0SKYItCw/iGfMON55XZApfSgkxXao6UZzR
	qIFL83OYLMWxcpSbA1e7VV7OxDf05x84fh1UN/mOht06GOIafbNqwdpih30DPqLJ
	8zrXCL79qdUigK8CpYdgrmjQfm1c2wWexr0nZ2xKvwgu1weU6dtz6bAQFub7QQpK
	0Sm/YjVhWphQ36KXwRIamTXdlQqaVSdoFofcRj2TZlawykk7SxECaWQziixiWQOu
	A1jCQMYWSx5jAGmbesvbhdjKyXKYaIOujk9dPdmWcSd+ga6ibYujEZpJF6wacUOn
	KNqyjQFlLOgwsfHCbCdfAzBVvIE6xbFMCLn8E5+gus5glQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrk81uwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:55:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c882774f0dso761501085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771512940; x=1772117740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOhIku1tj9AxR9gmaDfARB9dFySATSSKwk2jp4g0rjE=;
        b=ghOC1BWXgLyZ40m1WX8204XFkR9zNFLOqrE5vpiyZsX5QiPd0uJCreTesONpIy9hDb
         ZiTekOF3It5jZzcqnM4g35S18ksqg34KYnLtyHbRZodT8eLPFTMlKtcuxPz55OyBf3nV
         +RjOAppNOxcPvX2tnVXaOIMEypN5PkIJcxGiCOCXjeLIkKIIDJHc2rIayXkf5QyB7SLj
         z7unojpQCx576NMnNekdmmVsDJz0eRAAGSsyy7XAVtPi5FVk9oC/CblsyzSWXKozOKrw
         RWU33kvV/C8DvQPfdHp/rQ9GOdczpfB5Jt5f13DkJuQkj19CkUseC4UO8BsWfAwfJhVN
         chEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771512940; x=1772117740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOhIku1tj9AxR9gmaDfARB9dFySATSSKwk2jp4g0rjE=;
        b=CJHP66o7fAiJJoicAdK4Ocd1Y8zGoJUdYpSRy6ZkvDxe9ejgle2YuoExu6/UE7MbKj
         YEiagU6fCg7GlAHMOK+nZfbZ6w6xIruRfc0tIQlJVvOFAVY32imRoKn3KMVUUJD9dwIL
         r9yPvACJPeNWh+hoDvyP148AUIucbz3btpoPiggPGxp7AxJrJLaFFv5YznsGmvKzALl7
         jqJL6vC+ktTYFOCbfvfBZuA4QJt7zWBqMW/ucUSmtTz9ujqWk1MhTm4RWnNhk0q86Gbf
         68XlHdN/GwFoqOi0Lu5TgQW0ekMPd5bR/xAG0mCYAeaCFper0JNFa4fDr4NFNQ6UaIJF
         iBVw==
X-Forwarded-Encrypted: i=1; AJvYcCWWi5UQR7ZvWlMfl6lxbMFQ8tfK8XvJa39HR/Qyk7CbbTO34Uon0FjMohOMu88LDFlWHqZ5GuyLTGj11pjg@vger.kernel.org
X-Gm-Message-State: AOJu0YyIMRwW0kKFSq2/iIQhcMTQLSbQiXl0+xN7I4c8Z0VBKpDWTKo5
	/JHoo8J9MXudKPpPxXvqVbU8uUNGXFzeXA2PNVbpdLQ2zR0KCjTtAA9AIKyqXObnxr9VG5DJf1j
	Px3SOjXEmQNiyXu6kWbRcS3eJz/BGLoo2aZqOfExmVgWMu66fNRtVlv+/yLKNg9+382ws
X-Gm-Gg: AZuq6aLHfN+GUviprJsrlu0hw+xOQ9mS4GYDg6wpskMBjAw4cT/j1eUI50NuykIyFdf
	rL0t1Txj2jDYNqDALwxFpO19pGOX9rPbS0FfaJKoX94J4n6apie8NVwadsXBnyC0lLwf8JxbnY6
	gOM5Wa+yNpO4PIC8sqDyxEfeaQT7DMR094IT0nYnN9xLSOyiJfq+710W2nVbRlcPOhi0xdAjfSK
	KshCoYbLqHFgXqDvjfAW+a89WzTlX/plAx4Zb+nYJ4p+o9/s/wv4+SM1P+gWQv+MJyCt9wR54xb
	rsPtmseTRV+6mC2ca0+Goaq1OBWueifHb92kqzbC0XdhqFPJv4NrMQexEK+oKH/eAupztRph2bG
	OhdmUKcYMju0kVoNtOOWJ4ElX+Fj5NDWc7br9jt0F0UovjGYKgaJKre2N4DaVgcv97/Jez6b7mX
	xwOotZwrnVpu8yYnNf01WIYP7SkGgn+Z5yM/I=
X-Received: by 2002:a05:620a:bd6:b0:883:c768:200a with SMTP id af79cd13be357-8cb4bfa47e1mr2162864285a.32.1771512940477;
        Thu, 19 Feb 2026 06:55:40 -0800 (PST)
X-Received: by 2002:a05:620a:bd6:b0:883:c768:200a with SMTP id af79cd13be357-8cb4bfa47e1mr2162860785a.32.1771512939905;
        Thu, 19 Feb 2026 06:55:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5ad73esm5317879e87.68.2026.02.19.06.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 06:55:39 -0800 (PST)
Date: Thu, 19 Feb 2026 16:55:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
Message-ID: <6kvygrdcavcsn23g6ghbutw6ycq43oodu25u2dnywo43ev5fwn@fr5pmk7pzg7n>
References: <20260209-add_pwrkey_and_resin-v2-0-f944d87b9a93@oss.qualcomm.com>
 <20260209-add_pwrkey_and_resin-v2-1-f944d87b9a93@oss.qualcomm.com>
 <b0ade3b3-f2b3-4dbe-9e21-920bbda1d077@kernel.org>
 <20260210082612.3xakor2yo4h3dbra@hu-kotarake-hyd.qualcomm.com>
 <k2eu6lvokuh6pilmipztfqufffkmxa3zylsxz4lad45ow255no@fvocedpr3qwp>
 <bd10782b-444c-417b-bf27-9fc6a2117567@oss.qualcomm.com>
 <20260219104832.3fe5tlnvjqus7zz2@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219104832.3fe5tlnvjqus7zz2@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-GUID: dhyYgiifX7KwbUycAmkBxeDrmg8Ov5yW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEzNSBTYWx0ZWRfXx3Yqq/OmZ2V/
 tk38JPsrPoESWGOd0hji+625VMtPTatKZuTevUueYX6BVVqYN3oMG/pj5181ySKZ4veOO9tN7LT
 6XnzSt0q5FGJyhU2xvKeh+tBjhWBH+xyWDp5yrpUxWcqkMWWxs9foh29/w7RaP3uBZsfq1e+8q5
 oue4E88Jmi3kPmq7Tp/rM1MV8C7JHOJGyzl7h6gpC2a8eF5sDVB2HeSUJ4HOcGWy0nfVgEq709l
 YkLX4UBQ2PHDXYl9SQpy8btk/R1/C0guYBCU1N4HYmAQuhocho6G+Ef+ZhkRCXua1eIergLAw08
 f0rcwBhbedBs1XxlMsnROTDW081pRzBBKvsSq4uINubxUtDfJ/Q4SJftiAuabG3i9HSch1nyBJl
 87ebTH49Zh48giTMoUlCg94bU0vhx9amj7ZcRqY5qz8tHFPQb5nvei/2/eEd8xU6b/Y+jbes9Hk
 YT7Kl7jc++je7baV6Uw==
X-Authority-Analysis: v=2.4 cv=MJBtWcZl c=1 sm=1 tr=0 ts=6997246d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Vb7ys8ifLKOb9fvY7foA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: dhyYgiifX7KwbUycAmkBxeDrmg8Ov5yW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93413-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,sonymobile.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:url,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DAD915FD5F
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 04:18:32PM +0530, Rakesh Kota wrote:
> On Tue, Feb 17, 2026 at 01:27:29PM +0100, Konrad Dybcio wrote:
> > On 2/13/26 7:17 PM, Dmitry Baryshkov wrote:
> > > On Tue, Feb 10, 2026 at 01:56:12PM +0530, Rakesh Kota wrote:
> > >> On Mon, Feb 09, 2026 at 02:49:24PM +0100, Krzysztof Kozlowski wrote:
> > >>> On 09/02/2026 14:23, Rakesh Kota wrote:
> > >>>> Add the compatible string "qcom,pmm8654au-pon" for the PMM8654AU PMIC.
> > >>>> The PON peripheral on PMM8654AU is compatible with PMK8350, so it is
> > >>>> documented as a fallback to "qcom,pmk8350-pon".
> > >>>
> > >>> Drop everything after ,. Do not explain WHAT you did. We see it.
> > >>>
> > >>>>
> > >>>> While PMM8654AU supports additional registers compared to the baseline,
> > > 
> > > I can't find PMM8654AU either on Qualcomm.com or in the catalog. Is it
> > > an actual name for the chip?
> > 
> > Right, I would like to see some clarity on that too.
> > 
> > I see there's a PMM8650AU and there's two variants of it, perhaps that's
> > one of them?
> >
> To clarify, PMM8654AU is a different PMIC from the PMM8650AU, though
> they do share the same PMIC subtype.
> 
> We are specifically using the "PMM8654AU" name because that is what has
> been defined and used in the upstream pinctrl-spmi-gpio.c driver
> compatible. To ensure consistency with the kernel driver
> representation, we are maintaining that naming convention here as well.

Ack, please mention that in the commit message.

With that in place,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

