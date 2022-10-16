Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F5660003B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 17:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiJPPCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 11:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiJPPCl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 11:02:41 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9F440BE7
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 08:02:40 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id c23so6427004qtw.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 08:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Igk6CPsfUuOEMZd955w8H+qSc1kCt/tgkDrKHSacLao=;
        b=eSzxnqQ1WNQsmrOgieSBxaDRmFYXPvNEhQwoLZVEbbBwFWWY/kZCDAf0YIi+koD9e8
         xukcwbhZ0DER11I93040ZEzfNg4CYUCJxhUddZeqiT4RXzDZy6MRXBGw94PFXYeIPH8C
         kr4U6Y0tdzX71HqkKrNX3DRZjL4GzCDsV8pW+j2M32LwWqY1Z6TgZAuLtAXubk0dpj0A
         eWtDIMPadHSzoKw8TIlfJAfpF+aFL9xswZEyluqjiZyRpVco2mggsy02BaUdcnOJPMur
         RuxX/VLBSvE17yXkwRsCqt5e6J1Dr1jgUd0wRDwQvfwGjuRA2vdCljBdx8b3mY6dfLgi
         cOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Igk6CPsfUuOEMZd955w8H+qSc1kCt/tgkDrKHSacLao=;
        b=iLW2f+ihFWsBjEZhbw8cxpQb1ZSTFPpRrB0M78HdazQvXzWAA0KmZRl8xwQ219yPOd
         5ZEAKqXQRvPKr980EfzAckr9birHiauxNCbdfrn+Qbl8vDmSZ6faIgol46ZTRywbZbJP
         P4jYtD0Fo+Ilc0iiJDOsJw/HzUrExislB3kdQm/A64EHNXYq3ZjwWFNiVhDxHiAxebdt
         ddEoKe4hNaVIFygp/C/Mlk4RA8l6eFI2oM8/9OhsH3sV1b1h3qmbfk52wr4BR7wOyMj+
         REceJbmcmF7gWWhPUVDIWIvtatIcwjclWNp5l8Er1DigRyIg0jsOuC/TFLPSwAcsEdDe
         +Bng==
X-Gm-Message-State: ACrzQf1UtfBwpttn4n46E/1XeGBbOJfol3iJA6Rkgz147jEyqN5B7Yqf
        JvDFZjFihD4rENYo7wJ9DJV6ng==
X-Google-Smtp-Source: AMsMyM6zHnK6H625wnuslX7d9jP1uuoNwRazPQpJMysIJ7ZGUOek/FTV0nf9LUDjjgjkMfm69jWWmQ==
X-Received: by 2002:a05:622a:593:b0:393:794:6f5a with SMTP id c19-20020a05622a059300b0039307946f5amr5516127qtb.270.1665932559512;
        Sun, 16 Oct 2022 08:02:39 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9b13:d679:7b5b:6921? ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id b23-20020ac85417000000b0039cc22a2c49sm5783070qtq.47.2022.10.16.08.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 08:02:38 -0700 (PDT)
Message-ID: <d9548b44-1474-962d-3129-e984c4f354d8@linaro.org>
Date:   Sun, 16 Oct 2022 11:02:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 3/5] dt-bindings: mailbox: qcom-ipcc: Add sc8280xp
 compatible
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221016090035.565350-1-luca@z3ntu.xyz>
 <20221016090035.565350-3-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221016090035.565350-3-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/10/2022 05:00, Luca Weiss wrote:
> Document the sc8280xp compatible, and at the same time also make sure

Maybe:
"Document existing sc8280xp compatible......"
to be precise that it is already used.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

