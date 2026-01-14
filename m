Return-Path: <linux-arm-msm+bounces-88915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED677D1CCE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 08:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A355C300C0FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 07:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20BDB35E543;
	Wed, 14 Jan 2026 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvGWSc+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgsNOfN5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C843235E55D
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768375313; cv=none; b=kMVm6DjAnkr7aq4pv07KiXTNPR6AOAmrTcAr46hG/Xy1fX1yaMBUYKkQ1eMd/KcgB1OA3dw6PkXlgv/EYJLodIvtno8lhK7XLD34wF4b97n4flVxM/brn+E0TpZy0hTOs4N+Mqh2x93Z7SJlyAdXGP6cbY2WLwHyvfNFKgxsFYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768375313; c=relaxed/simple;
	bh=pin1cn/u9jir+M+excFeD+YAXNJE7hBZaT7EnKEdnQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m8SKiihva0DQFonmd6DV4HPxqUHyEYfzTrc99tJ0u/BszOp4R1jB/nVqwYOOyN30Nt0HUeA7GFFumz4TmNncAdmavxmjU1a7VvERE/yXUPSCHvPg8SAaVXei58GiZObFe/3PRjuskqmhr1A1u2az4LOBBtCSAMqQnYBgjnyg3O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvGWSc+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgsNOfN5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E66DvD4130787
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGua2V69u9ZPUxAilzeukZAAVkpOgN6IHQHMHMdlgeM=; b=lvGWSc+MdI+XfEAl
	O0tX2sTXTqZIrLDL8P5OkdFw+MwRsZyDEmsrVgvhr1nLT7F0LjOv8GUeD2+U4jKO
	Imjo1oMDeFUgeQo/JEQitkGDHQdBWjsZO+eK95RRxNmNaePE6FLlXayJbNI7+fE3
	53QM2wRTOsmCcpL+QqP5Zm3SENpt0fK/zkkStwMvuoa0R4VXqITHwdcgrkEjcsRG
	1WoCB+AcrCPGOG0uZ41d9jny9bGwSqUgcCB/42d3kEnO1Jf5exxs0puMvbeljbKC
	CWYwmHTORpuTbe0x1tgAqLbhpcnFoe3A2c8b56eZj13lB2eFIZcM7Aii0EijV5zB
	e1rNVQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbmb6s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:21:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0a4b748a0so58909265ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 23:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768375306; x=1768980106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mGua2V69u9ZPUxAilzeukZAAVkpOgN6IHQHMHMdlgeM=;
        b=RgsNOfN50vJU9S9JpC9RS/eRczWlNQENsjsGnkHca1C+LxgKHkXAxYvvxbKQ1adap1
         zeMZ/4CRCYwbfvrAFS1b4D8Fby4RjW/2IGTeV91uYmEYppT2eIuFZ3geuJ/wtAVtwmwE
         t5m2DWo7f9Tm3aCmV0+Rm4xaz/JwJzCYSJWiqj1/FGdOUDcWjocUT8faM0d12Ee67uSQ
         S5Cv6ndhoGzguOJXgn7cITe2SMP3O7Pi8pk2Jh74BeRp7X8xcYCeuZLrfQf67r4LP2d4
         J+7O6/Ink4DPzyDUNtUezWI7DqsH3pOrZg1HfPvF/6QS26phFI+Ayc+6Pu5Y74KTN2f2
         eKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768375306; x=1768980106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGua2V69u9ZPUxAilzeukZAAVkpOgN6IHQHMHMdlgeM=;
        b=Mpgo5vyMIU6kcvTx5TCsC9z/cPnGWMsRibAoVISeerEO6qLw55RbJOHG3DqnzBKmpq
         9sWUuNGsxYFnk/nx2hJMjlraG7ra4pXOF229QP01uSfEwnLOaZ4mQif25SdIq9ItFLBn
         5+M4sfANkrSjcsWoQ98hBSLEvDAUjolh5kaeBuPFQ3/qOszvieUa1PowpxyDPO4XffWE
         063gYo5bzRBXzADXmloe1wjziT5+m2B0uTtdfoHUZ/txPA4kkzhZ9VDPLsXW/11UIint
         1XvMVL8PJIyB6hoDg3mwdH4p+6idp7t9FULGRgBax1g12/DZYGf/w7IkeOXkhoJrGII9
         8CTA==
X-Forwarded-Encrypted: i=1; AJvYcCWjfduju0YgGCkdwiTgf23g+Z9Xq9jn6UnjmKFwIbSAKXeiGjS0EkQb6Hg3rWxHN4XRZBmJItQhjLlX2rXb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm62VWG5Om/0mz7Ub9XU+zVBRySNh5mbHquHIqPqY0gENpcatC
	oPUXPTRhCcRuXPLAeMs5KEtcXFeCKjfmC/zQkA5mR1t2W8FMQNv4joQzrxPOiAYVzZ0Pz6hsfvB
	6A72AohmRRshl69Gq4rRwR9HtPWID7nUZI2qYZixf0Pu5tYnaHMJeDTAbKnh4Ps3oi3VM
X-Gm-Gg: AY/fxX4oNUaHzLWVS41mtPzgEYB0ggU+JEcq3IwXK0SPQiuEhcv2ezF45BtHqHvZ6u0
	rMPKh77R4Uldbk044qkPTuPfXeO8gzQcLMeK2AVHJH3r6Sc4IDYRbCwdF27iuJIYdY3F8jhHimp
	21+OQ1DwWGYpejAwDfb3xtkxofxoUzBCBNXNup5BwuLouNSjx4nARnYZZF27gfwCqOO9NnqzQZe
	Jzh264rvd5iA2M3MoQNBmSu2Z1URorJVdaZzJvP0TWEgmDcfwy0p6ckWOa78qVnFnxVCWVucTw3
	Xodu4UiOfQ7ZnjKFX92YmQnvHYM/ugA8fiHAv8tY1RAh/Z6mugWSvV/OmwZV8v04VS0vejPu7LS
	ZEhigDpg+up9wSy2R1H3bdcDLi9QLVzpVTxbC8JePl4NP
X-Received: by 2002:a17:903:19e8:b0:29d:7b9b:515b with SMTP id d9443c01a7336-2a59bb74387mr12706525ad.20.1768375306040;
        Tue, 13 Jan 2026 23:21:46 -0800 (PST)
X-Received: by 2002:a17:903:19e8:b0:29d:7b9b:515b with SMTP id d9443c01a7336-2a59bb74387mr12706145ad.20.1768375305597;
        Tue, 13 Jan 2026 23:21:45 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48cc3sm220685455ad.39.2026.01.13.23.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:21:45 -0800 (PST)
Message-ID: <4eb4818f-115b-d0af-cfc8-109984190f5d@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:51:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/11] soc: qcom: ubwc: add helper to get min_acc
 length
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sh4veg2Ey5b7_JHHdO4K2ZUp161qhWDL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NiBTYWx0ZWRfX27Uwe6+Ej3iH
 0YW0XES01KeZBWqcAlo7DSMSSn12ksTKlC8sWcGyAqq170VeGdBLX/aw1piC1G5oJYuH8x3wxQt
 ekR5gfjSwEBYrnAfEjqXZKc7ubsdCi97Po1F+oSK6GqkXCHjHyFNBU86uyj1mw0aFUDvIYCuppn
 3HCL3jjhKBjhuBFW+Z8FPDO+cnBOtxYUA6HJ0Z+MDKih5Y5WUqeXscRvmZjW1VA1Urnr6OSyQqp
 tG0EY9as2CcIBBEvKR9fE+7g1Y6L9hSZx2Q5jHkw/1ltb6FPCNSJPRaNK3cEj+zP/+Ccx9I/TEh
 wbDlqpH5aulcHGC2IRU0IzzC1VgxGcWz/frrfWOQiGNgvMjuz7zgVyEXLk874JrDkqKd/TTjloH
 JGEusgEL7IVyxSnodZKyCMSZGHhiBloaUE5pgISlBgGWrCx3w+ObV9DWtKiilNHXiuav1CXh6tY
 /Flm27JRfhrjVzB/LZw==
X-Proofpoint-ORIG-GUID: sh4veg2Ey5b7_JHHdO4K2ZUp161qhWDL
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=6967440a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=o9KUHpD5kIPiLnKsU4kA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140056



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 
> The helper reflects our current best guess, it blindly copies the
> approach adopted by the MDSS drivers and it matches current values
> selected by the GPU driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index f052e241736c..5bdeca18d54d 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -74,4 +74,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>  	return ret;
>  }
>  
> +/*
> + * This is the best guess, based on the MDSS driver, which worked so far.
> + */
> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> +{
> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> +		 cfg->ubwc_dec_version == UBWC_3_0);
> +}
> +
>  #endif /* __QCOM_UBWC_H__ */
> 

Based on what I could check from video side, above looks correct.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

