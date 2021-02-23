Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF4C332269A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 08:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbhBWHrc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 02:47:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbhBWHrS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 02:47:18 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF52C061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:46:38 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id b15so1261730pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=j3eCkXkqKlqoQ++ZGh++P7MVpYE86ix5Trk8vJcs2Nw=;
        b=NAEySFx7o8WL26Dva9WVkkpcWevRnirrdlMOEvm57iEd7sl73mfzknEzfDS2k0XAOs
         8BZOT3z3TozNEn/VjsJRak/RWFEC3NcS3dwk8JESQ6+wPBs+L0+K7Z9aHdMAlB+Nhzpc
         C93VHeKKWSa+uEPZbqGJArpzQtpkXhC23Nwvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=j3eCkXkqKlqoQ++ZGh++P7MVpYE86ix5Trk8vJcs2Nw=;
        b=hQZC5zRDa1k2MMoUSTQ0FHORCI3VlZaTqSmPkqC/kdOIr6w8+/0rsiug+pW5xQDod4
         g1TIbbq9uxg+6R34w2p0Jp3lrwmrMG6jsSYYl+c7XcmlT+8daS4nD1E/KQIyPDQXFbpV
         t9hneGpEkyv68gFGqjU5D+6KYuM3M7rkSubo85c+gM/+5y5EwC9zSN+GhmkcV3N7eh1z
         IWHqS6XkfhxHzlUF9JG0R+jn6K4af/XiELzi+tnBuJkQonIi2DlNGQFEcJBvZJqrdN87
         JgUDBGM1hhjtpO+R5oRHguYOnM5XUe9gS5wKfDmx1MLDw+L8JEC21Utuda10x+Qv8iga
         Ud2g==
X-Gm-Message-State: AOAM531FnYmsaCRy8hDcGNx0U3yoscv0hb/p6UopFvub2do07vOFgMH8
        zImSMEPcmQ+bAshPK+S4Nvx7Phq5J0i8HQ==
X-Google-Smtp-Source: ABdhPJxhp7AXxGelBLg860BqurxdPqRCFqL0qeDB6+AsUk8aP7bgjraMqw3iWzX+zq2+HIyAT/0X9Q==
X-Received: by 2002:a17:903:228a:b029:da:d645:ab58 with SMTP id b10-20020a170903228ab02900dad645ab58mr26811871plh.25.1614066397987;
        Mon, 22 Feb 2021 23:46:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:68e6:d68b:3887:f216])
        by smtp.gmail.com with ESMTPSA id g9sm1587913pfo.115.2021.02.22.23.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 23:46:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613114930-1661-12-git-send-email-rnayak@codeaurora.org>
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org> <1613114930-1661-12-git-send-email-rnayak@codeaurora.org>
Subject: Re: [PATCH 11/13] arm64: dts: qcom: sc7280: Add APSS watchdog node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Mon, 22 Feb 2021 23:46:36 -0800
Message-ID: <161406639631.1254594.4155617024316856398@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-02-11 23:28:48)
> From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>=20
> Add APSS (Application Processor Subsystem) watchdog
> DT node for SC7280 SoC.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
