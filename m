Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8983F7D887D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 20:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjJZSnA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 14:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjJZSm7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 14:42:59 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979481A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 11:42:57 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32db8924201so789079f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 11:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698345776; x=1698950576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QYVxFMIK+d/9mUTkspGoeUwkCqC2XLt21uyeNzGMBc=;
        b=X7RqHWdKtMJN9Fd897kGYN/fFujBPsJ7oFSJk642johSRYQfG3QOkLzDebzyyEzdHb
         8X+x4c8tAnGJrwvkhb8IlqMHFu0ttuMt3Adm5WC0uUK6kNeY4OUaRN1c4jnfeourriQB
         u4IiV4uTNpiiX6PkOMVC7nhPUiT+ybghrMxkPhEY+2exczQ9cryxPI03RdcmF0N/4tPv
         igR93nmcPkCoazPcOhUz6l7giw03JBchBN3uqcau3knEY/OTAeBpxbDpS4OdlAAC6gLM
         qt5Ew/io/FlwP5rfJaUVEV70dI3gq6jdetSvpoeKQ+ERjAcNovt31tf68pfDKbh8uY7c
         mSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698345776; x=1698950576;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QYVxFMIK+d/9mUTkspGoeUwkCqC2XLt21uyeNzGMBc=;
        b=jRUFJMQ/8kaDl0U+zgTBgfITfC3k9ppZMzmFoObM9D5XPJ8J/0jhGzUkibzU7L+0ET
         kp5gsXlvWMw6rtwXz6TEsanppReX8B7X3Cad0kenu9UnUSzG9+pas4IxN4LrdlE6f3F0
         w3gwUddIBsnMZu6cx50g+u6M6b/M9VcLhveISYosuyMcOpbHzJRJZMljG32qP64Vi7i5
         W+I7yx1dvsk6V6IIkZhtF7qNMMGgGL0rIOCfIYykBAz7xDvXvHmTBiZNuoGMa93cUJMK
         1aWqtxEF2brKP2Qv0ahLv9IgPSyDqjMg5VeAw4FN2PHbtXrsLNFcWAAgViTn+2fgGIQ8
         vFaQ==
X-Gm-Message-State: AOJu0YzT/uxrUWZyPAHWnfFgW+c2Hj7AL+N1cVHIXKadIU2jM50qVO99
        /6CSRpt4MSV3XPFGc/4tScfk/A==
X-Google-Smtp-Source: AGHT+IG1fgLc96stbZJuy+8r4WUH6ETZyD9Q2v5+kWPmrovdmXxzDQOnIdUpRMV2sD7k9mrtc+StSg==
X-Received: by 2002:a5d:6549:0:b0:32d:a283:de94 with SMTP id z9-20020a5d6549000000b0032da283de94mr358358wrv.57.1698345776014;
        Thu, 26 Oct 2023 11:42:56 -0700 (PDT)
Received: from [172.30.204.255] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id l12-20020adfe9cc000000b003232380ffd7sm25522wrn.102.2023.10.26.11.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 11:42:55 -0700 (PDT)
Message-ID: <77314fe2-2936-4f89-a347-4eb288507c47@linaro.org>
Date:   Thu, 26 Oct 2023 20:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: ipq6018: add USB GDSCs
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20231025104457.628109-1-robimarko@gmail.com>
 <20231025104457.628109-2-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025104457.628109-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/23 12:44, Robert Marko wrote:
> IPQ6018 has GDSC-s for each of the USB ports, so lets define them as such
> and drop the curent code that is de-asserting the USB GDSC-s as part of
> the GCC probe.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
Applying patches 1 and 3 without this one breaks usb, no?

Konrad
