Return-Path: <linux-arm-msm+bounces-57827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE96AB6A23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 13:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABF4D3AD858
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 11:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B644274FEB;
	Wed, 14 May 2025 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVM0VeAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4216A242917;
	Wed, 14 May 2025 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222641; cv=none; b=WWiBVDt5gtdSDD26WFytpkK6BxOSdH/kM4c65CjUABNF+O1iKPO4zXwr2M7nZfrr8bTHo3p9xmqbYmV4jsitni/+3MH/uKTmoNIGNhd3Yw2+S8TfVY1Oz6fmg9DPdTDEuncJ8JRS+DzIih7Y/eNFLsGv6V5iw5IrY6N882U/Uis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222641; c=relaxed/simple;
	bh=He4lmb9HVm1YV4uevPwCKHBfctkNUFoVlye5myyYtkM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DDKkjoSFSiMl8fW1OyFBrTXi4tN2Moq84jpnZHPGGWhSNdQiflXb390HeYiumbYSOc7kgEF0lqnBahr1oZw9Hxu6ZnnKy9qbFX7o9y0doG9ppdOeHfKEvaTIH8o9IEjNUIFGPXrDlPYvYr3Yav2FcGqE4gZ5MddDcGLCw/L6hwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVM0VeAW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FC9C4CEE9;
	Wed, 14 May 2025 11:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222639;
	bh=He4lmb9HVm1YV4uevPwCKHBfctkNUFoVlye5myyYtkM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JVM0VeAWzv9ssis9vK5QubwKwxvsBARYIFJGv/iN5pscusgaP6zYl8rLqlVtrvu+J
	 svFrw/z0Qvdz8K47pzcl0e2Tf9CQrIET3JaJuUsrThvaJ6Sl83CZKc71U1e8R+TU5c
	 682neGjxqp+TCvzGJ5+Syo3HQVoHvR5dl/CvQnm78FyQbF6j556L6NFiqT6JAwmmw8
	 eSHHlVzK33oo2gasfnh95zDf3V8vPwM1qHV7Wng3aIGM53H2bMETfNPbTj78sWwwNP
	 L4NhKz/JEWgNaTtYfBAQX3MqJ8YkVZ5favIBIeJaQMTCWK1pmoUK9LggCmaqS3Nuqg
	 Pzt64ilg9pQCw==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, lumag@kernel.org, quic_kriskura@quicinc.com, 
 manivannan.sadhasivam@linaro.org, konrad.dybcio@oss.qualcomm.com, 
 quic_varada@quicinc.com, quic_kbajaj@quicinc.com, johan+linaro@kernel.org, 
 Chenyuan Yang <chenyuan0y@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20250414125050.2118619-1-chenyuan0y@gmail.com>
References: <20250414125050.2118619-1-chenyuan0y@gmail.com>
Subject: Re: [PATCH v2] phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug
Message-Id: <174722263664.85510.7245285831911062529.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 14 Apr 2025 07:50:50 -0500, Chenyuan Yang wrote:
> The qmp_usb_iomap() helper function currently returns the raw result of
> devm_ioremap() for non-exclusive mappings. Since devm_ioremap() may return
> a NULL pointer and the caller only checks error pointers with IS_ERR(),
> NULL could bypass the check and lead to an invalid dereference.
> 
> Fix the issue by checking if devm_ioremap() returns NULL. When it does,
> qmp_usb_iomap() now returns an error pointer via IOMEM_ERR_PTR(-ENOMEM),
> ensuring safe and consistent error handling.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug
      commit: d14402a38c2d868cacb1facaf9be908ca6558e59

Best regards,
-- 
~Vinod



