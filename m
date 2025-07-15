Return-Path: <linux-arm-msm+bounces-64977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0F5B055D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7445D561ECD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB53E275B03;
	Tue, 15 Jul 2025 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHFOz9AI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E822D4B67
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752570319; cv=none; b=PCjAfynRJGWdTle0Lpg+l8RhneskrDS1eZHe70ugETxMYzhJdOhboMZ3P8RZKoRI7CprXTe8EYzmLxzfyZSpo9ak44bl7S6gQHcxWQqGjvBcC+f62yH+r3jvUKdgYuLpj55CMdNj+RAPWTo3XVxgxk8PnMmOXOOtDY6WD6pJG0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752570319; c=relaxed/simple;
	bh=5LBGdyccFs9/kSMj7gqptZEBRHBs0pXT46lCaRpnEU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrwrU5QI6zbzOfTDxQtBAN0qdYnhugR/oWazhxm+YRoLKOc+YNkKqxdivGRTSIJiXFOUu+IUTrdig9DMKro2inJNo6K7WFZy2fnki9EJIOMoQoaYIz2YcpDh/nUHLoMxcIF+ZsS6fGrV5hOvtMbxVc8Obyxwx4sVwc3TMbouD1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHFOz9AI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8nOBd002934
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X81G8SbDQbSTnHA7Tq+qXCtSDHk+zyIFbzLI6vGMtbM=; b=oHFOz9AIM1QxzQ33
	ewK8BgVpjT41RVa6X5zFWaAwDO/Rjs/49yTkz4ZQNeGfIiYy19HRhgepfbXMGSjb
	NdRwV614x4I6+6FFV9v/8IfioYfJpWknS9PCpZwpgEylpHvCjBhigXd1ztrFdD4T
	KCEjKseMYNzvFjQl+aTv814m+5gmfTy2Ew0ZlsuQlk9QeaX7k+Phu/pUxub24vTk
	RYhGWXdtjt/IOirpLCjmU9JX6O/QLwJsQWkbODs6MgaK2m/D+xBimXvcfdjYlvuQ
	VAwbmaqHMafDZ9GS2jCSCrbH9okOP7lu8A4vRDRt6tLI5s4ARglxlLXw0HhV/wLk
	wRwtKQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut7ep9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:05:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab77393308so6571271cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570316; x=1753175116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X81G8SbDQbSTnHA7Tq+qXCtSDHk+zyIFbzLI6vGMtbM=;
        b=R4WAOeecAKYIMNHFPx8feeMOxs6YURi+5JOntsb6AgheljHXOeFeXS/r3N9tFas34x
         m07V3t6MLd5DktpfUjd9bm2jgShT6Lln0jY/wAuxeRKlbkKjQUvdaoXYbPmDeZxuzV81
         6sqvC1MBsPWdwgJ9r0Us4s0FsasCJf3GuJub373+//QrQq9TVC4h4XjDE3QHjh4kuMZH
         8KqNp2oubdbKKu1SkVYAtdJCXdJgtZB6MnYZ+1w81oF1frvf4+1p6Um3PHxAPTCB2rSH
         ug5/nPKtC75nGqxGJSJKpjVLX9Oo3IHNFdqmB0GvoMDg7XyOx1aNRqO393bF0peFSP2A
         N+fw==
X-Forwarded-Encrypted: i=1; AJvYcCVaw+qUrPdJ4Eip5e11ww8jzs8i1ai1OXnMCiTlc3dZBfcppe7vNk+6ptnYW8BvyEchCu6AQjkLi+CH4vpx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+rkxNi7V9R34o747SIhRtsndJbxwFqY2VeOPnsUQIvxF92Gqr
	BfyCgXEHUAsIcEgeLGZFdlaRVPE2MMhsRfdkTKvC+VD/AcJKJ5dxEWfzCSeYZxnDeqHnFkL7ZYp
	vHTgh5HDFEnvnd18q+AbdYTRtwJFwbhoefGbfPbVFqnMP044BGAxRb9MG+cn+3rZXUbni
X-Gm-Gg: ASbGncuW0R+jY9ITOiM08TRwBQbMiNNXF6jmQZSyvl4CNJ11hNIFWtW9uhQRMYM5Qsa
	QRBCIzm5i8809sGPYMMkmyvRrbbzwcGJ6lxjMmjjib8wihtfkJehiIbufIiijjQ3W/heEjROwX5
	9SwlLNvipRe/i7Izjq1HolP3MskvBwWwhDfBJ8n+xTnBOAQYqgYoEwh15Ix9Uu/PdfpM4hGMJYG
	T0jWSlFU2q6RwrpaDhMgo4U57JTnlXhfth8I+G0wi1uA+oFQR+7eevVpQ+mHWTJRbYBBozq/Y9D
	v+kgUlcUBvj8jFX3fRXaElKCQKy6jNpDkYc3BSte7JFo94spNmXzGi/SnDuOZu51JedG5dpjGmo
	D1BourZopqreVrboH6FVd
X-Received: by 2002:a05:622a:1104:b0:4ab:5c58:bb25 with SMTP id d75a77b69052e-4ab86ddc86cmr4932671cf.1.1752570315555;
        Tue, 15 Jul 2025 02:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRYFCf9iDFpvwNaUhwvFmnJFfLgW9Y1m4vlzwNzKWO0OxKFu/BJa6T2F1S9r+efZbKvvtpAg==
X-Received: by 2002:a05:622a:1104:b0:4ab:5c58:bb25 with SMTP id d75a77b69052e-4ab86ddc86cmr4932471cf.1.1752570315140;
        Tue, 15 Jul 2025 02:05:15 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612067f7ca6sm4743760a12.55.2025.07.15.02.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:05:14 -0700 (PDT)
Message-ID: <03242c48-beb9-4ec1-8659-0cb8db9ef37d@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 11:05:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715-sm7635-clocks-v3-0-18f9faac4984@fairphone.com>
 <20250715-sm7635-clocks-v3-1-18f9faac4984@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250715-sm7635-clocks-v3-1-18f9faac4984@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=687619cc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=fWT5Z53OPIsgueDaOEIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 9WJHeFSXzF5gHt384fUQuT5CYG5uo2iM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA4MSBTYWx0ZWRfX9iwJ3hiThfbN
 asx8+mml/smdrALWkVUnDU+lXJCUDWntp7EdGNKwU5zySdk5ocOH/zPVU/T3yRkAXuOkKq6jGCR
 iiZLhcRXcwD5AJtXmkOA/aauvtRfTqqgumuYVZmlcwBB8wM4f+RSUT16GexCofEpdZNzV4J/csX
 +ADFzZ09uJFLqyYkHEnQDAUfly8/sGUuANvfOoPdOnjqKkq5aO5HUs2SvYobcusD+POyMKgwMS8
 jPrskeSJCPO/U8J7l3h+f7+nRpM1w2TeQ3+DxTkYhb/v3FTPjPwGAHhTUkE0UptmTbKvLPbiIKD
 OqRxD5n/1cSoPCJl4/kUKK5TUGgMm2S1ArNX+hgyClDb18eOoVAMBughryzWtbbrbjUqgV/L5CZ
 T2xPkc6uKlWUGmc1baKLtYMAAlYaW+uKZL4HWX1bWvPupqq0JwjVIgGqMp9zEGBR+tqXmDDS
X-Proofpoint-ORIG-GUID: 9WJHeFSXzF5gHt384fUQuT5CYG5uo2iM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150081

On 7/15/25 9:19 AM, Luca Weiss wrote:
> Add support to register the rcg dfs in qcom_cc_really_probe(). This
> allows users to move the call from the probe function to static
> properties.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/common.c | 10 ++++++++++
>  drivers/clk/qcom/common.h |  2 ++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index b3838d885db25f183979576e5c685c07dc6a7049..37c3008e6c1be1f083d0093d2659e31dd7978497 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -390,6 +390,16 @@ int qcom_cc_really_probe(struct device *dev,
>  			goto put_rpm;
>  	}
>  
> +	if (desc->driver_data &&
> +	    desc->driver_data->dfs_rcgs &&
> +	    desc->driver_data->num_dfs_rcgs) {

I suppose the last check isn't strictly necessary but it makes
sense to the reader so I'm not asking for a resend because of
that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> +		ret = qcom_cc_register_rcg_dfs(regmap,
> +					       desc->driver_data->dfs_rcgs,
> +					       desc->driver_data->num_dfs_rcgs);
> +		if (ret)
> +			goto put_rpm;
> +	}
> +
>  	cc->rclks = rclks;
>  	cc->num_rclks = num_clks;
>  
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 0f4b2d40c65cf94de694226f63ca30f4181d0ce5..953c91f7b14502546d8ade0dccc4790fcbb53ddb 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -30,6 +30,8 @@ struct qcom_cc_driver_data {
>  	size_t num_alpha_plls;
>  	u32 *clk_cbcrs;
>  	size_t num_clk_cbcrs;
> +	const struct clk_rcg_dfs_data *dfs_rcgs;
> +	size_t num_dfs_rcgs;
>  	void (*clk_regs_configure)(struct device *dev, struct regmap *regmap);
>  };
>  
> 

