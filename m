Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C55B4A5688
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234813AbiBAFVq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234218AbiBAFUs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:48 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BDEC061788
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:44 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id m10so6179256oie.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hy1PRuFMC9Ce2a9cN4d8FhqZJnP42URBCgpnIQqeV8w=;
        b=DT4fm5bhm/yWpQy4ULEutr8AAWE+qCM7uAwskI4/Ky9os3bIMLZjEB+kPdWWzpwwTM
         LNaO9LEh5ze+ySW5/+ZaLAlWrA3NDnRLNUixmTVnh21wF+AooRQup+1FMM8FBIQ98YVm
         kI+q+pHOpprM1CiWG6S4Jk+Bzcercp4P0YkUkQMRdm7hvjBnJTyRSFlK9cvPrwf0djIz
         plMhzyIXQdzP1CtSSsUAgqRqd3ey8v6OAzuYYeJ2F0ZBoKRR/XAGqrzo7JtO6klBzAjD
         i1MWJ9kxETVIkixUx8FQQHImRkIm9qY3PSK0J3T8de4FM7qNmwQCU657dJwhZ7LkTl4Y
         3/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hy1PRuFMC9Ce2a9cN4d8FhqZJnP42URBCgpnIQqeV8w=;
        b=u4f061H87aDsyJx5GQLA9TrUNcny7hPMK+Vn6dKIdnKYBJvIe42riqgzD2OBg5Fg2n
         gswgP1jTPooRv7x2e9XuDHCDP5Q8sbnUI/TWvN0n3ke56MCm76SWMs/oVnFr7ozauXUG
         6fKgNZbC7WD2sWD1XwcqlZz8+l4FHiV8fFNYOSQjQv/OKZzUYsPDM2esi3mw83ejOaAo
         9fO51GyIsUiLaUpXZI1I2mt+G/7XqG2VxZvtJYQoLAgiV7CeZxrlQqhKKNkUlBx3phaC
         cJK8jMe8tE+wbYkc6SLAnKtsYUY91jdZD9H1lzct57ccem8Ly4LhgOKsfZzuN9xNjfKf
         kUyw==
X-Gm-Message-State: AOAM531awdWJ2q1NvbF11HaCqWuRySpRoqU9Vtzr8yKfPeu+L5PNui38
        IW2lB0m2OEcKwXgcJIf9miAV8A==
X-Google-Smtp-Source: ABdhPJxtu24Ia2hL9Ce0dNrzZ5Z4HZ7RBd97CQJdFBRRdq5FIYEsqDkdRyAubR7kTtLy5M1jZp6x0A==
X-Received: by 2002:a54:4812:: with SMTP id j18mr216625oij.274.1643692844164;
        Mon, 31 Jan 2022 21:20:44 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:43 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     phone-devel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] Revert "arm64: dts: qcom: sm6125: Avoid using missing SM6125_VDDCX"
Date:   Mon, 31 Jan 2022 23:19:53 -0600
Message-Id: <164369277344.3095904.5938604292655738290.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211229220117.293542-1-marijn.suijten@somainline.org>
References: <20211229220117.293542-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 29 Dec 2021 23:01:17 +0100, Marijn Suijten wrote:
> This reverts commit c23f1b77358c173a25ef21303d2a8cc893e9ce22.
> 
> The SM6125_VDDCX constant was replaced with 0 temporarily as the header
> patch defining this constant resided in a different branch, creating an
> unwanted dependency of the dts branch on the drivers branch.
> Now (by the time this patch will be applied) that both branches have
> been merged upstream, it is safe to revert to the constant again.
> 
> [...]

Applied, thanks!

[1/1] Revert "arm64: dts: qcom: sm6125: Avoid using missing SM6125_VDDCX"
      commit: a90b8adfa2ddfd74944fa73be97fabe230f0046d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
