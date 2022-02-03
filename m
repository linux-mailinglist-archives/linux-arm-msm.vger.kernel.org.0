Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 439E54A8FF8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 22:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355156AbiBCVa5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 16:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355184AbiBCVaw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 16:30:52 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E75DFC06173D
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 13:30:51 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id s185so6191068oie.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 13:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=00ac3hlM2unZobSlvHJEqP+jKCIiHUV5BCi5HRFJx/o=;
        b=HbqyCFQdr7C261e37TCahpcR7IpbRr9Mi0HYnZvgVMCoLYIxMPAEcbSqwMm4zPoUIi
         TVWUMxDfaMfC9dDt3Py/WnFSBnHAXMfpxRNXGp+GOQTY5VnbtkEYjfKJiyTkl6RyWysY
         MUDRn5kXdK1sHC4hMrSvoH3FrinJvkXI9ZVgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=00ac3hlM2unZobSlvHJEqP+jKCIiHUV5BCi5HRFJx/o=;
        b=zAFiwlEQkib54WocpVDqxenA7N5n+ilntc/haSwE6lJ1vSMBqGQdovLpKIq71tJbAL
         WAb4M64wabrWGrGODFf7mew1T+PWR5kdOwxgZvxw6MekpJd0Qc4b7ryqlbByto2B1ayb
         VNEVwbWfNr64hW5fA75MY9gx/iw/KkK6+XFKd7ltdmZQwJ9So0qixSDRQrh70VuynfiM
         KMUkTA1DuvwEtPTcqtnWS+yqRZqV/5odrDBlx/Ywgb0OxJypfGHk/ER7tAd8CLll90SC
         8o5nCw8XfagsuhYmyS8+GqVXVU/Rn6xQ5PWwMlVFPNrLgpjjUcWPnuHbQ+tPf6GhyijK
         bxXg==
X-Gm-Message-State: AOAM532rrD5nO5B1JAK7Rs/ys8QKvbE/oHWDlgLO3ODFWEhHEDD4fsal
        bPXfLvpKd/y48dDbCADGaq/ecnW65XuQ+rViHCFtpQ==
X-Google-Smtp-Source: ABdhPJwLOBr8jp05c5+YBfc+ITUEJcIQhl71CSXbv5OGeB/lRyHGakOPSg8ETT2LJ1mfYxCJA6Bzp4sD1iJMlnfftfE=
X-Received: by 2002:aca:df82:: with SMTP id w124mr8794686oig.112.1643923851375;
 Thu, 03 Feb 2022 13:30:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Feb 2022 21:30:51 +0000
MIME-Version: 1.0
In-Reply-To: <20220202132301.v3.8.Iffff0c12440a047212a164601e637b03b9d2fc78@changeid>
References: <20220202212348.1391534-1-dianders@chromium.org> <20220202132301.v3.8.Iffff0c12440a047212a164601e637b03b9d2fc78@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Feb 2022 21:30:50 +0000
Message-ID: <CAE-0n514WMxh58PSZHX-011EUxzt1jqJD4Bd_onDrfnBkbndJg@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] arm64: dts: qcom: sc7280: Move pcie1_clkreq pull
 / drive str to boards
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     pmaliset@codeaurora.org, mka@chromium.org,
        quic_rjendra@quicinc.com,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        kgodara@codeaurora.org, konrad.dybcio@somainline.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        sibis@codeaurora.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2022-02-02 13:23:42)
> Pullups and drive strength don't belong in the SoC dtsi file. Move to
> the board file.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
