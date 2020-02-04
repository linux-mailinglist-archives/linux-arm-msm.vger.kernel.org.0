Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE5EA1513B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 01:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgBDAjN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 19:39:13 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:38283 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbgBDAjN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 19:39:13 -0500
Received: by mail-pj1-f67.google.com with SMTP id j17so559192pjz.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 16:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:subject:cc:user-agent:date;
        bh=s99twd8T9lfxqqfXkkpW+eEO8uM/iiYe3oAKa4dMeeE=;
        b=XyE/ibDJ+79HIbydPGG183qHACW1D6X8nehb+4R6bNf46GIb2DLhg2lp8s/CuRH4Sx
         VKBswrBeGLDTxMWl0gc+wwS8q4MIGIZl0JBTBJYN863oyxxFUBgsAA4b+w/sfHbo66Nj
         /Y2TO6j0rtDGCC8j9B5mUa/IFw820PxNOcHP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:subject:cc
         :user-agent:date;
        bh=s99twd8T9lfxqqfXkkpW+eEO8uM/iiYe3oAKa4dMeeE=;
        b=c3V0wdFFSobEv0GaqPuGi/pJF1jcIYuN+Q5zdLOSrJcLNaAWDJIG1C8OB7l5Bnv2Uw
         BQ4WdVrJ5/61rYXevDFmmywP/HmGLfCGNL1o2envgOSH5YfJg7aKRdNlq4TqMoboxqLp
         lZBRasBAsObg5Ql+1UYId9tAc3U3HZrtzm1o63srU8DFvId8mjopRXWoBo/poDxnIJ7W
         9drtke1gHzp1vXojP2t+4aG9Ar4bxJiMOERhQvsREMC5kFX/F9oc3SLTPi8wtDEm36BQ
         man9r4IawwRYVC3OBVuslj9HgqOvmyGfWIdLojH4O20le9a/OZbdYjwJR52hDfEKjf4I
         w5jg==
X-Gm-Message-State: APjAAAVwzvJ4MoWN2fhbdjP6vdTcvjb+BeZNVT/3f2TKJ/XmPV4cZ425
        uD24CM2JTiysMU1ZHn6BzIPBpQ==
X-Google-Smtp-Source: APXvYqwd5LQ2/VSMcwQin0jFZzTzrheBaz3AQBZ4/bVQlPqoBD9MSuZyuVOOi7osiMJYE6viDVpuHQ==
X-Received: by 2002:a17:902:aa01:: with SMTP id be1mr16714483plb.293.1580776751190;
        Mon, 03 Feb 2020 16:39:11 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m128sm22014128pfm.183.2020.02.03.16.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 16:39:10 -0800 (PST)
Message-ID: <5e38bd2e.1c69fb81.82ebf.ddaa@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1580305919-30946-2-git-send-email-sanm@codeaurora.org>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org> <1580305919-30946-2-git-send-email-sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v4 1/8] dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bindings to yaml
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 16:39:09 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-01-29 05:51:52)
> Convert QUSB2 phy  bindings to DT schema format using json-schema.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

