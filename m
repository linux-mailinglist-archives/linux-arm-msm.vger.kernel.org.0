Return-Path: <linux-arm-msm+bounces-79987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA70C27ABC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 10:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B0DD34E068B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 09:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA5D2C026C;
	Sat,  1 Nov 2025 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+X20k/p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iuAjDA+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FE81FECBA
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761989156; cv=none; b=X7KDLnZ/hPJrcrEZfNpg9zhgTQzsmr8PA0JQC0n3be3AE7EWTZyMIwgGuzWVW1pkeecqEDOvMn6u54b/Y/UKGEbeb1M02invrQBYNPJZNLTiL4IuJqCpr157hC5YAyEfvPtGFYAP57P+LjzDjCahOXb9GnGUTqEp7d3OUfKUxME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761989156; c=relaxed/simple;
	bh=GwwnpboYaHnudYykCGugPFlSi8Smoy3YJMcmhihCSgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjYisrEuQoB2auySh2jkCXgJUwGWgeHQcF0LW6Io1cA8wKKzWsv8mloCdjA3Mf4iVTF3+tgq8GUQllCtKhKAFCd8LCCm7wp2qcbcgbatLgqQMCg7uUdX2+V+GjBRvCOitEevfULPSfE7HTxLH4tv2a+5Fbld8IJr1d/vU06fLJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+X20k/p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iuAjDA+s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A1290OG313000
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 09:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnkXSMepRXkY/RZL11HCIAs0Yv0GplpodbD8vz5uXYc=; b=I+X20k/povF1hHPJ
	l4nfZq0I75XUcY1hzy52o8Wr0dssM/8IBND4Cz9o1d2lgCO4ANADyQhMJPg6xSQt
	qaIx7onOL7piDQtRLfJFuohs/q6E5cs1hqmxLG2wbBAjbB7iwQwONgXUNyzi8cPq
	oP4pd+qjqbsNYvnUtSF4rm2OZWKFNWhCBPRwk9ibHlFDpYbSvbxp1+JJoGJmV0m7
	Z9JS8oIIfcfkp3lbfQds00E8vCsyEqWijnfngB1joUeqsmhwY1yp5Kyo1LFtIMJC
	Aq7f98aCyL53aI7XsSKPvgnEO8oYA0YTXBH/SnIgnF0IGvdzX2jpUZGRhVPo2Ir4
	42MVcA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a595rrgx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 09:25:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e89f4a502cso84522181cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 02:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761989153; x=1762593953; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jnkXSMepRXkY/RZL11HCIAs0Yv0GplpodbD8vz5uXYc=;
        b=iuAjDA+srv7ALubH7zvDCjmC4HRp3g1KfmetIa56od2xPwhxjmYQ0tJfJMXFSMFvOz
         Ll61zh7i/O9xn9ibRNFnq1qZbfUZ2mRqRg8woA+c2TUpPyfNjm2O4B3oVSDdT6FYHw9l
         24Fc/519ADQQZnWd9FMiOau1VZFXdFkb9hsSBZJNGaEFWMOnFKB3LvxwYV4FIYuZT0gi
         KvmUR/ac+HMzcldmp353HqjOWb/DPaDjiJtlPb+IegMTtp6H06JqJs9Df6keRk/G3JBz
         JiZBYzkv3SQLD4F8iQM5UNWUCJxzMk3414iH6zax0jA+5MoUTzgoID55jvCfemS2wyIS
         wraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761989153; x=1762593953;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnkXSMepRXkY/RZL11HCIAs0Yv0GplpodbD8vz5uXYc=;
        b=IQnc5KL05w4hG0uyCkpfAAcgXe7vVns7qjvadspx5BxHQFS9nGl+1D0njJHRWpvT2b
         ISiy7XHNMSe/iwpGZhalq7VNifjrshaoFFvzUjIhn+yVRzyGJMPFsLcaEnAtHqjy5st6
         PF38p2aS882QIZFhuhsLo9xtLHb3qjyw2FH/YomwqRNcTtS9FqOagMe7twtQfe5a4jwN
         sS4QQ/Etz2whmVW9KjaQM+FXMBFZMEsEGuNjiNvfkAovePydp/zWITGJwod1NeTKKc6b
         KneK62kJOloijkfLH2dAnTBRupe6gxQwpxZ0chAyIfNeFNl5FcK5qrdYsF5tw8eMJqTD
         sc9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnNlEfIVMTFXAIkq7guqhT4fj70moMHhwKzzQVMUgob0OovV/RI6PHLxz/LcVfz/4hZcjqZ/wXeOM4CnHm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Eq8gokJevvSk+baVaFszlvJVQ5G7obI/3m1N/WyuHQ8SYNBq
	YeZYGns+r2va4scaU4h3B3e+iXjXW0/l1PgAZ7Tzkld0bi2RuuX2H00AFTHFy0C2kFrBBVNT8kV
	dnEzTUGpk+sCtNAx632pgacV6qa/LcnXNA/mwJicU9yGgdbLid6pn2yAVrS+W2MsWDSsF
X-Gm-Gg: ASbGncte1OVuoYq4J3T6KnuJzrdDTKsEDQ9HVLz2ikQYAZENp0VQaklj0hgvF9FWanr
	X/I24+dof2OBJX6YbahPCZcqd5s/hhzLxxjrk0hdA/LTdNBL+U8XNoN4Li2fkSN96jLMeAddpE3
	SRxh7zXYMgYhts0tq01g9GUj2+nlAgbPLkf8YbqUBiolz2zgNWPhjdu14VlKptYOUzTe7y+cLM6
	5+exlFjyUqWn2XOqI0t2EucpTxVtoFFxOAfm7L8G3i2pa3L+PyzTVVFiQwiaPMjCx8CNUrEXz06
	uDh5T1kAUbOiJjiu/P0RllgOiub9w1Ehul68E7XtEtyjL+1410Vo7VN1/8c7qYoxAzl9HrWmUH6
	+DsQ8yrJ/SM6MLuk70CZjhSevebmSnXK7WPfXnKLMsZtYJcZ17+B6Z36F5P0AfIMeIDhk2AuLbX
	EzqJZAyu1gxThS
X-Received: by 2002:a05:622a:229f:b0:4ec:f654:8523 with SMTP id d75a77b69052e-4ed310a32b7mr83918071cf.72.1761989152744;
        Sat, 01 Nov 2025 02:25:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4NwLj5l7cffz8hfyugLHnlEbWc7oaVMrxGH96mxEp3id/NDhHkd8phffHygM+DrxSBRZWLg==
X-Received: by 2002:a05:622a:229f:b0:4ec:f654:8523 with SMTP id d75a77b69052e-4ed310a32b7mr83917871cf.72.1761989152277;
        Sat, 01 Nov 2025 02:25:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f39a6a7sm1085270e87.30.2025.11.01.02.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 02:25:51 -0700 (PDT)
Date: Sat, 1 Nov 2025 11:25:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: qcom-pm8xxx-xoadc: fix incorrect
 calibration values
Message-ID: <drqbd4yzvpcj5mauyees67a5vyfr4pt4lgm7npsye45smn2f3o@yyemg6qho7ut>
References: <20251028-pm8xxx-xoadc-fix-v1-0-b000e1036e41@smankusors.com>
 <20251028-pm8xxx-xoadc-fix-v1-2-b000e1036e41@smankusors.com>
 <7558d070-762c-4c81-aed7-1b087d131483@oss.qualcomm.com>
 <6f68327c-73b2-4684-bc8a-156714b6e3fc@smankusors.com>
 <b4a86788-fe0e-483c-93ff-fe993edb3181@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4a86788-fe0e-483c-93ff-fe993edb3181@oss.qualcomm.com>
X-Proofpoint-GUID: hWNAl5huDH-LAQaE0455RpJi9IDjRF5U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDA3OSBTYWx0ZWRfX10AZ4ORykfe5
 m04nsSzizl12qdr4iFLhX271g77IWeOfM2pS0k/eirabFdZ02se2rTIeGqYEvBJ6XJaS25Gdbee
 dQzBHcdpN+CMPXw4jB5vKLTBQxsnAvycO2IqIkoNWGYB/naL733UGkTPEY+e1anh7Re1sXxZpGW
 sQ44lChB+SImcezM7YHfC2P2xNEhtxfmAWWxB/W8CFHGjLISbPZpKjEDOuBd29jSfyrs+fGe4ze
 Er9C+liy9Zi7Utxt6t+jrUwSFu7P3hUDkfeGFMAEzMC+s69xkTxI07N0TY6khjtsEZn91c5Ixue
 uJoDfTWo8h/imjTmsJu0VgFusIRQePFZ5DNnDqJp1VQmiPfDXiNSEdsF1jO9D4fmlkUb3hoDbMR
 5zW1t6vfgRfLNCS5WB3jmYWQNHjXfA==
X-Proofpoint-ORIG-GUID: hWNAl5huDH-LAQaE0455RpJi9IDjRF5U
X-Authority-Analysis: v=2.4 cv=XYeEDY55 c=1 sm=1 tr=0 ts=6905d221 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=wxLWbCv9AAAA:8 a=bEFHJ-mLbTNbAtBp84QA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-01_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010079

On Fri, Oct 31, 2025 at 10:00:25AM +0100, Konrad Dybcio wrote:
> On 10/30/25 5:57 PM, Antony Kurniawan Soemardi wrote:
> > On 10/28/2025 4:44 PM, Konrad Dybcio wrote:
> >> On 10/27/25 6:29 PM, Antony Kurniawan Soemardi wrote:
> >>> On msm8960 phones, the XOADC driver was using incorrect calibration
> >>> values:
> >>> absolute calibration dx = 625000 uV, dy = 4 units
> >>> ratiometric calibration dx = 1800, dy = -29041 units
> >>>
> >>> As a result, reading from the IIO bus returned unexpected results:
> >>> in_voltage_7 (USB_VBUS): 0
> >>> in_voltage_10 (125V): 0
> >>>
> >>> The issue was caused by not setting the ratiometric scale (amux_ip_rsv)
> >>> from the predefined channels. Additionally, the downstream code always
> >>> set the ADC_ARB_USRP_DIG_PARAM register to PM8XXX_ADC_ARB_ANA_DIG [1].
> >>> That value does not include the SEL_SHIFT0 and SEL_SHIFT1 bits. Enabling
> >>> those bits caused calibration errors too, so they were removed.
> >>>
> >>> With these fixes, calibration now uses the correct values:
> >>> absolute calibration dx = 625000 uV, dy = 6307 units
> >>> ratiometric calibration dx = 1800, dy = 18249 units
> >>>
> >>> Reading from the IIO bus now returns expected results:
> >>> in_voltage_7 (USB_VBUS): 4973836
> >>> in_voltage_10 (125V): 1249405
> >>>
> >>> [1] https://github.com/LineageOS/android_kernel_sony_msm8960t/blob/93319b1e5aa343ec1c1aabcb028c5e88c7df7c01/drivers/hwmon/pm8xxx-adc.c#L407-L408
> >>>
> >>> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> >>> ---
> >>>   drivers/iio/adc/qcom-pm8xxx-xoadc.c | 10 ++++++----
> >>>   1 file changed, 6 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> >>> index 8555f34036fb13c41ac720dc02c1dc39876e9198..a53d361456ec36b66d258041877bd96ab37838c4 100644
> >>> --- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> >>> +++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> >>> @@ -503,10 +503,11 @@ static int pm8xxx_read_channel_rsv(struct pm8xxx_xoadc *adc,
> >>>           goto unlock;
> >>>         /* Decimation factor */
> >>> -    ret = regmap_write(adc->map, ADC_ARB_USRP_DIG_PARAM,
> >>> -               ADC_ARB_USRP_DIG_PARAM_SEL_SHIFT0 |
> >>> -               ADC_ARB_USRP_DIG_PARAM_SEL_SHIFT1 |
> >>> -               ch->decimation << ADC_DIG_PARAM_DEC_SHIFT);
> >>> +    ret = regmap_update_bits(adc->map,
> >>> +                 ADC_ARB_USRP_DIG_PARAM,
> >>> +                 ADC_ARB_USRP_DIG_PARAM_DEC_RATE0 |
> >>> +                 ADC_ARB_USRP_DIG_PARAM_DEC_RATE1,
> >> The PM8921 datasheet suggests a single valid value of BIT(5)=1, BIT(6)=0
> >> for a "1K" (1/1024?) ratio, although a comment in this file suggests
> >> BIT(5)|BIT(6) is also valid and corresponds to 1/4096.. I wouldn't be
> >> surprised if that is the case
> >>
> >> The previously set bits are a field called DECI_SEL but are otherwise left
> >> undescribed
> > 
> > So, do you think we can leave the BIT(0) and BIT(1) as is? I have a feeling
> > that if they aren't set, these changes might prevent the APQ8060 Dragonboard
> > from reading the cm3605 sensor? or maybe not?
> > 
> > I mean this one, since the driver was originally tested on that board
> > https://github.com/torvalds/linux/blob/e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts#L67-L79
> 
> +Dmitry would you have that (or similar) board in your museum?

I do, but I sadly I didn't test it lately (nor do I remember if I have
sensors board or not). I can try testing it next week, if I have time.

-- 
With best wishes
Dmitry

