Return-Path: <linux-arm-msm+bounces-90860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDVYNGD5eGlFuQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:44:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 737F7989AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 857DD300789C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B2F31DD97;
	Tue, 27 Jan 2026 17:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7LgGHsx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53283112B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535838; cv=pass; b=GOrrPx2GG0MkhCQQi6SJWc3rSqSqIV9Gd3BD4DSZVTldkRoMPt8SHgDf+wpsHWVya7/QNZpW/XotxD3Kih7ceUcjLsGn6XRUo/vCbCxh6pqb605AVHRcTw0o53k0woDfFhwdTBmd/q1gsPFWS49gKOOGASmev/QCGUCgsFinSbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535838; c=relaxed/simple;
	bh=OqlqgyccDNNQ1TlKbxByBvUJhNZIDGEgGugTtMth+7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksfjOFt22KOMDgfnR5bKz1ckIfVLEvH9RewWIYrgvG5b5e37gvHhpcHEFxZDS9cVPA/hCqDzH7LPSajknczootOOeiojKgIzx4k72DP936ASCa2TVRVwcxUCHvCthDedSqNu+rTwc+W18TmC7xffF6C3VcRJNZ2BKvVljOD2UY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7LgGHsx; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-352dda4a34eso2936086a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:43:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769535836; cv=none;
        d=google.com; s=arc-20240605;
        b=IBGV+jFqFkBvtY7mD/LGPo+C9wlj+2hhSpsJXhPThYmA/ckIDKplwxOwkqkCIpDlZZ
         xkmjJd5FIf1PqT0GUvylEBKuWHHMwjG7tx53HQjDV0z8S4mfAQShvIoTdPFhyDJecTQm
         x558zCiRImqOt0gc+sl4ktrg+wlAOMrvLg4T45mPJHHpkAlg50r+/eOrlLIw09MwB8lU
         jJOLhSHwSL5Cy63OHmx2mOVzhWTCb2JlxEt2n/IQ9Y2jIIk72OtTCOhBdLGkabgOFTrU
         TPvRFzDC1nHCy0ICwxm6MV/BRSh844zKmiVpeD2KrPM3OhT1r2Ys61KY9/357e6d5JHg
         7j9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rG6wsTAzH8V/xpnj1Mr5c/qfGUz9KbagaqNaxEXVwMk=;
        fh=rUqHd8MBzVZUjz9ObTRHdyYhfkoFx0FkoqqWCHQcPqQ=;
        b=hzXf0hrvnwZgmWtoirCQ3XSyhi8lQEHYmzqtDcuzbUyUVxrlHBdgAsJOg6pxci8VkZ
         yWacFrYony2oU3X1/ubm8Qu4EOG+c0rxySYmL/f+zo1XJE4XX6NyMbX4oepPvQTuJ3Eq
         HkHmohDBBkGEvJzYtlvxWXrBhgLGrS4IU7yXgGKOr9h0UGE4U+BEkDXMrLWXr2/nltQf
         +R/EbEU8n2AABcGWMpmi7Lc/q5Xlzq/64mxIDfmkuDC6VGhdgZWh5YAwPwA/9CxRhJCe
         SQxSdejMYX9jfGJbOG5qvt/IBKy5hp3bOj+HQREQyOpiqLHb5oSPe412ZjCIfNUfPCLE
         RxFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769535836; x=1770140636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG6wsTAzH8V/xpnj1Mr5c/qfGUz9KbagaqNaxEXVwMk=;
        b=a7LgGHsxJ2b4DGlRkIB7W6zBQ+z5Mq4jSCCMftLoTFrbdpV5UUU9Uoh82DsZNyKvN6
         tBIUskELNSQ1i8IuJobVw4saUr1jPlRyaJ5afhf4F7gWh2Yl2m3BkrP1l/gvlgDQbnLU
         xfYUdmR0HgI9EQm0Aqa5gkphuAzPBz+/O2kXU8FNxEujFN5oYxboztu6+lF90gh8PzEg
         2Z68XyCwzh/fYkyty6VlxLqUmg9lPqaMZP50xFh4L9+wmmRyQkcV+zgU5aiqDwn0rhVa
         mA0WgCaZci3rvqfd3zNI0Y37cRJojG8cpuvrHiWxRlsUglns8Xx7bpaqQkA4TwQv/aTI
         DVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769535836; x=1770140636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rG6wsTAzH8V/xpnj1Mr5c/qfGUz9KbagaqNaxEXVwMk=;
        b=Ulv27GUZNr2r3qawgVXQIrnu4+S3ERC60VxQ2qjTS30qvwqnJhv2jO4aWj4eK30BGr
         NqSD7OYbvktDV7RAEVdEHF1UIn3LLTxbeMwbB8NtNBn5iNBna1t75Of1VC2/yYvbjVSU
         Dp6TUmey9YorDe9mA+buZkU1lf0ZCfqQNlVi9Cru0NfPXQVwLlXXmaYDSckGQ+9G+IPI
         J8ZkF5kFW5vLC5IpcY1F8qet6ChO5bC1t0LIcRmRZTvZtcBsDYXhWCOFHTb/J2u70mBR
         uYtdbLDdXA9avzyljpNZIOvvIzRqTW9ww8H4Owc8/lSaedSEP9CV85VoCgxrngnOG4xm
         PvmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR3sadfUxl7rCge1eyQxmX1aB9L3LQqdg/pSOcz62Md4OLD7zapG6eP7Dn3yLpW+Wk/l+vyKdi1oPpTSbO@vger.kernel.org
X-Gm-Message-State: AOJu0YxgMbK6k3P2nx0GWtaDxY6b9WXwozmX4LitYlP++HwHGP9CH1Nq
	T3RUqFN4VIy7gWmTbGtrSCJg5TKzJZSzaSZXWG9ghxPkMRy69JeSQuz5PIFiSL35eoZyKkdtNl1
	mJGxNmTRS2vYDUBMQA9tbC9ORlvyhKEs=
X-Gm-Gg: AZuq6aI7IeQOB1suwlcvWHIPGs1WrRrisDFU/Wt5vuv1gEDrjkhPiuUd2F3K0xgblSP
	b98kVplVxcgjMt8nskpymTZ3h6HDwkVKaHgOFfh+45IYkd2V596PHK75eHsF/KtbmJcXfT46caF
	T5kFBe1XQiMQ3N737HccJiC82n9nAig23Vn1yPY3EYSl7dxI8KjhxWW+LHWD2Pj2//FBjizxE0a
	sxXe2P/D6TYZtQYXbuNkSDRaQo8OirvlydW0Whg22I/N8NeVbO9qI2r8dJfpSlXkUQRGk7gQPm+
	45qNqoaB2EyiCIX30Fcmdslo46w=
X-Received: by 2002:a17:90b:1dc4:b0:34a:adf1:677d with SMTP id
 98e67ed59e1d1-353fece4939mr2233515a91.9.1769535836129; Tue, 27 Jan 2026
 09:43:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127172757.75221-1-bjsaikiran@gmail.com> <20260127172757.75221-2-bjsaikiran@gmail.com>
 <2b8945c1-4372-4023-a15b-9187b9f23418@sirena.org.uk>
In-Reply-To: <2b8945c1-4372-4023-a15b-9187b9f23418@sirena.org.uk>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Tue, 27 Jan 2026 23:13:45 +0530
X-Gm-Features: AZwV_QjOBelzIdZqWDVxVxdPjcDYCRByhAUO8aGkMNo_8POYyvBeYU1nQCFwsnM
Message-ID: <CAAFDt1vLkiy6vHxqbKrrxUqNb=rocOjhU=HZ9+f6BmycUnxpQg@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90860-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 737F7989AE
X-Rspamd-Action: no action

Hi Mark,

(Apologies, our emails crossed, I sent v2 to fix the commit log format
before seeing this reply).

> The core regulator framework does not support this... specifically suppor=
ted by fixed voltage regulator.

I see that "of_get_regulation_constraints()" in
drivers/regulator/of_regulator.c parses "regulator-off-on-delay-us".
Since qcom-rpmh-regulator uses of_regulator_match(), I will verify if
the core handles this automatically without needing manual parsing in
the driver. If it works via standard constraints, I will drop this
driver patch and only submit the DT Binding update.

> What exactly are we talking about in terms of the actual configuration he=
re...

These are LDOs (LDO1, LDO3 and LDO7) powering camera sensors on the
Lenovo Yoga Slim 7x.
The issue is platform-specific: this board has large bulk capacitors
on the camera rails. When the LDO is disabled, the voltage decays very
slowly (passive discharge), taking some time (Still testing various
timings) to reach a safe reset level. If we re-enable the rail before
this discharge completes, the sensor experiences a brownout and fails
to initialize.

> This would at a minimum need the bindings for the regulators on the affec=
ted platforms to be updated.

Understood. I missed the binding update. I will prepare a patch to
update Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
to allow this property.

I will test the standard constraint path and report back.

Thanks & Regards,
Saikiran

On Tue, Jan 27, 2026 at 11:06=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Tue, Jan 27, 2026 at 10:57:57PM +0530, Saikiran wrote:
>
> > Some Qualcomm platforms require a significant delay after powering off =
a
> > rail before it can be powered on again, especially for regulators that
> > depend on passive discharge.
>
> > The core regulator framework supports this via the 'regulator-off-on-de=
lay-us'
> > property, but the RPMh regulator driver currently ignores it.
>
> The core regulator framework does not support this, this is specifically
> a property supported by the fixed voltage regulator.
>
> > Add support for parsing this generic property from device tree and
> > populating the regulator descriptor. This allows board-specific DTS fil=
es
> > to specify required discharge delays for RPMh-controlled regulators.
>
> This would at a minimum need the bindings for the regulators on the
> affected platforms to be updated.  What exactly are we talking about in
> terms of the actual configuration here, what goes wrong if we don't
> leave the regulator powered off and how sure are we that this is
> platform specific rather than regulator specific?  I'm guessing these
> are LDOs?

