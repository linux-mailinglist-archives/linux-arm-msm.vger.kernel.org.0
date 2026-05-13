Return-Path: <linux-arm-msm+bounces-107319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJZfFYGNBGoALgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:41:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EB9535484
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAE5033FBA92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D9742314C;
	Wed, 13 May 2026 13:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQda1NVv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYAPberr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5809F33EB1A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678988; cv=none; b=sSj1GfR9MVTmq/RsqyBOIDXdMPNoSX0wmhzap17icKsJal6oO0ylyaAW+8vPO8XnVerh+3ROUWTrTC9W4ZpmKOdrM8edlQHbv2BAlm9G1bT6mwN+pG+/zO9dCMYD732PgbzAJYIiWwGP3ko6M4TJoXc8eJbEHCRxrr9acJ8O6Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678988; c=relaxed/simple;
	bh=h9cHbTVyfhhkh4MZ7cuH7Nx1qQBZMTByeT7Av+06L84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoDuhhHfZ9rZp2mIRvcPPwbO3sHkMFEBQNrucKAWv14cBY2HMaCMSBejdStLfimZb2mvdUvg04k83ySdD42kcLnzI5HMbG1gyvuSklKDtzenCQR0imgRoB+Bpmql8XtKTQ9xF+Lebm3W9x0eW4yt77Y9hGooIPTs4nzTA+9flT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQda1NVv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYAPberr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAKSCO2321468
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GLjjvr/kpXFgzi3+oKZJpIGO
	I2o5W4/4aQXjO084tiA=; b=mQda1NVv5KwohwetVTbmGEfBIO+FzlXUzEeFfL+f
	MEuzjd2Rrxsq+j+0AIeZFf9hHP+93At7QqGJp+QctIZLHltNXqNP7AmUPAm8KWRO
	3Yt6dy4fNJtvozMCrpbtRt3jHwZstumctAZKPXD8fnd8ttnnTV+buWUU584RfYQj
	XiRA6VbTeZhFNy/TUx/K8njvSD9N2t7v76pzMY3Xzb9OwSFYBCX0yVIFX1CQbYTF
	5NxSYt7oAhC1NU2Z5A4uk9TWqaDM2OEL6mxB3wVR16q8xNSIBtyNSCncDnKCutqs
	2PSAYJP8kqDbA0Z+x8u1xCD8OAFvWw4aPMKRLL/EN1l36Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgua4j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:29:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8e8c47a3so7122011cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778678984; x=1779283784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GLjjvr/kpXFgzi3+oKZJpIGOI2o5W4/4aQXjO084tiA=;
        b=VYAPberrvunTmAdvKiIybhdtVqLuT9/o/Lmd3Ec6Qt4/76aZbIDahsjTmVgfoPn24Z
         vNSK15u4DovpHLMxz3ydvwHOHnQqvNT73ilRTu88Whs+VkDdQNOOzfdYZwtAQy3PsbsE
         Xg+hRRE6mHKKG5EYB/ihTuJ0ZrPZia5xmWjgYsW4pa8hXtsWR2uVwPmcFW0u2UTTCWUi
         tun4LgPkuaguIt/A1IddracZZkWMfoWxPveoDJwyZXVicU/XizcsIIwBlvDmD9Yyg6Sq
         iND4FJz7SteyB1jsRv9XhSP2jaR2/KNp/TFsupBFLN8rXK1aMNZX0Vs2POsH+rUwLHou
         B9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778678984; x=1779283784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLjjvr/kpXFgzi3+oKZJpIGOI2o5W4/4aQXjO084tiA=;
        b=Vr/d9p3ePHsi5NewCxbs2AUYvMDkZ0Becqu8IRGJjJap9WrBm71iti6JdOC/WkF8wS
         J6+x87sWrUPY0UH+GY/6y/1eCbAHeifPjU5unItVLYEFWX6Yy2bnTlCRRf1k4K/LjIqt
         2y6er9oLyiERHwpbwYyXhrs/+61MiACYH/HRymbSssQ7IOLOwbPYLAxIs9iPvcBsMWmh
         dX1vmiTCPKUU+T/oAsdzWfp6P3Lq74Jx13foz/sJL6DcgpPmmrMEX3wEbHrdStKUKw3m
         oOU5RI4pCCCJksfKYnrgQcmWQazQPu1ok8j1EFEMEeM5qhL9mvVCNZ+CtVC9uQLWPxUJ
         UpzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NDC7CgUV7F6Yj99ASL0MeK7Q8BmRCTs4UxRT4lKlkpQoG27lI8kjuqv/6b8etR1UWfU1WxCkU4iVd4rfW@vger.kernel.org
X-Gm-Message-State: AOJu0YzhqkAMGBTwrdf4e01oxU812Nj9/BGL2zFiIAu4nSG+BJDupgeC
	GbprlmRuJJnLb03zkBtTm+tbZH9D/KcSblo5JlP0aeTLrCMPEJNjJ6xnOyPF3TBAdDu6mCbWflm
	KNn0RSe0l1fiNjRBvxurGhlFAWGcCP13xvwGGx/BGXeaaT3FpJn4ZrygniAn++8KwmFBM
X-Gm-Gg: Acq92OGz2MW/RGeWnaoXcMhweBvd8KdskPGMA8Ywl6RQtfxn1hZQM3et3+jG6U/vSvC
	JicBo1rM6o5kiitGjHZKywvYo6pqjo41kUqM741iP9v+Se4RuVtqPCn87vyDBXNLgWH1RYt4sg7
	IavacMLLFdGVAe6sQ2BWrlQ5bkxtf5A5pc3Z6qazf4i9MkXqkyIKsBiTFfMHcFdNqgVGCBqwMQk
	HMOZqE9gJ8TiJlqAll2DlfiNDp6rHpHKVUBuGvuWGYo/hxeRfYNQuiXbymHp/AlpN5M3RviPyFf
	5/hdHRxCNKxVSc+IxAljjeKKJaPo2kvfvlT2BDk1C7RmAp+2IeM6fWaihuAdyXcGH0ZY6jQ/5WU
	plT8Wgpd27JCBGE85EYaxy5iTZ7yqTXFIExI1I8Q61S8dcPh4NyQVY+v/1rRTHnW+WPBUKNALLC
	+WAfgOWWBA9im0La/3s1YJiQEKmnN1QrtVrVo=
X-Received: by 2002:ac8:5902:0:b0:50f:c65f:a4fb with SMTP id d75a77b69052e-5162fdcffd9mr40708731cf.11.1778678984529;
        Wed, 13 May 2026 06:29:44 -0700 (PDT)
X-Received: by 2002:ac8:5902:0:b0:50f:c65f:a4fb with SMTP id d75a77b69052e-5162fdcffd9mr40708201cf.11.1778678983983;
        Wed, 13 May 2026 06:29:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18ef9sm40493991fa.8.2026.05.13.06.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:29:42 -0700 (PDT)
Date: Wed, 13 May 2026 16:29:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 04/14] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
Message-ID: <kdbo5d2wibjfnchfw7xn3wcgcp5r6ff7pw3ibkpbqzjgfhkovp@v4er4hdiytks>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-4-7fbb340c5dbd@oss.qualcomm.com>
 <35zfskmyogpazxy7wsw2jg36fvpnnc7hng23j4heq2jy5ookai@q7d2vl7nn7ck>
 <fc188af5-ec7e-bebb-2654-62312d79e60f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc188af5-ec7e-bebb-2654-62312d79e60f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a047cc9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=MFmcrfekO-K-MGbKrFsA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: tQ9II246jlHlXfQgsEiW5H0pdt_oJSEr
X-Proofpoint-ORIG-GUID: tQ9II246jlHlXfQgsEiW5H0pdt_oJSEr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzOCBTYWx0ZWRfX8oXwy7EusFbe
 iCLoobDJkiZrbKusmXN7HncYHoAljk7QwZd4rNrNnaBkeo85+wkiSbbpRNOajeNQ7WSMgBG1uas
 /UaxXq5DTJYMf4e1aLKl67Ph+KofBy06AU8gpMkhQQy6We6Wvaj+FICqyiUT8m+cvoPJcQJSsKf
 PnAk/Cty9bx8wBNAeTgkabnCGumaa/w5dbiEYbb2gkTdGJqGKFWmcEtnMQ66R+WrXc03CwBPA21
 QedqhiT3uVqg6lJfyq7igctKr1v/PNxaNbdk4pEW9hndIm3sOUgMZNYk5pE7voHCw1BPwkP2/Qi
 p/A+4QXnXW4OSy9hSE7BQQvUbteY0e6LtGKyscIM8IVGAvKY5u31n5E8zuujj3+Zi5nfNXE9PeM
 uXCy/A8dNA1WusL4/CWk+nWBGUK9+8cw+Uw5JWcYuisULAkVsDdQ2J57xBsOAmtavOfjt5IHLvg
 Eaq3sU7e7KhQpT0kOoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130138
X-Rspamd-Queue-Id: E2EB9535484
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107319-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 10:34:15PM +0530, Vishnu Reddy wrote:
> 
> On 5/9/2026 12:52 AM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:29:53AM +0530, Vishnu Reddy wrote:
> >> The common schema defines minItems and maxItems for clocks, power-domains,
> >> and iommus. This suggests that the number of these resources can vary,
> >> while in reality they are fixed constraints per platform.
> > It really doesn't. It provides common definitions, while individual
> > platform schemas tighten those.
> 
> If a new platform requires more resources than the current maxItems listed in
> the common-schema (e.g.,Glymur due to its dual vcodec core design), we need
> to keep bumping maxItems in the common schema every time a new platform exceeds
> the previous limit. That makes the common schema a moving target driven by
> platform specific.
> 
> I am fine with increasing maxItems in the common schema instead of removing.
> I can set it to a reasonable value (for example, up to 20) so that it
> accommodates future platforms without frequent changes. Anyway, each platform
> schema must define fixed constraints, since clocks and power-domains are
> mandatory per platform.
> 
> Could you please let me know which one you would prefer going forward?

Just touch venus-common when new platform requires bigger lists.

> 
> >> Remove these constraints from the common schema. Each platform specific
> >> schema already defines its own exact fixed constraints for these
> >> properties. Additionally, remove these from the required list and update
> >> all schemas that reference this common schema.
> >>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> @@ -64,10 +44,7 @@ properties:
> >>  
> >>  required:
> >>    - reg
> >> -  - clocks
> >> -  - clock-names
> >>    - interrupts
> >>    - memory-region
> >> -  - power-domains
> > Do we expect the platforms with Venus / Iris not having either clocks or
> > power domains.
> 
> All Venus / Iris platforms have clocks and power-domains. These removed from here
> and added in each platform schema.

This is a sign that this is wrong.

> 
> >>  
> >>  additionalProperties: true
> >>
> >> -- 
> >> 2.34.1
> >>

-- 
With best wishes
Dmitry

