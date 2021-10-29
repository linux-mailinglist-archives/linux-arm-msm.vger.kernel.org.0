Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F3D4405B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Oct 2021 01:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbhJ2XSq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 19:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhJ2XSo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 19:18:44 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E9F8C061714
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 16:16:15 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so15640490otq.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 16:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=uMV5MnFfkKefQ2tbPRsUD5YZmW9QbmFtZJrDLkSD6+0=;
        b=STHz8Aj6W76pYT0kuSqNaq1WJC9GulCds76IHfUeIt1O8u5A77pNvkovyZ2y2PCy57
         0QQnCaBzMHfkQruVpFQTAoYfaXkMe2+AW/ChJWS5gdzBD6dofQrsFPS3B7gThd2LkonB
         B28vIB3hU7aXp08AMOYz97qAwKLf/QpPN/iiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=uMV5MnFfkKefQ2tbPRsUD5YZmW9QbmFtZJrDLkSD6+0=;
        b=nxNRjUdsmkqm3MKWQD+6VE5iWLDAUYT1yXOx2BgH/fL1O9KY7N9mcCZloefI2HaXqv
         lLjLTXK5LkWPCQwa66vqnTGDi2bsBBwvuNIg3A9MDEKSvOQNzTO4ii9Sjm9F9Gsp+58j
         DS3TJLW4P9/AniYeQYFiFvw+0f6VmwgKwwwoOvfFB/+JG2NssIiDp6x3lK3MmPvJf8sA
         nTRI+ovqrIoAmEIt+j5rAREcK4d1zmeTx4L1EERifqhg+mQGElV8YnHsqZCDnfeNkc27
         eP5q5u0xsRNaSnu0xZ2GZgcfb5qjUCOFAOat62CsSvKrqHTcmQfwtBTi8sETp69OKEfA
         R+jQ==
X-Gm-Message-State: AOAM533GaHb8ePDr8ihqTgI0uajiIJI2uT9isw/328/wd+IaFL3NvhuV
        wyWzzGDaEOEUdzM/aEM9p3XY13SzIAF8dbnrfFjG9w==
X-Google-Smtp-Source: ABdhPJztdLh3pY1cRiqB2jxVVOj4HxOlVnDkSKoHezYWDzleRlRBWoWgasBh3OcRcKgESqNofhNIVE7NdulWZyQvqc8=
X-Received: by 2002:a9d:6e16:: with SMTP id e22mr10520977otr.77.1635549374671;
 Fri, 29 Oct 2021 16:16:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 18:16:14 -0500
MIME-Version: 1.0
In-Reply-To: <20211029152647.v3.2.If23c83a786fc4d318a1986f43803f22b4b1d82cd@changeid>
References: <20211029152647.v3.1.Ie17e51ad3eb91d72826ce651ca2786534a360210@changeid>
 <20211029152647.v3.2.If23c83a786fc4d318a1986f43803f22b4b1d82cd@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 29 Oct 2021 18:16:14 -0500
Message-ID: <CAE-0n50JTi+62Nzs+Lc4h4PGDdzEV2Ojm+OD+sqM1LDqC_QSow@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: sc7180: Specify "data-lanes" for DSI
 host output
To:     LKML <linux-kernel@vger.kernel.org>,
        Philip Chen <philipchen@chromium.org>
Cc:     dianders@chromium.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Philip Chen (2021-10-29 15:27:41)
> MSM DSI host driver actually parses "data-lanes" in DT and compare
> it with the number of DSI lanes the bridge driver sets for
> mipi_dsi_device. So we need to always specify "data-lanes" for the
> DSI host output. As of now, "data-lanes" is added to ti-sn65dsi86 dts
> fragment, but missing in parade-ps8640 dts fragment, which requires
> a fixup.

I don't see data-lanes required in the schema, and
dsi_host_parse_lane_data() seems happy to continue without it. I do see
that num_data_lanes isn't set though. Does this patch fix it?

----8<----
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e269df285136..f6fba07220e5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1696,6 +1696,7 @@ static int dsi_host_parse_lane_data(struct
msm_dsi_host *msm_host,
 	if (!prop) {
 		DRM_DEV_DEBUG(dev,
 			"failed to find data lane mapping, using default\n");
+		msm_host->num_data_lanes = 4;
 		return 0;
 	}
