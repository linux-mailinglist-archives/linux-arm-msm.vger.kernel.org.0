Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13E4C192DBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 17:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgCYQEM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 12:04:12 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39602 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbgCYQEL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 12:04:11 -0400
Received: by mail-lj1-f196.google.com with SMTP id i20so3056981ljn.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2020 09:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pn2KqvNFk/Kh/oN0XHQ6BHDkBBBhQ3u1DOedSWlNkfQ=;
        b=NgTT4k5jlKQgS4xPUfrNeL4uN7tSr+FEjGTa0+opI2N8PJO6UtRhuIb/sfAji0iY5E
         rpYPeEVdAQ+nQvJJF5LweKq2TJ1MRLDae7RaM6LxnVdeeulKZjz1ZsvXv8uVrZ1V3THB
         uSYPP1p5vjzUNLwlKM728XMoTGFMLF7FmKOv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pn2KqvNFk/Kh/oN0XHQ6BHDkBBBhQ3u1DOedSWlNkfQ=;
        b=gX24geaadcD3JciMVPxruv9xdeeL/89hZACdGSL0Y9XEF67ajMql+jqcTb6u9shQO4
         CRH4VKZBPCDRmnap6SMsXci9xyBcbopQbci5EP4AGP259hKLg3QJXgdKbCDR7S1l2n87
         Gedy8R3JKEZUAMkxyX9Lg6bGNFDRMHnw385CqTCjvcu38C9Tr9sbi4sYgs8KXbRE3voH
         UyDuiKNp2RUpVjz4eKf5cas7yST/q30Q6MMOEMJqxRHNkL+astiIQlvE/++0gLrYPB4K
         ZRxZUT18JRiU/7R3Yy/WKMvpsKzpIlY8OD2w55wlpQs5QRlqdWNsbefrJftCN0WVUv/U
         2cgw==
X-Gm-Message-State: ANhLgQ2JqXGsv5UpyCfBomgukac9vsbQOlKT/Ybxe5+8WC1CVzzuA/lb
        lpy63ncdkrSzlP/poIfIvnFX6MhwVt4=
X-Google-Smtp-Source: APiQypJ1XIQeFw6c7qG2gfMyTMDtuneuCz8MX4PY5GTX3gTd8AUFrpPB/h3NKTpV0StVNaokrsiuhQ==
X-Received: by 2002:a05:651c:1047:: with SMTP id x7mr2428533ljm.246.1585152249288;
        Wed, 25 Mar 2020 09:04:09 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id x17sm2719973ljc.33.2020.03.25.09.04.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 09:04:08 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id v16so2999212ljk.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2020 09:04:08 -0700 (PDT)
X-Received: by 2002:a2e:9216:: with SMTP id k22mr2471412ljg.278.1585152247655;
 Wed, 25 Mar 2020 09:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <1580822300-4491-1-git-send-email-pillair@codeaurora.org>
 <CAE=gft7EOALEMUWzoR3+pjoxCUTYWbiXoXY=dXH1BDhS3KwBzg@mail.gmail.com> <000901d60295$3acc79b0$b0656d10$@codeaurora.org>
In-Reply-To: <000901d60295$3acc79b0$b0656d10$@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 25 Mar 2020 09:03:31 -0700
X-Gmail-Original-Message-ID: <CAE=gft7zqbUnx+BULDD+35z2p1=545=jF0=n6kFXZgo3ZTdCHQ@mail.gmail.com>
Message-ID: <CAE=gft7zqbUnx+BULDD+35z2p1=545=jF0=n6kFXZgo3ZTdCHQ@mail.gmail.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
To:     pillair@codeaurora.org
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 25, 2020 at 4:05 AM <pillair@codeaurora.org> wrote:
>
> Hi Evan,
>
> I will send out a v7 for this patchset.
> Since I have to configure the S2 SIDs, it is dependent on below ath10k patchset.
> https://patchwork.kernel.org/project/linux-wireless/list/?series=261367

Ah, right. Thanks for the info, I'll check out that series as well.
-Evan
