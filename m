Return-Path: <linux-arm-msm+bounces-83429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF35C890FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3305C4E3F79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AB526A0DB;
	Wed, 26 Nov 2025 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VB3gmshh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TK8SfqR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0BF21ABA2
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150344; cv=none; b=jAhamAfGgbYe5HsjbuHP1jKjnsj/6q2bUzmgHSwykHF1bHcH58sHGUOabrNXBmW7rK+C8L2d+fk0kvKxvqqHvK7e9Yq26ArECGex17WtdYh/VmFFktr1vGk5pYvKqzbz7Gf3IxRoONXHl71mQ8Ayd3lBi9VoHwnQdRNfoI0WTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150344; c=relaxed/simple;
	bh=C1JAw+/Rad0we0JjSb1dzS4cbxcuHHQbPPxiXlvm6cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePyGAm1wi2aqroDwF4qFcmVWRa3fZiEcWhZ2P089xJeTagqXD77IAqKAv0bwmIR8gL5SXbaSmQGmnLX1in+ZnZYQCDauB3uKM2WtsX/bPbwFUEhQaTZ1kxg1rggqd9Z+rEF/JPXI0MQvgdqxm7lO0acGyaZpY28lT38islspYPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VB3gmshh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TK8SfqR3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ7Of2X2651045
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UIFMEq/463uAJMRiWFPyBpdwU+ckHZ64BM+Pb4fxVhU=; b=VB3gmshhsq5HhJTK
	PI4CRByjf8y52DmMhNtSyePraqh3iKN9ptB/Vq+5FP2SHoOrIaD6gis3lol/9Y3p
	dhue+ta3AzoaxbbjZ8phg09/bPEnltXzuCr6x/B93ujbSe2Z777a00fAwGrEHBP3
	SIFOVmmS6xL9vteerihQ6W/BRxffahFnaIL83NOjjJ94kyHN7xDhOleJI8hYp+oX
	jFeHuiY7GyK1/xmN70WLhpoza+iGkkAKrgFkSmV4Xk6RRWDLvGfrqzzI/kMxGbz2
	Z0FmKkpiYKFTojrEsvEpIQeCtmcg0C1ozhgMCHsOljiJiDUGyIMggtb/fB5nP1Ad
	0smQQg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabum80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:45:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso13884338b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150341; x=1764755141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UIFMEq/463uAJMRiWFPyBpdwU+ckHZ64BM+Pb4fxVhU=;
        b=TK8SfqR3iF//WJZODighzzb3OdvUzwh7zezqQblt6u4sSKfyDtmSBGn3oQMV+yMmrc
         ANB76XXLXppU6jPS2qvKzAEWEPxyl3q5ej7+KRpY5YVUkhg8ndxdCe3tUISWvWJ2+G0v
         GzXOk4iaj2xRxedoWEGlDAxtlOl9u3f7HOpQPmJWgKTm/VNzYhERd7I7Us3dnfE8tiXd
         jGrS8AC0e+f1lKed1kJi11v073CBIfnnTdiX9Dx6RcZNajqip2xN4P9DJ2BZfRrO0fEN
         ZWZ14YBbuGTz8kmhhRJ5RUlBuGZef0k6yTZL2teTbXoe3E0MmlPcyyDCP54ySGEfHVsi
         l5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150341; x=1764755141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIFMEq/463uAJMRiWFPyBpdwU+ckHZ64BM+Pb4fxVhU=;
        b=T4olTaw4uXat2wbl6D8O3bHziGoYQrUEJlnVcgymqcXCN5LKltH7slskcw3LE7cgFb
         GTztFOZn0b80LFBadRuuLofMUKIXeq2XAi+42zb5rIt8gfas1bQgix4sracY2nfAaHth
         akaxDWIGIf+qrPZid4wsdw4A2DuX6r1N7y5UUv2fJFPhLnKpTp+Ti4kvH3pSSgJL85am
         4ilFoN4mxgZ6FF/QZY7XScnv8sI0ZkDpK3DjYD4llh7JPyg+E4AYv/DDI+xgAvNam9t5
         psxjkOAdPrmQyH1NDo8HMWTclmRoOon4A0OEcGsrNdqeylb3sloNmKVMbHsAEFqWM6iF
         bf2g==
X-Forwarded-Encrypted: i=1; AJvYcCWrpMurmIQRweMeKY4G5xjDGC076yU/g3Blrs2HPUBvZ41DBZwJ7H9/goMo9ZJRMSsAJKoLsF4IG1wCkt4V@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Ar2CgHWp4zAyk223l7g/pxisPtk/1QjQzqcGZ4qwDjA6BDGS
	radcs14N3iBnVbEiFmyJQqv/ZHp1rqXKaywM+3lrfIfFkgjNS/Yw1G7L9D8ZM/Vt4PZ2zLEnLPS
	yzRehNLSm5VA0gYshX0aIWh7zWeGNpU1pQc0v1AisxVq1ntMTzzkZw8aRHJGsr2ky8aKZ
X-Gm-Gg: ASbGncssFwle/kcxCYHGV7BTSqh2aG1Usc/789I62Sw1klLxMWp7OZZV5RgzlARniMq
	OXN8hFa8FpXYJtni6BMjdwMpPSyFtnvC2qD9QC3lDsi6tJ1w4j8RW9TRK7uO1DvMVem6M2L3A4r
	YWz2eNgmXx08sIdQHwz2d8BCyaoicmLkOMq0OaPE9Bb5NG5OKC0fCfvfo0yWTQLo+5VLM3BA6qP
	NDIKWymUVr16zS0e68LCIMQWNwKB+ojoBckbAmkyGvAoUz3aMEmm/RKcpzE3m4z2Z6l5D4KwZBY
	KCJbDf0KmmR5HJg0Voo7yAhMWET/f/Z5HDc1gR6FNFJrxdr21Qxs+SeZhYk2z86FCoqyYVZMKTY
	1FAJEQwQwsGsngRE46hUe7hS3/WfeoNYyG34gaA==
X-Received: by 2002:a05:6a00:22ce:b0:7ab:4106:8508 with SMTP id d2e1a72fcca58-7c58ec0c216mr20834494b3a.28.1764150341229;
        Wed, 26 Nov 2025 01:45:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF50m2/RpC9lWEbFEitqZ6Zp8JBszTTXVe0mtTmt+kOCxo6AdCrAOHxoHKnPzE+KaM2OnL1rg==
X-Received: by 2002:a05:6a00:22ce:b0:7ab:4106:8508 with SMTP id d2e1a72fcca58-7c58ec0c216mr20834463b3a.28.1764150340709;
        Wed, 26 Nov 2025 01:45:40 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf80f4csm20739070b3a.8.2025.11.26.01.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:45:40 -0800 (PST)
Message-ID: <e20deaa1-e8b7-4dbb-b4cd-75620ba9aabd@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:15:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: qcom: gcc-milos: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=6926cc45 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BHIW56bp-DeTEuh3DTUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: -YZnld56YWNk-TXVZd5PAKKQ4A-XWXKf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX119/PYf2ob9k
 fh2Peh1jzEpdHpO7K8fEmr5cVYX8ow+mBtenNRWA37p1blcdVTG+TRbhjUxeyueA8MQcV8d9mEV
 YT6QUHOPXhXOV+pMfvElVUlPUllT3SED5bdk439ChanfWQyCvqWoY6xJst3xvuqAnU/OSLUd6L5
 BD7Siv18xnnDE38rJ4Wez+i35zVzluXjqoG7y6DKdFy2XpoOjQqn5qirEe8Nwl+YF+OTzkCZKP+
 oodV0i1zPzC6W/gOu40bzV4Nhj1TB3Jsr+nzeSucoyEp44gdhbd9nfro140eCVsA9np8eA3lNzs
 FyQERelINkgMhlyrthSyA9mCjcgAppSHOxXQRD/f7gySb4SSik0pRh+lVNKxEpw5HL86z2xnQgM
 1RG8OH63eZB+Job9ISALnnKExrEfoQ==
X-Proofpoint-GUID: -YZnld56YWNk-TXVZd5PAKKQ4A-XWXKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260079



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs to avoid any overclocking
> issues in SDCC usecases.
> 
> Fixes: 88174d5d9422 ("clk: qcom: Add Global Clock controller (GCC) driver for Milos")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-milos.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-milos.c b/drivers/clk/qcom/gcc-milos.c
> index c9d61b05bafa1618274cd87c83df6fd14131efcf..81fa09ec55d7f6d6cb761affd3b93301a102f61f 100644
> --- a/drivers/clk/qcom/gcc-milos.c
> +++ b/drivers/clk/qcom/gcc-milos.c
> @@ -917,7 +917,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
>  		.name = "gcc_sdcc1_apps_clk_src",
>  		.parent_data = gcc_parent_data_9,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -938,7 +938,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
>  		.name = "gcc_sdcc1_ice_core_clk_src",
>  		.parent_data = gcc_parent_data_10,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_10),
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -962,7 +962,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.name = "gcc_sdcc2_apps_clk_src",
>  		.parent_data = gcc_parent_data_11,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_11),
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


