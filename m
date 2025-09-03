Return-Path: <linux-arm-msm+bounces-71872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE1B421F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 332C048291D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9350130AAB3;
	Wed,  3 Sep 2025 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UpmHgTXV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA20309DA1
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906695; cv=none; b=C/fGHfvugQTnsLZKnugOlXiJmjKxPDmpZEuyMlZoeaHtKkCfBneLQ4OUnXZVorFCebF8K8DQHJ/NmgfsBwon+ju7ehgfvDqua0De2fm7t+HXmC1LRWmYSCiGiih9AHZsOabUSuhJzB8Nfe5BtQNolDSfiihsktWAMQA7EouZqhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906695; c=relaxed/simple;
	bh=LOn4lvVTz9RolUVuFrhuGbcWkHCfxy2FGtDMv4SJQ+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUu3s4VJEvpK6FKfGozErQh8cjZ9O+rgz+ZD46XeKMnmzqfTI6PQ1cwq2DwCyWUgurqsuERystnbs0uESPXhxaC1YB+saK0VMBApcn9v6Rjmw5DHm98xDk6mMUTKod+Mq34tbq9XtKwbXYgz+00TuqBFjZui2Ugb883e1CdWcFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UpmHgTXV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEsJ3013985
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 13:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+aXgx0C/TKBcTy6Wyua/O23sUvaZBDBg9e7hKnXJ9Os=; b=UpmHgTXV3+w3B4pt
	cREBVJYCxm0fGIOPXLriIEv6OMHG7Lal57rwNw+rbkwTCxBLFLJdPLdzXLiaUj35
	GcqpHQ92FITlQTgIY7urCVhiTjyJUOnmVILhH8Dgf1P7FdMZSbCIc4Nw4ancUIj/
	fDBk4mHUNyc/WTu87Kw1YwaFjssHcL1pVnnL0BYR/AK/tcJtfmfWS+sUpoc0DHsJ
	ZsVKGYTeG9J+x3KCFGj1so4SyqRvPZm/nL+IjU5Z0rJXw4BKysDU1ggGiuCGTdfR
	RjUxCgCcbI7OOwMYKFBkRQAJup95hfuAoAGVodfHlOBto5S+9tM1tB9ko0F4wBHb
	zHizJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy7qfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 13:38:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b48f648249so3068301cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 06:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906692; x=1757511492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+aXgx0C/TKBcTy6Wyua/O23sUvaZBDBg9e7hKnXJ9Os=;
        b=AVw2uNXxM7obQ/DC3OpvmokkPWKZEwPfH9clICeSLvaYtFmt9A2fkVde3H07zlGSGG
         JOm1qVdxHr6T6kN2ok8IWfVM83YoBXO6+9l2kMeBCr9MmB7gDT12bN3wzaJ/cfeKtgxJ
         0YRaJtRgRXRbDIoL9K7KNxxra4VTTrynoE0hEfoilK8PWPT20+oGRF60uFnZN3bie0xe
         i2kUZM78pon1ro2CBaLGpSRt6ZD8gNyyVDJ1opxp6NCf6O4/KneQB4IpGTmKWmVx0OLH
         fH9ZUm7+22F1pTF/7BawZ6AO6PdcOPSxmEK39jlQi1hIcxgryRZsZ4s6s7XkiyVpey15
         zFKA==
X-Forwarded-Encrypted: i=1; AJvYcCUJDX4ASexbmGJFTQYqTT9u3VWuLQZrx6Er82iMlHVrM/XLSpiJa12ZFzGQFZ9eZ6uUzel7PBbali4bcuKC@vger.kernel.org
X-Gm-Message-State: AOJu0YxbKPSRNNGR605fXWLVHBclYXsvUhoZ31wzoFqQfSGU4krWpmXa
	e1x08/UEhKJHZMgCqmjGSIuv+b9uzmIzKvLRILr7AVXUdZRjAdGtF++Zv9kw1WI1IcRdvm3lsu0
	Tpm1Q+9hq5jYtLpbU8Urizkmy6LNJ0mB/nfkWLtdukYqvrnA9p6BFQ/vqgxBTp1dfyPYD
X-Gm-Gg: ASbGncuj1Ktnv2rPGmIiJsITpWd2a2UUEVn9CHPpl4FKpdxQ6HWsJ8Sy8Kwu7X9UWZj
	ut5sGNpwRzk9smQTS105bGMBjX+d/RbS5t5v/qMS22wMD5KFc8lq4YliM03gvfmjx0Mv8g1h+jA
	6sRdohKmx45PfJMKw1VNISos+V+MY4xd0XXeFXaPpGyH9rpjgpK0P9pog4r7FstyOTEbaQbYcJN
	Ydzn8opEqomIzCnIVZiQNk7PHtffcE2sn7yqFy2VyhVCDUQrOJ8eQEK9c86avxKd/EIu4PzFrOt
	CNkTYlC7RVQ+xdmC/JmPkrOOM/jqMZ7D89A7jpYlAeFykOYuShlisfdbEDeGveO3ylpz3QOet2g
	5MXJLELfK/lNi1ZMAsWr3VA==
X-Received: by 2002:ac8:5e06:0:b0:4b2:f5a8:21da with SMTP id d75a77b69052e-4b313e1a3c7mr154164591cf.5.1756906691926;
        Wed, 03 Sep 2025 06:38:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHctp8klVVlJwh/I9Cv1/2OINdIX9gzROyxCMvF3SPTjSmgb2xzFihn2uTLcDdSBJMQgIRRKA==
X-Received: by 2002:ac8:5e06:0:b0:4b2:f5a8:21da with SMTP id d75a77b69052e-4b313e1a3c7mr154164281cf.5.1756906691437;
        Wed, 03 Sep 2025 06:38:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046aa92242sm149794966b.59.2025.09.03.06.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:38:10 -0700 (PDT)
Message-ID: <e6761fbc-9f32-4fb6-afc8-7f76b591453f@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 15:38:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] phy: qcom: edp: Make the number of clocks flexible
To: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250903-phy-qcom-edp-add-missing-refclk-v2-0-d88c1b0cdc1b@linaro.org>
 <20250903-phy-qcom-edp-add-missing-refclk-v2-2-d88c1b0cdc1b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-phy-qcom-edp-add-missing-refclk-v2-2-d88c1b0cdc1b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b844c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=JahnCVLux6B-E1IX8mMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rbvd_DSpK1MjyRWtVzbsL64gUx0HBjdl
X-Proofpoint-ORIG-GUID: rbvd_DSpK1MjyRWtVzbsL64gUx0HBjdl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX8EUNXXdS+x6J
 pUlPxEd0rheXV2MjI4sRMfaQ1xqqJ9csgHzeh14/74PHdpLcrfdg1p1nVYzS/jpmVrjCkoot2EX
 Pn8yWc9OiMvsZbWUrct5OfgZ6TzrROCkP0bAgZkiNobeRVxqL3Z6cfb50szKZaVi67uhLsvZQl+
 CZnJniQRd45P7gx9yComChO6aV4tgoinQGcZSmn9JMTXUrk3eT6s+iGnJvcoetnEXAzLrd4R0Vo
 873J/+3sgoeYxNmTp24UZwtzguL5i9dZ95dPZYBqusDf2rBVR+lphMvDXOhp4PueSuDLRj/y+QF
 BJ+Aab/iqC6PwEEZXVFXbq0LqmwSA6wk2Bs2cOeyzR9nfKH+Pduf41oI7BYONsvRZiqKcpcXIo4
 LMjVHTrK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On 9/3/25 2:37 PM, Abel Vesa wrote:
> On X Elite, the DP PHY needs another clock called refclk,
> while all other platforms do not. So get all the clocks
> regardless of how many there are provided.
> 
> Cc: stable@vger.kernel.org # v6.10
> Fixes: db83c107dc29 ("phy: qcom: edp: Add v6 specific ops and X1E80100 platform support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

[...]


> @@ -1092,11 +1094,11 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(edp->pll))
>  		return PTR_ERR(edp->pll);
>  
> -	edp->clks[0].id = "aux";
> -	edp->clks[1].id = "cfg_ahb";
> -	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(edp->clks), edp->clks);
> -	if (ret)
> -		return ret;
> +	edp->num_clks = devm_clk_bulk_get_all(dev, &edp->clks);
> +	if (edp->num_clks < 0) {
> +		dev_err(dev, "Failed to get clocks\n");
> +		return edp->num_clks;

return dev_err_probe(), also please print the ret code

Konrad

