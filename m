Return-Path: <linux-arm-msm+bounces-34764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E43719A26FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1897C1C21C93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 15:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB0C1E0483;
	Thu, 17 Oct 2024 15:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcySTMRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A31DDC14;
	Thu, 17 Oct 2024 15:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179380; cv=none; b=IDfsKPtQxkic/5JiRcIpJTaNgwc3VRwVNE5u/KbKTsfOHh9hToyyxVl50JLpiA7pm67dtvR3z5zwAF5jsOEeCStMFQQCom3/FqW20QoiumaKrwaFBI/m1X32PFdWbhMLQh72buJ/WYBsbE2aozZEnceQBHdJJi2+R3rfFzbjqBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179380; c=relaxed/simple;
	bh=NfsiDZCdruACQ2h/ZlKOCEcp2Rm4sKuLxJgt6pCpxC8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KKuFn4+W0e16/M4YDkJ9UnYDO6IZmGDyLP6unHJIV5dfTdE3DehqNBbOumCTJgxLhCROJEHX7XJG08FYC3eUb1bLX+veHEMIzGDjQ8eAOlVYz5Es950nPXYflPf6hTLb8CjGoMlzzwK1wwD+H1m5Go1wbc9nTXRhVfPTsOGUHi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcySTMRW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC494C4CED0;
	Thu, 17 Oct 2024 15:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729179379;
	bh=NfsiDZCdruACQ2h/ZlKOCEcp2Rm4sKuLxJgt6pCpxC8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mcySTMRWCCeOzMzewoNtQoIPyP4dBZWRtec/7rLwk3CXE8Z8+OCKjBGL2ZYUWltcU
	 9V4PFEKWudMrPaMg+zK00b5kMmZ7AsHBWK544Np6K2vqD7GpZeaSOxlhAP6yJ3FAZ7
	 oggoJhinAFNVoyLzTUpo+v0iCKwJzdesl/6nN/a6p0bHHzT7gb8SSWjYDGgpfuZ3dJ
	 y9svJdW6u3Ua0O6tplYjsqTgXJQx6gPnHqqYxwUgEzWk5CHAuOVKGoP8RmWu6bCX0m
	 HsFv4D/CXJzjZ1G9dcF/o1UVarPF1duUjS0au6P94FGyAJAyBgVzGV9U1SQsg475UZ
	 IVCVUIxqqY2QQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org>
References: <20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org>
Subject: Re: [PATCH v2 0/2] phy: add NXP PTN3222 eUSB2 to USB2 redriver
Message-Id: <172917937640.288841.14254055553308923025.b4-ty@kernel.org>
Date: Thu, 17 Oct 2024 21:06:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 30 Aug 2024 11:20:44 +0300, Dmitry Baryshkov wrote:
> The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that performs
> translation between eUSB2 and USB2 signalling schemes. It supports all
> three data rates: Low Speed, Full Speed and High Speed.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: add NXP PTN3222 eUSB2 to USB2 redriver
      commit: 2df490e7374de8e940d353cfcafd3c91242841ea
[2/2] phy: add NXP PTN3222 eUSB2 to USB2 redriver
      commit: c9be539e11f0bf1665c03108d3b7881a5d67ae48

Best regards,
-- 
~Vinod



