Return-Path: <linux-arm-msm+bounces-35996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5DE9B1722
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 12:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DA9728184E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 10:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642001D27A6;
	Sat, 26 Oct 2024 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXO8DEZV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5311D0E23
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729939116; cv=none; b=Eb1X21nNNP2sAe4XvF4CbYEReJccSi1J6/DZR9bEYLMoKNjaYX+VEf5LSpdyiKTArfZq0J0SOAwNhJa1h/yeZtHrrscRNd008lt7NTqtYgBWQ/CUGkhAHYIpZ9pBz7QHES+oJ1xhzNZ4L8zhs3YBmmGFnVuVghTfVkEfvAbi3zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729939116; c=relaxed/simple;
	bh=+xRgg3fhgPIP1YSnRr4yzS2JuOYoT5uCAMmYIIJPZEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sydQE9/GfKUyCrdOt7P5cx3FC0kZ1II82KtDpTC7b5zQkABfT8ARdQEAJqn2PPevHCmM93OproEcVqPcpMhB4ZShnRd4lG/cyW6GdxA+qOMk1HCdHnvnFrksk4jIDEmHFipsHsFSKYfP2Wr/RnvRvgc28WF0IoZ0qdAi1SrrwM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXO8DEZV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q5tbPH022985
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vKgaBz+OM7kp9ryq5wJa26tHjWqT3i+ncuTFm68MDY0=; b=VXO8DEZV9jrdPtkc
	V5tpN0Ca+iEItuaxQz51+cxDBTkPQLldwM+r8FZB6H5EVaZMukKWw49ceQVdrSBX
	KGd+O9egcVtD1+XZewNsSTq4cQ1puB8lIyCCqFWbu8WKeMLlO3rxjhMiIkCqZBAV
	cPo/Cu6ywiMEfcZ2zJvto3/2eLGP5+z34XejHtSQxZn02oFpeJuwOa3GgeLoQKjl
	bEiLK50K6gYhDxH38BjrAS1dXe4tNkLZVeemjCXa/XCmQp7XqOfuGL9iZqyUpwTO
	rlHD5+EuMEu9hqSy0UNHLF5MDKgk2xTee/dhngLkpjiiMw7uS2lwVwo4IIJWTDE9
	EfqdBw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gsq88n62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:38:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbe6e6bcf2so8381966d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 03:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729939112; x=1730543912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vKgaBz+OM7kp9ryq5wJa26tHjWqT3i+ncuTFm68MDY0=;
        b=p8/NkUPRsa51K0rqUMuD3G1+D2Vwk+Y69oAchFloHxUXo7Bu+ZIWWxZoRmKj3/84Oa
         YLbZzX88tkw8TLLcdNHNuDr5BMIC/yIynvCGfuwTZHm1qyvThii8tRl7/qrQ522/xmG2
         XcMft0oy2QR1zBin8tQ5llpeWZi3/dYD5GSecJu7RhD5ddzwE3cd12IYdjYVvqj6d7Og
         tiELAVkwXRcXqjzrQCOKQNoKuFMQMufjOb1lGe1zpXbv33zaeBO7J8YJwhEjY9K5yz+0
         t0isZBj2EnKwNaLIIYzkMt1Ed7KV7ULHvQQCHEiR/agTLubpWUpsG9NK0BOJXfV41Dzk
         Jl8Q==
X-Gm-Message-State: AOJu0Yx+vOfFypSicio7eaIsuVvg2adlCSH/nR9zrg2i7c/+RI8LNCzf
	UD6qEaYMj8AyL/QUoCs8OHcBW+DVsZ5qocMN0WRrdEC8nSoAC0SGnF1l17WiNWH2uPh4TI7vZlu
	4qCzDA5RobjXdbhWJ8/BXPZhc+nzmXrBGg8aS0QsrOv+JtN5PDVxze8CFXCml6M5X
X-Received: by 2002:a05:6214:2583:b0:6c5:3338:45d6 with SMTP id 6a1803df08f44-6d18583be81mr15399756d6.11.1729939112532;
        Sat, 26 Oct 2024 03:38:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG48TEsenl/gfo2wEJ90YljffGk3CYZ1kvuJyTTVgNFgy3R7Zl1hGmz1Ocb2KYB93KAmKnzNg==
X-Received: by 2002:a05:6214:2583:b0:6c5:3338:45d6 with SMTP id 6a1803df08f44-6d18583be81mr15399686d6.11.1729939112244;
        Sat, 26 Oct 2024 03:38:32 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297335sm161298866b.121.2024.10.26.03.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 03:38:31 -0700 (PDT)
Message-ID: <9ac43c69-b3db-4f0f-a562-b8ef7d30530c@oss.qualcomm.com>
Date: Sat, 26 Oct 2024 12:38:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/12] arm64: dts: qcom: sdm845-starqltechn: add gpio
 keys
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-6-5445365d3052@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241008-starqltechn_integration_upstream-v6-6-5445365d3052@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vj3xi8D55NqMWPOhxOIt4zoWC-RNm22H
X-Proofpoint-ORIG-GUID: vj3xi8D55NqMWPOhxOIt4zoWC-RNm22H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410260089

On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
> Add support for phone buttons.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 
> ---
> Changes in v6:
> - refactor: s/starqltechn/sdm845-starqltechn in subject.
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index 5948b401165c..a3bd5231569d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -7,9 +7,11 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sdm845.dtsi"
> +#include "pm8998.dtsi"
>  
>  / {
>  	chassis-type = "handset";
> @@ -69,6 +71,25 @@ memory@a1300000 {
>  			pmsg-size = <0x40000>;
>  		};
>  	};
> +
> +	gpio_keys {

Node names must not contain underscores, use '-' instead

> +		compatible = "gpio-keys";
> +		autorepeat;
> +
> +		key-vol-up {
> +			label = "volume_up";

This is passed on to userspace, many DTs use a less programmer-y style,
like "Volume Up"

> +			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			debounce-interval = <15>;
> +		};
> +
> +		key-wink {
> +			label = "key_wink";

What's this key? Bixby?

Konrad

