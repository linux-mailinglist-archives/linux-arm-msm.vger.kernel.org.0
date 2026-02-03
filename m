Return-Path: <linux-arm-msm+bounces-91573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7ELHAsd4gWliGgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 05:25:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D6D4627
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 05:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 065AE30574B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 04:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB84824E4D4;
	Tue,  3 Feb 2026 04:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlHeREWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12779214A64
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 04:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770092738; cv=pass; b=Ezuz/ypXnKbyUPq+bwuhY7G35M+kCc0my0qUXvB+LZOCZQ4kKJ1JDOQi3xTA/gENtPhsJtpIKTo69giPuRLPr0Ird1gWMjBWN3i3JOTGuPlmJzLST+btcNxiw8EJdDytMrC558+i/XfWLE2r5/pKbd7oxqzzy9bgWLkIm6FbVo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770092738; c=relaxed/simple;
	bh=EdHU03bhYYZ7yFrfwataaL8rRDvCETz6LV0rqKOKdtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmSpZRjF5c4FSs7xMUdwANY0QLmWUrFCSR2vSw3e9rxRxoINKpYtN8V7B3TbMxs4nGLy4Y287yruq2UiNiq7yFSIqp6PIZz3hOavsPRCMt/kjK0RZOL+hW9SVH3ITMuqSr4z9fUTkETQfB6AAQNhYNL5Do57ubMpHn91mKxeI64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlHeREWt; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59dea2f2ef2so5714332e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 20:25:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770092735; cv=none;
        d=google.com; s=arc-20240605;
        b=URmznNOLFslAAPUgxmt9V3PFrezr1OXwuZvCJV8c/cpLMRmNd4eKYdfJB54QR/jZFl
         DagFwhdxf5fRdo8z0vUr515+P+X0sN+w3hrdO3xP74w3SNT2IadyeBywcaJ+gXZ5P5vu
         VeXraD1eQDck9XuI7WtXEQY/eBSMzGUTGk9A2vu1ypnnG3ESza+lSuL5JKJQrw4+l78X
         szkZkUBhieO1SkEh8Z2k1ta7StJYTH+/DlI8WGzsDn0eLcc9aKfWa3DiScZ+CqHw6c6Q
         xMjl9mCRjQkFWdwyVD3xgtUMbx5ykZQZstIdhvFcvWhyiumI5R1HEfU91xnmZ5Z08WDy
         vlaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jt2Dm0RbGbWNotmQ8EzW0yNDULTzCqKQ9mn6zTmoL/8=;
        fh=J7EcKBTe82W/XC25OyOolUpzPrcPQgDqMHiT0QTE+3Y=;
        b=E7SWO2s/ehcqiLNQ2qrE9S3LI/4XtjH62P2NArtJXjReu4XkSVVRDeLUtsCXquKuGN
         B4IwJrGuDGceOZbkYJ4MnXn3R6+B03cngGp4KLA7G0mmOlYtgm0AuhnZZu1ISVM3FbU0
         1kWZWDuRFXpkVsELb5wv7exOWPlpD7u3prQQAVmboM1xLiutJO3dF1Er/RTOvzh/8ENa
         L5/7bGQfTWpl0QV1DIZGmuSM1RGtDpSsyPk+g/iWnfvBI++gwYrUqLgaGdcx5vI2jRmf
         14n0G3QqtVJHEZfuRuEOpeWWWC8p/M38FDkge1Ssk5sfOx9946jdO1cOn/E9sxv5p+qG
         /3Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770092735; x=1770697535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jt2Dm0RbGbWNotmQ8EzW0yNDULTzCqKQ9mn6zTmoL/8=;
        b=MlHeREWtz0oHlfTYkLxR8Dv2w1uGKnTRGwmBtz4vf2oT/faDERbNmIeJ0qFmnxs/KF
         8/sgmsqLgc/1MD/bb5id2FDgYv71VILJnwS2Q5yWL/I+DbPknjSj+J2kQAWOlLkI5+vO
         EPTThuikXSzW5g5sD9aiYn7tyaM8aiTSwDrB670czWDYviEXRyHCw9jux4VGORUdJ/d5
         ACyMhC5E6tZRqRrYARtgjiIyFVgkxG7V8cbpGvn6D4asR29/ydlGQCbV9YmWJ9pQSNbF
         XHwafpGrvSJBOL26/QZ+3+tnSy+T1nr3q+Y8tNaCBjzJ9PU4ZmBGti+F4ctpp3RPXlSv
         ROXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770092735; x=1770697535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jt2Dm0RbGbWNotmQ8EzW0yNDULTzCqKQ9mn6zTmoL/8=;
        b=IBRHKXyIfdYmacreXia21uazRrVk8zPW0AWkHCnzpaq9dx1atQEyM5C++PZEtvUR60
         ehHh5DS8GePXAMVP0tkzAwjPA4/b7zFL+eZOVoA0Zimma5I3Dy1Tr4lgIXwDBG9tZ0sp
         jdtxQPATFQvy3OG3531GMCQNCRZJPTOQ2DOjmqbcRpt89HWpwU8EFRhmI14584/swgdx
         f+4TpN7zq8LN+oA31oYpmjiz15n/CmjKzeWR/FjnCcn71+f+Lr5rq45ZXUiIyJaccFPv
         48XUaGOn7r5reggi0jPib5CudigoZ4+xell8WyOG//e5TryzizVCQ8sp+oH2n6CBhLdx
         Jy8A==
X-Forwarded-Encrypted: i=1; AJvYcCVywHjPAkH6C+tBjd3SD771sp/3ncxmc3YDgl0TBOVg2vsBZSult8Aoj32w9PMx439cbnE43FAihnSpVCyz@vger.kernel.org
X-Gm-Message-State: AOJu0YyITg/xvp7IJcyJX3FwrYHBwoRw2GCw+W952LmQ4jzrJVt6fzV5
	p+anJtOMGvIi/65t6vPasoBj7wjc1q56COxU8SsLgxwGzTxLlJmna9aEL6bV+eGNcdGwlAZmf+0
	Falp5tVX0vDCIIHq9o8G8EEQ/DdWL0dE=
X-Gm-Gg: AZuq6aLwFgX1KPf7e3ltfWIUMN9SBykaz1LHiN3aok5+5BzYyFzHWaUyDh21lHyUFXE
	V0gydvaApa5UHmWRUN7lZqYFVl2LgAsd84jD/6dMVVi6ZSHepLJhyIO6S4MSKuYx1e/zoZjKvEs
	DBdKaMvGC/NsAIBRlKVL3g2VMgIj8rTVHnx5C6QdgA+N3k/VQ/GKNar/ZXZS0PBAK1zNdlNKu47
	RrfXgmlasFKG24pIF3EsliGDZVhNPiUbHvkQ1BDlXicxiMO/T1V3kuPHF5iYlmxXD39qa3VPd/F
	EOMceM77NrNdFGiArxSPobs3ze0P1UINVEdAVZNxG4E9WxCiT8bvIPNf
X-Received: by 2002:a05:651c:2128:b0:385:d78a:1f34 with SMTP id
 38308e7fff4ca-3864657b9d2mr40077461fa.17.1770092734914; Mon, 02 Feb 2026
 20:25:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
 <20260129-sm8550-abl-dtbo-v1-2-abca3be14024@gmail.com> <eef70e37-3841-47f3-a436-13e18c157176@oss.qualcomm.com>
In-Reply-To: <eef70e37-3841-47f3-a436-13e18c157176@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 2 Feb 2026 22:25:23 -0600
X-Gm-Features: AZwV_Qhb8SSPNF0MwFMC1mpUlw4fi159-QRmg7Pfsiv0KcqLf4mSC9L9Xt3F0w0
Message-ID: <CALHNRZ-aj+rR0qFuiU+cPNsHWQgMJ2mMjzysJudY-TPN9tY3gg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550: Add tz-log node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kumar Sharma <quic_vksharma@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lei Chen <quic_chenlei@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-91573-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[146aa000:email,146aa720:email,mail.gmail.com:mid,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 935D6D4627
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 4:59=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 1/29/26 8:46 AM, Aaron Kling via B4 Relay wrote:
> > From: Lei Chen <quic_chenlei@quicinc.com>
> >
> > Add DT node to enable tz-log driver.
> >
> > Signed-off-by: Lei Chen <quic_chenlei@quicinc.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
>
> It's nice that you preserved the original authorship.
>
> Please extend the rather lackluster commit message to explain the
> "why", which is notably different from the original downstream
> addition, since your goal here is to mainly appease a grumpy
> bootloader.
>
> >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts=
/qcom/sm8550.dtsi
> > index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..740e3c238e8ed0f162dd168=
291f6e307ace66e80 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > @@ -5136,6 +5136,14 @@ data-pins {
> >                       };
> >               };
> >
> > +             qcom_tzlog: tz-log@146aa720 {
>
> If we were to implement qcom,tz-log upstream, this would definitely
> not be a node randomly in the middle of /soc, rather a child of
> imem, most likely.
>
> Could you please check whether adding a qcom_tzlog label to *any*
> node makes the BL happy enough? Does it need the properties that
> this node has?

It does appear that ABL doesn't care about the path name, only the
label. And given that the original change that worked had the label
pointing at an empty node, it doesn't fail if all the properties are
missing. I moved the node underneath an sram node and the bootloader
loaded my dtbo just fine.

The imem/sram node, though... The numbers don't add up. Per the
downstream dt, qcom,msm-imem@146aa000 has size 0x1000. Then
tz-log@146AA720 has size 0x3000. Which... starts within the imem
range, then blasts quite far outside of it. So... what should this end
up looking like?

I should also note that an empty node at /soc@0/tz-log fails dt schema
checks. I presume that adding any warnings would immediately get a
patch nuked from orbit, which is why I fetched a real binding and node
from CLO.

Aaron

