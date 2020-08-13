Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFD0243E51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 19:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgHMRat (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 13:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgHMRas (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 13:30:48 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9280AC061383
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 10:30:47 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 74so3141787pfx.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 10:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=IQWrnc5WTjN5BGhjD79oWFAreGfAyr0fF03GP4y/EJc=;
        b=J4FW/VJ/5Gm/uGxIvsKY0pgjS5GJQD4+qrHZfRsVHK5wdsyB8b8HWq/eKVzJ28VJhk
         XhvfA6PAP6az3ZSC1pCga9JY/wqo314HR4RrxOw2OsGoGnDEA8Z/etubkHBtiCVImxVW
         okPPjPrUdC5Bpklt9WKuuXuMMj0/DAanBshEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=IQWrnc5WTjN5BGhjD79oWFAreGfAyr0fF03GP4y/EJc=;
        b=VzjEE3/bFVLnJIp0LmaxEHw9oFLAWi9FIZnmAL823H/hWX9BeQba+BCjTT+41vZQeP
         3Maizf8iKIa4Tyxf4f9JCR9vuzMy2Me+xxQCg7u5XORo9sX2fZEYft031hu5fADhqqpt
         uZHz1TdkFh/OpS1Id5N3iJZZmddsiAezma8ZH4Op3JWUb1pwzmmeH5XnfEbVabuLOVDq
         VK/4k4JLDrTcxTeLbr2BLPukzmNJXBfM466SaP0QbgXMoFEjGy2m0EyV9Cl/4UFVfVen
         NmUNT4u0HG4/v6gDK4qF6U5sDpI87HvD+JfDDda6GarbJbsesGOOGss3TEonUKndQw7d
         b3DQ==
X-Gm-Message-State: AOAM5337c3LSo7XAuLNPLbGKD8pjUIZs2SAYmU1jITaM9rjX4KfywPYj
        Mol8tNhr7mxrTbJKE8RGuYa/xw==
X-Google-Smtp-Source: ABdhPJweW89Ig89uR5/m0KMwV5c4I9rCPAnO8YqfXCB+1jfphuUuhjbDDVIu4WezzSDaq5TVBNp+Rg==
X-Received: by 2002:a63:4859:: with SMTP id x25mr4713141pgk.422.1597339846771;
        Thu, 13 Aug 2020 10:30:46 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id g10sm5563584pjs.20.2020.08.13.10.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 10:30:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200813080345.1.I85bb28f9ea3fa3bf797ecaf0a5218ced4cfaa6e2@changeid>
References: <20200813080345.1.I85bb28f9ea3fa3bf797ecaf0a5218ced4cfaa6e2@changeid>
Subject: Re: [PATCH] soc: qcom: socinfo: add SC7180 entry to soc_id array
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     saiprakash.ranjan@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Thu, 13 Aug 2020 10:30:44 -0700
Message-ID: <159733984474.33733.17347167062662610672@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-08-13 08:03:52)
> Add an entry for SC7180 SoC.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
