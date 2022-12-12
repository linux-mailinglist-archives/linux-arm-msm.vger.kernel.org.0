Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D59964A7E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 20:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233039AbiLLTHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 14:07:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbiLLTG7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 14:06:59 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA488C5E
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 11:06:56 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j4so1144861lfk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 11:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EM/05Cc3+yEloEjGjc5UQU/MPOq745ZmAMz85sM84s=;
        b=i73QzBibvFkOrU42DwPlwW/9RfBTKS/we4ftuamImKWH0BPAJUNUjYNZCxhsroyc2P
         Kki1pxCxYTTwrR0VBmdUA7r2TFcLIfK4fbeB5Lw5nCsEOhE+wLzzfWSjgf763ldSXYVC
         DbCiYro5ndhLg2Q84lJK0DzdNFJvfI7lDxDiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EM/05Cc3+yEloEjGjc5UQU/MPOq745ZmAMz85sM84s=;
        b=RIM6Y5XBq3kB5foIE9jqAs4fiK1CPXImbZkXcluVVv8yEEyDIasF8Ylf7/+Un091Oe
         62Kdm/S+QqTO1yttYpQhTZ2BMPf9GJ0QWG7OCN7xK99A1KLhQBZ5LF9P2VcFDvU2uOp2
         C9ZSoVj0eFTmPpfvUvWY36rFrAVLJWaRiMerXx2iq52kcQE3tvlrWLfuR1HzserRX/hj
         13ZiaDzIknl04djBlzEx/3D5/xLoYd1gWVdDlzIy+n/baMQ3tv9lKTAVd7/5iFfrKvup
         /aKBsmj1rOtUW9YKxjThFqTciLHJwIbOu3aXFutIh0IcJrohsGBf6rozWZ7rhdqb4bBr
         gB/w==
X-Gm-Message-State: ANoB5pnVfJJDL+QnNhkuw8Gb3ObGeeKxP0dIu6zdenAQzrx9EaKs+jAV
        ivVouqgeJRTkp9tLHdsaxsG2ME0TszH3iVh3xJ9lU7U5fgsL4A==
X-Google-Smtp-Source: AA0mqf42l4naUQbzsYPRmgYlQvfVBNLOPdUAqWtkvdeQ364DbIhIiAzh2+KFqsR5q7jLgieCMkWlHl9uTOcK6U47P04=
X-Received: by 2002:a05:6512:b98:b0:4b5:5f2d:1458 with SMTP id
 b24-20020a0565120b9800b004b55f2d1458mr7382572lfv.253.1670872015320; Mon, 12
 Dec 2022 11:06:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Dec 2022 14:06:54 -0500
MIME-Version: 1.0
In-Reply-To: <20221212133303.39610-2-krzysztof.kozlowski@linaro.org>
References: <20221212133303.39610-1-krzysztof.kozlowski@linaro.org> <20221212133303.39610-2-krzysztof.kozlowski@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 12 Dec 2022 14:06:54 -0500
Message-ID: <CAE-0n52gh51fLyOtLTB-rEc5GZs6NSdZtYU26FjX8nfWFK9wFg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7280: correct SPMI bus address cells
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krzysztof Kozlowski (2022-12-12 05:33:00)
> The SPMI bus uses two address cells and zero size cells (secoond reg
> entry - SPMI_USID - is not the size):
>
>   spmi@c440000: #address-cells:0:0: 2 was expected
>
> Fixes: 14abf8dfe364 ("arm64: dts: qcom: sc7280: Add SPMI PMIC arbiter device for SC7280")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
