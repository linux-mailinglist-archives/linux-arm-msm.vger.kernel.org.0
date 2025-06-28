Return-Path: <linux-arm-msm+bounces-62903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD80AAEC727
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 14:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A5533A806E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 12:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D9E2459FE;
	Sat, 28 Jun 2025 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9VPwyMH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072E82F1FF1;
	Sat, 28 Jun 2025 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751114174; cv=none; b=GPgMvjUzVYyuFCpVuantDQvrT4M9XEIdt+jo0HX1n0YKRl8ROZjMVv5LBaUm3XwsTtnD4T4jHpRO+qxg9cJ/kDWxF226jvAfBtcpi6wCkZosgcBXjqaf+ib3A6W5VcMTMKvgZt4IQ/yqFrpt3O0kOGf2hY94ipdCWAYuj5exduI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751114174; c=relaxed/simple;
	bh=z/CLDF/X6BDnpeJ5a9vcl4SEOcC44JDymgYIq0TsDc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rG3HHXmNMRO2rnDT1LjOtWeO6HLnzeNwuU3zPOST6iUby/D1DRAIOBEXat+NolnnvK0SW/ztztUS6JyMScDogQeXLi5Y56ztCZRC8teskeY6gST0iO/pZqXzQAeCZuVBGSmdMeJlDouZonS01KhNfdfyU3vzBa+WsSiAQSo+cSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9VPwyMH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FF5C4CEEA;
	Sat, 28 Jun 2025 12:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751114173;
	bh=z/CLDF/X6BDnpeJ5a9vcl4SEOcC44JDymgYIq0TsDc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9VPwyMHg2x9jzkjEN4FgCUZl0H2P6jeYqNAzvqXodQ5x3xMopAZBRsaIUZ79WNjP
	 7W1k7B0SQNBrMZCAEGS6ur6Ztu9Ji8AAwx+iiDwqryHl0sRRKt/3bubT/Njpzt1FYe
	 c/tVacvhAwKVh4ZeljZkK2mIckiStrbXfIoOb+ncaSZbxpxLluJ9dou23qWyRqbvbT
	 iZDWAoqBZJwjbVsXM5vJvNZ6iWKhMvvn8MaUHx3v+UPSD+dpF91s0M7zRXog+7Ge4U
	 QpUwGkxP8LI3nyR2gblSFZzNwoJZjMixlzXJ3Q2CjmOMLCqWpq8BLjgJKtharV/5bo
	 ljMEH+x+eAjpQ==
Date: Sat, 28 Jun 2025 14:36:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com, 
	ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Message-ID: <20250628-perfect-super-bull-84b312@krzk-bin>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
 <20250627103319.2883613-2-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627103319.2883613-2-quic_lxu5@quicinc.com>

On Fri, Jun 27, 2025 at 04:03:16PM +0530, Ling Xu wrote:
> Add "gdsp" as the new supported label for GDSP fastrpc domain.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

NAK, nothing improved. You got comment and you just sent the same.

Best regards,
Krzysztof


