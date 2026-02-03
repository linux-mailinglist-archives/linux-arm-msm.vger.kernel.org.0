Return-Path: <linux-arm-msm+bounces-91579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHglC9t8gWnBGgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 05:43:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C97D5D4756
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 05:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44EA63061449
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 04:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0509E257423;
	Tue,  3 Feb 2026 04:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4yVmeve"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4404D248176
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 04:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770093755; cv=pass; b=nk1VoBVqdjgTj4lEt4a0ac9y2N+uIBx/7eUeQWmh74nUiaZZl1BU/1DkN9PQVstpy/8asZeFxzjBhVM80htIoktkVu59Nqgyx0yg8hnvt+CCEJciPFQbQ61iPDSEKVqjO4Z2bPCusSMvC6WGGEvMrlezNyUld/1JPr8U7aiWOjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770093755; c=relaxed/simple;
	bh=/8MeH1cttYJ+MwAM/CE8nR5NDqaziX7ysD507sQ8ToA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMEGfwuYv9gZNFoalC1R+kZnzf6DPToMgb07OX/OvdRA3kDsSyuE38clzqgESGSFKlMR25f7vviIlQ/mCbeZx1GNfI3q6tnX+n3w+UXWi7/nIT5pep+o/gF+WeMzuppMne/56c1w2GFu/Q0BNswShtA9Pa7qKNP7OmDoYUdNhSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4yVmeve; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-382fceabddfso40612941fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 20:42:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770093752; cv=none;
        d=google.com; s=arc-20240605;
        b=Pmn8yBU+eHMTzYVNb9XiyxBcUj4cmBJFcggwKW5hugefOxNEQgVxNMyBfZ+UnGwUgx
         2tueFYlcH5wG80ETUf5rR7rdl9PMJO0AbGoC0ergCn0gm70XqW7gXSX8EpKQz8DfdLKr
         qqpvvS/9x35/4o2A5CE0XDt9ZJC8CjxxA8A+ApPE3O3uaPrNnzyYw5U+dSOYPdy0Sxkw
         oUbBb54jC9RJPfKBqgxkLSapLgvZkFeXdcw8yAUsTxOA7jcGWV19WEPX9Dbb45xIGgOc
         eJnA9+MIBBlzN100UFRzObZwYXiQ3IjC4gfWhMvcHdrJD+1n+bgtrZ3AES7ich4xTY3i
         Lhfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHEmHpURdScauMItQeuVnDL0KvlEqWGD4wZIXfVvz+0=;
        fh=lcwmiMHpI0JKRIKxoHQ1eDZk90aQH3vjEkY2QmvP9u4=;
        b=ZDb8Ziu72s98uLR89QLkFa9LspFCw0shQ4XciDoUTaA1WBewkj9gapocp6Pq+KoNrH
         ZW5I2bPUrUKJbrtM9rbjD19oZGCAM4WH4qOBcv9egUZ+SGXNZomVfibXaaDz6fj0ElgL
         P+27efYMF6CoJn3E4sEgg+OuzAheYzFyyzj42yS9CKFtazKvA6XDpGSWGwNJSOnRrG5M
         2s1lZS/9FZiWSlshiMqnmTX4CpHS+fNAIWEPcbX8PzWggC+PdQgD/WO0/tBgpqgz5DgX
         tP6mfuiEY/r2uBaxQemp3MGceaZ9ZANgaxrCgz/NJq7z3oh4jopfF4EzbbN2dSh1Kg6n
         RfFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770093752; x=1770698552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHEmHpURdScauMItQeuVnDL0KvlEqWGD4wZIXfVvz+0=;
        b=K4yVmeveOTkS5/HVEaB9C2/2edMirWwViOLJbil1N3urqtMZHiSmZLPOCadJn9uRjv
         QTXs7bcImIR/XSa9G/ntESm5fTDH1XIKgBqgPmNxnxmP9r1nptF6l0hIoTmWi7t8sMjt
         ms5NZieuGpnfxb4YIZqK6aWGt7+T8C3o2sDSNmBRF3Grbua6pJCKX99Mwe9D0MWlFF2M
         88E3bOtoNtq9LKve7nE3GdA4UbhBN3UEPkQLUFIWfr3w8VYx2Q7O+cCPRu0OCo581z91
         Qld41P8MJDquQtNnIhs2DW89kSoxTbxZ8jF9jhnI0kakvGfdxjd7AYOQ8/eFMDhyuLNk
         YHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770093752; x=1770698552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WHEmHpURdScauMItQeuVnDL0KvlEqWGD4wZIXfVvz+0=;
        b=NscyTA2FodDsKUE1FlBnS7yMRFLYPkoaLeBzoSk3cx7CU5MqLwUUD1vx6E8m4Abvcn
         0ICGHTQRxoYCZSvT9Ckn9XwmfswPxCnuGdmn7iUzcD4C6pfz1/fnLZ3XcarB7YIZzPV9
         +Vj6Y8RHKM4GBCwmy5WM5wazNSCLNl5AmqLG5S65rS000s+Zn3DVUjgNhMsBVHJNIXqS
         ZHS04lieKeWOkjVlmGjTS7KyubT91YFF2xlXgdH7KKovSkLXJcFvUF7xSJrldOHtiTw+
         QCb2ko7VGd+k7S3R+keSdTYL/xOYUNxJul1OjLUyb6TqOsNGi4K+P6lpx0BQ9xOOnZmH
         ZlyA==
X-Forwarded-Encrypted: i=1; AJvYcCXtYK+yKVy3UGV3aLbK/JXBdb6IBrV7Bk6elfJAHo0e+GrQylT0PiQwMZBCM9i2SaN/4RvhsD2TRPL0kBWy@vger.kernel.org
X-Gm-Message-State: AOJu0YykOZZRCZDTQ97+0SvQ2UPOUirtVEI+ewpqCfneyg5HytA+YhhS
	+UqzIcIppZpd75In9n3ylO4rHiyGGOwyKcFKxF1+AueEoQNr7G0zYxWNG9T3WV3h+m1DWw/JTa4
	8C9Fhcq3AJqS8A+h1kj7ZutizphwRPeM=
X-Gm-Gg: AZuq6aIwBEWy9KMo5fLDSfmGho9SWXfOWtDarxMamRGpXq8jOXFup2ys0LAwdQG7RQu
	9rjo1m8X3+vqRuisxhWF8JpU5s3nMeKN9KOCfAiPDLb8Lj56sGMdi00ruaKQhr/4Jr59l//1O3u
	LtfXJC1onOlyg3rUjzmmRUj6JTw0hW1qdDO4+7V+j+cG/SgNE2lXHMtJxOauzOY5CrAHqMNIBm1
	ZVQKcqw7yxnh1iN21eP/m1XQDqVxNfcBcs2/Lirv+Vi6tkvZMrZjeBZwbzVbJDdk88G9JELdTDA
	2EDaOh049qk4GrqfiQmwH+yN2Rtvd/e/q5QOxiPtfCLHVAsvAfOvZG17vE9u3mCE3+I=
X-Received: by 2002:a2e:a54b:0:b0:385:c213:4d0 with SMTP id
 38308e7fff4ca-3864669c841mr57076771fa.33.1770093752129; Mon, 02 Feb 2026
 20:42:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
 <20260129-sm8550-abl-dtbo-v1-3-abca3be14024@gmail.com> <7d473eubnez5gcbou6mguomeetpotp73q7cjol3kfjlg7pz5r3@yjsh4rd4mwbv>
 <CALHNRZ80+KAfm2YHEoodBv_7jDZPZjtr-koo7q_N+aX+i1OfnA@mail.gmail.com> <osqwux5xkf4337gahljlkdvoeek6sudxcee3xqb5kp2ngqhwzj@6tz6xjj3cozl>
In-Reply-To: <osqwux5xkf4337gahljlkdvoeek6sudxcee3xqb5kp2ngqhwzj@6tz6xjj3cozl>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 2 Feb 2026 22:42:20 -0600
X-Gm-Features: AZwV_QiGtIQno5YJ8WByb9vDMG6D9IXqOcfdn8pPIGkyUNFp3ou3eV4gE9z_Px8
Message-ID: <CALHNRZ8j4XWg_oVdPTTp+RPhsEtYrjR3iGusACgoa76dGL0U3A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550: Fix DTBO boot failure
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kumar Sharma <quic_vksharma@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91579-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: C97D5D4756
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 4:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Jan 31, 2026 at 03:09:12AM -0600, Aaron Kling wrote:
> > On Sat, Jan 31, 2026 at 1:47=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Thu, Jan 29, 2026 at 01:46:32AM -0600, Aaron Kling via B4 Relay wr=
ote:
> > > > From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
> > > >
> > > > ABL requires certain things in the base dtb to apply a dtbo. Namely=
:
> > > >
> > > > * The scm node must be named qcom_scm
> > > > * The timer node must have a label named arch_timer
> > > >
> > > > This aligns the sm8550 soc dtsi with those requirements. Without th=
ese
> > > > in the base dtb, when ABL attempts to apply any dtbo, it will fail =
to
> > > > the bootloader menu.
> > > >
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > Did Pavan provide an SoB to the patch?
> >
> > No. The change comes from the gunyah watchdog discussion here [0].
>
> Pavan, can we please get your SoB?
>
> >
> > >
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot=
/dts/qcom/sm8550.dtsi
> > > > index 740e3c238e8ed0f162dd168291f6e307ace66e80..d7cc20e1931904e7c60=
3b800089f00955ecec3b7 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > > @@ -329,7 +329,7 @@ cluster_sleep_1: cluster-sleep-1 {
> > > >       };
> > > >
> > > >       firmware {
> > > > -             scm: scm {
> > > > +             scm: qcom_scm {
> > >
> > > This one is a definite no-go. Device nodes can't use underscores in
> > > names. It has been told to Qualcomm for ages. If we didn't comply, it
> > > doesn't give us a permission to break the rules.
> >
> > I have not been able to make ABL load a dtbo without this change so
> > far, though I have had a suggestion from off list that I may need to
> > try a different method of flashing changes. I have not yet had time to
> > do so yet, however. Given this list came from a Qualcomm employee and
> > worked as advertised, my tendency is to believe that it is the minimal
> > required.
>
> I understand your point. But I'd really not encourage my colleagues into
> thinking that it is okay (oh, it was landed for sm8550, so it's fine to
> do it in future). And I can foresee this pattern to continue, because
> even the latest downstream DTs I can see the qcom_scm node.

After further testing, it turns out that this change is not entirely
required. Alexander Koskovich pointed out that some things apparently
get cached by ABL and don't get cleared unless all external power
sources are removed from the device and it is powered off. Previously,
I was flashing new images, then doing normal reboots, and seeing the
failures. However, if I leave the scm node as-is in mainline, flash
that, fully power off the unit, then attempt to boot, the unit boots
as expected. However, the other two changes in the series, namely the
tz-log and timer labels, are still required. Not having this change
will unfortunately make user install instructions more complex, but
that is something we can handle. And the rest of the changes should be
mainline admissible. I will drop this part of the patch in the next
revision.

Aaron

