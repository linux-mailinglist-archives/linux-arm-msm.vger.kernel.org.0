Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26E64A9F21
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377580AbiBDSfj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:35:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377583AbiBDSfc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:35:32 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F8AC061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 10:35:32 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id s24so1845728oic.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 10:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m96YaMQTGjBl6hPvknyKwUDuoQ+EyqlAZy16yN0a1io=;
        b=BGSWoz/iEyR88bhTN9+03yLlQNu6fnKxt7fN4yOn5317DWTBwK+pKJttKCfyft94+v
         6uGri9tDw5N0Vb7hEf21pXwcL71Bjz0NCtbeb2UlAgG2MLEXb2e2G6bUQyqe/2Py691e
         E125Nkor761il+QHIqyfRpRYo08qcY59RhfL3KyOO1XWbOBek16t2+4eB3bq0bnz5OT/
         BlUmv4+erStNi8B49B5e9daC2RLXORdLG3UuHzxLAZtlGyVXSFFisNMvH4nydQ7HeU0h
         nd/UujjCpNq0yuyf0dCfDsggUVAcUND0V7aIi/5EizskuGVHBdxdHf38hvYCwkYjbqsr
         f70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m96YaMQTGjBl6hPvknyKwUDuoQ+EyqlAZy16yN0a1io=;
        b=e17S+aRuGqascij7VZ8NScfmHO9eFhtntKFChrnmBNizuXgT7dJA20dHCZY5oESZZc
         2Dh0cv8Nv+K/Rc9uWDAjqTwgEVPTrNPWurIZ9qDUI11R7PPRDqdP5yqvkuYVt/fCwbv3
         S6qaG+NklLCzZ6SqKJGfUpqJB/Y6L+TopdC4Tl0keRr2tGmJKTdRyvnhQjsXHEwHK0S4
         r7mh1dbRT1UQEn6cnDnbaOoT1m0gDuIobDanaBeJFs/MdWaXUh894FcOpSEnHMoZT4KQ
         KQQUrpuUdZC30AEBtdouNKGIUIoRiKOT9LxALGZXhJyOLyW2sXqg7GWk0djW3Y9cqvuw
         94Ow==
X-Gm-Message-State: AOAM533d0iN5lSWfhJKp1/bLgtzn86TbSU8FNrqV2R2QyyH5ErAOPT7D
        vDkEF35Ra1vuhvXzr0nPqQvEkSrioo+k8w==
X-Google-Smtp-Source: ABdhPJwIQj++T2UUwmut4NbK6dfIWMrm6kOxD67KOvm3kgR7WvafrmSe8PZ8nv3u3h52L4xp705F4g==
X-Received: by 2002:a05:6808:1784:: with SMTP id bg4mr2000994oib.286.1643999732128;
        Fri, 04 Feb 2022 10:35:32 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id 100sm1044182oth.75.2022.02.04.10.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:35:31 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     agross@kernel.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: rpmpd: Check for null return of devm_kcalloc
Date:   Fri,  4 Feb 2022 12:35:20 -0600
Message-Id: <164399969245.3386915.12317625487296679107.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211231094419.1941054-1-jiasheng@iscas.ac.cn>
References: <20211231094419.1941054-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 31 Dec 2021 17:44:19 +0800, Jiasheng Jiang wrote:
> Because of the possible failure of the allocation, data->domains might
> be NULL pointer and will cause the dereference of the NULL pointer
> later.
> Therefore, it might be better to check it and directly return -ENOMEM
> without releasing data manually if fails, because the comment of the
> devm_kmalloc() says "Memory allocated with this function is
> automatically freed on driver detach.".
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: rpmpd: Check for null return of devm_kcalloc
      commit: 5a811126d38f9767a20cc271b34db7c8efc5a46c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
