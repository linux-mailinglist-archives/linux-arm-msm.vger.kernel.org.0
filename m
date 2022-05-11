Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8417C523C50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 20:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346134AbiEKSQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 14:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241768AbiEKSQm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 14:16:42 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E996128997
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 11:16:40 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id i19so5646740eja.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 11:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Fhxc5z1KE0Dsp8lGsAgqT5RMsvfNxtef/xd2f9hMnCs=;
        b=nIm2GVngEEk3Lg9AJjVcCmfvkEXavOLYacnJORi28B8FAVBQMNOp30PKVzqwK4+if3
         FCjffb9+3YM0w5R2S8CShqzFkx34N/wXw+e3+pm3t3fYy2ThWqU9xY6EX4Z4YR551AOg
         RpGy3/kSgMq2OPHqh89Q/qQkCkCv5l6RYIN8sSkG+2bU2A7AAqmZJkzzUlh5Gd7bXYuN
         IzDiNp6+bPtMK30jiZWf/QN9Zy/Rv3HgoZvjJ/UBcoFQco361sOh9nABKb7REI47zQwi
         FifZqKJSFOCzhZfBlcnBuKsF7J8cOQ+V2F4Bfvd5DxxGOciT5f8mok3Bw/L5Maez5HlE
         NoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Fhxc5z1KE0Dsp8lGsAgqT5RMsvfNxtef/xd2f9hMnCs=;
        b=nJhvB88fFVkGyuovvTdWwPdcvWvyKLxP6rV7gkQgl/biFcCQPmNnoV+YypnRjXSYgR
         ELncobG5AG81qVYMzREbnQQHcphjKSwUGGbriWjZINTJDDEx5X2yRCnl0rBLz/CsDFes
         89dewMUCBf9BAUgVrGKzIoB9xGVSsH4KcRbFFR6poScnQvvsBAj0/wrhBeCQq6aGlgZv
         k+9i7tkvi6eJVzntWPPF9NhS1r1VZ8BOiKf/SgS697G2+mISmWGHneZk3GyeS5ly3Im5
         MPQZcAx+HyQOOMtTpo0Mx3UFdu0B1tWd15or5qJ4J1aeva6F1rLdNjHl3whlpZ2BYcu1
         eA5w==
X-Gm-Message-State: AOAM532qw+I1vi0MSolsOAFKG2rbqzle5YtS2I7xMMxip4WK5gnLd8UR
        YixgQpL+QA8i+gbkVfXxZvHTjA==
X-Google-Smtp-Source: ABdhPJx+CJK78zsG3tde6KKXb/fX4e9dE8ABsOUrj+MY0Vc4ravZJADycaEa0z4YWMjmQF5Dr+yZSA==
X-Received: by 2002:a17:906:6a1b:b0:6f4:a9b8:e027 with SMTP id qw27-20020a1709066a1b00b006f4a9b8e027mr26045450ejc.222.1652292999566;
        Wed, 11 May 2022 11:16:39 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i1-20020a170906250100b006f3ef214e59sm1206628ejb.191.2022.05.11.11.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 11:16:36 -0700 (PDT)
Message-ID: <857a1475-6697-89a9-98e6-b1dad8b917ac@linaro.org>
Date:   Wed, 11 May 2022 20:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v4 0/3] Add QCOM SNPS PHY overriding params support
Content-Language: en-US
To:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com
References: <1652282793-5580-1-git-send-email-quic_kriskura@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1652282793-5580-1-git-send-email-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2022 17:26, Krishna Kurapati wrote:
> Added support for overriding tuning parameters in QCOM SNPS PHY
> from device tree.

Please use proper PATCH title. The easiest is to use git format-patch to
create proper patches.

Best regards,
Krzysztof
