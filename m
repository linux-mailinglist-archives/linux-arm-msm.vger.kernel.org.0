Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 286A01513D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 01:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgBDAwT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 19:52:19 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43718 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgBDAwS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 19:52:18 -0500
Received: by mail-pl1-f194.google.com with SMTP id p11so6527344plq.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 16:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:subject:cc:user-agent:date;
        bh=juH1D/JjwiXFZsR7wDUzqXKriQUzIaRkvnk6WpEYkW8=;
        b=WlOhJe8WG35ZWUHnMZxcRqm0DftkI4D2QIpdy6BXYpJT30L3p3i826iFF/TgGgajyw
         u+7kNoKYYw9sTecDF+AeBMnyD2G4vR0faATZYfdiP+8U8N4TVPs+1WtFGhMSOL2vqpzD
         6OZB8SkTXSSbPF2IuDRg3Vob8vF8HRj2X8qhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:subject:cc
         :user-agent:date;
        bh=juH1D/JjwiXFZsR7wDUzqXKriQUzIaRkvnk6WpEYkW8=;
        b=ahd4XUL0eU/a76YgHHa3NPyHAk012Vw0GM/Qoq28tcBXDvX4aTE/8ljY1Fhb0wr6lb
         pKa0Am+Ir9M4lZzGqmOgLHd7Eilh6Qozu5Irv3rUYTbs6gwA3g1Yw9CK8uZmrFRGtINw
         Jb7u+rJZAaJwD3+o7yuOtsVyebwj1y4ARkGrnRkabQspGbU3CV6p9olCGcPMLnvW3OJq
         uM4i7chE/MyuBu6GAh1/58ocMYrtYC6Q95LR5nNtsQmpi8UB5A9OJbZEYFTDwDdKv76H
         8hhCU5m4sXrGXheUUZYNKSFgNH414lFbpBySZTwUhqO2Jhja5Y59FVu7hj49AlCsfuhu
         7aWw==
X-Gm-Message-State: APjAAAWiF4WHcanNRCpGpuhitvZe1drPRCxnnSLFOC5PQP5+45Tto/gn
        Kf5eshynePBb+mUsZzsmvH83Sw==
X-Google-Smtp-Source: APXvYqx0DysWV9esrDzkhiMpIHTmIfIqU1/9jj0L5WAp3alYyHpbkOnov8IzMg4CPqiAeouQyLsIKg==
X-Received: by 2002:a17:90a:a115:: with SMTP id s21mr2340735pjp.23.1580777538254;
        Mon, 03 Feb 2020 16:52:18 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b1sm22322166pfg.182.2020.02.03.16.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 16:52:17 -0800 (PST)
Message-ID: <5e38c041.1c69fb81.8c1f0.da56@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1580305919-30946-7-git-send-email-sanm@codeaurora.org>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org> <1580305919-30946-7-git-send-email-sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v4 6/8] arm64: dts: qcom: sc7180: Add generic QUSB2 V2 Phy compatible
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 16:52:17 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-01-29 05:51:57)
> Use generic QUSB2 V2 Phy configuration for SC7180.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

