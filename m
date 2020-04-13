Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDD61A6E2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 23:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388969AbgDMVTS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 17:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388957AbgDMVTQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 17:19:16 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A8EBC0A3BDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:19:16 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k15so5101731pfh.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=vbJOoG679zi/qFWY2YZaUKTVd6EhUDRK1VZI5sNPfg8=;
        b=ZCNPNtFaiv+4QlDiIG+LvypR67Tiyae7TKZcSzAl6XY+4FFw1fSP9hg1ZY6pyFGEyb
         9/o32SU/W5KVlrLSiUUbSe/pGhq7kdbFgy6NvvUILFQL7IBnh7dWkagDzU8PNsiv5uVF
         ruTQIH4t51akbADSxUnjx4CDCBXsS1jQFKqHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=vbJOoG679zi/qFWY2YZaUKTVd6EhUDRK1VZI5sNPfg8=;
        b=j7hcS3qp7NG0oU47OkboyURpzUsbvAzTNVQiau3PXOYhwwbXY0g9XKiaHqHOiPdUrO
         70HTr04A1WH2Zuf8gg2+5GBbtkD7G0BIdAKfrAhM7zxDPCndWSkM1PGDUQBs1AoQXOuN
         SBZSkOFPCwW5fhitcU2HccMR59IqZqjdaxuiHZDSEI5/XoWAcZzSd8VN782jOxOj4qw+
         LUL0yZ4JLro0SYrck41OTt/Pmi9aWZ+Hf4rxoez/J7+IFJDwm7Pf+UIA4X3DvolOsgYr
         5KWiF7lGx+w7iQ1EPDWndhMQnTToOF5PeO1JPe1oRTHX/Sa9ShheLsZm4NTeGTGq+4zF
         JxvA==
X-Gm-Message-State: AGi0PuZIrarnr/gTnbwBGTZFUHsiR54//q6y4Wv9OLWeDvH7RPI/sJdN
        MPg9Ti4S28DPLxUGFBH43b/wcg==
X-Google-Smtp-Source: APiQypKIZ7hgkjyovM+t2L5zKXzaV/8Ced5/Waha0+kHe5vS78RBSVR5jzDArQZ1iMCCSo5810aMzQ==
X-Received: by 2002:aa7:93cd:: with SMTP id y13mr19217358pff.213.1586812755806;
        Mon, 13 Apr 2020 14:19:15 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e4sm6735645pfn.199.2020.04.13.14.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 14:19:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1586703004-13674-7-git-send-email-mkshah@codeaurora.org>
References: <1586703004-13674-1-git-send-email-mkshah@codeaurora.org> <1586703004-13674-7-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v17 6/6] soc: qcom: rpmh-rsc: Allow using free WAKE TCS for active request
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        dianders@chromium.org, evgreen@chromium.org
Date:   Mon, 13 Apr 2020 14:19:14 -0700
Message-ID: <158681275440.84447.11477105660134588481@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-04-12 07:50:04)
> When there are more than one WAKE TCS available and there is no dedicated
> ACTIVE TCS available, invalidating all WAKE TCSes and waiting for current
> transfer to complete in first WAKE TCS blocks using another free WAKE TCS
> to complete current request.
>=20
> Remove rpmh_rsc_invalidate() to happen from tcs_write() when WAKE TCSes
> is re-purposed to be used for Active mode. Clear only currently used
> WAKE TCS's register configuration.
>=20
> Fixes: 2de4b8d33eab (drivers: qcom: rpmh-rsc: allow active requests from =
wake TCS)
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
