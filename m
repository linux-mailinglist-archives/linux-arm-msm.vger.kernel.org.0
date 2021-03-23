Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF05345617
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 04:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhCWDPt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 23:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhCWDPj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 23:15:39 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C280C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 20:15:39 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id l1so10285900pgb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 20:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=jGUaPOQSEmqCBFbxb1GC8sYi3rSqHsQAKV/yKvutXBM=;
        b=hz2tYU3k4W75mMAU+jqBN9xgqJEwwMyrLdTSVCspMr1KuOY55R/RuigQr9VChS0WZe
         YYHY36/kV7NjDkslQmspUjH1Sc1D+kZo3N+AyEEmEAEqgnhs2WggMsPwJ+oQn6ClZXJ0
         8bbeTuAOzVoR0XTONGKiZT3tv1tvZ+oD1H8xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=jGUaPOQSEmqCBFbxb1GC8sYi3rSqHsQAKV/yKvutXBM=;
        b=QidO5phJmdacUJcueFQPits6NJZO2ka7T48KhocaPtd4BlmKqV5Yx1Dgu5sb1PbOiP
         lq+tL8G8FWB7e8HxrhRw4Mjt6ZWESrxY7KnPjcwg3nayVNc/XTBP3+QMDuWDwqidY0f+
         9r31h348NFTQVn/2/wKw4WkHxnzYvoOwe3DPHlh9w31uYVAeF7fE3tmhthmtbGKEpPnD
         4bOg3BwcGRYr1PfMTllnn7wQK+TnQYyM2GdnxmdRgyojcnOV7V2FamEEAqVe0uSVg4GF
         YdCZl1jLVBHRD3f2tcofa2f0cz7qdkjw34K6fY0CPd4dwEFoUuijfe8Wmvof5l+GD1nD
         TlOQ==
X-Gm-Message-State: AOAM530+OrMIFbdeketPEXHEGHx2S4pGUGkvgGUNw+R+081qXyZ7As2w
        OHm6yAZAg/AYRzifnRAwlXkNyw==
X-Google-Smtp-Source: ABdhPJxarOGT5B7hQXaAuoJ9oYGLFb3jDqyW2N7ukTRwPWfqHsmjpflHqbfk1NG5prtsPOJp+ZsWxw==
X-Received: by 2002:a63:1a0d:: with SMTP id a13mr2123511pga.167.1616469336672;
        Mon, 22 Mar 2021 20:15:36 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id 3sm14766038pfh.13.2021.03.22.20.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 20:15:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210315103836.1.I9a97120319d43b42353aeac4d348624d60687df7@changeid>
References: <20210315103836.1.I9a97120319d43b42353aeac4d348624d60687df7@changeid>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Fix sc7180-qmp-usb3-dp-phy reg sizes
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Mon, 22 Mar 2021 20:15:34 -0700
Message-ID: <161646933476.2972785.7556083242076314882@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-03-15 10:38:54)
> As per Dmitry Baryshkov [1]:
> a) The 2nd "reg" should be 0x3c because "Offset 0x38 is
>    USB3_DP_COM_REVISION_ID3 (not used by the current driver though)."

I see 0x34 for the offset here instead of 0x38 but I don't think it
really matters either way.

> b) The 3rd "reg" "is a serdes region and qmp_v3_dp_serdes_tbl contains
>    registers 0x148 and 0x154."
>=20
> I think because the 3rd "reg" is a serdes region we should just use
> the same size as the 1st "reg"?
>=20
> [1] https://lore.kernel.org/r/ee5695bb-a603-0dd5-7a7f-695e919b1af1@linaro=
.org
>=20
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Vara Reddy <varar@codeaurora.org>
> Cc: Tanmay Shah <tanmay@codeaurora.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Fixes: 58fd7ae621e7 ("arm64: dts: qcom: sc7180: Update dts for DP phy ins=
ide QMP phy")
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
