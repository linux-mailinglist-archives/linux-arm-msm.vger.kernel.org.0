Return-Path: <linux-arm-msm+bounces-86168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C01ACD5411
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 980F9300E7B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721D530DD1E;
	Mon, 22 Dec 2025 09:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+P+Omrs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4239F30C37A;
	Mon, 22 Dec 2025 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394643; cv=none; b=JbAgCHDXwb+gg+JWQCRQzp1TpxZCXjVAoXQtpqxXTOWGVhznXDfrh1FHINwoYGYXSG6pIm6Ehp+8oH6CYNkdEBnX4ROPh7pScHekKcFhDonBOVQnXQJnFYUSwqGeMNziYnoSZ3RqCwOXALHYNwBMSNCnX15hNRywgwNn0gI8XE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394643; c=relaxed/simple;
	bh=ju6HNzutFVS8n0IKENH8x8xfs1s9/b0YkEqiFBO5JZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjiXodMwjcfuFecFds7vz+mmlwQNT6boRFAuJFqBVcdQmlpWdxI3SaM7EIgUJmAQjYdU7SuWmrSv0E9njGQCYkyuouXU3t1F+Vg4TClW6KtrpP5eq5AVrmB/hwPomKoEKWZtAvXi1nvF3ku9RVDrf3mYnKr27QjKTeq2PcoQ50c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+P+Omrs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB46C116D0;
	Mon, 22 Dec 2025 09:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766394642;
	bh=ju6HNzutFVS8n0IKENH8x8xfs1s9/b0YkEqiFBO5JZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+P+Omrsdis9n/JCX+7sXMSsiblPbeOmVBnQB/8M3G3P2W2km+KrL8enRNNwM2hlU
	 e/KdrteUfenlilEp+FeDuvz7WNj3+u9j4XoyZvm7K+S24p170EmaWjQIE6ElO5xFJt
	 OG8Y5GA/CtIA+Dj6PQsm0QA8JLVJN2/wnMDJ92gDilYHDSmo5MLRUPPjUBjCW7dUF9
	 EyAP0Gkjx1Vb0c92Rl/435CsVp73wBLaxVqxj48t+puWOY4wJw8DYHa/u6xHQB043Q
	 XaQQ4TWBZtnbdUn0WRCtyVrkiVq26fNciB0vRSywDbJ4EAEzjf03H2upLY9fG5y8EE
	 vmfJX8rM+e0dA==
Date: Mon, 22 Dec 2025 10:10:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
Message-ID: <20251222-accurate-mega-dog-1d9a9b@quoll>
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-2-yijie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251222060335.3485729-2-yijie.yang@oss.qualcomm.com>

On Mon, Dec 22, 2025 at 02:03:27PM +0800, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>=20
> Document the device tree bindings for the PURWA-IOT-EVK board, which
> uses the Qualcomm X1P42100 SoC. Split the common parts of the SoM and
> carrier boards for HAMOA and PURWA into separate files for better
> modularity.
>=20
> Introduce the IQ-X-IOT series here, as both HAMOA and PURWA belong to
> Qualcomm=E2=80=99s IQ-X family. For more details on IQ-X series, see:
> https://www.qualcomm.com/internet-of-things/products/iq-x-series
>=20
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


