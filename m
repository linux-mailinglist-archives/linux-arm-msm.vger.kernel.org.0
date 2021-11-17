Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B050B4540E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 07:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbhKQGhJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 01:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhKQGhJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 01:37:09 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16420C061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:34:11 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso2875376otf.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=vCzASmrLUCl3uMtM9EnmqaVP610BnB20jP+PEjoftl4=;
        b=QBBUgGKCL6aA37G0fIca6LnwhFeIbtcPDEPzRGlrv2n0MSA5A/9wI/TrrcbtvXTGM0
         KtQQQOY8m6IV6+j+KrDlqi4tS2IiYVqf0MpOTeYWG4QkSWpSm9TmxE8+jxNUaxWrognc
         NrO5RGarfbjN84FQ9Af5diEkDKQqrrlFsDiE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=vCzASmrLUCl3uMtM9EnmqaVP610BnB20jP+PEjoftl4=;
        b=V3WAL8TEblgAJ83mxQ8yLehgt9/epjs8UXBvbZe4+MVVqmM2nsa9s5gCwZeSOMF7Ni
         DT/dIn0SHhwq2h09ZxhH5Wk61+CXXQoa5eWLaGfrd0ZywxJhtbGNrlEWQbX2FL3laqDX
         k1h8QSRewMugY75z2ZeV+Tqu3LDolgfx4Iy/ld91pJIzjWQF6w3Et93uONwpAnWyzUpZ
         /l/j1560mlSYnXPWd4wo/fzA61XUnah/Fo4F58OeuRdBQ+uvn57vLY/c/gqmv/PfSFUq
         8MSbsPd1KR6SQje1/gnhx7ECq5UKCxaXy2BB9iEK8ejNThuPJ2RPib9MsO80J3oCsIkT
         EJNQ==
X-Gm-Message-State: AOAM532WhUrliAlsIk0a89RPc0cc0uv4q93eyLI2yaciLj8XPJye/LxL
        i9kOXLz9EktyOGZJH/R4wxJLNtTOOPqzWaEyQAH1UA==
X-Google-Smtp-Source: ABdhPJxkjx80DNr29oB9sw/rdZAY2nbNBj2CdOh8Cxc3DVJ+V8lXaUwY/y6cL9yUAR367uTcX/E5bXxAAqoPNZdGP1c=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr11561237otl.126.1637130850501;
 Tue, 16 Nov 2021 22:34:10 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:34:09 -0800
MIME-Version: 1.0
In-Reply-To: <1637060508-30375-2-git-send-email-pmaliset@codeaurora.org>
References: <1637060508-30375-1-git-send-email-pmaliset@codeaurora.org> <1637060508-30375-2-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 16 Nov 2021 22:34:09 -0800
Message-ID: <CAE-0n5050Rnw5++HNrDMzN3Wgufk0SnweLzDb4jiEQZUjjXb7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sc7280: Fix incorrect clock name
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lorenzo.pieralisi@arm.com,
        manivannan.sadhasivam@linaro.org, mka@chromium.org,
        robh+dt@kernel.org, svarbanov@mm-sol.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Prasad Malisetty (2021-11-16 03:01:46)
> Replace pcie_1_pipe-clk clock name with pcie_1_pipe_clk
> To match with dt binding.
>
> Fixes: ab7772de8612 ("arm64: dts: qcom: SC7280: Add rpmhcc clock controller node")
>
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> Reported-by: kernel test robot <lkp@intel.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
