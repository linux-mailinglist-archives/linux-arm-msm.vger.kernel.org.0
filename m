Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B987550A269
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 16:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389312AbiDUOaZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 10:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389309AbiDUOaU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 10:30:20 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB603ED39
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:27 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id 12so5753581oix.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Y+rGBJub4hUelqG6Wh/GRTU8FsHwDE9p9sZ9nEoVKQ=;
        b=i8Jw5blRNpNTEopLw35Y+TQC2A2+Nrm9Hwa8Jp4lGm9FN73TIJiwgUuEtHVw7BwA/k
         pdHr6K4ZAqp+eck+SqZkrX7w9Xkvmn//IUxnGY4NMunZRWKf9VmHwiDS9IrndGfJYGTV
         sEQUUT+ycI/iBAez7xuA1bR6uECYMdeKAty07R7HiTkUk4K7iBrWu2PCPVHt9thRYj14
         FxdmcqVlO0mWT0Fsey71UPB0083xxV+I8GI6dLygQmGXieIfXC7U5SPwA8wwFeqcnO1i
         MR9yBMVKD4xiCD+/mELhhSfilMNfQejDwP193E9Or1ZoNxWmSNhPFpHpCkfOuDYFx0pt
         1tHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Y+rGBJub4hUelqG6Wh/GRTU8FsHwDE9p9sZ9nEoVKQ=;
        b=o3A2SPpRXc6fmLJ3QY5weRCDXiNEjz8walkiOw/ETDEP+L+zFFdd8ECzHl/voOyTGg
         6kvZJHJz9fliOUjB7rKeNwNZtl07PW3oM4+VKrddSpPWQxBFczJq8BtYKm0OHnL/H915
         09MyRt4e/AaynKydIyj22jhKjvpgjrt0RolDmrnjTHZ4ylhmgx078npnj0FAQCxp0cyV
         Rcl7Aq8TnDmXA3wof77t/ASR13kKyQtN/duxwOKicdrTXTlxyDLINgvKrxCWOhftQf80
         8M071svo6cxtn/JFB2jSdVMDHxgUQ8HBhfg2SDZyDlME9xAcjl3wzKtcdB6g25gIcNBb
         V2Wg==
X-Gm-Message-State: AOAM5314NH5aoZ25SrVPk5JGBmWTueMTea6r3LjMTdxe5kS46L+XWPMu
        tzYIuN0LT9esb80KZpV+edOGqdbFVD83TJF6
X-Google-Smtp-Source: ABdhPJz+s/MnXFjAWX/wh2CCqvIrZgal3PVDIV6DOYifyt8dsIAkB6QhDTzoqVpGUZrI+GfQdsiTLA==
X-Received: by 2002:a05:6808:2189:b0:322:e874:e8f2 with SMTP id be9-20020a056808218900b00322e874e8f2mr3632255oib.289.1650551246360;
        Thu, 21 Apr 2022 07:27:26 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s14-20020a0568302a8e00b006054e841915sm4296295otu.73.2022.04.21.07.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 07:27:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH] soc: qcom: socinfo: Sort out 8974PRO names
Date:   Thu, 21 Apr 2022 09:27:02 -0500
Message-Id: <165055095990.2574292.14922414539179554766.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220415195449.617040-1-luca@z3ntu.xyz>
References: <20220415195449.617040-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Apr 2022 21:54:49 +0200, Luca Weiss wrote:
> MSM8974PRO is commonly used for referring to Snapdragon 801, compared to
> MSM8974 which is Snapdragon 800.
> 
> The Snapdragon 801 has three variants with different clock speeds, with
> the -AA, -AB and -AC suffix.
> 
> Adjust the names in socinfo to reflect this.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: socinfo: Sort out 8974PRO names
      commit: a555b382e7640b80b20816cf9179d091dd7716eb

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
