Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4623DB510
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 10:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhG3IcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 04:32:02 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:57456 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbhG3IcB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 04:32:01 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 33F531FDBB;
        Fri, 30 Jul 2021 08:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1627633916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4KNmGdX4j42EWGXTu1wwqwxtTy1FAmbC1xtjFG8i+0c=;
        b=yOdPofC7QezghZeA/7yBJ/KRwYqg7+cuQjIfkiLLuCHTEYVpssdzkmIU8qxTVE3LtA2t/D
        SLY/CIxEErwOWp1OjXbB5icay0WdRpVuLY++JQgOY91Xs9WEMjVY5Ah1yKgI6BD1axnmE0
        1NSChxIZGrg/k5h1yszTmUqVGMCePhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1627633916;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4KNmGdX4j42EWGXTu1wwqwxtTy1FAmbC1xtjFG8i+0c=;
        b=Dtbg4UOoXmeTHZKFxCCoSstCycJ0WH0xg3Hcc/AN9v2lFzINm/kNnG7sy5iri8E2X0mIaJ
        Hj9rBnDdXyarFyBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 846D31374D;
        Fri, 30 Jul 2021 08:31:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id gAv4Hvu4A2FNFAAAGKfGzw
        (envelope-from <tzimmermann@suse.de>); Fri, 30 Jul 2021 08:31:55 +0000
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
To:     Dan.Sneddon@microchip.com, sam@ravnborg.org
Cc:     daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, liviu.dudau@arm.com,
        brian.starkey@arm.com, bbrezillon@kernel.org,
        Nicolas.Ferre@microchip.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, stefan@agner.ch, alison.wang@nxp.com,
        patrik.r.jakobsson@gmail.com, anitha.chrisanthus@intel.com,
        robdclark@gmail.com, edmund.j.dea@intel.com, sean@poorly.run,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        jyri.sarha@iki.fi, tomba@kernel.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
 <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
 <YQGrMH36Udg3eKQY@ravnborg.org>
 <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
 <YQG5+/9lPexU3Dn3@ravnborg.org>
 <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>
 <YQMF8X7gwKE/c2/R@ravnborg.org>
 <38656c7b-d9ad-c704-515e-f56582742532@microchip.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5eaae583-3efb-837d-22b0-22369096400f@suse.de>
Date:   Fri, 30 Jul 2021 10:31:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <38656c7b-d9ad-c704-515e-f56582742532@microchip.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yjnFarRLUdaazA6150bDZXU8b5959ycDD"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yjnFarRLUdaazA6150bDZXU8b5959ycDD
Content-Type: multipart/mixed; boundary="p1nROP8ARC1uwryC8MEU3IPJXb5UTMgYH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan.Sneddon@microchip.com, sam@ravnborg.org
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 bbrezillon@kernel.org, Nicolas.Ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Message-ID: <5eaae583-3efb-837d-22b0-22369096400f@suse.de>
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
References: <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
 <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
 <YQGrMH36Udg3eKQY@ravnborg.org>
 <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
 <YQG5+/9lPexU3Dn3@ravnborg.org>
 <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>
 <YQMF8X7gwKE/c2/R@ravnborg.org>
 <38656c7b-d9ad-c704-515e-f56582742532@microchip.com>
In-Reply-To: <38656c7b-d9ad-c704-515e-f56582742532@microchip.com>

--p1nROP8ARC1uwryC8MEU3IPJXb5UTMgYH
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Dan and Sam

Am 29.07.21 um 21:55 schrieb Dan.Sneddon@microchip.com:
> Hi Thomas and Sam,
> On 7/29/21 12:48 PM, Sam Ravnborg wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know=
 the content is safe
>>
>> Hi Thomas,
>>
>>>
>>> Are you sure, you're testing with the latest drm-misc-next or drm-tip=
?
>>> Because using irq_enabled is deprecated and the flag was recently rep=
laced
>>> by commit 1e4cd78ed493 ("drm: Don't test for IRQ support in VBLANK io=
ctls").
>=20
> Ok, My fault for testing on the wrong branch.  When I test this patch o=
n
> drm-misc-next it works great.  Sorry for the confusion!
>=20
>>
>> I was looking at drm-misc-fixes which did not have this commit :-(
>> Just my silly excuse why I was convinced this was the issue.

Don't worry.

I'll add Sam's R-b and a Tested-by from Dan to the patch. Is that ok?

Best regards
Thomas


>>
>>           Sam
>>
>=20
> Best regards,
> Dan
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--p1nROP8ARC1uwryC8MEU3IPJXb5UTMgYH--

--yjnFarRLUdaazA6150bDZXU8b5959ycDD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEDuPoFAwAAAAAACgkQlh/E3EQov+DU
Hw//S+XTP8MCawWFcKViVdKyYx/8b76p5/pUrG0Ev2hYnWMZno4RedIRGQX1oj/g3EAYH9yIqXVX
5R5NCwnGNJ+JVzgNA5L1/ELIiCuOXJ9hyhyCAbZaDpcLftS80P5BpwmP8h9m2GyRbEUk1XVtAeKI
CzIgDTMczYNLdUAROSQ6WlwOn5OWXWhMCWmleg0Yt3e8xZGv+AXI+4ox04cOSLSEisVm1ZQyOYmr
npbL85z8SkbxHw4TzTVFqAqovHSeTv+4KUJL7LB7Q3hPIMTDMRmzUP0az+gNBTCKxxgo+b+oH+1b
M+kUuTF2Annxo26z5hvEZumIAW9zzfTHfIQTqjgFbm5AchgTxy3bSAYh2SH+9g0I3gLsEGz47brp
lz1jyVV5XNunhO2cuVMEGtrM9AS/CiVmc1ixs9/2Be2dSs+S/6Yn0yHi/29XvJpNqcHVoVfPuPlP
qgDpClVbr0dYNmjLMEfHx7zfAZ8+GJ3340VGBZ0gSuEguUMjg309+JapIqhEWauOEcMNdSZH6SXh
om4+lQ1HIwbQjZCUxr8s23vuJ/7qV/fiBcnujXBRJ0H662iaWvfK6jmk4i1LUCLGtj5hSOzWS0+I
iw6iZPBwbjfHvAflxgwtwJvxWeR0G7thQX5srKeza23607lk3PiFrHrfsuscJLysi+QELTFD9k5t
GCM=
=zl/v
-----END PGP SIGNATURE-----

--yjnFarRLUdaazA6150bDZXU8b5959ycDD--
