Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C766458118
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 00:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237862AbhKTX7D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 18:59:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237797AbhKTX66 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 18:58:58 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE905C061748
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:54 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so22723573otk.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8hKM6Vb2bmJvC0MfZh97W4lzDqklqLa6H+im7OWinkY=;
        b=VfY5LWFbKW1QNCPnrML4BSBp4jT8y9UOOEHK7KONJA0DkIPS2ueEgZn/MMlvnBSE6h
         0B/+6VWL1o2RA7eAq+0O4PmPGbSg63zzvgAN24W/ItSrRcu5C21JQwwHIcdKwYM7Xl0w
         h/QqfeJQP9oCndxt+oM8pr5KpvVgfw4ab+GYUQEYpb89ydWnINDrSYlQ1xPZkP06bMum
         jivu9GvT0NL6S9Vxqnfqk8+PCg6WLR+ynMy/zNl8eN11NmpIwbVbT2QTrMOTfSeYiVwd
         aX+aMiUZ0q1yebJtmoXS18d86hRtziwCloMuQ9rVoW4fRO+jW1cVJmZ8Vt2qzWk6cQnO
         6UAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8hKM6Vb2bmJvC0MfZh97W4lzDqklqLa6H+im7OWinkY=;
        b=USy+TjAhrrmPYUaajkxNI3y7h4YgbCZgKJ/tLzbHtqMS6pwowkUkMXHoB+tJ928FGx
         1viTIJYcPV0lRjQjoxK0L3lGCEzuDLDNX7qRlAovf/XNNhclTv+LwKoInkgS9WJchcQ2
         g5WyIuFLXghqfFHR05tFCx7f1v/kzrkK65WbNE668iPwEj3Z2jTCOmC3DrQRGlukrAU1
         32XD3bNQlmNDrqaO8b3fM1SrncBhY/g0XDzPBjFFrfHKUK6JyJeUc+eOyA5Cwfh/gXJe
         2+6rqIxkJrWbq8B1AMzYynPH91+T+A6qkZyjms2NyUqDZnIyIY6BsRmlMpXu1ToVLYfg
         39sA==
X-Gm-Message-State: AOAM5313ELqcuL6M2TPg0f/g3VbSg1We6cT4Y8q+7vKtBCGnYp5wh5IQ
        XYidwHLVSeZ3h2FFMAu/qtffbw==
X-Google-Smtp-Source: ABdhPJyar5Yxc4omNy+AqlQ6sg8tNEbwMNnQmxmpiNZmGi+YAsI/0P9COQ2CIec59trQ/mw74dx7UA==
X-Received: by 2002:a9d:63cd:: with SMTP id e13mr14318562otl.351.1637452552779;
        Sat, 20 Nov 2021 15:55:52 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm828474otj.14.2021.11.20.15.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 15:55:52 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH 0/3] Add QCM2290 RPM power domain support
Date:   Sat, 20 Nov 2021 17:55:29 -0600
Message-Id: <163745250542.1078332.7687819142361245824.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211108134442.30051-1-shawn.guo@linaro.org>
References: <20211108134442.30051-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 8 Nov 2021 21:44:39 +0800, Shawn Guo wrote:
> The first patch is a separate cleanup, and the rest two add RPM power
> domain support for QCM2290.
> 
> Shawn Guo (3):
>   soc: qcom: rpmpd: Drop unused res_name from struct rpmpd
>   dt-bindings: power: rpmpd: Add QCM2290 support
>   soc: qcom: rpmpd: Add QCM2290 support
> 
> [...]

Applied, thanks!

[1/3] soc: qcom: rpmpd: Drop unused res_name from struct rpmpd
      commit: 7ba9dd0d04a8af868bc0785d79bde4ac0240328f
[2/3] dt-bindings: power: rpmpd: Add QCM2290 support
      commit: 2475fcfbe4e383d586c5a58711e436d83a2bdfe6
[3/3] soc: qcom: rpmpd: Add QCM2290 support
      commit: 1cd3921aa95ebf4a6d1f93fb736449441c530aa1

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
