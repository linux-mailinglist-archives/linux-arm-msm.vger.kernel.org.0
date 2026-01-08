Return-Path: <linux-arm-msm+bounces-88087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B514D03F9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B944E314B23A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C0B4E3797;
	Thu,  8 Jan 2026 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7IwSznb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4AC2D46D9
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767877322; cv=none; b=OmNX0ol+hTerZ4c6QuqCM0mgE+/Cq+tlEe9n3hWfVnbAKKxO2Ht4+vnqrhCY1wYs78jrPWYaq0M1RI4uDUzkVc+akxJsJQvgfX8IMXy14X9BFtO4ymiBIrpKqYR/1U4SGYUHV08A/AU83oWYMydzIRESu1ZZ8hMcuoD+HHVmf78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767877322; c=relaxed/simple;
	bh=+2nlY4acJgu7h9Eenmr7hGs2bJ+9UO4JaRvnsRPVtgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gaNMP+Ak8pTTZfc77pEzZqaLFk2yLmS2CNaiPl5eh7JDF5vzQL8g1Sf2Whh5/rhs7HkxMHiRWjw0C5nBTz9i5s4RBFogLtGFNDuCetoZSDTZ07zPbGoGUXByRmEwf42bT3XPLmTY+kXvo5zjvOZAdIvnKGq61XQhwybtmIgn7Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7IwSznb; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7f121c00dedso2796060b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 05:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767877320; x=1768482120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhMPSQHGQIzOorAJaD3RnY6gMKj70DgK1/kssz98Fqo=;
        b=k7IwSznbIvqTH1MjWSyhSSx3YHtzB1HANiPQs/zd17a1UYgEw9fUajajoSN6fT3PyF
         PZ8YL+Hfyqtp0aHtEfj3pmzlmcm9l/zkiT0A++CSUx5SoY+RiI5rukH+eDrLtBNByx9X
         551AQBKyYyHjiJcUDnGRtM8GrXUrwutRF6QLQbjHfLMaw/qF0MEtEzYp9aMyg3tUf/T7
         Y1Bz4weA5h88IfRXaVe9+ISJTpNFFwK1xAXl1N5xecT8Q21WNW9wDWEhiUfjl3WW6SHZ
         PNB59E0m0mzAHbYIviLELcMt51nvz/uyLbrUHuxnxnMBqFA2qVdsLTIokU78j3k8p8Rd
         vRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767877320; x=1768482120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhMPSQHGQIzOorAJaD3RnY6gMKj70DgK1/kssz98Fqo=;
        b=tjWHaptVgtAAtPZZNedXATxUZn05YAGuOBXnojKxNHGQVMxxR4WS4BF/ih4kBA2ndU
         256XD8RtJYaPf9Ptynkl7RBvnITcrWUrmOq7MJuYM6x4o+Lpme9l5Vx7dMn5G90QOPgV
         39Yw1RIVmD+s+YJBZhCdVg+MgqGwMi8h1IMaYSaEm793RHPH3zlCwrfSiIBpoDwFGqPD
         Z5ZsAq0yfIcp0ZU2zFQAvJ4Fe/6l85ofVDdB+Fq6ZhMRnOa95nWQVALAcVPzb20Ip2Vz
         SEf4kxP5RUacAH6k97S4r0uN01wQCXVnBs8MZnClIEYw2AAI9uT+cI+6tElXtOXbRuKf
         OKJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgTBDD2KHDlY0rbLoMLKXqwjo173lvrwWOA+TG1BthoF/Ubc7JSdiWthgSTlrdJDAnwa7Q3QsFF80qjdoi@vger.kernel.org
X-Gm-Message-State: AOJu0YxC/xHVkwIIjkKWf+kayUfiHoAiHS848S40uK0fKtcqe0EZltnP
	3k+W7BmvfoFpW8OwTL9qaxFguNhrypI3AdxVR84Uj/RKnZE6ZfWgujAm
X-Gm-Gg: AY/fxX6hHs5NcC36WJUtImwgX2xfO0zO9EOQDv8OH4E1qk/zqBV4TAS8OgxonFvpr/T
	0AENp7J7AoorO6VollCPynuAFblMZaYRQL4bJKnrugFw53SEyx9H1MYm0nHuvUG/+z9HIjgGxmS
	hz2t4LlxGW//UGdj3v3tPGfQQJdvwcXF+Q9G0DiBbVHGtaANhxy+Gfdcv/22HLJ6ZRljr31sY3w
	VmPmqKTojuaE0LGrZMxyVGr7JkeDtxxdakDhEJelWArjyvBNcDHZgFNuZ+k+assi66SEPPPgd3k
	D/h3TCL5HLp3D0zmHIcjMuRW9LLmfByoJsZ6lK5aKf7+cYY3csU88zo0NQwAmbna9BJV0Aa4rCD
	o6X4N1mTpetlnLIVJPthpDQdKCvS8tENhHu7lqnVu1IxfsZAPyyPxAVeXZga+6fmi0RDKLuLriL
	6oVfRMva7Zuk2tQOV0b7zLQ5V2zCWPnkt6
X-Google-Smtp-Source: AGHT+IG58rlfxspn/kFapWi4+Z1BtMmNV4nYEmy6MgLlMRA9lzpBsFqdtqwbTBQvgAd11fXY7G7KKg==
X-Received: by 2002:a05:6a20:a10e:b0:33c:2154:d4f4 with SMTP id adf61e73a8af0-3898f9975b1mr5814469637.49.1767877319352;
        Thu, 08 Jan 2026 05:01:59 -0800 (PST)
Received: from [172.16.20.12] ([136.226.245.1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc05cd9d9sm8466111a12.16.2026.01.08.05.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:01:58 -0800 (PST)
Message-ID: <46fac652-e6bd-43c9-a57e-e76d66239407@gmail.com>
Date: Thu, 8 Jan 2026 18:32:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-6-tessolveupstream@gmail.com>
 <30ee8541-3ec2-49ac-8fe0-987cdc5b16e7@oss.qualcomm.com>
 <14613f89-6be0-4eb3-beb5-375ab008a313@gmail.com>
 <c3492b90-bb48-4584-99fd-b1b6832d22ff@gmail.com>
 <4d95232c-f59a-42c3-9eb4-934b58429d25@oss.qualcomm.com>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <4d95232c-f59a-42c3-9eb4-934b58429d25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08-01-2026 14:06, Konrad Dybcio wrote:
>>>>> + */
>>>>> +/dts-v1/;
>>>>> +/plugin/;
>>>>> +
>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>> +
>>>>> +&{/} {
>>>>> +	backlight: backlight {
>>>>> +		compatible = "gpio-backlight";
>>>>> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
>>>>> +			<&tlmm 115 GPIO_ACTIVE_HIGH>;
>>>>> +		default-on;
>>>>> +	};
>>>>> +
>>>>> +	hdmi_connector: hdmi-out {
>>>>> +		status = "disabled";
>>>>> +	};
>>>> This should be a &label_reference
>>>>
>>> Okay, will add it in the next patch.
>> I noticed that in several existing .dtso files, the root node is
>> commonly referenced as &{/}. In your comment, you suggested using &label_reference. Could you please clarify which specific label or 
>> node you would like me to update here.
> &{/} must be used for root nodes in a .dtso (for it to compile). I meant
> using a &label_reference for hdmi_connector

Thank you for clarifying. I’ve updated the patch to move 
hdmi_connector out of the root node and reference it using 
&hdmi_connector instead of defining it under &{/} like below:

git diff arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,
index 5393d1dc7fea..bd1cbfc866b7 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
+++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
@@ -15,10 +15,6 @@ backlight: backlight {
                default-on;
        };

-       hdmi_connector: hdmi-out {
-               status = "disabled";
-       };
-
        panel-lvds {
                compatible = "auo,g133han01";

@@ -49,6 +45,10 @@ lvds_panel_out_b: endpoint {
        };
 };

+&hdmi_connector {
+       status = "disabled";
+};
+
 &i2c1 {
        clock-frequency = <400000>;

Could you please confirm if this change aligns with your 
expectation.




