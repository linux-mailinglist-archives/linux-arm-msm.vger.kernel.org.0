Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6E932C173
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389332AbhCCVhI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842794AbhCCINQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 03:13:16 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49207C0617AA
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 00:12:04 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id i14so3665586pjz.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 00:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=cNB+rn3m/c0qCBrxMUzbBmExAOrSfz5vTuE3U+agUho=;
        b=OKOt7FIFmbNU0E41uMvwBT3XXeUf+LzUbH4NnK0xrtn6RgIR09wu8OohoaThKyQZTh
         kXhMXR3mZc6aTeUx8X3LDie1mfHjjDywaHT1XTDIyTbcfdcqEecXHzlZHNwaf4KSM7lu
         IQ3Pp2qoJcuI2wUQbjuB+PsvsPf92533leIXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=cNB+rn3m/c0qCBrxMUzbBmExAOrSfz5vTuE3U+agUho=;
        b=kP8jZuIOMFxkfMCC57CBAT6eBm8xdEwL+LQOKmjsETxNRnOVbxvmKNSycL2jsXOdPe
         uOBXtqrC0CV2/cMcMBGGjEv1pxKU41hRs7uee0TCZrFgo5sLs76JrIfyR8OaYdRfPJId
         yEzXrAOAHpbNL27OCIZAYXyIe5ZmGsXI1dlrmq4H6wdLXMphAA0x76yIW5pCW10Pe6Kl
         eUkCex8r1oUZG0AS8cruCEg/fAV8uK0wwC4NB6cnSH5Sa3odLUwNELXm9DZtG4DQEXWh
         FpAF0cndZyilxrN2Dscf38T8DaTmE5ERBVhXTbYOMOiCDMh0yoDOQ4eq8/PKMk1vm+io
         uVKg==
X-Gm-Message-State: AOAM531bZlzbd1iyl9tVPgkld+dPU9vLU5+jvNO8vtFXFcA+tnrzjSjH
        87zeUEEyXVLDAHAVkRVQO8dT6Q==
X-Google-Smtp-Source: ABdhPJyxjZBdqSCyiP90VJHQS4CxK+Qlc8FiU9W/MK8lalxyYMV4vYt8vjBlR4mtt3OvyR1iCqeVAg==
X-Received: by 2002:a17:90a:8c86:: with SMTP id b6mr4956533pjo.8.1614759123857;
        Wed, 03 Mar 2021 00:12:03 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id i13sm22775539pfe.46.2021.03.03.00.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 00:12:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <044fe2e590e166060de65f074df6874ec3a79531.1614669585.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1614669585.git.saiprakash.ranjan@codeaurora.org> <044fe2e590e166060de65f074df6874ec3a79531.1614669585.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8250: Rename the qmp node to power-controller
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Date:   Wed, 03 Mar 2021 00:12:01 -0800
Message-ID: <161475912182.1478170.16668973229202283070@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2021-03-01 23:28:03)
> Use the generic DT node name "power-controller" for AOSS message ram
> instead of the protocol name QMP(Qualcomm Messaging Protocol) since
> it is used for power management requests.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
