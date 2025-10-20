Return-Path: <linux-arm-msm+bounces-77965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C2CBF0740
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89444188200C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 10:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A552F6173;
	Mon, 20 Oct 2025 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldLjFHkB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C9C2EC0BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760955083; cv=none; b=f7d+YvqFiaR+70MjAcQQwvDsY+YlmhIM7hAVzZLxJ9/2IqQPzd8ghZftXBthBNYL+2TnoXAlQYvE64F7obHlPryBifxMK3ThrYqpyuFAbqkdT+J5JsG5RXxEKuuB6L1s7I72P451fdEWYY4pQAg4eLMk+7ogRa4WBX/uy980MIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760955083; c=relaxed/simple;
	bh=xiWPSbRHjdTXtgl8HnRR1aOilTdtj6C4ganZdg7k5+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GysZB+awJU0aZqB35Keq8bF1Ja3yZtuT53aAx5JvCLn0PdxaguhiqpNJ/Lh18SqHZlDRZqCnfVuLFO9vzEDSDL87BGEiFCORO1lcTEcMS0RoLVm3l/uJJmV6QxT4CgRE5tptb8LlpCauHl8qjB7kaqPxJC+8QNfm5vZ9eXf6Zn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldLjFHkB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMnUfu005161
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 10:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+hVZ794o65ZjNkTU3MJh24n55cLx/Qd4eKxjXTl1tw=; b=ldLjFHkBYPVvaf1n
	KnZv+e/tIDva9J88nVfyPM87YuolpoSyFCrFginK3EHDsLMgD5MuBpKUDOXSiNAj
	ZsibqKkd6fjnVbB28XXZQ2UY3Fw/m1BSFdMUJVBuTBDPQByZH2psZ6Z53hg5O5ek
	cD0Aa0rCPQJmhlhTlNlTlNpByOb+UAq4Z/GeSfALYbQ7kUI4ZSTJuIBUOgh++6g+
	ddWwHYFoD/bB8zBfuWn1lZnZF6IeTJHklqZcN9h/hzwUXb0RjKKxgmodOtVTva17
	8SCK5T+RIeqH4mJWrbSZ8ra3ehS9BtzC5BdKSMTaZCCROAUUHK7MqGy3ciQgU5LR
	S2jE5Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343vdq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 10:11:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7812440690aso916438b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 03:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760955080; x=1761559880;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+hVZ794o65ZjNkTU3MJh24n55cLx/Qd4eKxjXTl1tw=;
        b=gWZebFkGye22JuymTmk6TG+cWSdsx73J+CC3cJZXEj3fKFf2rpLvIBuOa+6ntTS/lG
         lWMBo/RW2p5wTGVim3ID5pIkrhRWBcieJJXtlScUE2kUMppxOIWGb2/DJ5xoiPxIzC+J
         5NyC3ApudtcLV8gSvbxyhPrjg8tGPzSHwt9NOWelEy2YbdeaFSYvKJQ3BFX6T0hLikbi
         dw9EkBpnuDRdqTCS5fLi05jblzOGfNTTZL0jF7GSqmeygCjIRcEaiW4kL5U2A7r6OVao
         MEX2JPLd+W5PjOFshVqrvQCROj/KIRUnCBb0cR7oVxvHgE4x/yEwaIVPrrE4vaTN7ZNU
         FEsw==
X-Gm-Message-State: AOJu0YxJW2bmQbphIGkr5aBoqysXJGI1XWupSV3cg1YPmVJFBP2QjHU6
	1IpD2L9q/Geeo5o2ZsT7kOP7yPVM/wElFdhgb7ZhsYGg25X6JhPGV5GaEDjxOdCFRW0epwjt1yI
	y33y2r3gP/arof0AN2Qf0wvNN7E5XnUpqGgcLp9BGsHwCWA+rGz2r1FSnkGJg86bsgViIT7Dz0H
	uq
X-Gm-Gg: ASbGncu861Ibdi0X/ZxQ61BdUwLph1PxYS2qBT8SliPcpuVQZqV8834p6MtN8YLCv1W
	NMf9UIZDThrisEjDjwGyJynERniRqZyEnoo9YqkgegCF6PZP1kIZs6ZE7xhxpym29T4fCCNHon/
	i646Tt1qQW8AFJskLTIp92TJG8kw7MHWzHBfUIkI0MAIEKlIH+/uyDTzbha1p9Nr5O/c1t64cQ1
	HPEjgghM+SGaXqqNgYs276pyHPW8p/cHMH/RI88kqWuHIXC0mZF0bOlnHcOrOXnSyQySBewXE2r
	2Q6Zigy3hvHgLxB6nHGne6dNApBO0DPTqI8SJTODyVVioL7Qt2O9TDBO1el8PTeJQJj7sylJzyy
	QmZJ6IUXnk7n5DboMvqXHcc2GnYmz013e0igU/bdzRmXYR9IvS+0Pdcd/af9wl27hJg==
X-Received: by 2002:a05:6a21:164a:b0:334:b19c:9bc9 with SMTP id adf61e73a8af0-334b19c9d95mr7179597637.5.1760955079686;
        Mon, 20 Oct 2025 03:11:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHabaF4y08G8QCgS3i2i3+rxV0qWmYjTjDj+Zl/4dasU2uJXxqrMdEiJaZUP0aEJXma7cp6pA==
X-Received: by 2002:a05:6a21:164a:b0:334:b19c:9bc9 with SMTP id adf61e73a8af0-334b19c9d95mr7179563637.5.1760955079132;
        Mon, 20 Oct 2025 03:11:19 -0700 (PDT)
Received: from [10.133.33.107] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b77bf6sm7309840a12.41.2025.10.20.03.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 03:11:18 -0700 (PDT)
Message-ID: <1d2b6c69-4ea8-472b-a18d-0bd39042184c@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 18:11:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-4-29b02b818782@oss.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250924-knp-clk-v1-4-29b02b818782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hx2rvEc8Y9OB-lflrlvpc6mJaFq0APhK
X-Proofpoint-ORIG-GUID: hx2rvEc8Y9OB-lflrlvpc6mJaFq0APhK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX2sJuV+OWqLNO
 k8FFNiWMeRPCuY1KjiUPPeed6U6/FA5gqiAFq2pFjIGcqttL3xUFoR6kusM4MTi9WdRIT112bHR
 9F8iVoqrNu8fwWHmiBgFZlxdFyL1bMPPoG+43nTwVMVt+ifEaSR94zll8k56piB4/0SsDXElYzD
 mQZuAd6VxxEUiJpAS818uteFobqZgFKtyTlSGO8MJ9iOVZyKFYCTbTb4Y1MPE11KZkH6Z87/vPl
 aHZAuc2virrP19tjgkpRoX34/svaus/A3lKvMkfRo83khksL70DJ91LX6mQpXASMRg0tIOIzdKt
 Ivsy6yIhA3X0WRLdJ2r9Ww7J0l4dy0lTw/RDcC4VWCvk+1r0boxtanwObjkf28t1QMLaw+lOY+K
 RvLIKwWdl+YWAKYKn3c3IREvIqi3aw==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f60ac8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1BWIhq4ta8SIVIyFiOkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

On 9/25/2025 6:58 AM, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the RPMH clocks present in Kaanapali SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 63c38cb47bc4..6b1f24ee66d5 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -395,6 +395,16 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
>  
> +DEFINE_CLK_RPMH_VRM(c1a_e0, _a, "C1A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(c2a_e0, _a, "C2A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(c3a_e0, _a2, "C3A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(c4a_e0, _a2, "C4A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(c5a_e0, _a2, "C5A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(c6a_e0, _a2, "C6A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(c7a_e0, _a2, "C7A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(c8a_e0, _a2, "C8A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(c11a_e0, _a4, "C11A_E0", 4);
> +
>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>  DEFINE_CLK_RPMH_BCM(ipa, "IP0");
> @@ -900,6 +910,34 @@ static const struct clk_rpmh_desc clk_rpmh_glymur = {
>  	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
>  };
>  
> +static struct clk_hw *kaanapali_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_DIV_CLK1]		= &clk_rpmh_c11a_e0_a4.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_c6a_e0_a2.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_c6a_e0_a2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_c7a_e0_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_c7a_e0_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_c8a_e0_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_c8a_e0_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_c1a_e0_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_c1a_e0_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_c2a_e0_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_c2a_e0_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_c3a_e0_a2.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_c3a_e0_a2_ao.hw,
> +	[RPMH_RF_CLK4]		= &clk_rpmh_c4a_e0_a2.hw,
> +	[RPMH_RF_CLK4]		= &clk_rpmh_c4a_e0_a2.hw,
> +	[RPMH_RF_CLK5_A]	= &clk_rpmh_c5a_e0_a2_ao.hw,
> +	[RPMH_RF_CLK5_A]	= &clk_rpmh_c5a_e0_a2_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
> +	.clks = kaanapali_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
> +};
> +
>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>  					 void *data)
>  {
> @@ -990,6 +1028,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id clk_rpmh_match_table[] = {
>  	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
> +	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
>  	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
>  	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
>  	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
> 
Remind to review this patch.

-- 
Thx and BRs,
Aiqun(Maria) Yu

