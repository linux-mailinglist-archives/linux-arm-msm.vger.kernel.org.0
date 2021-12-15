Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12184765D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbhLOW2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:28:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbhLOW2L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:28:11 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E07C06118F
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:08 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso26661478otj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jT4a+xEhIK+SVAkBmdeCICawKg4FNoRvYcNXbWrlWNc=;
        b=Hc5/fDs4WRE4QmhZqB4/bFEqCnNTQkbEj2u9x4T6p2xlyWopfm8NqP8EsHEYuNF+JV
         LUD4HQMVRL3Oi95SdU0xn1sfxzzEPEdAkXlcU3gek/wUkaO46Wicdsk0l8iaebwda0UL
         h/UTw+jDFkc7wWsigbTqoAEow1qx8KBmmJ9L6Aobo2AiW2UV1bSHvylAE6becG/JwO9C
         M5n6kccexw0Z+33zxZV3B3KD81Bq1w1RlEi0V7BYtFDM8e5skJWbrtT31WVKYUGKi3Q8
         2ySLmTvQ3AnprjhfpHEryTf78giV6tySR06FDgAvNtGreNnhxnbY3KfbXrz5AvTcISuU
         MztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jT4a+xEhIK+SVAkBmdeCICawKg4FNoRvYcNXbWrlWNc=;
        b=bgzHRqxiEI/26BBJiCqwB+c8ItCyFT+1IV6jrCYyyFj9WSsNGS3oOuaaO6xkppFfY4
         OvAAT8fSUhNm8V2QH5X0ZZ/eH/afMGa4tsiQeVdwsM9X8HORVCFBy8hcEf3Xy4pul1fK
         d8uzFyHNkBC9Ak7yNh08ql71IxbUePDLALvKsESp0ChqyXCAI1OSC3Bh4lBxLmYM3upa
         tGzWf1zWXP9t+/TGekOofjgJ2wYRFYhCZtUSzcZ3AhTAu6wifMZ7oJkrNs4FWC9Tn2tY
         hrzf+ZnqN6DmVI318KVnkd8faWz5bDN32ZdD6NjWffMmtn8JB1Xrjcc2iYZKvQ7loEvq
         kWWw==
X-Gm-Message-State: AOAM531AWXvfdSV5wORGrfD6atVwikHS+DTS2Na0pIYp/Nxd0ZLuCO3e
        C4lOHrqgxgPLY1gj6l/k09ggRatNC0O7cQ==
X-Google-Smtp-Source: ABdhPJyj7hr2nIOKDGVEPflX6oa9DhTDQBWoBdlSnXRKjmat/ygobjRbdzcjKqxvDI9f19+p2efppw==
X-Received: by 2002:a05:6830:1358:: with SMTP id r24mr10762267otq.8.1639607288210;
        Wed, 15 Dec 2021 14:28:08 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:28:07 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jason Wang <wangborong@cdjrlc.com>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: rpmh-rsc: Fix typo in a comment
Date:   Wed, 15 Dec 2021 16:27:41 -0600
Message-Id: <163960723734.3062250.6877130242356070905.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211211090626.248801-1-wangborong@cdjrlc.com>
References: <20211211090626.248801-1-wangborong@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 11 Dec 2021 17:06:26 +0800, Jason Wang wrote:
> The double `for' in the comment in line 694 is repeated. Remove one
> of them from the comment.
> 
> 

Applied, thanks!

[1/1] soc: qcom: rpmh-rsc: Fix typo in a comment
      commit: 73efacc6bd1d58e9b318f4861072501d97ebf7c4

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
