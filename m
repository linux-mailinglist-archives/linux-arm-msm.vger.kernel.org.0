Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFA04A9F1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377605AbiBDSff (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:35:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377561AbiBDSf3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:35:29 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39C0C06173D
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 10:35:29 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id x193so9632794oix.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 10:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GcRZeQ99qb1wZfceonxS2NTxklVg8F9EyAwb11MTjq8=;
        b=xD3iTrdf09/O6Fs5FD+xhQPhiMvx4SMkyuJyCmcqBWUTs5mTHhHmfflZ3R2TN0jrBH
         hmf5hgNKgRUM5LVoTaaZjLmPjAS8IQ7Neasqovo67jKkMcpzhdNDkvbfOk2Zoj6grfaF
         +sMsU/cllO01gR5pDDKKLarL9BO6OFpoKvRdf51AONCcyVu5qVoq6xgu7jfj18N/rtkC
         VDeAlZ4HVroALVoVoNhdR4iyR5cC9UaFRl7szfAEhezCWZs2FXq1bT34f0dFZUJrIKd4
         zsiGm0E892SyrmRzXIqdWkbJvicwj2N94ABqkll6AeGe99wvduF1krh5SFKos5ICODBX
         fQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GcRZeQ99qb1wZfceonxS2NTxklVg8F9EyAwb11MTjq8=;
        b=Yi3SL4XXK9N92zV/BEM8F6wwO2n2sPoAHT6c21HJPnfz5ph6T+CagoKRAJ+D87hbWb
         u3hAy9wc7Kvc+MfLoMKwtoStreQYSVNAk8urrLnzJgSHe9Jz5F4j7GP/GNdkGYkCQ5/n
         G1d17N41gbQw5JbE4CEKg5Fs7Qlc1+pMEVkkExQAMaCiXcDcr0FsmU48lUoWlQRgH8tr
         xb10jWkgZCkx/royPnpOMqLWY95pVY5nsRrnRmGF9a1qKgZjr53IBPuR0mY63SzZOtPu
         YQ/L6vuh4I5eDCDJ/GO5GlkkWqUHs3HhqYIzrklomHyrV2zHLnD+4h7T3sxMGhW6cwVZ
         j6Ug==
X-Gm-Message-State: AOAM532HZfrnrD7ums4PuNCwc3VhzztKDo24sdQhpEgJgniI++dVob5n
        k9HTk62groB8yB75I7PQ7xvwPQ==
X-Google-Smtp-Source: ABdhPJz6fAoVlt+kGQFxh6TsKG1QNJKDlqC9NGS203vJwU76Ic9vUqcvluW713sVfAjxH7KgUCxRxQ==
X-Received: by 2002:a05:6808:1686:: with SMTP id bb6mr144724oib.223.1643999729209;
        Fri, 04 Feb 2022 10:35:29 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id 100sm1044182oth.75.2022.02.04.10.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:35:28 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     agross@kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     kernel-janitors@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: llcc: Use devm_bitmap_zalloc() when applicable
Date:   Fri,  4 Feb 2022 12:35:17 -0600
Message-Id: <164399969245.3386915.8909000156022606342.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <3ee83f75afa8754fade4fff6a03b57f0ae3ccc28.1640245993.git.christophe.jaillet@wanadoo.fr>
References: <3ee83f75afa8754fade4fff6a03b57f0ae3ccc28.1640245993.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Dec 2021 08:54:41 +0100, Christophe JAILLET wrote:
> 'drv_data->bitmap' is a bitmap. So use 'devm_bitmap_zalloc()' to simplify
> code, improve the semantic.
> 
> This also fixes a spurious indentation.
> 
> 

Applied, thanks!

[1/1] soc: qcom: llcc: Use devm_bitmap_zalloc() when applicable
      commit: a9ff0638a4063e6b8a0aa38e9995826565f3d529

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
