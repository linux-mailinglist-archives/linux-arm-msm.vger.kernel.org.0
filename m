Return-Path: <linux-arm-msm+bounces-83072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C41D2C80A97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 14:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 886044E42CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 13:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6586F2E8E10;
	Mon, 24 Nov 2025 13:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LChTinB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcNeBnRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD93A26F467
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763989657; cv=none; b=ZzzcrnYpzOEc6mbCmnz2THv6Nv7U+xU7oIB81QwMfDHTffC2O4F5+blx6lH00lGq/F8c5Ck3OrHQEouH93pz2Ss9AQPA52AHqc5+agpr9S9po4CsthUGjiWjhQyGMmIc3E/KfDm9nCSHJJ7lAc49aPOqx3nUbizhPoqUMqFzyYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763989657; c=relaxed/simple;
	bh=0Glmjqomcfr+teooEmAf7u9Ao6AQVwqhuxQMy1kpDiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDeNUUpg5Fk95CDlVtV2xthbffo5KM6ZfYHjfpDR5Ae/nWX8JUihoENAyPoXx6c9s82sMJxQ3uGLXdfjwTCEv+IlMj2PxEQ6ulH3d1WgTJ7o2OOyquetafbQDAlzLSnw7ePkc/SQSiOZI/G3QgKznW9EJZUDeTibqj6hFI8rhYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LChTinB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcNeBnRO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8TugI1808600
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 13:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WsZi9qGDQC7YaNJ5xGSEkcWOjZ6iCniWpRgPXtNFW+Q=; b=LChTinB0jd8rFVo9
	2wsTtwNHOgT7xuMQmeD1LrNEUCctTlmA8d/on7rzdVf57jbZLn4rKTOzjpx1DAFL
	eASMt6ZZWTqPxVDI4tje2JePGepQH8u+FDA2s3mJxlxHszI242eg3Xdr9LGIflKJ
	Cfgc/EoYc4ChDnjjTARePhL1t6FuGFXsWnK2j1Fj9f/45d27H9NOldAzsq2HNzO8
	Qxu6NsHtuaFXQiVSaWVZUwputVRloIqO1l03mnUGe34mYGgitT9Z8Yu3R0iHC59A
	o/BIRkbMOtZPHQvrkE5aKCaEkXPNQj9fT2hxYacS3ycZiiESGUfkGk8ZPOcoc/Ir
	UQ2Apw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ama09a22x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 13:07:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-559590c663bso369832e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 05:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763989654; x=1764594454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WsZi9qGDQC7YaNJ5xGSEkcWOjZ6iCniWpRgPXtNFW+Q=;
        b=HcNeBnROSEyEo74aB1wtF8G+rQVhPkJT6rXAu8Yhz8pR4fsMFpQelL1oUGXYkFyZ5Z
         XDOi1PzsiLS2cPkHIfOpe5esy2ci/GGtzE47feW5UL3iz8GvmhtRhj/UpNKLQQNxDAIK
         cJZPcuTPz7uEZVwty1NcU+4dxQkREBbyAffPI2Qb8QsXQ0Gptxo/e4ADVaetSwZAJWsi
         1JUVKeS0CDDNlxBVdG5o+p3aD8kYn1eIwcmlhIu+dFAY3BcpPwi5GDCtrvWO0UojriXG
         PBW0WU6LhCONo/nqmv/7NNURZrNm+1PrWTNBpi09IwAWNmcK4Vd5pEx+JjSg//so2TPx
         SVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763989654; x=1764594454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsZi9qGDQC7YaNJ5xGSEkcWOjZ6iCniWpRgPXtNFW+Q=;
        b=SGeCtyrxw+jeSVH57nF3Hontpi+HjU2PAgHwaJUEy4CU2niOVGZbiLZUnu5RN+TsZX
         Zu9biaMKaVGrclztyyt/e20Kch2TpIJ3oZ7M5oM87SOTPRr8fwFHOBhlQlzg8UT7JCCc
         PXhcEXfHu/MJVmII52g56KKNGbyKD0fJUTQgrm1RIc1SDmmsi9bsCiRgDMXYEaz+tXv2
         bOIjBSInkKBKKXD0dx2lwt5aTNRCZPGRSoG22XRzrprijLf2Y+uPxheLp8u9BiyZZ/v6
         En3n1ywvVRkN18cYuUK/SWq6oye+3sNtQSQF9dByRSg47KqE8eYkbWScL16YnmJ+tJmC
         xFxA==
X-Forwarded-Encrypted: i=1; AJvYcCV4+QUsnBxV0fekNsFxoLfWcBO1aowwh/HBynZuA6TgKSSCdWwI1Hk/M638I6z8s075WpKZBGsmdAB6TNqE@vger.kernel.org
X-Gm-Message-State: AOJu0YxRK4agj4+2HzA7w9M9pOUGBWl04FiGkj+wp2WOFfZ8oYb3mEKv
	C8QKbNwhVm/T69ZzATg2ZoCAJaW3vGnW/A91cSqIBGptsbZbwfzjYMINfusrDz4hYbQq4GEBkRt
	G+tyDU+J/PEMboumlZulLatSuFEsQrUMgButAMyTzt1OMSbzclBokIsx3p/9UKcxqxdr0IBsEAy
	cv
X-Gm-Gg: ASbGncs9hzlWIJwWwDWIwMtEIT0nQLRe3rp0a+Co+zAbXAbl3oRb/5uBPkWxUsR0Ngv
	/OcQ/sZUe2hlnyU8k1DDaZjbNFuTaMXvYd5aV6AFUMcWLSDJxXGRipiccE0XWAePSfQGelDQP/P
	R3UHmnKkmmDJwGX13yKBzeHjss+61U3Zh4iepq3UC0+1uXpWNg12H/ERlr7byzOlqR2QwL51MCw
	uWZk/yR0FPSke7QM/PaxjA3Xyj1GjdqwpZAbuwmKG3fXBNsWXJDP9C7LJbSeOqWsSFvBDQmbT6R
	7/ZGr72mxcrxprRrXqqPy3EZGFZ1uhrVgp+WMHWPIqXhOTAXXRpavlhVbmM5Qk9Dhhg+pbRiQBU
	owRkwQiFev5gnbrjFuemuMk1D2NdPYRaMHYz0GnI+c4rxnBi681McxhLvtwpo+pUSM88=
X-Received: by 2002:a05:6102:5487:b0:5dd:c3ec:b7c with SMTP id ada2fe7eead31-5e1ddcc3b29mr1736170137.0.1763989653789;
        Mon, 24 Nov 2025 05:07:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHHzwPnAtxx8b34+t8asUge+jdf6cN5myr0cVk8y833MZohwdZmdf8rJTGC1s8GlYGNHNH1Q==
X-Received: by 2002:a05:6102:5487:b0:5dd:c3ec:b7c with SMTP id ada2fe7eead31-5e1ddcc3b29mr1736132137.0.1763989653330;
        Mon, 24 Nov 2025 05:07:33 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d7cafdsm1264069966b.30.2025.11.24.05.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:07:32 -0800 (PST)
Message-ID: <3d19b567-c6fc-4fa6-a224-d8b7e3995607@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 14:07:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: smem: fix qcom_smem_is_available and check
 if __smem is valid
To: Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>
References: <20251122185002.26524-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251122185002.26524-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AGgKi2f4rtD6IuD9LR3jU_xzP1lROCNA
X-Authority-Analysis: v=2.4 cv=PdHyRyhd c=1 sm=1 tr=0 ts=69245896 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=T0WpHGM8YF_DXorlBugA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDExNSBTYWx0ZWRfX/6Eme95svO9s
 wcJST0/dTI2GIwGb4LhqrX5aBbziiufcszntGP8N2C36pbp9NpIfDOfCuRwfdnGQmRy7AMseaDr
 fhh0O8mbTbQvSdZSLfCDG0NawnAh6Wuw11ITewjXEgyuM5EebZcaM2oRbNKHYnEMyD+9USS6ASV
 9V2xyarBcxfBLSwW3jV+xRqrCCXHQUy3YEbB1/4/VE1cvRH/jA5R4KjmubQsqgdLqz0HOXs4b9I
 IZGiZkZRPnKvUG4AlL+IX6Rx9GYEZ2pq1Png062Uq65r93wbrO51P9lCNzd3bDBTqPE8PznDjBH
 Grd3c316RCYgwpnDYES3e6z3MNMUNUX05ONBp9dDFrc5gib2INt/LfcZJ/hzMlKJeRQDQ9cmSDF
 wvTARCnjYEB0K9n/UvQf3YW5g0HgJg==
X-Proofpoint-GUID: AGgKi2f4rtD6IuD9LR3jU_xzP1lROCNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240115

On 11/22/25 7:49 PM, Christian Marangi wrote:
> Commit 7a94d5f31b54 ("soc: qcom: smem: better track SMEM uninitialized
> state") changed the usage of __smem and init now as an error pointer
> instead of NULL.
> 
> qcom_smem_is_available() wasn't updated to reflect this change and also
> .qcom_smem_remove doesn't reset it on module exit.
> 
> Update both entry to reflect new handling of __smem.
> 
> Fixes: 7a94d5f31b54 ("soc: qcom: smem: better track SMEM uninitialized state")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aSAnR3ECa04CoPqp@stanley.mountain/
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

