Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0232F4A4E0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 19:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351010AbiAaSYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 13:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350686AbiAaSYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 13:24:39 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A37C06173D
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:24:39 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id e81so28343070oia.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DMU9AZ9IHe9vHLy7t44zKNg+xudXJC08v+EXB0Qau88=;
        b=eE3owyETd86rhiBoFQjfQCbd3zoTyOn7J7I7j1tKYVNaybZKuI+UYZX5/rrH5IkNbn
         qPD2IHMEzaWJYo1c021WfPL23XeASt8IK96uh5ZmHK5/Vj/pqZKu6Df6IkRYF5upCWlg
         ZkzT8Qgs9dv7S6deVCH5YPSH1yIxG1/OUYu1bY1DTiHcS12IiWKHLkIDFU66V2pPO7N4
         tGBFXcUF8mxqa4xiIePkiADB8nkstet9ECvfZxsnGMfkU+Bci+rkMNbP6vLUUDIguoNX
         DSeJ6hXDm9kPwj3lyJEAoJNxhIjcdjWR1rCQK2YkH122o3j3uSZMr6gIbjCQOhIW9GM+
         hVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DMU9AZ9IHe9vHLy7t44zKNg+xudXJC08v+EXB0Qau88=;
        b=QoejTlKeU2XMbm7dZrpXoqoJH9sbcH87akRT7anQLsMgwnxlw6rYcPjwcyXStEom0Q
         9IiIGlCLudFb5OFtFxMMeCN4dFvL3WrhYS1nlm9hCwmMre3ghnbwlilZjpNdr4cgsrIt
         oqyZmmw6h8bvkzzuwhBp/rBCVoFjQSPOFuQWtKLmCJWDs9TbdCP3C58e8NWvdNip/pry
         iIv2XKUryX8DZgcUPfIbBMJWpisaQy4jHqP2tKE6Hp4rlq1yagz1LCQNMdrWNxw9udrp
         mDyUjGS9n1ZlSbYscVOkcfMY+DRKmaYMIkfzGP/fZCuGTbEBb7q3HSspVSWIeujTSUS2
         EbQw==
X-Gm-Message-State: AOAM533eVqzkVOQTR1Gs62a6PMRe9rtreb13sSbPThQ4zRCXMAmtoDsm
        AYSylutW0NoNHocISBxFUuv1uA==
X-Google-Smtp-Source: ABdhPJxt0KJaiklBho/V1Ui+XsEAZA5Z3/ybA635AsaKfaB6rAOtODj3zteALDtbdIVqTZwrEtYSGA==
X-Received: by 2002:a05:6808:1247:: with SMTP id o7mr17349933oiv.75.1643653478569;
        Mon, 31 Jan 2022 10:24:38 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id y19sm3273722oti.49.2022.01.31.10.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 10:24:37 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org
Cc:     quic_khsieh@quicinc.com, quic_kalyant@quicinc.com,
        quic_abhinavk@quicinc.com, Kuogee Hsieh <khsieh@codeaurora.org>,
        quic_mkrishn@quicinc.com, swboyd@chromium.org, robdclark@gmail.com,
        seanpaul@chromium.org, dianders@chromium.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: sc7280: Add Display Port node
Date:   Mon, 31 Jan 2022 12:24:26 -0600
Message-Id: <164365345128.3009281.16859131025980734527.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1637580555-1079-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1637580555-1079-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 22 Nov 2021 16:59:15 +0530, Sankeerth Billakanti wrote:
> From: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> 

Applied, thanks!

[4/4] arm64: dts: qcom: sc7280: Add Display Port node
      commit: fc6b1225d20de0298a7b0e52eb3843d71e1992e8

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
