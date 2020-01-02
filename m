Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 669A512EA18
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 19:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgABSzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 13:55:06 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44638 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727951AbgABSzG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 13:55:06 -0500
Received: by mail-pg1-f194.google.com with SMTP id x7so22292164pgl.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2020 10:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P2z1BQKUlYwHb9GDdDzAXkmToRKhEz7TksZOlTr4+Hk=;
        b=TnmbqLAKD6zMekEFVQ1wP/9IqoMBOzoc2DCsIdeZSE/iivYGbzNobmnNXZF8c/qcMF
         09VPGvOYD9cCt/Vp6NuHxJ8ym7aF8M4xd0ysqe9yktNFhXtoTRCZvr8efbWScR3kmWAo
         og382fAtnkLn8Y802wBmlKzXeQRh8IuEnLd8QW/Vb5375P1ZaX8ur3Ms0bhJnbUlbJ9f
         pvOxGsN4xdAOv4PYfYAswrkZXERcnARabEgDP5Hkoa3Wwh0RHWGNgRS2XroCL1tAtX0g
         t2bK2qKn7hcsNJbqizTPquGRmHxyTTtQkWRlsSLgX+2NNqvFxy6nFDP2lrdmJXosLjzT
         yxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P2z1BQKUlYwHb9GDdDzAXkmToRKhEz7TksZOlTr4+Hk=;
        b=FbpRy+2oSL0c6sXBpgGRKq+7Nb7zYXV29+6Y4oM1hC6Up0SXMY9Fz7sBfT8rblb2KK
         h+dhb0lo5icBz4AdvwuxMfuoh8Jtm6UE2ozXODHuznaFgTf3u82pm064dVA4Q9vcnr3f
         0dRl3HDqgAFvIkDy2evZnWtNpKNVyMju/Xk3fLlM1uni6gjM9MmKA2UHxo8VMrf5dMnH
         uGDkQ5m9fRcLmFF+KlHrMFAHxiqzv/1VTgznV8djqpiHktMuH+mUfm5nyc/Tfq12PKtd
         Xqjl4cNQAKG6s8gcjuAFsyX5vo+bvNsf8X/eTdUwXtzvIOB7DHClNnqY1ltluAZXnBfC
         yHlg==
X-Gm-Message-State: APjAAAUif4+gSUe2REWPEYfFEYLYFtFnaAGJjYla9oOT9DylQD21tijz
        VyKLNrDHkYqT6/GVxta2w7GH8A==
X-Google-Smtp-Source: APXvYqzclT1IUZjXc/QwkOOKIGERu8LAsNrV+K27QqoUMvs7dr8qfuuvIYxDTDyucWntlE0rBV+nAw==
X-Received: by 2002:a63:f551:: with SMTP id e17mr89797349pgk.162.1577991305792;
        Thu, 02 Jan 2020 10:55:05 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 83sm61145789pgh.12.2020.01.02.10.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 10:55:04 -0800 (PST)
Date:   Thu, 2 Jan 2020 10:55:02 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Josh Boyer <jwboyer@kernel.org>
Cc:     Linux Firmware <linux-firmware@kernel.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Linux-arm Msm <linux-arm-msm@vger.kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>
Subject: Re: qcom: Switch SDM845 WLAN firmware
Message-ID: <20200102185502.GA78784@tuxbook-pro>
References: <20191227015530.GA3828441@builder>
 <CA+5PVA5tSbbVkrV8h35c50O5YO+LgUdqTdE=T-qU8JKs1-a06Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+5PVA5tSbbVkrV8h35c50O5YO+LgUdqTdE=T-qU8JKs1-a06Q@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 30 Dec 04:27 PST 2019, Josh Boyer wrote:

> On Thu, Dec 26, 2019 at 8:55 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > Hi,
> >
> > The recently committed wlan firmware found under ath10k/WCN3990 shows
> > better stability under load than the one present for SDM845. So this
> > replaces the current firmware with a symlink to the newly contributed
> > one.
> >
> > Regards,
> > Bjorn
> >
> > The following changes since commit 6871bffa79ed240696986837cfb17b272ff57466:
> >
> >   Merge branch 'ath10k-20191220' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware (2019-12-20 08:41:19 -0500)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/andersson/linux-firmware.git RB3-wlan-firmware-1387
> >
> > for you to fetch changes up to 4570585aad1009b84fe0d4d0677dd8d4c9956b42:
> >
> >   qcom: Switch SDM845 WLAN firmware (2019-12-26 17:47:56 -0800)
> >
> > ----------------------------------------------------------------
> > Bjorn Andersson (1):
> >       qcom: Switch SDM845 WLAN firmware
> >
> >  WHENCE                   |   1 -
> >  qcom/sdm845/wlanmdsp.mbn | Bin 3311964 -> 39 bytes
> >  2 files changed, 1 deletion(-)
> >  mode change 100644 => 120000 qcom/sdm845/wlanmdsp.mbn
> 
> This messes up WHENCE.  Either you want to use the Link: statement in
> WHENCE, or keep the File line if you're going to create a symlink
> manually.  The Link statement is preferred.  Can you redo?
> 

Sorry about that. I will respin this.

Regards,
Bjorn
