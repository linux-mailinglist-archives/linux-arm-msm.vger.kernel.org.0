Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842C832C16D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389335AbhCCVgp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:36:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842754AbhCCIMb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 03:12:31 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F192C061788
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 00:11:49 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id s16so13595224plr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 00:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=DMQiSblKmDEtFz8Bw7dmgo7l8LMebNEzg/kjl/liqLE=;
        b=CT2YnraIqGDeegc9kIxrFgu83h+aOyX8MHYWE5TkKVrlsewCS8M2DBC74Ikk6wS7Ih
         FHYyVjx/IpBm/jxbb3BQJm7wCXmouSMC2bupCDVxi6hSF9yeRItrbkj/hGx4M1nubiPX
         pprCZCuVKh3K2Ou/uJXQH/hhlgm4kAdGCSf6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=DMQiSblKmDEtFz8Bw7dmgo7l8LMebNEzg/kjl/liqLE=;
        b=dI1citWm83OqdqMbSicvIg6aVo6ttlKj0My1VC7u1lbciRgdOFDmTv1AEm7XREcKVy
         F+vOr5FhjHzH2VYNhchhYN0w8tcHFEG89fREDbA20XOSPLP8BU5m3E+nH17F+KcNQi7L
         QGeWuWU2t+CKZArDLhTNVOT0eTHDrey0WA6hT909Qegvy/bWTWM4lTHmdw25XvmLuT/b
         c960Tt4CtGat4yhC3G9ZT64hF7gJS52E2ORnpJn/sAJdj4wjfUyNxBfG7e+x+wec8i75
         ik9QZea/zCF+QiwFY7CxwGeMkFf7SgujQiSfDCI6BwXg+7G+0a87gaVs/2kbVtxhTA6V
         bxWA==
X-Gm-Message-State: AOAM532gVUBL4qt9QlVkdwXj+3epnmuBGQPzWeMiMygmfA8uXG8Ka3TO
        p7sFKpapuEZ4QDiyfKzrTwxw6MaH/cRELg==
X-Google-Smtp-Source: ABdhPJxG/tKzWxUKe7+dddHY2Jcl8eQsDrsMzm3AcEg1Vm6JEscnTVVEqx9/efCzaa8Uw3lummw/PA==
X-Received: by 2002:a17:90b:909:: with SMTP id bo9mr8451689pjb.107.1614759108852;
        Wed, 03 Mar 2021 00:11:48 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id u15sm22547301pfk.128.2021.03.03.00.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 00:11:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e96d665d1e98b46a189a57e39575ae0debf37172.1614669585.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1614669585.git.saiprakash.ranjan@codeaurora.org> <e96d665d1e98b46a189a57e39575ae0debf37172.1614669585.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc7180: Rename the qmp node to power-controller
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Date:   Wed, 03 Mar 2021 00:11:46 -0800
Message-ID: <161475910634.1478170.13268307384255747031@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2021-03-01 23:28:01)
> Use the generic DT node name "power-controller" for AOSS message ram
> instead of the protocol name QMP(Qualcomm Messaging Protocol) since
> it is used for power management requests.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
