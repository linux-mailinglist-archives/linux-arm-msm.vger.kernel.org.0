Return-Path: <linux-arm-msm+bounces-75628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD63BAF58C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 09:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3E7B3A9DDB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 07:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4371A8F97;
	Wed,  1 Oct 2025 07:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXFWvd3d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0281F152D
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 07:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759302224; cv=none; b=aqct8hJ6U44bSsHPSM0i2R1kNaef0v9iedl/d/dTYMr13hwKSwNFaIA9hhkA/3NKVgfpwOeKr2faSY2gNvYbUi6qASAMl/bXX4nKCC32nIYGvAivXzSZgM4xgWdHORThjzRA9rKWwvrwJQiTqh5TnkPbN1pRI6KWU+igVd/TCY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759302224; c=relaxed/simple;
	bh=4bLqWv0MA1lGdWx51FlMH1Tx6y0z0yBtkAGpBUXY+LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hieWdk7XENn03JSqCj+R1eBU5oEK5v/vTRXK19N9qXiIAxsj730y8ZjjllQFxaTf9MZZohy/2sLFqX5VDnGNyKwMleZDMxBJtQKTwoarDXy45vMzK3J+7i/kLZW8O7RaSVNhSUd4beJhbi5XlhFaKIVMYbya4QdsSmxdpwBz+rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXFWvd3d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKqpHL027451
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 07:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XxcaZX2taq9qV4nbICxRulbIsspEUNYK0zzuhWUhKI=; b=JXFWvd3d+3uTuOmA
	4a6s4Cs/hDMd0qUUjLAsWeOf2W6m5mmWJgFGTrqPXZmrZ0wQCOkwLRDh2Pt2RPsv
	E1dUL6YbLqk84VSGhpEU0tvfQVrQfNVw1e78H+R70W94RQwtb5Y9wxvv1xi9a0v5
	QOQecuHZZxoHpw+DlzfR0Pd2heuPRB9zBySSZBB94wZ/kYgdjgIycGwCba+vopJw
	cWgXPCQU5WuVl/e6n6bYW4Guqq3T83X00eAS5N22b7lEqle2NeGCaVT6fygMShU3
	eGE7dl3iP0lH0rRxQDrm3LrF0SoPNuOsik8ZQ7baCcWWx32jBzcSI+7hmiWq4Lhx
	889oRA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851kmys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 07:03:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-780fdbbdd20so7228437b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 00:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759302221; x=1759907021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XxcaZX2taq9qV4nbICxRulbIsspEUNYK0zzuhWUhKI=;
        b=n8wOHPv5Zqvii685Bz4HjtPdJvgDr0PYKgUaRgP4q+/MOctYW2mL7hpwWGtLryh7RO
         pJKjllj+pNAZ+QX0/omcaX1DmlIA6SY8qp1NVGCl92F/lnU530VX0lziOvNG6Un8LGnI
         q4PjuUS9tglRtBf7yGokzxrsWyvdmqk/2SpO+1n38h8ZtWswRg1VGixK1vY3/aWoV/RX
         sjpa6MFEObR615zF/xBxBo/hCL0AjqW8SRJudd5AAADsawDAz/2pRLM2q+Mu1KEQAzzS
         9Bk4O9z/zN+0g0GqVhYuaD+MuwLZ3rLkT2mdni0vzU51DQRQtBLstf+F6Cp2a0uhJtdG
         StZA==
X-Gm-Message-State: AOJu0YxqhJ7yIkqbGMUSth9YttU9hESB7DyELgN8MHK5CCHFdME/RFJh
	Rnf2V9oVGsgn1MjISv1AzOQfgP+z3s0nt5Xj30ysnEDKAgHIqdUIvSxTU2ZaoPXuEL039J2EBTP
	CCUw+wua3sDy9QbWEb7A4R/FoTcGVG7hcFnJ8VYv9dn3OJZwtmMTZ8TeslFUErz/CvYZjVZfrna
	ya
X-Gm-Gg: ASbGncvMxOUZ9RTBxvZe2oYZQ25W78woc+8PuGMeovXtNTMIB8nSi9fzCCocuX7PxVi
	1yQMx3upkCCd1K7AlJtZniB8+VqNYQx0/nVYuSQRUJPw8DvPQvCbgB8INorprd/tV45ELRIl1k0
	NDCCUUGMwLgG0CDsvLYqweAn0y7JjImLRHUbSLMQhECLy+REEvTmXejIKGextG7xI2pMD/j5Ybs
	jSMTBAJl4Q+/n2QRJDQLbjX7Ol6KYTw+0duKSRReay7eoW1bxlaQC8sIIbhQcRhuXk191+BeN1x
	U7PEK8Q9uPNM5LFD5dcPQKi5o63DrcFHQltJQtxrNzMh6hyCSInKG5Mo8NHKm4fdp/bCvXcN
X-Received: by 2002:a05:6a00:23cc:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-78af41d3f6dmr2859550b3a.32.1759302220580;
        Wed, 01 Oct 2025 00:03:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcl451PK1NkVZh3OLUUPJtnf8fNN5lOQqjF+yrOzMLlH+aNHUtU9sxDhsiuCyHZkM54X0sUg==
X-Received: by 2002:a05:6a00:23cc:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-78af41d3f6dmr2859475b3a.32.1759302219829;
        Wed, 01 Oct 2025 00:03:39 -0700 (PDT)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e9a9sm15587378b3a.15.2025.10.01.00.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 00:03:39 -0700 (PDT)
Message-ID: <9bfa3478-00b5-49f6-a808-7d60de5d2f39@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 12:33:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Fix SM_VIDEOCC_6350 dependencies
To: Nathan Chancellor <nathan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, stable@vger.kernel.org
References: <20250930-clk-qcom-kconfig-fixes-arm-v1-0-15ae1ae9ec9f@kernel.org>
 <20250930-clk-qcom-kconfig-fixes-arm-v1-1-15ae1ae9ec9f@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250930-clk-qcom-kconfig-fixes-arm-v1-1-15ae1ae9ec9f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dcd24d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=oRYDs8KJhtz7EUiVKSMA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfXz9PFvw+k7oul
 wycwwkLxuHS+dof2dsRcB91HToA6k7k3pawulbNr1gagpLwAzKJsi+s0Ag0cJafZbBKKRPhex7f
 Zc/1lrpzenXI6pM3VROM3PThe7+cpIQwVO+P0g2c5BeP9q40+8HpPbjF1yYwrZHCyUBNVcPoY03
 cQ8zgLKlzed3y94O5W5xgtx/QixXfOxybuXbElm9bQohl1u0gv+437xXB461K56uHY6WuM4U+Tm
 H9ggZ/pJQ2wrY4Q5BnB+MvctclxAJ2nslRs4ig1BPABOGXguGWnaLKOkEjL+4Y1YwFyNiR1/8++
 vNPaaT8iZU908PsiRG4Q2v9lXx3iLEyUcNS/ShLjQXtjmxJQpGqxdAd8KLqX0S3lqdDVk9QA70s
 4UNXEGw0okeW/uAq40IJeyZpl5aMOw==
X-Proofpoint-ORIG-GUID: XlhOOUVJC_PMWMIylpwmVtZCpiy2REhR
X-Proofpoint-GUID: XlhOOUVJC_PMWMIylpwmVtZCpiy2REhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032



On 10/1/2025 12:26 AM, Nathan Chancellor wrote:
> It is possible to select CONFIG_SM_GCC_6350 when targeting ARCH=arm,
> causing a Kconfig warning when selecting CONFIG_SM_GCC_6350 without
> its dependencies, CONFIG_ARM64 or CONFIG_COMPILE_TEST.
> 
>   WARNING: unmet direct dependencies detected for SM_GCC_6350
>     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
>     Selected by [m]:
>     - SM_VIDEOCC_6350 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
> 
> Add the same dependency to clear up the warning.
> 
> Cc: stable@vger.kernel.org
> Fixes: 720b1e8f2004 ("clk: qcom: Add video clock controller driver for SM6350")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/clk/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 78a303842613..ec7d1a9b578e 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1448,6 +1448,7 @@ config SA_VIDEOCC_8775P
>  
>  config SM_VIDEOCC_6350
>  	tristate "SM6350 Video Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
>  	select SM_GCC_6350
>  	select QCOM_GDSC
>  	help
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran


