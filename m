Return-Path: <linux-arm-msm+bounces-105750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLclBtii+GlExQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:44:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C21294BE032
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CD63B3002D29
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 13:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AF43DCD88;
	Mon,  4 May 2026 13:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="IARYnIuF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DA935A388
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 13:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777901684; cv=none; b=lEZzQVSwufk8rX9sd4X4ycc1EDalu13gzc3x57ISTypnvy1bDQuYIplbgqx6ZPBIcLUACXXZg6hmGG9qHOd7EE9nzqTEi5TFrymufEw97iOdEZsNzsUlc8i/jB+pKr3KPO7rBMb0CYVMDWUxxqxuiO9E9OgwToL9poA2lUoAJQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777901684; c=relaxed/simple;
	bh=fE/FMqRtr05uo+J0w0E8qsFyUlmDDBPKI19czQaErzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GsLVA8Mk11yAkUgtxoxGKra9ugXu6yVWan9wEIe1/YxfK+2G2JGD4ShYQO6k1fnxAzKW+b5z7BBZmBYo4++SDikyW37FbQitoZ2Ch6y+ZsWjJ0OyJxpP9XcwA3m+AwSM+eOOJjrsbXkJNrXuUzn1FakXUNsoy2nED1SXU9TYZNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=IARYnIuF; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5102582e23eso31434721cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 06:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777901678; x=1778506478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1O51d4ds85yTh8lyD3JZ4q7u8vPdQtNHSLTt8d3PVfM=;
        b=IARYnIuF1jJJrB45HAzJaAtwE+AeyXoN91edqT8qe4dqB9eycPEBOeLfpbjRndv2p7
         b1KTlNc/O7xHE8z8JpMGnwfuvFJOsigZyTVXl9Dzv3zHK3rS12ZhVun3jts6+mXEGbmw
         70OKRfGlkhCJrz8BtUen4+30f0EA2u0RZqvTLPUb4ZInITmwks28S48SG273UIh+Dafz
         J+dLHOlNYGpwQGzTTLA8thF81/iZcz62YxDr6puMELr40aJJPq99InHfWYgqNGBkjfhA
         saRoIlS47YYiU6OqLCOdreoTIPFJVBwtTe2xXAvwWc3S+wjEVEfKGKHCJVvDqdaWHouy
         U3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777901678; x=1778506478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1O51d4ds85yTh8lyD3JZ4q7u8vPdQtNHSLTt8d3PVfM=;
        b=aNfMjJ8RNYbDzSwbCV66J2qIPwcwG2R7/xf2IPLb22+ni9zJZaQZGU20zqVcrXOTSH
         eRCmtrmHgPY9Z9zcVUYXW1W8J8g8EDcJf61SSs0ndiCPchQTySWqiS1gbeKVgzPBlPx7
         bs+0uHB0mAZ9+cirEvgbVbVD0sU7paq/NlP4H8oQF3AyaEKvgDOvE2x3cc1UBQ1fwsVq
         0O9gJtZg3m8hfo64QBGXBNo/evZs33SJ6IhGYGel9aB4E6kRO4bFDd7P1OniMlUWSY8+
         TknPRtpj6uCb5gRk+izDPUL9Uw5dhTpVGYMTbFXq4tgfW5PHcbxJGxRfixlLGNkLPGFP
         l8UQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ci7XP3xJ50CTsSuhdpCSY2ZzTxx9CRmpXobqNHsTNbF0xrN1rPkQnCpfvVlV+Om+QcKJSo/DmN68CnqNQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwGJz5jkvssBjhgFcRbAVr9IJSM1tNcvZQ+zNlEVOt+PZ7oI8k8
	s4sMeGzFNcXXAwtTNDgE3rR7yJWn86us4fQ3GR81pef6xabr+Fv0GVuGAF1qhVqFjEM=
X-Gm-Gg: AeBDiesOrlBmsivr5Ckg2QMQqrFWERA7eDP83XUVIP2XjUHciMPxAcODZ0X4I5GiSVt
	hPMTp35glEszd0HQF7tS1ByTQedK/7knZFnGOGFTar/uEFwtUos3mZmqIvaa4XgVLEuVdnlFMAa
	8wX9RWOb0eDdzGy2MWMvE/WB2HmrMSdlc0b6+H3AlZXzXfwiI+iulLHtpR1qeQELnEEihWArk3d
	0dbspQv6z9nZtjEZDuZEWJN9uyZ67lSkhFV8FjyKTtRRkjIUvijEtzaWoFEE5lGYD2VQrb++v9i
	dr8DrU1xr0Q8kctebyFFEuWFtKNhX8bFSGhqaqrVwZdXRGLGAuAD+3S4JIhRnfD8E+APg9TgVja
	txHJlaLj84XWts0dOziI25qdnTm8pBDQWWRLpCdxzSMIIP8xsHxAege5e3xI2Rsg9WctT7HaTPn
	iMsgRLFnchCDXg5tSR8DUPo2+/mZnO5QQoa4GL+Kq9zDm72zWxYvjiR6s2bTKG0M4LUVytUnyT5
	Q==
X-Received: by 2002:a05:622a:48a:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-5104bde3d42mr142601201cf.11.1777901678300;
        Mon, 04 May 2026 06:34:38 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91c807sm1137764785a.32.2026.05.04.06.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:34:37 -0700 (PDT)
Message-ID: <164fb5ca-9c42-46ad-a13c-3757ff5d2fdd@riscstar.com>
Date: Mon, 4 May 2026 08:34:33 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, matthew.gerlach@altera.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <20260504-fascinating-teal-tarsier-b116c8@quoll>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260504-fascinating-teal-tarsier-b116c8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C21294BE032
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.94 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105750-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	R_DKIM_ALLOW(0.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.717];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,riscstar.com:email,1c:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,devicetree.org:url,0.0.0.0:email]

On 5/4/26 6:00 AM, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 10:54:16AM -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
>> bridges.
>>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/net/toshiba,tc956x-dwmac.yaml    | 111 ++++++++++++++++++
>>   1 file changed, 111 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>> new file mode 100644
>> index 0000000000000..d95d22a3761da
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>> @@ -0,0 +1,111 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/toshiba,tc956x-dwmac.yaml#
> 
> Filename and here: toshiba,tc9564-dwmac
> (s/x/4/)
> 
> 
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Toshiba TC956x Ethernet-AVB/TSN Controller
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +  - Daniel Thompson <daniel@riscstar.com>
>> +
>> +description: |
>> +  This node provides properties for configuring the Ethernet PCI functions
>> +  that are attached to the internal downstream port of the TC956x's PCIe
>> +  switch.
> 
> Describe rather the hardware directly, not the DTS or the binding
> itself.
> 
> Just say what is the hardware, what is consists of, what is less
> obvious or usual (if there is such).

I understand what you're saying.  We will reword this to focus
on the hardware in version 2.

> 
>> +
>> +  TC956x are a family of Ethernet-AVB/TSN bridge chips that combine a PCIe
>> +  switch together with a number of Ethernet controllers. These bindings
>> +  cover only the Ethernet functions of these devices.
> 
> What about the rest of the hardware - a PCIe switch? Shouldn't it be
> described?

It maybe should, just to provide a more complete picture.  It's
a little strange, because the PCIe switch support (or at least
its power controller) was already upstreamed:

  
https://lore.kernel.org/all/20251101-tc9563-v9-0-de3429f7787a@oss.qualcomm.com/

That introduced DeviceTree bindings for a PCI device, which is
itself sort of spanning two worlds of discoverability.

That code focused on the *switch*.  This series is focused on
the *Ethernet interfaces*.  But the "chip" has several other
components, some of which (GPIO anyway, for now) also need to
be modeled.

I want to talk more with Daniel about this but either way we
will revisit this and will attempt to describe the hardware in
a more complete way when we send out v2.

>> +
>> +allOf:
>> +  - $ref: /schemas/pci/pci-bus-common.yaml#
>> +  - $ref: /schemas/pci/pci-device.yaml#
>> +
>> +unevaluatedProperties: false
> 
> Place both (allOf+unevaluatedProperties) after "required:".

OK.

> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
>> +
>> +  "#gpio-cells":
>> +    const: 2
>> +
>> +  gpio-controller: true
>> +
>> +  # We can't allOf reference Ethernet-controller.yaml because we end up with
> 
> s/Ethernet-controller.yaml/ethernet-controller.yaml/

OK.

> 
>> +  # contradictory $nodename rules (`ethernet@` versus `pci@`). Happily only a
> 
> But which schema requires pci@ for devices? If I am not mistaken, only
> dtschema/schemas/pci/pci-bus-common.yaml requires it, and it does not
> apply to actual PCI device.

We'll revisit this and will simplify/clarify if possible in v2.

>> +  # small number of the properties are useful on TC956x so we can just reference
>> +  # what we need.
>> +  phy-connection-type:
>> +    $ref: ethernet-controller.yaml#/properties/phy-connection-type
>> +
>> +  phy-handle:
>> +    $ref: ethernet-controller.yaml#/properties/phy-handle
>> +
>> +  phy-mode:
>> +    $ref: ethernet-controller.yaml#/properties/phy-mode
>> +
>> +  mdio:
>> +    $ref: snps,dwmac.yaml#/properties/mdio
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +examples:
>> +  - |
>> +    pcie {
>> +      #address-cells = <3>;
>> +      #size-cells = <2>;
>> +
>> +      tc956x_emac0: pci@0,0 {
>> +        compatible = "pci1179,0220";
>> +        reg = <0x50000 0x0 0x0 0x0 0x0>;
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        device_type = "pci";
>> +        ranges;
>> +
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +
>> +        phy-mode = "10gbase-r";
>> +        phy-handle = <&tc956x_emac0_phy>;
>> +
>> +        mdio {
>> +          compatible = "snps,dwmac-mdio";
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          tc956x_emac0_phy: ethernet-phy@1c {
>> +            compatible = "ethernet-phy-id311c.1c12";
>> +            reg = <0x1c>;
>> +          };
>> +        };
>> +      };
> 
> Keep only one example, unless you have different properties (not their
> values, but their presence),

OK.  Thanks a lot for your review Krzysztof.

					-Alex
> 
> 
> Best regards,
> Krzysztof
> 


