Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4AD430A25
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 17:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344011AbhJQPdl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 11:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344043AbhJQPdj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 11:33:39 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0872C061765
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:29 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id n15-20020a4ad12f000000b002b6e3e5fd5dso897415oor.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tohhq9GjBIRiFZisCAGul8f6GOaUHV/TWcCmlpYmUvo=;
        b=pkGK1VT4q955FxLsrhUjurQISed4nnE8blaV+mES2eAK26E/bgQd1F3BYZhb6TIzWo
         O+/e+i2iI2GmKcX+56zucyKxOTQfIyrNwaa5JdTPtBD46na6DInqGSl9COzgsInVARlX
         bGnN7EoQbwECIy/0t+5P0D5qsKfG6Pltg9eHSrzGw48lhFXSrvMNNkZIjg1LuzSKGTIK
         lS8+Zq8V1DXon5NGlLH/PTs6cpJbnhl4uQi1xwZ14fmbQgW+lxC1CWgJP4NlhDkZHnNV
         ysrHT33Xe4XLZ4jj+aifvjNG62vXPVHCNxouCdF/3gQY8B5XfyAFR1gvSXDAsOFUVdXo
         E6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tohhq9GjBIRiFZisCAGul8f6GOaUHV/TWcCmlpYmUvo=;
        b=MMGG+H53U2UoY77fLq9rQ7iYyA51RMdm/WuK4LkUK+PhrhS3dAvlJkQ1ZABr79IkUV
         cexduCN5wPVzVp6aagCa07rKQWRkOEgG7s2QK9mA+uAWNoSIsazSUpU5dZ8aggwxXJ65
         ktWZobMpesSp/1pfzIu9iHcVMTVTR8Z+CvAoXQH1lZs76DJGrU/Swp2JPjv9xla89e60
         HQm4D1Ywwn7fHN7oFLjIqjwGnu6MObqTZQFiUaCiIAAmKYbrcHeINuLjNZqwvgZmAlH7
         uOE9RP9N8cmIm8bqsYfVeNjXNWzNdFXJhhkLdI8FkHA6pFFKVP+jAeq7nE/dE8dhRt+n
         bWEw==
X-Gm-Message-State: AOAM532R/V5vZ6vnlo5kEV7ZAVi+YUgHezkX7keMQNfqsNkU6apkFzqK
        VUHN0bdFosPysDrZa0yidA5pTA==
X-Google-Smtp-Source: ABdhPJyUaUWDL3YryqrFgK/YXCTjKSmKfIYQYchEQqNVclxd744cCBvqihawoBLSD6wDppe7QH7dOA==
X-Received: by 2002:a4a:e867:: with SMTP id m7mr17509766oom.5.1634484689112;
        Sun, 17 Oct 2021 08:31:29 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id x6sm2565698otp.49.2021.10.17.08.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 08:31:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH] arm64: defconfig: Enable QTI SC7280 pinctrl, gcc and interconnect
Date:   Sun, 17 Oct 2021 10:31:15 -0500
Message-Id: <163448466184.410927.13522565174969979342.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211007052812.3717-1-quic_saipraka@quicinc.com>
References: <20211007052812.3717-1-quic_saipraka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Oct 2021 10:58:12 +0530, Sai Prakash Ranjan wrote:
> Enable the QTI SC7280 pinctrl, gcc and interconnect drivers required
> for kernel to boot to console.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable QTI SC7280 pinctrl, gcc and interconnect
      commit: 88800cb25484ed6626a35e9019ea78d71aca09f2

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
