Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F17826EA98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2019 20:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729537AbfGSSWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jul 2019 14:22:51 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46383 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729267AbfGSSWu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jul 2019 14:22:50 -0400
Received: by mail-pg1-f194.google.com with SMTP id i8so14797010pgm.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2019 11:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=Re7bGdDSOibN8TyYx8ctmhIgW7ORnAd3d48dCZJCs8Q=;
        b=oEoDF/B5t2C4jMyi0S3gpDDDEAULRf8xC6rFSgoeZdTzvCnFkmp2+heSBg+MUNkDIK
         79pg5Yxh7fPZnpa/k7fQwwMAqUxRN8E9EliidC4XXf5Ub3aqt9uKBijJG11AFMkmnDa8
         VEjbN6CNTvnTRyBw2vzdxu6dkh15XZOgB/88Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=Re7bGdDSOibN8TyYx8ctmhIgW7ORnAd3d48dCZJCs8Q=;
        b=QU+25ZYxjP6HcooADVKRPLKNlGmMSZaccSiH+1JScJU9EyUVZkiE41Tc03DlHr9zA6
         fNneG9DYMKDDe2jQ0r8bjGX/zDHmTI1vCE7JKZQevJOR4Tm2GyVcKfboe3GbJ4Yp/rfU
         vQqSGNQuczFnLA7yZvd/FyLlIauw6qOexqZYht4ofanrGpxkkBvIZ2+71X9wBjA0P5pm
         WkXlsSWCo790c0nM7VzO9qCb/ptlBS9x+93ce4pmk2J+x0R+ZVpZ3+Hm+oLt/QUXK3oJ
         rHbLz7c3ZgSXShmkqLCfKpjWScJZvPEAtdndR6gYUYFyeWMgko2Hp1fxZ4A+Srs1+yG5
         2hkw==
X-Gm-Message-State: APjAAAVfXLEAdBxKrwlz4OqfCs0+17lRWdobQzO2yaWgaHDxct0sZJsb
        7ywLBJjrWu33dQl+WG7n6J7MpQ==
X-Google-Smtp-Source: APXvYqxLDMfkGd7dZydioh7pVtp9VngkVUtndNJ46UNpuFKD1wUMhzFnwP3J+Hp0NedhZzJZxsIESg==
X-Received: by 2002:a17:90a:8a15:: with SMTP id w21mr59661059pjn.134.1563560570145;
        Fri, 19 Jul 2019 11:22:50 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 81sm52293060pfx.111.2019.07.19.11.22.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 11:22:49 -0700 (PDT)
Message-ID: <5d320a79.1c69fb81.17c57.b9ba@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190701152907.16407-2-ilina@codeaurora.org>
References: <20190701152907.16407-1-ilina@codeaurora.org> <20190701152907.16407-2-ilina@codeaurora.org>
Subject: Re: [PATCH 2/2] drivers: qcom: rpmh-rsc: fix read back of trigger register
To:     Lina Iyer <ilina@codeaurora.org>, andy.gross@linaro.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        rnayak@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org,
        mkshah@codeaurora.org, Lina Iyer <ilina@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 19 Jul 2019 11:22:48 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-07-01 08:29:07)
> When triggering a TCS to send its contents, reading back the trigger
> value may return an incorrect value. That is because, writing the
> trigger may raise an interrupt which could be handled immediately and
> the trigger value could be reset in the interrupt handler. By doing a
> read back we may end up spinning waiting for the value we wrote.

Doesn't this need to be squashed into the patch that gets rid of the
irqs disabled state of this code? It sounds an awful lot like this
problem only happens now because the previous patch removed the
irqsave/irqrestore code around this function.


