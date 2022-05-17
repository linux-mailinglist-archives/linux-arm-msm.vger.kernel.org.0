Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A33A529971
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 08:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239306AbiEQGVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 02:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231756AbiEQGVm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 02:21:42 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 948F1443E6
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 23:21:40 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g12so5710251edq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 23:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wc3/EVjkhz+Iezw2lq8A3OB69X58dvuasJ9uoZXK6vo=;
        b=HfZ+bb7kntTNtJOmreG6Dbv+qqechztgleb6DTAnIlLUJJS02lRkrAQDMUmoF503No
         nGEmq5tVNeXe3gDOvL8aRcyvmIFKjW9xnGjjNcN+8Er5cybVDFKyEoA901fwI6CCPwpb
         ku92O6xKNFADgWQmj6PQJhlpmO+uxsFt2wMxCqCZpCmAEP7mQxz0UtfD/bReieJuV4wl
         wzvO/7NftI1IZSFGxYrYgKllMifs7S5D6jTsMxelznnUYtUW+yRcaxuLeyDtExGh7IhS
         6IZURT5D5oibApX/Qmgg8OTVoQr20HCJhPQlmgWknri6YXN83IoJhh5uOEjzU7ivmf2M
         9xMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wc3/EVjkhz+Iezw2lq8A3OB69X58dvuasJ9uoZXK6vo=;
        b=EYxkejqg/froIweMpBC09QQNHU1xaNJ8N1GoN/Ig2BMJt7DHfa4dREj23jW12PZDgg
         +tuDiD7JrsMVkrFvAct0GhqtLeNpX03PNPZPAAXuo6o2IP+YhzPa+9ecWgPNKGrtBg7L
         WPuj6qji0TgbA883yEnvRsqbHN0+ZUg9x5F0Ax5sMsLo16plAjaS6vvXmiy6h/iG67GL
         9YEvBtLhccB/ryyzJHxDBtIEaNLFacF/i7o1Rz38N7C+/B2x25t3II3V26Z1QnG+PJnP
         27sR3S9c9abvk551VFkCA+zoe4+oUQtghjW8bwDDrQHY5Fe5JzIZfepkSE0A+uOOuHSj
         jZNw==
X-Gm-Message-State: AOAM530+hLVcre9LZFyZOKqnEsW++tyTV484znO47TI4W5tgVcvBpnNr
        GQX7FcWVEijS2C5IC/7N8NtV3A==
X-Google-Smtp-Source: ABdhPJym9V7KYl2xSH3OCAtHgWbnK41dJm21ba5lq0sBFZVOY8Fls/Xj85PXXug9ZAfgz31Dj+J3oQ==
X-Received: by 2002:a05:6402:390b:b0:42a:acb3:bb5 with SMTP id fe11-20020a056402390b00b0042aacb30bb5mr10734321edb.236.1652768499067;
        Mon, 16 May 2022 23:21:39 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m13-20020a17090677cd00b006f3ef214e0dsm617207ejn.115.2022.05.16.23.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 23:21:38 -0700 (PDT)
Message-ID: <0708c599-05cd-9357-cdd1-527fe87544dc@linaro.org>
Date:   Tue, 17 May 2022 08:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v5 0/3] Add QCOM SNPS PHY overriding params support
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
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com
References: <1652723410-1630-1-git-send-email-quic_kriskura@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1652723410-1630-1-git-send-email-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2022 19:50, Krishna Kurapati wrote:
> Added support for overriding tuning parameters in QCOM SNPS PHY
> from device tree. This parameter tuning is required to tune the
> hs signal on dp/dm lines for electrical compliance to be successful.

I commented at your v4 - please use proper PATCH subject. It is added
automatically (with version) for example by git format-patch. Your mails
escape regular filters - any reason why doing like that? More difficult
for reviewers?


Best regards,
Krzysztof
