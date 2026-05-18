Return-Path: <linux-arm-msm+bounces-108264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +pGMO0tiC2rwGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:02:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B4557288F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 81B0230182F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E1A38CFED;
	Mon, 18 May 2026 19:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQZnvAdr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789B737BE83
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130952; cv=pass; b=W4X02LObCCsdFwsgCWlyRsadSjqSmax8tnQHJC+KYpDBOrqmSWLSOv3I9olIB0laARJks1v3YgoNXXp0nC0NrSbH6+EbLCqJ2Q/bEzWKEgWNrUliC9kxJwUDoxrbPENhs6CSPeuwmqRRExVYFWxuHKhNSjhf5lvt3m4OhOwVteM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130952; c=relaxed/simple;
	bh=glP8DPL6jwr1JobQYteyf46Cqn4HGAkKYg+M9aQ+9UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otUhiGYTbJNO6iZll5pt6lWsijRpZgMxdw1sjfYtm7MpkkBuxJ6f1Cr1NcLKLfiWA79i+sY6qzULQ31zDIMK2+oUbtnth2EVljn5y9NEfdXNVzc0k0YoK5/gu4rACzudGLBNbUhMPXw0rzoPPiSkqt2Kw8fd5+yuVBKAC7OwNYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQZnvAdr; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-479ef2b78f3so2630029b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130950; cv=none;
        d=google.com; s=arc-20240605;
        b=UeJgcOv5t8rbY66nR2Fvj7Ej1MOGUJeJ+hoXSgFxwdleGdBociCWXfIV5H4ytKHgZ8
         d3/QCAE1po7xWwzHbc2y7J2WQzyDwbc1y7tgSFcMZoC6ycePaDAQ2DvsB4tP/nu1q7aI
         YxFO2oSSgohce9+7tT1RI8byjNu/KKBwUjYVoeo2J67E0TuqbR4MoiYe1PHEV+DCWX6g
         TMn3HLPi93/BBReNXjnik+eguqNZg6C/R9LtLSo2FhSQpkPKN5MPawcWiaTKWUjXSY4Y
         4p3OuwZ4pQi5xzZiA3W8h+EGBNFjn0UgTeFvs8ukFeQakZk9XWdx0oyYrftch/VbzSt7
         Uhww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WvF+QQKvp5JAh6n+YqCUQWQtsCCsh8jEk31uTzMh1To=;
        fh=wsy/jdr9orHZ/yFbCaVL4XoUKDn++/aoRuYEWHunZM0=;
        b=GydMZa6hCRkdmmEQ9QF6d2EDwyR4/UCOUjUlPnWjyGG8lmPEOyRVJtZUh1SzCcUd5K
         QtGWtkdd2ZmNU9Rkv+57O0G/aI52uEHnTY9LZnYnpZKLpCk9xrLJjkxkvVpwgT/8wgdJ
         wy77heyxSid794PFDksgaeJrCyJNST1QLojoYVYXg3AHg4BSDatLkGnBEkuWairjdvYv
         wm97dsKFMMDNSfbh0im0iE6duvKqlQiX+yQJQeJlU5fxmvKL+cC96DiTt2deAxuT+fR3
         w9w87BgFsakuJxUdBjmmGhhOIgOxk2GrjXTosx/oD68wccIP8eB9E3zLBK3fKg4JnbN+
         u+Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130950; x=1779735750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvF+QQKvp5JAh6n+YqCUQWQtsCCsh8jEk31uTzMh1To=;
        b=LQZnvAdr+6YzGUClYIxzPVbTnW+0j1y2tdfP8Y4ClpzsWmlfJ0t6LlAS2sahTMFUuF
         sxh+VDTqV/kAeFTvA7JuPg62vfnKB/CA/as4wDVWqHvKKNJFpUaRbibbW2UrM1h0SkxF
         N0RoILhkEJyjatxqCGq9YjFEjZqbZOPkGlr+A260N8Cbu6WOMI062K/4rupI+dkGUqOx
         dSApixAxehs76Du8rz5JOkZPbkHUh1lpWrigTVRavJrRux1n00HtrvtniMtVRVz1ONZu
         BwIYuWafayaOOfxL/W2tX2DIt7DdMcKu+b2FIMki/eD8ms/DPrDIhj8YEY9xuKaSD2LG
         YLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130950; x=1779735750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvF+QQKvp5JAh6n+YqCUQWQtsCCsh8jEk31uTzMh1To=;
        b=n8uxZAN/yCPkE1g/CC7ffyMk5keBPbaaKbusJvp6/rQqbEei9B+DI1hFVroZ1ieqi1
         D+GHNGLKWFCjvHWvAL3T7bopGLOB9PFCuRBDE1HJE8/E42EiV2KpEa658svVpOgJKoI5
         C4tpAkm2Zdcdqri8bFAmirn6BeAjUY+Ig30zXGP80ZuUVl2KG2jd2AvoXDODsYAa0ici
         Vxv35o5XYzkfnQpcoqBuOzpUO9BMic1pI+23WhLEIGWjItIi1uAJu13UTpWIXdW4i410
         bCupN19QPBSlj79REQhjbx7/N+3R4iHvb92UJH8npWjucHs6gkSsE8KT6XyG9+Jvk3+j
         BuOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xVZvhvrwUKBbWMndOJIlalAx31c+fWDtMUoA/PJHFOJG5uiKata3VGdZHnW06nGJYSB1vWNjC2sSMgXy+@vger.kernel.org
X-Gm-Message-State: AOJu0YygKoaf2jTAL0JDeboxonGRMmYz9r/N0VCxmTJhGYpl09TCtlQG
	5CjG+dafVcsTXJYzrgJzmBZBCh5EkCn+hfpM+ChhuPmIaQ1DmACBVN40m7/q5xAeLwkvPo58jGV
	7qiwWlfcjNTJBIS79BgDnfcJeknB+1xc=
X-Gm-Gg: Acq92OGZNNKGqpszNDd9ElffUsWYVf71IZlxRatGonxyOeVdivBLAKyAV5bXcZuLntz
	Qwdzo9LZrM7ExIfmBHTJgKjohkvl51MOYV0mO5mc7McAsxccJasBTRwD25FVEqWT7Y+1z/B7t8h
	tcl6kbptZVctwkzBIS2FKj2DIN7anx3SN4LzNUrgp+9zPvxBnpoyPcnP0EM6jMjy1zD5ytojvVA
	k25YbfUtchhMC27Q5HKgxyGGD4bhsp5iwar3vxG3juNtGqAQpOS7Ai4ZPjDorv8H5d5iVoki8Fz
	fC1Nac5ORDh5AVpuG8c=
X-Received: by 2002:a05:6808:c16c:b0:47a:4fd:95de with SMTP id
 5614622812f47-482e57bbebcmr11900173b6e.44.1779130950436; Mon, 18 May 2026
 12:02:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com> <20260427005236.230106-2-shengchao.guo@oss.qualcomm.com>
In-Reply-To: <20260427005236.230106-2-shengchao.guo@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:02:19 -0500
X-Gm-Features: AVHnY4L4zZ_7_kwrJIR6IMsP8FbD1-FSMRPeQMcTI4u2e1QXNzCJk_KWHeP9sFw
Message-ID: <CABb+yY3mjH-aWB4KkfK4LFuux-sC0LayoaOo2EvebH4i9nFUxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: qcom: Document Nord CPUCP
 mailbox controller
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108264-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 95B4557288F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 26, 2026 at 7:52=E2=80=AFPM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>
> Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
> Nord SoC, which is compatible with X1E80100 CPUCP, even though it support=
s
> more IPC channels.
>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.ya=
ml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> index 90bfde66cc4a..c8107d58f3d5 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> @@ -20,6 +20,7 @@ properties:
>            - enum:
>                - qcom,glymur-cpucp-mbox
>                - qcom,kaanapali-cpucp-mbox
> +              - qcom,nord-cpucp-mbox
>                - qcom,sm8750-cpucp-mbox
>            - const: qcom,x1e80100-cpucp-mbox
>        - enum:
> --
> 2.43.0
>
Applied to mailbox/for-next
Thanks
Jassi

