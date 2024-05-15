Return-Path: <linux-arm-msm+bounces-19869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA608C6277
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 10:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF05D1F22F46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 08:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3104AEDD;
	Wed, 15 May 2024 08:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rO6y9sDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221814AEE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 08:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715760223; cv=none; b=JANn0YDFaxZGrc6bPMSV/CqVxgANnfVrVSwKq5av/sENqKHKzg6RSdsHbVE1bTzc0m/GUEt9u8cNSJY4E1yD2bNyoHWA9EdKzo+zstIHXWN9s9/mmcCq9lApsAgOD1HbapFe4FWwkEFxMtByU1LAaCar40bho1ar+upFtp0rVUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715760223; c=relaxed/simple;
	bh=VH9txt46L4P36L40P+7h3wObatnHZuVpGod7pcvsnpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hduvKEsS59bEe+YqslP6Sm+WBllGkRcLANPBqJSZZbSearkON7J4UfHL/Q3/HmnRkK5Mqtf3doEtIJacWmYG8hUPh7hiB7ZP8CASwoKixPyzwmPWhRcf/EXLMHfbtSO/tyLalNiqe/jLCeUv/vKFDXlPA2YEj2Sez9kYEelTMtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rO6y9sDE; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e4b90b03a9so72014621fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 01:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715760219; x=1716365019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R04O4/+uapb3Pagg8ZXSnZwmMA9rR8+o1ejwqMPkjdk=;
        b=rO6y9sDER7lQl7VEYZaDGtYgROFvUBW96HRWjFyGOlO/OTov6G1iQsWXrIWUrGGMCR
         XhiqI2DnSgWzD5Ws3/x/ac6OQTp25CtbbThmt472C/0WXhNSrPLZ3aDe6bWD9He1Yr2l
         05qqXe7SU40uZxFJmOw92re9GYaIZqCNynErvLvKI8OEWYJfh5qGvlrDJBu1dtKtMTUA
         EC/Sk5EOEDbvWmMDKXR63Uqx/GjwQCFlID3bnEZpnfBpE6BBXObnMsmBaf5hC5RxXwR3
         HLEc9HkGidxPGgu1oX+xAPPTkmtK0c97Kg6XdXzFqo+ZocXiWNdVF11Nz8oQqu20I316
         ij5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715760219; x=1716365019;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R04O4/+uapb3Pagg8ZXSnZwmMA9rR8+o1ejwqMPkjdk=;
        b=E7w0K7ZFBex0jmEsgzsxoyTFyrGZEmZeeRiX0nWQAOn03NwSCJJlxsvlvGsSnexOlO
         9cxsoeTRvW0fI0CXKDswNsCJ5SD4xM1xcSo8eAs0NjB51ZGrc26pPWb/fXYBlWgGtplg
         n18Rrb1WEp+tV8te0xH5kUdQexFYq6CqLnI4lVgehwO2MZ01MBxEdNPkOPf1tpyv6MBc
         dYWcdkcp4qH+S3BBn3Vq66p6li5527QOf+ANhL5zAY7cwffObmOTahTdZA6mfYe8WsXR
         jINPZLZhPjuL4WdqugeFtttMpGSwrwEJl60uRUommbLlud3p4b3vg0SyqNxe9cuaAOCK
         Cd6g==
X-Forwarded-Encrypted: i=1; AJvYcCXABBrARBGXLVTddVmsMDJn8VF3RSeGuWIyG3ooOMt8IToaemXn1fJddVv+W1sEaheVW7/L/EIC9+LRtR51lKWjEtHP99fhH8kDdl1vfQ==
X-Gm-Message-State: AOJu0YzDBAfuIJ0Wrz6dTCQ75D5iWtkxNmSKbxdFaCl2PGZ5wk7o2OJg
	aNcOMYuRnOpAbIywzgHQw2XcWgYYuW1UpH+YLevpqmMEN8eyAHSYqMXKx7067j4=
X-Google-Smtp-Source: AGHT+IFtdXWk+XPXvaBplFUmiQVxNdck1a7Vh7kOUzVnhb7FDeeuJyPAnxtf1CxsBH0hkDIPvgRv2w==
X-Received: by 2002:a2e:a98a:0:b0:2e6:f769:5124 with SMTP id 38308e7fff4ca-2e6f769532emr8715491fa.39.1715760218543;
        Wed, 15 May 2024 01:03:38 -0700 (PDT)
Received: from [10.91.0.75] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbbec5sm15620651f8f.95.2024.05.15.01.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 01:03:38 -0700 (PDT)
Message-ID: <f6de4e1a-b3fa-457e-8819-041b2fb8739a@linaro.org>
Date: Wed, 15 May 2024 10:03:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: ufs: qcom: Use 'ufshc' as the node name
 for UFS controller nodes
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Conor Dooley <conor@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240514-ufs-nodename-fix-v1-0-4c55483ac401@linaro.org>
 <20240514-ufs-nodename-fix-v1-1-4c55483ac401@linaro.org>
 <20240514-buggy-sighing-1573000e3f52@spud> <20240515075005.GC2445@thinkpad>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240515075005.GC2445@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/05/2024 09:50, Manivannan Sadhasivam wrote:
> On Tue, May 14, 2024 at 07:50:15PM +0100, Conor Dooley wrote:
>> On Tue, May 14, 2024 at 03:08:40PM +0200, Manivannan Sadhasivam wrote:
>>> Devicetree binding has documented the node name for UFS controllers as
>>> 'ufshc'. So let's use it instead of 'ufs' which is for the UFS devices.
>>
>> Can you point out where that's been documented?
> 
> Typo here. s/Devicetree binding/Devicetree spec
> 
> https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter2-devicetree-basics.rst#generic-names-recommendation

I read your explanation in DT spec commit:

"In a lot of places, 'ufs' is used as the node name to identify the host
    controller, but it is wrong since 'ufs' denotes 'UFS device'."

but isn't this the same as with MMC? We do not call the nodes "mmchc" or
"mmch", even though all of them are hosts, because "mmc" is the card.
The same for most of other storage devices. Or USB. The term
"controller" appears only for few cases like clocks, resets and power.

When looking at storage nodes, ufsHC is an exception here.

Best regards,
Krzysztof


