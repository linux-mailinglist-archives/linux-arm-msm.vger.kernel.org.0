Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04150FE5CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 20:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbfKOTll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 14:41:41 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:36498 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbfKOTlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 14:41:40 -0500
Received: by mail-pj1-f68.google.com with SMTP id cq11so130286pjb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 11:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=8k/Rpm0GwxthXH5gCeA9lJZ+fXztebJcMOm1koH9MS0=;
        b=Ynnju9j25BnTwhUIaGaCtuSU/cb/NDAogzyrwSJRdGJy7AXareoVyTX4zshl6mtHR1
         qZvrhWJgmPV+rZUwqFMql0uI2H4t3CyTDjlZdA9dyt/j7Mg3P1tkbVmDy7LixSvqcoNM
         TLcifOzlMCJsj2Gmi+398a12LmilMx3cDDVR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=8k/Rpm0GwxthXH5gCeA9lJZ+fXztebJcMOm1koH9MS0=;
        b=ORX/Zkc12riN90tLVDqjFWzNKyy2rRP+CE1u6Aos5TW1WrHrl9yEJDdcME/GRNyvZt
         B7FV1gDS4kpwLVs3JYkV4K4IAAWyE2a7GSi2Dj8keltXqLG9JRrVJz3Rcrx7XuaIjUc9
         W4R1Zq8cVsB2hHLQNowVtaCZ7ZbnDSuNcGk1WNJoQsd4zdol4SZEPA8ASbcuRyiYW5iu
         uKuII3vb07MuJbOE8o9Oa5Cb9J9yYvL74Ybirz5AKfxDsendv6LSblUX/RKl6/gjQ/kw
         lz+Km7SLtK6oiL7EkrXBCZnUtzaZfK16h0j6D9vfjwqRtS2PhHEKRllYTfDnIS7ss9sw
         rOVA==
X-Gm-Message-State: APjAAAUoQeodTUJUtCEpJIUSv/WV4CfTcdrU1r7VlbwoZr3hrroHH1sr
        V9oSahO+u/XzCLLQZu/lKfxLjAdNIFI=
X-Google-Smtp-Source: APXvYqzVa+BgSbzX25GdWSjE4pYYjgH8+F18GtAt3SxUT/YtilbXuea0jzEPNAepKdB0bAAGaN3+bw==
X-Received: by 2002:a17:902:a70b:: with SMTP id w11mr15416536plq.27.1573846900036;
        Fri, 15 Nov 2019 11:41:40 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u7sm9468495pjx.19.2019.11.15.11.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:41:39 -0800 (PST)
Message-ID: <5dceff73.1c69fb81.e286f.aa4e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <55a02d0f-2dec-2ba7-82e6-f21a8c86792a@codeaurora.org>
References: <1573642136-30488-1-git-send-email-akashast@codeaurora.org> <5dcd919d.1c69fb81.1c304.2dc5@mx.google.com> <55a02d0f-2dec-2ba7-82e6-f21a8c86792a@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, msavaliy@codeaurora.org
To:     Akash Asthana <akashast@codeaurora.org>, gregkh@linuxfoundation.org
Subject: Re: [PATCH v5 2/3] tty: serial: qcom_geni_serial: Wakeup over UART RX
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:41:38 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2019-11-15 02:00:44)
>=20
> On 11/14/2019 11:10 PM, Stephen Boyd wrote:
> > Quoting Akash Asthana (2019-11-13 02:48:56)
> >> Add system wakeup capability over UART RX line for wakeup capable UART.
> >> When system is suspended, RX line act as an interrupt to wakeup system
> >> for any communication requests from peer.
> > How does the RX line get remuxed as a GPIO interrupt here? Is that
> > through some pinctrl magic in DT or just via enabling/disabling the
> > interrupt?
> Yes, For wakeup capable UART node, we have registered UART RX line with=20
> TLMM interrupt controller in DT file . Example: if GPIO48 is UART RX line
>=20
> interrupts-extended =3D=C2=A0 <&intc GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>,=C2=
=A0 <&tlmm=20
> 48 IRQ_TYPE_EDGE_FALLING>;

Right. So is gpio48 muxed as 'uart' function forever and the interrupt
logic in tlmm is connected to that pad regardless of the function
selected? I thought that gpios through TLMM had to be muxed as function
0, i.e. gpio function, so that interrupts worked. But maybe that's wrong
and it can work without that.

