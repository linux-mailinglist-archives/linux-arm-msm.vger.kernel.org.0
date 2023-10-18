Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46A0D7CE8F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Oct 2023 22:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232756AbjJRUaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Oct 2023 16:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjJRU3y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Oct 2023 16:29:54 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B0310E7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 13:29:24 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c5028e5b88so84371871fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 13:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697660962; x=1698265762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=osk1avX4yPBLWD2yQkEEwVjXNQfuRW2LhcORqvLaSNI=;
        b=gIH/xRMhWU8Q62Z4E3F8DTBpQloCProuqD673A1XV74iJ7mZKRIYtsoURUW3ooyBJU
         Z6vGD0HzCcTT/zWHORdkQww+Zke1PbZRAtph8zL3Q6z0lGLjbI9TtpskQNFd3Zrr0PgC
         mefsfOTYMdykSWHmyPXhv1LI0rjDpU8Kf3CCw6v2Iac0O+025bdq0WupbOhxCNW9bBXv
         fEi/699kKOIAxcRK4dhZ7+p12GAzoFZzgg5rX3EmtwfmqfrC9kzI5WycGHYVC4XhQy8A
         pWbCstpR7VDynNjkwrhOnGlpqp71GmQGEDFtT6a6hk3gKXs6cPnCVgpTdWFaA/6DhYAr
         IS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697660962; x=1698265762;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osk1avX4yPBLWD2yQkEEwVjXNQfuRW2LhcORqvLaSNI=;
        b=qAft+mUmu+IwVpaPe/KjBdz4JvL4hkLFX/FK3GV2LCRL/UsRVJQ9CKalJgSAEB9dr+
         VeXwsvHueXgQVe9roxdTI2BD9+t//NEMDjkcB6glXQ1e2bKcMIZbDWw2xLxepimgnvjS
         ypeS0O7P3AOHbCqubOY/b2qdgsHGKgNVG/Ob8CpuShJ++qyiNUSLlzU6AaQxyVgXpJvu
         k0zuFNaUEMeH/1gGEDQOOvs60+yQOMqJ9lr4JAa8xANxEPdnYH+eqQqvWCcjsioabl4l
         WpCHQrMu0dyz8zBTVK5kbhgbktX0ZjgwdcEwUK5O1lGKStWLuUdcKV6+G8RMrk00w45X
         hr1A==
X-Gm-Message-State: AOJu0YzQOu6ef2DTnED+iu0RHM5Qn9LbuakPn70HJ1I9MmT37I5g6IdG
        bqX25ySVJV1l/vPu03ECJ78/QQ==
X-Google-Smtp-Source: AGHT+IFuPvO58ZKvDotDj/3XBN3mO6DOuO3jGYy0ecN1M6yOEDzObPwqonzHg6b+Mrw9HI41DLh+Yg==
X-Received: by 2002:ac2:55bc:0:b0:507:a6a5:a87b with SMTP id y28-20020ac255bc000000b00507a6a5a87bmr55278lfg.51.1697660961701;
        Wed, 18 Oct 2023 13:29:21 -0700 (PDT)
Received: from [172.30.205.86] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id v12-20020ac2558c000000b00507aced147esm825302lfg.203.2023.10.18.13.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 13:29:21 -0700 (PDT)
Message-ID: <f27ff251-58b1-4fc5-8ad5-cd365b7eb976@linaro.org>
Date:   Wed, 18 Oct 2023 22:29:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add QUP6 I2C clock
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231015162114.976202-1-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231015162114.976202-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/15/23 18:20, Robert Marko wrote:
> QUP6 I2C clock is listed in the dt bindings but it was never included in
> the GCC driver.
> So lets add support for it, its intentionally marked to never be disabled
> as its somehow affecting DVFS and if disabled it sometimes crashes the
> board.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
Bjorn, would you be able to get an idea of what could be sitting
on that bus?

Or maybe the IPQ folks could know?

Konrad
