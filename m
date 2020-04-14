Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C9A1A8CFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 22:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633492AbgDNU5L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 16:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633455AbgDNU4P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 16:56:15 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96992C061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:56:15 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t4so391077plq.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=brNSySgeiKv0xhhX3n6LDxkGSMExsjipuaZvipjv6gI=;
        b=H3h4TqmLx9PW5L4u3K907ITQ3/MaeFseibP8BW62ucVchEu+eqtMF6WGLny4r+07a4
         w9f2EEvotTxR2QFHMHSI60acRTc+f1HRoswf8M6Hk/eizrXUIfTQKr7SAIFjfD9Qo1a0
         OWXFg36wiBCAhrCHM5zJhT1HUe1PPzZXbVk0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=brNSySgeiKv0xhhX3n6LDxkGSMExsjipuaZvipjv6gI=;
        b=J96aiPkQeI1mUoA1WqpSOrEUPk6vKjW65O8foKwj8K6GRS+i9sUJNdGdMaIR3ZR4sk
         0Bd+tIbx3uyJ8bcWQfV+YsZntUOZSjHs5TXYAaId8XjMvTW6HvPtkGgNenLcdcn1pp6X
         X/pz3JHlwf0onpJXy8vg39Kxj3bH+8AY2Ks0LCWU91WwQgSZ/rKjFXs82BnxBve2QAjn
         9k0kFXPVEHSmgzoU5jn9FqmSsFBZ8H/EEe19NAOBdC4qYfhH3rmiLnEsgh2kvOkwI8Ad
         aYhf1eKNO6VEQC04xLG1W5az0GvbUph8y0UexYO5KMtoRpqTbXJpNuEPSVuRB/9TWT91
         Dlag==
X-Gm-Message-State: AGi0Pubfy0S3bDR19Longoe6/WfAgQ/GNQ29X6zgnh5/Yqhlmjglp7y9
        d7sX1oSZSoqpe8fcQ4AxvyVsyHf4Brc=
X-Google-Smtp-Source: APiQypIR+i06XONT+D8ITa/IRdit2Sz40kgbj+FvORhekoMgieSKbRgQLejrYHBQYOUK1f8naFTkeQ==
X-Received: by 2002:a17:90b:4c8f:: with SMTP id my15mr2227495pjb.63.1586897774811;
        Tue, 14 Apr 2020 13:56:14 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x5sm6481354pfc.213.2020.04.14.13.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:56:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585809534-11244-3-git-send-email-sanm@codeaurora.org>
References: <1585809534-11244-1-git-send-email-sanm@codeaurora.org> <1585809534-11244-3-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: phy: qcom,qmp: Add support for SC7180
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Tue, 14 Apr 2020 13:56:13 -0700
Message-ID: <158689777311.105027.10697729966586057172@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-04-01 23:38:53)
> Add compatible for SC7180 in QMP PHY bindings.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
