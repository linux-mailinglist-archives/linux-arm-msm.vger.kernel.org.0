Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078121CE4A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 21:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731199AbgEKTh2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 15:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731549AbgEKThM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 15:37:12 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAD1C05BD09
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 12:37:11 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id g11so1117522plp.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 12:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=4+TfwVXKgl+kCzrXzLvbtXwZoeSbQHCRrZFbCPATzF0=;
        b=B3Fuj2xS9vF2SEGI6Xmh49i0Ps/UE5wXP9tUU9qj2fDX2G7Lxv+YRKSOPuyDvlddDv
         ETcNZUmUS6KMOMSzB6bUc05QWaHt7YMuedWyW3+xvmAgD7PeLLqzn6wklbmQDOlW4pv8
         EvawUg2xIJvv+bBu0oGoC582VWszan8PBlTCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=4+TfwVXKgl+kCzrXzLvbtXwZoeSbQHCRrZFbCPATzF0=;
        b=k5CIV+0a5IsNV+7lfrPvstjkhwGv+ZiAagcbCFkI0v6gnXqsPKVbZkLR/+Z3/hZ29d
         +ge8zngEfvFvJx3Dab2SxvlKMGCxvjfzqatmz7Cn3m9acxN77D+KlVIggXqSjQAvuuCy
         pvj/AeReh1LwxIPfAi5kw/26h7dlOocvPAeGBCz+o3O5M95W0LeKDphxADCaDbV36wuJ
         qy0FlwvlDKCyKeA6o2du5Is1TrdPieisryvfUP9+leQDg243fz+Hs13OKxKS0kmrMzy4
         Hc/QHDA/ZBptpcX1PABU6yJMdArU9P8u/DhsSfqhKitn7DLNuGbVoNrVSXqAqGb7fTuk
         buLg==
X-Gm-Message-State: AGi0PuY73BzbC+SBznNlMTMdbuzcjIoEIxt3UUKEV1RvDM5p6yqFj3xt
        JEWfp+vHfXQsoYGrCBcMMQ8+MQ==
X-Google-Smtp-Source: APiQypIcUFafUBeCy0rKTAZwm5qMdMe4CvAczlQJ0wpJxs6R6jWIuAB1kzwSF1szCKdbLPDVD2RDyA==
X-Received: by 2002:a17:902:8688:: with SMTP id g8mr17323717plo.268.1589225831184;
        Mon, 11 May 2020 12:37:11 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id cv21sm11083259pjb.23.2020.05.11.12.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 12:37:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200511175532.25874-1-sibis@codeaurora.org>
References: <20200511175532.25874-1-sibis@codeaurora.org>
Subject: Re: [PATCH v6] iommu/arm-smmu-qcom: Request direct mapping for modem device
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
        evgreen@chromium.org, mka@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, joro@8bytes.org,
        robin.murphy@arm.com, will@kernel.org
Date:   Mon, 11 May 2020 12:37:09 -0700
Message-ID: <158922582972.26370.14084228362776489859@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2020-05-11 10:55:32)
> The modem remote processor has two access paths to DDR. One path is
> directly connected to DDR and another path goes through an SMMU. The
> SMMU path is configured to be a direct mapping because it's used by
> various peripherals in the modem subsystem. Typically this direct
> mapping is configured statically at EL2 by QHEE (Qualcomm's Hypervisor
> Execution Environment) before the kernel is entered.
>=20
> In certain firmware configuration, especially when the kernel is already
> in full control of the SMMU, defer programming the modem SIDs to the
> kernel. Let's add compatibles here so that we can have the kernel
> program the SIDs for the modem in these cases.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
