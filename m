Return-Path: <linux-arm-msm+bounces-42079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA879F1150
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29FE1281B6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBD41E2854;
	Fri, 13 Dec 2024 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDUqG6+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58901DFE39
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734104946; cv=none; b=Hbe+FGAMJ1yBGvyYI0/YtcwWrATfVjeIboSjT0FrzdubqkOKGx8KT22jPxTzV4pchBdXYz30XHLNjkK3zIzZKEec85JKrgVjAlNmrYiAxjED9DOk5lK/uapxJXDYX7zDNsS3gZFl+bJk9/TSJmrHG41TdrkMhObu6GVwS4xlORw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734104946; c=relaxed/simple;
	bh=SUN86OTg3oSsKCRZVACrjqSmjlxZVvrn66k1sDZJlqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKd9OZLvxIaFYzXXf34Ugn8+RDwGQRUWsalTKnyMYcqlRUi5sskBUvd69GQ1qNwqbLiOI4uVBhMnF18MthoD+VPRvC15JT8mVldmO8FciZsoIvWhF6l2M1sdXk42OoVe6sq1Gya1fPLAoyS6hENafhNotSlLck7efN7XFOFsvG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDUqG6+E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDA3mjV012935
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJyiqMg7R2avm0R6ZZwjEI0oop3bR44+CCKR5spqj9U=; b=aDUqG6+EPgapuDPN
	2+2t/gOChzwwbn2G1AINxT3HHJJkmCj/ZMw1Hk4Wt2Rof3o5D4oO1/a6AsKb7p6P
	FnzmFks+euKaNggX7vTXOjMKRDzLBhxYW1ubq5QcRDspT9WdT3JpbYG6r3MoSRvY
	hdGGuft5hOg0MLJ7kC7bNZHOodO+jUZ6syu9B1QsPtp0NdeycewRmk58vCwTVn63
	rKKKe4MdDnXVejMl6zvlNHMYST/oEy8VOwaoGe8orjcycGgHQItPId3f+05Yfkdi
	3PFOjrd8PEhRKYRwcANyZ82675VeyUqx1r5pn+M3RvaqQalktNJAkPfBcZD034mh
	jgei+A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjudgyb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:49:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8eda4d80aso2461926d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 07:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734104942; x=1734709742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJyiqMg7R2avm0R6ZZwjEI0oop3bR44+CCKR5spqj9U=;
        b=ZICWH3EK0YN+Y78OTDHaKirOaFq9n82ycVIGDG5Pfmz114jYd0KaDWRJVDa/+bMMIb
         CTjnFWChvWQ8HGr3Zfl8fpCmVR19SmtimNGBuiciPnHxTetN0aALqwrlAS6knk48+W6d
         3/9rWUSecvHCV/N+1za8K2eeK1GyyBY1itx/DdFWfUIksGYOHhTCtN+sg/1pY/hVWVXh
         WXiMNQOto5V3dCwAK0ofThuyKnmhUd5DfjF8PIiuA7XaGLn4jOqj69b5u9scGfeCJfuf
         fUo7cGbmF3IP3bBN9efSZE9PN2qH4yqKBLro7JB6gZU0If1Ps3IyZzNn7W8MI2M2qtSN
         T2bg==
X-Forwarded-Encrypted: i=1; AJvYcCWGk6fe5OSuYjJj0grnzJqTxoJVZ94nx0SbEObGhIL6tj26GmsrDcPlOc+K4caFf+phnDc/UwqBy4tyv2C+@vger.kernel.org
X-Gm-Message-State: AOJu0YySW3vQy+miYD2gA63/tCvbOdqCmInYnRzhQM14nSVNn6gasJpv
	xL5vv6ub23vrIxPQv/76zMb52Wn6oYWJZkqbzxHqZsPo4HZs5vmCZy8kdEjUlc/PKuAzWO1G14w
	M5/1oI0TMPtKd9jHA54BKJP4Ge7L6CXyKfg70hiR30G0dabHiSmp8bfIsLsyuWJe0
X-Gm-Gg: ASbGncvwDJuw1pkT4QOhgX4tqn1k8TRqDYyEAAot7R3QUsbqWVZEloG7tKy0Vy954/A
	YyPEWEVa44hETlH+3rzF415WPNRg8y1yuuvypp5PJ6d0/FKQ8wU6Vk/qFEV5Lh8UMzMG7gxP5hW
	0y6NekwkQBAqkoHaF5Sx5IPGhi/OByyZtpemGeBKl0TnBLxN88gJCbVBOStqbMCc7voVsEY4Kd2
	vMdanudCHTC9IZhqWuIs9amdr4ACf/VJSUIT44L2RxVnsTl2LNacTyE/Mzg5W2Qh3WLDvgpEmws
	BVLzk7f25aqu6rc/wCiZT8fzhrArJjCoBEWd
X-Received: by 2002:ad4:5baa:0:b0:6d8:a091:4f52 with SMTP id 6a1803df08f44-6dc92b2eeffmr17583756d6.7.1734104941796;
        Fri, 13 Dec 2024 07:49:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGE+qB0FdfOJjWc+2QkxT9xY69wgePX46Wl2NvBYUy+KbqjiWFvYHVQDOK69Tnl2WZXI51+UQ==
X-Received: by 2002:ad4:5baa:0:b0:6d8:a091:4f52 with SMTP id 6a1803df08f44-6dc92b2eeffmr17583436d6.7.1734104941325;
        Fri, 13 Dec 2024 07:49:01 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68222d3c7sm755805266b.199.2024.12.13.07.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 07:49:00 -0800 (PST)
Message-ID: <cf2f2510-9d27-4473-bf50-45b14725f4c5@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 16:48:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/5] thermal: qcom: Add support for MBG thermal
 monitoring
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, quic_kamalw@quicinc.com,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
References: <20241212-mbg-v2-support-v2-0-3249a4339b6e@quicinc.com>
 <20241212-mbg-v2-support-v2-3-3249a4339b6e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212-mbg-v2-support-v2-3-3249a4339b6e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8Bo41LGuygEoKC9X9okY7OqjohTI1-Ag
X-Proofpoint-ORIG-GUID: 8Bo41LGuygEoKC9X9okY7OqjohTI1-Ag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130112

On 12.12.2024 5:11 PM, Satya Priya Kakitapalli wrote:
> Add driver for the MBG thermal monitoring device. It monitors
> the die temperature, and when there is a level 1 upper threshold
> violation, it receives an interrupt over spmi. The driver reads
> the fault status register and notifies thermal accordingly.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

[...]

> +static const struct mbg_map_table map_table[] = {

Is this peripheral/pmic-specific?

> +	/* minT	vtemp0	tc */
> +	{ -60000, 4337, 1967 },
> +	{ -40000, 4731, 1964 },
> +	{ -20000, 5124, 1957  },
> +	{ 0,      5515, 1949 },
> +	{ 20000,  5905, 1940 },
> +	{ 40000,  6293, 1930 },
> +	{ 60000,  6679, 1921 },
> +	{ 80000,  7064, 1910 },
> +	{ 100000, 7446, 1896 },
> +	{ 120000, 7825, 1878 },
> +	{ 140000, 8201, 1859 },
> +};
> +
> +static int mbg_tm_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
> +	int ret, milli_celsius;
> +
> +	if (!temp)
> +		return -EINVAL;
> +
> +	if (chip->last_thres_crossed) {
> +		pr_debug("last_temp: %d\n", chip->last_temp);

Use dev_dbg for consistency with the other debug prints

> +		chip->last_thres_crossed = false;
> +		*temp = chip->last_temp;
> +		return 0;
> +	}
> +
> +	ret = iio_read_channel_processed(chip->adc, &milli_celsius);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "failed to read iio channel %d\n", ret);
> +		return ret;
> +	}
> +
> +	*temp = milli_celsius;
> +
> +	return 0;
> +}
> +
> +static int temp_to_vtemp(int temp)
> +{
> +
> +	int idx, vtemp, tc = 0, t0 = 0, vtemp0 = 0;
> +
> +	for (idx = 0; idx < ARRAY_SIZE(map_table); idx++)
> +		if (temp >= map_table[idx].min_temp &&
> +				temp < (map_table[idx].min_temp + 20000)) {

Please align the two lines, tab width is 8 for kernel code

> +			tc = map_table[idx].tc;
> +			t0 = map_table[idx].min_temp;
> +			vtemp0 = map_table[idx].vtemp0;
> +			break;
> +		}
> +
> +	/*
> +	 * Formula to calculate vtemp(mV) from a given temp
> +	 * vtemp = (temp - minT) * tc + vtemp0
> +	 * tc, t0 and vtemp0 values are mentioned in the map_table array.
> +	 */
> +	vtemp = ((temp - t0) * tc + vtemp0 * 100000) / 1000000;

So you say vtemp = ... and the func is called temp_to_vtemp

> +	return abs(vtemp - MBG_TEMP_DEFAULT_TEMP_MV) / MBG_TEMP_STEP_MV;

But you end up returning a scaled version of it..
Please clarify that in the code


> +}
> +
> +static int mbg_tm_set_trip_temp(struct thermal_zone_device *tz, int low_temp,
> +						int temp)
> +{
> +	struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
> +	int ret = 0;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	/* The HW has a limitation that the trip set must be above 25C */
> +	if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
> +		regmap_set_bits(chip->map,
> +			chip->base + MBG_TEMP_MON2_MISC_CFG, MON2_UP_THRESH_EN);
> +		ret = regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
> +						temp_to_vtemp(temp));
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		dev_dbg(chip->dev, "Set trip b/w 25C and 160C\n");
> +		regmap_clear_bits(chip->map,
> +			chip->base + MBG_TEMP_MON2_MISC_CFG, MON2_UP_THRESH_EN);
> +	}
> +
> +	/*
> +	 * Configure the last_temp one degree higher, to ensure the
> +	 * violated temp is returned to thermal framework when it reads
> +	 * temperature for the first time after the violation happens.
> +	 * This is needed to account for the inaccuracy in the conversion
> +	 * formula used which leads to the thermal framework setting back
> +	 * the same thresholds in case the temperature it reads does not
> +	 * show violation.
> +	 */
> +	chip->last_temp = temp + MBG_TEMP_CONSTANT;
> +
> +	return ret;
> +}
> +
> +static const struct thermal_zone_device_ops mbg_tm_ops = {
> +	.get_temp = mbg_tm_get_temp,
> +	.set_trips = mbg_tm_set_trip_temp,
> +};
> +
> +static irqreturn_t mbg_tm_isr(int irq, void *data)
> +{
> +	struct mbg_tm_chip *chip = data;
> +	int ret, val;
> +
> +	scoped_guard(mutex, &chip->lock) {
> +		ret = regmap_read(chip->map,
> +			chip->base + MBG_TEMP_MON2_FAULT_STATUS, &val);
> +		if (ret < 0)
> +			return IRQ_HANDLED;
> +	}
> +
> +	if ((val & MON_FAULT_STATUS_MASK) & MON_FAULT_STATUS_LVL1) {
> +		if ((val & MON_POLARITY_STATUS_MASK) & MON_POLARITY_STATUS_UPR) {

Just checking the last argument to AND in both lines is enough, as
they're both parts of the bitfield

[...]

> +	ret = device_property_read_u32(chip->dev, "reg", &res);
> +	if (ret < 0)
> +		return ret;

return dev_err_probe(dev, ret, "Couldn't read reg property"\n);

> +
> +	chip->base = res;
> +
> +	chip->irq = platform_get_irq(pdev, 0);
> +	if (chip->irq < 0)
> +		return chip->irq;

Similarly here

> +
> +	chip->adc = devm_iio_channel_get(&pdev->dev, "thermal");
> +	if (IS_ERR(chip->adc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(chip->adc),
> +			       "failed to get adc channel\n");
> +
> +	chip->tz_dev = devm_thermal_of_zone_register(&pdev->dev, 0,
> +						chip, &mbg_tm_ops);
> +	if (IS_ERR(chip->tz_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(chip->tz_dev),
> +			       "failed to register sensor\n");

Please also make the error messages start with an uppercase letter

> +
> +	return devm_request_threaded_irq(&pdev->dev, chip->irq, NULL,
> +			mbg_tm_isr, IRQF_ONESHOT, node->name, chip);
> +}
> +
> +static const struct of_device_id mbg_tm_match_table[] = {
> +	{ .compatible = "qcom,spmi-pm8775-mbg-tm" },

I don't think the 'spmi' bit belongs here

Konrad

