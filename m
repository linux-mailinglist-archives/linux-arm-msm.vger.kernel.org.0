Return-Path: <linux-arm-msm+bounces-108706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D2iIlqSDWrTzgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:52:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CF558BF8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55DF33012C40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5774A3D88E3;
	Wed, 20 May 2026 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tj1OkEIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F141436404D
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274327; cv=pass; b=aiKMvktCvDYqZyZbUIWVMdOWs3iq5oraH6jao/r75dz26cADlvBohGDPODMw3g8VDsR7hIwsZoCQwGNqPiIhKl6nQeUYhFVlAJm61oWObILJAiljeJ72EIppD9bBHHLnnlPdOEUaHnp8U0Vrpi1TsG6iT79Z6d0aXUIPIl4mrMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274327; c=relaxed/simple;
	bh=C5kd5Kjq+KDN0eEW38EjUtDcIkeLXJ8Hpa6MCClTuvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AL2UF4f8LzDSayo+I0nqtPnPTtcCvyLSYNmx2uCAZNRaY67aEUdWskgupyqhkLU9eXN2eFW+BmIsHc2ovzQRJJzt7Uszwhm0co9n8QvfQmFN+meQJmnoJzC0D67JqoY50EhFj3jdCLlNDMEWxXIQfqQmneki/TcfbNYO/wpDHzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tj1OkEIZ; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dca5f64e86so3931980a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779274325; cv=none;
        d=google.com; s=arc-20240605;
        b=bgb+pvxcZ5YGyl0fUKcguXMuzJpf1S+7XeXX3Pzko0ozcOfz+abRb6KWgh7g4jP4SF
         fF1pR8U//Qbjit5VF1vt2C8byESaeXc0Oq+ybZC6XhcHgvjHOjfHjj5TMJ9g3H04lIyv
         Spf7fX1VbthYOD+Q5xfEMB+tWr804sJEhxsQ/J98fgRZs6b1unX8C9L1so7Wv32LUbA6
         08ybwHnX6auUasjE2n0n5OD+3eikNhcDEsPHQ+J516Km8mt78KzcjcSImLzY3s4tch73
         fTguNnjAEL5uUtkSdjtsSflIPwHCB6cUeObIjAVK1Y4FVPexKmxJ2Dk3LKcioVdR7uwu
         3G0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nPOHIcIs6lbXC2xlIAHEKgXOWfGw2NT1g/NXeTKaMwQ=;
        fh=WOi0CusEIGqkKDV3yXrNqtJKGQaRYKHNQSf4QtxJjTg=;
        b=UCAUUZV/wUPAtWL7X4wmXJaEXV6YmziTqhHo4JPftlMhEArSDmsNHXkFB6g36rBcmP
         mU194C0EJxNQnuGj52FE3c4Eivbz5eBZ4WE5dwDGqkatGWtc8oN2Pu/0WmczybPy6C+F
         gH9zp55aTsAGi+plA4TxpsLs6Xoj3iQ8SNQ/6i6t2IUwD4+hXNgI4BmfAPFqaWgRNiOw
         sAs6hY4D9l6LMR1nxWiA8CTq6ESZ6ziB1B5HniWD0Ih38EbCtLw3+7UzNoYyopaF5GAj
         LHpDA6QCdAWK7cgK8x3mn54O0h4dCupxB/QDH7c2jE39bL3RjKt8598+92T5VbzRrlVV
         ZPsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779274325; x=1779879125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPOHIcIs6lbXC2xlIAHEKgXOWfGw2NT1g/NXeTKaMwQ=;
        b=tj1OkEIZoz135UazTBn95qxy1Kz+a5pUJ54DRS/EVOIzsBJ/Cs+JOni14wDwbIXW6G
         /+ECDbxPfQ9dEIRPdDtPywYGWnz9vK4UmTAal4DGTu2SXzIq8arHZipeF1a7mQ0nk90P
         qS14PN5s3ec0AoAfGWWZXQWAKX1vp0OjQ9GIRjChxSEWA8hGAXC1X1g0jsALGVNkAA7S
         SAvyItKUL2GvbjGaeyP+zw9Ly1IdJj8azGWRseTekihPLH3PJo/ToEH+h5AL7uepy38n
         rLUPa7jgw3rZoQC/q+0/uzf6q4W6vUfZVSbrb8ogvXk3RDkbxqB7cihIzufYbLZYfRop
         u9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779274325; x=1779879125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nPOHIcIs6lbXC2xlIAHEKgXOWfGw2NT1g/NXeTKaMwQ=;
        b=Bf/9cUbBJA4QAfUIwLtuUPG3/RuFPSk7JSZl7/xsdJWzle0tQ8s1R5ZiuMvXqSnC27
         oVhPwAbpeozJiVcaAvLgVIEf/LWY3LBjzmu8b0RB5I+O+/OAmkzXjlMvF1pVlHvdyBr/
         GHhAeOjwA+g2UugPS9RorNLBR4HPGx8d5h8D/yrVoXksj1h6FefoL0xT9ITsruuny9Aq
         WVgmuOqUr8buBphzayFFKyEsb2YC3NZmnjVp0eo/HVX/RkSp6T7zoNzLlb8KjJw4UqTL
         MzgXh1C6YPpdB2FX7bYgzaNYLMElSKvW3ocQV0B+9xOTFZlAj0PS7JphUWUV1ewKptHk
         liDA==
X-Forwarded-Encrypted: i=1; AFNElJ8sswIswK5A1Az8hCvz2Eh0aJ9eFZN4zGdNvfsGS7NFuWjAHisy9q3zHr26CXZCuO0CglYEfbNcxB1gofew@vger.kernel.org
X-Gm-Message-State: AOJu0YxTvso6n+fL3lYTXCPRgPtI1ImHYwuUUyFSxtsvL/AEXrCXfSFz
	mfdAc57HtesH5dkjlDTbXo40NyuHpf5e4r2Qg1fRqrvPMa0mmtvLxhW2In2eZNqCdht0TGdtg5g
	flDZKOv/TebkdCNrgYT9JyHmrqbQwo6L48Dkm2Kw/7A==
X-Gm-Gg: Acq92OFc/msGkK36hXc0zsdlTffvd20HW7cKvQJkkmmWEdtlOkmyHSNaXx/la3BEp9n
	/kSOMkVizlToZW7FIa5VRWqgEPPEvYXcxg2Qv7MoV0c7edobCmn3yucKTWkMnfcU3Q36AqyGxOm
	o5xSWkeBBBNEo+O9Zd1FKwSo16ZTnoXitK+t6N1IiqEyuSp2L3GfW25uEoZzIcKw+hyxvopCfK1
	Xhcg/bo2aB1mM6uzcZtneHdO1Fqw0py/tBi2i7y04yJI0iB6FWee1FpPOSGYeBI363qEQIaas3y
	A2Pw3MnV5sXfz7dGEZN1LAXoWjWOY8ZOhUC9UQ==
X-Received: by 2002:a05:6820:162b:b0:696:7780:477a with SMTP id
 006d021491bc7-69c955c8051mr14017800eaf.46.1779274324551; Wed, 20 May 2026
 03:52:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519020528.133623-1-robertusdchris@gmail.com>
In-Reply-To: <20260519020528.133623-1-robertusdchris@gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 20 May 2026 12:51:52 +0200
X-Gm-Features: AVHnY4K2o6NLWZCMDLJg6zJVV7wJlcp01Try26nd1v4PCGJvx45IMb0YFHlPtpE
Message-ID: <CAHUa44GqBpYNxV8AHrj_r7u3cbcTA0xTB7Q2Nk=vbpnxDLnrTQ@mail.gmail.com>
Subject: Re: [PATCH v2] tee: qcomtee: add missing va_end in early return qcomtee_object_user_init()
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: amirreza.zarrabi@oss.qualcomm.com, sumit.garg@kernel.org, 
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	skhan@linuxfoundation.org, me@brighamcampbell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108706-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim]
X-Rspamd-Queue-Id: D3CF558BF8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, May 19, 2026 at 4:05=E2=80=AFAM Robertus Diawan Chris
<robertusdchris@gmail.com> wrote:
>
> qcomtee_object_user_init() is a variadic function and when the function
> return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
> case, there's no va_end to cleanup "ap" object initialized by va_start
> and that can cause undefined behavior. So make sure to use va_end before
> returning the error code when there's no dispatch callback.
>
> This is reported by Coverity Scan as "Missing varargs init or cleanup".
>
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
> v1 -> v2:
> - Use "break" statement instead of "goto" statement. There's va_end
>   outside of switch-case, so we only need to go out from switch-case
>   instead of using a label (suggested by Amirreza Zarrabi).
> - Add "Reviewed-by" tag from Amirreza Zarrabi.
>
> v1:
> https://lore.kernel.org/all/20260513091031.145826-1-robertusdchris@gmail.=
com/
>
> I don't have the device, so I am not sure how to test this change.
> Thank you.
>
>  drivers/tee/qcomtee/core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Looks good. I'm picking up this.

Cheers,
Jens


>
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> index b1cb50e434f0..60fe3b5776e3 100644
> --- a/drivers/tee/qcomtee/core.c
> +++ b/drivers/tee/qcomtee/core.c
> @@ -306,8 +306,10 @@ int qcomtee_object_user_init(struct qcomtee_object *=
object,
>                 break;
>         case QCOMTEE_OBJECT_TYPE_CB:
>                 object->ops =3D ops;
> -               if (!object->ops->dispatch)
> -                       return -EINVAL;
> +               if (!object->ops->dispatch) {
> +                       ret =3D -EINVAL;
> +                       break;
> +               }
>
>                 /* If failed, "no-name". */
>                 object->name =3D kvasprintf_const(GFP_KERNEL, fmt, ap);
>
> base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
> --
> 2.54.0
>

