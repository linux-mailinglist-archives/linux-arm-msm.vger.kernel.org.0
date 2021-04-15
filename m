Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D0E360848
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 13:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbhDOLbY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 07:31:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:58900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230056AbhDOLbX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 07:31:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66B8C6137D;
        Thu, 15 Apr 2021 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618486260;
        bh=Dr2lGuR8qHZKp8LoybEv8NF8Co6n9ghuliTR0MC0qPk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=a6EhODBbKezLja2kFil1yXkN1dtnNod/wmAn2YPdQO+mY1+K3oP9lo6O48utRiaok
         mAI5G0O70pPnhYh6bfSHBLVJ6bvQb9oeyJHL0KhHeZXpr0p19j0VnoJYOtJ1Ho/bk2
         Cj241a/APXs838pmyUxnlJlAlNGH+Wss+xLWxchv1wbvzaJDboWxOwCBB8lU2hgvoh
         il4PsQsQ2crNzyn3nPdlaw8sUOb7tnrO1vbIfmupFFv6/wAi9AlrDlwtX2VC20eeYy
         g6piBxswn2qjazojf56Vi0GBs8+31Cyr/gxUdo/DPYZ5PuHQbR9qCOSZdICMh0jStL
         whUARLHhBYBoQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Caleb Connolly <caleb@connolly.tech>,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH] arm64: boot: dts: qcom: sm8150: add SPI nodes
In-Reply-To: <CAA8EJprdHtxdXCd9dxOi4ZNGoE1r+O9Man6pXJWib+Rrpp9_-g@mail.gmail.com>
References: <20210415103854.1810788-1-balbi@kernel.org>
 <CAA8EJpqT-yJwd7D-zzOem5Zj--LbiyjbXB5zt23F7RLfeZhAag@mail.gmail.com>
 <87blafolp5.fsf@kernel.org>
 <CAA8EJprdHtxdXCd9dxOi4ZNGoE1r+O9Man6pXJWib+Rrpp9_-g@mail.gmail.com>
Date:   Thu, 15 Apr 2021 14:30:52 +0300
Message-ID: <878s5jokcz.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Thu, 15 Apr 2021 at 14:02, Felipe Balbi <balbi@kernel.org> wrote:
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> > On Thu, 15 Apr 2021 at 13:39, Felipe Balbi <balbi@kernel.org> wrote:
>> >>
>> >> From: Felipe Balbi <felipe.balbi@microsoft.com>
>> >>
>> >> Add missing SPI nodes for SM8150.
>> >>
>> >> Signed-off-by: Felipe Balbi <felipe.balbi@microsoft.com>
>> >
>> > I'd suggest switching to gpio-cs as implemented for sc7180 and sm8250.
>> > At least I'd propose to split the pinctrl into data+clock and CS
>> > configurations, so that the CS implementation can be easily selected
>> > on the board level.
>>
>> I can do that, sure. What do we gain from it, though? The possibility of
>> using more chip selects? It also sounds to me like this could be done as
>> a separate patch.
>
> I'd refer to the original discussion for sc7180:
> https://lore.kernel.org/linux-arm-msm/20200624170746.1.I997a428f58ef9d48b=
37a27a028360f34e66c00ec@changeid/

Thanks, an interesting discussion indeed. I'll wait for more reviews, if
the rest of folks think we should have the option, I can send an extra
patch or modify $subject. No worries.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmB4I+wRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYF0w/+KKJYNMEuFMo1p8J8oDA7v8vu1gm7TD/v
znvriatBruxdH1lhb+IX7PfdgpYUHSP4Sr7iMoXIDrRQNV3uUs77Oe7n2uhqGDPB
8a6cSllhFjK0CdERhTfa0MTCEPMP6PoMR5SswjYV2rWHCKVdoTu2zzT4dG6dV0iK
6Dv5Lwl8RQoZGdzVzkkfveaBVvOpHtzVVs8rwjgH7Pnbjq7C+qxoRXTPpgoSXnsJ
apdpC+852oj5CFij9h4j2bIo2zXqCyIbsjf6l49jBfLSyQb93+7sszMkIPFjH9yF
XpYmbRnamjTGLUs94esutbQdOFyljhl2uiAMMVPnZ4QmZq6IKjJGKIBu+JMQ3QbF
aVsxYbGLydZWOj+B3wu9g2GkITKnUUjvQwx9jQ3xls4SrRTHxg735xg6dbXPZFtM
u7r2eGlQMtEnoRWgKMbm/4b+byqFiq+2NmFNzWvz/O5pWV48KZd1tYzDhkRw192w
S/1Hbn01wozOQQb3JxiMiUF/x/ECcGqAf/13zScUWtUoDvo5/bmEYMdv2ZbY7DY1
lSYVVCidE6/yS2kGTUo/mpIoyDMg/sGoi9hzt4uW+fKGm3fmN8PIJlyJAKJg/jHW
f7AIIF5aFdp31skjN1Ri/0ufmUUORlzgjZePNiLGK09Y+mCtkj7Cc1sB3R9ZwIRe
y1UzHsPZQbQ=
=7K1V
-----END PGP SIGNATURE-----
--=-=-=--
