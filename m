Return-Path: <linux-arm-msm+bounces-96378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGnRF/o7r2kPQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:30:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C673C241B4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 699FC30036C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC412DF156;
	Mon,  9 Mar 2026 21:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHtmGR1w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+oNnzY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19320344DAB
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 21:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091831; cv=none; b=Tn6tRSqV64JzxdeAbcEkT+466gTAzfNOLgwCMS1f8W4DSlYwQFvi9OkPC/lN5IGezZrbq38FdLE2LqHzRMok/g7TTj9tBEmiof/9NbKBH6SbL6bB+S58iuIo0n9O8SKoWdaMaUsTFWJ9P+qtIcwbYUnOWv5VuJe/MnIPT9xUXUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091831; c=relaxed/simple;
	bh=xs2S5KUrfEjKworfoBaLTwBtyVXzsz1AFSJ2f6KcTf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KmbfL97KExki4I03fM8H3MkFnRXM9ATcSN0AYUPx9rFTma2suP7gA0DCj1YVe9u8qPzrR95PN3GGfkSyRji+b8/RxB5QaD9ImMqteVwgUWLJjZt7Ulr8zjev3jEzi8qqMiJHr0XZO2AKGE9otLDOUA/yRiwNAD5RfWKcy+CFRYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fHtmGR1w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+oNnzY1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC6PQ3280657
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 21:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0HneztzBgvzuQhZCLpfdrUnX
	/tWWqRcWHJcN1RjTycs=; b=fHtmGR1w7Lld0Pq7fPMinNyJhEHCCu8ZmSp+b/XK
	BW6L4NQhBL8ANVsMKjx851Ah4Lob3SKLC+BFGf9BQvv+Lzid9FP7OobIofFizjBp
	jZJt0NJZqyrfALLzq88qYifpeuj+n2MY8KWb9MfIaG7ed6aNXiO66ReH/PgIiKZd
	7q3PFEDsjKA0QP7yRMkhIluJYUhCnZ/X/Qz8WmB2wnNRqgjyRCZHJV4ibtXy75ys
	yW3dPW3FmmmTClUJc48/ZbaCOsGqswoKtHz24lSai+2uv1HmcIbm46i6vPc+QVmK
	noO8Yf0oqoqmDi+W1Ldamw9L+ivkhMyuvUk6pgOISzHG3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcyb9pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:30:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509162597f9so102208931cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773091828; x=1773696628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HneztzBgvzuQhZCLpfdrUnX/tWWqRcWHJcN1RjTycs=;
        b=I+oNnzY1x5XInf32pu/pHDiKDVnRLXAvafdoe5MDBuMqfLh+0XrrTc2KluXD5gdr0X
         XOsPD5nV5We/hZEJ7SXzhFovlXUzSqtzZSOERYHO1JDzqL46hbyBh0A8j97KPD8w6S9w
         QH5WxrYYlN9cvdchfHANnqtmpV3kf2yAQo2AIJM686eUJcroiAJteqWDwT3JLJovxbtm
         Ya4p5ZmxIEXQK7vVp9ncdWEaGoeMI+vmnJ3HL+Xrq5FhXqWhDhbVG+coCCwU7Zw+BGGR
         CZqgsBIGJBezToVGrdHVGKEMIgOxjkem7LnFonwX4WNVKl/BgE64yHTM+bUr85hPMkS2
         fmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091828; x=1773696628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HneztzBgvzuQhZCLpfdrUnX/tWWqRcWHJcN1RjTycs=;
        b=bDWEMoPTshjhocZbctZfgUs22l+rbcSApKF/4GNclR1BeAjW6O7+54KWIYChbBp+cA
         8T1EZA83iGLni9E74kTN7fY+DSNydBzxmZH75Mr4VVVGwdUyqbMSwHL+AvZJ8jvzOuBI
         kWHMmMCSbjbe3tbWP52juU8zWE+C5ck6pfmbITjGhZA/zqxhy+rda7BbnmY+ineieDo1
         Tq//jT74EpxTqWMH9yUM/YiJ2i13bzuK3mHG4RFLSLMM/8UFAZ8Ly8V8G20skwxB++vv
         dkeD4RfzXvqxsV2lhINKhHSVyI/OE323we+2ihpO/Ne9jdhXlczI4XGI0fqIR6hQhq3+
         cafw==
X-Forwarded-Encrypted: i=1; AJvYcCUVwHgmM27xgMuGEi4mwt7MnFbSHUCPKSoR3RObdvlpwZe2ShJYS0VpSnSwP8434sGrkjoDb+GjYE+quHvD@vger.kernel.org
X-Gm-Message-State: AOJu0YwTIfcpHDXa1pICneQuJ1O4nra7LVtL2mWcBvf0S15vRiYuuJLm
	e2isWwFFnGTSe6u7HBAkutrwvU9Q40xP5ZI5wmX9FuRwVIbB/Cxto8ftIsGtgQcJVFDyZGKPFev
	o/9wOU5wu9usR0cTPuv39a5EtbSlN+G5PhIKVcUtsvFmzpfWVfOfZxH4BeO+mGrWqHzDr
X-Gm-Gg: ATEYQzx299yAwWf/srtEfLhKgIJD81rhI45mcasDjOfzGnH/zTN26SrueA0x5iA8BhM
	656zM84iLqG/Y/gzd/+ytBbA7ZCak3PeWORVjMR5zYI1+O7X0D2cUmtRU3JAN+iAtYeZRNZjwj9
	Xmn9IPd86XUN6lswB+u0pN+nIiEK2AU0C+aDioplEcMNCJB1eMKMV9uyoGMJ/I2WFVussr33Sg6
	xvZmwwUzlzoomSveeExvWNHOhEDuQOpdXHZhDOEUr9uNVDyT2EsvvvZt8287IUHAwKUEYIWzSaq
	wUJObI5K7U34FWV4vpMiDn7eBm5cRN8a9JcUjCCSodCuGvLBuOm3Nk5mPimfuyqXXEdhfAAvAcr
	VxoLFA2KXZAdd4QbvSV6CdwXdm7YkwOg5HTNe4RwyCFlZWMHwpw8P/ZEcfAn82MQiUduSDaRr+T
	UG8qiXQ9kAI/vyNM6DtDcbJPJMDa+H4J0dl5E=
X-Received: by 2002:a05:620a:bcd:b0:8c9:ebf3:7623 with SMTP id af79cd13be357-8cd6d3847f8mr1564242585a.20.1773091828332;
        Mon, 09 Mar 2026 14:30:28 -0700 (PDT)
X-Received: by 2002:a05:620a:bcd:b0:8c9:ebf3:7623 with SMTP id af79cd13be357-8cd6d3847f8mr1564237585a.20.1773091827858;
        Mon, 09 Mar 2026 14:30:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfa1d1asm1277061fa.7.2026.03.09.14.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:30:26 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:30:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v2 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Message-ID: <dfobuwzo3fymnyemeiyoplni6ldcyb56anvzxmkjt3vnjdqyvy@ctriw4yozv3z>
References: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5MSBTYWx0ZWRfXwGJw/uUFF3+Y
 FsdSm/QxHRKh/yB0IJ9+CfmE/SmcR9FSt7guC6WW2Iv3yvoF6Rji4pYvoFepumVZlzFe5t4YSv4
 uA8f4nxb2sU1eWB3sgjlAlP0tPTRRngQTE+jyaTnXZu1Q9KvZVnExuzB5koh3M+iYEx3xtn+sfT
 6s9apaNywsmtkdC6chtOGUqj0qWwqaoeVl1XOje8kR3tZUqrOYH2es+0O08X0YGVHnXAp75Ps4c
 njs+UjJvXQ+x1Q+4yn2NpN3xzy8k/WKVYT1vNd1Hd/Hkht3jCGv5JCiJFUUJ66YVrd4Gz+dgtDd
 tHn4akOvleFConZ/ni2333g1ja4iUkyBCnKkEyG6pZYPJDG4soTaWi6gT4229aCdt7xh5Xoru+n
 uFknDPVdG1+1MyH44Z30rZO7xXSgu5Djgy0WVv9ZFZYak6RUOG25O+LKHp2wALMkf+jX4nGYMTW
 ngzU0MlCJF04i9KXcGg==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69af3bf5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=c0q2P6rqGMe-7s1Z_fwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 3PZN27ejjrYijFuyw_fEEeONHPsZWotc
X-Proofpoint-GUID: 3PZN27ejjrYijFuyw_fEEeONHPsZWotc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090191
X-Rspamd-Queue-Id: C673C241B4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96378-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,msgid.link:url];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 02:08:15PM +0200, Abel Vesa wrote:
> The suggestion of having the CX power domain tied up to the GCC
> controller started here:
> 
> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> 
> and then, for Glymur, it has been brought up here as well:
> 
> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
> 
> These plus a discussion off-list led to this patchset being done.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v2:
> - Dropped the required-opps property from both the schema and DT node.
> - Link to v1: https://patch.msgid.link/20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com
> 
> ---
> Abel Vesa (3):
>       dt-bindings: clock: qcom: glymur-gcc: Add missing CX power domain
>       clk: qcom: gcc-glymur: Enable runtime PM
>       arm64: dts: qcom: glymur: Tie up the CX power domain to GCC

One series in 24h, please. I've sent feedback to v1 before stumbling on
v2.

> 
>  Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
>  arch/arm64/boot/dts/qcom/glymur.dtsi                         | 1 +
>  drivers/clk/qcom/gcc-glymur.c                                | 1 +
>  3 files changed, 10 insertions(+)
> ---
> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> change-id: 20260309-glymur-fix-gcc-cx-scaling-a0b350cd5741
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

