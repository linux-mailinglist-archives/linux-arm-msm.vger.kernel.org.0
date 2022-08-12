Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DABF590D52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 10:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237337AbiHLIZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Aug 2022 04:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbiHLIZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Aug 2022 04:25:24 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A1AFD1E;
        Fri, 12 Aug 2022 01:25:22 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id h21-20020a17090aa89500b001f31a61b91dso7696167pjq.4;
        Fri, 12 Aug 2022 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=K5e31EfZ0bAJpIVl6ZgewRG0lk3GwGASk2Ee4EmX+pk=;
        b=PYK73lqvR1AkLT10nQIUykyVaiWlBLBn7bpLtxJHDzuKauvirrTaO1ZFyKOGLVI43f
         IXy1D5JFE99EJPTxugjnEY1ytdV9Fd9Fhorm5zoWgwk8pDjUC98q02V4EeI75i7+lY3Z
         0zi9IOQmUXRaQYiYOIAeszoHDARzi2yaMaPxrzpiEdtU38x6v0TU13wA1x5N1vb87Bm5
         JrO50MfBgeD+tz8hqYbCQ+sev7siy4zm1d6Ox4X2b9MKN7PelON0ezKAIiYUF98wUiMp
         bCjYeLwDIifZFFnuqsyr+rAj+hVBCdYJJpvXiAyPWDuVp+MotiIthMsGHM3QJQmoS0mM
         Qt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=K5e31EfZ0bAJpIVl6ZgewRG0lk3GwGASk2Ee4EmX+pk=;
        b=EnrYiO/EANJFirNC2YEr1E4CgGCGKuvCvYjKKaI5TtQLiCa+UdPxAz08Rwmux69ml+
         ED3y9SGZJBzJsL8CaPfyM+6ceyKuKBe50YM3a5xUqVwRZ7jIpOK39nBWGmvCzNQzFK7z
         ouVTZK1c6mrBgsFXSy1Z3mmTqXI247VbacK7fa2WmKFsOyMLc4y1rzJVjzqFN7NoHAuk
         zipTG/7JYvq86aCjdHIZXfO4Sz75odWuulKra3nE5LLgqOHOvTvW6tTVG3HF9tt8z2o7
         L+eLyQIipHpYnKCw5mnMo1HZKXcew36DJ93mfXU/o/2FnIhkFYDPQwS9v4gSzqDQ/6gj
         YdOQ==
X-Gm-Message-State: ACgBeo1qD9YGqE8vtzbSVEGdbQ0aV59nop1LMCrCvJN/GOSLuKhiLO0/
        bhIA7+/U7fo1RmANBrDCro4OYqTMENvqBw==
X-Google-Smtp-Source: AA6agR6efLj2VyPg6cDCWFw49gG9JTd8iUbSs1/i0QYJYchWchpdEP8EXSW0zcOu/oif7ygrLKYR3Q==
X-Received: by 2002:a17:902:ec8f:b0:16e:d8d8:c2ef with SMTP id x15-20020a170902ec8f00b0016ed8d8c2efmr3147211plg.62.1660292722259;
        Fri, 12 Aug 2022 01:25:22 -0700 (PDT)
Received: from debian.me (subs09b-223-255-225-237.three.co.id. [223.255.225.237])
        by smtp.gmail.com with ESMTPSA id l6-20020a170903244600b0016db441edd7sm1098566pls.40.2022.08.12.01.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 01:25:21 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id AB966103BBF; Fri, 12 Aug 2022 15:25:17 +0700 (WIB)
Date:   Fri, 12 Aug 2022 15:25:17 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 02/12] docs: gunyah: Introduce Gunyah Hypervisor
Message-ID: <YvYObTVhZsr0B2vS@debian.me>
References: <20220811214107.1074343-1-quic_eberman@quicinc.com>
 <20220811214107.1074343-3-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J0DeUdYoLvLWrWZu"
Content-Disposition: inline
In-Reply-To: <20220811214107.1074343-3-quic_eberman@quicinc.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--J0DeUdYoLvLWrWZu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2022 at 02:40:57PM -0700, Elliot Berman wrote:
> +Gunyah provides these following features.
> +
> +- Scheduling:
> +  A scheduler for virtual CPUs (vCPUs) on physical CPUs and enables time=
-sharing
> +  of the CPUs. Gunyah supports two models of scheduling:
> +    1. "Behind the back" scheduling in which Gunyah hypervisor schedules=
 vCPUS on its own
> +    2. "Proxy" scheduling in which a delegated VM can donate part of one=
 of its vCPU slice
> +       to another VM's vCPU via a hypercall.
> +- Memory Management:
> +  APIs handling memory, abstracted as objects, limiting direct use of ph=
ysical
> +  addresses. Memory ownership and usage tracking of all memory under its=
 control.
> +  Memory partitioning between VMs is a fundamental security feature.
> +- Interrupt Virtualization:
> +  Uses CPU hardware interrupt virtualization capabilities. Interrupts ar=
e handled
> +  in the hypervisor and routed to the assigned VM.
> +- Inter-VM Communication:
> +  There are several different mechanisms provided for communicating betw=
een VMs.
> +- Virtual platform:
> +  Architectural devices such as interrupt controllers and CPU timers are=
 directly provided
> +  by the hypervisor as well as core virtual platform devices and system =
APIs such as ARM PSCI.
> +- Device Virtualization:
> +  Para-virtualization of devices is supported using inter-VM communicati=
on.

htmldocs build produces a new warning:

Documentation/virt/gunyah/index.rst:25: WARNING: Unexpected indentation.

I have applied the fixup for lists above:

---- >8 ----

diff --git a/Documentation/virt/gunyah/index.rst b/Documentation/virt/gunya=
h/index.rst
index 780ff958a83b8c..c55e02f17ca318 100644
--- a/Documentation/virt/gunyah/index.rst
+++ b/Documentation/virt/gunyah/index.rst
@@ -20,24 +20,36 @@ https://github.com/quic/gunyah-hypervisor.
 Gunyah provides these following features.
=20
 - Scheduling:
+
   A scheduler for virtual CPUs (vCPUs) on physical CPUs and enables time-s=
haring
   of the CPUs. Gunyah supports two models of scheduling:
+
     1. "Behind the back" scheduling in which Gunyah hypervisor schedules v=
CPUS on its own
     2. "Proxy" scheduling in which a delegated VM can donate part of one o=
f its vCPU slice
        to another VM's vCPU via a hypercall.
+
 - Memory Management:
+
   APIs handling memory, abstracted as objects, limiting direct use of phys=
ical
   addresses. Memory ownership and usage tracking of all memory under its c=
ontrol.
   Memory partitioning between VMs is a fundamental security feature.
+
 - Interrupt Virtualization:
+
   Uses CPU hardware interrupt virtualization capabilities. Interrupts are =
handled
   in the hypervisor and routed to the assigned VM.
+
 - Inter-VM Communication:
+
   There are several different mechanisms provided for communicating betwee=
n VMs.
+
 - Virtual platform:
+
   Architectural devices such as interrupt controllers and CPU timers are d=
irectly provided
   by the hypervisor as well as core virtual platform devices and system AP=
Is such as ARM PSCI.
+
 - Device Virtualization:
+
   Para-virtualization of devices is supported using inter-VM communication.
=20
 Architectures supported

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--J0DeUdYoLvLWrWZu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCYvYOZgAKCRD2uYlJVVFO
o9M1AP9qGMXeysAQQdpRja+bHC5MnwCoQfI19sffZXmLAIeTDgEArdMnYX6idzkJ
Z5H5X80sKhQ98VuWt7B7HXRY3JM4YgQ=
=AycK
-----END PGP SIGNATURE-----

--J0DeUdYoLvLWrWZu--
