Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972124A5689
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232378AbiBAFVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbiBAFUt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:49 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5779C061793
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:46 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id r27so9034297oiw.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=da8YQeeEzM85epFJbxLZ9A8dOCgmesBG76FyZIs7Fiw=;
        b=dMHADWVheo23L7U/P8K13aF1dredBBnFDl6eU+lB3DZvOwHTKKosKFERdPaBz68krD
         ftGbMtLeXQSxYZ++RJhXwUF8sbedgRE6DggJD2bDCYsasBp9y/sOQQ3Z4XMrEHpNfMwn
         VG9mWsV63L/zPiC3jXlh1SCRbBZzG+XKvppS9DgCiV1xLknXpZubwGRioe43ZzkNsQ0H
         T9herT4pmW4AAdeW1KS1No84PhswkLTd1PwGiRBSKEg/v+O/1UgvX7B+YE3DpFWQiv34
         KAAbK9gIedO3uhJqlXbd9JuBfGMsFcUbr7gN77iQ4mvmrivfkwzjuJKyxvkgGNJ/EvQ2
         /JHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=da8YQeeEzM85epFJbxLZ9A8dOCgmesBG76FyZIs7Fiw=;
        b=y5+/cXnPFlDNemVgKnHTNGlbhTiFT5Y+PAImoy/Jy6wcKcWptrn7AIQzzHEm9e24om
         SsE3gJekU1f+a4JECdmd+09C2xDbcEJ7mwEnmgyGBaY0OMNqorktQKUt60EAd9kbo17C
         OMbyZJOCAWOP5QBZ5nz+sEyPaTYwyd+lmOYPvXudkpOgjC0iCdz8WABhNO4cMjU6l2Mn
         bdAnclxs512Ydq6cx8P+43PwGDBtc8samaonzX8H+TMW6aIcimGTaVDtAT8XQcGMDB22
         3vnOoM4u9wMpBWbWHcmHNls7xnvZduo3qm4GoeyFnYuchT6g/XZ8C8XkACU3nFGQi1nI
         TGXg==
X-Gm-Message-State: AOAM530UutGxRjOj6IJke+tG7nr/f4koeEJV0MyiSnn5kx+Yz1KVT5kx
        aBHLaCvkCogKGBJ+qMiccZG0KhRoAYR6TQ==
X-Google-Smtp-Source: ABdhPJxDxxPOaEeou5SbHsg8ZyGk+qOM6pAop9BId+BMgt7/Ov+J71soaX6TtCChLklmCEg8Bpkuxw==
X-Received: by 2002:a54:408e:: with SMTP id i14mr233020oii.200.1643692845848;
        Mon, 31 Jan 2022 21:20:45 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:45 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Petr Vorel <petr.vorel@gmail.com>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Julian Ribbeck <julian.ribbeck@gmx.de>
Subject: Re: (subset) [PATCH 1/1] arm64: dts: qcom: msm8916-j5: Fix typo
Date:   Mon, 31 Jan 2022 23:19:55 -0600
Message-Id: <164369277344.3095904.2720686066964442392.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211231213635.116324-1-petr.vorel@gmail.com>
References: <20211231213635.116324-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 31 Dec 2021 22:36:35 +0100, Petr Vorel wrote:
> Fixes: bd943653b10d ("arm64: dts: qcom: Add device tree for Samsung J5 2015 (samsung-j5)")
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-j5: Fix typo
      commit: 1f87900493845c0a0d731496150e915649209f1c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
