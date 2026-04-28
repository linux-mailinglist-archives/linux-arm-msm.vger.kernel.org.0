Return-Path: <linux-arm-msm+bounces-104941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLZvDdmF8GnuUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:03:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D294821F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 323953312D18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F45364EA5;
	Tue, 28 Apr 2026 09:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0Qrco8E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ip/MlHE9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1EC314D26
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368848; cv=none; b=sUs33HTUW5p+LLmGZ77qdtHVeNYPeloL6+9AbefPI+/mztTcjE1Z7NcPw21Ou88IU3eQ9EpSSkElW6K713kIB40oYIY5wZLevj3awTAMoNlefZdcnHsfVaiZJH3ks68E2iykRtIX4fDeDZhlumVQsjuW9udWRfJ+K7bAALI0Bcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368848; c=relaxed/simple;
	bh=wi/3CDrgYApZYmkDjhzgutUUZqsgNZ2AqrK0yxBpg4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjVQiokQIiVvGky8OTr0EBUYPRFBRok3lVWUNjF8LAil73WMDDS1cAdJ34b1kfJ5cAJL9VH4RKkmXh3Iyb48cQ3WaD19+71MEyt5TGtVtNU0h7Bs1oW2dpdhzLa53AwiF7uQVBzhkMnMmp/JRs9qOr9stm4q8tmU/wEpOVfi/ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0Qrco8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ip/MlHE9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S4Nww52112607
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BjLD594h6nIPe0oI8UEQpAkNqznX8Chsi93htrR9QIg=; b=p0Qrco8EtpLyNVfF
	rv+kRHvW+tS1k+WWeIhKK27ECbmyL/1AjVzD7mn6SWYg76yUMdTcTB2z79y3AmhF
	HTWZ4DjKJMvRk0675yAtzmz/NdV2smvMllobyQO5Td9tPWg/21DUt23DJf+2+Yp4
	HMkVaS/R3wrSHLZAwKG2+Q+mVFjCldpRHycLw+lNG9PftVuXQ/ie4d6HI2drAqSE
	wOZ4KNqOnJFBeX5JqPmfdx8oaW4IuR0sibxmAQYfsrf5LJ8sCftCTXlZgYASnTHT
	YQL1PsY/bCinK2DB1BCCVlPkng3kgLuNYzvePEo8qRnSRQ2GWvDfc0GRhvetBHHs
	UvLvdQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbjv98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:34:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e429ba4dfso19430011cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368845; x=1777973645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjLD594h6nIPe0oI8UEQpAkNqznX8Chsi93htrR9QIg=;
        b=ip/MlHE9ca8iymeXAuaGcmpSKF+zkjaPvPcDeTGgMkHHvbP/v/Bc3BPq/38N7D9ugR
         XmBUMJEJUPYudw8GNf1nWa6X1OHOHPdQAQtyyJ2YXlwtXTMY3SLUVGgOgUQ6oBs5cVak
         fA87CKZiU9trJA6RbXfP0z2r6Lab9UFwiHC+YfAxDxtmnxMkddKTBqcWXgmcb5S5m+og
         zEzGA2E1mSqqJt4+s0QfUPOomKc0rETx5P2acS4OhjHX9Nc2cqvx2RNO7FBT9d9pbLmd
         fCpXxEsP2ceRm0PTjwujwn47QYGGmTn8LldvE1CpI3NVdz9T8Ln4m96J8GS0hDgdbWD/
         sylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368845; x=1777973645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjLD594h6nIPe0oI8UEQpAkNqznX8Chsi93htrR9QIg=;
        b=jyOHjcanJo4Wz81BQaWK1GN+X6rMadGjyed4awqscz/zQacIxVxO0jlIsw2IxE0dAs
         JjLAiHwcz2wwJUhvDR98I7KFjAfSPykDQPr/KJ2lSppJIqxyXZobNdivT7sJwOb6BwCW
         ymDtdqIhL0q/NgsSzNkehuXjJjoFy2Li7d5tG8z41X+IE0ZV5P7/cAL/KAA7z7Do4QXw
         fxeLjweOJomGLniDq83Em2Owx2DASuGCUGOqfilN25VRKjFZJAajOVcnE/a/VI30wOnd
         QPH64byxgftJh/JR25FXi47k9K4YI5C1uFJmaAG8kzxFObVfUTtvvUkwqcaRlijeY/Ns
         EPGw==
X-Gm-Message-State: AOJu0YygDGfVKn5mjw0F3Q+5hcLYm3Fdf+pexjlvmUJ0h5SepJe83OfO
	0neOMIfSS5rug87H2oZhKi9nh9V3A7Is9v3AlyVHK05RBPm0VuydzFemh/iA3dqLTiKLxQQ8Q70
	4f/SAP0w8quQPORQUwNcrOKeqp1clxhYic3cllsk8Jofq9toFuCjRsrhSb1ygvMOKY/E6
X-Gm-Gg: AeBDievk0pXerVfdN4ysyNl17O7R4SP9TQYHGkTnHZxfW7JOag0SOhJj08O+5fr0wsG
	B9M7bnvSVLHoely75IHr0r2gO5oALMxw+MJpzXqJ7El81YwXlqsgWGz0ugcvruKfE+PAI8DVf5Z
	I08QM2N/fQzk8su5yfgy+t2l0E6+8uM26L4wwZkiHn1KzbbHC7njTiJg7UmoIFlINjmHvJWwArw
	YgQFEwYuRwWhbm9MAYQgGu/q8prjYHv5rAhG/EDekzURSSdXJqs0olvyUhS40SBK55Dlmf+2tuw
	0LmZprvREkHsJozOya8ncsuRX4ZjIAJkLQ3e32x7VEU9bCBI5EVYnBGZVmdovNDt9ULQh04yT5l
	kugHMhlUPIfUrfOTic3xAwLG8kvTPEJ1TzoaxNDX2HknrCELS5PkHmsBEZK/gn7W9fPz0jU826N
	SQfyYOOVWzznHHpA==
X-Received: by 2002:a05:6214:1d01:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b3e296dc23mr30614556d6.6.1777368845383;
        Tue, 28 Apr 2026 02:34:05 -0700 (PDT)
X-Received: by 2002:a05:6214:1d01:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b3e296dc23mr30614226d6.6.1777368845004;
        Tue, 28 Apr 2026 02:34:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb808e325a5sm73818666b.21.2026.04.28.02.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:34:04 -0700 (PDT)
Message-ID: <cfdee1a1-fa83-45b8-a33e-252a1998915d@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:34:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] arm64: dts: qcom: pmk8550: add VADC node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
 <20260427-topic-sm8x50-adc5-gen3-v1-2-8a70f7b90a75@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-topic-sm8x50-adc5-gen3-v1-2-8a70f7b90a75@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bl3FJAujqNna44_K95lO1daoVXohOMjN
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f07f0e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=I76Qk8w-AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ifCK-ypfc7Y0ayOvxkEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=vUPM0Wvl0xcrLs4nqPIT:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bl3FJAujqNna44_K95lO1daoVXohOMjN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MyBTYWx0ZWRfX6iwINK1jF+Za
 9tqNMzN5bdetid1oiebkikD0mmQYbkivfbNNZ2d4BVVO5XjTebfGISCBmYB7Xccl5l8XnXGVkVH
 kDA+vvZQfD0nmvAsfA3y1ZtXfo+7209GKaCW7RM50VOn7K2XZD+7oFdWbkyTrdq+XUhscZCiwGr
 XAZp/q5e1Ep7cTeRFU6R7yI3VjSHUjICCc0uTvUzttpQpSgP1XNkWO0/OXhMUGBZlAupoj0+6LM
 NX+zxAxZvmRcg4iWoMgolPWziI4ID6voEV4auJQHS0KQpgmpGyin4WE9JgwVfgjlgDtGEpJF8nc
 ZX6WI8fv8M18mivbpNkOdLLsrgGUSOfwH+ZSbTnbE7vu/QVkHHGd41TCIvknvSbOm4A7IWwUOhB
 KOw/5uugrTswXL0RBfihRde0DIHitPqGHLM30lkr1QGfvkr+uajxPB/JXhtlsVtAkw6+uRlyVKe
 nqcH58gLL5oWD2Bx39Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280083
X-Rspamd-Queue-Id: 93D294821F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104941-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 6:15 PM, Neil Armstrong wrote:
> Add the VADC node and the initial pmk8550 adc channels.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pmk8550.dtsi | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> index 3049eb6b46d7..92d57d101c7c 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom,pmk8550-adc5-gen3.h"
>  
>  / {
>  	reboot-mode {
> @@ -44,6 +45,36 @@ pon_resin: resin {
>  			};
>  		};
>  
> +

Stray \n above

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

FWIW there's at least this one in parallel, I don't know which one
will end up being picked

https://lore.kernel.org/linux-arm-msm/20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com/

Konrad

