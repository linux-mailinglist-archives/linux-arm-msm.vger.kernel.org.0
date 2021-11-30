Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E42E462A07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Nov 2021 02:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237007AbhK3CAT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Nov 2021 21:00:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237009AbhK3CAT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Nov 2021 21:00:19 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21627C061746
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Nov 2021 17:57:01 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id be32so38200085oib.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Nov 2021 17:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=+S5XPuje8BzbnzhMfN+26zklRaOAhLi8cM3kfrahm5g=;
        b=NT+rnO165dhJTeUW1vX0q9hslQ2895l8JcuTMgkPsjaIq+EUnfMaIaX+wViGQ1i6gz
         dXGQL6J9LfWIIHMgL1HdoBNfYE694uT6FGBnHg33zHfKihgMzKqu5B9XBnBMN2IEMB2y
         araAFnU1gG0vVy9Ih8Sq5jzNGdBBJABY0S9uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=+S5XPuje8BzbnzhMfN+26zklRaOAhLi8cM3kfrahm5g=;
        b=K/vBfaUooQ5lk6WXQbmwA1qQuaufdetbsfWiMgV14ppGSYUsLU36WnHi8IM3B8942T
         lMD0b7uuMZBol6IBVdynUhDQl0BZkWOROvJiJViboGo06D0wVONEXZGTw06VChimjCp2
         go0FOLD4/QK11DuZqhyhhu6zGDuMk3hiqbs7Y5r3CrwPSE9oGzZORcGERo8ENyJw5Yjq
         yVJVsJs7lreWioUzcJx/F3J7nwwRg4w5SE/3yLpeysKqgKnY0Aci88iUB2OYPERs/GaO
         5ZXj9o6856fYrEbX9YbHuy+HFvL0RwQRT08dawSZqvrNJ+3mzyqUxeiFIMjNDEJxtUgp
         ki2Q==
X-Gm-Message-State: AOAM5319N98k9T66vlFIzM1wRcudSdz2yNASJIAGdO62YwQmgs1I5ZV1
        u6qEgiAFiddosuH51tLJ4V2f1TY8zH4MCF0kIPvr2g==
X-Google-Smtp-Source: ABdhPJz9tnp1mySp/zJJ2aaxE3lXKnUEvhvdTrolUDKj5KFMsus9NwXirOZae7SIE1fuxrKOjyeNBu69wtPFYjF2QVc=
X-Received: by 2002:a54:4506:: with SMTP id l6mr1675592oil.32.1638237420507;
 Mon, 29 Nov 2021 17:57:00 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Nov 2021 17:57:00 -0800
MIME-Version: 1.0
In-Reply-To: <1637668167-31325-4-git-send-email-quic_c_skakit@quicinc.com>
References: <1637668167-31325-1-git-send-email-quic_c_skakit@quicinc.com> <1637668167-31325-4-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 29 Nov 2021 17:56:59 -0800
Message-ID: <CAE-0n50OQgDg=GfShOr2NNAST4nKefHw+vUnDg+NioREAymK+Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7280: Add pmg1110 regulators for sc7280-crd
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mka@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2021-11-23 03:49:27)
> Add pmg1110 pmic regulators support.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
