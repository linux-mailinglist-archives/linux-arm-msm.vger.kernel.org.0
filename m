Return-Path: <linux-arm-msm+bounces-65298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A472B079FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14CB03A8860
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4EA28A1C8;
	Wed, 16 Jul 2025 15:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8txTZfE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1670A2356BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752680129; cv=none; b=WY48ASV2pNXZ3zliGki17euH4HqtP5H2aaYd35zVrGaBsOKAW4bEmn5vwwoXxFI3+xX88gcFmwidCRW04UmyDwRwMXyEdngz1JWw4NvlQUpm3Qy/7u9Xl3UgHOd/HidX2OIw7H/v7xkRN9/TSLgzWptzzsF4j0E7nyEV841ywjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752680129; c=relaxed/simple;
	bh=KO4I/UV9uxxYkgVhOGqX3ScFKYEZgickfkxEANrGH48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ji5+pypWmHsZ45FRyrzTRqzzQwXAmE53QYBIZBrzkNQOLO/Oda7pXbDv6sw01yjxjh2BMro1SayOs691hrXDQOscc/RovamWy9Evc5eZI4nGL1xeaoOzQiaV/gZSL9Hsw7Kcqshii3JGR2dmCij556mZw3YUqfORwpTT1FhbTAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8txTZfE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GCj7dW023068
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nKwLAVLBb1T9b+QNe2jR6UF2
	RMh1GWs/n01YMv7EqI4=; b=W8txTZfE3ZGmOAhv4FSqQUXbzDs3DLqmaBso6Esi
	FH3ii1sKg8Io28NEOS6LJhxlfW1FWhKqbehFCMZlDl5cj4N3lVoUtbur31ebyiWl
	2Kk3eR9ug3X42QAq7iupJkTYGBidyGhBvtU/TidrncB4gwkJsTkn7dZjVGNS3seV
	JA19HkMHmi5JkVasToHmgn60azhJi995nhLifMFpmV4kUPn6tsPtplnF+HsstEmz
	TecWGEFHRU9E6GEunBboslb6mnvNOL9X6jVprZI6PA5cbioEUDVmmT0Kw4nw0G2b
	znY4tiEjdLzGl06UfIHJKq0sKc+xqyOlvFId9H5BWBjOEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrun9fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:35:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e093bccd5eso680358485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680126; x=1753284926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKwLAVLBb1T9b+QNe2jR6UF2RMh1GWs/n01YMv7EqI4=;
        b=ZRf853t6+wP+xaLE5VYKLg5TNt5FUyeqNExaLYlENoZk5EfxkOqBDM3F8D4N3c+DDB
         2beJye5NK9Djmlpd01u77Y4A624PoV5B49HrRlRxwDIPnK8y5JAjWVrtD80qViq4sNq/
         +zMsWj4Q7oiTrOuo4oJo+k3FkoBUTpQDMsE7egjBqEtamk51WJwx2aXEjXIOZcgR7ESU
         Fxbsxr91OX4CVq4kn3KQW8BB8cdQu9WTb7dZwUnQK0Q+h8NYem3/S+5Tfn+ZxZmXxMzm
         gQUuesks03j+GDZOHaTL+9wrK40Xn4Hp8SkhDCwgmM7quGgfBfDsnzBy//Mw5l4+RdMS
         UpJA==
X-Forwarded-Encrypted: i=1; AJvYcCW9N+1RALED5x2z3SjTDNyci/5LrYEWiEqYnULpQM/OZ3bZ55xTbVC3H4Dvvh978c06DyhX3bAnpmXXRRpL@vger.kernel.org
X-Gm-Message-State: AOJu0YypJL9WHnSkfVrLxeS1ED4Bz//PqH+Dub0KMsuQmp5yQ4bbZ9mC
	VlS4E/ERgX51BqLRC9MF+KlgOHHQAmdJDOmFUTtPUxWV/1HCUa5cqoJMZbGNMTvdeecAgyNF6bS
	HLiySu2n5xC+6FktLAJRmv7whEUDvZISqDLQehr0H5C3R5l28yQieM26g6pLHnc3tZ+l7
X-Gm-Gg: ASbGncsc7neVoUmw9SalmWm/kOIwv2Bxlm/VBA0lDhomhyoupiKKRNDOR32bUJZ5Z/P
	KMxY/R/Wm5IoQZXtLuwa9xSyFqbVgvbFtnNswTWnLUdTt0raWU5nyYjh29BUu6NJXM8ZNNCgncw
	ASQ4DjmWa6tzST4kwihjjZolEQSgZqOLo6laE+F9Dqg0JN2cS9kevxMtdgabndPccvU6SW3agzX
	QjT8G3Z8hOFUFzAmvqMk2B1RKthABimnd1JKUXk1eD4w2+8PqkIOmrAtEmaAzc89l7u9JzDaTKa
	2XoKFWRLZwveKvmmVNWKNNYqebWjcT2AmmOVTefQkp/8pB9vlKyuBfdlA7UqGDXWsQbgRctjCbc
	tKBZbScFTXrF/qYGaYvnoc0DmzDmZoVPQ8enr4dQfa/uxSWixC5WP
X-Received: by 2002:a05:620a:27c5:b0:7e3:31f5:c8e6 with SMTP id af79cd13be357-7e343636bfbmr462007285a.54.1752680125817;
        Wed, 16 Jul 2025 08:35:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhZK6K7A2ZsfzoQ0Uc59Gc0NZS3lOeMxcF1d+K5mxadbzZ4Ra8ZrydLaOEEGJw/CLKuCxFYg==
X-Received: by 2002:a05:620a:27c5:b0:7e3:31f5:c8e6 with SMTP id af79cd13be357-7e343636bfbmr462001285a.54.1752680125217;
        Wed, 16 Jul 2025 08:35:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d32b6sm2684915e87.122.2025.07.16.08.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:35:24 -0700 (PDT)
Date: Wed, 16 Jul 2025 18:35:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] clk: qcom: Add TCSR clock driver for Glymur
Message-ID: <vawtojqbjrtoso4pjoza7vpaiog37hu6gbt7g6mmwbnmwladtx@ebh4amrwxwkk>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-4-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716152017.4070029-4-pankaj.patil@oss.qualcomm.com>
X-Proofpoint-GUID: SxzqdSPFD1Im9VxrQPc5RbEh7hZKummA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE0MCBTYWx0ZWRfX5w7IqdDIG26L
 rZtJ/XBf4xfAxurD6TLPabsSbGg4P13KL3edQu/mg1JTBEfkcpeW0aM6l6dvsU84gSfpZmHU9WJ
 zQfVNrIwRqqJ+u+cmpFfhIO6UoLOc1cjNjKSIVLhju+9n8FQK0TRJb3T8t/2XuhnPt4MCj82RSl
 LUrXb1MY3QlDX1Dxj7Hu1P9qe6unA8m5AAbIaHFtbbWo/JSwaBGEuszap59dItlg0wSjf8quB6f
 Ks/j+vGv1jX9SCI3MHodavpcuowfEWW3K4S7oZ8b5JUHiOse5u8I91Y18me8Dx1LOpYaPGEJBjP
 TmHChLE5z0FyODBOhY9cvaGAlNU5hZo61Ndwct+Fq0f8IScTQg8lz9v0i9r/aHzbNSEW9f5YS0T
 mn75UOEaSvjbddsW1fmrP5sqTSFODEjKZEB6QiZ1iJ9SAzMjfLS3w0l470FWh95TPWMoGRxO
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=6877c6bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZwOLpZNRS_i71KYojFIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: SxzqdSPFD1Im9VxrQPc5RbEh7hZKummA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=992 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160140

On Wed, Jul 16, 2025 at 08:50:13PM +0530, Pankaj Patil wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add a clock driver for the TCSR clock controller found on Glymur, which
> provides refclks for PCIE, USB, and UFS.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |   8 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/tcsrcc-glymur.c | 263 +++++++++++++++++++++++++++++++
>  3 files changed, 272 insertions(+)
>  create mode 100644 drivers/clk/qcom/tcsrcc-glymur.c
> 
> +
> +static int tcsr_cc_glymur_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &tcsr_cc_glymur_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return qcom_cc_really_probe(&pdev->dev, &tcsr_cc_glymur_desc, regmap);

This is just qcom_cc_probe();

> +}
> +
> +static struct platform_driver tcsr_cc_glymur_driver = {
> +	.probe = tcsr_cc_glymur_probe,
> +	.driver = {
> +		.name = "tcsrcc-glymur",
> +		.of_match_table = tcsr_cc_glymur_match_table,
> +	},
> +};
> +
> +static int __init tcsr_cc_glymur_init(void)
> +{
> +	return platform_driver_register(&tcsr_cc_glymur_driver);
> +}
> +subsys_initcall(tcsr_cc_glymur_init);
> +
> +static void __exit tcsr_cc_glymur_exit(void)
> +{
> +	platform_driver_unregister(&tcsr_cc_glymur_driver);
> +}
> +module_exit(tcsr_cc_glymur_exit);
> +
> +MODULE_DESCRIPTION("QTI TCSRCC GLYMUR Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

