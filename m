Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C35379B768
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343602AbjIKVMD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242473AbjIKPjX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 11:39:23 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F896F2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 08:39:18 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40037db2fe7so49553555e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694446756; x=1695051556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSc2STShXCH9Hnpec/+sz/z9Go1PR874e8NdMDY9ZvY=;
        b=pTQAVMI/xOWBOkd1jDvObD1JXOEA0FLFVZEToSQKbjEHAbp9kDzTWq5ixIFFgTlXxv
         6MQxuNg5tzYqSc8//QWkmqlDXgT2majKAKacVZbgziqCWWMzYLgg/JS0Ii6j+4nHo8UT
         TVrKMXglKsshKQF/6EyfhG/Mm1Yy7MIj8C4Y7byNhMWJ4DQvlbC1hEsF47PM9TqagRAO
         VrRwfBFcfg7JU8BfbZhEF5cgU7WhuVx2SQu/DOpLlWTHb7AJQwecDqvFmFJLMKQOd9ep
         jnAcFEGm0NmYAZ1YRljvi5SR7oT0P0Bc2tVTpquT0NXqjgYuvwh2EiXJ6IIFx+AVuBSE
         yWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694446756; x=1695051556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSc2STShXCH9Hnpec/+sz/z9Go1PR874e8NdMDY9ZvY=;
        b=wbQxLKFTMZWxsJ4E/BXGCBFvv2ufNMgIDWoPwWW56zZI4m7nDH+zrNbgvUMnl8h0dI
         dJd/iJ656/7434M/gs+NU0Etn1TaUsj7JAaV1o5LIugxAl0hlVDzCTbiHQdqa36n9lSJ
         MSGZsXUue+bhWox9+ASsq3o/PumiUB9MLcuocRikw8bJ/7QyXYfABcI3xtw6JDv6nz48
         BdunmbHyXjwT78hVUvzl932YsjMkbLIV0MjxhF8GO2JzWfY8+AiKp+6cJiqYwH9CvY6n
         0W9yoUM6p4npR5l6vD/v+9BggOl0xd42ofRCw7QbssjRWQDS7Swjdfk/mnM2zXwwS/bQ
         Nvtg==
X-Gm-Message-State: AOJu0YwwBpUnyivm1YLV+5HFnp8dATw82Ui8tUzvXVaFUEbVJ/v3OIW4
        cmYoDBalXbuglZ0KWs+Qaq0MlA==
X-Google-Smtp-Source: AGHT+IGKqA7tbD5XE/I4nofk2X4ww4mR/3ag7eG+BQSRZZYdNN4u4HQ/Gr5jBxrQX60qUBtxEdWhUQ==
X-Received: by 2002:a05:600c:5007:b0:402:f555:6523 with SMTP id n7-20020a05600c500700b00402f5556523mr8937762wmr.9.1694446756685;
        Mon, 11 Sep 2023 08:39:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id d6-20020a5d4f86000000b0031c77c010e1sm10370281wru.96.2023.09.11.08.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 08:39:15 -0700 (PDT)
Message-ID: <8a812c6c-d26f-57a7-f3e8-d6f7442a9f89@linaro.org>
Date:   Mon, 11 Sep 2023 17:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] arm64: dts: qcom: apq8016-sbc: Add overlay for usb host
 mode
Content-Language: en-US
To:     Vignesh Raman <vignesh.raman@collabora.com>,
        devicetree@vger.kernel.org
Cc:     helen.koike@collabora.com, guilherme.gallo@collabora.com,
        sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
        daniels@collabora.com, emma@anholt.net, robdclark@gmail.com,
        mripard@kernel.org, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org
References: <20230911153207.646160-1-vignesh.raman@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911153207.646160-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/09/2023 17:32, Vignesh Raman wrote:
> Due to the presence of the fastboot micro cable in the CI farm,
> it causes the hardware to remain in gadget mode instead of host mode.
> So it doesn't find the network, which results in failure to mount root
> fs via NFS.
> 
> Add an overlay dtso file that sets the dr_mode to host, allowing the
> USB controllers to work in host mode. With commit 15d16d6dadf6
> ("kbuild: Add generic rule to apply fdtoverlay"), overlay target can
> be used to simplify the build of DTB overlays. It uses fdtoverlay to
> merge base device tree with the overlay dtso. apq8016-sbc-usb-host.dtb
> file can be used by drm-ci, mesa-ci.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: David Heidelberg <david.heidelberg@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

You skipped all maintainers, so this patch will be simply ignored.

Best regards,
Krzysztof

