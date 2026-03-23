Return-Path: <linux-arm-msm+bounces-99127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHekArn8wGmiPQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:41:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D62EE614
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 412A73019151
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235753783CE;
	Mon, 23 Mar 2026 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHHc77QV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C225383C97
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774255181; cv=pass; b=pb/VsSHn/EIZhkqzDGkk9N0ZDo9uwnbtLpj9aJmaeh0iEbB8Q5pl8PnzdOaPIBK9Gvp/K4FdrHkpL6T9vxrvz/AHyR7cE0gnQX6vQW+zgfgx77S4lQK3/Rrhh+vK+Qjapz/badLBnLFxCuL/W05k36H5CgU1lzctvBIoWK8suvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774255181; c=relaxed/simple;
	bh=EmmyJFrLKT85XSK+HqCAF6rUkXHVUHJjs7/8BnxCbhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tecc9MZZ5B2fOZfqa7OzB2/zT/+gyUOa0FFDtvVSyHx6U+iDm0++FOlnN3LMLKjm8SO7ZiRz66suZB7jw5RGnT5FIOZA74dTaabRIUXaJT98uRthw0Io6g878JOumewXl+u/wEulflerms+eqSPdu8xDi+V2Tk3ENvC8aAgbRr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHHc77QV; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a27a7f711eso2888921e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774255175; cv=none;
        d=google.com; s=arc-20240605;
        b=HNL2BdTTpb0RpY0fv3rK5GBUnisA4axEyWQWvPpxx51+Qbf8rNF92BBlUDCMYgZ8cs
         CgFbwKFyQdPWuWuqe/moxeZqhS1z1JFyBBuc/aA2dnMaeJkDGMpVlG74yEeAtzUT1QHP
         eGiekK17L6GtUW0/sL4PycFBu5efwe4BUL7I8UAEfHRIPMcPmHpzvAsnkfAYkEbV6rja
         DYAA+q8qfecIrLmsTmBzQDtGuPKWWvTN1M3lK5dlwaucrvk4QR+KWZKlo8VsMS5XScmo
         YPBH7cqb3uylViyzfkamVHTaEL7ByJ/kFU8Etbr7YIkH/Sg0wiGnkjnZHBS8gT2xlKQo
         ox/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QWGzUWcfHBKIzGr4tnQ7GmzA7vBYgSXg555q3Uctmw4=;
        fh=ScS+GGXc8+M8KBxdIoLI7DSdWB8XLl2feccBn6nkXbg=;
        b=du77Cq0PDl3mCcRoemhq9R/mAUvqN71U8bvKUX9GUvZxqqdcM0Nv1B1hBZyySVrqHZ
         1BoxzV0jpeQsRUH6aSSWA+ayf5ZRnHfTcVhd665Npb6JJ4YuTtj0GF7JVwF9OYrq8oNm
         kbUQBbgOTrVLpVqbpZVwt60GWMOKwDYrESvRXqJx07FML/LExh2sf77QOjXalY31sU3x
         69XgM4HUW7nYRMHFH/V9DWvNT4UQ6PpvB+1vRMQIY+TSfaJS/epGgNbA+fqIoCXiEgkz
         +ScfoS98M3ZpHkQFzkOaJ3jvCrKBd+xc0GqJFFaTaSvk/gMwGUv82d+fHcgZ4h3U70wl
         XmWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774255175; x=1774859975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWGzUWcfHBKIzGr4tnQ7GmzA7vBYgSXg555q3Uctmw4=;
        b=XHHc77QVpruL5KyIN2ZbaKi8Adz8k2POZ/6jmYcplylYOCXMgnE8x4V0sfack52l+3
         VVh2MWtTc3eMTkE2KViwjhbPV9Wdurronh0N5Vc+S4oUVi9bEQfmWfxyGY2vsPHmpmTn
         s53YTFXJloHCwIg3I8VQ2eFjyW1WbZADI0wR2b0tj2f5znKOu+GwaSWDucP3HaBGgyOO
         g3mEktW9T7PNXP8YAPWjd3CL9WjQeKznpQ4lSQQHH9o5O1g5aO2GuDZp7HS9kxhYW6Yz
         YpZ3XyUUyfeLzZyoPgc9e2+a6+16wu9cRjHmopf6/V4ZxskPAuQ898NFQkKRczY/RuEA
         NlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774255175; x=1774859975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QWGzUWcfHBKIzGr4tnQ7GmzA7vBYgSXg555q3Uctmw4=;
        b=gEiYbIQYxCetkRmwZsNOMuFLpTC2ZwiQizGqA5teFPt7qAhOrd+/3SgtDyiiOdCmVt
         oPm2TurghfulpQ+fNdlGh7ySjYaziGdxO/+pXQmPDrqzpI8u7U41PacXdrP42zrVi/RS
         DQAq84NNBwENiIyTdrQ96tDxbg7hTgkRBbwUsHxVcD+AgMRcc0EEJAeeHL2wsF5cOzRg
         2tXhAP1zI972ZVMCI9mBswWuz0ztUDAYbIcBGpmGV1tu9RYeoHeu2slXXawufe+uFgCe
         7UkQ1e+ef47Jlhauux6wOtHqTlU3VZNRxAn4WhOTncBt4cvdDrnHJL2E8h5CL1sa7XNx
         +AcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1P5zhhl68lOfswvxvP1OiwBk5fUkLXM+ar/tUmcsYYvstQkCIflIlNOkG1a91xV4sv9wGNOTH5RVOp/bX@vger.kernel.org
X-Gm-Message-State: AOJu0YyjUUyJtfSvKo5ORnIKmkyeJaVmN8ql4TpK1LhRM6q3rq/lJeoZ
	cGB6z4gKr7FG3hcYM1deabYUBq5Yg1FCymi540Q5CGN7xR5mnQWkErTKfAO+No4BFdrqb0znmfd
	uy5iJgbIhR7EdtRn+Zm5L5fu7HSEODBY=
X-Gm-Gg: ATEYQzwG8h08oMWf21BJJmEoF2l+9iW0fECj5mQOsGHgiMLDc80/VhSoT4WAB5VK54i
	kJZkfnWABUi5hX+TOXukO6LXPhokvpEEOLLjp2pz4F+5hGyxPo75ZwI+9mdkS7BJ6NEmXHz4px7
	6xte5rFUeNkyt0+xW7VQ49H2kuFbhNI10+28h4NtoaHnNMvr5003iZjWCScOB399SwVAlnZlobt
	G1pJQ59B1zmVbZDsUAa7UeTcfvFpOFUDMUxrLWXN8zgGnz2smQYXOHKggjSA237AdwNhk0SUkei
	7k8URMndZYCx68c1eRFp0ALrL3DUG90nJZ9kn0MImIq7CIHnPvSAngTbOaY714uk2zIFlNjE8WV
	xPGc=
X-Received: by 2002:a05:6512:224e:b0:5a1:3207:694c with SMTP id
 2adb3069b0e04-5a285b80c25mr4739491e87.29.1774255174670; Mon, 23 Mar 2026
 01:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322-ayn-qcs8550-v3-0-4afa89c20888@gmail.com>
 <20260322-ayn-qcs8550-v3-1-4afa89c20888@gmail.com> <20260323-laughing-pumpkin-oarfish-99fafb@quoll>
In-Reply-To: <20260323-laughing-pumpkin-oarfish-99fafb@quoll>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 23 Mar 2026 03:39:23 -0500
X-Gm-Features: AaiRm50M6Gx3VDWmamN9kZNFdkjwauBN-_A31lmZhVwCens0UXbD-G998xkOdfg
Message-ID: <CALHNRZ_2tUuiBBuH-QGi8VQbZSVhQg2KGd-dQVJMq+HKiGwpmg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: arm: qcom: Add AYN QCS8550 Devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-99127-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B4D62EE614
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 2:51=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sun, Mar 22, 2026 at 09:05:18PM -0500, Aaron Kling wrote:
> > Namely:
> > * Odin 2
> > * Odin 2 Mini
> > * Odin 2 Portal
> > * Thor
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Document=
ation/devicetree/bindings/arm/qcom.yaml
> > index d054a8f5632d853509b7cd37f07f02473cf6bf71..ee68963c30eae10fd3b3a5e=
21bda63ab941893fa 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -1075,6 +1075,15 @@ properties:
> >            - const: qcom,qcs8550
> >            - const: qcom,sm8550
> >
> > +      - items:
> > +          - enum:
> > +              - ayntec,odin2
> > +              - ayntec,odin2mini
> > +              - ayntec,odin2portal
> > +              - ayntec,thor
>
> I already commented on vendor prefix patch, that you incorrectly moved
> it out from this set. This only stalls your patchsets, because none of
> the trees will have it thus none will pass any checks.

You mean the checks that passed just fine on v2? This is documented in
the cover letter, which apparently no one ever reads so I wonder why
we even write them; and listed as a dep, which said checks pick up
just fine.

As I have mentioned multiple times, the vendor patch is separate
because I have multiple open series that depend on the vendor and
there's no telling which one will be picked up first.

Aaron

