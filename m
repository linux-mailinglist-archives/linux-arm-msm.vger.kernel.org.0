Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB96DFE8C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2019 00:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfKOXm0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 18:42:26 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41142 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfKOXmZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 18:42:25 -0500
Received: by mail-pg1-f194.google.com with SMTP id h4so6676410pgv.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 15:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=iToz+vl4UuzXnSoAQspKE/x5E1vlqbw9FMJgzVbrjnU=;
        b=iHgcUugCHyxz+Iw82+c0FQudbT+3AwXkxLNtu05j9DFuZILtosVa0pZIeWLjgzoFuD
         cc1GFg8q3ApqpdBguYzZg6eVfLNM+atlybo29YbDCtEV2DNxRgLJ6w4VGShzuOwM5hYM
         7nWHaAupLVyptVHk+3dTgYA5jwGewS9OTTjeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=iToz+vl4UuzXnSoAQspKE/x5E1vlqbw9FMJgzVbrjnU=;
        b=Un3c5kznJrpUC8wYciSNNh0LCkfDEXJhFrkJcD2rZcktPJbJn5yfIZWpN8zaZw7zmC
         FNOegqgyz5Cq/FUdyNYST75o2CplNky4cd+hKcdTmHckq++lmDkDLHOi70POUL/pxzKi
         9BNVq0WsK4bH4BibwrCg7s8B3HNyPC+eR5QPgPH6nP63FILxhY9jGanDzbJBLqXvhe1C
         xS7b+7baFl2sIIa13ILJs5F14F+7eKIT8A3oQ2Cg7KB4MSnQZQ+cg5OCtIP6yCUXU1DG
         1bB3RUCS0j2fpc/fpd6K3EOtsqRH+JfIY2MUEl0HNxAMETQnwyRU768M4t1tOsNJ13mZ
         gRGA==
X-Gm-Message-State: APjAAAUIn5GRhIY1pFwu5COkDNBslGkI64IvUKp/EGmsaHGU2SBYwosl
        R65lHLk0dMVJK0NJUVBGmhEe+u4+HOU=
X-Google-Smtp-Source: APXvYqzPVvn22bxdM71aWAaZx9pasmXtHh4KdT7avVg7z9GGIKmnqNx/kRti4q2XTGASSasRs84xOw==
X-Received: by 2002:a62:e306:: with SMTP id g6mr12085031pfh.32.1573861343328;
        Fri, 15 Nov 2019 15:42:23 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p3sm13034585pfb.163.2019.11.15.15.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 15:42:22 -0800 (PST)
Message-ID: <5dcf37de.1c69fb81.8aa8.6308@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573593774-12539-8-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org> <1573593774-12539-8-git-send-email-eberman@codeaurora.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH v2 07/18] firmware: qcom_scm-64: Add SCM results to descriptor
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 15:42:21 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2019-11-12 13:22:43)
> Remove knowledge of arm_smccc_res struct from client wrappers so that
> client wrappers only work QCOM SCM data structures. SCM calls may have
> up to 3 arguments, so qcom_scm_call_smccc is responsible now for filling
> those 3 arguments accordingly.

Why? Now we can't mark the descriptor 'const'. That looks like a step
backwards from before where we had an input structure 'desc' and an
output structure 'res'. If anything, we should make the output structure
'res' optional in cases where nobody cares to look at the result.

