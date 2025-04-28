Return-Path: <linux-arm-msm+bounces-55939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4765DA9F79A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 19:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C434A3A58CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 17:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD6B294A13;
	Mon, 28 Apr 2025 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEoqa4Kp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BFE27A911
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862075; cv=none; b=BO8l3YD2yCxEnQSQ/F68Nvq3EMATy74hoYcdZ1oWICXMhQT//tV8Ofsk351oS9WjdckLw7SN9fCqq1wWuz8ksfw+YxQyOfbvClp40laBVSG3GQmsY4AzF2b+raCVJJY0NgKzPGjwxbihPRRR2a5Wtz/I5zpmJTIvQlblpXuWQkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862075; c=relaxed/simple;
	bh=pggrvf7aFM1Uie3ksCGKm9fcXTwphOeBmE6ZXg1K0To=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NklRGYtKJ/rF15RDiWI43Bnw/GKEowa0PhGKHN2luZe5BMbncrTHDjKeUeJhMGBuZ1AN/0S5/BFYZxuPau/bqruiYpPwA+ICcpgcr7XP5985jZVH9CFsLkVBrsDzm8WjTPgVbXPfmk+l6A3kdSjOc/QLcVyesQ1bDk7S+fOuprY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEoqa4Kp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACxks002387
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 17:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TIwMyfbj3XbF1DLrNX2RoNpDxP/RC9hpdQ0dRJ0tGHQ=; b=FEoqa4KpYEQI4H6K
	NXfIgOYAc4Ss1wTxwsndXJxOsYo3vCXJXXsgFoY2dIwqxww589YLVG8IY43hkRwy
	cspwMlDguhNhCS9XeOQAOes3etHs23ohcgIW1JfWuSjpFi8jEMUDop7t+NgPYdf4
	y/GmzHxTMP5cC0Na7yKdv/05FvmK/gRxkcOKCnPEpjzf5eppcxloL+MvU9misz86
	MKOxOqsPJMtqrNw95CBB+1SfYJTfQVxJ3MhDqDN233nNzpJNTK05lKG7ua92+SHn
	/8O/XYXbQjytgkftSoEW6FK9tsKrbp9TA/UIpNPieH2gNUxDK85mrOxBcunC4KXt
	9dHK+g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9hwt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 17:41:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736c1ea954fso2580159b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 10:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862070; x=1746466870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TIwMyfbj3XbF1DLrNX2RoNpDxP/RC9hpdQ0dRJ0tGHQ=;
        b=LHfHwY4BF33QD/akei4f0HIU26zsCoPpxsFO/7+800xhbcZi+tlA27mjjbqmBVK6aI
         UUu0QoZvrK2lvapVXtDzKXlgjPUxbY4gefm/plQ6+9xo77tnhsNr+U01HablKB4uCBMx
         XDbAYMTv3MJSISRl8Hk1OfYiUNn+PUL43CpzvWmbDvzeVYchwaxOH7tQRIeSpk1T3dP6
         veB3ZdYnFCNuYKM/yffYVe2H8L2imnfjmfdsdvmJPcnKI88YbwoaJrTKOeB9hPi+UjHj
         thJsUHrc7qweZPyd+iv8YEg7PEbF3WbRsGT5/FRJ4l46RGD4VnRhUp6wFMubEJG8Z08m
         Yzdw==
X-Forwarded-Encrypted: i=1; AJvYcCV17UD8pzbH3PqnGBIMNARsb4UnxK6fG5xRYr6v3rknMfudWoOBYglzWsWwfkL452wZCAFtz+ueppY1aPvw@vger.kernel.org
X-Gm-Message-State: AOJu0Yye74F3ktM5/4Venkhq6sYcQ6u5srGRZiHzpDG1sUABNNAIanEA
	cP9WfuBhwEf9iz+9ljg4OS+HxxqJRpg21H98sH+FK/8Zx36HU/j7XfDlS7tvFY/hfyckVqb2tfy
	6SEVo3feAB+Je4tyL2ebDPdQ9DmDMEf+Wua0tavgOm40u/2bOZ5kjJGz7gvX1uddI
X-Gm-Gg: ASbGncuojV3VAxDvK3OJFOUdAJmcsTVo311u2+oP1CAsaKWMhKnkzuM17X21bx4E0IZ
	4d0Fi+ANajAF0lp6nlqOlasAKu60viALbNdvy2zF72MqY0dTG4DcT3ItAZIq1QyNhzlKkj2keXx
	54iZzHc/NMi5sZq/x0m9HeMnIV8CUn7/VauOdnjhww5FzeamEuP5DyNrawSB+dK3U06PVZBGgub
	txraQqaf6WvxdQL9hfUpwWzYAk9KSB8EYW3Ou+/Rj+1nPpEUuwStRRiZOsmSIoSmLm2R/qAdFjG
	H+3f2c526DalxPP0B5cuA2rJRuTGpxBvlJhaPBzs
X-Received: by 2002:a05:6a00:88f:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-73fd75c4ea4mr15399451b3a.11.1745862070588;
        Mon, 28 Apr 2025 10:41:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgjfMkBn0pV9r4Qg3qhNII5Usb8joBTmFadTYCHZoBgt9OiIPYvsOPn9WNpttYgRk3jvRtAA==
X-Received: by 2002:a05:6a00:88f:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-73fd75c4ea4mr15399426b3a.11.1745862070246;
        Mon, 28 Apr 2025 10:41:10 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25942157sm8304691b3a.72.2025.04.28.10.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 10:41:10 -0700 (PDT)
Message-ID: <c1b23184-396b-4c6f-a890-9e08bf564eec@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:11:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: gpucc-sm6350: Add *_wait_val values for
 GDSCs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
 <20250425-sm6350-gdsc-val-v1-4-1f252d9c5e4e@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-4-1f252d9c5e4e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=680fbdb7 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Svr01UFivMFfsnZ9dZkWgg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=COk6AnOGAAAA:8 a=6dQnf3u2Ryt8jKbU0REA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6g-R9AQ7S-3z9Avw-rdgf5KEqn-snFZp
X-Proofpoint-ORIG-GUID: 6g-R9AQ7S-3z9Avw-rdgf5KEqn-snFZp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MyBTYWx0ZWRfXwRP1OnCddl1W OjHkg1f/mwcA9SrpJ6fdqSTcb4Q9wB6nJ3FHqfjfDu39iiCnbOo4e2oKlHlgPoV04gxpBvBmxlM /nTrMZbk+K+2/bqM4zl9hhlMluYCD1Q/TE8Y3pDEr4e2+iXmdg7cW3db9ZLxeWpzgttWPha16GV
 m7KcmFitWmPnzEPkBYV//O5ULMY5goiLJ03W+qQJ0tmaMHBS2ICm37r4Mw5l/7iqWZC6XijzrOT rRwnzkOA0yHJY2OMGWWSO7Q/5AT1t45uPDORNhAvycAKVPGGxqr1kcsDJeabOxlbb+5Sd5M+6lc Xk/rj3R2K41GQ+RjM2nQ+2rkjQLvU6imLZIcL9HZpcnzy8CplP5FCWPG96KJXnT4LSz0+4E/xSP
 0d4CIKCVeMqDxWJcGBGCY7/ovf6TQQQKvzAsJSD4o5swfZ0cahNrdg1gAozIQmrjq159vthv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1011 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280143



On 4/25/2025 5:42 PM, Luca Weiss wrote:
> Compared to the msm-4.19 driver the mainline GDSC driver always sets the
> bits for en_rest, en_few & clk_dis, and if those values are not set
> per-GDSC in the respective driver then the default value from the GDSC
> driver is used. The downstream driver only conditionally sets
> clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.
> 
> Correct this situation by explicitly setting those values. For all GDSCs
> the reset value of those bits are used, with the exception of
> gpu_cx_gdsc which has an explicit value (qcom,clk-dis-wait-val = <8>).
> 
> Fixes: 013804a727a0 ("clk: qcom: Add GPU clock controller driver for SM6350")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/gpucc-sm6350.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gpucc-sm6350.c b/drivers/clk/qcom/gpucc-sm6350.c
> index 35ed0500bc59319f9659aef81031b34d29fc06a4..ee89c42413f885f21f1470b1f7887d052e52a75e 100644
> --- a/drivers/clk/qcom/gpucc-sm6350.c
> +++ b/drivers/clk/qcom/gpucc-sm6350.c
> @@ -413,6 +413,9 @@ static struct clk_branch gpu_cc_gx_vsense_clk = {
>  static struct gdsc gpu_cx_gdsc = {
>  	.gdscr = 0x106c,
>  	.gds_hw_ctrl = 0x1540,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x8,
>  	.pd = {
>  		.name = "gpu_cx_gdsc",
>  	},
> @@ -423,6 +426,9 @@ static struct gdsc gpu_cx_gdsc = {
>  static struct gdsc gpu_gx_gdsc = {
>  	.gdscr = 0x100c,
>  	.clamp_io_ctrl = 0x1508,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x2,
>  	.pd = {
>  		.name = "gpu_gx_gdsc",
>  		.power_on = gdsc_gx_do_nothing_enable,
> 

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>

