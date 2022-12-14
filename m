Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D02F764D16A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 21:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbiLNUoN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 15:44:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiLNUoL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 15:44:11 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1921CB8
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 12:44:10 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id m19so24308054edj.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 12:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yFCyq1MsS2DUmVNiT4NLGdkj3gexodwQji1RBiXJABY=;
        b=mqNtF9nq2Kal4In/4Es3hyEnbjqLi1RdLqZjSQhPhga5Tw0woEZ2SCkCJ4vK1JaSES
         56/a0xuCyvCt5S/P9dBpvrfc+K25+Y/0jrABtDSSWKWesPBhGvZA3Whs0tIO+YzCnS3q
         LBJjA4Bb+LJ2OsxzoRSINb3Mbr4Bque8F5AfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFCyq1MsS2DUmVNiT4NLGdkj3gexodwQji1RBiXJABY=;
        b=uMud5s1WJu2BmP7pHF+uGGBeHE3+3y5EKpj6mQ+o4GsPJI6fcTJZ9PGofuNycvoihf
         Xm4IonPZaJkPDGs20eEu+3zTpp+my7QjC9AxB1TxMskzS9JGVdFFZGx7gXRWs1QKITLv
         lOrWUpKz82VLGQs+WSksMFVV55GMZ0gwrCObNf/QjbdUNTuRBxT/6APmlYJIN5kCM9li
         4gpuY3NSojLeYsrWSR55yUZ9e2KKzcBvk7LS32GpsvlfrgHLYjxFfHl/yALcc1Wf16sa
         41gGO5aqatbFRYJe5JQ4OuGH/3b85CcXeY09/HGBPbVAcNjP+U7rJYt1g/mdBMyCK24Z
         SIHg==
X-Gm-Message-State: AFqh2koT4Jg3OP7z0s7AYCqiopxFoOqxdjFhRcZrRshtX9RBGtMkR7ZP
        cbHY9612lQvS4HuMRSnLhj/Gpf1tvCuGqfOcLTk=
X-Google-Smtp-Source: AMrXdXsPuGVZnq75tREsbBvBtxdHk7QEbBRzDrBf2CfoqY5+k62cQhe5JZkhc1xuSquyuB9GXsb8dQ==
X-Received: by 2002:aa7:dc04:0:b0:472:3008:bcfc with SMTP id b4-20020aa7dc04000000b004723008bcfcmr3854173edu.15.1671050648555;
        Wed, 14 Dec 2022 12:44:08 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id v2-20020aa7d802000000b0046892e493dcsm6607016edq.26.2022.12.14.12.44.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 12:44:07 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id f18so1049947wrj.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 12:44:06 -0800 (PST)
X-Received: by 2002:adf:fd89:0:b0:242:1f81:7034 with SMTP id
 d9-20020adffd89000000b002421f817034mr27228899wrr.617.1671050646198; Wed, 14
 Dec 2022 12:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20221214114706.1.Ie4ca64ad56748de5aacd36237d42c80dd003c1a9@changeid>
In-Reply-To: <20221214114706.1.Ie4ca64ad56748de5aacd36237d42c80dd003c1a9@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Dec 2022 12:43:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WKJQqPvwuBYrZNZ8venrPuhbB9LOraYZ7a8TCr7-tt8w@mail.gmail.com>
Message-ID: <CAD=FV=WKJQqPvwuBYrZNZ8venrPuhbB9LOraYZ7a8TCr7-tt8w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add zombie with NVMe
To:     Owen Yang <ecs.taipeikernel@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Abner Yen <abner.yen@ecs.com.tw>,
        Bob Moragues <moragues@google.com>,
        Gavin Lee <gavin.lee@ecs.com.tw>, Harvey <hunge@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 13, 2022 at 7:48 PM Owen Yang <ecs.taipeikernel@gmail.com> wrote:
>
> Add entries in the device tree binding for sc7280-zombie with NVMe.
>
> Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>
> ---
>
>  Documentation/devicetree/bindings/arm/qcom.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
