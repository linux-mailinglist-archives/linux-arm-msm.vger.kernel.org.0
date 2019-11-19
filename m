Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31EB9102C0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 19:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbfKSSwi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 13:52:38 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:41741 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfKSSwi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 13:52:38 -0500
Received: by mail-pj1-f66.google.com with SMTP id gc1so2974233pjb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 10:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=cqphRUBWoV7WE5nNKC8RYhviiEEJhT1j+Y7ZoErED5U=;
        b=WOpL1RBXyIGRx7LAZsUabQOZOXFY6VbckSItM1OeGFrV3wPaVQymPt1VJcTPz1B8cr
         zchv124LAaaBJD+OT7fj1lhnhX96FJ4SKT/N4wq0wQk7auHQCPOzOX+TAV5rxOlfwYYr
         5bvaefywZDbXkp8Uh3vXiE/JibC3aEJaX27Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=cqphRUBWoV7WE5nNKC8RYhviiEEJhT1j+Y7ZoErED5U=;
        b=HnLvIN0+/7/tyKwQVLJcM8m9PLDoo0Xc6dOyTaL1+gdmc/vruoRHo3TSk5ao739u+1
         1xLhHyw5+2mfhGTpA44uTjCBRr5mcMJAjKXEYWnXCwwLg5LGNY6pG4CciBKi2PLkcYzN
         G89AOyjm3jH+hOoPOXNdqUmOZqI+otB9U8W0WeWoZ/h3om/o7eGgD1afAcMH19uTTh9d
         Gw8kIeCA24oajaS1FUMHe5Ni6tXrlQDaXAhX0EzBbUpzy0C/qVtkrNDToT7ilE95gqPT
         fMxHrXkOdaUJXDMMMe3800Gy+J8iKe5omdlnF+tBmASLQjJLUZcuKuC0T867QXlQ8dWS
         RvEQ==
X-Gm-Message-State: APjAAAUsLq4GPV6bPWt1kG7Ugae0gSvZxj7RJvd2dNVejhvRAwp4pOsY
        R3EjraGl/4snjl2Jj2W9cPQ5EQ==
X-Google-Smtp-Source: APXvYqxJ/LCpjfL6i8k3WsYcLFwA+acmJMKmMqeGG0hum8Accmkz64zdUg7sdnrncEbx+LUDVgdWrw==
X-Received: by 2002:a17:902:7b98:: with SMTP id w24mr20717726pll.307.1574189557220;
        Tue, 19 Nov 2019 10:52:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id j17sm25734881pfr.2.2019.11.19.10.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 10:52:36 -0800 (PST)
Message-ID: <5dd439f4.1c69fb81.8a1e8.adb5@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016e7f99eaca-e623ce91-3e2a-40ae-bf2d-647a786aa7d7-000000@us-west-2.amazonses.com>
References: <20191118173944.27043-1-sibis@codeaurora.org> <0101016e7f99eaca-e623ce91-3e2a-40ae-bf2d-647a786aa7d7-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH 6/6] arm64: dts: sm8150: Add rpmh power-domain node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        rnayak@codeaurora.org, robh+dt@kernel.org, ulf.hansson@linaro.org
User-Agent: alot/0.8.1
Date:   Tue, 19 Nov 2019 10:52:35 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2019-11-18 09:40:23)
> Add the DT node for the rpmhpd power controller.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

