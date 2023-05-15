Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5DF5703D91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 21:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244313AbjEOTRS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 15:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244752AbjEOTRL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 15:17:11 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9684F9030
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 12:16:46 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-b9e6ec482b3so17126038276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 12:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684178150; x=1686770150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rwj7HmALS+MhqKxDqaSbTilkC+1p80hDVSkNZedKxh0=;
        b=Z/v1dXdzOUiFmtfgUxmFRHGpqgKpSey28/NQ+BQBTgppLJQpbjRr8jX1muP48+dGdL
         QtuygUq2CfxdzmGf4jLLmeRIXZWgUU0hEihyJO3jPdFRBgJAFCn0BwHMN5hmL2siAxwS
         AwafwhW/YG2R9lZuURR63FG+VEhRz9A5gUpPtkOeNkwcJ6/2EMOMl+ECKW+dCrCGJih2
         XsRxHfaiUTrwPytPVY2v7qD97CUf1Fxt9BGaYLUo3ohEDuJ5zOey4K5KADtCK522elu2
         bkvNbUpnRFJ2tZgsJnBvUNY7arARsGbPFn6d6QSfsJFXrP+S5Hp0ubpZC5TSH1Wd7aln
         H9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684178150; x=1686770150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rwj7HmALS+MhqKxDqaSbTilkC+1p80hDVSkNZedKxh0=;
        b=fByhSYoIBAKlFJ5LFy/+/v7p0A/Lm084gK4DQa05FCqwWncW/nnib1NQlef1hj8rnL
         Ohu376bgaIoHy6faeR/D3YL/izcy5fOQOsQXVr0eWCUfUhkHAJ1zi7rgPERnu9rpzVZ9
         I3vQtqlgCqNv6KgvxGzqgvbI1CnVwRRk1hFAnujv18YJIEgdz56QseMS/Crhu1L9reIz
         Eb2NUwVF8NY4UYb0PaC1dRrovDm72CxudblQyWw7LS7S/p0CV/LDQeBR6bhek1pwNfNj
         y3m3oZ4l1kUa7W1BLTwPn0tmJU5qDUrs5dOUKlQgl3pnySsAfl/s2KX+iDxvk5brsorA
         zfzA==
X-Gm-Message-State: AC+VfDyagRMMWBgJ1Rfctu0bnQznbW5vARF4HaAuuuO7VNtDoBEkTdQ9
        kiVze1WnxccYbTn1VOW2OFncv5pxWCJRwGLIXWEnKg==
X-Google-Smtp-Source: ACHHUZ5kUvl26OD9xqqPxASutqEUaQgc5O/02s/H6sttBXO1cFJw5y1PoVEbuPQlnpRfUnr0JFXQJ7ReuItD7KdrQvo=
X-Received: by 2002:a25:6ac6:0:b0:b9d:67a5:a725 with SMTP id
 f189-20020a256ac6000000b00b9d67a5a725mr31463639ybc.15.1684178149828; Mon, 15
 May 2023 12:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230515-topic-rb2-bits-v1-0-a52d154a639d@linaro.org> <20230515-topic-rb2-bits-v1-2-a52d154a639d@linaro.org>
In-Reply-To: <20230515-topic-rb2-bits-v1-2-a52d154a639d@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 15 May 2023 22:15:39 +0300
Message-ID: <CAA8EJpq-TBeFLBDWya4Tesx9MQm02i+LEJohTXUyH+NrwHZT+g@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: qrb4210-rb2: Enable display out
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 May 2023 at 16:04, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> The RB2 has a HDMI output via an LT9611UXC bridge. Set it up.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 88 +++++++++++++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 1 deletion(-)

-- 
With best wishes
Dmitry
