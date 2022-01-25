Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335F949BF2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jan 2022 23:54:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbiAYWyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jan 2022 17:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234444AbiAYWy3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jan 2022 17:54:29 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7584AC061747
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 14:54:29 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id s185so17259983oie.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 14:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rrsOOvJkunzZcTxJprrd7nzOQbxZFpvykqOr/+MLi1s=;
        b=BGj6xncdCUBw+dFh0UA6BQgK451HbsSotp1jBAIOZuf13bcbqxWn7zlh/f2sck0ubv
         qaZt7pf870UBBQ0yOrRrjpAoeeT0c/GGJyy8Mrax5LuoZnnRZQQnKQW4nUUCfFaMFBax
         RpmXBR7GtNo9p14HkH7s4Ofq+Zvi9HEcp5ap4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rrsOOvJkunzZcTxJprrd7nzOQbxZFpvykqOr/+MLi1s=;
        b=gQQfXV9RE6crjT9CXoyawFK24Mdt6OKgoT8L/B8mXu6cMdDQSvMqAIt9+/vaJi8gjn
         ZaJhShsitqVMwAcRBLR+4tZQtmu/NjC2c5sxNIwZJeq92FEKkyEhwALRJa+PKhDd6DOe
         jH92URfFWDZHYUZu4ZM4r/sID0VmUWTed7bmwWLX1SSScBgu9K70xcsvXjH7y1lzFcr+
         Rym94Nq++YIwJfBIm6OaZjLkG6fhkgVpR8xA5DZeINmp0KrZlK5CEzCW+kKEC7pzOpva
         MfGz9o46CjH/RzRkaRW5x7yeNiDv0RYmpX2Met3t3mCFI7Ez9ZATLSDiPc/X/XNOseDT
         fBLg==
X-Gm-Message-State: AOAM530iirD2G87m0IuNa5stvLQWkhi0+nzntqrAGPv2zm1QdHdKXfvs
        jRwiJStiy5LmwRQcjigzk0sEXPaNZxl0MJqFVXpBQw==
X-Google-Smtp-Source: ABdhPJxYI6JHpchAVHhvrnNFlcx/rm4ZvkutpOYZUYmoxNaUkSiQxFIOUL6rQa/BWyon7PzRzslfDcBqaVcbIPgL5l0=
X-Received: by 2002:a05:6808:1302:: with SMTP id y2mr2150137oiv.238.1643151268454;
 Tue, 25 Jan 2022 14:54:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Jan 2022 14:54:27 -0800
MIME-Version: 1.0
In-Reply-To: <20220125144316.v2.4.I3194c8bdb2ad3212665286fa273710a3c4840e94@changeid>
References: <20220125224422.544381-1-dianders@chromium.org> <20220125144316.v2.4.I3194c8bdb2ad3212665286fa273710a3c4840e94@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 25 Jan 2022 14:54:27 -0800
Message-ID: <CAE-0n51=GLNbOrWBdH2k2BkwQnJru1BdV2As9RiNUqXtPek81A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sc7280: Factor gpio.h include to sc7280.dtsi
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     konrad.dybcio@somainline.org, kgodara@codeaurora.org,
        mka@chromium.org, sibis@codeaurora.org, pmaliset@codeaurora.org,
        quic_rjendra@quicinc.com, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2022-01-25 14:44:21)
> Though sc7280 itself doesn't need any of the defines in gpio.h, it's
> highly likely that the actual boards will use them. Let's add the
> include to the sc7280.dtsi file so that boards don't need to do it.
>
> Suggested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
