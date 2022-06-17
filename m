Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D042154FB2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 18:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383364AbiFQQeR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 12:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383361AbiFQQeQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 12:34:16 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CDC45AD3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 09:34:15 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id m4so1430566pjv.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 09:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/SUiA5/6yD8jBcs4/4PIiOeHVN225+1rcfDUU5wol1w=;
        b=lJODbk3nKBJ3S9c8jNrmuprnaecbHNaFB6svH2KgLnlEAMFqXxX83lefCqvbdXDxc8
         YgR70IsuSifC7KvdjyVIIR/5eM8/3NvoPaO44AYCtQHFhJP1py5zOheQG2TlTlz3+GKO
         sJkoGxMmNBKZpZMk33D/jRl4g8xbw+Qim7rIzLsPxS76o/Ghn6p/VewvG6bnLX6MTGwU
         15by7jtysnAIQHwqDlKbsUTASAyQNFxK7aF+ccenXtpC61n+680fhq0ZSFzjLgb+j5yn
         fmQGJz0Vx7IITblBWlLWU6ajeBFJgAv6jCoBVu/p8Jf7hTlbaGEllhwAhF70KdYZEVh1
         Xk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/SUiA5/6yD8jBcs4/4PIiOeHVN225+1rcfDUU5wol1w=;
        b=rXpoOYApXcLGbqLKj8U4EPlz5jyDfTRY1smoSC35Mkye7HOKULkVH9Pa6MPw64NDNz
         Obv3sXyhUD6M5dFKFayqOse4ZVFO4C33jqwq/dnTxLUl4dFtg2SM42CMXtAdMoiaU5cW
         9T39PBChmlrog6VwD11oucu6mJfrh3E0KhVDRE3zSgTKhNPVKL17ATR6fCEE9FjART5B
         +Ro1FI0hmPad7KGqJdaTMydR37okduekgOh4HoPibINmXHCeZrAmGr7/Z2Syn5ZiGQXV
         JOrRQ0cbczidHEVRGSfsQVGfq7OzEjiEk30QdzFPQ2cwBEvb1U7xIqU5QJksTBaPheW8
         e9Dw==
X-Gm-Message-State: AJIora+eAlDdPbphSPPoIopB1Tcb1n/7X0jgztDBPbEQCm4Bu1YITbYx
        6sRRF1WgEhlcpI1PZIvtCKPwZVMRKRDL3lVP
X-Google-Smtp-Source: AGRyM1tBq/ZuMGoYzv+UipK7GpLsDiDezjmni6Wa8OCCPVVq6HOXbPMXc1NtOe3X1ZOn4xMXBFoU1Q==
X-Received: by 2002:a17:903:1108:b0:168:fa61:1456 with SMTP id n8-20020a170903110800b00168fa611456mr10578884plh.162.1655483654937;
        Fri, 17 Jun 2022 09:34:14 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902edc300b0016370e1af6bsm3797381plk.128.2022.06.17.09.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 09:34:14 -0700 (PDT)
Date:   Fri, 17 Jun 2022 17:34:11 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Subject: Re: [PATCH V15 2/9] dt-bindings: mfd: pm8008: Change the address
 cells
Message-ID: <YqytAxcPmoBr1dl5@google.com>
References: <1655200111-18357-1-git-send-email-quic_c_skakit@quicinc.com>
 <1655200111-18357-3-git-send-email-quic_c_skakit@quicinc.com>
 <YquZnHF5u/eMpO/y@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YquZnHF5u/eMpO/y@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Jun 2022, Lee Jones wrote:

> On Tue, 14 Jun 2022, Satya Priya wrote:
> 
> > Change the address cells as '2' so that the first cell
> > describes the i2c address offset of the clients.
> > This helps us to define the child nodes of all
> > clients under the same parent mfd node, instead of
> > adding separate mfd DT nodes.
> > 
> > Change the gpios reg value accordingly.
> > 
> > Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > Changes in V15:
> >  - None.
> > 
> > Changes in V14:
> >  - None.
> > 
> > Changes in V13:
> >  - Fixed nit.
> > 
> >  Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> Applied, thanks.

Sorry, wrong key-combo:

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
