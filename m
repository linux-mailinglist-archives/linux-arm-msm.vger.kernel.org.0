Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79773458136
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 00:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238041AbhKTX7Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 18:59:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237885AbhKTX7D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 18:59:03 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0BDAC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:59 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso2201903ota.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yPicKk0d26D9VjEuI3cFOviTVJwZiIF12RGQRcjWAGc=;
        b=O2IXaewBhlu5UiccjeNbdPoCs83XcbspZBPbu3KaznspzLgjKsMNObNpc7kvT9kwje
         nBMJMRrpKqu76CL4nuq7aouDoOrJI/OBzJUYEDQ9luwXOiiStQQt7tx8T5zsidUiAh9C
         o/aFo0wPNAlOQ4WeS+IGKcLWSyhQIB2RoBnu0UoM+l4QC6hcjYnQjfptpMCFV+rK/JHy
         BFSZrOE+FZ+/z9rWq8JKJNKhjzBBs1j3G1UkYgzDjflHXgbA/1Pwxg/PfpSyk+3SWmrp
         pui8IYAF2sV0bFN4NNP99LnTEaF68Dxxb4hS8gNSR5nqK2Fic3tT8evVi6elAKxuri/a
         BefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yPicKk0d26D9VjEuI3cFOviTVJwZiIF12RGQRcjWAGc=;
        b=pYFPPhlIiI/yi6J2mLTAnnD38jYSLIt90Q9yPsfjwWsEBe1HUaB6VtNrwpgLCNLJ6W
         UaEPiHjkNVo3PS2Hg7kBRHLOeLycofi0kMc1N4Z0/nYT00UBqUteZwbDViZdkr5VPK+6
         vHryhQpWg+Z98UvbOhh4Jmk7MILlbfWc9BqxhoOG3q2e5V+Zi/E/CLnwju4Evf+Mh66R
         u5XesXAZJEK54gz+wizUFKX4g/TU8PPN10hNoxhrwn/okNuuLY0OyxR7qxwbZkEFoAuL
         u/WOOiykHBZarZt03M4YiTfYa6S3QlZ4g4sakF641nYJWhJDJFnn/VFUoa9EkhrUBtY5
         RJrQ==
X-Gm-Message-State: AOAM531ne3XMVW+M4KEzpY5xCIs+aExSNDqazad29m0Lp36ZrZnOrxJv
        g4J/OsPd25K19B/Ezoe9zrjsAw==
X-Google-Smtp-Source: ABdhPJypA9s0Pq0mrRn35r28pb9hIIGFj8h+OVONqaqHHFBcvs5+KKnp2K6707/3j+wzQreoPiNo8g==
X-Received: by 2002:a9d:2486:: with SMTP id z6mr14877086ota.210.1637452559309;
        Sat, 20 Nov 2021 15:55:59 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm828474otj.14.2021.11.20.15.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 15:55:58 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jason Wang <wangborong@cdjrlc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: qmi: Fix a typo in a comment
Date:   Sat, 20 Nov 2021 17:55:35 -0600
Message-Id: <163745250541.1078332.6247097724847181032.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211113055358.206533-1-wangborong@cdjrlc.com>
References: <20211113055358.206533-1-wangborong@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 13 Nov 2021 13:53:58 +0800, Jason Wang wrote:
> The double word `client' in a comment is repeated, thus one of
> them should be removed.
> 
> 

Applied, thanks!

[1/1] soc: qcom: qmi: Fix a typo in a comment
      commit: bd9ccaec6ac998196baa11380ad4651a7df62ef0

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
