Return-Path: <linux-arm-msm+bounces-84624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0770CCAC173
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 06:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6D3E3021078
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 05:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63ECA30F813;
	Mon,  8 Dec 2025 05:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lw/hAXS9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NN+7OlgZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24C7303C94
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 05:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765172704; cv=none; b=XyVA80S7FB29Htjn8V79epWvnr2RVa7GdiQxBStyy/ap6L2eYcsrZz5zu7mU6kbK1c0TyrwbNNa5ZrZnuudIBv4oCLGWQWt0PBuegXrbpsWmnLniPqPnmZD/wzouWwa588dICncDnh1t68HhdRur/htZikEnV19w+QM1ECHs7EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765172704; c=relaxed/simple;
	bh=VwounY8YsKZ9UmWsbr79xKGFX7jDpe4qRjJ0mWKu49U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BiKrAXHs6DJDJ18ON7DIxrTzSTXcqt3QP1vJaL2d8MGKU1A6jPcxY3JOOqffQZgK1miwQYj+asHvUDZ9NoyF5ZcqGEi9Mlio/hWLRCPVKdjt2wZb0V4fXccEI9zXTIDDOXLGcmloJgNNgYsfSTgppNh0yg6wEqXj+u78VQgE3uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lw/hAXS9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NN+7OlgZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7MuR2x2927549
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 05:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t02hOe59WxYlLpNJJemPU3DA+pK+Gh/u1fDHWQwZJiQ=; b=Lw/hAXS9n0KkDxb6
	6YPp5FXVk7v1tMGl4RGUH3psWvO1xumPSmaRaeoCpwATcaffavgsKdKSVuMD855S
	ITYp64hZI+zVtFCgfzLYZjvhs7aPCpaSwoH1DD5FfLBdyxOvBoldovR6nHFH8d4D
	uZ5xsLQ6LsxlcZrYcp/BNFd5lp1M4NBi3LCIX2HbFDIPBBX2JCB0R3sHKWn7eyqc
	IOyJ48AgUySPyhLDvI8buqIjORu17oWT/EAT3EpiP/tKJ3YxsOYBJTdp732VNaRL
	QvalGqeEuREaF2VgN863DhkoF8k4wzgvW4fsMsrm8oSSbFh0dmJp9og2FD6uzkQJ
	+bH7og==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awhaqrr99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 05:45:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ae3e3e0d06so3514252b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 21:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765172701; x=1765777501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t02hOe59WxYlLpNJJemPU3DA+pK+Gh/u1fDHWQwZJiQ=;
        b=NN+7OlgZDG63yVeBSKEDRWAKoCVHVrOwqv3N3B9uiIyhTYu2fh6zz/hQMoHPrjpEyG
         U2Uhx6oCoV346kSVZiRi42JCqfm68dHpSh4IFGvZLV/31EK+Wy8wMI3sdJP79nOB4Dt5
         VEpbRKjAvxdNic06hT4otv3u/XOcMVzmZSc4mRCScDC6BxPwGEjUsVEwOhCzZG7dCp8X
         uM44LE5LGzZfyOrINfQfEivryGIH9QKVgORhOyWNuC2hyZhTvuOZtEoKD7G4+VLj5fgr
         ojN/WbjDa8BK1EbjUXuziycFxLahHj2hCfT6tv0QJuqF6G2WVi4j4abeaLRXdx8w6GSQ
         k2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765172701; x=1765777501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t02hOe59WxYlLpNJJemPU3DA+pK+Gh/u1fDHWQwZJiQ=;
        b=XzhuA82cnTW+daMhDPWfW11us47q/3kBuFPpr1mhNmZg3IlVE0Z3m/auK714Dih2Z6
         BUJUrYvr+lJqOaRYX64tx/whg4DwOUPGdpw3C/Z6KVvblwjnYNHb3oH07RfArYzF2o7g
         h9fcJEfLeUR4R0J8tlkkbg/joGH+hxt4INaEUEKHZJp3E7j3X56P4hjiJKqtnsZOIVDf
         D38V3d7r4aM44alMHznTQWywHPHNde7iy1fUKwSj7T4xorS64kkP/eUavqHfQ52P88YR
         kNMSR2MpkezpW47+RncL7WXFw/R5G45pnNm53ZLuPiWdCUO5rPFy/7QOBTPapIw9EFnh
         Oh4A==
X-Forwarded-Encrypted: i=1; AJvYcCWiSb8GNLh0NmbNqSr0vkoLOcBHHh4wqZJyKYE9YBQ6cagYwIZGkOgFNuJb3qDKEWSjp/Hl1slxS6pFK8q0@vger.kernel.org
X-Gm-Message-State: AOJu0YzXc1NfFs3o5px7ocnQuP9W5Z5fVWdy21wfmDkzfQybBS338PgV
	kjQC9D1SJoMgk3Uxytom+RYTy4ABCHplwwozQNPrfei+Y8bftEuc9AAtC2LwMR3+NTIcVyl0m5/
	S4V16J9czFcJlJhczFlufm52ACew56F16DlPpscJEkMzEmcCwHDOXwimQUOv/Fm+Mr4CT5QxTjA
	xz
X-Gm-Gg: ASbGncuW70DWifjNkIhvvYL20kcWZe0cIcPOBt2lkOC3uKglFnZJ0hkEX+bZfMp30rq
	4/zU1WeFmj4DgRmhDGqNL4d6q4dxZKQMXMga5VkRyKiO+OOgnGp3vU3sWrJPd+xONNYBv3HVyVU
	ZfKfdkhtKR6JDzrX/i7fPuDuKpJ+k8EotWQZr7fIukS46bDgAVAkainYvSLFiiURskQK2dMo2S8
	reEOzgXn8cqggZOaRmLNbsrg+7lCdLXCWHDb9Q1det1QiQ5Xlwjxjm/3pY46TF6NGHocgrg9V1f
	LQETaImVkxWeZTVCJh2rjGWCJqUEbfnTgrMKPr3PuZBGdYGzOT5thwveS1z88VPx0nGobyu1SEq
	/IVRiWKf4mYg/iBEyURi0buDCrVk4OmnCMzl2Mw==
X-Received: by 2002:a05:6a00:854:b0:7e8:4471:8d5 with SMTP id d2e1a72fcca58-7e8c7865a9cmr6497430b3a.54.1765172700984;
        Sun, 07 Dec 2025 21:45:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQMvE+HJv4CQIWxEIyxg58PxUJneAez+8mz+9Np1ayVcoYrgxIrsT1ViOKAyEoEWEkaWp7KQ==
X-Received: by 2002:a05:6a00:854:b0:7e8:4471:8d5 with SMTP id d2e1a72fcca58-7e8c7865a9cmr6497417b3a.54.1765172700475;
        Sun, 07 Dec 2025 21:45:00 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a02516fasm11669533b3a.22.2025.12.07.21.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 21:45:00 -0800 (PST)
Message-ID: <1b133002-f36f-4f94-86f9-d6cd12d96946@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 11:14:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-sm8750: Constify qcom_cc_desc
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251208020621.4514-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251208020621.4514-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA0NiBTYWx0ZWRfX0EcMY0IhTT30
 nuRxtthl4ejHccC3fj8C2n2KN80i+ushj/FPQ3Pk+6rpljp52vjpI6ok4dcIXdqvfRJ8RE42+IU
 usm5dpM5W/FWIYi9096lmyEfxeXfKQBtSvW4kM/Wx54hyRwGzR3u/JyvnVi0afukPdwz8vDLjbb
 n8yM9pLx/jMfUlAvSiJPsYPMzuQSFhgcpNuASQLD8Vp00ntyD6fTD8eOyOeT688WqcImIz4qJ+k
 3rFBeAxCexK66xXc9unlW/tfHOBc2l0vp3p2kDrthC/fvIQGm5YRRNzFdsKhTBvom5F8dKP4u4H
 zdZI/Bh+JPeUC8IzhyyODMzMF5uf0i/VS4aHJRiwVLCM38jS3OnwNPdSNhYomerpNOqlu3qsP2Q
 7U4YCrk5HTXc/3JpUy4/FE9nP0d3NQ==
X-Proofpoint-GUID: HYaPl6DHjP4nCJw4iZilHX3FGBNjQ_LE
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=693665dd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Li9xuZhQ_D-hz7Qe2voA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: HYaPl6DHjP4nCJw4iZilHX3FGBNjQ_LE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080046



On 12/8/2025 7:36 AM, Krzysztof Kozlowski wrote:
> Static 'struct qcom_cc_desc' is not modified by drivers and can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> My standard commit, one more time. I wonder when I will run out of the
> same commits doing the same...
> ---
>  drivers/clk/qcom/videocc-sm8750.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
> index 0acf3104d702..823aca2bdd34 100644
> --- a/drivers/clk/qcom/videocc-sm8750.c
> +++ b/drivers/clk/qcom/videocc-sm8750.c
> @@ -416,7 +416,7 @@ static struct qcom_cc_driver_data video_cc_sm8750_driver_data = {
>  	.clk_regs_configure = clk_sm8750_regs_configure,
>  };
>  
> -static struct qcom_cc_desc video_cc_sm8750_desc = {
> +static const struct qcom_cc_desc video_cc_sm8750_desc = {
>  	.config = &video_cc_sm8750_regmap_config,
>  	.clks = video_cc_sm8750_clocks,
>  	.num_clks = ARRAY_SIZE(video_cc_sm8750_clocks),

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


