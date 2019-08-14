Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE4E8DC98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 20:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbfHNSCK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 14:02:10 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33750 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728703AbfHNSCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 14:02:09 -0400
Received: by mail-pf1-f194.google.com with SMTP id g2so54033233pfq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2019 11:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=WfxA1A737XoI5ZZ/Hf4Cr2tS9xoxZFvNR1WhcJSUChE=;
        b=nbuuCGGLRs2jIpwx5obA8WHvJ1rd4HSPNnsO6jd7X4i8etCRuSwgpoU5UUSuHhgGmB
         yxxNkVHq72XrgE08a6AU6gQV0mgSYgifC1WnkUrRYPLW5PZa3h88lqtpphXfdJX9HwCP
         r/KDowHHZ6yYZvOXVfENrcjMJZBXe1xYx6Uso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=WfxA1A737XoI5ZZ/Hf4Cr2tS9xoxZFvNR1WhcJSUChE=;
        b=eDY8vzJI9Vsyn9UmDUbxUpmna0yiYZDI6stDz0Jhy548tTyuz4mztB4IDQr8ZT7B7H
         uevsjtgH07xNoY+WSFsNDGoSpzKgx20PVP+iH0n63862GyxGgSCszPerFiDPWkLqyvIN
         iYRGIBwIxs5lkjWrrQ+i6u1cb/qFiKtpJRE7vz2dT00kyxHUMB3Ym3rfDMngyxYxhCFw
         JOi4JylxKf5RIvMpQxFxxOgR4o1I/OEqWttQkhxH6TuKxNqEJ1ZTQLAczs8Z60IklOJj
         Vdp6qyy2w93wfP2/N3J92xclzPWWUt5FmB5IGGsN+opj8bZCJsqNFbhv22t3b9IusaXv
         0Ydw==
X-Gm-Message-State: APjAAAX9fHtEb+6IBMbYWuksKujdxMB/iEJxcS1upJHFPuZs3AnvJL+q
        Gkp5RiJTimXhkAsxdVZwalyQSJ8lHHat2g==
X-Google-Smtp-Source: APXvYqwk4DMeNeDAM10WFbJ0Wxfbl3zzpawQoDzKGmcpMx0DkwBbVOGhCtuG5YmdXcz2nCdcgwAyTQ==
X-Received: by 2002:a17:90b:14c:: with SMTP id em12mr971132pjb.28.1565805728996;
        Wed, 14 Aug 2019 11:02:08 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 185sm601094pff.54.2019.08.14.11.02.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 11:02:08 -0700 (PDT)
Message-ID: <5d544ca0.1c69fb81.a98a7.19e1@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190813082442.25796-4-mkshah@codeaurora.org>
References: <20190813082442.25796-1-mkshah@codeaurora.org> <20190813082442.25796-4-mkshah@codeaurora.org>
Subject: Re: [PATCH 3/4] dt-bindings: soc: qcom: Add RSC power domain specifier
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        bjorn.andersson@linaro.org, evgreen@chromium.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, ulf.hansson@linaro.org,
        Maulik Shah <mkshah@codeaurora.org>, devicetree@vger.kernel.org
To:     Maulik Shah <mkshah@codeaurora.org>, agross@kernel.org,
        david.brown@linaro.org, linux-arm-msm@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 11:02:07 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2019-08-13 01:24:41)
> In addition to transmitting resource state requests to the remote
> processor, the RSC is responsible for powering off/lowering the
> requirements from CPUs subsystem for the associated hardware like
> buses, clocks, and regulators when all CPUs and cluster is powered down.
>=20
> The power domain is configured to a low power state and when all the
> CPUs are powered down, the RSC can lower resource state requirements
> and power down the rails that power the CPUs.
>=20
> Add PM domain specifier property for RSC controller.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

