Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A108958A4F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 05:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236237AbiHEDS3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Aug 2022 23:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbiHEDS1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Aug 2022 23:18:27 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B2B1ADBD;
        Thu,  4 Aug 2022 20:18:26 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id p14-20020a17090a74ce00b001f4d04492faso1588739pjl.4;
        Thu, 04 Aug 2022 20:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=dGYMCOz7SHHXIGnQZJoT2yL9F7+ItkeSLAYiEd5KAOI=;
        b=ELs5vsFdsHHaBNhkddTaTNfbgVIbnI2C2d1WpHhJSbxQVMworf7ODpv8biIDO1XwDJ
         WapH7MXVx9tx+txZqCvysNg/wPD9koNRG8MIjNn5NO+xiW1mSAIGPGRj29orr3K+nQQr
         1c2gXJNo6lHzrcD2OZ/MWaGupThdmAIk4i8xtrNVAuWmFBIxW0Ps2uCnRDsSJaMm67tH
         E2BGYGzJQsN0skjyGVCXKqYg3cCwIVFkAeZBzUfZ0BF33utsDcNCRFyM3W3dytgzpSlZ
         l9y5i3h2jUnsBj7moErUp9HV2NHD67xNZtnI5ozvNE1CpxoEZyAruvpFiBCMgMV5RSum
         a4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=dGYMCOz7SHHXIGnQZJoT2yL9F7+ItkeSLAYiEd5KAOI=;
        b=q2mF1A6wXcg2wiOejZAo8UvcjqbpgONEuKp1D753K9DUG/OEU0gNL3gIP+p/n2CjKo
         WfouFGU5ZKtLEsUMo1OB3n2RqWy+DGu7l/RvOXz35YTgx70c+ErGwV+k2c7n2zV+/UEO
         bvBdNJDwTk+rlFw22AhLMoOavpYBkty3s5QA9FDs6J2ncPd7DsLJGSu63Iy6qiPPjeMV
         6xOyFrVDRkMR5hkKazrbMgNzF9xbwMsCkHIWZ2J82EflMCVpYuao2+CcQiGDxRfyYBed
         DhlDU6TbnhlZwNnSZHVqv7qgcMbJ8mlWsuKHK1IJDPQJOHjWlh8KaCOL+isSgG7AZUc4
         BWNw==
X-Gm-Message-State: ACgBeo0o2lvTYA07fqHuN2IwtoCcF/dBET52qpUL6hgRz9PCSvku+aI5
        1bAM5KRlg9CO8tO7Z9yMfjU=
X-Google-Smtp-Source: AA6agR7wqzg/IAW3j2aI3DIRX0dQJZG84zUNQ3wTDJZQ7py6klBJvNNGqj5JveAZz4Mo/yzbIsCmpw==
X-Received: by 2002:a17:902:aa4b:b0:164:11ad:af0f with SMTP id c11-20020a170902aa4b00b0016411adaf0fmr4759329plr.54.1659669506007;
        Thu, 04 Aug 2022 20:18:26 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-7.three.co.id. [180.214.232.7])
        by smtp.gmail.com with ESMTPSA id z12-20020a170903018c00b0016f9355c12csm146644plg.288.2022.08.04.20.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 20:18:25 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 43913103D6D; Fri,  5 Aug 2022 10:18:22 +0700 (WIB)
Date:   Fri, 5 Aug 2022 10:18:21 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 01/11] docs: gunyah: Introduce Gunyah Hypervisor
Message-ID: <YuyL/ThXq5FTdDF/@debian.me>
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-2-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
        protocol="application/pgp-signature"; boundary="CDe3ZMtaoNUi6bsc"
Content-Disposition: inline
In-Reply-To: <20220801211240.597859-2-quic_eberman@quicinc.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--CDe3ZMtaoNUi6bsc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 01, 2022 at 02:12:30PM -0700, Elliot Berman wrote:
> +Communication with the resource manager from each guest VM happens with =
message-queue.rst. Details
> +about the specific messages can be found in drivers/virt/gunyah/rsc_mgr.c
> +
> +::
> +  +-------+   +--------+   +--------+
> +  |  RM   |   |  VM_A  |   |  VM_B  |
> +  +-.-.-.-+   +---.----+   +---.----+
> +    | |           |            |
> +  +-.-.-----------.------------.----+
> +  | | \=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D/             |    |
> +  |  \=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D/     |
> +  |            Gunyah               |
> +  +---------------------------------+
> +
=20
Hi,

The diagram above triggers htmldocs warnings:

Documentation/virt/gunyah/index.rst:71: WARNING: Unexpected indentation.
Documentation/virt/gunyah/index.rst:72: WARNING: Block quote ends without a=
 blank line; unexpected unindent.

I have applied the fixup:

diff --git a/Documentation/virt/gunyah/index.rst b/Documentation/virt/gunya=
h/index.rst
index 95ba9b71ab30d2..b74f7a6f9d4904 100644
--- a/Documentation/virt/gunyah/index.rst
+++ b/Documentation/virt/gunyah/index.rst
@@ -65,6 +65,7 @@ Communication with the resource manager from each guest V=
M happens with message-
 about the specific messages can be found in drivers/virt/gunyah/rsc_mgr.c
=20
 ::
+
   +-------+   +--------+   +--------+
   |  RM   |   |  VM_A  |   |  VM_B  |
   +-.-.-.-+   +---.----+   +---.----+

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--CDe3ZMtaoNUi6bsc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTsebsWCPCpxY9T92n/R0PGQ3AzwAUCYuyL8QAKCRD/R0PGQ3Az
wIH4AXwMEGCNxDAFPNOHop9sYqB9aXN0jkTDhEyMg2yMS/FmHyc3YpZWZzibpTNO
vpSWGswBgLHuROnpjtQaE+LrM3t1yFcRPbTqSAq0SROAboKu1LFGQBkZNScxtMvK
4VnHdleViQ==
=PK/l
-----END PGP SIGNATURE-----

--CDe3ZMtaoNUi6bsc--
