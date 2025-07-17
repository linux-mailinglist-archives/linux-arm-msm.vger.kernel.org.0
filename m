Return-Path: <linux-arm-msm+bounces-65461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC8FB08D43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3CDE160D5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29112C324F;
	Thu, 17 Jul 2025 12:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTt8Rb9z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0A428C013
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756243; cv=none; b=Jfo+/25HCrOxq+OHlA/FPr5h21LGEemxykCvbVJAa//1hj1mq3WZmeXW+dfV2JT9MsnZL5RatrVB7h2ThM8UokzOCoBppXBO1SYl5xRnJh3QqF/3cKck0s1xfzzaDmiPcn45JKAFVbQsPG2s2nALESEBoC5xLYkZvAZwTMtXS8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756243; c=relaxed/simple;
	bh=5YAxCO/nMYADZpzMqGP2RXDVPA7L+CQdVDyQ3ZY2adk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDI4fU2QEFmeXidr9LwLjbSPP/hzTgyP6Kv2wD103cE6FzMTwZLtOg+g5E2NZcKbBdpeNO6aYRCiSrFY5mFLKFjbNqjrximCNWF9c33fFdyOYx3SpsGh9jNczAGfmAhh6JKC19/KKykrlnHlAxH6NeT2FCHSNlA+3LpssC/fZPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTt8Rb9z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HBw9OH009576
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUDmYSo/2gAHIWN9kLymQe78KUXt7QSmAlIV3oGhIAI=; b=pTt8Rb9zNeXZG6Sy
	KQcI5r471XwizWu6JdYX4qXjjjByUqsIk0MVI0SsidylXCAmEBDlHsPWrcsYxw4L
	M8HaVl6Pf2xA2ydGA3DERMU0YIiGJIJoIZWzjt7S02eBGiDgrsw8oPK+TXj00ob9
	RIStiH7ihlkw6QFTkIEclVz8F/XNG1WNoeRQlBwhHoEVV14rr6o98IeavR+Ojtv8
	Dh57Q592knzLyxLN1ARN+/0oFBGKkUSCj1QJU/lfW7PrsEbBjjxy2p0WGJwURnu3
	Yy00pdTjoW+ukPoPjXX/MH/ThzA2LM2LbsDENMvI0PseAQAn+CH/SW9GbBHn4Qol
	TEUjYA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb7nej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:44:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7dea65840b8so14765985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 05:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756240; x=1753361040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUDmYSo/2gAHIWN9kLymQe78KUXt7QSmAlIV3oGhIAI=;
        b=vHBHEPCT8CbC7A+3WL0wHNMu3oDJnmHIiYo3Me9f9Pju0t1Rk1u1pLYmrbPPOtLH9I
         rkGh39lH39XQ4TcgrKhgiftumfVCCOHqEfJJTkCHwtobv8ekdOvXEvntisPmZ2yZGRrb
         kN7nScF8c5Shj1zPgClQocnXhsmS+BHiRaqi2FaSS/csK9/bKUsBpcMtDnOb7ewGaOs0
         k1Jxgxw05NQ1UPwCicWgQ6BxTrKxjLuL7TgWcDkgaP66bKfmqZpLIHur88HfwCtD2Vsb
         WLcCQirqCd/58OA/5gvSR0/Ftg4JXNH0bgnjPEADcbR7yjVSLYTEBgVrLMaGWoc6s4Ow
         7gSg==
X-Forwarded-Encrypted: i=1; AJvYcCUpn4DxE2qBqHuqbDkru+D2t8BFMSmG1muSnFssl5yqvn7e9gH2zgUFxlf8txpttFRAwVKAko6OIAFL84Gg@vger.kernel.org
X-Gm-Message-State: AOJu0YwDodebadmQa/sq3/p8kjQH5B3Hxh+1vVncaYX3nc8cL08mNobw
	ioWOCpNM1Sk0jHapXzKDZOYm7QQJhyYaxPyS2IEj8bdUIdij9sZg5o3ilkslnc2cJ/aoWqRJitJ
	5r4izxIVP+43HmbqDEpvfkCwo237IEwFOPHJjLj0/lTfAguoN3ED9GKPAlvUBRipbqhR3
X-Gm-Gg: ASbGncuL64zv6xlVqjQlGPgjxVAU0P51KGI4aFUpPOHeVRMbdIhPJFl8dW26FuHSYgQ
	Co53HP1w5zp4Cy/EjWhGUvvmjXYX2ocaulceQwXqGL0ZPETJsF9hLii2s4y/fmduaE+ZzXEOVm2
	qn0Ab57pve6zqNajcOxW1C3KMo0VTLl3E0Dqko5hgAye4poqvo+sdm2P8I8OZ8Te4/9ZH313Gap
	yHdMrEEGTYvOVdoYqrxIWtfE/cmV1t0wwmwMAwWskB81qXNGPFuIQio5mJrwN6MYwHyGuaRrFq3
	j8tIJQgNCXmg0Ll/WSZsuWUbUjLqxBf3B1vPXgazGvH/e5SR3F/pOQio0XN5hzgK3tJSI2r92n/
	aJtEzgZmO94pmBPchz5Ii
X-Received: by 2002:a05:620a:6292:b0:7e1:a4c7:a819 with SMTP id af79cd13be357-7e342b3eda3mr314828085a.11.1752756240289;
        Thu, 17 Jul 2025 05:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIsNr1DByBgmz9jCsvLegVhBR9mMg9jsyGYW5hHWVKe01fezGk+016s93Nf4grEADzp6dblQ==
X-Received: by 2002:a05:620a:6292:b0:7e1:a4c7:a819 with SMTP id af79cd13be357-7e342b3eda3mr314825985a.11.1752756239751;
        Thu, 17 Jul 2025 05:43:59 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611d8d54112sm9140441a12.1.2025.07.17.05.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 05:43:59 -0700 (PDT)
Message-ID: <449ac3c3-1f6a-4e69-899d-c4e4577714a4@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 14:43:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: qcom: camss: Add support for TPG common
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
 <20250717-lemans_tpg-v2-1-a2538659349c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-lemans_tpg-v2-1-a2538659349c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Xh97mFWG-rXQs4xVUWk5Ki2U6XPFjqrr
X-Proofpoint-ORIG-GUID: Xh97mFWG-rXQs4xVUWk5Ki2U6XPFjqrr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMSBTYWx0ZWRfX3OSpsnwQxZNn
 9HsajhpZjhQb1UeghLKuX2QpGCsTjGPSntQ2eQNRP/Wh86VRGemd6lhcPU9ou7J4obM4qn+pTnf
 OMdLavgmRdYWB+AxjQ5Xdl/K8v36R5UpAk9BNvE29cfzn1IzQxVd2iGnmFmE9hC/eqGy9nc0kd7
 CpQdaoUyU5LKOZoeeO2xfGSDPqJ7kSh8e9QSMlFZ/8afI6oPSkFdPN54pH4oZHFQCrDxtQwtemS
 cyQSQPmzBp+rprQO0tSuHxxl/LiezMTPZ0p9FZ5BFe3IB7QJnyNk1pSimb40ffyB87fJgIR6GXA
 fvmm1cfcAR24spLpaMNOnYebts/kCLhTmWImU6LNZqSrb5VMVh/7CLtYV/nU+q1DuLkSW3jPQjB
 vextSfESKi2EitTTOlEDwRIz/bNlb6dx9pZOPHAKsJRGeyTm7UhKCVQG5HAHbOVi6zZR5BFj
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6878f011 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=5dRrolKJAAAA:8 a=COk6AnOGAAAA:8
 a=DwyGLw2fmc7FY8CNMSkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=y3-2bcJ53AEkEa81XYCb:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170111

On 7/17/25 5:20 AM, Wenmeng Liu wrote:
> Add support for TPG common, unlike CSID TPG, this TPG can
> be seen as a combination of CSIPHY and sensor.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

[...]

> +++ b/drivers/media/platform/qcom/camss/camss-tpg.c
> @@ -0,0 +1,737 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-tpg.c

I think the filename is redundant, especially since it may change in
the future

[...]

> +const struct tpg_format_info *tpg_get_fmt_entry(const struct tpg_format_info *formats,
> +						unsigned int nformats,
> +						u32 code)
> +{
> +	unsigned int i;

https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/

> +
> +	for (i = 0; i < nformats; i++)
> +		if (code == formats[i].code)
> +			return &formats[i];
> +
> +	WARN(1, "Unknown format\n");
> +
> +	return &formats[0];

Err.. that doesn't seem right, neither WARN (which usually signifies
some sort of a critical condition or hw failure), nor returning a format
different to the one the user requested

We should probably return some kind of -EOPNOTSUPP

> +}
> +
> +/*
> + * tpg_set_clock_rates - Calculate and set clock rates on tpg module
> + * @tpg: tpg device
> + */
> +static int tpg_set_clock_rates(struct tpg_device *tpg)
> +{
> +	struct device *dev = tpg->camss->dev;
> +	int i, j;
> +	int ret;
> +
> +	for (i = 0; i < tpg->nclocks; i++) {
> +		struct camss_clock *clock = &tpg->clock[i];
> +		u64 min_rate = 0;
> +		long round_rate;
> +
> +		camss_add_clock_margin(&min_rate);
> +
> +		for (j = 0; j < clock->nfreqs; j++)
> +			if (min_rate < clock->freq[j])
> +				break;
> +
> +		if (j == clock->nfreqs) {
> +			dev_err(dev,
> +				"clock is too high for TPG\n");

I really insist you don't have to break this line

It would probably be useful to print the rates (the one that's too
high and the maximum)

> +			return -EINVAL;
> +		}
> +
> +		/* if clock is not available */
> +		/* set highest possible tpg clock rate */
> +		if (min_rate == 0)
> +			j = clock->nfreqs - 1;

Well, you never assign anything nonzero to min_rate..

[...]

> +static void tpg_try_format(struct tpg_device *tpg,
> +			   struct v4l2_subdev_state *sd_state,
> +			   unsigned int pad,
> +			   struct v4l2_mbus_framefmt *fmt,
> +			   enum v4l2_subdev_format_whence which)
> +{
> +	unsigned int i;
> +
> +	switch (pad) {
> +	case MSM_TPG_PAD_SINK:
> +		/* Test generator is enabled, set format on source */
> +		/* pad to allow test generator usage */

This is a very strange way to write multiline comments

[...]

> +	/* Memory */
> +	tpg->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
> +	if (IS_ERR(tpg->base))
> +		return PTR_ERR(tpg->base);
> +
> +	/* Interrupt */
> +	ret = platform_get_irq_byname(pdev, res->interrupt[0]);
> +	if (ret < 0)
> +		return ret;

The comments are unnecessary

Konrad

