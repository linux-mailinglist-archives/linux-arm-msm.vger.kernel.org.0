Return-Path: <linux-arm-msm+bounces-15525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C669388FAC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 10:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3073AB25818
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 09:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114B25F569;
	Thu, 28 Mar 2024 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="chZdz0rP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E9454BCB
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 09:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711616877; cv=none; b=kiNH6TsEbdw4wdpedl4eFJPKHjXkCxeOY4i79fyiilZDPxX71jzOEGjXE5asrz2EcmS9YYlku3XzO7aiHpwWz3RP1TKk7dRez7Sc3HxPVaXRJE9SX8dIAfrhmXB+LBH3YsS6JYsT1Y6SvYKlcpmJtWTWMeo34gBXdJO8nsaiHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711616877; c=relaxed/simple;
	bh=r07Cs5KLVKu0tASlS5/D4hIpCN56cfKcWsy0e5UUZQk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BCcH3zpMpXb4C2JsOnQsArcUM6bPIFgJOuiTYNx29xbzW4y5o23Y62bxuK2WFlYoyLDuu0ZhA8vMtymxvTVHyGaeJW0ZrQADHJnkWryJYBkfqQFUt3GXPxZDBdUruAi8TPvWGAkt1mBMyPjcv5jm8qKYXgOWXn01sVJDFSF6zIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=chZdz0rP; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d6dda3adb9so7164391fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 02:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711616873; x=1712221673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKXwHmc4cXcL+3XlaHJcygoE0sPqn2G65Y8JY5URJDs=;
        b=chZdz0rPXJUzdYHUXGX1+Tn54hZrjswXrlrLcfzv40119yQ693s8sTA84l1I0fEsRo
         cajI5SNFlgxDdD7Bif4X8MKJq60AqXYEAMn8yDCxM4exhqmaHOWA9S8ysK9lzXXW72s+
         jKz3qn5LTjXJJqqvRWmHd3pzrrwdYSUMoRkeQ3r9ZOEsUOz2yOiJrIGbNkZ38DIwupC8
         WjXo5xY+HVS5DTg117m7XBqnn6tFvBqR0yvkR0r/izJvmRI9Ak1Jr01v4jRXV3RjFgik
         +f7Qj+K8Wb24U98Y50bEE+NJ2Kjb9u/uMXMaDiee4DSz/oBQs2l5Qef2//mzbDKtpeHm
         F/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711616873; x=1712221673;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yKXwHmc4cXcL+3XlaHJcygoE0sPqn2G65Y8JY5URJDs=;
        b=a0LsPWl9i2ZY6gZDkEhICBLRfSphUQeLR6TjbvjGgxb4aopgv/4tbBmS3uIbawxFZF
         cOA+J2nsz6P34+rHFWboPHmsGb8+6HtakXYKYY17xJY+g7yszCHZcbUN2MrLhBYsmF8E
         L5xhR3sbqYcUdHkZS2NP0mm70MDdQGpEjrTOrhvexjd2gSoOJQKV3tsU/Dr/2XviSGnL
         6/pXTMn10uMJtvFz44i5bIC8PSZixaK6RyN27upPIkv5eqFlWQsoUvydoThr4tO+zn1d
         PTWYbhwD5VNdevz1Qfj+zway1cwWK7hcxrNyCyjPBsaRiKD4vx8qRHy+9OEEWsd9Np7m
         Q3Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXF5G5X9/YPdkfHu5t5iw06KbeBZETF9o6ZrtO2TMVjhxxa4+iICSrcMASS/j9d32g7YerGh9NGpmxYvTz9ChKqlZ8q53qR7mk+/Wq+dA==
X-Gm-Message-State: AOJu0Yww6mal9mMjmzfN9WKJvc4nvuiqeAy1GQUghjyUY/3pM/JF0hcW
	/sHyalbpsvbB/vypsAcXtgUkQ9NSGIfm4YmL68BRO69FvFyMPcXsBEOO2k2j4/I=
X-Google-Smtp-Source: AGHT+IFan8kG+r3iVU6A8LgXX5xHcdF5eGLJCwQMzUJRaJjaVzQi8QQwkp8heq/oAlpdTtpsfmu/wg==
X-Received: by 2002:a2e:a40e:0:b0:2d6:ec7b:b69b with SMTP id p14-20020a2ea40e000000b002d6ec7bb69bmr1228173ljn.7.1711616873130;
        Thu, 28 Mar 2024 02:07:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6306:1c7a:72c2:892a? ([2a01:e0a:982:cbb0:6306:1c7a:72c2:892a])
        by smtp.gmail.com with ESMTPSA id hg6-20020a05600c538600b004148ff6ef54sm1622433wmb.29.2024.03.28.02.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 02:07:52 -0700 (PDT)
Message-ID: <ab749f2d-269f-40bb-b6ab-b19fd7243eed@linaro.org>
Date: Thu, 28 Mar 2024 10:07:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RESEND v6 0/5] spmi: pmic-arb: Add support for multiple
 buses
To: Abel Vesa <abel.vesa@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Abel,

On 26/03/2024 17:28, Abel Vesa wrote:
> This RFC prepares for and adds support for 2 buses, which is supported
> in HW starting with version 7. Until now, none of the currently
> supported platforms in upstream have used the second bus. The X1E80100
> platform, on the other hand, needs the second bus for the USB2.0 to work
> as there are 3 SMB2360 PMICs which provide eUSB2 repeaters and they are
> all found on the second bus.

@Dmitry, @Konrad, @Bjorn, could you apply those patches and test an devices
you have to make sure there's no regression ?

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v6:
> - Changed the compatible to platform specific (X1E80100) along with the
>    schema. Fixed the spmi buses unit addresses and added the empty ranges
>    property. Added missing properties to the spmi buses and the
>    "unevaluatedProperties: false".
> - Deprecated the "qcom,bus-id" in the legacy schema.
> - Changed the driver to check for legacy compatible first
> - Link to v5: https://lore.kernel.org/r/20240221-spmi-multi-master-support-v5-0-3255ca413a0b@linaro.org
> 
> Changes in v5:
> - Dropped the RFC as there aren't any concerns about the approach anymore
> - Dropped the unused dev and res variables from pmic_arb_get_obsrvr_chnls_v2
> - Link to v4: https://lore.kernel.org/r/20240220-spmi-multi-master-support-v4-0-dc813c878ba8@linaro.org
> 
> Changes in v4:
> - Fixed comment above pmic_arb_init_apid_v7 by dropping the extra "bus" word
> - Swicthed to devm_platform_ioremap_resource_byname for obsrvr and chnls.
>    The core remains with platform_get_resource_byname as we need the core size.
> - Dropped comment from probe related to the need of platform_get_resource_byname
>    as it not true anymore.
> - Dropped the qcom,bus-id optional property.
> - Link to v3: https://lore.kernel.org/r/20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org
> 
> Changes in v3:
> - Split the change into 3 separate patches. First 2 patches are moving
>    apid init and core resources into version specific ops. Third one is
>    adding the support for 2 buses and dedicated compatible.
> - Added separate bindings patch
> - Link to v2: https://lore.kernel.org/r/20240213-spmi-multi-master-support-v2-1-b3b102326906@linaro.org
> 
> Changes in v2:
> - Reworked it so that it registers a spmi controller for each bus
>    rather than relying on the generic framework to pass on the bus
>    (master) id.
> - Link to v1: https://lore.kernel.org/r/20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org
> 
> ---
> Abel Vesa (5):
>        dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB schema
>        dt-bindings: spmi: Deprecate qcom,bus-id

Forgot to add, but please fix this in a v7:

>        spmi: pmic-arb: Make the APID init a version operation

drivers/spmi/spmi-pmic-arb.c:180: warning: Function parameter or struct member 'core' not described in 'spmi_pmic_arb'
drivers/spmi/spmi-pmic-arb.c:180: warning: Function parameter or struct member 'core_size' not described in 'spmi_pmic_arb'
drivers/spmi/spmi-pmic-arb.c:180: warning: Function parameter or struct member 'mapping_table_valid' not described in 'spmi_pmic_arb'
drivers/spmi/spmi-pmic-arb.c:243: warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_read_data'
drivers/spmi/spmi-pmic-arb.c:257: warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_write_data'

>        spmi: pmic-arb: Make core resources acquiring a version operation

drivers/spmi/spmi-pmic-arb.c:180: warning: Function parameter or struct member 'core' not described in 'spmi_pmic_arb'
drivers/spmi/spmi-pmic-arb.c:180: warning: Function parameter or struct member 'core_size' not described in 'spmi_pmic_arb'
drivers/spmi/spmi-pmic-arb.c:180: warning: Function parameter or struct member 'mapping_table_valid' not described in 'spmi_pmic_arb'
drivers/spmi/spmi-pmic-arb.c:222: warning: Function parameter or struct member 'get_core_resources' not described in 'pmic_arb_ver_ops'
drivers/spmi/spmi-pmic-arb.c:244: warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_read_data'
drivers/spmi/spmi-pmic-arb.c:258: warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_write_data'

>        spmi: pmic-arb: Add multi bus support
> 
>   .../bindings/spmi/qcom,spmi-pmic-arb.yaml          |   1 +
>   .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 136 +++
>   drivers/spmi/spmi-pmic-arb.c                       | 948 +++++++++++++--------
>   3 files changed, 715 insertions(+), 370 deletions(-)
> ---
> base-commit: 4893c639cc3659cefaa675bf1e59f4e7571afb5c
> change-id: 20240207-spmi-multi-master-support-832a704b779b
> 
> Best regards,

Thanks,
Neil


