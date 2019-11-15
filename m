Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81F95FE5A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 20:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfKOTdq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 14:33:46 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46814 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfKOTdp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 14:33:45 -0500
Received: by mail-pg1-f193.google.com with SMTP id r18so6423743pgu.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 11:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=QU8ftRvacoDuTomibhxhdB7IDINe+ys+Qkj4rwds7Mg=;
        b=VX0ZB3rzl89z63DG+Wvs3uHd1KerGZX5ck8uMP9WhwZZWmMHQE1B6NJkiq8xN6zyXT
         inVRONhwSI7sdfpvXidHLr5YT++pVIbEJO309pxXnt0p6iSHy4/rVcvF1by5HelxF2Ry
         uK/57BXB1NEy922s1wLo7H9Y1FsRpyFgBH8+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=QU8ftRvacoDuTomibhxhdB7IDINe+ys+Qkj4rwds7Mg=;
        b=phWqHi/50ht/AR7u3VVnQ7CdBTNMg5m4w3iA+CM+fFiRnsieLSvsoaCZC7KAtb2CAx
         TB3WxScPAHqCyN6cOJHtu6lbmkEGfi1cbr3fxrNZZfDzDn2bp6O3H3rdnqwTUNUoXZrC
         1O4tkYdkUfhomtne5odnjP/sq02E6Cpg50QJKXXai+I/mPcSEZGlpfBFLvCbRoquBBFk
         jvaCm+iw5oLcqu9BsmIESSFlPlMZR8akQTOho/YAIg7uGz83my/JLih0Ca6qL0hirNmZ
         CVUiXlRJcA/h6JgrMXfzqngWEW/gb36RlOnJRNlL7fJG3Wz0fv25vivlG9MYdFPkWOrH
         PbXA==
X-Gm-Message-State: APjAAAXMpV7+AwQSVWyqGNTN8JoL6lcikV4+ZXSAi0+AxCTBNDApCR1p
        MVFHbOJXGqGlS5FCHrTs11HfAQ==
X-Google-Smtp-Source: APXvYqzEiRCO/7qW1HDucD+lA/+5Kfj2lS10aAUFQkLnRD84SabthWIlz9xkAHhSgpz22fx7t9DiYw==
X-Received: by 2002:a63:c04f:: with SMTP id z15mr4336536pgi.52.1573846423509;
        Fri, 15 Nov 2019 11:33:43 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u3sm10059508pjn.0.2019.11.15.11.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:33:42 -0800 (PST)
Message-ID: <5dcefd96.1c69fb81.d7d72.ceb2@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-10-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-10-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 09/12] drivers: pinctrl: sdm845: add PDC wakeup interrupt map for GPIOs
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:33:42 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:18)
> Add interrupt parents for wakeup capable GPIOs for Qualcomm SDM845 SoC.
>=20
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

