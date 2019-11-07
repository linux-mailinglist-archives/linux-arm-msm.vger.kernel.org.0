Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C70F9F35FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 18:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730668AbfKGRns (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 12:43:48 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39198 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730486AbfKGRns (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 12:43:48 -0500
Received: by mail-pf1-f196.google.com with SMTP id x28so3036855pfo.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 09:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=i/bPZYpoTgBBA0/FNFZyzs4p1x5dRwvEFsGyW1K155c=;
        b=ZUM/7cXSrgbDE42yKYLMhG25QGuPe992yvgtfqjaqDYXj7+yjfnf3SsTzMw0AJ/BNk
         YwwYE7udeNrqXvEu9r9ZsbUgCHhDEANgkV9C4Aqoad6abD5bjEzSFBCX2ofNmNej9aWe
         3XiwKjGOpqhuiKZMTkiKgtWIPRk3ov+7Aus2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=i/bPZYpoTgBBA0/FNFZyzs4p1x5dRwvEFsGyW1K155c=;
        b=jDFwiNnCKfwn78q1Y5F6KNGSRyDa1JGc09XGyI4wDPljnkPwjBo3LRcfFxrpk3jNSt
         J66TxaM72Au4UjOee1NhRnF9Nj/U5fNxTFl+KAtIk/W/w2Kd9R1lkqgQqjaL3b8cSoJW
         QWRT4nKokfplhAREZ2Q4ei6UaZsBw/MSqDDJWaMH6hrcfbJHt53b6Z3RMFgX8sNTzFRI
         zxWgkQsrhzhVSF8eJOaZGbKKDMqfOAF3ONyiUSQ2BwGGyj6/rCdbVRtdOjZR0lf7kyKZ
         9uzflu8OtsYV+eP/MSns7NGGj1QXeHA0F7c67AvFvZdBe8H/JyYM8yO/GPVj0o6E0U1Z
         pyNg==
X-Gm-Message-State: APjAAAXO4yzAKg8XVqmD6rJ2xs/St1BtWcKAaxsjEe4RUfzeK6b0hw36
        QOdbuXMCp90LMShQfJrnAopo8w==
X-Google-Smtp-Source: APXvYqyKl8+9hlEMt2RuqCuK+QVNWgd3w09FeHcCuF7GvMgHbVE+27A0VSv47omCaySvcInXiNiHXA==
X-Received: by 2002:a63:d802:: with SMTP id b2mr5935568pgh.414.1573148627379;
        Thu, 07 Nov 2019 09:43:47 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s26sm3138076pga.67.2019.11.07.09.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 09:43:46 -0800 (PST)
Message-ID: <5dc457d2.1c69fb81.839ab.803b@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-2-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-2-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 01/14] dt-bindings: qcom: Add SC7180 bindings
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 09:43:45 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:04)
> Add a SoC string 'sc7180' for the qualcomm SC7180 SoC.
> Also add a new board type 'idp'
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

I see that it isn't sorted but o well!

