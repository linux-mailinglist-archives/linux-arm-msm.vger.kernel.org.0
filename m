Return-Path: <linux-arm-msm+bounces-62284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9712BAE78F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B6993A70C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 07:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54C11F7586;
	Wed, 25 Jun 2025 07:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZO9z4op"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BE71E47CC;
	Wed, 25 Jun 2025 07:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837454; cv=none; b=Uf5r4wxXwr81PoJNBXZZSxxXtBwpl6ZahBNiS07jxgvk+hReJ/GbnJY3Y2RW8UYvzb8He9mMiQnevmiO3TwC6795hlNB3X2XqyKzzkuEIh/eAb/TC/hGB2sz5o3iIG2H9vFT/B9rX+PmeK0Ihm0fZGfEail7mox0PSA6sm+8P2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837454; c=relaxed/simple;
	bh=7aqupwu0BATzVc+nx6+3/6tOlY1gqfjTFE3qutqlfDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjW3P1vJ48Xenqe7aCxX7bRsxhNVJkW+dSWKEFsoOr0ll/soRSzhdrPLweDQZGaZWuBetmy/AQayTu4kKU+jUVznZvY9Iyn6j9azqTCXtrobPC7yDaXWKLu6YfwGiGKny47qzQq2LjhdS1hLgjeHeloUd185PiAZVY4d2vXyHuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZO9z4op; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95561C4CEEA;
	Wed, 25 Jun 2025 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750837454;
	bh=7aqupwu0BATzVc+nx6+3/6tOlY1gqfjTFE3qutqlfDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZO9z4opj6eOQVmq+swx/ur6Fy1A9sq/e71+AXmB2Yx3iGieCiZS4Fb4TtWRS0Ycz
	 pMTeYdF6ykCv8pqSH3yqdqb4YcvULMNpyytP4yoXZtWnB3D0KqPZ/Q2Oatn/KYSPkZ
	 70dP927aC3lz7qsBSOr+gD7OfxCKQbwy1Atz9JUhIWZ8JtfD1b0HnphWvRnpfQYIKF
	 QSBoQ9vnf+GpSVS60uhR5+fMifKYCUKUFwE0DY/HAGCEsZhZeGpcJA2vN2bpe1JvP5
	 pBN/hUYxrHHHd5TWknZC+dC3BMBWaCyd2qBovC9d7BPTgwdacRz1/9lwE2LIp45Up0
	 Dbxa3iaIcrhFw==
Date: Wed, 25 Jun 2025 09:44:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com, 
	ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Message-ID: <j2nni4oyoochjgw5w7vodxnn562vff2krkesta6zzgqs5ihvcx@5up7ga7k4gdl>
References: <20250622133820.18369-1-quic_lxu5@quicinc.com>
 <20250622133820.18369-2-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250622133820.18369-2-quic_lxu5@quicinc.com>

On Sun, Jun 22, 2025 at 07:08:18PM +0530, Ling Xu wrote:
> Add "gdsp" as the new supported label for GDSP fastrpc domain.

Neither this commit, nor second nor third explain what is GDSP...

Best regards,
Krzysztof


