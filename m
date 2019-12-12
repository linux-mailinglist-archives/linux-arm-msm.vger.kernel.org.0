Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85CEF11D8FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 23:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731289AbfLLWAY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 17:00:24 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37133 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731011AbfLLWAY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 17:00:24 -0500
Received: by mail-pf1-f195.google.com with SMTP id p14so108103pfn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 14:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:cc:to:subject:user-agent:date;
        bh=m5RN7Ruq6b2oNIbW1OTVbblEFx0jLwFpTd4HTw5wVkQ=;
        b=lneRNQyxzco6VraFwiZvfvv0ix1xxj0F27IGpoVPrKlMBCxe/LgOg3peL5pluU74Qj
         S0F34wXbAn9QLYC/itEq43IXWcwWGqQNAYo6Tkjpm+Va8IZnD1aSHUgTAVaSl48PjFRc
         XvyPyCdILOnFtRcu7hpg1zu/YWYv0QI7oE1VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:cc:to:subject
         :user-agent:date;
        bh=m5RN7Ruq6b2oNIbW1OTVbblEFx0jLwFpTd4HTw5wVkQ=;
        b=FTlSeH3SjIfwJ4DwY2Q2Dh4zH2DO4MMq9uY8kMKgbawBUHPkFE7obsMe3fT/4CVxzF
         vXmZSk8wM9MLX/hKA9JYj2ZasRlT+0wRJRMtVoOtt5bFygyUI+h1UHDm6tCLDod9PdcT
         UaKwV4b588MyuiD7PtQQo77BYmMzn73DuLqIltANqd3RuuX2RcRGd5ZMuxjWR7GnGhvF
         7MgnPglyEAMkpCtATcIrK4oapp16D9BtrZmhTc1ywbavB7pVkzwk+XFWBVAEvcEibK7B
         Pbmz5wZPmuFGw62VF+6I7nhy35o1DDeTjBEp0HViWpV0xaBzF79+wZvLiQqod0Bg/rwQ
         1XGg==
X-Gm-Message-State: APjAAAWWYJjXPbfP06xFUVpJ8/tHOMyjVgcR3EKL8PmppIhkaEZUOc1s
        NafWk8hvaCENPRuvDUnCQNg8dA==
X-Google-Smtp-Source: APXvYqxKdxvqy0acTBm4XIVBtjHKPFwJWztj4zqFxxtbPgd4PxaZjT4MbgmTjW0W6DUqKyuKf4jamQ==
X-Received: by 2002:a63:1a22:: with SMTP id a34mr12401788pga.403.1576188022050;
        Thu, 12 Dec 2019 14:00:22 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 199sm8862298pfv.81.2019.12.12.14.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 14:00:21 -0800 (PST)
Message-ID: <5df2b875.1c69fb81.41383.651a@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191212113540.5.I4e41d4d872368e2e056db2ec8442ec18d3f7ef08@changeid>
References: <20191212193544.80640-1-dianders@chromium.org> <20191212113540.5.I4e41d4d872368e2e056db2ec8442ec18d3f7ef08@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sc7180: Avoid "memory" for cmd-db reserved-memory node
User-Agent: alot/0.8.1
Date:   Thu, 12 Dec 2019 14:00:20 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2019-12-12 11:35:41)
> By using "memory" we trigger we trigger the "schemas/memory.yaml"
> rules when we run "dtbs_check" which then complains that we don't have
> a "device_type" of "memory".
>=20
> Looking at the "reserved-memory.txt" bindings, subnodes shouldn't just
> be the word "memory".  Presumably using just "cmd-db" should be OK for
> a node name.
>=20
> Fixes: e0abc5eb526e ("arm64: dts: qcom: sc7180: Add cmd_db reserved area")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

