Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A224A4E14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 19:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350886AbiAaSYn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 13:24:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351739AbiAaSYl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 13:24:41 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F910C06173D
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:24:41 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id y23so28256225oia.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JYta55xSiekvR6ycRHJY9PhHDqdxVNRraCMuzUTrPrQ=;
        b=Fjf44gLrZq/EZVYX7+Yxr24O0sU3Rav8JqjIyhXvXU4td7PeJoHRuo/GibzsZbYOEV
         lcCCSNSofNGL/uKOemqPUhMng8o8uZ57f0giio/QDkynbXeOwocw3CyJDU4NG1444tFi
         PkF4bAlOhjPnKWraf7QZ0neeElb9Bg12Q3LgFmD6C7TkkUmPUvGjYsewRyADXmWhUHUW
         OpbxVeTeImdf03nu3Ip64Kw3nS5G+Tue58kb4qTNVX8jc2pgAEoNi/SDIjVms93OHf5n
         rc6Gna0YeBps9+tYjOYuc9EMJBIWR/Zgee/ijavevIlEFp4Ck8UkfBWCyKoVX2B8SyBA
         jT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JYta55xSiekvR6ycRHJY9PhHDqdxVNRraCMuzUTrPrQ=;
        b=VovLbbRhph1f9ySdGVbtHiN7gmAWAdmejW/8JAUDSaebfA+jVPWJ7uixxmd1KGQUkh
         xgkUb2hG/RFZM78MogjGkdx3oZihTDzw+gzn4sGVyFFUbr6Mk42t87p7zy6s9tmWm1sT
         FWH0D/9QnGkvvAVkNziTT6d/BY+CSl8s30On28YZsVbNDrdO6IDyb+xJ/sBlr6nluuj/
         tEtf25xO7dLUuwmFF5HsARbkZzeWqAMwb+zOWPyeI+YVXwjJGQ2ig348WjR7oyp5xGh5
         oySyp811QLdF8LjvqXC4PLz/MVMekFkxl2/T5xezwhx4x2tApktDRFEvheIaFHgGSeZT
         8RwQ==
X-Gm-Message-State: AOAM5329gS6OwiSR2pLqE0yKV/MsRsioJDsBM+ukqGGnEo2/2QEBXQNa
        PZKi+VRQ0w3RRvnbBmUfU5ZsTmR1sxJbGw==
X-Google-Smtp-Source: ABdhPJyTZL4uJGBKm4v5nPyAaNPk+s4KcWqFNWqLuykJ99q+ZYEIUaNNX2Du6hxKQyyC/MdKWBM2tQ==
X-Received: by 2002:aca:110f:: with SMTP id 15mr13668399oir.176.1643653480896;
        Mon, 31 Jan 2022 10:24:40 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id y19sm3273722oti.49.2022.01.31.10.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 10:24:40 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2] arm64: dts: sc7180: Add board regulators for MIPI camera trogdor boards
Date:   Mon, 31 Jan 2022 12:24:28 -0600
Message-Id: <164365345128.3009281.7629779063912351414.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216044529.733652-1-swboyd@chromium.org>
References: <20211216044529.733652-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Dec 2021 20:45:29 -0800, Stephen Boyd wrote:
> Some trogdor boards have on-board regulators for the MIPI camera
> components. Add nodes describing these regulators so boards with these
> supplies can consume them.
> 
> 

Applied, thanks!

[1/1] arm64: dts: sc7180: Add board regulators for MIPI camera trogdor boards
      commit: bb59462e414f8c0c55800064e9be4c596ae6898d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
