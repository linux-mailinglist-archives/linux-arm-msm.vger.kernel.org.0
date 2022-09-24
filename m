Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC645E8ACD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233426AbiIXJaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233578AbiIXJaU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:30:20 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E417B2B7
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:30:19 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i26so3657027lfp.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
        b=JHz8l9cm+bQv28WXN2iLgm2nfh+TgnHT2wrwFZAaLYOH8AMypMTaxRT0USxJTx1qDA
         bJfSDoTaDjOHSTWcn5Y1O8wcW9rQKY/z3rWXoSwu57TC6f1D8VufW1No/pbOi1maYn/x
         OIdgiKcelqSvLWPulhtcoJ918GphiUdq00ZYQI1fTWMUTlZDWkawjgcMBMORLLOhWJIy
         KfwRW45BsTklk7ViAptHFYlYxcONcaLqrB3d7k1sLXl93aezZaKW3DlE+s6RwdurdLKa
         lQMjBM6JWU4UxWcrRiE1d7HPUIPqe8s7vqXqdTzngaDBZ5B8XPOuZnpveKz8lt9DsbwS
         6zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
        b=IpfOT3F+qSJMtgaqHqlNTKsvYmdb+zEw1opJHQv5HhMadzbYj+iDKyvQ6vcWP7G4J+
         6E9/5Qw0KDOyBBX5U8PUb1tvb3YRlKbjDEqBnf+dWRyRQTUrUmcF/SUfzyIwTiqipPvY
         QO+eUxccVR54lf6Kh4q3j10JnKqYVywZKjZ+LsL8XARLPCJf42sTN4LycztJuoSfODvM
         dsbffIwmFQqX1ABYhChKxoVi6Eir7gcFV46d9yfIBNlwO4EG9pkoSsX2SnO0BcTDNt1N
         ef+3BfKvKfHHV7vAZFpaBpiMC1+Kp1E3CUElBlGd9QoaYFeWpoQ6OW5wb588PexaDM2Q
         tJNA==
X-Gm-Message-State: ACrzQf0tXYMKjk2XzrQdRCVcFDa1fneDt7H7LrDqKkfdj+fsRzRZZ2a+
        rrGdxSb/yOgp1nyqtX02xIo+8Q==
X-Google-Smtp-Source: AMsMyM7tno1mmU/0I88pwXzxJ33cLgdA28PKnkVMEER96O0p5HvrATY6IyuhN0owxHY5wG0k0wZDsg==
X-Received: by 2002:a05:6512:a85:b0:49a:c6f2:7aa4 with SMTP id m5-20020a0565120a8500b0049ac6f27aa4mr4924787lfu.59.1664011817676;
        Sat, 24 Sep 2022 02:30:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z12-20020a056512370c00b0048a8c907fe9sm1837767lfr.167.2022.09.24.02.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 02:30:17 -0700 (PDT)
Message-ID: <416f5408-b9cd-f7c8-67d4-7b835ea48976@linaro.org>
Date:   Sat, 24 Sep 2022 11:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/9] ARM: dts: qcom-apq8064: change DSI PHY node name to
 generic one
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 11:01, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

