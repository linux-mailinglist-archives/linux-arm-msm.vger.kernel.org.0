Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C612E1A6E05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 23:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388906AbgDMVRZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 17:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388891AbgDMVRH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 17:17:07 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF72CC0A3BDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:17:07 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k18so3858310pll.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=eC2MEHdLAsuZgsM6/ln+QWOcxR9o897nfctxg2dELsk=;
        b=FOe16klEN59gHf8DsemBbvY3xk8S/CsK6R046piFKeROmNPkOeYqJdgM7fstOlZhb9
         iDyn/hdH7byLxSVS85oAQkXRAjRV/u2jQdeCnKK4EYoxrHaYvVoG8RUKfXAu8oLYlDZu
         fBVxJnUvBEZMIZK6n+4Vt2X72Td1wX1VH+SP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=eC2MEHdLAsuZgsM6/ln+QWOcxR9o897nfctxg2dELsk=;
        b=VQ4WI6pFljf9g+QYpbXa/vC4032JM38Rnu6qG6aD64zG9n1oFDIXNhHIMY2ZZcQ7UI
         Ti8aXkh0RwyBc7MrmK5glStQOH3o/XFELp36NJxGjVJld2IBvCmsKWUD/p7y8IC533Qu
         jiAetaXakHWbMrputglsABWLf3+cYYp56514ovvFx0DThpVt56+8sEVEzQ2k/GHhKjNG
         O4sQahh/f7t4rCeHMXSP3mZDmG6llj++HVL2r8aqaX4HNFQVTmYv48pbR33L0MqZcn4k
         6jd7p243m9Fb1rqJ0u6RDBBDcF6WCELd6lIgjXjxG1NzERnqBFtc3JHm+/BhdNDWsK0F
         H0eA==
X-Gm-Message-State: AGi0PuY8Ut+7EDa6J1x3YZSGPqq90+Z7h+t/f/J8hg3OpJ0Jq7FFuRAl
        s8B/u7rpgcWFBrOz0XBDVg1LtQ==
X-Google-Smtp-Source: APiQypK5YeG3+cIFNKOKytz3S6ftOZYnIEwkaXMhVzUezQHx6huazKccZyOWUp0WHXouALSMQUH6Ig==
X-Received: by 2002:a17:90a:d78b:: with SMTP id z11mr23780945pju.34.1586812627228;
        Mon, 13 Apr 2020 14:17:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q200sm8752985pgq.68.2020.04.13.14.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 14:17:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1586703004-13674-3-git-send-email-mkshah@codeaurora.org>
References: <1586703004-13674-1-git-send-email-mkshah@codeaurora.org> <1586703004-13674-3-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v17 2/6] soc: qcom: rpmh: Update dirty flag only when data changes
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        dianders@chromium.org, evgreen@chromium.org
Date:   Mon, 13 Apr 2020 14:17:05 -0700
Message-ID: <158681262575.84447.6103170873953765147@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-04-12 07:50:00)
> Currently rpmh ctrlr dirty flag is set for all cases regardless of data
> is really changed or not. Add changes to update dirty flag when data is
> changed to newer values. Update dirty flag everytime when data in batch
> cache is updated since rpmh_flush() may get invoked from any CPU instead
> of only last CPU going to low power mode.
>=20
> Also move dirty flag updates to happen from within cache_lock and remove
> unnecessary INIT_LIST_HEAD() call and a default case from switch.
>=20
> Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state request=
s")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
