Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D531447301A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 16:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239833AbhLMPHQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 10:07:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232760AbhLMPHP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 10:07:15 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C0EC061748
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 07:07:15 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id p13so15201084pfw.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 07:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wmuKU/yN3EGitfvXJk13tFIWVK/CDHyZIX1jbSDni5c=;
        b=Wyf7pQ5tM2bSl793eOKIJambJoHqd6b4vqFrOm38l+0hoGoEuC+dGzCaO17DzxicuG
         U7+3vdNWRTjZwLwlTRzalAUkklsdXKVYZQ8RBR6HckYZYGmrtMWrOCtlwdfxaEOhIa0m
         BYWZi2Vc6VpIWwhknQRwP+tcYSuWooPXFVo5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wmuKU/yN3EGitfvXJk13tFIWVK/CDHyZIX1jbSDni5c=;
        b=HBtH9rdxMEbfPvANY86fkVOkQZlaEkDtc91emgTdfYa9C2LeEXK9NTKFHktZmJm/6h
         uk7KQOapMNt8680HeVpLQCdZItRwMyKrLbvS1ZVuYUM2agsBWsJttUFS1Tt1PcJS9Gmc
         ra3YXzfVlutwfDHbpGHuHx0p48MIpjPpzDwVNL2A8MvZJaMvutCYT1isJk8zlfJNDVuO
         Ojbzf8kcxoeq4/ELdBwYAFNSSDX5z/SXN8SCv9yTrgbou7FHDWolOrHDZ7sdanPyBAZi
         LboU8Jp7BurpfCnXyDObquF4HIdopIKCA0s1vnQ44Y9Y1keHXj5I+fMxUSfE+fASsWTI
         gUhQ==
X-Gm-Message-State: AOAM531zj2ZQ29Prnede8NQXmEzy1XfUJChV1VC54LNcBcQmTJCWDe0N
        tpmFeePiYHuf2ZsJULL2o6ULgg==
X-Google-Smtp-Source: ABdhPJwJzjkTGVQC+Anjfc+ZBv4CymnaW1VG7s5Ay3avO0gZJy0il2SCP3V7uulVVkwcuf6gP0/c7g==
X-Received: by 2002:a63:110d:: with SMTP id g13mr32658100pgl.315.1639408034904;
        Mon, 13 Dec 2021 07:07:14 -0800 (PST)
Received: from localhost ([2620:15c:202:201:f4ab:25c3:a317:92ed])
        by smtp.gmail.com with UTF8SMTPSA id j7sm13235054pfu.164.2021.12.13.07.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 07:07:14 -0800 (PST)
Date:   Mon, 13 Dec 2021 07:07:11 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Panicker Harish <quic_pharish@quicinc.com>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        quic_hemantg@quicinc.com, linux-arm-msm@vger.kernel.org,
        quic_bgodavar@quicinc.com, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org,
        mcchou@chromium.org, quic_saluvala@quicinc.com
Subject: Re: [PATCH v2] Bluetooth: hci_qca: Stop IBS timer during BT OFF
Message-ID: <Ybdhn8mPrPBp397r@google.com>
References: <1639373496-28009-1-git-send-email-quic_pharish@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1639373496-28009-1-git-send-email-quic_pharish@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 13, 2021 at 11:01:36AM +0530, Panicker Harish wrote:
> This change stops IBS timers during BT OFF.

nit: avoid thing like 'this patch ...' in commit messages, you could just
say 'Stop IBS timers while Bluetooth is off.

> Signed-off-by: Panicker Harish <quic_pharish@quicinc.com>

Looks like this should have a ´Fixes' tag to make sure it lands in the
relevant -stable trees. Commit 3e4be65eb82c ("Bluetooth: hci_qca: Add
poweroff support during hci down for wcn3990") would probably be a
suitable commit for that.
