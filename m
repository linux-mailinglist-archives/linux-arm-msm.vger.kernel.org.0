Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F26BFDC76A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 16:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405462AbfJROdc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 10:33:32 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33428 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729584AbfJROdb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 10:33:31 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so4038188pfl.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 07:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=9FdeX//RORLUFpjlpqzmkWcuma9KNw3Y4e/bxxikMGs=;
        b=mgZQm0sR8WKQrmUO/Ec704rT1C8wtIciVL2b+nWpl29cgS7J33UQ+t7jNOVMR6jF+U
         HWGLTBl6M8wNDuU43rK33SZdn5y+IWVauGkxXFYBzcNcsiN5dQzXV/G31uWt17CosPZZ
         0eGrFDR6iOrxg05bdnB8FmUzVEDvTXB2AZ19c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=9FdeX//RORLUFpjlpqzmkWcuma9KNw3Y4e/bxxikMGs=;
        b=Ilm+34L3l8NTm7nLELIGr5jfGq2t+lv5Wzbirz+PSgRqhyZVJVfD5KxMYPlilnstnp
         /YdoCs9ssoNSSeT8/0x/v7PXLAb9CeO9SE5ehVk8Pu0vVWXEjI6picg2NeI1ebxzrqRb
         ttOiWLq9PhyVqWfzUWVICpcWoPMOgITMwk6c1sXTYH3ER6VpMjulGEux9fgAIApH85T2
         iT6DG18DXD+CEK4vsGCtGw7ywd8DvxMw3o9Ryp9PJlb2qmwD5RTX05S62t/GB3ccMIbS
         hhlahpnfiJNvugUTu8MovC1IUESFekOFcwV7GACWA61qE3HXGa3kTAHZ78LsN+3TTcEl
         aNmw==
X-Gm-Message-State: APjAAAUwxjTM5LHbNwjETH7yCZ0DBiqzth06496l26FSSt9R2hIJRLah
        ZEYJqikMapBQu7KTp2gTOQjyYQ==
X-Google-Smtp-Source: APXvYqxSlXq4d41beIN21IYEkdivZabzNQu+TLotvUAaXFaTv2YNZH6ZxASkgzaeHk7uRZoKe62kbQ==
X-Received: by 2002:a62:685:: with SMTP id 127mr7241020pfg.227.1571409211238;
        Fri, 18 Oct 2019 07:33:31 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y22sm5468041pjn.12.2019.10.18.07.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 07:33:30 -0700 (PDT)
Message-ID: <5da9cd3a.1c69fb81.95e9.e5e2@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c9285391dbbe936d3f242bdd0d226b93@www.loen.fr>
References: <b3606e76af42f7ecf65b1bfc2a5ed30a@codeaurora.org> <20191011105010.GA29364@lakrids.cambridge.arm.com> <7910f428bd96834c15fb56262f3c10f8@codeaurora.org> <20191011143442.515659f4@why> <ac7599b30461d6a814e4f36d68bba6c2@codeaurora.org> <5da8c868.1c69fb81.ae709.97ff@mx.google.com> <c9285391dbbe936d3f242bdd0d226b93@www.loen.fr>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>, rnayak@codeaurora.org,
        suzuki.poulose@arm.com, catalin.marinas@arm.com,
        linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>,
        linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        andrew.murray@arm.com, will@kernel.org, dave.martin@arm.com,
        linux-arm-kernel@lists.infradead.org, marc.w.gonzalez@free.fr
Subject: Re: Relax CPU features sanity checking on heterogeneous architectures
User-Agent: alot/0.8.1
Date:   Fri, 18 Oct 2019 07:33:29 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marc Zyngier (2019-10-18 00:20:56)
>=20
> If this SoC is anythinig like SM8150, 32bit guests will be hit and=20
> miss,
> depending on the CPU your guest runs on, or is migrated to. We need to
> either drop capabilities from the 32bit-capable CPU, or prevent the
> non-32bit capable CPU from booting if a 32bit guest has been started.
>=20
> You just have to hope that the kernel is entered at EL2, and that QC's
> "value add" has been moved somewhere else...
>=20

Ok that's good.

