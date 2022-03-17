Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65BBC4DCE70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 20:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236477AbiCQTF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 15:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbiCQTFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 15:05:55 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBF9173341
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 12:04:37 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id b188so6556599oia.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 12:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=PTrq+i/bGKZJZ1/dcLd05WBn7gQSypRU9ywl3uB8x7I=;
        b=EkYXPGMPsWiDCE2YFJ5w7Rgyi1LZqt8BGuoM++4ITvaiizidb42FtQf8qU9EFRRSOw
         yPFCcDdQ/oBlsJwV+AbUAlKkyam2vKkzTDye69FKm1N39eCDFTZ73z33ufSMZDLCE1xl
         bGcIbChB2r0RaN/TWWdRjHvEhlqg/Vdrimub0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=PTrq+i/bGKZJZ1/dcLd05WBn7gQSypRU9ywl3uB8x7I=;
        b=HEhTZGeE5zm/86cRWuO16MiEUHb9DXLBwmM+QECjL51xGKoVBz1FEUPMvDmBNUtGYp
         R21gON8YozzQhat5KxPYmpYmfoi/QTkaBOTKsLHwVlFvkqGIzmwkpcluJRDUKmklt8pm
         ncIHBoz+bA1E4j4F9BbyVQ6/KgNpj/RKeBNT8rHPqbgySE8dDzq4iqRg37bMcQcbze7l
         +bSlMGxSy3MSp7TLIIA2XhRXwZ2oDI07xI9vluhUz1AZI29fzilKsFDn1fkpNlEfYQsK
         36/kakv+WBKij/0somfhvAYm03Eqnbs2MzvH++wglLCQZ8YIq/WgC0+kpq9S/fN+kHoc
         K1Pw==
X-Gm-Message-State: AOAM530r8fxqPAl6batPsHDmhKXP8qMZVVe6H2hyqLtYhENvZiXCk2DP
        suv4svv+h5/kjBCHtorFAfqvy8KpoLW4xN4prpXBZA==
X-Google-Smtp-Source: ABdhPJzNXndL6BEgQxqQ1axdwcYXSR/8mBVJGvam23HJ2pZ0beqB4k2Mv0rkedW7/iN/K/BzXIzmCSKIETFxyzSgiFs=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr2773961oif.63.1647543877066; Thu, 17
 Mar 2022 12:04:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 15:04:36 -0400
MIME-Version: 1.0
In-Reply-To: <20220316172814.v1.4.I37bdb77fdd06fb4143056366d7ec35b929528002@changeid>
References: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
 <20220316172814.v1.4.I37bdb77fdd06fb4143056366d7ec35b929528002@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 17 Mar 2022 15:04:36 -0400
Message-ID: <CAE-0n51KiG8kw5fnwtRf=mv3zPtA0uZ7YiPd+Ga3wT=RHNnF1g@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: sc7280: Add CRD rev5
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2022-03-16 17:28:20)
> Add support for Qualcomm's SC7280 CRD rev5 (aka CRD 3.0/3.1).
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
