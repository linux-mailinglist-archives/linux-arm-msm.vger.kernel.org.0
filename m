Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6CCE6A83B5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 14:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjCBNnX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 08:43:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbjCBNnW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 08:43:22 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879AA113D9
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 05:43:21 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id by8so17630163ljb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 05:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677764600;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvThOI3c/D2W1hH94FvijcrC2B39aEuaUhDrKSDvEDw=;
        b=OasYL1QrRCcxcFhhEEsOqzpzB0+1r3sjaUvOrMnTAbiZpGnmOIJkXBc2OgKYy3WYeu
         qVEeZZhC7MJa+OoRffnPlFOPf0MFjMHAM08B5SAU/p+VZrLFKbZpwmG4YvuHt/fA/8td
         J+rGjBI4XK1mwpvA2ZHjFlZ44oFD2cwNdwZeOHjL7u/J375Sg2Lx0BFKKiTjdAB8Jk8R
         AZiNJhZzwipTbFsce1wm2FaxRQChUZpqvCk5Pvaa67IxdOUJUOsPqp2kV/b6Yn7apv0r
         x/sDjaGLP+TxfSni2GpSA0Bi3TOIqsYKRHbKtTyZvGu9dfirjZADdG/0zyzuJdbDO4ta
         u62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677764600;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gvThOI3c/D2W1hH94FvijcrC2B39aEuaUhDrKSDvEDw=;
        b=OrZySsffoGmc9bOeoWdg18Lwm6opeFo9WZ2wttWA9tiFIX80xxLNqwkska7tU/HTm6
         fTMTgatDZHuF7nPNV+/FI/6AxMlCIkrpc41BFfcNkb2g25fgi2tNSv9AaYM9oBc31nrU
         JskK90PSRzdr8M4yokjMbygDme6ZnL1ijN396Xrklj/abbctD4OJY72q08XNw8OeFaX9
         XrjYQbyi3hoixy9Y2054fjROhKrRAHYWY64RjsDESPohJSo0BnJN3tmICWm5S9nduucA
         6KAqW4ZdrxBj/GM0OiAuXD9m9uLxcH5zQ9fGpuSXNFtvuPRm6ws2TKZw2+KT8E7RZOEC
         dR/g==
X-Gm-Message-State: AO0yUKX9KQefCK/ISbZ6Fk7dG7Q4rCaObum4IRzbprWsFN7/xVbNLjQJ
        NNUJM8COuGLoekymCU29P1H5gg==
X-Google-Smtp-Source: AK7set9dE7L3wLklbFDASmQCO8Q1iJSW+ft98cIZRQzR1oqhhLyyoIMVUuvhwIvCrwYYoKKbM1Modg==
X-Received: by 2002:a2e:960d:0:b0:295:b432:2055 with SMTP id v13-20020a2e960d000000b00295b4322055mr2830910ljh.32.1677764599785;
        Thu, 02 Mar 2023 05:43:19 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id g7-20020a2eb5c7000000b002946be8475esm2108320ljn.135.2023.03.02.05.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 05:43:19 -0800 (PST)
Message-ID: <b9cc99c3-7dd3-6a57-b67c-e9e0ddd60a49@linaro.org>
Date:   Thu, 2 Mar 2023 14:43:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [bug report] regulator-fixed-domain can't sleep
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

I've noticed that regulator-fixed-domain sets the performance state of the
attached genpd to 0 correctly, but will never actually let the power domain
it's attached to enter idle, as it has no PM ops. I was trying to come up
with a good set of PM ops, but I'm not sure what PM ops for a regulator
should look like.

Konrad
