Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EBD4991D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jan 2022 21:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353492AbiAXUOc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 15:14:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349559AbiAXUNl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 15:13:41 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F505C0604D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 11:37:11 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id u25-20020a4ad0d9000000b002e8d4370689so1319795oor.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 11:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=OE7zpDJ/ImAr/I0egnBqJG8bk650Ar7DpEUyTPdTJtw=;
        b=S8celvhQE9q1bVrsDARpFL2ugWnZwTBbS5TBo3ge8O3ANqZlz/LKKjwmwAAyYfL+53
         BinD7Pbe4Z6hIVUdszsDpeVk4TVKG9cPqzfWIu70VfCiv/4vLUPApzaJZhZ4QPVK91Kd
         CpfFLphYeYEIT62X+JtCQK18CcbJ9Zdm4JMDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=OE7zpDJ/ImAr/I0egnBqJG8bk650Ar7DpEUyTPdTJtw=;
        b=ZJLbBJV+RpiA9Btz60PCLhPQv3+QqcU0dcASuMU4QPWAWnqNYTU33Vs24CMthEhAqz
         Kyfkc1qGW/OtqdzbsHo+2HAkUCkaEabs+3URq+W4J/E8EgMFxIAczoJxWQQp3rWz5+2e
         M88ckPpJlDv652qIJ23UfNCLAXiThPRj3ZbYkTM0gWyvMzYXYI4G3pznIMTsZlpz64Ei
         tqRcriZyNtt3AkoatStys/C+VfYSTBLmMJroRg2QukzgqXGPUdSMKzfVD43p/pwrpMvh
         MclaJL9MyjwhUMNOo3sJpi1hCo/AQ6iY0EvqJqkGfai30QS7JaTECVDdRsdTMnsd47k9
         owYg==
X-Gm-Message-State: AOAM532HMp5/uVUM3HV9RIqZYPm+Ei9fE6aYx618L+wqwSx1oyurojV6
        drXdyvaBVjbI9IbHdjVlxC5Id6/Hfpp5w2djxCP/Tg==
X-Google-Smtp-Source: ABdhPJytm+GOXzINucfGcA+WQ9XKPuPqK22JwGD5fA+K100i2lRiCUy7M7FJjrzhXKMKZjBf8J4ppeFUksmNinWY2Ds=
X-Received: by 2002:a4a:c118:: with SMTP id s24mr7146077oop.8.1643053030979;
 Mon, 24 Jan 2022 11:37:10 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Jan 2022 11:37:10 -0800
MIME-Version: 1.0
In-Reply-To: <20220124184437.9278-1-tdas@codeaurora.org>
References: <20220124184437.9278-1-tdas@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 24 Jan 2022 11:37:10 -0800
Message-ID: <CAE-0n50bTcjL9qAdfprs43fdfn1Ft=cnCRVp9XjQ+iw_f57SLQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7280: Add camcc clock node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2022-01-24 10:44:37)
> Add the camera clock controller node for SC7280 SoC.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
