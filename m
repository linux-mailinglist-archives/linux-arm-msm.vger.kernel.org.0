Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294D07ACCC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 00:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjIXWvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Sep 2023 18:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjIXWvt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Sep 2023 18:51:49 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47238EE
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:51:43 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59f55c276c3so29217857b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695595902; x=1696200702; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XT92F+VX1pObllF5QiGwjVv1yGLhUUOiTzjpjdANyB8=;
        b=rNcJGyuyR8s/wZqCk86cxcHesMWOLLQ0O8V9Tq3s3WE+mhxSJNAU26amGIPY0xCTAM
         l+mwXTh3ktu0Y6xbEtN6AD2xPgWM+j2Mp+E8jgwuOIvrLkeUgUJLKPWHnXFphUNNpFVM
         j8fEZuoiC+vlmvrDb449zcxUEuAn4YLXUSj8UDdQS9h0K5ua4vLxHqJydhj5iM0zA9Lk
         OLAEPpXn1ViqyTGeSNvgWiDF1dfgA0FGs9Zppb+9GxUn+pc4vtEqjXLbgKT+HscvctJI
         FkUxY8s02hUirmpUS8vVlH6FpATlHMGakjzfaTkUmp7bAIv5YKVNBa6oHo/cxZmEYiLQ
         HM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695595902; x=1696200702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XT92F+VX1pObllF5QiGwjVv1yGLhUUOiTzjpjdANyB8=;
        b=gRo/USBfg+p298JvcPLp91BU4L/wUnxJYfe6hG1T5C/2AjVrj2gYe0q6xpUGxzOEF4
         6ep/kHUIbrmFlSyTXCCTqnXqwv3/FrSTXZ2y4jSuv8nNf02SB3hL+klKhm/ChdpqLVz9
         Qt7Z6ONyr8m5VOtx7QVc5smRVKcdkurA2ceLX7FXtnX1ZSVS1vqPCoy5juEyW3Ft1SYo
         MNCf1GU35ugHy1mRoA4UNUHZe/csMOOLEaUp65i5//7yi8p2fMNbxgK1OLcDWy0+txAG
         fweJs2IwVt7AbOBVW5Sd8brIF9mc0kcsO1ALg2fqqLV/wctTzMsbf28F3x0I7hG1FkWk
         7Fkg==
X-Gm-Message-State: AOJu0YxNRahnSQx1JTavjZJGXVsp/+F9nYVNU8d6FQ/y5RsrcUKVX3YB
        wNEUF//5ezYbc5SZrMQFklJnecifOKKllJksw9doxQ==
X-Google-Smtp-Source: AGHT+IH/peOCCFquz23wU9RxewU8UPnFL8/DlXPpvMWpBaSjdz1XxfeMfyUaXyug0k4xyNnOUT2kiPrP39X+udscZHQ=
X-Received: by 2002:a0d:e6cf:0:b0:561:206a:ee52 with SMTP id
 p198-20020a0de6cf000000b00561206aee52mr6249571ywe.24.1695595902344; Sun, 24
 Sep 2023 15:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230924183103.49487-1-krzysztof.kozlowski@linaro.org> <20230924183103.49487-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230924183103.49487-3-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 25 Sep 2023 01:51:31 +0300
Message-ID: <CAA8EJpp4ME4gvSKt_V-MHC1yi4CoYFctw_9qLZbcDAfPMWJQ+Q@mail.gmail.com>
Subject: Re: [RESEND PATCH 3/3] ARM: dts: qcom: sdx65: correct SPMI node name
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 24 Sept 2023 at 21:31, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Node names should not have vendor prefixes:
>
>   qcom-sdx65-mtp.dtb: qcom,spmi@c440000: $nodename:0: 'qcom,spmi@c440000' does not match '^spmi@.*
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

--
With best wishes
Dmitry
