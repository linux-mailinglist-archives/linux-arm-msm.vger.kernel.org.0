Return-Path: <linux-arm-msm+bounces-106675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPzuBHLT/Wl2jgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:13:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB10B4F62E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED86A3026C0D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 12:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DD13DBD62;
	Fri,  8 May 2026 12:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdKhprhE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113C13DB652
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778242048; cv=none; b=JyotWEjC0dn4XTPFUJ3e8PauqfdzXOMe1/+qsWMZ4OLdZ3GVhp+4x05ZLTP4cQvq/+42ainGCIDx1UgIIsT0PD16JCxIAcHLWda4ek1mGQrGrNrTPRVwxM9p7PJezS8q7q5/cq+H5lTFqz4gDvzOC4bTsLuySpDromPM0tG/ASY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778242048; c=relaxed/simple;
	bh=7UHV6xRqij70RZ+zIil2HrzlDWJhZfmh6mHhtWrcMiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5EAKKmy6agV56ch8VYc4WC9rn5Vr2ajnacmKbcbrqBiMYFADu0fSQ3dZI4R/jILd81QKjRaZWKtHJ/mJsUX+92NBzwf5+fWKkKF7Xp8BC3o/92agA29sl0n5F/+7I6niUxrbBKRxXEzRNfChJUCvldSATmqUdnkkXp1bJV28P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdKhprhE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA0BC2BCF4
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778242047;
	bh=7UHV6xRqij70RZ+zIil2HrzlDWJhZfmh6mHhtWrcMiI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OdKhprhEFLzQhu+WMm67/GrzH1DfUqp+pJxi/87/jA0laTrUH4enlwk9xS4PYZ5VJ
	 VBStCYNXfGRC3W6amFWxDiQQFS6LPDDO3eBAOXN++6+12d6YQhod2P6gKBTvxxUiPg
	 IiWVBiVe+dyW3YQRuMaIB8IBGwZK7u1AIgpNfqrZXdoE1QORRdJVFKbfwLopg1F2O2
	 9KEecYh84EcB+/0SwXzgHCHRumICX/3arRmeimcMjy6yxcD7lhMk/6jdyysm93Dpmc
	 YkNg3SrrrBj7S3ftpW4/iwsxwmD/JgBDIwhq6C9Anr9b+hfp3B3EoTEmHQTmqI4Nqj
	 B8dfYls5n4Dzg==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bc2301be8ecso340855566b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:07:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9So7W5at4xTBMGVqOPLYm/AUEqASRrGfkx2i18W0oq3wTL4lbyuSouYwJr1ZGWgEDKb8MpV/q4QNOcWRlM@vger.kernel.org
X-Gm-Message-State: AOJu0YwuRaF11MvVAX0iFdiPwvP0EX7+Tb4FPqlMh9Yqzts71QrP7h4Y
	bN3+ggRscR18/6enGyqrg+L0ovnSk1vqNes3SfG95ArUGgzrVgQhJFGhjGmBpQJ9aty2I+S3NeM
	BsnbYGu4rfLZcUHt/fD8WtczdqHLfYw==
X-Received: by 2002:a17:906:c101:b0:bc7:73f8:9f50 with SMTP id
 a640c23a62f3a-bc773f8a352mr481132666b.42.1778242046267; Fri, 08 May 2026
 05:07:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com> <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 8 May 2026 07:07:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJJ9ma2wTwyrV6AmkGULJk7YMU6qm3Guj+jC0t_-hfV+g@mail.gmail.com>
X-Gm-Features: AVHnY4J_SBRGUgh0bRMEEeD__ExdOgQPRAVnu9PYp0uW4lGZn0svlHUzovxSvLE
Message-ID: <CAL_JsqJJ9ma2wTwyrV6AmkGULJk7YMU6qm3Guj+jC0t_-hfV+g@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM property
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AB10B4F62E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-106675-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.223.255.192:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 3:07=E2=80=AFAM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
>  to deliver it (USB upload to a host, or save to local storage).
>
> Add 'sram' and 'sram-names' properties to the SCM binding to describe
> a region in always-on SRAM where the minidump download destination
> value could be written. Boot firmware reads it before DDR is initialised
> on a warm reset to decide where to store the minidump either to host
> PC or to on device storage.
>
> Most of the Qualcomm SoC supporting minidump supports this, added the
> kaanapali SoC for now.
>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/D=
ocumentation/devicetree/bindings/firmware/qcom,scm.yaml
> index 7918d31f58b4..6813081fd74a 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -127,6 +127,22 @@ properties:
>            - description: offset of the download mode control register
>      description: TCSR hardware block
>
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Drop. This is a common property though we need to create a common definitio=
n.

> +    description:
> +      Phandle to a region in always-on SRAM used to store the download
> +      mode value for boot firmware to read before DDR is initialised on
> +      the next warm reset.
> +    maxItems: 1
> +
> +  sram-names:
> +    items:
> +      - const: minidump

You don't need -names with 1 entry and sram-names is not a common property.

> +
> +dependencies:
> +  sram: [ sram-names ]
> +  sram-names: [ sram ]
> +
>  allOf:
>    # Clocks
>    - if:
> @@ -229,6 +245,18 @@ allOf:
>        properties:
>          memory-region: false
>
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - qcom,scm-kaanapali
> +    then:
> +      properties:
> +        sram: false
> +        sram-names: false
> +
>  required:
>    - compatible
>
> @@ -247,3 +275,32 @@ examples:
>              clock-names =3D "core", "bus", "iface";
>          };
>      };
> +
> +  - |
> +    /* kaanapali =E2=80=94 minidump SRAM */
> +    / {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        sram@14680000 {
> +            compatible =3D "qcom,kaanapali-imem", "mmio-sram";
> +            reg =3D <0x0 0x14680000 0x0 0x1000>;
> +            ranges =3D <0x0 0x0 0x14680000 0x1000>;
> +            no-memory-wc;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +
> +            minidump_config: minidump-config@1c {
> +                reg =3D <0x1c 0x4>;
> +            };
> +        };

You don't need providers in examples. Really, don't need a whole other
example for 1 added property.

> +
> +        firmware {
> +            scm {
> +                compatible =3D "qcom,scm-kaanapali", "qcom,scm";
> +                sram =3D <&minidump_config>;
> +                sram-names =3D "minidump";
> +                #reset-cells =3D <1>;
> +            };
> +        };
> +    };
> --
> 2.53.0
>

