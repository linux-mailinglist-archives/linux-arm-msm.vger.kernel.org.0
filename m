Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B74B11D8E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 22:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731221AbfLLV4P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 16:56:15 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:44706 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730825AbfLLV4P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 16:56:15 -0500
Received: by mail-pj1-f67.google.com with SMTP id w5so101074pjh.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 13:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:cc:to:subject:user-agent:date;
        bh=1+ZIvHvmCyKt057OWZyz3mdVfLxXDjQp5yfeuJKgfxs=;
        b=Me63d7qnsea9LVO3h8EfbZKwC1ALHFkhhrwK/c7UBPS7XcyuMkjBCVB4KwX5Gx1SWx
         KEEZXAyj1c+JqD5Z/DvQwjzNgW1jYIGzgqOoIlCkJBCXv2MP/Ud2/Rl6JNHNByjftP45
         Lh/cMvVWcwSvbo85VV4bk/jYp9ec8bMGVAFiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:cc:to:subject
         :user-agent:date;
        bh=1+ZIvHvmCyKt057OWZyz3mdVfLxXDjQp5yfeuJKgfxs=;
        b=aKHAJ2+Dy5wevis1edfQo/P5Il1TVAxhqdrTF2OyPt4TxcTfmFnrFCeO9bO6pfecSo
         BfSLnZjGnOzVwh1aIkuk5J3G1JkvuPSd+FPXxImZ0KoOP02libr6nBJYhFED/RJPCHIF
         Q999IpYoTTwWFzqemXSCejszXiYp7YahsOMSBNHbNDpxebaZeL7Cs296DCFjRJUlAS+R
         gwL8bPs1rqhgpF2tSxUUFQrSl+Y8efNEMTJrkbO4m5b8Cpa0Ryz1WRJKNXgGqMjSHj/h
         TfcB4CbH8Ke/bjtNgBtkh0SGuQ0YGg62JW93tIRq4ER8Of6VZndNk8lSgqufWLIlLBvV
         xnew==
X-Gm-Message-State: APjAAAX7FHsLHupaQUtLJFBfGZ00bDA0JNqzU6pmhDj8PU5jXk57akb9
        YQqYGUrTwz7cHlhuUgNQdc1z7zCo6amNzg==
X-Google-Smtp-Source: APXvYqw70mhIdtNKRnTb5Z7HcuPx1N9jKpPJisSnELw9YFnYK2+lnPb/2WXEkI0va3N7MBPby2PwFg==
X-Received: by 2002:a17:902:8ecc:: with SMTP id x12mr11899532plo.286.1576187774943;
        Thu, 12 Dec 2019 13:56:14 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d26sm7624486pgv.66.2019.12.12.13.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 13:56:14 -0800 (PST)
Message-ID: <5df2b77e.1c69fb81.15e56.4084@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191212113540.2.Ibad7d3b0bea02957e89047942c61cc6c0aa61715@changeid>
References: <20191212193544.80640-1-dianders@chromium.org> <20191212113540.2.Ibad7d3b0bea02957e89047942c61cc6c0aa61715@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sc7180: Rename gic-its node to msi-controller
User-Agent: alot/0.8.1
Date:   Thu, 12 Dec 2019 13:56:13 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2019-12-12 11:35:38)
> Running `make dtbs_check` yells:
>=20
>   arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml: interrupt-controller@17a00=
000: gic-its@17a40000: False schema
>=20
> From "arm,gic-v3.yaml" we can grok that this is explained by the
> comment "msi-controller is preferred".  Switch to the preferred name
> so that dtbs_check stops yelling.
>=20
> Fixes: 90db71e48070 ("arm64: dts: sc7180: Add minimal dts/dtsi files for =
SC7180 soc")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

This problem is also in sdm845 and probably others.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

