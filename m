Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A04E817D960
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 07:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgCIGlu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 02:41:50 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40588 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgCIGlu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 02:41:50 -0400
Received: by mail-pg1-f196.google.com with SMTP id t24so4258432pgj.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2020 23:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=RrX9EtA3zn4u15vVccJeX3aDhJuOUHVdQao27RU5nys=;
        b=ZlPvOTfYg8ORIBsXty84bD0rRJ/90K8uIO/uB/zt/ADLmUgqnZSsvJa7qD5c12Wnmi
         twF97bZmvCFfxUcO6sEehkFpu0ixFanK2imweMwyQbM+gjb3XtggIwWiX35PVRGvz/nA
         a5/oOPSK9KvI4Bkc5tDFy9cfr1VFsoh2VFnyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=RrX9EtA3zn4u15vVccJeX3aDhJuOUHVdQao27RU5nys=;
        b=FHQvd1jlfYa9Of0Eb3qrG7vLeS1VIW3X8wZob7lAiT3TLGAt7PescY3CbXKdDHYPNP
         fkIlA6asDvRUI7OozqH5se2WowW7zwCOgRnPXSe4HtiswBV+Fho8khyJf3E0sMLfEPT+
         el+AiQindGL6IVMixLPc34QcCg5FBRVAZ7N6gU9ghJ5Sgwfy2tLm1SZT1YRnt1uYvFVX
         J7cX3zPubaWdPis+cT8nXb6pMPtqmrV8tRFA1nznK+Z0ZdN9UFsgZaVysWEye/GtLWkp
         k5v2Q+01SRGbHFpWWXhcMbbp/VmevNYf0CaaSdrIjMV3GiB5xeVkDr6m+nGsbBgg4L2C
         laeg==
X-Gm-Message-State: ANhLgQ3T3fPJI78XF4WABtDnINfEsLGgmefannJHHaZaWObzaYF5K5yH
        b9k5YUe5gB9DnTB514ja/DWNU1hfPQI=
X-Google-Smtp-Source: ADFU+vuFj92YnT2uVcGJAjBivqhd2E2e1bNOkvmP+cAyeV4G04fBNTjyHqM1P5aYSHvLJ2i/lJqlkA==
X-Received: by 2002:a63:f311:: with SMTP id l17mr15183521pgh.142.1583736107615;
        Sun, 08 Mar 2020 23:41:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id nh4sm3207636pjb.39.2020.03.08.23.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 23:41:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1583477228-32231-3-git-send-email-skakit@codeaurora.org>
References: <1583477228-32231-1-git-send-email-skakit@codeaurora.org> <1583477228-32231-3-git-send-email-skakit@codeaurora.org>
Subject: Re: [PATCH V3 2/2] tty: serial: qcom_geni_serial: Fix RX cancel command failure
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        satya priya <skakit@codeaurora.org>
To:     gregkh@linuxfoundation.org, satya priya <skakit@codeaurora.org>
Date:   Sun, 08 Mar 2020 23:41:45 -0700
Message-ID: <158373610593.66766.7767101522459278381@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting satya priya (2020-03-05 22:47:08)
> RX cancel command fails when BT is switched on and off multiple times.
>=20
> To handle this, poll for the cancel bit in SE_GENI_S_IRQ_STATUS register
> instead of SE_GENI_S_CMD_CTRL_REG.
>=20
> As per the HPG update, handle the RX last bit after cancel command
> and flush out the RX FIFO buffer.
>=20
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
