Return-Path: <linux-arm-msm+bounces-92711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJNTKVHqjWnG8gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:57:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AB612EAD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2400230713C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BDA35CB70;
	Thu, 12 Feb 2026 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jd4w4Sna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D022D7DEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770908044; cv=pass; b=Xmc4yQIau4kpxytEe7rkVZGyZ7eeVhAHkQBpSgvBJYxRMsMedJVnt8Pf2L2mW15oAZ8IXnj2CX328YzwgaWeSw5wCKDZn8oU58msij+xY5YxucYb8+sT7kanXFFedAKkKHGilnkdq98QTuCICpe1fYfJjc3mCvwLiGKzrpiu59A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770908044; c=relaxed/simple;
	bh=MqGYhwHpWi5aft1/BsfvJRVVckQbAZWFB3oMoj++L3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rv/misHZOot1YL303HASi5nMym0Fdakz7ww7gBGfZVggq8stpE8Y3cDb78aF7YTVoWJ0VLPEWqAwIumqP4xbWsoLCAxbg9+sN8tBA7L7WjfiE8SwEe9H18AIZw3DgRconci1ifyMHy+GbO3TQs5SYXY4JWOeGh1it/vGUX6aIUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jd4w4Sna; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59e6491f1a2so988005e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 06:54:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770908040; cv=none;
        d=google.com; s=arc-20240605;
        b=AR6nn/T86Cp/p2P7XlhvOH2VETxYrTm/mH2pfAxeotucDiEIkIjv/09IEJMfm7qSMY
         NS5w+q7NU9x32HCji+0BXpBZD4ZsdC1zOfxJj4fOW+IutaCk1d878nVJL0D6b1Z7Vy6a
         j+roppgwPzgO/Yx3IlA/QtPCdcqHhFBpKWQDo4L+Utp0+yc5mQKTXu+OSUKE9db/iB9W
         NOwxM7PqPZXVGKJo+kZkBdiYkzmdG2Ri8NWp5vmXMmnrMks9L9HEmZAtcRLiEsIQyl+C
         1BsibvTvZ+qAZxQQVUbH+ghz90s0N2QKIrV9wVQbFe4czm3XILDmBO49z88B+A2Tb2gA
         ZiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xo+imGwld0ypXcQL2ZjsD6a3MiH21wOGQwRuA7g0DBo=;
        fh=kre/XJfD61kdrPTK+00TeRuD+mpEeHiNUXvqMgJK3a8=;
        b=d+am6tG9isPkl4oH7kAwVIXT4PziWSZvrbwdMyz8luJYISkn9bm99oWwrq8Ubbnkwm
         JTVEd8NmMgY6Rr8wn1NWjvExLP5AS/2docmirrUYh8kwtbluJNHgW1iwtJKSLgLhHhGN
         QzvDkt4lWI3l7BUUp8ykdOdC6cfAdLA9csmtuuLHLOMz8rmsk5I4zEx1beXJ57ZCmvG9
         ujRfvO9JRyHSOI+y630/z4KX0KHAN/vzgl19fWDJA92ihrNw4+O5gMc3g5GMBZfE0NtZ
         gGDDnXnjH2hcXAjUyOoFHlz/IKPTGcEtrOxNOVlZkOQvfhNYRptMRKVq67QOYwR2kKXM
         norg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770908040; x=1771512840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo+imGwld0ypXcQL2ZjsD6a3MiH21wOGQwRuA7g0DBo=;
        b=jd4w4Sna3JSZWgjOS8uPT3Ri4U0dxFbSkWGB/oFYjmiEb/Hz9HrFIkfgEXBnk/eOoI
         a5fXOIuGUYNU1IhOR7/r4/0y1o2HH9xC0Mf4WbVCj6mPPbN5WTAlzkdCz+iOGaD7Dj+V
         0CI+NJOFuEaX3uWROvqvB2+EWtcbCD3AC7h5XI6ytauJC+gFeULNUnKPpUF3UsXkenYE
         AY1D9LePzp6B9nmxqa2OudHDzqX2O/MTGIamWM0TwNFsT00zPzq498mGvr9do0rHiCjg
         NzctV6oTcUkiv46fPli3LfZui36q3UJDvrwsU08VSa86Ni5CuazuVtt/gLq5X2PJYn/R
         3dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770908040; x=1771512840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xo+imGwld0ypXcQL2ZjsD6a3MiH21wOGQwRuA7g0DBo=;
        b=lvlaQlhQB7mdLq0iOaGjDUqym5hslZgznGTkPq7K8AdDZytw2GwqGHN8eeKSqlQBOb
         8P6k/Qbq9EEFHjVaMbvPtNjAb1hdS2yG/B+5cjtwxZXEPsj1jiFucVmRYQoDhudJDenu
         UC+vUJ5IlxnDQXYxummhcT+TvnRJD7Jy4U9S4db7zS0ssmGqeUIYSki+hdytiesFLuS+
         ttl4d4/ITg2fppHJj54e6K5nOo55ziMuhcMPsDPNKxG6USZ/UoTpW03GZKnaPDc3tH4U
         Zq8MgkabPkcg+p4N2E8rWexyyMiQCpqIfKZFS0k2zMp4zxrfdibwQedXqRuKEKBV7XJD
         TIrg==
X-Forwarded-Encrypted: i=1; AJvYcCViZM+D0twCd84qpt63BB/rErDRXn5LUlLrkhOTOJj/MyHmvoET/bVXUefCI+kG98F7Wp6lUBCa3+kjspWP@vger.kernel.org
X-Gm-Message-State: AOJu0YxAjkf/qybZGvNemkA3ik5avG7KPOFm37a3NpvSzmmxxInutB5w
	v7ByJBBUKdnmDcfpuCNNRSxaiVSiTLMbo/a1yurj2FmBA3GFMUN/NFU//GCimsnyf6IxNhlDEx3
	T3cO3ryY584a/OR5tLiCkWUsk2bLtSRE=
X-Gm-Gg: AZuq6aLxEv+B+7E1/uMxpbQz9oVomDP5CT+gDIYMTk40X0gpWtyaCJDoBZ0JPXYx1AY
	6IKoQp6pF99e9+O3UdWdGWmrVp4yYXV+kNESqJ8qsjKlXARisRpoYTWq0ex2aDEp38V43LRMPVi
	+BEHbgTKfKgJyOIB8YNdrArIeRBrmBdcrAp30eTt6BW9R7j6z+QALatpOTdZ2xsajVlMShufRoA
	n85f1oWXsm7r6rrXJiqs46NKExaPC9789nCDaO8QkYQQhZheST1JOmeZ2G7yqu5CTa47SRLRD1j
	dNuHZBeC0WSP0S5/mMtPMjjHqY1H00tGC6S54gzG+VXb84z4y/fFrmF+w8L6wsyVMh621A==
X-Received: by 2002:a05:6512:287:b0:59e:5cf5:fde with SMTP id
 2adb3069b0e04-59e6497a284mr726636e87.25.1770908040167; Thu, 12 Feb 2026
 06:54:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211-sm8550-uart15-v2-1-bd23a0de18bc@gmail.com> <567d28df-485c-4dd6-bfc1-5c357da7dde7@oss.qualcomm.com>
In-Reply-To: <567d28df-485c-4dd6-bfc1-5c357da7dde7@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 12 Feb 2026 08:53:47 -0600
X-Gm-Features: AZwV_QjhXUgdr7_mKSxZ_vIxTTv4ghZwmnd84HDzREkIBKN1kPhN1nsfEyya7-c
Message-ID: <CALHNRZ9siWXhXGob0RrrYUauUu9hjChMhJTMU_BWoo9EGfEQ=w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Add UART15
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>, 
	Molly Sophia <mollysophia379@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92711-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 36AB612EAD9
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 4:49=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/11/26 11:35 PM, Aaron Kling via B4 Relay wrote:
> > From: Xilin Wu <wuxilin123@gmail.com>
> >
> > Add uart15 node for UART bus present on sm8550 SoC.
> >
> > Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
> > Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > This patch was originally submitted as part of a series to support the
> > AYN Odin 2 [0]. That series stalled, so submitting separately.
> >
> > [0] https://lore.kernel.org/all/20240424-ayn-odin2-initial-v1-0-e0aa05c=
991fd@gmail.com/
> > ---
> > Changes in v2:
> > - Use QCOM_ICC_TAG_ define in interconnect paths phandle third argument
> > - Link to v1: https://lore.kernel.org/r/20260207-sm8550-uart15-v1-1-d8c=
cf746d102@gmail.com
> > ---
> >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts=
/qcom/sm8550.dtsi
> > index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..a54f375f7f041a193a4396e=
4aa911abb42e3e6dc 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > @@ -1251,6 +1251,22 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY=
>,
> >                               #size-cells =3D <0>;
> >                               status =3D "disabled";
> >                       };
> > +
> > +                     uart15: serial@89c000 {
>
> This should be uart23 (see other nodes at this base addr have that index)

Am I missing something here? For sm8550 [0], I see i2c@89c000 and
spi@89c000 labelled as i2c15 and spi15 respectively.

> > +                             compatible =3D "qcom,geni-uart";
> > +                             reg =3D <0 0x89c000 0 0x4000>;
>
> Please pad the address to 8 hex digits with leading zeroes

Ack.

> [...]
> > +                     qup_uart15_default: qup-uart15-default-state {
>
> And let's also update the name here
>
> Konrad

Aaron

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm64/boot/dts/qcom/sm8550.dtsi?h=3Dv6.19#n1205

