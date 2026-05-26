Return-Path: <linux-arm-msm+bounces-109738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EzOIG9OFWpMUQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:40:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F7E5D1CBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20147302B801
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788133CBE80;
	Tue, 26 May 2026 07:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GrVsDiUs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mzb02KZa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD4A3CBE70
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781162; cv=none; b=jK/uj+8TeCmw4bCm8A5U2ioP2mo90sGZB06AMgoO9VNbgkbfI+N8rknrDhxD/ZOMKzOcX9SBlq6FP4+catqD2JF6KpJt4H1HmMBDfuSDZYLoacuPnQ8uhosVFfOKg2RXAlXgV37llbzlbbr3FzhOhIVidh4f5Wf0ime478yBq1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781162; c=relaxed/simple;
	bh=fTBZX7qmEfoURKi4eOdaKpTbFlFF5yBy5zpDJUrDVSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsMOxrvCtCWmzPAmeFQcvHTa0V1Fiq7q0/XZXRMiwn9Op3l+yEb5KoMabWxWWB4W7dyaiWmrPe+MnrbElww/6m1NEVlEp/dKjupnkuaHFd3a7QtqnHB0KSvtbighr7Xqg+XBGEUo+YYxgaPoTt4TQ0j+/GSdfEHUbNg0L4weIuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GrVsDiUs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mzb02KZa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6QWmB2145988
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5fnbdjhmOvhvJ+5fIRBP9A8J50pilvs8/nVA1VxGjc=; b=GrVsDiUsqm28P5hL
	3K+hes8YJtYdAIR9q3dMoDxHmpQ2K0dQ3w1DJnNzaLhUa+poSTwQOjhl8VuU3mqJ
	7yNGa++3TUoZ0igM2PgZ7QhzIfu4ez3JAjPpurYR67EjqMvle3W2JyHZTkbHQWKh
	nmHOkyy/n2oTtj4YhdiWIe6xybp7ZXbpNh96L064axZg89VghWxRmI0LoFAAJMQG
	k6i5rbzA3MFIwsA0svoZynzlGqRpSwem8453y61DxaUB0rYO3CJ2Y7HDuPeiBu+r
	5ySMpx3iZC2AGZ13yyp2x4FUfd8/VOmanDEZrLoakrANhVcVYl6e/SqPPsmYw7z4
	YtozXQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv3gpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:39:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368f2d76b04so9367864a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781159; x=1780385959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r5fnbdjhmOvhvJ+5fIRBP9A8J50pilvs8/nVA1VxGjc=;
        b=Mzb02KZa6xHc8BuvDFzBzKyqgCefYKJWd41QhIDg7dMINJd9yT6XJh+RN79Hn/yjLm
         EmdG7F5aCaP2YfJ9lrs3iaXazYHoaXrsJ2F/6G6VtFqP1fBXnDRnQiAPver24b64uqQ5
         vTCLFBpiyM2mTvq7ZQ2z8quDIr/ad6KF5Lme9HBr371qZYU6xv5LbiMjYeYjuzwoGM4k
         n2G6uYpNNvL6IczYgVDnBDCb8zc3avUPS/6lpAPemVLDVjiDXV1oasuuHqjmrwaiMe8S
         A5BMazBZzygnBc+yq0aZolhTTRTegMDq53i8jzE/nNO7IjVpZ9lplU9Fg9RU8u1s5p10
         LkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781159; x=1780385959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5fnbdjhmOvhvJ+5fIRBP9A8J50pilvs8/nVA1VxGjc=;
        b=qVuzfyzEIlB+NhJoGUo9NgtGe6X5LIFNyUdDULT3LWvOtm/kaO9U7NI8ZFpMbQxiME
         uzqdNkf9Z/M73qPw7JwCrkphUw73S7eIN6iWddJ97QF2BD3Zk1NaNiE3TUDpH3hyJRQ0
         iD+UQ216QIOl+/LfK7lt0fho+hZbIE+GDtGaPShx9R2hygvo7if2cA45k3XB45mBJ9Cr
         5ZYCJz8V9yUmKIFc63W5r8TGtUm4H3y8o1uoOocKEiyGGcqtT6OKF55cmD2fPy+3Yr3l
         fj0D1Ka2DEs5aGoF4BZYZ+ca0MeFC42vmJ7XblroT/XAIJEvzFqSfMe6NbEVK0UNjjAq
         Tv5w==
X-Forwarded-Encrypted: i=1; AFNElJ/qQ6zFy7OCOpEscFrv1mbv96JfHF5B61Evt03j2marj57p+//NrBo+R8HtJPzDk3keDx04YC2IyckXV5uW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5pd477ZQaiBGVyJO8waBUofnj6tPEDbu1Wr88qP9fLPTUnrt9
	t12zpuqu4MXFUXvdus2YCofBUJlCF1/2cLM/gqtjnUTEyY+8TTLcIbl16/UmGqAit0AfYW/xN53
	eYOf7iC5d7yDE+2LhB+ci7TN06OuRNyoz/8VHkC4vrzvLP/L4ma6Jv/O9Efdxbn0/1YfY
X-Gm-Gg: Acq92OGDz3PScMCZ0lM3xSGsg2X1hBiGzFi9QN53M/+tlZyqdqWv8eb3tlMcWdWgleD
	dupmFwV1MV27LXNstu9f7kTE+37Dve48G5m7jnjx+3HRQ6/PGpTFkv8QZ/88ie+T5eIRp9/g7qY
	2PF6gIVYWmBOleAUKLUl6ZTmgdX8qgmxNbv7x5pKefwzCOxUqKoBUR5OF16zqEDe//YU6pt/5PZ
	ROXfQhJLaFkkP8PO5tkJE8aJkGrZjEB7KbIyycFMlikA4LxOzDP4P9dTx+j+rOPLu+w9yZN1YER
	jHH0RjjPSjH/iuy7et+x2mtZNSZdnFAm29goHnxQoMCHo30HMLjtRt55nQrNBHgdLjRafCo/UCS
	CUv7761VfbyuMWOO/BJ95F76DrrbP119jOVA6OUx/m1SRTV1rfeoeQFJ/H90=
X-Received: by 2002:a17:90b:3887:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-36a6787b0dcmr17010593a91.23.1779781159329;
        Tue, 26 May 2026 00:39:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3887:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-36a6787b0dcmr17010570a91.23.1779781158709;
        Tue, 26 May 2026 00:39:18 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b014b5691sm1477915a91.7.2026.05.26.00.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:39:18 -0700 (PDT)
Message-ID: <0993456c-40ed-4fc2-b9a8-036cca928709@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:09:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: mp8899: Add MPS MP8899 PMIC regulator
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Saravanan Sekar <sravanhome@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
References: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
 <20260519-mp8899-regulator-driver-v1-2-30d14421b7f1@oss.qualcomm.com>
 <20260520-luminous-tacky-swallow-a455d3@quoll>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260520-luminous-tacky-swallow-a455d3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NCBTYWx0ZWRfX9qL5Et12X/Ws
 a2pCIalUV5H+RqHQ/mOFcxeByLLjMPqSwWD5pH5lqjkJJtlqdsHHxxG95lEUno7iZ4OeQetJ4/F
 zL31//3XxT0r5mQ+5iFLbq5jZvB+4rFO/uq/8Jf7wur694Rmae4oIMuj9FyUenza//XUBAtgbLx
 Gh2m4JTN4H6xcpo0MNsgZaa0q/m8aKhlb59r0G//+AMqKGgetSh2hRkCdGHTKU/zw0SrrH83eSm
 6QTh6js71j0TwUyVKujc9gRE8bImclRj6w4KU79EaKtRPfPsjPuPRXbMnymXYvgqrvLB+QMAm31
 iUtlWUJZyCF5Zya6n3x+hEyMPuLcarBfA+E/8bQKQ5iNS+GOVs1A7JcNIi3Yw9D5T0Hry28fVUs
 wBrydj9pXBg5j96h8GErF89s3S/0tuoe64waUvjAKnwe4NY4l7fyh3E/6ScLM+rM1tioMWAl5ts
 O+vIsnd1COatp23zaJQ==
X-Proofpoint-GUID: CxK1jFWF32qyy2r1kwllnVe8Llv7b47l
X-Proofpoint-ORIG-GUID: CxK1jFWF32qyy2r1kwllnVe8Llv7b47l
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a154e28 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=-_Rh7rd7gJ8HNGbgI7UA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260064
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109738-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F2F7E5D1CBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/2026 4:09 PM, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 11:51:06PM +0530, Vignesh Viswanathan wrote:
>> +static int mp8899_parse_cb(struct device_node *np,
>> +			   const struct regulator_desc *desc,
>> +			   struct regulator_config *config)
>> +{
>> +	struct mp8899_regulator_info *info = config->driver_data;
>> +	struct regulator_desc *rdesc;
>> +	int buck_id = desc->id;
>> +	int ret;
>> +	u8 val;
>> +
>> +	/* Read buck phase delay from DTS */
>> +	ret = of_property_read_u8(np, "mps,buck-phase-delay", &val);
> 
> NAK

Will Drop this property as this is not used.
> 
>> +	if (!ret) {
>> +		ret = regmap_update_bits(config->regmap,
>> +					 MP8899_BUCK_REG(buck_id, MP8899_BUCK1_CTL1),
>> +					 MP8899_PHASE_DELAY_MASK,
>> +					 (val & 3) << MP8899_PHASE_DELAY_SHIFT);
>> +		if (ret) {
>> +			dev_err(config->dev, "Failed to set phase delay for buck%d: %d\n",
>> +				buck_id + 1, ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	/* Read buck soft start from DTS */
>> +	ret = of_property_read_u8(np, "mps,buck-softstart", &val);
>> +	if (!ret) {
>> +		rdesc = &info->rdesc[buck_id];
>> +		rdesc->soft_start_val_on = (val & 3) << MP8899_SOFT_START_TIME_SHIFT;
>> +	}
>> +
>> +	/* Read buck soft stop enable and configuration from DTS */
>> +	if (of_property_read_bool(np, "mps,buck-softstop-enable")) {
>> +		/* Enable soft stop */
>> +		ret = regmap_update_bits(config->regmap,
>> +					 MP8899_BUCK_REG(buck_id, MP8899_BUCK1_CTL2),
>> +					 MP8899_SOFT_STOP_EN_MASK,
>> +					 MP8899_SOFT_STOP_EN_MASK);
>> +		if (ret) {
>> +			dev_err(config->dev, "Failed to enable soft stop for buck%d: %d\n",
>> +				buck_id + 1, ret);
>> +			return ret;
>> +		}
>> +
>> +		/* Read soft stop timing configuration */
>> +		ret = of_property_read_u8(np, "mps,buck-softstop", &val);
>> +		if (!ret) {
>> +			ret = regmap_update_bits(config->regmap,
>> +						 MP8899_BUCK_REG(buck_id, MP8899_BUCK1_CTL2),
>> +						 MP8899_SOFT_STOP_TIME_MASK,
>> +						 val & 3);
>> +			if (ret) {
>> +				dev_err(config->dev, "Failed to set soft stop timing for buck%d: %d\n",
>> +					buck_id + 1, ret);
>> +				return ret;
>> +			}
>> +		}
>> +	}
>> +
>> +	/* OVP disable configuration */
>> +	if (of_property_read_bool(np, "mps,buck-ovp-disable")) {
>> +		ret = regmap_update_bits(config->regmap,
>> +					 MP8899_BUCK_REG(buck_id, MP8899_BUCK1_CTL1),
>> +					 MP8899_VOUT_OVP_EN_MASK, 0);
>> +		if (ret) {
>> +			dev_err(config->dev, "Failed to disable OVP for buck%d: %d\n",
>> +				buck_id + 1, ret);
>> +			return ret;
>> +		}
>> +		dev_info(config->dev, "OVP disabled for buck%d\n", buck_id + 1);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * mp8899_parse_dt() - Parse global device tree properties
>> + * @dev: Device pointer
>> + * @info: Pointer to mp8899_regulator_info structure
>> + *
>> + * Parses global device tree properties that apply to all buck converters,
>> + * such as switching frequency configuration.
>> + */
>> +static void mp8899_parse_dt(struct device *dev,
>> +			    struct mp8899_regulator_info *info)
>> +{
>> +	struct device_node *np = dev->of_node;
>> +	int ret;
>> +	u8 freq;
>> +
>> +	np = of_get_child_by_name(np, "regulators");
>> +	if (!np) {
>> +		dev_err(dev, "missing 'regulators' subnode in DT\n");
>> +		return;
>> +	}
>> +
>> +	/* Read switching frequency from DTS */
>> +	ret = of_property_read_u8(np, "mps,switch-freq", &freq);
> 
> NAK, you don't have such property. Test your DTS first.
> 
> This is not really acceptable quality of a driver.

Will Drop this property as this is not used.

> 
>> +	if (!ret) {
>> +		ret = regmap_update_bits(info->regmap, MP8899_SYSTEM2,
>> +					 MP8899_FREQ_MASK,
>> +					 (freq & 7) << 5);
>> +		if (ret)
>> +			dev_err(dev, "Failed to set switching frequency: %d\n", ret);
>> +	}
>> +
>> +	of_node_put(np);
>> +}
>> +
>> +/* Initialize debugfs for reg_addr and reg_value only */
>> +static void mp8899_debugfs_init(struct mp8899_regulator_info *info,
>> +				struct i2c_client *client)
>> +{
>> +	char name[16];
>> +
>> +	/* Create root debugfs directory: /sys/kernel/debug/mp8899-<bus>-<addr> */
>> +	snprintf(name, sizeof(name), "mp8899-%d-%04x",
>> +		 client->adapter->nr, client->addr);
>> +	info->debugfs_root = debugfs_create_dir(name, NULL);
>> +	if (IS_ERR_OR_NULL(info->debugfs_root)) {
>> +		dev_warn(info->dev, "Failed to create debugfs root directory\n");
> 
> No, drop

Ack. Will drop entire debugfs in next patchset.
> 
>> +		info->debugfs_root = NULL;
>> +		return;
>> +	}
>> +
>> +	/* Create generic register access files at root level */
>> +	debugfs_create_file("reg_addr", 0644, info->debugfs_root, info,
>> +			    &mp8899_debugfs_reg_addr_fops);
>> +	debugfs_create_file("reg_value", 0644, info->debugfs_root, info,
>> +			    &mp8899_debugfs_reg_value_fops);
>> +}
>> +
>> +/* Cleanup debugfs */
>> +/**
>> + * mp8899_debugfs_exit() - Cleanup debugfs interface
>> + * @info: Pointer to mp8899_regulator_info structure
>> + *
>> + * Removes all debugfs entries created for the MP8899 device.
>> + */
>> +static void mp8899_debugfs_exit(struct mp8899_regulator_info *info)
>> +{
>> +	debugfs_remove_recursive(info->debugfs_root);
>> +}
>> +
>> +/**
>> + * mp8899_identify_device() - Verify MP8899 device presence
>> + * @info: Pointer to mp8899_regulator_info structure
>> + *
>> + * Reads and validates the vendor ID from SYSTEM4 register to confirm
>> + * the device is a genuine MP8899 PMIC.
>> + *
>> + * Return: 0 on success, -ENODEV if vendor ID doesn't match
>> + */
>> +static int mp8899_identify_device(struct mp8899_regulator_info *info)
>> +{
>> +	unsigned int vendor_id;
>> +	int ret;
>> +
>> +	ret = regmap_read(info->regmap, MP8899_SYSTEM4, &vendor_id);
>> +	if (ret) {
>> +		dev_err(info->dev, "Failed to read vendor ID: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	vendor_id = (vendor_id & MP8899_VENDOR_ID_MASK) >> 4;
>> +	if (vendor_id != MP8899_VENDOR_ID_VALUE) {
>> +		dev_err(info->dev, "Invalid vendor ID: 0x%x\n", vendor_id);
>> +		return -ENODEV;
>> +	}
>> +
>> +	dev_dbg(info->dev, "PMIC MP8899 device detected\n");
>> +	return 0;
>> +}
>> +
>> +/**
>> + * mp8899_i2c_probe() - I2C driver probe function
>> + * @client: I2C client device
>> + *
>> + * Initializes the MP8899 PMIC driver:
>> + * 1. Allocates driver data structures
>> + * 2. Initializes I2C regmap interface
>> + * 3. Verifies device identity
>> + * 4. Parses device tree configuration
>> + * 5. Read the BUCK1_CTL3 register of each buck and configure the linear ranges accordingly
>> + * 6. Registers regulator devices
>> + *
>> + * Return: 0 on success, negative error code on failure
> 
> Why do you have kerneldoc for probe? Actually - why do you have
> kerneldoc everywhere?
> 
Ack, will drop.

>> + */
>> +static int mp8899_i2c_probe(struct i2c_client *client)
>> +{
>> +	struct mp8899_regulator_info *info;
>> +	struct regulator_config config = {};
>> +	struct device *dev = &client->dev;
>> +	struct regulator_dev *rdev;
>> +	struct regmap *regmap;
>> +	unsigned int vout_select;
>> +	int i, ret;
>> +
>> +	info = devm_kzalloc(dev, sizeof(struct mp8899_regulator_info), GFP_KERNEL);
> 
> This is some very old code. If you were working on upstream, you would
> notice that syntax is sizeof(*). But NOW the syntax is even simpler: kzalloc_obj().

Ack, will fix this.
> 
> 
>> +	if (!info)
>> +		return -ENOMEM;
>> +
>> +	/* Allocate separate regulator_desc array for dynamic configuration */
>> +	info->rdesc = devm_kmemdup(dev, mp8899_regulators_desc,
>> +				   sizeof(mp8899_regulators_desc), GFP_KERNEL);
>> +	if (!info->rdesc)
>> +		return -ENOMEM;
>> +
>> +	info->dev = dev;
>> +
>> +	regmap = devm_regmap_init_i2c(client, &mp8899_regmap_config);
>> +	if (IS_ERR(regmap))
>> +		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to allocate regmap\n");
>> +
>> +	info->regmap = regmap;
>> +	i2c_set_clientdata(client, info);
>> +
>> +	/* Identify the device */
>> +	ret = mp8899_identify_device(info);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Parse device tree properties */
>> +	if (client->dev.of_node)
>> +		mp8899_parse_dt(&client->dev, info);
>> +
>> +	/* Configure linear ranges for each buck based on VOUT_SELECT */
>> +	for (i = 0; i < MP8899_MAX_REGULATORS; i++) {
>> +		ret = regmap_read(info->regmap,
>> +				  MP8899_BUCK_REG(i, MP8899_BUCK1_CTL3),
>> +				  &vout_select);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to read VOUT_SELECT for buck%d: %d\n", i + 1, ret);
>> +			return ret;
>> +		}
>> +
>> +		if (vout_select & MP8899_VOUT_SELECT_MASK) {
>> +			/* 1.0mV step mode */
>> +			info->rdesc[i].linear_ranges = mp8899_buck_ranges_1000uv;
>> +			info->rdesc[i].n_linear_ranges = ARRAY_SIZE(mp8899_buck_ranges_1000uv);
>> +			info->rdesc[i].n_voltages = MP8899_N_VOLTAGES_1MV;  /* 3201 voltages */
>> +			dev_dbg(dev, "Buck%d: 1.0mV step mode\n", i + 1);
>> +		} else {
>> +			/* 0.5mV step mode */
>> +			info->rdesc[i].linear_ranges = mp8899_buck_ranges_500uv;
>> +			info->rdesc[i].n_linear_ranges = ARRAY_SIZE(mp8899_buck_ranges_500uv);
>> +			info->rdesc[i].n_voltages = MP8899_N_VOLTAGES;  /* 3296 voltages */
>> +			dev_dbg(dev, "Buck%d: 0.5mV step mode\n", i + 1);
>> +		}
>> +	}
>> +
>> +	config.dev = dev;
>> +	config.regmap = regmap;
>> +	config.driver_data = info;
>> +
>> +	/* Register regulators */
>> +	for (i = 0; i < MP8899_MAX_REGULATORS; i++) {
>> +		rdev = devm_regulator_register(dev, &info->rdesc[i], &config);
>> +		if (IS_ERR(rdev))
>> +			return dev_err_probe(dev,
>> +					     PTR_ERR(rdev),
>> +					     "Failed to register regulator %d\n",
>> +					     i);
>> +
>> +		info->rdev[i] = rdev;
>> +	}
>> +
>> +	/* Initialize debugfs interface */
>> +	mp8899_debugfs_init(info, client);
>> +
>> +	/* Register panic notifier for PMIC state dump */
>> +	info->panic_notifier.notifier_call = mp8899_panic_handler;
>> +	info->panic_notifier.priority = 0;
>> +	ret = atomic_notifier_chain_register(&panic_notifier_list, &info->panic_notifier);
>> +	if (ret)
>> +		dev_info(dev, "Failed to register panic notifier: %d\n", ret);
>> +
>> +	dev_info(dev, "MP8899 regulator driver registered successfully\n");
> 
> Drop

Ack.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * mp8899_i2c_remove() - I2C driver remove function
>> + * @client: I2C client device
>> + *
>> + * Cleanup function called when the driver is unloaded:
>> + * 1. Unregister panic handler from notifier chain
>> + * 2. Cleanup debugfs interface
>> + *
>> + * Return: 0 on success
>> + */
>> +static void mp8899_i2c_remove(struct i2c_client *client)
>> +{
>> +	struct mp8899_regulator_info *info = i2c_get_clientdata(client);
>> +
>> +	/* Unregister panic handler */
>> +	atomic_notifier_chain_unregister(&panic_notifier_list, &info->panic_notifier);
>> +
>> +	/* Cleanup debugfs */
>> +	mp8899_debugfs_exit(info);
>> +
>> +	dev_info(&client->dev, "MP8899 PMIC regulator driver removed\n");
> 
> Really, drop. We really do not print such messages in upstream. Look at
> other drivers.

Ack, will address all this in next version,

Thanks,
Vignesh
> 
> Best regards,
> Krzysztof
> 


