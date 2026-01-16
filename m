Return-Path: <linux-arm-msm+bounces-89297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18830D2A0A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 03:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1964B3038F2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 02:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53599334C39;
	Fri, 16 Jan 2026 02:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orNkOYCM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304D51AAE13;
	Fri, 16 Jan 2026 02:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768530040; cv=none; b=ZSMmbuZ08fsF58KTdu0VR0NG3efmsi3jz+An+ZpWSRyWBVRohfeEWbbOLPhN2F4YqSlKRxZrCgUW33NhPDcloZgLAqGsH2QfVCQ4i4LNWK0QpR40Wp94yy/CBSV4Rf349popaIEZ17u8EFLBzpqafJbwKGnBGCdpywlvOBKi63E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768530040; c=relaxed/simple;
	bh=YfFZJLSLFO4/tevrm1qDoUbfpCvk7oFl2EV/Jz6PUwQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=iji8W5rPDQ0OOKlcAl16MK1E6G2VmyiazNiKmB3queWJR8PCRHdQszteITLLHhxv9ZaTCagl/BW49yBipfX9eM2l11PNXKp44Y0JBGhuhOSdaOzbQbxa5N/87eZI5/0gEL5P0V8TL+x+nsHMzFRzxeyQHiJ52cKdB611KbrqTL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orNkOYCM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D6CC116D0;
	Fri, 16 Jan 2026 02:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768530039;
	bh=YfFZJLSLFO4/tevrm1qDoUbfpCvk7oFl2EV/Jz6PUwQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=orNkOYCMK1e+79szQumiLRMsOKbK9iNEQ9jn6Ee8+9doVTTgi1zzglgHZLtl3zNOC
	 Wh87IIwNMwmorFNylgDpto8CAzDmeA4rIkSw+X+upXA4sdEUPnRxx9BH6lAPphQFv6
	 kK1YSNR/YNTZOQy9Rxz/qml8ga0UlJ8xeIFmQ8z+cya9S6UokjxnjM8vI4q7qijJfn
	 keHciUNZ2OhW3p0otK2iQYQdOdEkWhaPw/FfOB31xhHICPUTwBiYkvOWqju1bI/3Bo
	 Sr0pBkoyO41SeEDJdc5k9do8/Ll+D8oy/R0IaMJg4RblazjAw4bSL1dL0tq288pbKE
	 trBsm6AehYfVA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251126-pmic_arb_v8-v5-0-4dd8dc5dc5a1@oss.qualcomm.com>
References: <20251126-pmic_arb_v8-v5-0-4dd8dc5dc5a1@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/3] spmi-pmic-arb: Add support for PMIC arbiter v8 for Glymur and Kaanapali
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>
To: Conor Dooley <conor+dt@kernel.org>, David Collins <david.collins@oss.qualcomm.com>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, konrad.dybcio@oss.qualcomm.com
Date: Thu, 15 Jan 2026 20:20:37 -0600
Message-ID: <176853003773.16445.3048989905490232224@lazor>
User-Agent: alot/0.11

Quoting Jishnu Prakash (2025-11-25 23:12:52)
> This patch series updates the SPMI dt-bindings and driver to add
> support for PMIC arbiter v8, targeting Qualcomm SoCs Glymur and
> Kaanapali.
>=20
> SPMI PMIC Arbiter version 8 builds upon version 7 with support for
> up to four SPMI buses.  To achieve this, the register map was
> slightly rearranged.
>=20
> Device tree changes are not included in this series and will be
> posted separately.
>=20
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Applied to spmi-next

