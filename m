Return-Path: <linux-arm-msm+bounces-33778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B999997D13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4795F1F24B18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 06:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757C219F42D;
	Thu, 10 Oct 2024 06:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1GDwHQq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4486D192D8C;
	Thu, 10 Oct 2024 06:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728541092; cv=none; b=iu1NPe9/kbVUjciIWKiClgCkOUmkorfcla2QPY4mC87Mows6+m7+zb5UTVFAqW2eKa5SiODLlgMif8roXoex6asgwSS7rC/pSWLx135d5TPpLBCjLQUCr14ath4m/Mx8tWi91JPjnnkmhd0DApSZtW7KdeIVke3qDElJaImCnVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728541092; c=relaxed/simple;
	bh=/IEmnxkSNror38dWdxFNRtTS/i/IziuPUltcC9jgRW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4fhPm+/ADZrFqCHXg/iWbD/d4FwXKP7gr3Eoq567VtBFXoLH/39kHA+yDVzaaGyt5WT+VnlrDYXazUZJ9umf70jBXpMi9xULPhDfd+OcI/56itwX8Kq9FcGJzrnCpv9Oplwv+iqijtWH87QdfH8ijqkjk8+TEbDTsknMHq8MO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1GDwHQq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16CEC4CEC5;
	Thu, 10 Oct 2024 06:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728541091;
	bh=/IEmnxkSNror38dWdxFNRtTS/i/IziuPUltcC9jgRW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1GDwHQqedI5cPUbWKZJG5ArK5wC9R9nYDZ3k9Kh9Dx7+tgREb1zYtQu76NJzbzs1
	 5YpMdOibicXMVHI64mF7mR/f8D58cQmxXpCLMPYeJqFllAY9x0ZO5f9FZw2WNWhocw
	 z2C97lB+/1xHpUHmVfvuVnkpeolUN64u7iPLP97bvMqO2K9hnFTkvMHazm936crEEA
	 nTlmZMKFbkpjkgFYKi9vLXgCMhmUnO+92YV30sWtM9+uLbJNO+tIa8FADCBlot7Rjv
	 03UYx227jySb8HW+CYOf+AI06B01lVOEiQpcxHk+YljWlBs0lzZFye/3A/UoUjCJM3
	 Hztymy/+QZmyg==
Date: Thu, 10 Oct 2024 08:18:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com
Subject: Re: [PATCH 4/5] arm64: dts: qcom: move common parts for qcs8300-ride
 variants into a .dtsi
Message-ID: <75vxiq4n2tdx3ssmnbq7qpp2ujtzjs4bkgpkpsi623fs3mpslx@ijmaos2gg5ps>
References: <20241010-dts_qcs8300-v1-0-bf5acf05830b@quicinc.com>
 <20241010-dts_qcs8300-v1-4-bf5acf05830b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241010-dts_qcs8300-v1-4-bf5acf05830b@quicinc.com>

On Thu, Oct 10, 2024 at 10:57:18AM +0800, Yijie Yang wrote:
> In order to support multiple revisions of the qcs8300-ride board, create
> a .dtsi containing the common parts and split out the ethernet bits into
> the actual board file as they will change in revision 2.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts  | 373 +----------------------------
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dtsi | 364 ++++++++++++++++++++++++++++

This is tricky to review. Use proper -M/-B/-C arguments for
format-patch, so the rename will be detected.

You basically renamed entire file!

Best regards,
Krzysztof


