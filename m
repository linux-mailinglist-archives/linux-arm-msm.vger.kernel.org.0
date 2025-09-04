Return-Path: <linux-arm-msm+bounces-72052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED12CB43C9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 15:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B2321C80699
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 13:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402B83002D8;
	Thu,  4 Sep 2025 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2YlZfvG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC12F28E0
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 13:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756991280; cv=none; b=g9QYlwyiG7xzkIMn6hVZz9vtEC9c3mQsHhR4J+bnPCUap2vUlecu9V/NSPNjiXLsB90Gz5PMN5YDZU6Rc+Rd8U4lwY86oEx+jYhGOU15pNJdeYGs9JzvLSd83E7mioPaUOGAnSvj222sWcuXpCcAZnMdkfA8BbFuZTsAgdnzT2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756991280; c=relaxed/simple;
	bh=i7Wda34KnkW6Mxr7vtlQckQo/CbsEm0PTQVYdp+T5xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WiHicHILtbkvZcD3p/Xt/9ZbEXk6tfnJoR9aoNDrwbrt036YuJ9v0o5aqu8J6loGcN1pvmNev21BHYAbuZ21lE1fXIhAXwM7k4Jh//pA908di+Cgd7ypZkZxJ0rTKKsGED2lm7lgddMAYa+Udu1z+y9DV3EOxcREH6kx/B/Cst4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2YlZfvG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XBXE013642
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 13:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Mtw+zFHKgxX84KUgMXqN5jBwQU2U9/gl7V5VWSgAWU=; b=Q2YlZfvG4o9UW02k
	2VII0m74/LXq2+KAz6t97mFJwlCCvWTVWyu2yKNWFrEiniPlrSQS7SWDh/DDl7Tc
	Mvn410RPsrzMgBUjY3DG7QomEUsl8s3V3bpEQxLvcQhm7YiY0mg5OgqyQygwwpNP
	jDyue7AxlEs2eQ6S3lAHmUknWcGJk+w/VRhTUrry+XZsk288P68dgnhQbBR4lpxx
	ZELotPA66tWDVikcgeTAyXvVsgS6ftKwhseBvTaPFqxK3jXX8Yk/ae4VDReawUQu
	fIQGDh4FxfbMSdK8tDMAp6Ohsu0WgHBud/KILIxsv0tR6ONxAjwbhFdHmZioy3tD
	9b0bqw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wybejs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 13:07:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77264a9408cso1815242b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 06:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991275; x=1757596075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Mtw+zFHKgxX84KUgMXqN5jBwQU2U9/gl7V5VWSgAWU=;
        b=J/soJqx77RXwH5Tb+crhjK53RAoIZEwffLP1g65tuavfBZYssSE582OIFURkHEv+Ve
         AIdB0h7lYio607n0C0krCUkq0aEri8PuRhAKmexQ4rPfUFhOM/THZigKc4ce+SDAfWMU
         XWgwe3W0AhU7LCEU2f0t3ahdZPkBwxCGGnY0KcKDkyCmtsAz8kwQFeQYa0wOqNKKFELZ
         MSDVAcwesId1fOEuuvdSLHBmviTm/3y7v6IeG/21Z7YXDbMzMO9CgBhfIUFhBWZ73SfS
         6n2vRQgCDix208YzoP2cXcV7XAaXS7Tg9m4xp2uHbUlOhBp52tkpMJDBQnLN4ORyAgk4
         OUdg==
X-Gm-Message-State: AOJu0YxEXXre05tYgOT/61WqyIZyA1PzOq+3iP1xXFHVEke6jtL6VlI8
	L9vMW7oBttJ4RGKp/y3JionauA0pfp6zcTdcKu2MrKoTgTaoblyvC6yW4T/rQgBuRzSf+wT0hSi
	vvgDn/QQWNTL8qWUoPziWXsSAKyRomrN67Uci85GiIwRQrbMWzNkpal7vtTxtd85DXZJk
X-Gm-Gg: ASbGncvbwUe+NbBgQZZElDHpWwpRlNY6gprH5n+QOP6y6qY/ag9CVrjdcuxWDwEQg/C
	nle81fN1EpFi+hlifqgfD3IGJKEPk5Neu6znTWReU2xcxKKltxaOaGLWTOG94oQYUJ6o71yrIXd
	OGIsei5aMshTVqogYhO0uOIRCF/VeO1tHw6dED8se9NkYyLCf3Sd1hH4XIOLQcpPPEcP4NfC1/0
	iPA+9BQ0WQB/dKqAfqnn+0T1jNxGpI1DulnB3lXYs4IUbp8VPTocfGd7BByhhxC1SmvWhQ/0yYP
	7mHDKeuH7SVO44HxTIA4Ie1CWuXqkwkKU7stVqosI1XlUaluXNcmybTdTgdXPT8h1ELpGwcD1s6
	c
X-Received: by 2002:aa7:8895:0:b0:772:3b9d:70f0 with SMTP id d2e1a72fcca58-7723e21a808mr24935250b3a.2.1756991274695;
        Thu, 04 Sep 2025 06:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOsIwWe48mV57+hdURmb7F/1RRflaAlxIyQfsmlF9Uie2Mg78PBmOG7S/u4oBd2+T479KtpA==
X-Received: by 2002:aa7:8895:0:b0:772:3b9d:70f0 with SMTP id d2e1a72fcca58-7723e21a808mr24935209b3a.2.1756991274177;
        Thu, 04 Sep 2025 06:07:54 -0700 (PDT)
Received: from [192.168.215.112] ([106.206.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772590e0519sm11838396b3a.84.2025.09.04.06.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 06:07:53 -0700 (PDT)
Message-ID: <099a7c48-c447-40d4-9076-570f5a5058a2@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 18:37:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: Add binding for gunyah watchdog
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250903-gunyah_watchdog-v1-1-3ae690530e4b@oss.qualcomm.com>
 <ea295ff6-5395-4470-afc2-76e5e2dc9fb5@kernel.org>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <ea295ff6-5395-4470-afc2-76e5e2dc9fb5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b98f2c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=0ySTwGsjrHEnVRIoGa4+sA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8
 a=gEfo2CItAAAA:8 a=NEAV23lmAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=7snBibKccnROOREnhvIA:9 a=QEXdDO2ut3YA:10 a=i6qsmYmKKdoA:10
 a=csto0wWSG80A:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: n4diVlJy_qgsggoFjQ-xpifGU74f3HKn
X-Proofpoint-ORIG-GUID: n4diVlJy_qgsggoFjQ-xpifGU74f3HKn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX1ZvQbuFLm/ZK
 P/HpZ8ifqhWvlM9t9pmrY9IDkFxFhWqVLiRwpu+ofh0d530Ta2bIu3D/FEM/9jBBTpGC3r1bhay
 u6d5UMIqnblz4AyEI9NfF60D/Gc6yK3xwNrW7vGuCCT+X5NQqBVIkxZk+Ux7mvonl4r7yuryeyF
 yf82Oq35fXuJndD77UQOg/M4IE9WZbm9XFmOhqISxvET5pr6XtIBtJeJa3MXx6vZ+p6u46KBkhT
 zdMKCUOJR9QKmw12T2L6zT7GN4lXK05g1wdtUZYWFnQu19qC8E+2zSUGo/23DgKbH98PWc02CH0
 O+y9lTCAx5vqDx7VMN5zVX6ikTjVOJQvOgBDU1CkIlKNrOUHe5Up3NuBGCBiqsXQrzx7KfmtjTZ
 eu6dcVXQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101


On 9/4/2025 3:22 PM, Krzysztof Kozlowski wrote:
> On 03/09/2025 21:33, Hrishabh Rajput via B4 Relay wrote:
>> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>
>> The Gunyah Hypervisor applies a devicetree overlay providing the
>> pretimeout interrupt for the Gunyah Watchdog that it will be using to
>> notify watchdog's pretimeout event. Add the DT bindings that Gunyah
>> adheres to for the hypervisor and watchdog.
> Wasn't tested, so limited review.
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>
Noted. Will go through the referenced links and update accordingly.
>> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>> ---
>>   .../bindings/watchdog/qcom,gh-watchdog.yaml        | 76 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  1 +
>>   2 files changed, 77 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.yaml b/Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.yaml
>> new file mode 100644
>> index 000000000000..bde8438c6242
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.yaml
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/watchdog/qcom,gh-watchdog.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Gunyah Virtual Watchdog
>> +
>> +maintainers:
>> +  - Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>> +
>> +description: |+
>> +  The Gunyah Hypervisor provides an SMC-based watchdog interface for its virtual
>> +  machines. The virtual machines use this information to determine the
>> +  pretimeout IRQ which the hypervisor will be using to communicate pretimeout
>> +  event.
>> +  See also: [1]
>> +
>> +  [1]: https://github.com/quic/gunyah-resource-manager/blob/1b23ceb0dfa010b3b6b5a5f7a4ec1e95b93ab99d/src/vm_creation/dto_construct.c#L519
>> +
>> +properties:
>> +  compatible:
>> +    allOf:
>> +      - const: gunyah-hypervisor
>> +      - const: simple-bus
> What? No.
>
> Don't create patches with AI.

This patch was not created with AI. Reference was taken from the patch [1].

That being said, I see your point about the mistakes which were made 
while adding the compatible "simple-bus".
I apologize for the same.

I will make sure `make dt_binding_check` passes with latest versions of 
dtschema and yamllint as pointed out by Rob and as should have been done 
with this patch as well.


[1] 
https://lore.kernel.org/all/20240222-gunyah-v17-2-1e9da6763d38@quicinc.com/


Thanks,

Hrishabh

>> +
>> +  "#address-cells":
>> +    description: Number of cells needed to represent 64-bit capability IDs.
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    description: must be 0, because capability IDs are not memory address
>> +                  ranges and do not have a size.
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^gh-watchdog":
>
> I could not express more: NAK. Does not match any DT style. Please do
> some internal reviews first. This patch does not meet minimum quality
> criteria for public posting.
>
>
> Best regards,
> Krzysztof

