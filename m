Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2A06F70A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 19:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjEDRPY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 13:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjEDRPX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 13:15:23 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CD33AA7
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 10:15:21 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-2f27a9c7970so718359f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 10:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683220519; x=1685812519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mPxz+XWlXQuQsb3fDFfD8YJvL7javRdaPks0ljDpTFI=;
        b=WMc5XOjIqzCkMxkbelUG6Azyo4ovAmJa42k7u5K/7aE8Jiq4UM/D+KcQ1DsJe0g1bC
         KYOvHpsOYgPBdZ0LUD2qWE4IWTaC+hT/9jRqtVw2UWPoGwK50I8k26bS7cgAGWyUjquY
         WzbZV1B4j3d5qoDLD4DtXuyvDBYfX9JEUzRnCe9XCPyUPnmofVkRuFTfTW6hmWi4cJYj
         zLqXqh03Keffm5TXqSVCRDCe9VKWAdZcWa03BRrEsrtWKWvj4XjPB3R8lc8NE6unTq6B
         35Swcg4+nLD0+CIWEK/+ldi8CF3WzMt1AvWI8KmafB/AJaQ4dSZcrVPHZFhln+wie3ky
         uTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683220519; x=1685812519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPxz+XWlXQuQsb3fDFfD8YJvL7javRdaPks0ljDpTFI=;
        b=G4GcRa28BfRoMkQAcXjgBAD9jUcwAfMxLFoQRBbQee6ZVhTq27SawHnOnNjvR8mjYQ
         YReQUiy82vWj3gLm5NAJUo31S3ng/A5EIHzzfJFVRZUw3zlU/qko/CRj6sPuElxq627q
         Ud1fuVipH1oMwOXJwjs+WUkT5zVG8ULL6stzEq1ry1c+S2vL4qI6jS/SlZaPaLMFBHep
         VDH9NKLTRRJqFoySkDkVfSRzs+B/HtAhboaCsKerfG2YETW4fSdJUBnPex1Iku/d0EWA
         TKfe3hoJyro43l6BOFS9S+3SarpEmlonYqRyL3QPgD2RLP4bkSQ40WKmfqdkaYn607Pq
         8Liw==
X-Gm-Message-State: AC+VfDzVsWehFSO5UH0oVjjXwDrgbtwq1RHYW/H/rndItRWlx0zFLn5x
        XEDC0ilYJ+DA9HdfPIcQgDagthDS4/VnATLfXOR1Gg==
X-Google-Smtp-Source: ACHHUZ7OBUvbjJ8DH6bij+IQ1ETjKEi6vzhPPQ7PS0McYH+SJEvnAvTYVizHZBdeou6PKE2blxE+YQprpGkcPiIC4LE=
X-Received: by 2002:adf:e60b:0:b0:2e9:bb2f:ce03 with SMTP id
 p11-20020adfe60b000000b002e9bb2fce03mr3254064wrm.0.1683220519370; Thu, 04 May
 2023 10:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230501105832.1185477-1-bhupesh.sharma@linaro.org>
 <20230501105832.1185477-4-bhupesh.sharma@linaro.org> <1aaff58a-f07b-1e2a-e27b-df41eacd19e7@linaro.org>
In-Reply-To: <1aaff58a-f07b-1e2a-e27b-df41eacd19e7@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 4 May 2023 22:45:08 +0530
Message-ID: <CAH=2NtziEnOquGBukh221Lv6++QJdrEEkU1v469QqvR+AZRYyg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qrb4210-rb2: Enable aDSP and
 cDSP remoteproc nodes
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2 May 2023 at 17:28, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 1.05.2023 12:58, Bhupesh Sharma wrote:
> > Enable the aDSP and cDSP remoteproc nodes on Qualcomm QRB4210 RB2 board.
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > index bff6ba1d689f..3ab46499d3fa 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > @@ -34,6 +34,16 @@ &qupv3_id_0 {
> >       status = "okay";
> >  };
> >
> > +&remoteproc_adsp {
> > +     status = "okay";
> > +     firmware-name = "qcom/sm6115/adsp.mdt";
> status last
> also, don't we want to use .mbn (squashed binary)?

Ok, let me fix this in the next version.

Thanks,
Bhupesh
