Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562504765E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbhLOW26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbhLOW17 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:27:59 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C32C06175D
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:27:58 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id n66so33684710oia.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UC5FFFIEaBIcd+if/NsLlcrGmZyHpY0pwIoSIAZRAVw=;
        b=X4lKGKCm+rdrvOSy39APcDmLo4IH/i6MV/Gatz3eBdNQsr7zVenJ4TaKTwIHKZNkqY
         fEgQ0zsqjs+PVI1kDwnleMn3IRIXSEDYLQ5SyGYztcdBAcBeiXEE3jc25uDSZ2XoT/jw
         dpieoqzBNSqsMciO60X/e5Nezqns5w1U/Y0EuHAmHrvXAhop6+bMNGWeAm/aPsZowV/G
         u+FqLporbZFxHFvf+1w5Ea1yRzeM5RJR8cNdiPWRtpi8vaNzQBGDK4dvOG0bU7gS4JCM
         Vk6iNgVaJl2hGGnwghPcltk7A/wzni9ECxSqMjsiKBZMUcWj+HmmAU3h5o2g7Qn2Gj0g
         11UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UC5FFFIEaBIcd+if/NsLlcrGmZyHpY0pwIoSIAZRAVw=;
        b=svQJJEdChLVEe+hrkl9ZcBfAiztapY0uXULDA9l0+HKje2U/Uq0SQp8MsczI3HyW+p
         qh6tuKLiXOCQM3fwmzGif6QIe0y9g3JJIcOtL8EEoKfQIL/Akep7m1boyngQowFqnKrz
         QYTVxHPF4IjzSAUCPV0CHJ9gnjHPthqvncdYir/gyUzHb706fk7PvjhSYbSkutycJOBj
         W8xtu4pKMBTeXJrSIPeN/9VMElxp0bj2TRT6jfx9x4Lm0ELReGzT0OSL1stdm/QCvbzY
         ZddI1QeakePJy2zUa6e4Ishvq9wfnn9u78kONiCa79ybhYs2Cam/e9x7UkTRubht7bo4
         Nn/Q==
X-Gm-Message-State: AOAM531KDpVNLh0mY3DkFTbC/LUOfoeI9z57w+sCBLtabMYI4bpoJGiv
        zERQDg40KQ9C6LmrQ5igLPO/7Q==
X-Google-Smtp-Source: ABdhPJzTU2VpkLAjgTbI1X/iOh81NlsmJ4bBQWhK/AZv7UEvOiDnZKGQP/dyhmnPT+TdEDeardcpDg==
X-Received: by 2002:a05:6808:211f:: with SMTP id r31mr1895634oiw.64.1639607278198;
        Wed, 15 Dec 2021 14:27:58 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:57 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <quic_rjendra@quicinc.com>, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] soc: qcom: rpmhpd: Cleanups and mx/cx fixup for sc7280
Date:   Wed, 15 Dec 2021 16:27:30 -0600
Message-Id: <163960723734.3062250.17358735565446311094.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1638871712-18636-1-git-send-email-quic_rjendra@quicinc.com>
References: <1638871712-18636-1-git-send-email-quic_rjendra@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 7 Dec 2021 15:38:29 +0530, Rajendra Nayak wrote:
> v2:
> * Fixed the wrong assumption in v1 that only sdm845 needed mx to be
> parent of cx, turned out all existing upstream SoCs need it except sc7280
> * Added another cleanup patch to sort power-domain defines and lists in
> alphabetical order as suggested by Matthias
> 
> Mostly cleanups, with a fixup to remove the parent/child relationship
> across mx/cx for sc7280 SoC.
> 
> [...]

Applied, thanks!

[1/3] soc: qcom: rpmhpd: Rename rpmhpd struct names
      commit: 8f3d4dd65abd03a5edcf7b5d5a7a3e2a4866db15
[2/3] soc: qcom: rpmhpd: Remove mx/cx relationship on sc7280
      commit: 65e7b31cc48581e32bee4546b59cea404252a138
[3/3] soc: qcom: rpmhpd: Sort power-domain definitions and lists
      commit: 8beb290d17f280f690857897af11dc90ac2e1f3d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
