Return-Path: <linux-arm-msm+bounces-98144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PH8DqgsuWmVtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:27:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9230E2A7DD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 982943062F9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0533A451B;
	Tue, 17 Mar 2026 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K7gbri5Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9iSkQfE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD7939184F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742974; cv=none; b=J8r2htw4FBQpvf8NBgYCcRfFYjCvuZkEiIgL3VSVu2ERqIS3gbc3ZanUO2kMx2q35Y37YfqGKonFFlWlpB6S7J1d51GfGwVtO8nEgCrCusWzDdhud8Zga36dBxGn3Y7GGY8IHHZGd3BsNLH/VBD3RT9Hl3LswpuEpbwJl/O1nnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742974; c=relaxed/simple;
	bh=Bc6Y2ASeHldhTwGxR+CP8FEDsMi7JLYaP3DFYs/hOP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpxwSr+Oksc+Rc3tLEmhapYgtiVSk9bwtdSREPgsRvsVQ9qKyKtZ9iZ3eYrcSIadI3bTl7KNSt8HEQQNnJ1mzzQviDyq9G4hXNTRWQkelWe/nToIKL6xG0V6q5qRK0UOPQ8vlAk73CMiDxTQHKhz0M7E0UkQd0McalXQzbTOBo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7gbri5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9iSkQfE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HA3K592072268
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrpP1VYIZ+/VpdbfL5CTlLKQ68vOHFAC0pU+EAgBACY=; b=K7gbri5YIWtMnSlw
	2fVa0zLeJlr3xIugYsqniPGDloiCDUens/eb2wYpVptJrpAFkzlOetmIL2Y0mWro
	/PDj6Wvb29gXoswr0tHxuHISX7xaIFgbCKej8F5YsXolshB1//JQf7wnKvwZrjBs
	8o67msh/n9ZBjCGBD7pPnH166Kli9nUaPuDEq4n8hyVIGtOOyvwzRwBdoShxRUSP
	4U9WizbsB4SOKxxV+oK08BxBK27+/KCaor1nFGLnQjKmtOdK2grbM0thlFNvqhXI
	oZBGCdGC507actFa1D4bdWfJRMLPXSZkf6nkWmg7ptEVY4NRKKkHx8mDSzSPpVTy
	gGrPrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy4v6r25n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:22:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd97debc51so423004585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773742971; x=1774347771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FrpP1VYIZ+/VpdbfL5CTlLKQ68vOHFAC0pU+EAgBACY=;
        b=f9iSkQfE7bmb+aDbHLhtkNx5I+31OuT+07AT7cDvc9b19qdYm+hGrimZiOliKxfws9
         e5++KzJQaqFXf2tz9wQ1Lp7MuaELZhH+PnmripnunMX9k4ctSh1NQYK77kW4dKSyF0v+
         7MOrT/9q1sXph+mogkP9oHuMniRVwskOrLo5f9NatS01vdqaCtEyg6MA6fTDDNv7F0cI
         pMY1OxEEpoC0+wKENwW30eSXCCOkmdKQh5eiIoOn9vwK62szez7GBgGOJ2okwZKwfqtw
         qXWZnq4W+s99Z/wCTRlNXctbo1VY9Nb9ogC5zn6fkzWq8269PGVlt5Ra552JwdpeyG+d
         FJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742971; x=1774347771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrpP1VYIZ+/VpdbfL5CTlLKQ68vOHFAC0pU+EAgBACY=;
        b=Vej+S0w3kmPBiomBKvVORWx/IClsOi40ErqKqXGVsEjid4HBxLtLrafrcin7bd6+qP
         wlh/D5L4WBXJ+DxxEK0eMsV6bqdgX8KIZF0H8Pxfc0fWMuRaDEOWxYq/0Hs04xWYz/QD
         meOXmBgX428N+9UWVm5swggH0mI+r7++lX7YM7b4tWgPkGBV51S1ysWwCofTrnz5Brgs
         iFupM8FTqrZgkR+e1ggqRgdPqEeMz4kHv4tZBN13qi9ZwXCmX9IT/hapLtSkqe0TG961
         Y2vRW40rXqrm2Wp5MS8pMS5K0k+tuAm6du+dwpo0O1Sk8Es+vIJ1YrjkFHtK7VmLzPuy
         7qeg==
X-Gm-Message-State: AOJu0YyYQ1oTHeB8Qyt+M5ZYNufAeYyHNXtFBhdLyBHjJi1lkL0WVhyO
	SQfCTKblY6hELFFX6Pu1NZQ5ZdJj8G1fpC/v5cPQHJ8hBxFWy/ZS1c1627VzGQMhh2tV+GNbVkg
	cHAjQhfOq6LWW5zM/rUSv7MID0nlQxcRi/74AddLOsdd9Si6hkIfORwUddgzldCf07tDkNV+BYf
	vp
X-Gm-Gg: ATEYQzzigeRK5zad7wGKRDkAWLRjmHn9pM3Fy9/U37watyMkCqovtRQpz/ugU/PqSOe
	lJQ5OtGlW3MhG5YnhSLDSK9j22iAYf04YNtnWr1Fl/PpzNdVXL4uBoLEpe7yMhmCIk8f08RO9VJ
	O340ujR0rqJsqcv+EatlQTLRUp56Y9fwCfKmB+4l+kkgls2hcpKsdW3ZFMIk1czxbTG/Q2sRomp
	drnEGOwZQHfplHumn4biUHskPU+Ai8zdB/9FDx5hFkT4wYpdo+pCpwn/259zdFn3YbdrFGOLGpA
	vAHzuCtMRjMjp4g/SF1GgAk23J4FUPuLbW5BgQKZb5NzUwwTtYfTQWadM/iBX0GFfa/JZYoS1bM
	RHi+Bgwj2kt8o+9H41HrUuOEk/+5URGHqAbyKHEdZ8DTkzQo3JjnViFebqyHZ4f0Oc30pLHDvVs
	LwcBM=
X-Received: by 2002:a05:620a:4707:b0:8cd:9446:cec6 with SMTP id af79cd13be357-8cdb5bb51a4mr1715427285a.8.1773742971110;
        Tue, 17 Mar 2026 03:22:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4707:b0:8cd:9446:cec6 with SMTP id af79cd13be357-8cdb5bb51a4mr1715424585a.8.1773742970611;
        Tue, 17 Mar 2026 03:22:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350b86008sm6375660a12.28.2026.03.17.03.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 03:22:49 -0700 (PDT)
Message-ID: <bc90669a-652c-4a10-9755-f4c202506318@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 11:22:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260317-clk-qcom-dispcc-eliza-v1-0-be4b0e4eb24a@oss.qualcomm.com>
 <20260317-clk-qcom-dispcc-eliza-v1-2-be4b0e4eb24a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-clk-qcom-dispcc-eliza-v1-2-be4b0e4eb24a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UrVJTgvGeHYB3se56pzQhsFhIGHIxe2I
X-Authority-Analysis: v=2.4 cv=Aa683nXG c=1 sm=1 tr=0 ts=69b92b7c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vXNxit1Icg9rXcKRa9sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: UrVJTgvGeHYB3se56pzQhsFhIGHIxe2I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA5MSBTYWx0ZWRfXyiNuyM4/hIoY
 ilj2YpjeJRouP6/EL7+7i7a2kAHutmc460ttnRzdszjnPA4sZdxbBpm9iNZLSF/C6C2ZdI6PBM/
 VYOCRZrK30M2DaN6f156wajSjovOeTqQsJZF90wTmsFugX5pxcd7TnPVv3cG+5XSnauTqE8tg4+
 D9RRrjWaBCWxyiznYrmjLkb3l55mC819lwpsIM4HeTdz+4sdUsH6xRMc+R/r+I+m8mfaAYSHYpD
 fJKZwd1C8f1BZZiVnXIjBgGhKNKPBuWQN5hnhATtNaDAWhxDvd2SNO0c6sakcqGvfkRcp9k9O0U
 7mzhjTvmAyCvCpFasDpIOLOQ9W2flTZnU1FkO/SDkZgW5yXUhdTK830kn+HGeqLi90JUyeh4WkV
 HU1mm2QUPjvfzbAi3z5Z3+XlK8dXUAqwz5Y9t+mn1bu/lGt7QDJ8VA4cjhsfjQu4+yzg5YtNMJv
 Ew7QHCwwnpUW41apL3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98144-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9230E2A7DD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 11:06 AM, Krzysztof Kozlowski wrote:
> Add a drvier for the display clock controller on Qualcomm Eliza SoC,
> which is copied from SM8750 driver plus changes:
> 
> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
> 2. Eight new HDMI clocks,
> 3. Different PLLs (lucid and pongo).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> +static int disp_cc_eliza_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +	int ret;
> +
> +	ret = devm_pm_runtime_enable(&pdev->dev);

-> qcom_cc_desc.use_rpm

> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	regmap = qcom_cc_map(pdev, &disp_cc_eliza_desc);
> +	if (IS_ERR(regmap)) {
> +		ret = PTR_ERR(regmap);
> +		goto err_put_rpm;
> +	}
> +
> +	clk_lucid_ole_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
> +	clk_lucid_ole_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
> +	clk_pongo_elu_pll_configure(&disp_cc_pll2, regmap, &disp_cc_pll2_config);

-> qcom_cc_driver_data.alpha_plls

> +
> +	/* Enable clock gating for MDP clocks */
> +	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
> +
> +	/* Keep some clocks always-on */
> +	qcom_branch_set_clk_en(regmap, 0xe07c); /* DISP_CC_SLEEP_CLK */
> +	qcom_branch_set_clk_en(regmap, 0xe05c); /* DISP_CC_XO_CLK */
> +	qcom_branch_set_clk_en(regmap, 0xc00c); /* DISP_CC_MDSS_RSCC_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0xc008); /* DISP_CC_MDSS_RSCC_VSYNC_CLK */

-> qcom_cc_driver_data.clk_regs_configure

Konrad

