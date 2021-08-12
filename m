Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE80B3EA5B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 15:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236152AbhHLNat (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 09:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbhHLNas (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 09:30:48 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601FCC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 06:30:23 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d1so7310684pll.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 06:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=pN8gn6XDJx8X4O5FCMjgKbbXidE6R/vdaeWWGFTiI50=;
        b=zueqilLqDz8ee1JyiPaJSWJglZoALSJFcmYT8Yc9pyvtcVQQ1OQOSMqgc6v6kDad6q
         9Aw5bD2xsoas6IoQ8l/Va0qJgIUbO4J94GjDass8cA/d1Gd3RPXgVraKac2ArwdGj6Tm
         TM6XzJ5zTQ5RuH8XDmFbtLeB3ZmvWaKsK0chys3KMauQr3ux86r9paNi5MgC4MDXR+Td
         TBpgbrw7hDCdSsNe36K6AtoririIxUOh7Bw2yp3Yf6PqXSNRVUujLZujc8sFnhc9gsU9
         IZAXViUL5Q9esWTtoEqCznYDFth039XhtGSTxfpGswqgL2cc0sBSvQcwgp//AxY8h3S1
         APlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=pN8gn6XDJx8X4O5FCMjgKbbXidE6R/vdaeWWGFTiI50=;
        b=XgquoRGK3kJoNStpSoHyItujKrnPA7ubhw9SgW1WuqCKA0f2iEJkIBZmNjOlD6dZkc
         IEWRzmr+VpCIl90s8MHfE79n0Z3OeYkApaFthLMtEwihAW92oTsLk/NPL5XBwK1vxVdh
         YjlYB5rUw1h+s2KNRq1ghT1IwXiikIEiDuTkFxKcaTMYxhsQ+rAn/XOFhx1aT1YZPpdz
         Bd7jQeAQKUDxtcKXePgfEMpMYgdG8+IzfFm15A6Ajae/5hzSUvTOarvgviVQqYu639zO
         LXIn26DYAughYz18gLS3B23Ha5QznHDD7k0Adbvh5KbGieFoZV8mAJWLgX1WHTg4q2yf
         ofGQ==
X-Gm-Message-State: AOAM533qJo8CCC8BcTA1jRfHjD11WbJ3Gp/VGHS+2oGwE+XJi1a8W8G2
        yW+TX9XZLCYqgVOwxQxId22f
X-Google-Smtp-Source: ABdhPJyXnJ7FAdR0bmSAQM2pPs0oaZ4uhdYDU1t6xU5Hn+jp3ax4FRGvd3Y8kv7FbShfz3C/zlQQcw==
X-Received: by 2002:a62:878a:0:b029:3e0:7810:ec36 with SMTP id i132-20020a62878a0000b02903e07810ec36mr4181500pfe.4.1628775022859;
        Thu, 12 Aug 2021 06:30:22 -0700 (PDT)
Received: from workstation ([120.138.12.52])
        by smtp.gmail.com with ESMTPSA id 136sm3872129pge.77.2021.08.12.06.30.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 06:30:22 -0700 (PDT)
Date:   Thu, 12 Aug 2021 19:00:19 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     netdev@vger.kernel.org, richard.laing@alliedtelesis.co.nz,
        linux-arm-msm@vger.kernel.org
Subject: Conflict between char-misc and netdev
Message-ID: <20210812133019.GA7897@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jakub, Dave,

Due to the below commit in netdev there is a conflict between char-misc
and netdev trees:

5c2c85315948 ("bus: mhi: pci-generic: configurable network interface MRU")

Jakub, I noticed that you fixed the conflict locally in netdev:

d2e11fd2b7fc ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net")

But the commit touches the MHI bus and it should've been merged into mhi
tree then it goes via char-misc. It was unfortunate that neither
linux-arm-msm nor me were CCed to the patch :/

Could you please revert the commit?

Thanks,
Mani
