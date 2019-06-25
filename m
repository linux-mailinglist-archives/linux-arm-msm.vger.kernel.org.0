Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F60754FB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 15:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbfFYNEr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 09:04:47 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45957 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbfFYNEq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 09:04:46 -0400
Received: by mail-lf1-f67.google.com with SMTP id u10so12537037lfm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 06:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SkIP1Ns/Y5prHiRXSKOl6nfuFJ5KWOIdmaB8jjTi1a0=;
        b=Yz05q08zexz2WZjPSmGEyWM1G9IhrfhM+zh8+mkSmkspddKQRJbxgp1i7ltWsAJ5sr
         Y9qHqMbHCYCMUH+AQzpTVnnTuTJ7NFWMIpUM3EXW+6ceVVOYJUjaX3Fe35/ibYaJE621
         YD8ZbomhMjrb2cB37SXIXW8OdGkNvjKngl/y+WpLENnkXd5lFht2Siz/yMhzy+fuInRS
         P7nFkLVUYCvw6oKlqiYz2mJ3VH50VmnJpsJGWC0RirNskWJ0WDdWUrsrS6XjqoXaFy8X
         X2vwOpQjKTfkm5zWzH44sR6HqBXLgxmeh+z4TIZgm4R59tP0xXIaCm5WtW9uWQ2yb3Lg
         30JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SkIP1Ns/Y5prHiRXSKOl6nfuFJ5KWOIdmaB8jjTi1a0=;
        b=GKPhTnlB1InR/HUYrIKJipvoZifAKbP5NKI4G/Y0J95lo9vqX2yhOqyIDn2wcC84oF
         GYJuZusucFQ0yRx/r8c8WUobZr8K7yt78ZA7WS4wM3LOJa9a+McjiWFASd3I7q+vCTyx
         H/vc2A+B46Xz7C0Fr8WOu3J/gg3rxNsrgCLB5Bve+iAY6+b30Zm9bxEDTw/igvPVZi/j
         ZIkLy9e7bobfpns8SDvujXBKA/KDLlO7vC/gLvdFaMMda2L5X1OKjNBO5PB1hf5JnYmN
         JSyNcDbNVawDoNuNlR3pxX6BAxT28pcoR7PymAwL5+Lnf4dmHMNVMiTkdvVmZPyiPGdF
         siPQ==
X-Gm-Message-State: APjAAAV14f05LOrsfXbe2XWTk2THyqodwJAC4BhzMJtF3l+Ltn6naoUa
        ggsjFOgqvFH3NoyIpILJV5PuSA==
X-Google-Smtp-Source: APXvYqyVBWyzgNJILfF8DnfM865TQamTzMVtVsYXAsBFiqrxt6gDX1Yd4oq9OHe5GuhqCbiRB9x6eQ==
X-Received: by 2002:ac2:528e:: with SMTP id q14mr48950722lfm.17.1561467884239;
        Tue, 25 Jun 2019 06:04:44 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id y15sm1970137lfg.43.2019.06.25.06.04.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 06:04:43 -0700 (PDT)
Date:   Tue, 25 Jun 2019 05:40:43 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Andy Gross <agross@kernel.org>
Cc:     arm@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Qualcomm Driver updates for 5.3
Message-ID: <20190625124043.kichvu5nidvevyox@localhost>
References: <1561006911-28519-1-git-send-email-agross@kernel.org>
 <1561006911-28519-3-git-send-email-agross@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561006911-28519-3-git-send-email-agross@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 20, 2019 at 12:01:50AM -0500, Andy Gross wrote:
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.3
> 
> for you to fetch changes up to e1068c32c1d413eaf8818ac10497817af9d2f231:
> 
>   soc: qcom: geni: Add support for ACPI (2019-06-19 01:03:24 -0500)
> 
> ----------------------------------------------------------------
> Qualcomm ARM Based Driver Updates for v5.3
> 
> * Add ACPI support to Qualcomm GENI SE
> * Update Qualcomm Maintainers entry to remove David Brown as maintainer and
>   fixup typos and incorrect DT file entry
> * Fixup APR domain id usage and making callbacks in non-atomic context
> * Add AOSS QMP driver and bindings
> * Add power domains for MSM8998 and QCS404 in QCOM RPMPD
> * Add corner macros, max state support, and fixups for setting performance state
>   for Qcom RPMPD

Merged, thanks!


-Olof
