Return-Path: <linux-arm-msm+bounces-49196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18876A42D76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 21:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11367172B94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 20:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D01320AF64;
	Mon, 24 Feb 2025 20:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0Si20nY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C1426AFB;
	Mon, 24 Feb 2025 20:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740427950; cv=none; b=fVn8MwD320AdgFvyskLGFuPoUHO+NZAifSr3gwTgcIxSIP7lNZTjNivvuLsN8uhxXKmKrdWwKddqBhqc//UFX5wKMH6p64fPD9GZsDvAqQ5fC5iAsmRoG+iDdepjXbvzbOb8hPpdyLcmnzp03hQ7pMp0n/Yuh3C65DF4Ha5Ni2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740427950; c=relaxed/simple;
	bh=vhG+HEasHzMxre261xTYgK10+Xv2D89jkt4h3vpSTV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cl+Lo7yj9fe0pI6kFKq13aHU+FCNXvnplUrvlBbmZ8SiqcrW3/A8xqkivlPGbvQYEcYTRWdDcLglHpBgVQS0LvtSYknmaXYkky9FSXjHPTJ5WTa+jHgnGgViM61FOA+ESNma8O7TQCuJs1FG+M4GgJjdjSXOAo3dp1Hilgxi8+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0Si20nY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16374C4CED6;
	Mon, 24 Feb 2025 20:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740427950;
	bh=vhG+HEasHzMxre261xTYgK10+Xv2D89jkt4h3vpSTV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g0Si20nY+6A80eQzQThaCxJF1KRv9EE6K5eoOiJ/YVQzAoihlck3mIRNvbBJn58yk
	 0DbrxRfENHiGiGu3fFRvdyKVIe8s1TjGMRgvtHjf36eqcFbbv9Kwbs175OsE2F8xJQ
	 U5JAAOcTiKaANW8osRz2rguDEtKHRD1JIXF80mu/CKjScMBQSs6xhi0RrHDUfe3nLN
	 BIZ2165DKm0FSN4DJfEg8RH6IwCv5bwMbbySl3Oh2y2kFbpSA29ZnpbFpBrClt57zO
	 tW83Y36HnC5+PFhVRXNlPMHIaxOy71Br1+LaghvDaUWAXRRpyY2AkaXUuQxDQq0DAq
	 smbiz6ECVXB+w==
Date: Mon, 24 Feb 2025 14:12:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	devicetree@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom-qce: document QCS615
 crypto engine
Message-ID: <174042794804.4025396.5123328603450719787.robh@kernel.org>
References: <20250224-enable-qce-for-qcs615-v1-0-e7c665347eef@quicinc.com>
 <20250224-enable-qce-for-qcs615-v1-1-e7c665347eef@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-enable-qce-for-qcs615-v1-1-e7c665347eef@quicinc.com>


On Mon, 24 Feb 2025 15:34:10 +0530, Abhinaba Rakshit wrote:
> Document the crypto engine on the QCS615 platform.
> 
> Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


