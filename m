Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5890711B973
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 18:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730771AbfLKRAU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 12:00:20 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46461 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730647AbfLKRAU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 12:00:20 -0500
Received: by mail-pg1-f195.google.com with SMTP id z124so11022069pgb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 09:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:from:cc:user-agent:date;
        bh=ce6WNTG7rh0D6PYR3MERWUAiOBArcBck/LmHc2D3ygw=;
        b=muwnhYRVbRIl1/FH/sh7c/z64lzbxd6S/l/xPht7E52tGir1Rx6FfNb9HZ2pGndxIw
         KCBc7jMfwPGEvUQcQYIjFKfP2UZ/QUmBwYONDRlgf4iv5YpcBTUy4e+KlquoXJANwD7t
         NcO+EfCHRXKsSmpnhY3Eeg2mjLF0YiZaE3/cI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:from:cc
         :user-agent:date;
        bh=ce6WNTG7rh0D6PYR3MERWUAiOBArcBck/LmHc2D3ygw=;
        b=j/rfu8wMIf0eDKFy+Gv2ImV2Pe1AtxXeh/M+yUiSmuI+ezpLyG/Znmw7iP2O6OSJiW
         0aZQeOqWx0J2f4Fv8UQDXSHO5AlCDIN8eR+j96fmygPus+RitCmiFZpF2qZITsunkWGz
         vmUDhObj0E9ijeEhj5n/3YjPr6hPXSzHpxcF4UkHrzwaOxQx3Xv7/Ve5n7M3ijtgjmJy
         AxbHCj9JUpyTE4HrHnG3u3CWNsAcWfx8YoQ//H2NXpvWuRJeax/SaDRloUcxdv3QQZ93
         pW9SSkGJ6ltloWA9/avt6SMWA9uAwZ5D08AWNmJJ8sxW/ZKSEwBGG2CT7ybcZzWSbTFO
         WXoQ==
X-Gm-Message-State: APjAAAViAT1rg4LTU+IaP9qSQRECwyWBMJs3e6slmU4SjY3OH0ZxZpah
        Dic4IXIVVBdICsUqnybbt1Xc6g==
X-Google-Smtp-Source: APXvYqwHqcCf25xYB+15bX59RJ/uXB6IfGVawfbg6uE3UzxtPpTL08Xzex9gfnfEWTNSCoYyFeZtsA==
X-Received: by 2002:a63:a357:: with SMTP id v23mr5231196pgn.223.1576083619403;
        Wed, 11 Dec 2019 09:00:19 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a26sm3843300pfo.5.2019.12.11.09.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 09:00:18 -0800 (PST)
Message-ID: <5df120a2.1c69fb81.fa9bc.901d@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016ef36a90e5-678f09f2-8fcd-4fe9-8e1f-3f1622ad0c5e-000000@us-west-2.amazonses.com>
References: <1576041834-23084-1-git-send-email-rnayak@codeaurora.org> <0101016ef36a90e5-678f09f2-8fcd-4fe9-8e1f-3f1622ad0c5e-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sc7180: Add new qup functions
To:     Rajendra Nayak <rnayak@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Wed, 11 Dec 2019 09:00:18 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-12-10 21:24:37)
> on sc7180 we have cases where multiple functions from the same
> qup instance share the same pin. This is true for qup02/04/11 and qup13.
> Add new function names to distinguish which qup function to use.
>=20
> The device tree files for this platform haven't landed in mainline yet,
> so there aren't any users upstream who should break with this change
> in function names, however, anyone using the devicetree files that were
> posted on the lists and using these specific function names will need
> to update their changes.
>=20
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

