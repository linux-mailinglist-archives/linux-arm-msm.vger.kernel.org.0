Return-Path: <linux-arm-msm+bounces-85753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E07A6CCDCF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 23:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB823301FA45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 22:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1D22D6E4B;
	Thu, 18 Dec 2025 22:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="ACu60Q17"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFDC175D53;
	Thu, 18 Dec 2025 22:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766097039; cv=none; b=byeL2saQit1JVMqfgI4EFcE2a9VPMM0V5FyJMfaDztBeDZ7J389OG06UtnWYit3b5dBaCFHft35Gkfttuje8oxKSst/fxsBZ2FCBHUWIFbITmswO4UIdHAXUov7B5z30U7j8cUwybJ89RhXYYR0RcRSgu48imzI2troDJgb7hgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766097039; c=relaxed/simple;
	bh=BB2f4XkNMwjpJCA7d7Gu5BIs3lQEQRZ+3RTXqtz0yBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kr6BOjrKQZ6G749umVIrqVltVbZAyGxyxTWJ/Sf4cxDijtmZpD6PFOxXI00bKqKim50aL9FEC4U20DHZez+JLlQEEfEuHY2PC1b8c8YZooIvQ4GClcnEyu+0PlLczcdtoTtZJ0z8N012fxpcRefnUzYPLRgYmFdj6bhnv2JqspQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=ACu60Q17; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 8C02753414F7;
	Thu, 18 Dec 2025 23:30:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1766097031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GHQdiHQsHalBFeqmlr5i652A4/pcc9GfzKPk6Cela7E=;
	b=ACu60Q17bPRNQDJ+oHX9AHNZeLIHntd6idTfWwBu9QpOx/WMv2U+h110f7tjv4TZW/TUYk
	sE3s1Y6C2rRnBsoBYkLOcJXSU5GdLcQxyXiRbUi/TZ42biNVMcRKIgYVeqVOyYVAnMMgyK
	5jojQFuNGSr4iQjXwXvMRr6YpH8acO0=
Message-ID: <eafdfb36-8c9d-4240-b476-f5e835df04b6@ixit.cz>
Date: Thu, 18 Dec 2025 23:30:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Enable known blocks and
 add placeholders
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251216-placeholders-v1-1-d7d544200e7c@ixit.cz>
 <f3ad33e4-1924-4a8e-8fe0-56487ea2c872@oss.qualcomm.com>
 <5199fe6a-550a-4366-bee2-d4ab08ed248b@ixit.cz>
 <5f1282b2-2447-4ce8-a943-90c88e7f5835@oss.qualcomm.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <5f1282b2-2447-4ce8-a943-90c88e7f5835@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/12/2025 16:28, Konrad Dybcio wrote:
> On 12/17/25 4:00 PM, David Heidelberg wrote:
>> On 17/12/2025 13:04, Konrad Dybcio wrote:
>>> On 12/16/25 9:34 PM, David Heidelberg via B4 Relay wrote:
>>>> From: David Heidelberg <david@ixit.cz>
>>>>
>>>> We know these devices are present; most of them are supported by
>>>> downstream and are close to the mainline kernels.
>>>>
>>>> This adds placeholders for:
>>>>    - front camera (imx371)
>>>>    - rear cameras (imx519, imx376k)
>>>>    - actuators
>>>>    - NFC node on i2c3
>>>>
>>>> This is very handy when rebasing the integration tree with
>>>> support for multiple different blocks at the same time.
>>>>
>>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>>> ---
>>>
>>> [...]
>>>
>>>> +&i2c3 {
>>>> +    clock-frequency = <400000>;
>>>> +
>>>> +    status = "okay";
>>>> +
>>>> +    /* nxp,nxp-nci-i2c @28 */
>>>
>>> This seems fairly straightforward to enable - could you just
>>> do that instead?
>>
>> I have patch for it in-tree, but most likely not correct. See notes in:
>>
>> https://gitlab.com/sdm845/sdm845-next/-/commit/eeb765bb1166e020a771ed712fec76b56da229ee
>>
>> For now, I can only confirm the device is on the i2c address.
> 
> Taking a look at just the names of the sdm845-qrd.dtsi/sony modifications for
> their sdm845 phones in downstream which I presume have the exact same chip anyway:
> 
> notes based on observation and driver (drivers/nfc/nq-nci.c)
> 
>          nq@28 {
>                  compatible = "qcom,nq-nci";
>                  reg = <0x28>;
>                  qcom,nq-irq = <&tlmm 63 0x00>; // interrupt, duplicated below
>                  qcom,nq-ven = <&tlmm 12 0x00>; // voltage enable, ACTIVE_HIGH
>                  qcom,nq-firm = <&tlmm 62 0x00>; // firmware download, ACTIVE_HIGH
>                  qcom,nq-clkreq = <&pm8998_gpios 21 0x00>; // clock enable, INPUT
>                  qcom,nq-esepwr = <&tlmm 116 0x00>; // eSE power enable, ACTIVE_HIGH
>                  interrupt-parent = <&tlmm>;
>                  interrupts = <63 0>;
> 		[... blurb ...]
>          };
> 
> 
>     pm8998_gpio_21: pm8998_gpio_21 {
>                  pins = "gpio21";
>                  function = "normal";
>                  input-enable;
>                  bias-pull-down;
>                  power-source = <1>;
>          };
> 
> 
>          /* GPIO_62: NFC_DWLD_EN */
>          sdm_gpio_62: sdm_gpio_62 {
>                  mux {
>                          pins = "gpio62";
>                          function = "gpio";
>                  };
> 
>                  config {
>                          pins = "gpio62";
>                          drive-strength = <2>;
>                          bias-disable;
>                          output-low;
>                  };
>          };
> 
> 
>          /* GPIO_63: NFC_IRQ */
>          sdm_gpio_63: sdm_gpio_63 {
>                  mux {
>                          pins = "gpio63";
>                          function = "gpio";
>                  };
> 
>                  config {
>                          pins = "gpio63";
>                          drive-strength = <2>;
>                          bias-pull-down;
>                          input-enable;
>                  };
>          };
> 
> 
>          /* GPIO_12 : NFC_VEN */
>          sdm_gpio_12: sdm_gpio_12 {
>                  mux {
>                          pins = "gpio12";
>                          function = "gpio";
>                  };
> 
>                  config {
>                          pins = "gpio12";
>                          drive-strength = <2>;
>                          bias-disable;
>                          output-low;
>                  };
>          };
> 
> Konrad

we have something similar, just different strengths (see below), but I 
would leave this into the point, when someone can properly verify the 
configuration and test it.

David

---

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi 
b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index f424ab6706cda..9218b622a0b3e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -670,7 +670,19 @@ &i2c3 {

         status = "okay";

-       /* nxp,nxp-nci-i2c @28 */
+       nfc@28 {
+               compatible = "nxp,nxp-nci-i2c";
+               reg = <0x28>;
+
+               interrupt-parent = <&tlmm>;
+               interrupts = <63 IRQ_TYPE_LEVEL_HIGH>;
+
+               enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+               firmware-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+
+               pinctrl-0 = <&nfc_default>;
+               pinctrl-names = "default";
+       };
  };

  &i2c10 {
@@ -884,6 +896,11 @@ &qupv3_id_0 {
         status = "okay";
  };

+&qup_i2c3_default {
+       drive-strength = <2>;
+       bias-disable;
+};
+
  &qup_i2c10_default {
         drive-strength = <2>;
         bias-disable;
@@ -1389,6 +1406,13 @@ speaker_default: speaker-default-state {
                 bias-pull-up;
                 output-high;
         };
+
+       nfc_default: nfc-default-state {
+               pins = "gpio12", "gpio62", "gpio63";
+               function = "gpio";
+               drive-strength = <6>;
+               bias-pull-up;
+       };
  };

  &venus {




-- 
David Heidelberg


