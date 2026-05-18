Return-Path: <linux-arm-msm+bounces-108261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPUSLLRhC2pHGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:00:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D839572800
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13DF53020FE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3300A38AC9A;
	Mon, 18 May 2026 18:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loOl5q2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9447B38B149
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 18:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130791; cv=pass; b=ulHoU1p+B51pMbZcJ2h1xY1A1CxZZSp2ljeei0AAOOHculXks2U5CPKtWF7ST7cT1bf70jF1EXU9/kib0CvBkbzOoFn7MI8dDX9Q5hy0dyw/Bd3eSR2sRfwpnpKa4kvp/igCOGwz5McMRtomulOMTKgu35EiCNf2xRwg9fb38vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130791; c=relaxed/simple;
	bh=rA7OpGZvJY0kAyjp4yVFM8EEzqJcOh5NkQwGIkcj64Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbzL5DzcQei9T8Zd4LYfiyuX5GmWym4HucxgfnxkbcrO5XqFhz5P2P5IFyOYtqsAhCmTlbiRChQk3GZ5JFvq+zQmZuqfRXFVILuCJEcVYDrMWbRz724FSNIG+PmUOtZN00X/0DqEmY2f3GW+QVk6N5ycWzvkNTJo9bC+B50SxQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loOl5q2g; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7de431da8fbso2496875a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130788; cv=none;
        d=google.com; s=arc-20240605;
        b=YrK9/rL4B02Gj4pXZfPKaIOFPJ6vUFixCFeDs5ElJN0vSKxr1u3QFxUjwwhHZGkpZP
         s9pXLbklC2qRmwIG1TsMgBj1ZpEU0yVJG5uNLwAZotmXWAUwvRMhb/TO2jEr0nCFEIxx
         TM2FUa030eR3voaOSulUUhOpt3NnsE8PP+xH8LUsKCfXVkFqM7JGP6gCAISpzaO+POiL
         9pICLtu3ci/JbB4mEcJ9eAL26f/yeMP3EvoTZBJVspGTvhFQJis1SFjDRuUUk/aAXGm4
         pjo0jcT+9vZQzmt2DwvhqDzGHpyRWZPdjxyMFTwkRQMXDwppHVKquPp1mh3AEdiwqfe7
         MzQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RD7ksUzupx1Ox6QqABpyHcQLgajinzCTeldNPeqycGo=;
        fh=RwDBlNj0mJqtyZCE/g4CRnAgbdK0c589pw8NN/28pww=;
        b=DB+mgVzQ9m/bi9mqEOx7R8HvdfB07DaAXHPZmyqOmMEnkbrGQPrp+0sOKHlUzOIC5a
         muCLbI10KR3EURIVkywetxrXS+3adNxkwW9Dv57xoZwtabsAxM0hWLotTMQbh2w3QZen
         ZQ83s9ujx6D8FBZ5f8wh6meuiZOgVUuZAj4lFe3B+SgPNQ6X56h5cA4Ifn/CSQ51a1hk
         6mRBlgXEuvi67aK1IKcAkBT7gADThlKr/YtDRtQ613zwntnLdDFtzUWIl6FXGuWOHSrR
         ZLUM1kiaQ8UqY3yOJpQ6Qwya/3VIS+T2afOc5RqFa6XZwlWfZN1p3UkJdtqO5L+q+QqZ
         92ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130788; x=1779735588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD7ksUzupx1Ox6QqABpyHcQLgajinzCTeldNPeqycGo=;
        b=loOl5q2g3eUWY/Q7YNWPeBYi99e3QwR0850sGJtMLPf/YD9w4iDMQbrRGz2yLmxH/K
         qeFO2TR/AKhswMrIDRKYJqjxxpA52HuE2tTdl54+4TkL9+/pTAPXk4XpLn9ALBPYLhrF
         BAwjvMQ57jfhbL3htCXXmZLMR8PTW0vROMUKGHcXgESHOokGu0GeDE5bgwJ5dhR+Y2Vo
         hACDCuHZPn+XJ5NsvrWQM25WjSUBeKn7CQDSAKA6YDcRt/Oqh2jgU9a89hySFNyJnUI9
         moi8Gs+ZTkrNWMgH5o5ziObyJO5f42qFpGLo2+krc/h1mdn7niD8Zji3CsmfIdjJc9DK
         +O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130788; x=1779735588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RD7ksUzupx1Ox6QqABpyHcQLgajinzCTeldNPeqycGo=;
        b=bmyrHEDinSiEaF4mHo2b2cwAfh8oo75QufMUyZuWGlqdB7XCO49W7JAKXy5h3YwAHH
         XVg/lQgqXBGUfp0EVzW6TwZPs0Nx1DyBRxtaJHfPomMC4ljiwoR6DRJIrzVAJRHxcQ5a
         8sRCYjm30sEwrGUDfZdi6x2EG6Uy1oA/7sCJcQrpfFfxteWTxKLPQkB3lp6nUtS5qMtG
         yeSI1ebl4GK/coTN1hzeBlF5faeHNMvFEyjLXOiRPtBw4yJR5SUhUcMOM28UQ2s1AtsC
         90+MFyQoudeotS07UYJw2nZXMXSuKmMLYibLHUF3PPUYeIOpGVUa8PLJbEqbeVB5z5yz
         kJ4g==
X-Forwarded-Encrypted: i=1; AFNElJ86bPwPRfpPz0EDEMl/8bqEWuZA78BA4VwU3cXxw8vx9UXCenC9mm70m4nk/7lBv2Mfrw69rRlg4T9cLHEi@vger.kernel.org
X-Gm-Message-State: AOJu0YxXD/dI6vkNYNbcQ1VuBiKtidB9Nvj9uos2YHsPPpX0vfGGIccv
	DzizgghbfNdD0A5rL1xFzf8SMY/fKpF98GoOMPdQSLGgwJs9QIjj011QlteznsC7REtU+y8pn6b
	yzhnF+J6YW1NP1S1PLa6gaise0bGQRL0=
X-Gm-Gg: Acq92OFgtQIkFR6E2FxS0aNRh08901ATNht1tOAiNxQ331ttcDqf6MVPp7FhTn5xqHE
	OCOe7IhHI6+1QrTS2pCrzvOg0kNLt60nL/LVVDetVgYMBSYKc6472Bk4PvogXpHin1lmBgNYClL
	m+sqsJfqj5DHMbfACoRf53/US9ztstPZXXIWqrMEFOO4Rtlk/95BpTJVJMXRfjPxVqsuTIxsCFA
	2eAYLqKT9nVlSZRGZ2xGtj9MUygKlYXFbkUM7DRy5BWaMGMXSHPPk3PxA4uApmzuHsxUrSn4tvX
	Q4TRDKfh
X-Received: by 2002:a05:6830:82ec:b0:7dc:5899:c711 with SMTP id
 46e09a7af769-7e4ea06e807mr12155754a34.3.1779130788484; Mon, 18 May 2026
 11:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427182412.3666971-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260427182412.3666971-1-mukesh.ojha@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 13:59:36 -0500
X-Gm-Features: AVHnY4LvXLvEiGc0M61iDSp3rJwidmLTqLdTvLhF4D9A7Y_zOnZhpQp_gao9Op8
Message-ID: <CABb+yY2Sif3t=ZNXpeMwiaDNzTgdmjRmj9v+x15AexjNOs9AjA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom,cpucp-mbox: Add Hawi compatible
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108261-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4D839572800
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 27, 2026 at 1:24=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> Document CPU Control Processor (CPUCP) mailbox controller for Qualcomm
> Hawi SoCs. It is software compatible with X1E80100 CPUCP mailbox
> controller hence fallback to it.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.ya=
ml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> index 90bfde66cc4a..167ee222a163 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cpucp-mbox
> +              - qcom,hawi-cpucp-mbox
>                - qcom,kaanapali-cpucp-mbox
>                - qcom,sm8750-cpucp-mbox
>            - const: qcom,x1e80100-cpucp-mbox
> --
> 2.53.0
>
Applied to mailbox/for-next
Thanks
Jassi

