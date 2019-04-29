Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7135FE85A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2019 19:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbfD2RIA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Apr 2019 13:08:00 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:32870 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728825AbfD2RIA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Apr 2019 13:08:00 -0400
Received: by mail-lj1-f196.google.com with SMTP id f23so10115810ljc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2019 10:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2EDG9k5xBQAGPzW9mILcB9aaLrz/g8zmiYqG801xB04=;
        b=chBQj3LqwpyRfrDGZZUK/NhBlvLES/7qXRe0aVFfWbvXa3HyWXxkyJdCuQTDZWCoW2
         jPo711Kpt31bEepvNEvNwiCBYrt2mRAD5YlyZ7bfyqchK399ztsMPj7ZBLIgORfGa004
         wT+W6hGcvd/5CdFUTxR/xmyRkEB1XVsjhKSmnMTibK7mfUvb/G6ANACb6Gp+aq0Q4w6s
         NGBXcXkcXLa6q4m3wB9Tk9pn61PzAOSE94jOR+NwwMcj/vCxWoveheLsCjDgBAb6xfTm
         VAIlL7LD+tkBkaTd26We/uEJZbg7WCZMlzhXK+4Uc5GxHOLTBUy9Pxd2Hfmmqr7RmQqR
         3hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2EDG9k5xBQAGPzW9mILcB9aaLrz/g8zmiYqG801xB04=;
        b=ZhGbjYjvNTAuCfHYZFDyXooiBSkj+XIHBEaYcASKZiK98WY9ytAYzvwi0l9AraRzTu
         jg3R2WJgRQKOq9/6eeCopPJ5GTcIiXIEFqxZJ1uALsI42o/OrjEI/zknqVDzzz+8V/pr
         OZc0LgU2lMQXoC5v/i1MNQ8iZte6FgWesW9C33wenm7E/AC/l/X1u/PYZiY0KY8VqXGl
         iX3Al8xXCGUGfokKTO70hQvbg67Il1K1jWGmxGIktDzRLwAC3+z3e2FjCNFuBE+TYCwV
         RUMSjQMdy+n2aEHhuuNOxiwyXMMTDVX82p4oV2yLsa1jsBEJ+hhxE0eV7L48P8TFkES2
         rcCA==
X-Gm-Message-State: APjAAAUzAXnN/H9O0iaEn78veMShhW3aaaGy0FM9QF0jiFkt7KkWJFiD
        lAF9rJDnAGHpn+NUNLdlvZHUsQ==
X-Google-Smtp-Source: APXvYqwUiXD9zCibVIqba58oL91cYaoY0R9OWiUUA9jlop4hK7X5i9mDSoSvs7S/S/rHIClFsnHUVQ==
X-Received: by 2002:a05:651c:d0:: with SMTP id 16mr33036533ljr.150.1556557678221;
        Mon, 29 Apr 2019 10:07:58 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id v24sm741007lje.31.2019.04.29.10.07.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 10:07:57 -0700 (PDT)
Date:   Mon, 29 Apr 2019 09:41:13 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Andy Gross <andygro@gmail.com>
Cc:     arm@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm Driver updates for 5.2
Message-ID: <20190429164113.ndyyomqy44hpjjzy@localhost>
References: <1555997248-11513-1-git-send-email-agross@kernel.org>
 <1555997248-11513-4-git-send-email-agross@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1555997248-11513-4-git-send-email-agross@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 23, 2019 at 12:27:27AM -0500, Andy Gross wrote:
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git tags/qcom-drivers-for-5.2
> 
> for you to fetch changes up to 2616b3deaf9c5db18f78689968d4c998bda8a983:
> 
>   MAINTAINERS: Update email for Qualcomm SoC maintainer (2019-04-18 23:27:29 -0500)
> 
> ----------------------------------------------------------------
> Qualcomm ARM Based Driver Updates for v5.2
> 
> * Update MAINTAINERS for Andy Gross's new email address
> * Add support for mmap in RMTFS
> * Fixup for QMI to change txn wait to non-interruptible
> * Fixup for error code in probe of cmd-db
> * Fixup for slot number check in RMPH-RSC

Merged, thanks.


-Olof
