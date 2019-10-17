Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDC76DB817
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2019 22:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394533AbfJQUAm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 16:00:42 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35165 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394480AbfJQUAl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 16:00:41 -0400
Received: by mail-pg1-f193.google.com with SMTP id p30so1977207pgl.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2019 13:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=QIMZdUFoVDCCgi7u9KnfgFx2D+e8lBSYkgBbx8BMeec=;
        b=CcY6khg3q6nubSARTDJ5XR1igh/NxAZFgNsGtnScPCLDJ20bsPOxhJh8YD0Ifo1HK1
         UflIjODDTFl8CRWMZf1yBr9pBsZI/xNyhdGJtRt7j6N851Pii2fEu1phfhNvF5ERh0IY
         Zl7fuIIFWYgbudcD0dq4aT9k6ojiOfJJ6/w5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=QIMZdUFoVDCCgi7u9KnfgFx2D+e8lBSYkgBbx8BMeec=;
        b=fM2tl8OQe2bNi1QYFKKodc8Fsl+vn+fVlsPNwArYtprTeuKmY0ID2BN0ymcicTB87f
         48DHzdPpDQ/+QyqWMc0q0sw5JZuUnSGnOTxj9o2QsK8uZaSDz62B/uu8YodtMkQCya4D
         LPzIuHpEXAGy8lh5f9u5+AI091gKOVDBqqn89s3CIe6cwY+c/x9vTgWlGTKwS/HoRR2+
         rQVQoni1Q6UqGHjlQPavJWphWc0QkF37fFY/5Krs2p7Yp8kx2ym0aYlgscoWeFV+9hVa
         2TYMfBveQ9Jm3ET3tQMEaIovl/tkqrMZirGcoPAVfHbVUH96J7mqL/WB1R3XPV26Mz+X
         hhlQ==
X-Gm-Message-State: APjAAAVhLIiWW3o/7ytAxsWP7yYnQkAqmDg70hK4LZsQwMzC70JWVI3z
        LWtkz/GaDsCtnM8y0+/02+nKAQ==
X-Google-Smtp-Source: APXvYqxn4GjJKCMJ6/dMMs6TXVT3v+iRNGMNw4x8OnF002zaL0RZvbO7aIfYNtadR0MBs08MMHevpw==
X-Received: by 2002:a17:90a:5896:: with SMTP id j22mr6095736pji.55.1571342441026;
        Thu, 17 Oct 2019 13:00:41 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 74sm3834060pfy.78.2019.10.17.13.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:00:40 -0700 (PDT)
Message-ID: <5da8c868.1c69fb81.ae709.97ff@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ac7599b30461d6a814e4f36d68bba6c2@codeaurora.org>
References: <b3606e76af42f7ecf65b1bfc2a5ed30a@codeaurora.org> <20191011105010.GA29364@lakrids.cambridge.arm.com> <7910f428bd96834c15fb56262f3c10f8@codeaurora.org> <20191011143442.515659f4@why> <ac7599b30461d6a814e4f36d68bba6c2@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, rnayak@codeaurora.org,
        suzuki.poulose@arm.com, catalin.marinas@arm.com,
        linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>,
        linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        andrew.murray@arm.com, will@kernel.org, Dave.Martin@arm.com,
        linux-arm-kernel@lists.infradead.org, marc.w.gonzalez@free.fr
Subject: Re: Relax CPU features sanity checking on heterogeneous architectures
User-Agent: alot/0.8.1
Date:   Thu, 17 Oct 2019 13:00:39 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-10-11 06:40:13)
> On 2019-10-11 19:04, Marc Zyngier wrote:
> > On Fri, 11 Oct 2019 18:47:39 +0530
> > Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> wrote:
> >=20
> >> Hi Mark,
> >>=20
> >> Thanks a lot for the detailed explanations, I did have a look at all=20
> >> the variations before posting this.
> >>=20
> >> On 2019-10-11 16:20, Mark Rutland wrote:
> >> > Hi,
> >> >
> >> > On Fri, Oct 11, 2019 at 11:19:00AM +0530, Sai Prakash Ranjan wrote:
> >> >> On latest QCOM SoCs like SM8150 and SC7180 with big.LITTLE arch, be=
low
> >> >> warnings are observed during bootup of big cpu cores.
> >> >
> >> > For reference, which CPUs are in those SoCs?
> >> >
> >>=20
> >> SM8150 is based on Cortex-A55(little cores) and Cortex-A76(big cores).=
=20
> >> I'm afraid I cannot give details about SC7180 yet.
> >>=20
> >> >> SM8150:
> >> >> >> [    0.271177] CPU features: SANITY CHECK: Unexpected variation =
in
> >> >> SYS_ID_AA64PFR0_EL1. Boot CPU: 0x00000011112222, CPU4: >> 0x0000001=
1111112
> >> >
> >> > The differing fields are EL3, EL2, and EL1: the boot CPU supports
> >> > AArch64 and AArch32 at those exception levels, while the secondary o=
nly
> >> > supports AArch64.
> >> >
> >> > Do we handle this variation in KVM?
> >>=20
> >> We do not support KVM.
> >=20
> > Mainline does. You don't get to pick and choose what is supported or
> > not.
> >=20
>=20
> Ok thats good.
>=20

I want KVM on sc7180. How do I get it? Is something going to not work?

