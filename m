Return-Path: <linux-arm-msm+bounces-69310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E022DB27880
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 07:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 326305A582D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 05:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AFF2BEC34;
	Fri, 15 Aug 2025 05:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2uQ4AlC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDF7286D72
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 05:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755235985; cv=none; b=ehIl43dr/Q2dNOQrLRcVFYMngodC5p6BKC73jqQTt+xA80XsVZyxL9PKl0gk88AZWDReZaYBxRMMUwWVcQor8PxFbkgZjWnCawbhEMvgKflSGm3EoVoZ4mmlOd9dXbr98wMdqxt4Dnwc70m86jd78EtRreVRR5/dE9KP2jr8OWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755235985; c=relaxed/simple;
	bh=URdpp/WxyhUfI/Ae6q8F7A21mqxWZYGH4gH7+ePLRoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Usu1WB0Vds2AJC8z3bXTVQ7ht/1ILXfO/0vBeXi5v00L8qv3jsfYD4Sd34G/MaEtKS343QE3FjZYpLos46YLFeUq0IMwsNubLxUAFVl1AvvMu3HpwTxqtHd+Sdo/41XaWf3GES3beZ7U+lGCCOcsZGpXST914lHJMwKwYHqK9UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2uQ4AlC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EIYnPp012279
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 05:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovqL3ACv+kUZfn7O+wK3v6Lc3iCZ+BawVyVb9IBebzo=; b=b2uQ4AlCYcKxl4lY
	zTEMrPcXuNqswTaxa89jZcOvtvEzi1+asa5ZPT1z8Y3TYlnWxnVqpMI8ozzqVbR3
	ayEY9QMAHQRZOcyzvXpMnTj9O3PGswsNZ64VN/ylRiZCmyLTFqCHvwe4qOW8yDsF
	KOOgCJPlED5sajWGkoupvW77S/mqEbEYvgyFRscuazYbRb0xU8xWPItKyrUm4GtD
	EoMItrk+OGhgFi1eE4TDQKU9SVQUtBVqbkJS1HWemvxoij5Y7acT7/G2UazGwXFv
	3MhfJaMO1pNX+sEyQsoQuoG6zzksNpXNkPbFNFZRtFY5mhVe6STW3jcD69zC1cDF
	1lT03A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxg8uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 05:33:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a927f4090so36868166d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 22:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755235980; x=1755840780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovqL3ACv+kUZfn7O+wK3v6Lc3iCZ+BawVyVb9IBebzo=;
        b=IQ/lneynKE9vPHVDohTmcAIRJ6WEw5twsBfo6dTIOa9w3p3UaRjvFAVBrRr22VIaRK
         F6Ub/fDBdYoHPq3cWQPCsSvjCBi6U4kY/q6er5Ku5ZxBZ0qYLMUGgieHIwdeGArdJtvT
         y6Pv/Mzz2f83pQyfRxSIfOKZ4doi9hl7XwxdA54xeapaGN5QJaBfgp/6b/BwSOB8riG3
         tpVKGilGMmTATloQDYHKWVsN2ryiBka5YW3ryZ7r6BS08qVIM9Q7D++1NeVia6mCfTcH
         giE+0s7LQ5ae8dHQM98IhEhfq+4Q4odHb2NEVtwgqQXXBzMusRoKreZvUswWDNJFrmE0
         cmPg==
X-Forwarded-Encrypted: i=1; AJvYcCX0n8AyLq1MgIhl/Wh7HXhfRuUmiL0n4c50cbS7nfc0OHg8E4jLwgdkc6iJXJDqyt/8bKm22WQH53CyPWob@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa1pMVyyH2pVJI0FgISjKi1e2cIBmEK4vFzlfErNm81lsuAyDN
	JNposxwNoTb+3Na5NtptxACwFpH5CBKK1+wFTXRxXtS2f/liD/WXztWV8qYEUCu8TJ4x1NMoace
	Tdc7jKWXYYmERKdb+VjlWCNKH0j25mitdTn3maC1h39u4gkHDvbBTC23A0W1lmdBkDMtR
X-Gm-Gg: ASbGncudMrEPvcb+dwOcMe8I74+X5LgTdRuXGnXkh6nkKUo1/3W6J042fcmDbstCKzp
	eatpEWjVQKG9zJqR4h/BeDOy75r92YDdUX/yvuvi+p+hrKImxtp1ttOEqrC8Tdh0TgH1LKugjE+
	hIbIihRFadhsDo3NRGt4ZEZI4geYHeU/JYBjDAq9BlkSB/TjPLtfjCh0fHFG59RBvRBQudYqtPG
	i4+BD6gIZJw8Wft7fNBxZbnKP1WgykTNO++LkL2LlmorI9yMXTrlcm2JqBiYLe6r71Ddb2URY7A
	dYx29uKioWf/PHEr2R2PhHwyOZgALk6IPFIEQyziUvJPEypeB6+s8YRJO4nCYABXVUM=
X-Received: by 2002:a05:6214:2465:b0:709:f4f6:7efc with SMTP id 6a1803df08f44-70ba7c0d99emr5540436d6.29.1755235980556;
        Thu, 14 Aug 2025 22:33:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxfir1wXxaU83tmZ/aq1nahL0CTNuUHTP9k/Q8uSYSN41izFNRaLdK4c1petYIvpY4X2AnhA==
X-Received: by 2002:a05:6214:2465:b0:709:f4f6:7efc with SMTP id 6a1803df08f44-70ba7c0d99emr5540206d6.29.1755235980122;
        Thu, 14 Aug 2025 22:33:00 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3bb652f90casm635115f8f.26.2025.08.14.22.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 22:32:59 -0700 (PDT)
Message-ID: <19494b00-a5b9-4490-bddb-48f48e73b0ac@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 06:32:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX9AWQtpvEufpj
 /YfnueTjTRAJKBQJq8P06KxUEsTyju39fb8VhCn4wxyug6Tfc8dlKvV16sixPEveB7V1G7lfcox
 KYAMfubJ37njWF6V3fiuhpnNPOS7tHu4NSzKcH/8kcVN6GmtMLxbXu27OJf743IGBCegWVwAcS5
 b40qCMxq521ZbPMxiqXQuAw1+MzxAt4dRg2C83NwAMUFSHyRzSYFEYMKFDgflrYt3QxxFaPaQhO
 zBdfzOw5unxIxe5i+RB4Zbawad+vCLugm23GeB3BkoCY+sBOQKPs1hk5mOjdPlf3NZuKyC6PMwE
 J+MR2AYiuL8M4nb4y3IvGpKWOWi8jajDwGD152w2SQ5BsAus6BbOUZIxd4vvN76cYJk/IPyFqXw
 UfBTjmAy
X-Proofpoint-GUID: Q7KNU-3SkmXrouXDceNcBUWFvQkUzwP3
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689ec68d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=me_V05VD0Eq9TF5rt4AA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Q7KNU-3SkmXrouXDceNcBUWFvQkUzwP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

Hi Vinod,
On 7/4/25 1:12 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> All these 3 codecs have been duplicating two of the soundwire
> functions. Noticed another new driver starting to do the same, its time
> to make some helpers so that we do not duplicate these functions.
> 
> I have added two helpers of_sdw_find_device_by_node() and
> sdw_slave_get_current_bank() in soundwire layer for the codecs to use them.
> 
> Changes since v1:
> 	- updated sdw_slave_get_current_bank do error checks on read
> 
> Srinivas Kandagatla (4):
>   soundwire: bus: add of_sdw_find_device_by_node helper
>   soundwire: bus: add sdw_slave_get_current_bank helper


Do you have any comments these two soundwire patches in this series?

--srini

>   ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
>   ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper
> 
>  drivers/soundwire/bus.c        | 12 ++++++++++++
>  drivers/soundwire/slave.c      |  6 ++++++
>  include/linux/soundwire/sdw.h  | 17 +++++++++++++++++
>  sound/soc/codecs/wcd937x-sdw.c |  6 ------
>  sound/soc/codecs/wcd937x.c     |  4 ++--
>  sound/soc/codecs/wcd937x.h     |  2 --
>  sound/soc/codecs/wcd938x-sdw.c | 17 -----------------
>  sound/soc/codecs/wcd938x.c     |  7 +++----
>  sound/soc/codecs/wcd938x.h     | 13 -------------
>  sound/soc/codecs/wcd939x-sdw.c | 13 -------------
>  sound/soc/codecs/wcd939x.c     |  6 +++---
>  sound/soc/codecs/wcd939x.h     | 13 -------------
>  12 files changed, 43 insertions(+), 73 deletions(-)
> 


