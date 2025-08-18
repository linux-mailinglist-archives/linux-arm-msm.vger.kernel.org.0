Return-Path: <linux-arm-msm+bounces-69480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD1B29A0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 08:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 894DA4E0D12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 06:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43932749C8;
	Mon, 18 Aug 2025 06:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4iAC+Fi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74208262FF3;
	Mon, 18 Aug 2025 06:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755499688; cv=none; b=QVyEG20nhoCKACcy1o6y6McUvdo9IQMwocDsad0N6nNPojS0f5vijqc6HLl7BkVFIfPm1tA+KetMTo4K3IlQePF1ZfWZaS4WDKCi5PYjNjJvwrg9MJ8AJTV3bmsJE0hvVqMPZc7hv7/HAcfwNuhFDCV9i8gj4zLv2uT/+8wmFvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755499688; c=relaxed/simple;
	bh=XlyLhCwwhlPG7PJufL1D3dyVsCv6c2JwtRaRWTrIn9c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YKcdPPScQBvtdLYeu234RxPN9ZsnraauZIPYrVkhthTrOJBkRA7OPvUe+4mINfQnNnwIy+qCsYebVPTzHVFoTLv9vQqKILx9o8nvNRq7u2iFCkPE6nelfp12no6F/CIaIbk6FNyxICGBJm0CNxv1cZFZRak0Vy3H1P7104GVKvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4iAC+Fi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AFAC4CEEB;
	Mon, 18 Aug 2025 06:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755499688;
	bh=XlyLhCwwhlPG7PJufL1D3dyVsCv6c2JwtRaRWTrIn9c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k4iAC+Fi/ZeZT18Qx1FzZTFsEcqFKGVtQm4ZPjdRNMMd8+GMcDT8yWEiFTMegvjTs
	 lQt4v1QpziaPE9niDXM80jxZ7BF0Qc/S8swmCSsdRALpuO9Un6P6NfC06xJfaEm1Br
	 q/IKbw3bV/zPeYckMWPxd0b487+BloPQ0NCsPBHnXH0aGcXikPTaYvikBcmUbYquUX
	 98jYypPm2yCMtlLzCUKn3oVGhjDxESVCDlAJSsF00UfFMVmTz/ydRRMCSI+/F9qtwN
	 gsI0wrPI+IlZ8jCHuBpCRZSIWi0JyX1zbYuZkFsIHoWs04wwsCPG0+SrvRi6RlzR+B
	 OdwzjRelkTDmw==
From: Srinivas Kandagatla <srini@kernel.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
Message-Id: <175549968663.1088527.9760389400726097242.b4-ty@kernel.org>
Date: Mon, 18 Aug 2025 07:48:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 24 Jul 2025 14:28:08 +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> Qcom Slimbus controller driver is totally unused and dead code, there is
> no point in keeping this driver in the kernel without users.
> 
> This patch removes the driver along with device tree bindings.
> 
> 

Applied, thanks!

[1/1] slimbus: qcom: remove unused qcom controller driver
      commit: e1aab955386fbfba764b70aad7760f49588ebea5

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


