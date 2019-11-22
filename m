Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA98A107742
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 19:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbfKVSYU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 13:24:20 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41004 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbfKVSYT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 13:24:19 -0500
Received: by mail-pg1-f194.google.com with SMTP id 207so3689186pge.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2019 10:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=7hJrD72iS4CTV/eqPsnjwRrd+DhYn98Uq27ZJW54QGw=;
        b=jVNkUXPD5bIky3irD3XcBYEQIK7JcGj0S/ZADQDIQbgMGmjfzDAhNSuX0UiNNGxXVp
         easfSnO5urLLc4lWAyEwRtQZ5asuP8eWlxh6XA92LJWPOtkoRcd0BG3dT7JpZtbVWrIT
         v6sFK7x/kCmw9pHEnTnBto9MzcJKku7jB8Ay0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=7hJrD72iS4CTV/eqPsnjwRrd+DhYn98Uq27ZJW54QGw=;
        b=VgmQBp88YMzNQqvpVft3u9M3HLVSBazdTZQlXhHCdsJ5EWbfZADcZIEmVUm9aha9i6
         kK1rNAdVAFgikEdrUi/BZCFgTreGlfcQ8SXGhw6qyPHeXLVNaRp0NWy2FGIJoCQsSMWu
         HoDhhRadKCKGXz/baHpJ66jJuRJP/y15IEePsCNCEaMzGVBQcyv0YGloRG/UU79PWQjh
         qiLTtJzYxeHf0ayUI2APQgL0tB30yx7QdCzwaQx9ZHqKqo7Sd/PD0/S5fyCBmUjm/8Yd
         xld3aW6Miwvkw4NyfQ03Q9BRhKRvoxmy0DB5wBxvR6OtF97eOaSLbvX7cMQWbJF2E46H
         4Yhw==
X-Gm-Message-State: APjAAAV/z/yC3iiuaDJgaxfRP95w84KqLg8iY+RIk/nTLP3n/0IKlTJK
        K545wbIx8T+WPq9hC4LxiGGa6Lag4b4=
X-Google-Smtp-Source: APXvYqwCGkNyOf7R8AA7Mp1x3NFIKX+iqD3uwFFsfJ7BP7zudBzdBbCdOkwtqqovQITmU05HGDrOgw==
X-Received: by 2002:aa7:870c:: with SMTP id b12mr19227631pfo.30.1574447058874;
        Fri, 22 Nov 2019 10:24:18 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id n8sm7183258pgs.44.2019.11.22.10.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 10:24:18 -0800 (PST)
Message-ID: <5dd827d2.1c69fb81.51ab0.220e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016e91dcbb45-f54cf6e5-8ace-457a-96cc-edec41305719-000000@us-west-2.amazonses.com>
References: <1573642136-30488-1-git-send-email-akashast@codeaurora.org> <5dcd919d.1c69fb81.1c304.2dc5@mx.google.com> <55a02d0f-2dec-2ba7-82e6-f21a8c86792a@codeaurora.org> <5dceff73.1c69fb81.e286f.aa4e@mx.google.com> <0101016e91dcbb45-f54cf6e5-8ace-457a-96cc-edec41305719-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH v5 2/3] tty: serial: qcom_geni_serial: Wakeup over UART RX
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, msavaliy@codeaurora.org
To:     Akash Asthana <akashast@codeaurora.org>, gregkh@linuxfoundation.org
User-Agent: alot/0.8.1
Date:   Fri, 22 Nov 2019 10:24:17 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2019-11-21 22:46:32)
>=20
> On 11/16/2019 1:11 AM, Stephen Boyd wrote:
> > Quoting Akash Asthana (2019-11-15 02:00:44)
> >> On 11/14/2019 11:10 PM, Stephen Boyd wrote:
> >>> Quoting Akash Asthana (2019-11-13 02:48:56)
> >>>> Add system wakeup capability over UART RX line for wakeup capable UA=
RT.
> >>>> When system is suspended, RX line act as an interrupt to wakeup syst=
em
> >>>> for any communication requests from peer.
> >>> How does the RX line get remuxed as a GPIO interrupt here? Is that
> >>> through some pinctrl magic in DT or just via enabling/disabling the
> >>> interrupt?
> >> Yes, For wakeup capable UART node, we have registered UART RX line with
> >> TLMM interrupt controller in DT file . Example: if GPIO48 is UART RX l=
ine
> >>
> >> interrupts-extended =3D=C2=A0 <&intc GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>,=
=C2=A0 <&tlmm
> >> 48 IRQ_TYPE_EDGE_FALLING>;
> > Right. So is gpio48 muxed as 'uart' function forever and the interrupt
> > logic in tlmm is connected to that pad regardless of the function
> > selected? I thought that gpios through TLMM had to be muxed as function
> > 0, i.e. gpio function, so that interrupts worked. But maybe that's wrong
> > and it can work without that.
>=20
> Yes, gpio48 is muxed as "uart' function function forever. There is no=20
> need to mux gpio48 to
>=20
> gpio function, interrupts can work without that.
>=20

Ok thanks for confirming.

