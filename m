Return-Path: <linux-arm-msm+bounces-111991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VM/TOalyJ2p8xAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 03:55:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F57C65BC4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 03:55:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LrC7R1kX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="aOz/6edy";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111991-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111991-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E275E3017C02
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 01:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611E035F163;
	Tue,  9 Jun 2026 01:55:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DD535DA49
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 01:55:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780970151; cv=none; b=f1umZ6Xp/hfODjrbrWTMssbaq9RnCBfb13dM7nN4vg54NG0gJ6x5/jEFz+RrmfCkzy9jBrfC7RYwVGFiAnMm90NZoxXNW35Y2AB5TkMh7kEGJMLEaIP1+rTx91s89kVYj7TTiLtTKaaGfxjDIcmLLGJtLQm/2nB11eI7N0/ga/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780970151; c=relaxed/simple;
	bh=m3IVM25TU4m6Ip/Oky5/marrcRkY5RvoQ45IdErZMGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uod/6s5FleQguN4J3jtC7AO+5larkgdw5NOMcmuFDCubAmro401S3PM0sJ/VlglY9R1x62ZMzb1e41/EmuE0ZjWwjbYDRhuHAT2MD0W20yuwi5ZUoVITUtyGl+LMDpjDydnpHaLx6Qn9cyX8F0ZHvgfAyT+UU7Q9QM2e61G+YGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrC7R1kX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aOz/6edy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6590s0Oe620814
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 01:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1E1VdvhHSaZdxpy5zAZygV8cj8wYGawuEdkXG1KsTL0=; b=LrC7R1kX2GVaBmR3
	4TxD64qa9c1PpuE8Pql3rDtqbus+uvbuQiUPy1HPz1LU1EX1ra8XJET/gNdsH6D3
	MCGJbtXmaIhOIAkHCx8sk7sRmFeM/pyCrV2reNOuVrm4ibubbKcb+Sa0J8xkI5Kh
	V1ks8soOhTAcUuJMZRQRj+ty2m0WmldFq8KVs+vqQi+6y39NzckLQwgnlG/ZCrJf
	wrB5pTAm8gDFN8G6h2Aw++RJWIufaCHj613c6IxeSV79yDbZfQm/Da4hricqqZt0
	heOfXQfuATmI6u7oyw2UOpTiZgYgH/Ajv1oE50nOCsHMO2eUzXIdX4u8X2qDcN52
	pfo+YQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enunabubh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:55:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842692bf60aso7326683b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 18:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780970149; x=1781574949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1E1VdvhHSaZdxpy5zAZygV8cj8wYGawuEdkXG1KsTL0=;
        b=aOz/6edyFEVD1cyQ2agKv0YHuPZb704QlSQ2DvyilbIngza0thYdoLwiKlkFRN7k6x
         ScwVVeQRx33AV2qY0zkgFBQbe6CsUW3s3/wtfydTRseslHiI2XZRaNUV2oj8gs9fXAex
         t0kCB2F9RYruiPAW/46V3oqoGezWC76rXcxo/qpq/KgRdIMQkuvhDjDDaxCIGZF67CU0
         qXVt8xK2J0ZOe1NuSd9bE3GQYwnGVRIg5ErdRk3pLV7ZJOKHW2Z+jIgTIdAcn+6jshgH
         7tNLNx5IcMFJTOaP1wnK3z8ai7JpT+aKDIRGt//BOsBUD/LQ/lo+xoCelw6VGWHJlaQ1
         6F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780970149; x=1781574949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1E1VdvhHSaZdxpy5zAZygV8cj8wYGawuEdkXG1KsTL0=;
        b=sahRPK7A/zKCblshDMdsHLKm9xcqmkONltkx2urL2uJSPuMw/TumbS78SUMf3bCBA6
         TyqqxheymSTOliApJjmT5kCK0Xja+2LxjbShfHN+6L5aU+vmKW32d5GNFbOaBTvK0Yvx
         7hGPK568PzDmBNHTvFzn9ZonUPe7A5kcM+W/U1no+8hzbvsUe0+rROmTXC8dP3XVhJD2
         2BRrn82dSuUks/oh1UsmE02l9Lrmbnx1oA2PpDqvX3+4qRr4yiT5Kjppa1j0l46Pu0i8
         EO2Iku5BtJhGjQNbP//ZWDqR03mqUgxmJ1BsTXm10grZz7uS8oE358YHkqwnou3xPOwr
         cN3g==
X-Gm-Message-State: AOJu0YyLCJm80VVvFaUl77k2mz7gjoA4pIzruqy49dTXBKP7w7rzkukF
	Wz643RWrXKYkCH0ZdPIwNJyCSwYgdeFBUR6JGxFAdNeH5ke1Nf2+CMNyMHNwhO7VpxeEqNrnTTb
	aFzQSvldowVFpaQtKG4/3ac5aTGSmSNj5Jj9V10xDtG6NKtnqQH4flPhshSeQMuBsxpyW
X-Gm-Gg: Acq92OEEzyfZyuRYNnIh3Wc/LYl1ZVDbo3fogtonjDyMgiyiJaPysVNGUNoktzZHhQ3
	b3OkO9+SLaxctBjo25nF+lrJcZxXDpM7gG6f60aI84pRP0acpdgYIC5l8fYJVSyz5UWSXPNPD0V
	wyCSWuhmigcscuvyFdWkSojlJMcGKwu2CCE1bdLX6a5L0rzCul4F5wgDjOnNxpyKKqzLO387sqy
	m6bWaStKf35/rYdLLGX+HjKdUMMHfkctE7s/lMeeHLCjSFO3vb51RCEJ1CXetMsCaMBG03o7V4o
	WFc1x50E6u7ETYA7P7OkO4dvXBYZb/qocv4202NCkQ8t9n7UInnldkHFpPWIyoA8AC3h+GIsnWf
	RxfphN+AQgYmDw1omW4feEukcfEx7E2PaB1F3FKU046WF2DRAJk5VC1NY7ZVfrhbQtangHLSAKi
	QyNThU97vQD32KqqAdaA02o+VOEQ==
X-Received: by 2002:a05:6a00:4304:b0:842:2bcf:1d76 with SMTP id d2e1a72fcca58-842b0fef2a8mr17578434b3a.45.1780970148604;
        Mon, 08 Jun 2026 18:55:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:4304:b0:842:2bcf:1d76 with SMTP id d2e1a72fcca58-842b0fef2a8mr17578401b3a.45.1780970148124;
        Mon, 08 Jun 2026 18:55:48 -0700 (PDT)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282883647sm22377974b3a.36.2026.06.08.18.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 18:55:47 -0700 (PDT)
Message-ID: <158c6055-b0e3-47d9-b695-929b59283ce4@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 09:55:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW
 pattern mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260605-lpg-rgb-color-balance-fix-v1-1-3233644a3385@oss.qualcomm.com>
 <uh5yq4bislnr6ftoscklyvfyjps4topqrq2wb3oointellre4y@qeau2jz6ihu6>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <uh5yq4bislnr6ftoscklyvfyjps4topqrq2wb3oointellre4y@qeau2jz6ihu6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAxNSBTYWx0ZWRfX1tlvetJiIYOa
 W11QrO25ADfNFMDzToe2cpkyvTwrCDK37DW/T7pQra0Ctd0A8XdV7yPSg7wAAwt/1qS/cNb0OZ9
 JrWTiMymaTQy2Y5T4Qpcg5Y50ey9Jxby/LA25JyiSHB8LDgYRQyqu8AEbwIDQzOoz4+DnNjg9Kw
 ZpcGmbRaukEJiqXddnKkDsYGbkD+tEf+j5ha89PEKyvpoAb6kMl8ES2kuXKu8wGkWd+gj91zrZK
 hbtyirCPJW3EXwmOKTu+/6D7CxGrR4EfDSmeSvAznhc5wU8APqmMSzpnJMMohrI4jNCf1tFfZxZ
 XHlRIhvwMgpHZadkOrD1Sl7cVoagHRrxVUIzVevDRGD9j888URnGMcuNBtFj1XJicyMbHHGns/g
 eZ2gL08T/nPn0hRvDsAnUfc3emsxt6H4ZW0Vcu0igqI0P+7j//nJTXIyZ41rPblKsPifcZ01Rjg
 Om/TRn5kTSC3BARxfuw==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a2772a5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=adD8Q7AqBrQjPfmcjFYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: yJhpyaCuIRSiw7l7hlK1-bDMxJNfTgnq
X-Proofpoint-GUID: yJhpyaCuIRSiw7l7hlK1-bDMxJNfTgnq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090015
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111991-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F57C65BC4E


On 6/8/2026 4:24 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 05, 2026 at 01:18:24AM -0700, Fenglin Wu wrote:
>> Currently, when the LED is configured as a RGB LED or a multi-color
>> LED device, the same pattern is programmed for all LED channels
>> regardless of the sub-led intensities when triggered by HW pattern.
>> It results that the LED device is always working in a white-balanced
>> mode regardless of the intensity settings.
>>
>> To fix this, scale the pattern data according to the sub-led intensity
>> and program the HW pattern separately for each LPG channel.
>>
>> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
>> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
>> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/leds/rgb/leds-qcom-lpg.c | 174 +++++++++++++++++++++++++++++++--------
>>   1 file changed, 141 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
>> index d7d6518de30f..ca84da563e09 100644
>> --- a/drivers/leds/rgb/leds-qcom-lpg.c
>> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
>> @@ -148,6 +148,24 @@ struct lpg_channel {
>>   	unsigned int pattern_hi_idx;
>>   };
>>   
>> +/**
>> + * struct lpg_pattern - The LPG pattern normalized from the LED pattern
>> + * @data:       The pattern data array (caller must kfree)
>> + * @len:	number of entries to write to the LUT
>> + * @delta_t:    common step duration in ms
>> + * @lo_pause:   low-pause duration in ms
>> + * @hi_pause:   high-pause duration in ms
>> + * @ping_pong:  true if the pattern support reverse
>> + */
>> +struct lpg_pattern {
>> +	struct led_pattern *data;
> This looks like an overkill. Can you embed the struct here instead of
> embedding a pointer?

Are you suggesting only embedding an array of "struct led_pattern" here?

The patter data array consists of a variable number of "led_pattern" 
tuples that set by the HW pattern trigger, and a "led_pattern" tuple 
consists a "brightness" and "delta_t" pair that represents a single data 
point. A pointer is needed here as the memory for the pattern needs to 
be allocated dynamically according to the pattern length, hence it needs 
to be freed after the pattern is used.

>
>> +	unsigned int len;
>> +	unsigned int delta_t;
>> +	unsigned int lo_pause;
>> +	unsigned int hi_pause;
>> +	bool ping_pong;
>> +};
>> +
>>   /**
>>    * struct lpg_led - logical LED object
>>    * @lpg:		lpg context reference

