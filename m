Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86E1F170BA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 23:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgBZWh7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 17:37:59 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36699 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbgBZWh6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 17:37:58 -0500
Received: by mail-pj1-f66.google.com with SMTP id gv17so270803pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2020 14:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=MkiYANXNDKKBU04CoetleQBTgLDcDU4gpW2yHn2bIZk=;
        b=QUzAuOkfTreAOpJoiQlWLoPiROWp7KYC1iJAW8U04PHb4HNcpVaobovd8+yYcVaCcm
         3FITmEN9ShOMDXtu0lhwCKYnn+a8izFZZcZYbHjCtpqyVz8DR++HI8K0DZlcv5Vu7pPU
         2nOO4Ibx25LheW8f/J33e/Z+YnEktMRgXj2bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=MkiYANXNDKKBU04CoetleQBTgLDcDU4gpW2yHn2bIZk=;
        b=QENIqTGhKNx5Pfo7NoHVWB/nX2Bn4i6Q3jMeXmxrsytYgVTRVmxixua34Um4BUA4oA
         JQ6nRW8bUz04PtEqddm3WMoAtelXfAYST/vd+vhwsuY01VPXSf97anDxCkG15RK0qTKL
         1KRAgUyKPh/K1p1u8ussmpd+d9d4Mf6SYaFC9yWd3DLaS0NQL1oAE0J9WeCxFIumtmvn
         RMUIsdmdkqkC9h8GrkGMJoW5bXHLwGakR+09IMmWpVJ1rtKoHa8/YEbRxpgd/Ic0DP5a
         N8Yv3/TpP74iuslWp7zQprgJuoX4D1FS+S8Y2nkSbe7DGoSXpdsyczCkxzM/ahg0MJRk
         5n+Q==
X-Gm-Message-State: APjAAAV0DUcB+h1Pzj6Wigc6UXDG6VKvPqnCrFAr0cZHGKhFKxWNU1Xx
        vqVkgUOdb+mWeuPoIVLr/x3UHv0SaKY=
X-Google-Smtp-Source: APXvYqx4pAuCqNuJKULTSNu1E8O8v8SPGjUJtCyCqLQLK6VBYPNxlnO8gYz+J569pQGTu1uqWz6KfA==
X-Received: by 2002:a17:90b:1256:: with SMTP id gx22mr1435935pjb.94.1582756677657;
        Wed, 26 Feb 2020 14:37:57 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y127sm4362635pfg.22.2020.02.26.14.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 14:37:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1582694833-9407-2-git-send-email-mkshah@codeaurora.org>
References: <1582694833-9407-1-git-send-email-mkshah@codeaurora.org> <1582694833-9407-2-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v7 1/3] arm64: dts: qcom: sc7180: Add cpuidle low power states
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>,
        devicetree@vger.kernel.orgi
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Wed, 26 Feb 2020 14:37:56 -0800
Message-ID: <158275667604.177367.11185757008232316036@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-02-25 21:27:11)
> Add device bindings for cpuidle states for cpu devices.
>=20
> Cc: devicetree@vger.kernel.orgi
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
