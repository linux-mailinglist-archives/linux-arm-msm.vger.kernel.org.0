Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46FD1652BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 23:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgBSWw3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 17:52:29 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39177 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgBSWw2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 17:52:28 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so701394plp.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2020 14:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ZFoLB6pXpWwVB/0/nffKZvl9x/yuFK41bQrQqAdnUDU=;
        b=ELKjPCAsP9wn4m64lhqgq4GsDkSec4foH+Z4EnFjf6Law40CGWBtMXKTU1TahNqTao
         JrMKYq+VwFQ8yCdkMa9xx+hxKabDXCc4EQx8z0/GoIH9f7xcv7EhMqIuc0kvh+gkzv2t
         ytn6ROGRkgTmIzG2qPqCQb/R3Jf5eN5n+q+s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ZFoLB6pXpWwVB/0/nffKZvl9x/yuFK41bQrQqAdnUDU=;
        b=WsvWB3sn+cStuB1qdy8ydIBg4jy2Ij+JKmoTB0E+75m2sDKOoVaynCm0MMekH5QAkV
         V3mSXzgnEebFejBSA/urouKwecnMEu12u+FUtuBOpUQAPBeXTyJXRdUtLEENhm71+6XG
         +4i9aH1mwCHMR2YCKcKYGjypuvzpdXqH6pRLQ31h86/cnksYRZbcOvn9EhjnGJh6OpsO
         r4Bg3rnHJq1BlvNVcXcrm7inRH8mSdPt1gNa2kf3WoYnVn/Y5uqXAkZUHCQdaDOD0Krp
         +13lN23GcSqw0m5LsG/MKm4PN0DqdN22iEthevoNcorKfeDUIHh0C7G59DtJm1neVgJU
         +jqg==
X-Gm-Message-State: APjAAAU5txWq11TEFahiE5WGJL5YoMagS/oU8ojOIOIxckwcFZNG2kol
        5TdvNva8OiHJpqSdUktSesrWLA==
X-Google-Smtp-Source: APXvYqzyMU1+wblbZiSb70HWL3nCcboMCE3sFJ00Oxk4gmWezLb8kmCwTc1+/jgiWjZuoIZb3VlUkA==
X-Received: by 2002:a17:902:265:: with SMTP id 92mr26471493plc.292.1582152748063;
        Wed, 19 Feb 2020 14:52:28 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x10sm662447pfi.180.2020.02.19.14.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 14:52:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <eb967cd5a374fa32d93e486b1c9fd7e56796629a.1582048155.git.amit.kucheria@linaro.org>
References: <cover.1582048155.git.amit.kucheria@linaro.org> <eb967cd5a374fa32d93e486b1c9fd7e56796629a.1582048155.git.amit.kucheria@linaro.org>
Subject: Re: [PATCH v5 6/8] drivers: thermal: tsens: Add watchdog support
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>, bjorn.andersson@linaro.org,
        daniel.lezcano@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaa@codeaurora.org
Date:   Wed, 19 Feb 2020 14:52:26 -0800
Message-ID: <158215274684.184098.4618542372318170687@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2020-02-18 10:12:10)
> TSENS IP v2.3 onwards adds support for a watchdog to detect if the TSENS
> HW FSM is stuck. Add support to detect and restart the FSM in the
> driver. The watchdog is configured by the bootloader, we just enable the
> watchdog bark as a debug feature in the kernel.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
