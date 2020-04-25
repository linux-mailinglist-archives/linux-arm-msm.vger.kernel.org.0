Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96DB91B8915
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2020 21:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgDYTjb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Apr 2020 15:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgDYTjb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Apr 2020 15:39:31 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C49C09B050
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2020 12:39:31 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t9so5413059pjw.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2020 12:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=FFJ+RlIhSOPxhMwKLc97vVcR1rOxDF8GYeyH64M0ydo=;
        b=i3Lalq5cuGCVKoML246R4E8KH9Vsvt1oOUaMLmiW0f02n1iwTSO2C7ec3YfI6FkZY5
         dyC8mB7Y4nHzjjPkMlSt5hkzbzMJMeRAj9M3k2cZtyFEmLRfmaNs5b5z/Q3XkJgJNsIK
         WAVu/yAWl3WZ2xxyUxnFkKt7QWECEHLjbbvzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=FFJ+RlIhSOPxhMwKLc97vVcR1rOxDF8GYeyH64M0ydo=;
        b=XTIMZA4QYm9YYvcABQfjdAQeznG1ZGWXWudmQjaW3rOgJN9zZ4hu/+Zz10JiMdHEbm
         WRz2Asfs0d4wn6qvrGMyF+JAc5DURbgdg/6YsHkyjZYSOkEIIZkD/U6RdKRfpC7iJAwG
         /0dM2yDv6rhJ+0TGUMdr2cfgFugdTCiCyJfCQmGPUTocnbBiMVe60fYW0lHBQ60c+Hdy
         8250P7pHBgDcRSV0eHngyr2Kq+LmdsT8Z0uxGh4KmhvVsvVDFG+ReDXKExMcNHjhhD0K
         t9Wm2yP8KMWRSLLj3n1kJRVI4ecZmNNc+Csm4ntFlrm6BB8duUVGzEMzaGpyEQLzEM3a
         YjgA==
X-Gm-Message-State: AGi0PuYcyHPLgaouMyGODD9otjjLtIhLMY1X2xypy5k4O6FhvtoY9nby
        Lwt6Ck4yfCOQdm4G4iR+tFhNMQ==
X-Google-Smtp-Source: APiQypJjb7QoZatoPvZ0C5SA3OcumKCIMFSbn7THfXcy0NM0yccE/7t+zWNjac26pi33jCqWjxp58A==
X-Received: by 2002:a17:90a:d709:: with SMTP id y9mr14198065pju.50.1587843570681;
        Sat, 25 Apr 2020 12:39:30 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id n16sm8679956pfq.61.2020.04.25.12.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 12:39:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200424111644.27970-1-saiprakash.ranjan@codeaurora.org>
References: <20200424111644.27970-1-saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Support ETMv4 power management
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        devicetree@vger.kernel.org
Date:   Sat, 25 Apr 2020 12:39:29 -0700
Message-ID: <158784356931.117437.2821018841391441959@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-04-24 04:16:44)
> Now that deep idle states are properly supported on SC7180,
> we need to add "coresight-loses-context-with-cpu" property
> to avoid failure of trace session because of losing context
> on entering deep idle states.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
