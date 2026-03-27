Return-Path: <linux-arm-msm+bounces-100480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGUgGx/2xmkGQwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:26:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB82934BA90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A97F0301AA92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BCB392C5A;
	Fri, 27 Mar 2026 21:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WO5bVE/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C056A37A4BE
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 21:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774646812; cv=pass; b=qfx+0gAwjnj2W0On90BpUNRSy5AYCE5itCcDLOS1LW8sDw4EhSvJeiOTb86RatLpQg9J7D1r5eGuu7uuJVQpeWZ4zTp2oOW23PEO2Y4sTXhleEqcJGibtj9UQ+R/HjcJur4juL60403UVZPL/7jdj9uU0Tfzr0IsiTFYYrId1sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774646812; c=relaxed/simple;
	bh=kXXw2EpTzw73Xh0bFqRGE1umhRlJsmgldTwk5XXarrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y895UZxAW9xYKeZBChnFJWeuwX9PulYMjjQDMPzcnirq7DxctuV2nGPBN4Tq4EzAEStLJj2eN/P36MbQJsN3yQXnZDzznsFlD9/FDBx2Zk27gOHlEcYqjp0a2OkrorTaQ7SM6g1pHfFNIjp1uUdBIsoff0MRv0ca1+ROYUJhEvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WO5bVE/H; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38a2e62b893so22797171fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 14:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774646809; cv=none;
        d=google.com; s=arc-20240605;
        b=K+Po7gvNWneYNRaWeszdxYrrQs69HE4pe6L+m5BbiEELZQY+luAQ9Ty63bidYPa+jN
         Wywd/bu5aLmulk3qauge+MkPeW6guc+3XGxe+063i1Fm8XJFNGptw+qTbDvqWk1s3pD5
         vVQrVygPETQFKfjqKX/pNmEahY6673k7dl52pHwqO0TSQ4XPsDu2TQ7aoYOZhiVK1Q3D
         lsHCU2h/TomYnCag4RUeDJpKp9rt6MFcrXZnDqaAejtFVRO1fIT3q9tOc/04D7+sSXAt
         NJkj+hZ5lvFRXL5hBmh5/wouekZ3lEq2NcT+N5WDFy/VQrhEcomlroNPj9HLjYNgxcCs
         qghA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yzIbpxkj1XRC8SKR4D65gdSBDHJHQeOvaHBqMRkagdc=;
        fh=pRxsHBQB0c9gNLaooWmPfC0yKpT0+AHifFzmIISLf7c=;
        b=UO09HYrrep9VR4Rai7yvtgQjUCI5v+9gVvjopEOwBETeddI3C93p9dgBr6nk208cXq
         NBpsqCyaDn1P+kvcjm1+B+2274bbAMo28qyt6bwBkyPLq4pObaLERueOkM/qXaTdl1pb
         pdvgvQfm4f+q+NQs+n2xhpyAkBry7o5uFjgM3ub/1xmumIh0rp5b5K059cTcqxwqRhKV
         TUNuZ5PXWpzJGMch0GWPwOVpbDp+9nopSWfoSXyWEN1/S+i7Kd0z2uWLezT2/WZrbyp8
         zzVYKu7oXaIn6XPB7C/U8Rp0cV+7yOxrn859yNDLn5sabOJumLeOMBAEQ8fTxUBVbREl
         n+Dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774646809; x=1775251609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzIbpxkj1XRC8SKR4D65gdSBDHJHQeOvaHBqMRkagdc=;
        b=WO5bVE/HvGKWnMlPDlbPx6A2wt3iAJnVAAZnAhJ+tzSbuejVf9OoWvnvm6oiMx2v5B
         FAQzL9sxx72V2C4+Tg9iMjB9MS3siEjpGIRunZK0CUvnc088Jdh9pIhK0IZVkzXdV1ha
         Yzp0SUj+irebdGAgJPWfpINGPaYE4XTL5vDUw5tVH9pLFY350cuz+6D1SATwKH7Vjp8z
         N1sl7wPD3NMtUuoQ6rlJ/GrDD9uhNVXacHVB8TbsrsEvNfvQAW3nsdXTE7IzEK8/Ztbf
         /DL6UvfB6LOuE9OAdvsPwNuj/BVuLUl8PKCrzfklOQk8EQEZIA0ZWPlxnh3WknjPhBHn
         +tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774646809; x=1775251609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yzIbpxkj1XRC8SKR4D65gdSBDHJHQeOvaHBqMRkagdc=;
        b=LeBMg2IjW9tNlG3a1pNNoc95AVMr5S1OdWcB6ALpKKHfI1mH3V8957IUf3grW4ukP+
         ULBXorOC73Qt0V6+uwE7GeQ3U2LKXoezOwPwEOi4KA2NjO3AxfLoCoe4Vur7eBn6AOjv
         y6BIVh1MKgNcvSSFejrjpoMkwvTDxzC0Fw6ZE0Zks/cPd6a102WaB/D3xrlY19XVbuGJ
         5gdajN9u90U9w4eeIXI77+IbBhskt7E8PUH43cm4uxx//dLyc72chaogEKP8gMHQq1RS
         q0Uzk/xmDwLQSPwcBoErtrW4o8rLreKjop1ioj/tQ/C4bGnjP/PbjTMfkzwM1obRCbGj
         z7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6Pg5/WVIVyyu3MtRab+OdO6oRf0e/pWbmhvoGQIRyxoJ8c2DjpIOYnsHSAPQfIZ9X282f8ABmcRSXf9xr@vger.kernel.org
X-Gm-Message-State: AOJu0YwcU0S50GnS/ngtBrX2TQCebu8kPbaSeQbC21U79bIRhOOvyzkg
	f+B7UN4ChTfQokwA5+64PdLVNQN1vDcP35PS/NJAsu0usGjx6l3BcyL32hjCJQjnzhgXL4BzMAy
	sJBDbV0H3s/DvCF3Ekqnc/CLPTpzpAYGla1vq
X-Gm-Gg: ATEYQzz3jNHBBMGpqCtqomObCif7sZ/H+IdQf+9X09FpQBR+epUmecYA5zUXJ9cm0pX
	mNYmwDPCyK6lM4C/7HHBpjE2JBaT9mO9qOEBG+vcNYWsKtjQVW3iFVTqH/FTT/7LanIEDhX168o
	+utsZT2hcUC95JF06ua8YPODUIVGGbyULosQwipSTHB3qVO8noeO6QFvkVHtzYN57CAA7yIxt1b
	CAuEx9qryrwYBlt7JWZ6P+oFjid8p/jx/emROpqCqZIm1QG+AQpyVERb4xVpQqFfdvXbdN0A+kU
	EvI1fglI6b3ipdN/8Q7CzCoM21E5dIKc+uoT19GkLNIsHpdRu1WraKHo8BiLi+ScByG9
X-Received: by 2002:a05:651c:ba6:b0:383:7f85:8eef with SMTP id
 38308e7fff4ca-38c74005967mr11179111fa.29.1774646808772; Fri, 27 Mar 2026
 14:26:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com> <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
In-Reply-To: <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 27 Mar 2026 16:26:37 -0500
X-Gm-Features: AQROBzBJNtVhSmKRxa18c4GOnuqAv6f3gI8w-11C_oCyNdWuKoTbBzj5UeSOe4I
Message-ID: <CALHNRZ_tomry+tJh8g2mCZBM1XQcaA7p1ycK03GH1gPQy3geqg@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100480-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sobir.in:email]
X-Rspamd-Queue-Id: DB82934BA90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 7:36=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > This contains everything common between the AYN QCS8550 devices. It wil=
l
> > be included by device specific dts'.
> >
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
>
> [...]
>
> > +     sound {
> > +             compatible =3D "qcom,sm8550-sndcard", "qcom,sm8450-sndcar=
d";
> > +             pinctrl-0 =3D <&lpi_i2s3_active>;
> > +             pinctrl-names =3D "default";
> > +
> > +             model =3D "AYN-Odin2";
>
> Is this enough of a distinction? Do you need to make any changes to the
> one with a HDMI bridge to get HDMI audio?

After this quesstion, I tried to verify hdmi and am unable to even get
the connector to come up. The lt8912b driver complains that the
connector doesn't support edid read. Which per the current connector
node is correct, none of the devices list a ddc node. I am trying to
investigate this further, but vendor source release unfortunately
appears to be missing pieces related to this. And no other current
qcom device uses this bridge to take a guess at which controller the
ddc is on.

On a related note, I'm not sure hdmi is covered in the audio topology.
What I'm using is here [0]. This is in a fork of the topology repo
with aosp build rules added. Speakers work, headphones out and in
work. DP works only with the pending q6dsp fixups series, which I
should probably narrow down and ask for a 6.18 backport for. The ucm
config [1] I'm basing tests on doesn't handle the built-in mic and I
haven't been able to figure that out yet, so that's also unknown.

Aaron

[0] https://github.com/LineageOS/android_hardware_qcom_audioreach-topology/=
blob/ad67f3777b1d4dec5289bc7117f2ec34521be7e6/AYN-Odin2.m4
[1] https://github.com/AYNTechnologies/alsa-ucm-conf/commit/d33738b93e9560e=
8d9e08a024cc84c8055bb7eb9

