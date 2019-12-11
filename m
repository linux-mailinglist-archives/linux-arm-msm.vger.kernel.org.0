Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1B611B979
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 18:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730684AbfLKRAt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 12:00:49 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40006 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730424AbfLKRAt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 12:00:49 -0500
Received: by mail-pf1-f194.google.com with SMTP id q8so2090619pfh.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 09:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:from:cc:user-agent:date;
        bh=Il2BH3mT14jNnyfQTVgoz95xu2C4GVoCgXMNz/s/944=;
        b=T/zUrneyCEfYv3KlpaJyBcQk3iziUqjvddwQKdXrndN/Aqrn+mCThMWm8ogoAcABZL
         7+8FehOutGXdOe1aiY9Rkr0SoYcwdjAZaUnargC1+Yre6WlVEau5OUA5DeUtFCSxK3OT
         9Vr7rTt9LvgzKm25jAq3GRi0RYCsahW//MreE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:from:cc
         :user-agent:date;
        bh=Il2BH3mT14jNnyfQTVgoz95xu2C4GVoCgXMNz/s/944=;
        b=OkpZq009zc0bC74DpQ6Ag1ShK/hwporMTDhHJqw3p/9ny4mndHdyXIrviQ+W4uJiqG
         XAjZrkYXf52jWSLODYvD0CdDbOq2f9t3eqOMLwqiZxjrvUA3A9P2wjvZcgK1SpkIBOyE
         0VJiLpL0RkKskWbF+LTOKuKob34Na3RGYjn+2jE+6F6DG2RHfshWZYG1YfmnDb8oU8Tt
         jL938CO+GTqiO5UBfzTyi7R9O+irQF3R8d/I7McoX13pj2c1h9BBLcTY7f9wJGQYBVqL
         pHqANSdRcnga/1u9usLBNi0Lu9auOVoZ+WOdgA5cZBzJ0XAT4FqUSZpcxQ1sc48RA7VW
         wf2A==
X-Gm-Message-State: APjAAAWwBs7h6h88s6NTVD5+y95DgI8M2tLb5rcKgTAo0UD6PIy0TeIN
        tFekAgEwq9qSLw45FDX3US4+YQ==
X-Google-Smtp-Source: APXvYqyehQksX4lXTF0rK4YTJbTMk3+3BIKxNhLXjNsN84fk9gBPPcSRjxI652WP8Mh2ejJYjnzN0g==
X-Received: by 2002:a63:4d1b:: with SMTP id a27mr5085954pgb.352.1576083648875;
        Wed, 11 Dec 2019 09:00:48 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r20sm3724835pgu.89.2019.12.11.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 09:00:48 -0800 (PST)
Message-ID: <5df120c0.1c69fb81.ca8b2.88f5@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016ef36a5d13-457e6678-2e83-494e-8494-1b0776d5b7e4-000000@us-west-2.amazonses.com>
References: <0101016ef36a5d13-457e6678-2e83-494e-8494-1b0776d5b7e4-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add new qup functions for sc7180
To:     Rajendra Nayak <rnayak@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Wed, 11 Dec 2019 09:00:47 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-12-10 21:24:24)
> Add new qup functions for qup02/04/11 and qup13 wherein multiple
> functions (for i2c and uart) share the same pin. This allows users
> to identify which specific qup function for the instance one needs
> to use for the pin.
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

