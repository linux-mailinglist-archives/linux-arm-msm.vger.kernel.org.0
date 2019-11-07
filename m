Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB6EF3650
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 18:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730884AbfKGRyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 12:54:53 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39511 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387435AbfKGRyw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 12:54:52 -0500
Received: by mail-pl1-f194.google.com with SMTP id o9so2006611plk.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 09:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=6n3o5+JOCVKLO8hHkLjsEkjuqiaK3IiXNN/Cf3cZ2IY=;
        b=TzkUMsHfydzu4SypLTCWeCrneyVNJ1wxVaQV/RBifHHe/SItQXYDGGwDWl5WNCyQeh
         4tW5bUU5CG8Q6AEnVd6HtB5QOLZZDIJYeoL1loQGUm7g2gst9EY0bzBhEtUDjS1wVK91
         lW8Fi21Xi15D3bfct2FgSsEDnxmp9osL2x4BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=6n3o5+JOCVKLO8hHkLjsEkjuqiaK3IiXNN/Cf3cZ2IY=;
        b=QSMt6eszDZAVYh4zC3g1c3m9/9iwLg9zHM8J3pwKWZOYAfER1FeuKVcDNPavBOYw+j
         eNjft45CsLUTTW0r0Di2TAMwkc+Da+Nu1xkLrbsE/QJfOrVIQD8o6V36HAPJYjlT4rku
         Gbndhp/CjGS0cPyLgOjcq74//9+xWBUKaYAfCGORZ2rmpHsB0EjuSbysxWwbYeVPz6nv
         LURePToCAau0CwQQ66pCgLf+Va8fdlJ/LE5BZD3dDCP33gnzBYnJ+tkP/SVGJPIZwiD8
         ymH6xMFWbA1DclXdTkQLj/oUtkDf4wK8uU0BCh3xPdDPMlyqHxz0RREhkDwhpla/9tin
         3uTA==
X-Gm-Message-State: APjAAAX5m2uxeYoJJLjO7L1G/y9OISUUy+CIjif5HGWF/bGUdJtQr9nu
        He5wweeBEywsAI2hkcOrcDN1xQ==
X-Google-Smtp-Source: APXvYqzTXBrRZGyIzbAN9SNYwElgXMzMY1DfyZuzzmgKZjy60pLIhia1ZoLOO63kaie+gIKLbD+MzQ==
X-Received: by 2002:a17:90a:d152:: with SMTP id t18mr6795829pjw.119.1573149291566;
        Thu, 07 Nov 2019 09:54:51 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id n21sm1295810pjq.13.2019.11.07.09.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 09:54:50 -0800 (PST)
Message-ID: <5dc45a6a.1c69fb81.bbfed.2d61@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-11-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-11-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 10/14] arm64: dts: qcom: sc7180: Add SPMI PMIC arbiter device
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 09:54:50 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:13)
> From: Kiran Gunda <kgunda@codeaurora.org>
>=20
> Add SPMI PMIC arbiter device to communicate with PMICs
> attached to SPMI bus.
>=20
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

