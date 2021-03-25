Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20140349C84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 23:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhCYWp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 18:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbhCYWpR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 18:45:17 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C95C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 15:45:16 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 32so3302880pgm.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 15:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=VMyKGjGyj46nbdhs/UZ8z5VoMJ0oovjO8UmdWh06+lk=;
        b=LWUncF3fqwOFUH4uL6SUTPUYqcrvaAwFURO/si3FNHMdF+0Jz5ty/h9wXvT8nbBzCy
         SuQNM2Wavlkj/ByhLxeUv9FiySmhq5ntfLdacQbXP9nJ6jrzvV8ZsC20zM6t/C7rsZPy
         eyKRleX8nKIJDjMhzMPFO69fUOOjPhU+2RwQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=VMyKGjGyj46nbdhs/UZ8z5VoMJ0oovjO8UmdWh06+lk=;
        b=q47pEaPpfSgRE8XIDWPB7qy/Ugria5G1toqu+nELXJbWcgCgcxZ/tTUSPtgkgZAmco
         wq7KHEN2wAja0wPDT86LUDNQEbYKcPDH7sQ6C2vsrZC3MHJZkD/W6A8HD9plwp+2l0cM
         67AzglZx2Ika0OzoaKp2OJqnttABUKHnYR0Tfng+Z3oCPiJZ3TXZcDgccJeCB1ccLmIZ
         bLD/FV+gsmGdfxCiGOtdoIy3Nm3rCkjgRgGn1bBzX96tl4W72zDdJ+QT4J9zkyokthZL
         26EMINXw0W3R99vxLt5xhFqMrzzhv36J1CBtBaMCyhdFPKhp1kThUkuwQHnSexiMqLNE
         CwHA==
X-Gm-Message-State: AOAM5326sxk6C/LhEKv9dfYuqcXF8cQ5qnYIXOxgoUp9YX6sAcojRIkV
        yzrtkEB2/2jVNrG50SSYF4oINw==
X-Google-Smtp-Source: ABdhPJx753M16++5KQshpg+mOdq3snaSqF26bEU12jaHWOxHZ+uRKWFKtSHsf1OJ8L6RirSBKVY0zQ==
X-Received: by 2002:a63:c741:: with SMTP id v1mr9219808pgg.207.1616712316591;
        Thu, 25 Mar 2021 15:45:16 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
        by smtp.gmail.com with ESMTPSA id u79sm7177505pfc.207.2021.03.25.15.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 15:45:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1616673661-20038-1-git-send-email-mkrishn@codeaurora.org>
References: <1616673661-20038-1-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v14 1/4] dt-bindings: msm: disp: add yaml schemas for DPU bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Thu, 25 Mar 2021 15:45:14 -0700
Message-ID: <161671231454.3012082.2308918131020264735@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-03-25 05:00:58)
> MSM Mobile Display Subsytem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for DPU device tree bindings.
>=20
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
