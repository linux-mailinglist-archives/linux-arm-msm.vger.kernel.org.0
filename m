Return-Path: <linux-arm-msm+bounces-82294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9AFC69600
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 717604EFAA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4633C35503F;
	Tue, 18 Nov 2025 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pb6ntRGz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVoNXVdN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB9D34EEFC
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468784; cv=none; b=V3UCvNCJDXuCNaS+npEE34wrmhz/dPmG4FQ4jXXG84grf+JphTRp7B2aWABA6ny3Zw7sETNECAFjC11V491Y5vPwzjIRk6NMx5kXlJedDjpSProJU+JqWq3c+5qayYtMWx5iU4gxWmV+D6o22PRh4kPphmKuYgsWdLW0H9VUmSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468784; c=relaxed/simple;
	bh=HrGWm7oeoNEd046m+Q1qSWUolEVDXHODQ9Iap81nseU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAbmb7AS8B9c9ovC43LykiaIUD45qJBjAH4eowI7X7ga4M4eiZAD686sqlgrNloz77IRQ537J4n/Zz+KzYlL94v5X9b6LeS2yd9G99FtUv9L/6xLKMr2btOfHCvtR6xVG8zgr3U/pGIAtQgGwGt0eJpxQia1spmq91NeDCskku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pb6ntRGz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVoNXVdN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6nxwS623976
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1RzHfJxK941Lte2QLyQF83Qyl/mWY9DXFB/1pNq8fgM=; b=pb6ntRGzpTwbf1Zf
	2gSk9IUpzqIlQf9kPXniWWDZ33IQdMT8F9QkE57FVQJLbR+SUGOiUxacY2vAYVvc
	tAaYVJxvR8iVPWuQqCvc1OMcl3p1x88HVjo2yWMLsljUpR/yuidduarYuRMsBxhh
	GTwWgmJ1PVjcwMnWAyATrgRogvDu4NYnsG6jPvBFtBNeEgqrRMWVukXoUhakiUI3
	DdJwooBBbQjDFNbnOqOAJofByboA65Khea9QUQwkt0oAc/4pOdrYjSTY2sTVDXqR
	1sYv/JEJuc2Hx+XHxy2aUGYF9nrfI05doeurYh1lNby+FXzF6OBU3O/zAsMBbV7x
	yCAQEg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahfadg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:26:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso7713691cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763468781; x=1764073581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1RzHfJxK941Lte2QLyQF83Qyl/mWY9DXFB/1pNq8fgM=;
        b=WVoNXVdN6ZthVdEMpvSDTezIXTu0lt0YAfgOhwbprirTycvasx/CpOKSAsEOUDGyA+
         mJPOBD0H+MK5rMTBs234NLwRtpZ7yE6ma8IkkYqG7EpCcT4t7ngtOcnPM8PsQNpgFZGk
         uHM3ZRdQzKNrmTICPT0iF0Pzrjp/fAQHd8ifqMTkycA7/zRzSNJFqWwjltUvZCiXpXlO
         wLr/0UYwVUkpmu9tiPB2Cl7PCSe56KeAUjhY0aQjfTw+x9OyTCy/WwF2pBgv0umlptjv
         cOw0DvYrrrkL04ZZLzpimXEk94pyBNxql+9lMv6KAwm/X3NGJ3WER4kJh3Ho88YsSDJ6
         a3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763468781; x=1764073581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RzHfJxK941Lte2QLyQF83Qyl/mWY9DXFB/1pNq8fgM=;
        b=XumFMxTxGm1dOlnpwFdvMB2eXx6ot4z5jcMeG1C5e9DMNRlp75/22VYspNoAU/tTHL
         5TJ96qRfSsPJMyc2d2+sahy8eLwMcV2NtgO0A3uaRHbjd87pSqg64fyPGcJAOJn7ILJ5
         c5TmN15Rgd0Ti7NsQivK+QD0NnmdRubDb8c1SLJDviZEc+GGVnSimrmygS5JagBuHLrj
         ykusmxLAaQdsI452PSdQf+w3yw13LiGkIeD9h+zyPdO7tYwxYrA25vRglY+6qj/FuOR9
         7l5F5ssMm5zjTHdsRSSW+OH3V3JzJy6pWP+ZjGftS9b00dtRRKS3bajhuiiRwfCu2sQP
         safA==
X-Gm-Message-State: AOJu0YxgmMpZ98oJoG658fKDhy/oeVd7Uqg911zG57wn6i03y0ypkGDQ
	6/SAemYZaxqLgHdLvELkxhmdTSRnbNibTfmfDGC+8BJT2N6iznZqrW1V1bx3NDpo5DTk1lIuuZ6
	4eXtmbVZf1NfaTQR5/tBV2W3n8/hyvE/RwrMQfSaKftzKBgITkcMQKL5XEWI2kyc47Iy3
X-Gm-Gg: ASbGnctWIicMVgi28N2HKHLELBZYRnCTKX4s2laKExZubJ9VByL6E8tANJ3Yj9lYMTo
	QYIo9mEleIZxGe36TPvvwUfQxLX5laxdchjXDVe/Eqn0PiojUWbkFIEQxaq5er/qh1uZ8Gm/BX5
	58ElONhH0L5KlWzhe0NhFPj1i9oN0UiYtQXZ+mMga16VccUDIPw0E+90Y/BrN0KlrSFrGFXHRi1
	oMrzPCgk54o8ZXoVrE714QWa/7wfvZDycLStGY250hekFD7VFBvC3TiTnXddGz//KMKn56ieMLv
	EAa/IBCqu6wcWCp+9Gb3DliX55g3SomFFLV6EpgvoNI+QWMR71owzat1WjfAGtg2LDjuRRzAPMw
	Ejyr4kQ7llvBN6+MLN2Jgw2q2C6DQ4O3mG4UT7LWrIUbrIu5dR3NdwP/79foXMUq6TB8=
X-Received: by 2002:a05:622a:311:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ee329aeed8mr18312501cf.4.1763468780817;
        Tue, 18 Nov 2025 04:26:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPAlnJ39MpBP0f/ehEDPeRAXxIz5YDdo+oVlVFc3XOfIpWDtF2PNC43h144DUacSA6EJL52w==
X-Received: by 2002:a05:622a:311:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ee329aeed8mr18312211cf.4.1763468780306;
        Tue, 18 Nov 2025 04:26:20 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb12c87sm1327055666b.31.2025.11.18.04.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:26:19 -0800 (PST)
Message-ID: <5c1948b7-aa3b-4c60-acf7-64a138450d57@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:26:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: dts: qcom: sdm845: add framebuffer reserved
 memory
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20251117-commonize-framebuffer-v1-1-e4c099b383c9@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-commonize-framebuffer-v1-1-e4c099b383c9@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA5OSBTYWx0ZWRfX/zexkVrstFFg
 hccRp/9weOEtFXQWdXY0+KKjO9Tu9opucU7BOKeMpAEHP6EFDf14AmBZuwxfKhARSZxHoJ8NT+c
 Ku1k8QJQnDEPytcCYcsR9N0hBkJI8KNaQnB7qqSQz3tEtfxmt6U20MkM+mtQUDQeql8AXlE+Nm0
 JSbXXmfnuHs+4p8qosmbqPb2nq3EVk2vpUcBaVO1JRytYAnc1uoaTzJGM9FvarWdcprQOHt1YP+
 UPNr6w3nP1qJxEoEm9TIA7bOYtQS1+w+9/qEeizlt6drd4844TdgmQlMK7BxYbLT/j9/foTBNLv
 Y1IkiSLh7pY327xYnfjyRMKmY7H46lp0suW/XFOCK2s01GPCeEPuclCVYUUDJJviuAohrYKrUgM
 vsEKPQjaUlCYe69ylgGWvfEQp84etQ==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c65ed cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=bYlG0dqZ5eHFlp2z8s0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SOVTQ8oPgRp5S1T5T4aXdMRGk7NAH9ZG
X-Proofpoint-GUID: SOVTQ8oPgRp5S1T5T4aXdMRGk7NAH9ZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180099

On 11/17/25 1:27 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Stick it with the other default reserved regions, all sdm845 devices
> use this address except for cheza.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> What do you think about this proposed change?
> 
> I assume QCOM recommends or by default use the default memory region,
> but as can be seen on cheza or sdm850, it seems that vendor can customize
> the region, thus it's not guranteed to have it always on the same address.
> 
> There are two approaches I see:
> 1. keep as is defined in each device-tree frambuffer node
> 2. commonize frambuffer node to sdm845.dtsi and in case of exception
>    remove the node and definite it in device-tree.

Generally this carveout is useful only if you use the bootloader-
initiated framebuffer. Post that, drm/msm allocates its own

Konrad

