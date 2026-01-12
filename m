Return-Path: <linux-arm-msm+bounces-88510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF25CD11DBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A9D0304EFB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1860F2BF015;
	Mon, 12 Jan 2026 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ydw2eDU8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H3gTT6aN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EADA29ACC5
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213567; cv=none; b=RdzJ85DmbpQq+VdBlNU+uGDyuLRM7souQhrZlv8YAvxhsXXpVHbnj6NU/koGEMfgUz+yBBo/7pxBC1oPAH5UyPC9BVm7Si4N+PXDPiI8OHXtYcCdRLC0CWg0h+gm3jdbehDcR2GuzDqsTn41MRXnwaaKnIO26ifcvMNpjvED/BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213567; c=relaxed/simple;
	bh=6tTlIpuNhGLgbooa+bknYLuVMNCeGlqEPFLds62QI6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpVZNbOb6gYV1RWlK7LpDm2G0lRZ9QogL80c2Ud+SS2HcazXyGn/Chcng1xPMpEVdyRC0V9nLDIKri9SxkS1wcqUIWgpYjVnyNAslvlFMda+jFAS+0PxvjQxDSZawfVNCMXCCY8JOKSCtLRhxobjP4w7OH8MGt4cAL5Zbh8/EJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ydw2eDU8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H3gTT6aN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7Oc3X555257
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1DQ8iZXNy5ygcC8Y/BoXumPmTx4/RrJaeZCUjV1Dj3Y=; b=Ydw2eDU8vFxVII7O
	bWdLmKi5ESqUsoOMjWpXSpy2Tn3G1rbTat7zZUJY5CJ9Nu7hPMATkrTBm6KkOQE7
	Xhut+IFloHCSyAjXrflW7AG/cRWHIFBqZLU/W95q05dhg5bagZNtbgkv9PPBdXor
	Qvr5DXKu/10TRKFueHoMZ0p6Tz5UCD0UzzqzZv9oZYaF2Q/rzDqYZN5LMdTATvIG
	lq2axlcHZls7wM6Dq+CPWvG3adoDe6OmyQO/hrSRY3+ndGMfVzu8mG/U7r/v2P9U
	GZOmde49Uy3nPMdIE7CNwSBEaJMuEcaIlU4XHS8Jh7+8nCfgi3eVkoCqLjH9CFCg
	s6vYIA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw0m8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:26:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c43f8ef9bso4779725a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768213564; x=1768818364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1DQ8iZXNy5ygcC8Y/BoXumPmTx4/RrJaeZCUjV1Dj3Y=;
        b=H3gTT6aN02UpvIPQq44laXyTzCGki9c8/XZmtPMHMgCQEb4bww7n+IkcrIFP4kuyHK
         ZReRbGhlt5YxeOMYlq4EK18gIyc18lawFROA2c7kjkipasDOqnWGejGx+lOnrfIvoP3s
         JQWuSsXhePzgRSm0BYsvdCTHAAmtOjuTqOHOw7Iz/VnEgWwzPS7asROTRR5PSHwBeKL9
         C+80vJEL4r8uo3q7Sv02Zs80E62vx7d3qe0uxrAdPpgo2hI6GtNiZW9ABP+MWlGAhGfc
         uXLMbqDhoAgvPfQuDS/d/Hz3kngRXpEK/6XpRZvWBAcZBPm8Vhzevr4nwGHuB5UUAQt2
         2WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213564; x=1768818364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DQ8iZXNy5ygcC8Y/BoXumPmTx4/RrJaeZCUjV1Dj3Y=;
        b=XLvY9pePZ4jMYO3H5wvvYX/Bu6g8HbWnt7vGye2/apf4JnQu768R94qrbp1ukNCxtI
         kLVK3ozuffeb8LeW4vAZl95sYJHTnj3O1kPEoAwfR4Y6zkQH/TdenUAh5/vi02NJyx5m
         pu5R5CclyDIz5LStuF798wHlaw5itUNwhtrKTmmGJqfHl3SZ/ZGBSUvE8KGBFuxrviIN
         gIdlVWeE8xl5zqZghMkN4BFmMalQo5VBlXSrO5f8WHr3mSPy9Da4zihLdGtnj+2xqJK0
         QT4dP1qRfRyS+WBIzjqu2x3/lZKzLrToEqLbJdoisEmQpMzAFAOBkPkh+3JcaGR8Gjt5
         S68Q==
X-Gm-Message-State: AOJu0YyqXK7w+ktMHlGC4sbogi8J7rwHWTKbCdBjlEYTBXS7HSQru2YV
	wwdbXcywmmFI7JacFaTW0ZEDchPPH3EDw8LaoHZcw2+p5hH5XjJ7i7jFJ1KJ86ZN73aKsZ76QpC
	gZnVQ7HyIHs2V/tTBi7hvlZ+oGwRjliceapqcKxfCFbaZA2X3IOYjMiKpF8PwHlZUTFW+/75crj
	tx
X-Gm-Gg: AY/fxX5F7FgdwDRESvap/ra5P5U1MerYQT3D9HHOwZwvMGZvXCKuXiR9XVI44X4oCtA
	LiZYECVS19UWv+/JaBqdn0p9my5JVBR6gZyUDin8fZO/uYiIrhKvjU/slUUW+4itToizmo6urWJ
	tF3QhwFpcdpW8Ukj4DSqhI+FkHeTnYE/pA2JCXrtOe/aL/Zgr4AxZ55wPDF7G6ec9BiBKBZqv4I
	0/8j3/WjsqbW9fIRquqipxwn2ggAtpnEoaLqTN8Ptz3wLQC8loMWSTTttme4YDiAFnhCIfTgSst
	RXgYbQu8VCyh1xHZ5OhJc8SvVuNOBaaHxlqRuO1oDEjSXr5NcrqpKtyHX/Gr2L1V5n7nSxbCVPx
	hyOm+G1xTWKJNa8EasEhGxU3UVyinV8UWOKjoVg==
X-Received: by 2002:a17:902:f684:b0:2a0:de67:9704 with SMTP id d9443c01a7336-2a3edb739dbmr159953125ad.19.1768213564216;
        Mon, 12 Jan 2026 02:26:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+ANrmd2jJbJqGD/KN4Ur1v32NLxLtT8THnNV3HiNqENG8f9th3rPAV/+1T/5XthSjPUXwPA==
X-Received: by 2002:a17:902:f684:b0:2a0:de67:9704 with SMTP id d9443c01a7336-2a3edb739dbmr159952875ad.19.1768213563708;
        Mon, 12 Jan 2026 02:26:03 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc7912sm173476745ad.67.2026.01.12.02.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 02:26:03 -0800 (PST)
Message-ID: <eba70496-d020-4919-873f-db0801d6ed6a@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:55:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: dispcc-glymur: use RCG2 ops for DPTX1 AUX
 clock source
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
 <20260112-dp-aux-clks-v1-1-456b0c11b069@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260112-dp-aux-clks-v1-1-456b0c11b069@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MiBTYWx0ZWRfX3L5t/M7/Ra4L
 p1N6pR2mOIuCmxQR8PWj/dR9QMiDmuZDTUTEys4/VUh2lZeYMSSD9zHJunHZXw9fnVB+2cxrjFA
 TcRo1iOGdIyfgzRBVEVt7FTKUFCXscCEJVPBRHgUVEDFWlWc1ISeY4sIA36JgzAahhwZeN9c1d3
 nf34qEz//dU8Husi/QbmHpcHDAtMQiSKVv9ZoaRPIiv6JNDaS90KffbwiP8ddB1zzMBayXpM9Li
 q5/2idSJCDukUCPKKdl7HPQakaT4Nc0U3vaTE5eL3oCUU4xsnENHegUaqOoM181crDyoimkeW3g
 HM6SASBmyqSNh3azdmennpXzJv2OAM79pMMnhh0E1nHOh8DjrpysoKaWw/4YdQe/PUTqcR3Cp8V
 PrsNTzDK00DlI1JNLLOoiKpaibvHDsD7kl0SR0IELsTptF3Kiel74ricuggZP3r4iFszfgZxKT3
 ZExzXqsioJJTN2QdLcQ==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964cc3c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FCWHNvtYXcGM2Pe_cTUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: XfPSJqJRIpFHO7WrXpKCizV2dVBWegv2
X-Proofpoint-ORIG-GUID: XfPSJqJRIpFHO7WrXpKCizV2dVBWegv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120082



On 1/12/2026 7:42 AM, Dmitry Baryshkov wrote:
> The clk_dp_ops are supposed to be used for DP-related clocks with a
> proper MND divier. Use shared RCG2 ops for dptx1_aux_clk_src, the same
> as all other DPTX AUX clocks in this driver.
> 
> Fixes: b4d15211c408 ("clk: qcom: dispcc-glymur: Add support for Display Clock Controller")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-glymur.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
> index 5203fa6383f6..f352165bf56f 100644
> --- a/drivers/clk/qcom/dispcc-glymur.c
> +++ b/drivers/clk/qcom/dispcc-glymur.c
> @@ -417,7 +417,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
>  		.parent_data = disp_cc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_dp_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
> 

 Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


