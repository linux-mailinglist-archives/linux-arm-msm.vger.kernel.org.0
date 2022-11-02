Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBDA1615B70
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 05:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiKBE2z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 00:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiKBE2x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 00:28:53 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 731DC1017
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Nov 2022 21:28:52 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id v17so12440259plo.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Nov 2022 21:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VGNiahs6hX5ZvMHkL2FovfAhXr5AX8OYLJp5JLaYUCU=;
        b=j7sT/eTuWOFh4nxlTckUHUlheNTNZry/B3vaZ31/z8qoUmHkWtsdc31aTiqWojROLW
         h+joxl12X39mR768q+urvQFEsHA3l7qTGADYEKAncj3OSi7GbUlB7US5DT+8Jw1VJNKL
         dA1jj3MQqUMEbse0RSZ7uNLpfX7D4HjEMJvmvJYbO8CIwFGZOS9LNiOqpwh7Tm1wqcfR
         L4puIMmN8KF33MkP/1/MCNHQ/CSYIvzShfpvhTE3tt73PiluLhs12cLQt9SbbhvwNUMe
         1uzjyTZ/0xES3nrbQ5GWbr2MqV2C5AA8z16lVLIBcQ+pKGE6IBjFr0zXs0eEGLtL+DfM
         xUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGNiahs6hX5ZvMHkL2FovfAhXr5AX8OYLJp5JLaYUCU=;
        b=GET5CZhEpNYJggBk/QNMyY6IkV1CyqehejYsx+rNnIMD3hAaQh6Knt8k78B4UNT4at
         //CUmm/ZLXIlpwRShxnmg8mRYNGfib8372GenhBt9vZ+yzK/siM3P2zmtY9bdPszqOCr
         wglDqJaelaWKer744Pnns7e+Ve9rYZQh+ZXuBqfPVURlAj4AZCSxadJhFmuV/8zHmu7t
         NrmKlENiI4TE7VStNJstWn3b+QnGYKMVje3QF0+/hHmp1NfU9jWlUp8pksXfXrOb05gI
         rB93nTQ4FeJLSGoOML5Psh97tMxQFdxS1amPMs2/4WmKhWe+IWpuR2P1m6LBsunnTDE7
         lAlA==
X-Gm-Message-State: ACrzQf12i+/DIH6Ys2Q+NWdhwFAvvvMuU89zt4Wjmj8OGZvKmZdvYi2K
        xzIeXP9jxGm8daeueIpMWc2z/w==
X-Google-Smtp-Source: AMsMyM4xh8AbMmR+mGtUChrGRjwUGbaKq6o9iCpRPiFkv4uKhs/y2DXP2sWUkw3nooe4OdnCvmppHw==
X-Received: by 2002:a17:903:2352:b0:186:aaed:e7b8 with SMTP id c18-20020a170903235200b00186aaede7b8mr22467061plh.47.1667363331996;
        Tue, 01 Nov 2022 21:28:51 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id kx2-20020a17090b228200b00200a85fa777sm406615pjb.1.2022.11.01.21.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 21:28:51 -0700 (PDT)
Date:   Wed, 2 Nov 2022 09:58:49 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        rafael@kernel.org, robh+dt@kernel.org, johan@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 7/7] cpufreq: qcom-hw: Add CPU clock provider support
Message-ID: <20221102042849.q3qnaoebeudpbpnv@vireshk-i7>
References: <20221025073254.1564622-1-manivannan.sadhasivam@linaro.org>
 <20221025073254.1564622-8-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025073254.1564622-8-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25-10-22, 13:02, Manivannan Sadhasivam wrote:
>  	for (i = 0; i < num_domains; i++) {
>  		struct qcom_cpufreq_data *data = &qcom_cpufreq.data[i];
> +		static struct clk_init_data init = {};

Why not make this part of a driver level structure instead of static ?
And what will {} do ? Initialize to 0 ? static would have already done
that.

-- 
viresh
