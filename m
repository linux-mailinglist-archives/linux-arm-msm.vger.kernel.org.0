Return-Path: <linux-arm-msm+bounces-78035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E84BF20F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 17:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4C4474EFC02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 15:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2E2263C69;
	Mon, 20 Oct 2025 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5639v1w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40906262FCD
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973566; cv=none; b=jLheM0NvKhckKjcRQiCAF9tEn8powBmZm+ukt9WzS2ImLPUUd8k7pApYfWXl5Q552wV8UPGEt7monBc5hJPz25d4zmiffEIFSrllQVbuWmmKN6lnA/f0/NWbkJq8FO5jwRQpZQeJPeVFtDZ8iffRrXTdnc80uuhCNGm65VbCCU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973566; c=relaxed/simple;
	bh=txIz2mOWj+d71E+Te7JQa6TGasPd3qP3hYYTto4gqzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uya5H8+6VqsX1KifFeZ/HWNfmUBvcL3X0xGJqdudTX2wMrl7foHgDVoYZxGQFF/J5oVy3PgEJXGgDyFkESWCtIq5Wt2PXh8Pm5ozPPNR3u4e/ohrDiips90SoAnPLBKrgDRk9iTINyq/lnTcA53l1tf1LdSX4jnFCSLak0KOI6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5639v1w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KB95Za023239
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 15:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+yIVlYM5/2IuWRwZgg83a0i74gXu/4A3ovbjVxqAvo=; b=L5639v1wdsU88KTZ
	aP31YCPaZZA17fAr371LPz20Mbe9pPB7jmcP/Y8iw0T8UvihA7TV4RPBzBAVRWSo
	qeOH0FXFykqJ6BytYCI2boZwYh4q/Mec+JwiaByylksSYZZ3kFU7OJD2YSv8b9/w
	H+FjqRpgvHKOVTKlyjcAIJPP6oxu0n8WnWP5zit66fkzf4Ynh0TMoRh0hREVhTgF
	n5bdgtu0sxfq6dPzXCXY8E/fl1VmiPWADwT4AEEjBXr8TXqiKm3vFbn/MsnJia5t
	2opTO9GPTBU7I+MlXaSnqesfc/GDdglQ9AiOMmIJrwFehUH1diFuZLXpoqyacvPO
	pp11KQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27hw7gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 15:19:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78f28554393so144070876d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 08:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760973563; x=1761578363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+yIVlYM5/2IuWRwZgg83a0i74gXu/4A3ovbjVxqAvo=;
        b=HokXyJYiBtOX0ZYJ44vVt7Hh2TgjNqI329VWhgJdF7MiKv67HycJckYLyyJT+lq5kE
         ePwhlUrmsyWdr3HRyTSsf8ys2Is//qubFYUctu1+bWHmha35u/EJfsGbQpU3ytPXwVw3
         IJ9BqeuHOdze2dbdC7ooxaM7FLy+xFgpmbRBRa9n75QWyLMyCQHVlKgWjl6BuDeypICO
         9S6eYf33bq0j2++YIudokfOWlf2JxDPibqIP/CLb421Avg/A+duS40jk4WKdA1UsH9Ma
         CIQPBbjdqszcAJKPkVmGq0jpWd0T7t4Qtw1ITXgfcaSw9jeq0U0NJ22DRbaNzpYif3Y7
         JCwg==
X-Forwarded-Encrypted: i=1; AJvYcCX40XN5UhZIoSFlYSyeyIkpxsaqHWX98CYvgSCfv/U6uKT1NFCfulTiRPxwHHnF95LCiQYBsPfwk5iciIrf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdc7teDuBECSsQQyHoJvVP1pg7nmfnBQH8NkBwBJ7Tpwdvrkuc
	v6ruz+VvbRWXO8XKDmT8g2Vt8nH5fU2bdsoQ5qrPUDLdBrU6R7baWfm+oZvqc/7LzSv8BHEK8XK
	ax/bppZByE8jI0zhtQMBAX/a5Xdxt20XjgQvN6P2Rl0vZ5HJDn9eqWDJRK3CDvoN2slcB
X-Gm-Gg: ASbGncsol2wvT/lI34KLbaxlcefnlX9uMiSh5XQZV2Z4j0P3IdIgpo7rVlk7edSfee2
	uprBvHuQvtK5gsreJjECIFMnh9tC2kZif44laIj6XcHAqcT6halpJtme04s90paXzuHmoBj+Rzh
	I/FnOKrMjdnr2i5MON4mAR5ubYc7JSvtFhdHuffPkSjjMZOggwAEAQw06+gYYGMWjDoVETmNqvX
	Wr+y8bKbKE3ITzoRY0ZuFwsv1BEyBDfaI4BAqstmFwyd+2gdTnGSPzEtdJ/fXcK89ivEy4oBm53
	Zcp51iuZtJGzvHkh6/eNr96XlOgodIXC3OTbh3VGjkZN0EMKMu4MjKvkcqMNOr02dnvM271gj7l
	clzICtQhB+yoj6GNSQpLNYo3E7A==
X-Received: by 2002:a05:622a:1a18:b0:4e8:b940:eba6 with SMTP id d75a77b69052e-4e8b940ee60mr75346941cf.54.1760973562678;
        Mon, 20 Oct 2025 08:19:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH7CJ1xZAKYdlNReNmCh8bS2iyCK1x9Vecn8/NOzPyBPl+tYWrz9fVLu/gfRksjbH30i8Ykw==
X-Received: by 2002:a05:622a:1a18:b0:4e8:b940:eba6 with SMTP id d75a77b69052e-4e8b940ee60mr75346481cf.54.1760973562191;
        Mon, 20 Oct 2025 08:19:22 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4715520d753sm150398215e9.13.2025.10.20.08.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 08:19:21 -0700 (PDT)
Message-ID: <56328447-4cab-4446-b8be-63fad2a6217f@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 16:19:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regmap: slimbus: fix bus_context pointer in
 __devm_regmap_init_slimbus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, gregkh@linuxfoundation.org, srini@kernel.org,
        rafael@kernel.org, dakr@kernel.org, make24@iscas.ac.cn, steev@kali.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20251020015557.1127542-1-alexey.klimov@linaro.org>
 <asrczgrmisaqzhin37jzgylm6ez2mlxtsbe6qp5mqgfecprup4@yb32qzna367s>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <asrczgrmisaqzhin37jzgylm6ez2mlxtsbe6qp5mqgfecprup4@yb32qzna367s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX0JBdwVGJB8mA
 fd8lIc0u5W43TEEDTkbIczIn24rmvuTEV9ZC0Nh09Jlg6Ga+zifCFGks1WQTr0dQ+/3dn5hUzXb
 UssojZRDcDkZbVNmfVXCdvnSJQ+5jtolUXT5yD3eUtnTLXambe8zPWKoOS1DE8fDMy7wJVVYqBr
 BMIaTeIPHJKv4SCIKgQQD3RAy3jRJc2qoDImQEDzD+CvNazZsAy9mYCOS5h8STE/WHC48ygCesV
 ZTvk/McF2eybYWyx7QqnJwt0YKu48q4z2alzjSoCqnsVG4GQKCI5cM8UcbYuGarzOyjezHdcJA7
 gS4S06H1P6HoIqWb4aS42OOokkw1xUH4xi5fIpbapofwpF1JYKjQDRX/irrafIoWmg2rjKudyzO
 csHtphY8a/ascbqdeX+PUN/GCnKGvw==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f652fb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FQcGyLhEAAAA:8 a=KKAkSRfTAAAA:8
 a=ZVbmtxpYz0up1Ekx5joA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=09nrmc514_O-33C_6P4G:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Ey53J38zw4Zs7fO88J69-JORQDykzpT0
X-Proofpoint-ORIG-GUID: Ey53J38zw4Zs7fO88J69-JORQDykzpT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018



On 10/20/25 12:15 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 20, 2025 at 02:55:57AM +0100, Alexey Klimov wrote:
>> Commit 4e65bda8273c ("ASoC: wcd934x: fix error handling in
>> wcd934x_codec_parse_data()") revealed the problem in slimbus regmap.
>> That commit breaks audio playback, for instance, on sdm845 Thundercomm
>> Dragonboard 845c board:
>>
>>
>> The __devm_regmap_init_slimbus() started to be used instead of
>> __regmap_init_slimbus() after the commit mentioned above and turns out
>> the incorrect bus_context pointer (3rd argument) was used in
>> __devm_regmap_init_slimbus(). It should be &slimbus->dev. Correct it.
>> The wcd934x codec seems to be the only (or the first) user of
>> devm_regmap_init_slimbus() but we should fix till the point where
>> __devm_regmap_init_slimbus() was introduced therefore two "Fixes" tags.
>>
>> Fixes: 4e65bda8273c ("ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()")
>> Fixes: 7d6f7fb053ad ("regmap: add SLIMbus support")
>> Cc: stable@vger.kernel.org
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Cc: Ma Ke <make24@iscas.ac.cn>
>> Cc: Steev Klimaszewski <steev@kali.org>
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>
>> The patch/fix is for the current 6.18 development cycle
>> since it is fixes the regression introduced in 6.18.0-rc1.
>>
>>  drivers/base/regmap/regmap-slimbus.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/base/regmap/regmap-slimbus.c b/drivers/base/regmap/regmap-slimbus.c
>> index 54eb7d227cf4..edfee18fbea1 100644
>> --- a/drivers/base/regmap/regmap-slimbus.c
>> +++ b/drivers/base/regmap/regmap-slimbus.c
>> @@ -63,7 +63,7 @@ struct regmap *__devm_regmap_init_slimbus(struct slim_device *slimbus,
>>  	if (IS_ERR(bus))
>>  		return ERR_CAST(bus);
>>  
>> -	return __devm_regmap_init(&slimbus->dev, bus, &slimbus, config,
>> +	return __devm_regmap_init(&slimbus->dev, bus, &slimbus->dev, config,
> 
> Looking at regmap_slimbus_write(), the correct bus context should be
> just 'slimbus' (which is equal to '&slimbus->dev', because dev is the
> first field in struct slimbus_device. So, while the patch is correct,
> I'd suggest just passing slimbus (and fixing __regmap_init_slimbus()
> too).
+1
I agree, it adds more clarity to just pass slimbus instead of dev.

--srini> >>  				  lock_key, lock_name);
>>  }
>>  EXPORT_SYMBOL_GPL(__devm_regmap_init_slimbus);
>> -- 
>> 2.47.3
>>
> 


