Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 221DC4139E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 20:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbhIUSUI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 14:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbhIUSUI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 14:20:08 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880BAC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 11:18:39 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id c6-20020a9d2786000000b005471981d559so8099498otb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 11:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=wRIT4s1i/ShcOgxfjk26/chTDGk5J7qcbPp6zKx8wL8=;
        b=O/2eYurCO/RmjAPGB8JVzLIkW70Y7fAHFdWVq3FjQYPfJ74EUMPVH+s6by2pFUAiJh
         hnAt2edp59tSX/Sfwq99Bn/jxK9pr0CS917pRSPuQMaWVcEEj2gyxIunGzJB1baLUrwr
         dwnYo+QZQ/wZuSkPQcjSKCd5CrCZyMGlE36EA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=wRIT4s1i/ShcOgxfjk26/chTDGk5J7qcbPp6zKx8wL8=;
        b=V+oHc1T3/aCwuzoWOW1dL9PGfVlm8a1fm84B7FsRyd8vcPeMRZByZNUHorRnJTTYUS
         S/U+TbCRacZBRG6dFS4zVjaWKgSfoUdg2gTbXrsapFCz7Tl1m5noDnEEuqiNfujZlFNx
         qFJyoEY+1SQg/HESMjzf5cEBi2luT4jaKSpwrzS5utHHlO/+9vJtGRpe3z3rUnNJGjru
         jYLoUFCWVdYnkIA3EUwvd3LAckYp44f4CoS8VxJaJSJ6yWbkH9khy4+9L6ogYh8Ccu2q
         cLeS8DhciCjmBlYB9oGFI4qkCw9MpQtcKQoFQ/pTSfix1nlVQ0anZxgra05v9121cmzT
         FrOg==
X-Gm-Message-State: AOAM533kpmg6eLT1JlzShDWkgSRopZlFoFnlcVCGdAQP+q/7DoqGxJMS
        vl9G4mPa1Lod80a1CnDT57IzYGXK4FG4ElMwXhoICA==
X-Google-Smtp-Source: ABdhPJw6e8geb8YL/7MJWKkTXO13qz7mPLMAUDCSnLFmjbkfJLLfy1WYN3WJ0fDFhBEaiOzeUbsjdhA6UmV7LoOP+as=
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr25758184otp.159.1632248318469;
 Tue, 21 Sep 2021 11:18:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Sep 2021 11:18:38 -0700
MIME-Version: 1.0
In-Reply-To: <1632220746-25943-8-git-send-email-rajpat@codeaurora.org>
References: <1632220746-25943-1-git-send-email-rajpat@codeaurora.org> <1632220746-25943-8-git-send-email-rajpat@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 21 Sep 2021 11:18:38 -0700
Message-ID: <CAE-0n50aP3u3ZgZXrTA2R1YuKghi8p0BwSsXsceKKxrz97xAVA@mail.gmail.com>
Subject: Re: [PATCH V9 7/8] arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajesh Patil <rajpat@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, mka@chromium.org, dianders@chromium.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajesh Patil (2021-09-21 03:39:05)
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
>
> Add QUPv3 wrapper_1 DT nodes for SC7280 SoC.
>
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Same comment here. Please make the cs_gpio nodes unused.
