Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3998635AA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 11:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbiKWKzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 05:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237023AbiKWKy7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 05:54:59 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D312E8CB85
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:43:47 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id be13so27576214lfb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rT3zcQTdiqIKVUqVpCnTTdj/c8j+Nk1Lz6ur5IXMJOA=;
        b=EMg9kUC1+ELdZg4dG/mu5U5HWqIDh2zj38EIiGc6PXb/Tty6+0y+tysqOb/UfVwY5V
         x+jqoABT4qC7m+d2D+qZIuJGDBvjwhIaki6eJzLfUwG9UPwBezsZC+HHNrtLOhAPsi9G
         n+oMu50QndXYVCXfr1tDzmvtdQ/IN29K0FVG5FYtUED/0g/8utJpV1zn7xcTCYMgGR4J
         l10oL16UVwKsVpgczL+gjXjSw+ZYXMtOb0ixi1qk8ayBVOo931PfdomB9ADSW1LF3pWf
         9aYRiIeKAAao8GdC7AA84m8EOfzTsjpSc9fTW4gFHYo+/ifquaDVtOKCeK+NQtAqyJwS
         yi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rT3zcQTdiqIKVUqVpCnTTdj/c8j+Nk1Lz6ur5IXMJOA=;
        b=FrKeZQX0HW1QNAJMQfK4LlwwrScObXdAOKVD8xci+Zr/JAp9ljbCztgqsHV1KtnHar
         hfMqgLmEQP0u463KT0JfUpSVirmdPd4+haDTnKyPVVewcDf+LkTlZv/BXAdHmn3YVZ4y
         193EnrXZ1TPIvvhA+czmPmIQB1D7SuQWKJd1q5aU6tNLUIFzgaHSGGneyQNNb/Z860k4
         nGVoQbsqZ3ZB7qlwDTa80+WAxArcDe4dhtVMnSTz0lcy+3qj67naPgM5kAQjnwxINecb
         aWT2Z2QzRqtRWIDLsSBVj1Mk6G0e8cwZyw65wR7xxe/sVnl1gbvGyrnjr2cU2CRSU8vs
         1dyA==
X-Gm-Message-State: ANoB5pmWmKwJs9guZHo49V8TbuNmzQqh3stqFf3lgqaj5CZewUne4K6W
        W2JkgIKbyiPmfWyUOuYOOB9/Mg==
X-Google-Smtp-Source: AA0mqf6VYlXsQaHR4cbFjaN5eV+7fCtvNBbhQ7J0rfydPqrSvO6VpNFGGC42MRUUxP2ujuSxtVP06g==
X-Received: by 2002:ac2:4558:0:b0:494:6bb2:485f with SMTP id j24-20020ac24558000000b004946bb2485fmr3581244lfm.451.1669200226234;
        Wed, 23 Nov 2022 02:43:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a302:5f12::1? (dzpbg0ftyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:5f12::1])
        by smtp.gmail.com with ESMTPSA id g4-20020a056512118400b0049e9122bd0esm2037454lfr.114.2022.11.23.02.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:43:45 -0800 (PST)
Message-ID: <e7635cc4-a436-11f0-1ea6-46f0056e403c@linaro.org>
Date:   Wed, 23 Nov 2022 12:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 0/4] phy: qcom-qmp-ufs: add symbol clocks support
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20221123104215.3414528-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221123104215.3414528-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/11/2022 12:42, Dmitry Baryshkov wrote:
> Register UFS symbol clocks in the Qualcomm QMP PHY driver. Some of the
> platforms (msm8996, sc7280, sm8350/sm8450) expect them to be defined (to
> be used as GCC clock parents).
> 
> Changes since v7:
> - Rebased on top of phy/next
> - Renamed the clock registration function (Johan)
> - Dropped rogue qcom_qmp_ufs_ops (Johan)
> - Fixed the comment following Johan's suggestion.
Ugh, this went total crazy with me sending the patches from the wrong 
commit. Please excuse me, I'll send v9 instead.

-- 
With best wishes
Dmitry

