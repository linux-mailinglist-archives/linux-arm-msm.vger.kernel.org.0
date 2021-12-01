Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEA046511B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 16:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350754AbhLAPQh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 10:16:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349548AbhLAPQb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 10:16:31 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09013C061759
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 07:13:11 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso35620763otr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 07:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D1+0R902TIZ40cEYa53ZiH5kbl+Ha/QTOg3KK15dot8=;
        b=bZY/RmnA289yjK04t3Xi8Zo9fihsVsWZzDg128QcfdnW4GA0TrW+5W7c+rbJGsGjAD
         SZQkLxWGF/NRuNrMvG1WovST74Adncf82lLcY0iA4OHFayjQ/aJUUDPNYsWmPtQSuaGj
         TXS/9sY1gwdAd5ca5jD/4uhVd28is6hFtLzbylqrGm0YCsvjpttaldBjj84EKPS5uBPI
         riRq9ZLk0ROptuIRcko7wUZJGQylP1/5f6sOESasTR4ACqkhtHNQQ9i5y48VhXxrcRR6
         5/W0y1QXxdOGfhvL+AlUHA3gWpPPkkXnaZ6eincnLtv8B5EXuyjoQVOYebV2ozjNojyi
         WN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D1+0R902TIZ40cEYa53ZiH5kbl+Ha/QTOg3KK15dot8=;
        b=7rhxCbg/rDG+KjdbZ+c+papI5foIRiix+owmiCt735At1bfeyFNFDpb/z6zcpbrPG9
         lZcKtFlH05wTxx8r/xX9PoCbBlxpeo0EBh21/ZhDDlBlqrHBDUbOjv8MlQlWFGw5kZFs
         xcBpZpbCGS5HBB+ITBJuyBtVKfJTAJwCk1HO3y3HAUtwIITv8Lz+7go69cc/C3dg6J3E
         pYZ2Y0CU3NIGq8+iDHCYwaVPZh4SLLtJKc1ovGPdikhTotna7i3hFimm08GF85lDlZIx
         dzjS5khxrvt2eTOdbdK1HfcCSEjk+dYipj4P9PW4QcrHFPL8zWsIQWWj/EmYDkvG9GFy
         IWOg==
X-Gm-Message-State: AOAM533zTOdmJd9YniEfSugk5N077XJhIAysO0KTF7xXX7zY5GDAkzUo
        Qal8qCo9pnYyNYXDj9irZrUCBw==
X-Google-Smtp-Source: ABdhPJxH0tjinUHn3foyU0h/L1eW5lwSk2N+5IouVDx3MiYfjcxOMhtj2Dj+5NkyONEwemIzBsHDUA==
X-Received: by 2002:a9d:6a4e:: with SMTP id h14mr6247645otn.134.1638371590385;
        Wed, 01 Dec 2021 07:13:10 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id be12sm33933oib.50.2021.12.01.07.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 07:13:09 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: msm8916: fix MMC controller aliases
Date:   Wed,  1 Dec 2021 09:12:57 -0600
Message-Id: <163837153033.1905338.11453516055342866959.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201020559.1611890-1-dmitry.baryshkov@linaro.org>
References: <20211201020559.1611890-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 1 Dec 2021 05:05:59 +0300, Dmitry Baryshkov wrote:
> Change sdhcN aliases to mmcN to make them actually work. Currently the
> board uses non-standard aliases sdhcN, which do not work, resulting in
> mmc0 and mmc1 hosts randomly changing indices between boots.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916: fix MMC controller aliases
      commit: b0293c19d42f6d6951c2fab9a47fed50baf2c14d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
