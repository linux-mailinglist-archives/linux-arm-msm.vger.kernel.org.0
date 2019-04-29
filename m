Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79EECE858
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2019 19:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbfD2RH6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Apr 2019 13:07:58 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44980 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728825AbfD2RH6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Apr 2019 13:07:58 -0400
Received: by mail-lj1-f196.google.com with SMTP id c6so3563431lji.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2019 10:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PdCYTkykEbqNyJUv1QhMsSVMEq6usPhaqqUWwuxAvtk=;
        b=VDhrs3Nfh4iuNIDLF1qiTWsjAPiReNTNGFsNLTNvNrrVEDbNQLgJhxYYDAFHOKJeKV
         He21gd1pMsKWqLM9cUgNXLQZBIaBGEKp45I3QfzJqnadyk+qfCTuxI3/PwkmgWQEqe+Z
         5BU4K/dLm1l1+PwIEjZDZFUnK42Knd1LvZeQ32KdIozO+yDqDaIJ/rw/apsn8gb3psfK
         ASt7x51wH0aF7rXWm/83Pdfp3QQqQ6wk9PYC4mqmlT9PFx5WtFVTfys/xPWiiL//tTL7
         zxrzdQCjz6TFiEgDTRSpOmqrrkL6OsAEDPLU4jI5SyoYn+HWZYFFhe4ewdix9fjVu3NX
         p0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PdCYTkykEbqNyJUv1QhMsSVMEq6usPhaqqUWwuxAvtk=;
        b=aNNIpwS4ic1EMhfQMbkGD58acLerCgS7f4/DLzv/ZrG8y3xoKfuPyhWZlCDOFbYOdg
         F5dO+KPmKMPkcdywylEaVZfFGpdIPCGFcJMQryGKtbq0M5ZNYy9AJ2HrNP7JhO2F+ERl
         u87uzuoQOTaYL4Qru5GFIDkoeiyB84QAI0yQN9ztolv9Z7tjLvvQdOsq1BjUeZynw7he
         eKtPiLDPP5FNDapiZox/uJK5MTing2K0bofrf+Ogrtv5dFQWHe8swz9OldT4Yb7/bICR
         ipFhNpCT/8lMGVKbSUwYrMy2eDD+0tFSgK7jm77rfnYjILvn2fWsabhkipPlbEgR1t6t
         gQfA==
X-Gm-Message-State: APjAAAX/dvnSiplWoLSUl2wLFQcdRbJ2kpI7bzOB1Zk+9SdWJ5Z5+Oxe
        uk8X58Iv1kidOdEj1X11NCmWQJsCcdp33w==
X-Google-Smtp-Source: APXvYqyF+pfhsIvgx5JUYt0POFgwIJ+EfQKp7BSeq5gszV06NSv1t4yY4ty+LhSovVi6jTTJo3fbDA==
X-Received: by 2002:a2e:884a:: with SMTP id z10mr23642105ljj.21.1556557676125;
        Mon, 29 Apr 2019 10:07:56 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id b78sm7433376lfg.38.2019.04.29.10.07.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 10:07:54 -0700 (PDT)
Date:   Mon, 29 Apr 2019 09:40:14 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Andy Gross <andygro@gmail.com>
Cc:     arm@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm Defconfig updates for 5.2
Message-ID: <20190429164014.5fbrpws6o2k4xvpn@localhost>
References: <1555997248-11513-1-git-send-email-agross@kernel.org>
 <1555997248-11513-3-git-send-email-agross@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1555997248-11513-3-git-send-email-agross@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 23, 2019 at 12:27:26AM -0500, Andy Gross wrote:
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git tags/qcom-defconfig-for-5.2
> 
> for you to fetch changes up to acd92c5a11493bdf137aba6e21e865331d7d90d7:
> 
>   ARM: qcom_defconfig: add options for LG Nexus 5 phone (2019-04-09 22:37:39 -0500)
> 
> ----------------------------------------------------------------
> Qualcomm ARM Based defconfig Updates for v5.2
> 
> * Enable options for LG Nexus 5 phone

Merged, thanks.


-Olof
