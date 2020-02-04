Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B91B1513D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 01:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgBDAw5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 19:52:57 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33863 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727199AbgBDAw5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 19:52:57 -0500
Received: by mail-pl1-f195.google.com with SMTP id j7so6539239plt.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 16:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:subject:cc:user-agent:date;
        bh=WIox8twYzzuteqHQrnQrEwf1t//qJOVB4wlY7VwIEJM=;
        b=NJUHs0Gv1JCvRtekbQ9nnuEypsM67s4TaDlGAXWUXhfPxnvk8gxYTzxamC7oFMcQJs
         sE8Ak3TH502lBewTmSSylFbj1DXzBiY5H6S/7iWFHzacMg/cWuny+Zk3i/aYrhv+KHD2
         4GfB2JL5L2guTHsUFk/B0BLknU/iDprv8WIdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:subject:cc
         :user-agent:date;
        bh=WIox8twYzzuteqHQrnQrEwf1t//qJOVB4wlY7VwIEJM=;
        b=L2lqKIrAQrAGh9eaie7zuLVqyoyN/ojKSHzd9npd+occ4v8AB571s2eirHv2kAS/ZE
         BaWz9TCdknRkf/YEQejOvlB5dDEAqUquxnizpHj0KfhKH4jc9XPXoES2lWKlOTtcVb/L
         qE2kcA2VOcLG10O9doNdeZUlbq0yS/p7YfNmnBG5YEr12ZT1JLHA83h6dwhaKB2NQykc
         5W6DsbDwKA958VTwQYa9VhidO5xoJe/mjm+mpEGGc/tDDCRJLHLWX8LKDjHci/QI6FSI
         FT+EkpGWX74MrnSLT/8fsi1ucUUEvrCRWSJdBWTXJtq/zb011mTRdugVhNqxgCiLPF70
         sxKQ==
X-Gm-Message-State: APjAAAUSZZq3DhiTcjTeHyBEXt6tviRoR7tk70bso55Y6pY5bsYZW1i+
        btrtctonQVv7l7z9jr5Gn+shDQ==
X-Google-Smtp-Source: APXvYqyo7qfkI8dzpvQ5Y86FRR/oNXvn6/uBJC+Qlf2LtbTOB+2Bhl4GBiUZsKw3HZPW+3160JlSGA==
X-Received: by 2002:a17:902:7687:: with SMTP id m7mr26042237pll.136.1580777575193;
        Mon, 03 Feb 2020 16:52:55 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h26sm22971966pfr.9.2020.02.03.16.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 16:52:54 -0800 (PST)
Message-ID: <5e38c066.1c69fb81.e0fe7.f64d@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1580305919-30946-9-git-send-email-sanm@codeaurora.org>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org> <1580305919-30946-9-git-send-email-sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: sc7180: Update QUSB2 V2 Phy params for SC7180 IDP device
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 16:52:53 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-01-29 05:51:59)
> Overriding the QUSB2 V2 Phy tuning parameters for SC7180 IDP device.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

