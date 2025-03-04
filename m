Return-Path: <linux-arm-msm+bounces-50131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47244A4D6B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 09:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADD393AB042
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 08:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143BD1FBCBD;
	Tue,  4 Mar 2025 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OR56CiQR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6846C1F3B8B
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077648; cv=none; b=RJ/t5d03MYRrQNwdui96HEKRhoUwEqtjfqK29soJv1kJNWbmMEvL5N3FENWXEPHv6TJ+DC0Ehqx2tDy4Pp+B41JGf42a3CqT23EB7NqnQ00fhNasz93jvaG+pgXnsF+zNY/HiCuI9RQBS3bQpNaCO62ZpNnD8eslDIFQZc655+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077648; c=relaxed/simple;
	bh=n2dqkv6VmIcMBfY2ja3ECua8O5M36w0yuJN1pE6B8rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okaBEgjWHkQmGXb2jHORWfGRnmM9cPreSAQmimCU3XC4/BB5YkVI6lQnfM0IE3MeUDA1vVHstjsZYNd2Rhr1tx/Cyq+gW20HZ37EVUJfvnI/8E/B+2pqFCv1ypzPQwMow5NHyaKTY+hUgRSomjrtdWpawnF1cUrfWJnr8k1b3OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OR56CiQR; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e549be93d5eso5887544276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 00:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077645; x=1741682445; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QjHa/M7Ja6GZpMzIKOU9aL6acZmi6aLPsZx9gsCJNXU=;
        b=OR56CiQRfELTC1vAZpAYq3Y5pA6jRmJnyCd/fzLFInPm/j5jnRTbHjjPB3bdDvpedc
         /xOfZt14TRWEHNMqmnPOgrNnYXSaqi7gzoBzixBhUDMpEujCUa65O+Gh7t20mb+XoXUO
         dSjMv9XPCiesyIS6NEA8zcgUSZ7W8eD2kSAmrcRaWPEb2tihUCGhRMqXeyWI/NO8Mfpc
         2W0ltiT7VzIgrQigXg6274PaOKuzwA2jtNN7KBvJkBEAZTrY6DHBwwMFnAPYaNAL0lup
         YadaXmTHVwuPCIZKXYb+Gop4Q2oJYwe59MKhoJfqovzym8Q7+O2Z44RnQwiPj33CyUTn
         ofyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077645; x=1741682445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjHa/M7Ja6GZpMzIKOU9aL6acZmi6aLPsZx9gsCJNXU=;
        b=hqJRTEdej1OnzTX2Vggu1waWJ4muOgOYO24QN1EhgfZmTy67MAZ/R+qqfa52eNgrWz
         43BYWl71SzRPPfzwIRo1+tibKXoBdsb5S8D4S3czf0KGoN3/y2Z1hjUqUvuYbkSplsls
         aGVHI+sKaUnWZwwbZaRRhpDLm+od2Ofg1qOLr+ugynmdVVHCtrshJWbifJiFnqBNcxZe
         hU6OrjgeoffO2dbn2UDmXxqdbZfm+f+qm02cHiwoFgj38i5AqAr0ycunvtGRqFXd2GYf
         kGbCGELRRVimtXwXZ7Z/NKDukSTj892LZCMUygE0g89EtsoRbj2YM+UzgKVPm8nj2AgE
         XXDA==
X-Forwarded-Encrypted: i=1; AJvYcCV6SqB56OG/lYgcFBo+V5CsLLfF/fLGaVxCyrFfAoph/5vAVMerMdzYZXNMjprXUgcuv2IjdGtl1chL2w3G@vger.kernel.org
X-Gm-Message-State: AOJu0YxYdNdPnxcMuJ3Y17wukf2c61IFQkR+xgC/RR8hoQ52JB2BBZgB
	IE7/VLxCJKU5hKuisgpx3dXuLvZKmZcURsOb5S0MqOaqDm3aMJBHPlzjg/okbUX4G2FkPGeCcUd
	26r+VGHngIBVJbwJ0xs7V1VINMGc9NvrYcxKwPg==
X-Gm-Gg: ASbGncuJRob9ZaoaxHCeQB+5mBTpb+VVcKCTLW+MqAozLKCR06F5FrBF6A4WKq1dvru
	dXXPEojnm51qo/xrOeeR5oOt94gDjTGy3kjOy+puV07zuIx0jgru9Vnsyi8TMczwO83UsJrcrod
	YKeDDq8LOvpWuxumtrhEjHR6Lk
X-Google-Smtp-Source: AGHT+IFXmE68ihSGPFYCeO8AjPuKwgMSkb/JwBeaSq10AY+V7CaG9Lq8teRSlJDX4sbY9VZhLECVXcDgKxqfBf0O+uI=
X-Received: by 2002:a05:6902:988:b0:e57:4226:8ae0 with SMTP id
 3f1490d57ef6-e60b2e9b57cmr18557753276.18.1741077645466; Tue, 04 Mar 2025
 00:40:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org> <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
In-Reply-To: <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Mar 2025 09:40:34 +0100
X-Gm-Features: AQ5f1Jq_CG3rPPvbs12wI2I97a8wGeUJnFI5bNoL6Im5zfyjM1I9k5UBEMej_KU
Message-ID: <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On 3/4/25 01:53, Dmitry Baryshkov wrote:
> > On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
> >> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
> >> domains.
> >
> > Are those really required to access the registers of the cammcc? Or is
> > one of those (MXC?) required to setup PLLs? Also, is this applicable
> > only to sm8550 or to other similar clock controllers?
>
> Due to the described problem I experience a fatal CPU stall on SM8550-QRD,
> not on any SM8450 or SM8650 powered board for instance, however it does
> not exclude an option that the problem has to be fixed for other clock
> controllers, but it's Qualcomm to confirm any other touched platforms,

Please work with Taniya to identify used power domains.

> for instance x1e80100-camcc has it resolved right at the beginning.
>
> To my understanding here 'required-opps' shall also be generalized, so
> the done copy from x1e80100-camcc was improper, and the latter dt-binding
> should be fixed.

Yes



-- 
With best wishes
Dmitry

