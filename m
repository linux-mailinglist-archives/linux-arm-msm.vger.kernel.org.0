Return-Path: <linux-arm-msm+bounces-75011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFC0B9E078
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 04A944E025F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912C426FA4B;
	Thu, 25 Sep 2025 08:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qsl01IfI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7FF155C88
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758788679; cv=none; b=B3Ghgkz43owY5vYLRqvFv3BWITlOkN2n51gSZvvGVpKu19xcNhvIbnAukj3LkPUiXC/i/rzttNdEmNJF49Rmh5tiDGf7FrGZl6O0PBHosSLwaWkMCjVoMXURf1FO2SEHQVXpzIV4FqedBEvdCnQtJeqsd1ZoHz1Rsy2e0f1B77Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758788679; c=relaxed/simple;
	bh=sTAR1grncL68dTEELBlinnV4e/5cxUfPyddmz586pzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ab5f44l+r5t0JR7eN/nl3EoK9avUka+hwBlMcB6Nq9ML9Fjlbv3yyr80VQDD1CoBd6mqcb5M372vqBprk6aqdKn1GfhwUM4uhqaT9dKOo+jDGrarjgfmygS2Tbr+NrQLoRNeH8+zi0OXui9rPqgJuh+SEEaW55gWl0gVg6OxZ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qsl01IfI; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-27eceb38eb1so7419615ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758788677; x=1759393477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6V4Dh7tKP33MFC/qEDuqzXdiriXrPzKRW29udUVBt0U=;
        b=Qsl01IfIZIZwB76KPIosUg0a6osOo3O4VhTMMtQzMm3PUlzQrQ25k3N+mjZkdQdk7j
         U3QSWNNRUQw9gfs2VJJa+wPSqelUV0CeO2JpBhqMdP8KMAuoGlRViDVRJfW6JpiV0DTk
         owxeS7XD1BSXgegCvu32SWQGef2BnnwPat23VC2jCy+FtOMSYSu5JnHZ2blkjBY8fBSv
         H/vLbYmEi3cju8tJ+wP09mnuF9ssY1tQvZQuNfK5CWtm5D1quLWn3/oql/EPJfsmpEQ7
         bqRLGh4v+LOQ1qmLwKUFnip0J2xgVOvEhvWTUzDeghDenPig91Q677J8vlTdBmgljIEV
         DSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758788677; x=1759393477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V4Dh7tKP33MFC/qEDuqzXdiriXrPzKRW29udUVBt0U=;
        b=YkrLKGSPOfU1xMDflEJYH6Tsw5RcOjMCGhe+RA1it3KiE/ASy6cixfFigA3qFYA4Tj
         UdNa6dOIoNEj7rluOm5ZDXY9VjdVThmnl53Ih11QWUlxhl7r2z0oq3VVE8whGoEQBn2z
         ar4fCLK0LQFJLJt2EcWomDQ96M3rITIT0SlGuTX9/+LI7hgvT3QZInOG9tg8oeLgoWbo
         Fr5uJf/l0cq8L2xJa+rtjQtaf9/oKIqGpEX3XCnG/f4dp+M6offBKBROAS7TjLzJk5zd
         Z16RzFgxHjLpjod4nA1m34iXjwIZLfp92aVmGE3qCVwaQ7/qutixwW2rprIfKdWDRlU6
         /lSg==
X-Forwarded-Encrypted: i=1; AJvYcCV1ica6hEZZq0a1i95TXlCw3HChrioheiIdO/pmLHDJWKW7zFBEuUSAeL+4vq7rILdKyY1y50YkOS/xwFkV@vger.kernel.org
X-Gm-Message-State: AOJu0YxwlAFQ9zp0Rsa/I2/32Ocmuz9lSZNsyTfGWw7j6SoBdeD4R+ZP
	w7Zl5q+UC0WapbYPtKu3QBlqRzrhM5fH4UCQfiQJvZ1n0WKh8h4JpgRqeeQ7xe47TNeK8002kEg
	GjTt0GgBrllwGYIMsjd90RwzatgK3ZNw=
X-Gm-Gg: ASbGncvnHoQbLXbP8ZJ26Mp0982qJIhqkjuUvm88Fw5UvibZev+IRH8QPtZAisAJJME
	QHBagW9zx6TraDcngdacyDdybkqcYp08PmldGiokgE9vyjZ1qM0H8iLlJRkj3uZz0UdZYgg16GD
	0Py1nILyMM+/ObqtjAeScFi4hOI9/fc18Vv3gK8eVcOx5Q5KcFtG4/qfzdM6aQkrJqTNQzVuNFV
	NrifhPD/7p1SzQ4Hdh4ys729ul4M1+UzPA+ZrzCnyITL/4m
X-Google-Smtp-Source: AGHT+IGscpAzAZePJIei4M74SY6t3g5clNF77QW53FQZcP/FV0TyOxZ6EHRVDKib2OHnN3hszfUnxw4zg4b0WsneSec=
X-Received: by 2002:a17:903:8c8:b0:267:f099:c687 with SMTP id
 d9443c01a7336-27ed4a29e1bmr33522235ad.1.1758788677041; Thu, 25 Sep 2025
 01:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com> <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
 <53d63dd6-a022-4e80-a317-3218976a7474@oss.qualcomm.com>
In-Reply-To: <53d63dd6-a022-4e80-a317-3218976a7474@oss.qualcomm.com>
From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Date: Thu, 25 Sep 2025 17:24:24 +0900
X-Gm-Features: AS18NWBrs_SxQohXhwS32-u616VxPcXUdBxvUwQGruDi4ncYM81jJN8M3_KFGEM
Message-ID: <CAJKOXPcsVvb2gNUdYYvm2AP90AjGUCGpT9jVU243E7C_N764rg@mail.gmail.com>
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Sept 2025 at 16:39, Aiqun(Maria) Yu
<aiqun.yu@oss.qualcomm.com> wrote:
>
> On 9/25/2025 9:50 AM, Krzysztof Koz=C5=82owski wrote:
> > On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.co=
m> wrote:
> >>
> >> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> >>
> >> Add the base USB devicetree definitions for Kaanapali platform. The ov=
erall
> >> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> >> (rev. v8) and M31 eUSB2 PHY.
> >>
> >> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 +++++++++++++++++++++++=
+++++++++
> >>  1 file changed, 155 insertions(+)
> >>
> >
> >
> > Second try, without HTML:
> >
> > I really don't understand why you created such huge patchset. Year
> > ago, two years ago, we were discussing it already and explained that's
> > just inflating the patchset without reason.
> >
> > New Soc is one logical change. Maybe two. Not 18!
>
> It was previously squashed into the base soc dtsi patch and mark like:
> Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
> (added USB), Manish Pandey(added SDHCI), Gaurav Kashyap(added crypto),
> Manaf Meethalavalappu Pallikunhi(added tsens), Qiang Yu(added PCIE) and
> Jinlong Mao(added coresight).
>
> While it is over 4000+ lines when we squash it together.
> Also as offline reviewed with Bjorn, he suggested us to split out the
> USB and other parts.
>
> >
> > Not one patch per node or feature.
> >
> > This hides big picture, makes difficult to review everything,
> > difficult to test. Your patch count for LWN stats doesn't matter to
> > us.
>
> With the current splitting, the different author as each co-developer
> can get the meaningful LWN stats.>
> > NAK and I'm really disappointed I have to repeat the same review .
> Currently, there are 10 SoC DTSI patches sent, structured as follows:
>
> SoC initial
> Base MTP board
> SoC PCIe0
> SoC SDC2
> SoC USB
> SoC remoteproc
> SoC SPMI bus, TSENS, RNG, QCrypto, and Coresight
> SoC additional features
> SoC audio
> SoC CAMSS
> SoC video
>
> Which parts would you prefer to squash into pls?
>
> --
> Thx and BRs,
> Aiqun(Maria) Yu

