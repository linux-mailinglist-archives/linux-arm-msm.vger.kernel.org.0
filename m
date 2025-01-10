Return-Path: <linux-arm-msm+bounces-44690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EE5A08410
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 01:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B35CD188C506
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 00:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89951C683;
	Fri, 10 Jan 2025 00:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="poDt/96m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ABC11185
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 00:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736469356; cv=none; b=pseuogYmjuEebgB8QKTrkG40ARtAo45AMwfieScmSCS/celOM6wHDtuhZw5p8J4G6o6AnYPB1rdmilCdpN4DDCt7VQ0ASwY+/z+biXRD+VnsRsKnaDwCBWEURlnb6qmP+QT9MY4QgbzgZaPX/cL/2of0oaUMJ2t/Sn5WbMYX7AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736469356; c=relaxed/simple;
	bh=ZjANJklxJ8HFQQt8X9SqjHlyf6UUifs4owCh+hEWZuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZY8zX5KG1AhHP0z8elJz3gyxqIybw0fxxh7iwBvYxq4b++oB0TCWqukiIXY+qyg4ES2AHd8zlJgcyMcadJRE3x6bXiaw1REKB3BrNnOciEpLYoBq2xNNhJPf9EhwWqaH/wLZeJihnUOeUfffXl/QkaoetFquWQafI47WCw7rvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=poDt/96m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A0Xcmp028349
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 00:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oe1rsruyMti53hTvmk/Ip1i+43gft1ZrujGWKd4f6Ik=; b=poDt/96mPIkC7Y77
	bqKV52lH6/n3oqzBH4GXzHj6cYRYMDc+su0n8ZgREIUzCj+EdNZnaolmzYPHwDcY
	JCWGQp5RwDZ07FBhLtnx289uvsoLNqi2F164lMru2JGzWG92m0tMtkzoSZb6/YGr
	QZUEAexU4ZqX121nwei5Fz755LGlQgj4agUqProXumxO+Y3rhBCLHZUJUDF0u1Fn
	vGvMOaqUfNEhO5G49fXIKUfB3SOOYG8c/t8WUvNmXhTc3+wHqfYy3KV45rd91Ek2
	cG6er73HWOf8xfT6Xg+Q7FDKiRBsjBw1jF2/ZbusGwk0N3n92GPC9IghMVLiIsUK
	wN2EMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442s45003p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 00:35:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6f134dac1so39461785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 16:35:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736469353; x=1737074153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oe1rsruyMti53hTvmk/Ip1i+43gft1ZrujGWKd4f6Ik=;
        b=er0AVg8DIHARDRyTDehssandwp0C0H8Zbvsst9y6O3Nnq8/zT/4HKuKc/BMsP9nR5X
         e1o3STFyKppchmsi1mCHHs5b7z6Y4fPjT45sIzGyx5oJpYKbOmLH5xbMcPnqiFHWjFks
         01cAtQf22aG5DKxcaO5GtwH13tMHd6kT6+/c4XC72SO29yEvDmgbCj/v6qWEQAbqolAH
         qZ6o4P3dukKouLvkbfiur/ZrD92qofVqo0wfxcrt/f8+7NzQfRsibYBim2b5ubqK4XHt
         5vuzfF4AZqILfv4kipIpkS826obbvtJG7g9e7spD4pCdcXg8eEWEBNtMv4b2niqDmll6
         i34g==
X-Forwarded-Encrypted: i=1; AJvYcCWpkRbYnmvY962AfVWS3lx07bbG1Kj3xE3729fsN+BcjVjLULO6jxtQKYjoELo+BomLXanHj1GQNo/dlBts@vger.kernel.org
X-Gm-Message-State: AOJu0YzlukIJicL1L7G2y6m90IvgzXmtKArOf/AGD+3ynLe6tV8oVKJC
	wxKnt/m+mbB++2yW3aRM4NXbcxzarlHSFN2D+CRJBShXArO3QP5db0+6lW3tNMjZNjtvRsceILw
	wueTwF2Y7U0T+mNi5TZlgjELfAVULGIRgU5SgUNNKorEDhzRd1R3n1F6OHy79CKhd
X-Gm-Gg: ASbGncuR0ibeViXQVNVbNiJNJbhcvp8hLuGDTA+GLtxj0X7oOxhyV9c2HzClLMZ61AF
	7aFu4X9A8wnorlkzer+RTUPA39Uza7fPIE8/FhpKoKaLi/uU3kuys4DiDqBKxlSNnoX8BvmM2+Z
	ibImPnig8AI9nQUgxdiNy+Zih5spdy/lqgzcIoJi/Yxe9vni3m1vLDKCwm6ssCUhVYqZV8OTNr/
	DQucdydrKn0K6KEcYq6OL7hxqxK4mwKz3+iyWS25bZF8YxOo3SiN/ixz4nLGEJw1DWUX2r7zFHb
	u8MXcunO0d2eQq+X6XB03SlfbR3gDbseo0g=
X-Received: by 2002:ac8:7d05:0:b0:467:7472:7acd with SMTP id d75a77b69052e-46c70fd2800mr53796821cf.3.1736469352893;
        Thu, 09 Jan 2025 16:35:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYqfauF9r2bKmn+bRy+zwqYpwzrMNheTEFj6I8ULrsacqLb0zA2tTKmirZoCRybPaGYK/nlg==
X-Received: by 2002:ac8:7d05:0:b0:467:7472:7acd with SMTP id d75a77b69052e-46c70fd2800mr53796621cf.3.1736469352382;
        Thu, 09 Jan 2025 16:35:52 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a4132sm1081800a12.75.2025.01.09.16.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 16:35:51 -0800 (PST)
Message-ID: <34c524a5-ec67-400d-adb9-0fd083158a15@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 01:35:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] dt-bindings: bus: Add qcom,soc-sc7180 SoC
To: Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-3-swboyd@chromium.org>
 <7a64e927-235b-4d63-af59-f2c80464a9a1@oss.qualcomm.com>
 <CAE-0n53wX99ry88zOOuq6SPVpraiENheJ1T+HZri82x4gqZJ_w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAE-0n53wX99ry88zOOuq6SPVpraiENheJ1T+HZri82x4gqZJ_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HKAzYp6tJgshm07doq0uXdKz1tax7YZA
X-Proofpoint-GUID: HKAzYp6tJgshm07doq0uXdKz1tax7YZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=972
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100002

On 9.01.2025 10:51 PM, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2025-01-09 06:05:14)
>> On 8.01.2025 2:28 AM, Stephen Boyd wrote:
>>> Document the Qualcomm SC7180 System on a Chip (SoC). This SoC is made up
>>> of multiple devices that have their own bindings, therefore this binding
>>> is for a "bus" that is the SoC node.
>>>
>>> TODO: Document all child nodes. This is woefully incomplete but at least
>>> shows what is involved with describing an SoC node in dt schema.
>>
>> I'm not sure I'm a fan, because...
>>
>> [...]
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: qcom,soc-sc7180
>>> +      - const: simple-bus
>>> +
>>> +  '#address-cells':
>>> +    const: 2
>>> +
>>> +  '#size-cells':
>>> +    const: 2
>>> +
>>> +  clock-controller@100000:
>>> +    $ref: /schemas/clock/qcom,gcc-sc7180.yaml#
>>> +
>>> +  watchdog@17c10000:
>>> +    $ref: /schemas/watchdog/qcom-wdt.yaml#
>>> +
>>> +required:
>>> +  - compatible
>>> +  - '#address-cells'
>>> +  - '#size-cells'
>>> +  - clock-controller@100000
>>> +  - watchdog@17c10000
>>> +
>>> +additionalProperties: false
>>
>> ..this approach will make any dt node addition under /soc require
>> an additional bindings change, which sounds like absolute madness
> 
> We should pretty much know what nodes go under here though, because it's
> a chip that exists and doesn't change after the fact. I agree that it
> will be annoying during early development when everyone is modifying the
> same file to add their node, but that problem also exists with the dts
> files today so it doesn't seem like total madness. It's also nice to be
> able to look at one file and quickly find all the schemas for the SoC
> used, like a table of contents almost or a memory map for the chip.
> 
> One thing that I find annoying is that you have to put the whole soc
> node and child nodes in the example. Maybe we can omit the example
> because there are so many child nodes.

I guess I could get behind both your and my points.. My main worry is
the day-1-support-1234-long-patch-series where 5-10% of nodes is likely
to need some remodeling, with some hw needing to be re-described in a
different way before getting merged.

Rebasing that will be an even bigger mess, but I suppose it's doable..

The same stands for the every-now-and-then occasion when we decide that
e.g. block X is not really a clock-controller, but rather a power-manager
or something.. If someone wants to rely on stable bindings in their
non-Linux OS project, requiring constant node names is one more potential
point of failure.

>> I think additionalProperties: true would be sufficient here, like in
>> Documentation/devicetree/bindings/soc/imx/imx8m-soc.yaml
>>
> 
> Ok. That binding looks to be for the efuse properties of the SoC node
> itself? I was hoping to find another example of this "describe the whole
> SoC" sort of binding but that doesn't match. Is there one already out
> there? Should I move this binding to bindings/soc/qcom instead of
> bindings/bus?

I don't think anyone has done that in the past.. maaaaybe
Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
gets close with a loose "anything with a @unit-address" as "Peripherals",
but that's not what you're looking for..

As for the directory, it seems to be all over the place for other uses of
"xyz", "simple-bus":

Documentation/devicetree/bindings/arm/arm,realview.yaml
Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
Documentation/devicetree/bindings/net/marvell,dfx-server.yaml
Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml
Documentation/devicetree/bindings/soc/imx/imx8m-soc.yaml

Konrad

