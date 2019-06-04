Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3445C34E0B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2019 18:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbfFDQyh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 12:54:37 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43573 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727663AbfFDQyh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 12:54:37 -0400
Received: by mail-pf1-f195.google.com with SMTP id i189so1040408pfg.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 09:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=gsZInba9qrm7ODb1Yq1UhqmbBbAzbVjS4lLusubD2Ls=;
        b=LswJWZfy0lu8/m4EY2hN5vUBYjLbzIT/pf+JSF0lQ6U9Y9NIEvJa6+GFHY9rgaj8qi
         qU4lFztnpLWhlZy9grrENap6Snf4V/1jQk0ZHyBIEqqGQ7BxCKyacYn5gvRSp6IiOTa/
         u10YwlK6hJfJNh2+Vb2RSJ5qHGVtCqk6ZBheE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=gsZInba9qrm7ODb1Yq1UhqmbBbAzbVjS4lLusubD2Ls=;
        b=fJSBgUHVKIamnM/4x2ZrjvlYjwa4umEwCP7aHCh48AF4EZx70LsWnz8EJXzpkd/4QV
         oGS2M7lcrQQNJ8qaAAHuyOYs+OlqYy2qAPWKwOu8jDVADBGNN/ZcwkFRfUscbsR7MyyC
         0FIVHru5H7QjkDvzo3DfKdVAi3cGa5fAPMFUaF4DA97YarkAVW1FSyd0lT6/duSDKsko
         dgPO5LToras4PJmiWk4bMMdLlIcDHbIMWl24aYFgg+vbZ4xZT/BB7nX0JaiwLLr+bYyR
         dJJPA3Hdet0dtWEng6UOj8nhcLRGTSl1vlsjR74n5XTWD5/OWHV6sD7fqzCtf3LbfeQp
         MExA==
X-Gm-Message-State: APjAAAW6NxfjLAM48UhvA6rP1Fb7XC8qSbwwlKGFGP38xTKRaTETVH6x
        3uLtHovPo813YlOu4kFVyxao8g==
X-Google-Smtp-Source: APXvYqw9pQz0rGAmcjPIXcqIkj2VDqLOxoPXUACeihkAkH8amjHnLXEgaHBbXE2DoKkgmbIh57yGoA==
X-Received: by 2002:a65:56cb:: with SMTP id w11mr36437881pgs.236.1559667277056;
        Tue, 04 Jun 2019 09:54:37 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g3sm22917280pfm.150.2019.06.04.09.54.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 09:54:36 -0700 (PDT)
Message-ID: <5cf6a24c.1c69fb81.c970e.907e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190603155612.GC63283@arrakis.emea.arm.com>
References: <20190517164746.110786-1-swboyd@chromium.org> <20190517164746.110786-5-swboyd@chromium.org> <20190603155612.GC63283@arrakis.emea.arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Dan Williams <dan.j.williams@intel.com>
To:     Catalin Marinas <catalin.marinas@arm.com>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [RFC/PATCH 4/5] arm64: Add support for arch_memremap_ro()
User-Agent: alot/0.8.1
Date:   Tue, 04 Jun 2019 09:54:35 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Catalin Marinas (2019-06-03 08:56:13)
> On Fri, May 17, 2019 at 09:47:45AM -0700, Stephen Boyd wrote:
> > Pass in PAGE_KERNEL_RO to the underlying IO mapping mechanism to get a
> > read-only mapping for the MEMREMAP_RO type of memory mappings that
> > memremap() supports.
> >=20
> > Cc: Evan Green <evgreen@chromium.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Will Deacon <will.deacon@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>=20
> Not sure what the plans are with this series but if you need an ack for
> arm64:
>=20
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks. I'll resend without the RFC tag and see how it goes.

