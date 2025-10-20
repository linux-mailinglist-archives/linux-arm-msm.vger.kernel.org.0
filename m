Return-Path: <linux-arm-msm+bounces-77980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD98BF0B8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA2A13A2379
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 11:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC5E28030E;
	Mon, 20 Oct 2025 11:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wl5ufinM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF3224E4C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760958225; cv=none; b=r5pCKnBzpO8s/Je/HKKO85J+juL4y4MFIMhSavJ1arl/T5R9PMMh7Ndn471lZr6aniX084uAWd7aB7iIHFjwhrVJ8/SorNGw3YUE1HRE+IwT8lAUUy/wVg8xxGllHcsfdlpOjmt8JJIhyuSehkNM2rS5z2E1wYZzre21PO+Dhlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760958225; c=relaxed/simple;
	bh=GwE8FjDB4hgHZTroAXgWDyHg5DjY49WcxEpUMw9oLvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfWrC/5m5r9eqRENBI2CdoDzsQHcsQZyCC927E65qa999lbPvBHiorP1TdW+XWJuAsFqyO0KDQ6oGJ/61MOeXxw8dOi9KpuhC2hADSYz4tCLdIquFERo4llP6S9IHrB4TLj/3bHeg4hrURqMDgLu4IsXIV0Y0HOUZc8RV+VBvVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wl5ufinM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMOoxM002864
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tWB8h5H0hYMzjnnlPftSrbIL
	TIoJkun3efvv1qjHRHk=; b=Wl5ufinM7COLLnxZ5k8yozvYZX5Pvp684nsk7B0x
	f7SHDgq6bBGSvoNhsi4a19kPrgs9F/o+YyvVx1HBFkBV9DLD+9IA0GZZrB0jpwPX
	bmkmL/xDdRpTkyi2lwaB6IUdhMrhgmb8Muwo1oFO+SGKtuS9d9ZDElG1jps9wzek
	5GxZ4W8/rAc3NkI9/LiOYmJ5pJ5E9pZqWoN8x/sSiZajuZg0BVhg4IM2nZ6MuNV3
	fXj/phgyFoLB2vA0m1XoUB03AdvmWCJq4mlKqsVn2eK/MIGzY8HTqS0j6rzsrZcx
	90tnsjrZqNg2ftRTEXJiAEF0wGZayiQCYAFEpnteDX/7lQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pcs0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:03:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88f7eff9d5fso322044885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 04:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958222; x=1761563022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWB8h5H0hYMzjnnlPftSrbILTIoJkun3efvv1qjHRHk=;
        b=kiB7lq5fhbYTQHxMfYP0SI9tPsCrEh4j5A60+vUx/2XGpLerml1A36QBMk106vJIdb
         ru2cnVJCoKB8mxsQcPYEJ6JUpuQd8Q4G3lA6zkixFv/h4LPjmt+YiQwZbL0RAjBhUUOR
         Pmv5DRBZ+Cn8okP0PHn8xzhS+KBkxMkkh9eRn/wrMPChN9UuJx8e/PYh0BF1CKVgpNIL
         JbUqBEXuDaug+4wiHDZF+GqTeQLQFZfGOKS6xH0nFxGGsB+vPoMIjb9TGOGWZkP3BNSR
         UqCAtszqG8o3WU00ylmRYtWbx2VAWzMx4auyPreaaatp/ArPNchaY25gnXQJaIcc8Xhn
         ZdSw==
X-Forwarded-Encrypted: i=1; AJvYcCVrc0tZksPc7bDQw/iY6vIcFnlh33M38fr6lQW0huE20RXXNAhED3h9pooGLDgPpYbQo+mC5CYZ78g5XJtY@vger.kernel.org
X-Gm-Message-State: AOJu0YxMjh86uoJBFn/T5P/Us0oQPxbq6CnNamYXrOcGw2TZTiuuE8Ra
	2is9/uWAbqzpTwgx+VdEoPjxg1Bti3JJNgnhBPOsoj2CJpuryLCtUcdzAifBfEw/U6oSfouJj+C
	/cS4ov1YeN6nl6cuHdQkZjmkklFib9uSFqxFTC2A8AiN2K7xDLpHgGI7HaKgmcF2Bn+wd
X-Gm-Gg: ASbGncsAHsuNHFFqAZ3Zl/h6A1BjM1asdJuWlARjnM0euw62m4+KnfLQwNeSjLbZgt3
	xdpxkOxyl81ckxVMtqZzOAY63e932ZsAHEWgSh+fh3qqqjTHTmN0oKSCyhlHvsHXHH255dQBK/B
	kCzKBpcHguYd6+xsH6H00iQZ3znvO5xIMT69GQZ5YGwSzZquT7tYGq9vW2vY8ueh4ArGxDHn6Hx
	ye8OAAiSnyFHWV7JbF99FX5Z8StKpNvyTK5ptUIqKvmli9e+BUjaJRORPmmNCKiuU+9U7h1UzX4
	OhY7wXWZRtL9619uvmSZg0Z/UAM9Gikf+qAIa/2MyHkFx8GqGDoBmvGCzJoZsPQQ448p9w7RHHK
	Ci0bkYqwH/t3VgQ3bZUe9dRkFsJp9nfbBBHBZsGudZsEZ+socwLfd2J7DJ5Sa2p9K31Z0STD5Kg
	aMspAqENzXJ50=
X-Received: by 2002:a05:622a:1451:b0:4e8:aff9:a7a8 with SMTP id d75a77b69052e-4e8aff9aa38mr85571831cf.52.1760958222030;
        Mon, 20 Oct 2025 04:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3ulAC5BvhoDz+6jrsrwTh0BMNZ8/dl/jE+ChosHXeyCGiP54CwsbF4BKvdsYJ7LNOOeCVAg==
X-Received: by 2002:a05:622a:1451:b0:4e8:aff9:a7a8 with SMTP id d75a77b69052e-4e8aff9aa38mr85571321cf.52.1760958221575;
        Mon, 20 Oct 2025 04:03:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deec11a7sm2433662e87.47.2025.10.20.04.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:03:40 -0700 (PDT)
Date: Mon, 20 Oct 2025 14:03:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 5/9] clk: qcom: Update TCSR clock driver for Kaanapali
Message-ID: <jr6qz23acm2ipspsvyxjpabg3b4bspapia2pqd7b2grrtvnct5@v7mjwnr5o6qa>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-5-29b02b818782@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-clk-v1-5-29b02b818782@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX2D3CdWNtiq6a
 KJbmgo8WK92QIzrUtcsjXJAbK642HBiw885YE1+etexBGQ0MSCzHjtu5TB5hwMiFdCYLD1Nzm4W
 bCe+tE2wa4SJmpr5OzP4AuHEkkgU1/5vctsY6jIYLCyFNNGx9nHyqUngDNqrfoYLo2Nh3lUFEup
 ivkFAGASI957crdQ6AlXHvkUszFl0+mb0yrm7PETo+cS5nVlDiEdSStE3F19956ludCQ2U1CwQc
 mv8T2Xe0NiQlyyhE7sfTqpt0BbX0YLbRBgx/9dhjcye7rkxENSbNkBUpd1ovQQ0z7+pQgbSuVQ7
 tXQ+qU9JJAiLJH3Sjn2QvvXxdZ+UAKeo50TvWNQ9v1uT5W6RMECOG8G3muvUw/RGLfWAGnMNFMJ
 uC07URL/Qdm1OA89HxhrGcwkZrF5RA==
X-Proofpoint-GUID: ffrzlTNkNUUaq1FaSC1pt-1d--CZi6oc
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f6170e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=h2OAjeu8WJ8lyUsXYpwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ffrzlTNkNUUaq1FaSC1pt-1d--CZi6oc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On Wed, Sep 24, 2025 at 03:58:57PM -0700, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> The TCSR clock controller found on Kaanapali provides refclks for PCIE, USB
> and UFS. Update the SM8750 driver to fix the offsets for the clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/tcsrcc-sm8750.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/tcsrcc-sm8750.c b/drivers/clk/qcom/tcsrcc-sm8750.c
> index 242e320986ef..f905f3824d7e 100644
> --- a/drivers/clk/qcom/tcsrcc-sm8750.c
> +++ b/drivers/clk/qcom/tcsrcc-sm8750.c
> @@ -100,21 +100,51 @@ static const struct regmap_config tcsr_cc_sm8750_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +static const struct regmap_config tcsr_cc_kaanapali_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x18,
> +	.fast_io = true,
> +};
> +
>  static const struct qcom_cc_desc tcsr_cc_sm8750_desc = {
>  	.config = &tcsr_cc_sm8750_regmap_config,
>  	.clks = tcsr_cc_sm8750_clocks,
>  	.num_clks = ARRAY_SIZE(tcsr_cc_sm8750_clocks),
>  };
>  
> +static const struct qcom_cc_desc tcsr_cc_kaanapali_desc = {
> +	.config = &tcsr_cc_kaanapali_regmap_config,
> +	.clks = tcsr_cc_sm8750_clocks,
> +	.num_clks = ARRAY_SIZE(tcsr_cc_sm8750_clocks),
> +};
> +
>  static const struct of_device_id tcsr_cc_sm8750_match_table[] = {
> -	{ .compatible = "qcom,sm8750-tcsr" },
> +	{ .compatible = "qcom,kaanapali-tcsr", .data = &tcsr_cc_kaanapali_desc},
> +	{ .compatible = "qcom,sm8750-tcsr", .data = &tcsr_cc_sm8750_desc},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, tcsr_cc_sm8750_match_table);
>  
>  static int tcsr_cc_sm8750_probe(struct platform_device *pdev)
>  {
> -	return qcom_cc_probe(pdev, &tcsr_cc_sm8750_desc);
> +	const struct qcom_cc_desc *desc;
> +
> +	desc = device_get_match_data(&pdev->dev);
> +
> +	if (device_is_compatible(&pdev->dev, "qcom,kaanapali-tcsr")) {
> +		tcsr_ufs_clkref_en.halt_reg = 0x10;
> +		tcsr_ufs_clkref_en.clkr.enable_reg = 0x10;
> +
> +		tcsr_usb2_clkref_en.halt_reg = 0x18;
> +		tcsr_usb2_clkref_en.clkr.enable_reg = 0x18;
> +
> +		tcsr_usb3_clkref_en.halt_reg = 0x8;
> +		tcsr_usb3_clkref_en.clkr.enable_reg = 0x8;
> +	}

Granted the size of the driver, it doesn't feel like these two entries
belong to the same driver. Please split it to a separate one.

> +
> +	return qcom_cc_probe(pdev, desc);
>  }
>  
>  static struct platform_driver tcsr_cc_sm8750_driver = {
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

