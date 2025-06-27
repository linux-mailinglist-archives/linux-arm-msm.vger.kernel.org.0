Return-Path: <linux-arm-msm+bounces-62846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D69ACAEBCFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 18:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C0B37A924A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 16:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78191A704B;
	Fri, 27 Jun 2025 16:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XE8jySfi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBCD1A314E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 16:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041221; cv=none; b=Emjkwmqh/TkcVxWdvE7IX3RggLEqFSw8KFIJqicrV40gWcZZ145Asu87JEpCRj1xcJpAZj7fsOOs7Q1eKKdoiygZaPFXyseFN5y24YcD3YBKg+7k0QnKkf4AVbt7Zk4rpWcm3ixV08XqWtsD3y7Yr3uP6t0W2GpU6Zdw3Td4CvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041221; c=relaxed/simple;
	bh=XwqHogSSry3M2xOy9mpJfC7RmzJCOdzUYxSsyffvog4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fksDOXhnQNU92XL0jhFJrTofmMh3LlZu9QLdhIE2ldjEUYdDXdW7y61PUWYh9HoaEd4PlxdM9x/gqudzN0FrW1cWT7492iiEGNbsgnIuU6zXOAnYjfDm2q3WXGfRuoShCnX6eci2oyg3xofNh8Rk+Zr9H2z8dig2uDnZ+f7HiiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XE8jySfi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCAhJQ027650
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 16:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byTdy4NUp80D6fRVNH608h/H8vnHagA3F7wro8Roi8Q=; b=XE8jySfiUhYk0olX
	fBwjxLXhjQiipLrhvUz0NEjqA1e6LzZ7Tc+Rr6rK5kSXqXQe0H+WdZ+zNDWDSplp
	z8rHrl0YsUeH2TJHEcaN21qXwHFiNmC/iemUmcjUp8V+CNEm93aCr07a4fFrIcDX
	RG6xKoZnVBqcEaL7daXbu3QtYPi1LNUhRjDx+qUNcbrmrlEynagoOdYcaw0GDiP6
	PQocKc6hLDO+umCTRSDXEztYt2CltF6rRfdks7+uFXod+yBerOSMWYJXSOACkA6/
	gTOYAshjbzXE5+ma5enEgwk33rZFMvzgeUxHwrbcd3ApBq24w5mtrP2fW87G2TaN
	UAJtTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26hudc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 16:20:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d446ce0548so114146985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 09:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041218; x=1751646018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=byTdy4NUp80D6fRVNH608h/H8vnHagA3F7wro8Roi8Q=;
        b=D8zN/RGS0UVs+FcSBpVEo2C0Q+lImeG0ocui2RuqvwJZu5wHVchdUauNFiAJ4htnj6
         TmfeQiUbuTp0xpbCFN5a9qejztPmFj+ZgfGtvom6elcCT6iptzwMECw5ZQrmOaMnix5t
         dilNVB8Hxcvy+3T9Dw9QOKUIw7TMi6RGWcbrqERzeEyh6vRAetX8k0L/6rrkZX6L9YFr
         S1SuJ/anktnxmoeWa6tJWqBItytBq3b/u8QPxlJvvxt+bcU8V+4SmzzZXsw8h5LQGyF5
         Co98fhRRTgP+TU9Ad0lUQYWDWj2Q3zOVqQIFPfejAo631z+gtv8m6fbz+HlRKpb62WXS
         +tfw==
X-Forwarded-Encrypted: i=1; AJvYcCWdVKtLqEot4hQNx2M+jZ46sTW1DxI0cm3UvlJgyyS4RL46YUxx4jtmb7LF0kBgVlBsWjOgNQgPJeIyrhkL@vger.kernel.org
X-Gm-Message-State: AOJu0YzwqBHproYOsCsZrMItf1jS5KfQaofBv2exJ97inZJMcld2c/G5
	31WJEgCCJFh84uEZJdtYPzSfRu2BEBYu018bprAsHLfh0k1R+RbO2lVwuD21sfQspoNIn512cRU
	1j357VM03eZ54HAWgsN8kGVbmxWgtrbKFkAjAyJUijqfY4xIz8D2zewnS5XgR+/VdmeU9
X-Gm-Gg: ASbGncscuwS3msMKore3iMjql7xSl5nO29LCFqkFCD/QcXu4fZVHCie0tEFBiSS/hGf
	ozAsRik6vCpypEHpPVhQiTo11rJ0yzQV8l27L27XNJM9oblh0nq04w8gkemVPbrw8Liw/WVHEBR
	KxJBUWfLyj1MEmNW8qQHSHecfV9o1z9XfUalZ2T4qNnasUPwantqPZIgc3T5CZf50h0LB6GFn9L
	m4v3H8ZTgkUfM7KUZ5KGEEx5zPBw+kqb0Yzwm4ijFIjeGrGPcAfqw1Xo7QRpDn2jN7ZuYG3SZ+i
	RxTnQAfgoQOzIHv4A8YoehK5C2MAecxacVyFNsc0x0Y1eope
X-Received: by 2002:a05:620a:1904:b0:7d3:907f:7544 with SMTP id af79cd13be357-7d4439a6584mr581808685a.35.1751041217986;
        Fri, 27 Jun 2025 09:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5YR9jQmlbqJf/b3wtB+gkoIUeP+Io5gvMv3Z8vaeITKKJSuhEBtWn6NwiGA8qRYC/80SaSw==
X-Received: by 2002:a05:620a:1904:b0:7d3:907f:7544 with SMTP id af79cd13be357-7d4439a6584mr581803785a.35.1751041217536;
        Fri, 27 Jun 2025 09:20:17 -0700 (PDT)
Received: from [192.168.68.113] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7524sm3127195f8f.12.2025.06.27.09.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:20:17 -0700 (PDT)
Message-ID: <c783a7a0-5fb1-4dcc-99df-433352dd9ee5@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:20:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soundwire: bus: add sdw_slave_get_current_bank helper
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, vkoul@kernel.org,
        broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-3-srinivas.kandagatla@oss.qualcomm.com>
 <68c06500-a776-4f56-8514-c180b23f7715@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <68c06500-a776-4f56-8514-c180b23f7715@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfX9TzQla9Kaw1O
 oxNpg3+2Rxp/O+rvWytkOqv9HSETNTkJuItnnncLjwu5N8Ffpa92HQpSxhpnNFLo5D6/GSFu8E2
 s5OeS23Eq6yej4IGBhA7OZVApers2sdGPjeS+ftNG72bFTSCEGHX5AyYgfTbMxlMs6oUKPhfw0G
 A2uZqVLMjW4AXm4as8wwHM0hQ+eZjh2keal0FaAorwye5QOVdM99SzwWjMKusxjbM6CL4DikKLm
 82yeIDJb9GLBNzP78RlbMffP9QXoJyGFo4hPv0Giw61emfDU2BeuE8JAwM0hLZV3L7yPNhiK9p3
 U01xrikEikLOGrGEHlAJBqETYl889MAij2iWP3DrxcHLGyUahORvtq4/GevuYS2dbPgBVTFxykD
 YU9OYDjrv2+yv1kn0neOYrxTkW1SmU8l4EvBNUzvo+ysx8DQEmD2N25U+xV4P5y0iWI0MVo+
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685ec4c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=yTlN0QwsL3H5k83FOakA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: q_EvINo3c_3UWuj6vHYz28Wzb3GeGgSf
X-Proofpoint-ORIG-GUID: q_EvINo3c_3UWuj6vHYz28Wzb3GeGgSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=939 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270133

On 6/27/25 4:54 PM, Konrad Dybcio wrote:
> On 6/27/25 5:51 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> There has been 2 instances of this helper in codec drivers,
>> it does not make sense to keep duplicating this part of code.
>>
>> Lets add a helper sdw_get_current_bank() for codec drivers to use it.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/soundwire/bus.c       | 7 +++++++
>>  include/linux/soundwire/sdw.h | 8 ++++++++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index 39aecd34c641..58306c515ccc 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -1363,6 +1363,13 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
>>  }
>>  EXPORT_SYMBOL(sdw_slave_get_scale_index);
>>  
>> +int sdw_slave_get_current_bank(struct sdw_slave *sdev)
>> +{
>> +	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
>> +			 sdw_read(sdev, SDW_SCP_CTRL));
> 
> sdw_read can fail (miserably)
I agree, will add check in v2.


--srini
> 
> Konrad


