Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4062CF35C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 18:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729792AbfKGRft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 12:35:49 -0500
Received: from anholt.net ([50.246.234.109]:45002 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729669AbfKGRft (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 12:35:49 -0500
X-Greylist: delayed 313 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Nov 2019 12:35:49 EST
Received: from localhost (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 6B2FA10017F9;
        Thu,  7 Nov 2019 09:30:35 -0800 (PST)
Received: from anholt.net ([127.0.0.1])
        by localhost (wales.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id HoZuJZOcm_Oi; Thu,  7 Nov 2019 09:30:35 -0800 (PST)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 5B22010010D4;
        Thu,  7 Nov 2019 09:30:35 -0800 (PST)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
        id 2C06A2FE2F98; Thu,  7 Nov 2019 09:30:53 -0800 (PST)
From:   Eric Anholt <eric@anholt.net>
To:     Rob Clark <robdclark@gmail.com>, Fritz Koenig <frkoenig@google.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/msm/dpu: Add UBWC support for RGB8888 formats
In-Reply-To: <CAF6AEGuXv+ePcGtuN2XTFazrMrtyCYMjZOvYn5CZ3bKE2UhVQg@mail.gmail.com>
References: <20191106232553.76553-1-frkoenig@google.com> <CAF6AEGuXv+ePcGtuN2XTFazrMrtyCYMjZOvYn5CZ3bKE2UhVQg@mail.gmail.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.3 (x86_64-pc-linux-gnu)
Date:   Thu, 07 Nov 2019 09:30:50 -0800
Message-ID: <87wocbiofp.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain

Rob Clark <robdclark@gmail.com> writes:

> On Wed, Nov 6, 2019 at 3:26 PM Fritz Koenig <frkoenig@google.com> wrote:
>>
>> Hardware only natively supports BGR8888 UBWC.
>> UBWC support for RGB8888 can be had by pretending
>> that the buffer is BGR.
>
> Just to expand, this aligns with how we handle RGB component order in
> mesa for tiled or tiled+ubwc.  If uncompressed to linear the component
> order is RGB, but in tiled or tiled+ubwc, the component order is
> always the hw "native" order (BGR) regardless of what the outside
> world thinks.  But that detail kinda doesn't matter, it's not like
> generic code is going to understand the tiled or tiled+ubwc format in
> the first place.. and code that does understand it, knows enough to
> know that tiled/tiled+ubwc is always in the native component order.
>
>> Signed-off-by: Fritz Koenig <frkoenig@google.com>
>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Seems like a reasonable workaround to me, and permissible by our fourcc
modifier rules ("you just have to have one way to address the pixels
given a fourcc and a modifier").

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl3EVMoACgkQtdYpNtH8
nuizTw/9FlTG19QgaCUdQ4TnHR4KS0aHUTewrapoe5LZ96DKl4JAKdkzdT7oGaWq
jIX26+6DpG6WF3VWqYBG1j9or0m+lZZGxAb548KpcDlW3N7HJh226acI12AGV1M4
GbiJKlsSosYtn1+OsvaXHQILN1+kBgoXbGrYq5FBIakAJ/E/lSp4r89U0mPAQu5H
OBooVqdOZTzE6wf2VAuxW/Wi7PUuHQ5ba1CkUJYj3/3uyyy+X7dKAhKuknTksnMQ
35PpPXB9qyt5DIC0j2DG4htxzvAIMzhy/WYw6KWqFKFkCqHCn9JfZQokob+VK2az
JXBosScS1tfx7+Rzdjk3ACzJXgjqRSPSKHkfclDRujXL0K2bDEdCl4Os68RyaFtn
0aiSpcdhTEMdxmP8vm3gUHrQSokHU1ZMGot6BvwSZO3WqT7BM3vGCIriWbGmvdbu
zGWuCxSE8LqTnDNBGAgvI8tNfYw0dO/E73J+ARCrq5dniqHrNAahXquZKQQSVKbX
zGIIpXamrlp6EXyeDu4ljxqKMo6FQFJUSMc9tKY9Us4KOAB2lgoSDwf9F5GYZk7+
113gqrWzUFEV1oQZnuHnYTF24J784uzoEwxjAD11C0+JQ1s9PTpe44As0iJiUiq7
D7e1pPWOBmpd1Ej5YrOalr7Qn7IUyPTVrahc9GPZ5377VYEoZdo=
=0F+3
-----END PGP SIGNATURE-----
--=-=-=--
