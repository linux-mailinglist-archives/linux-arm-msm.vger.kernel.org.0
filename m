Return-Path: <linux-arm-msm+bounces-81739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B72C5ABF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 01:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 29E49354BC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968C0257827;
	Fri, 14 Nov 2025 00:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Img/ttGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6C1256C83;
	Fri, 14 Nov 2025 00:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763079233; cv=none; b=gzKDVrCXGbsj8vzcQZ8RlnS3Cb4K8Qyng4vlwbbWJ8oT4E4dYyXtBi4kP0GiChBJkTqGDxQuBtJEp+MetxRBcJLKx8+yRGuGU1IMzP7VTyH3IoIELbgZEWwOpMjfMcs3+ULqsABXpb4pvgS1+3NXT/Fn3XQi/EyRNcXPWAr0e8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763079233; c=relaxed/simple;
	bh=z0frrJOg2ArQpZ3oaNdKScM6HRNtLSqFRTUBGk6qmHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RlUIDdWXSU7TLiYLyDFtb/DFCkBWWjOH+/GP9t+efBLUpAXu+k7HzF6fuzaeixcqD5+4ZYB0E198yiHDONnfNzFUO77f2FCEDQ9CR+XUdmfUbsVze23GTArB9fJw0pHgDD388RKzBpNrlXe36dWj6r+zOTD3weEn7m11UH+LPVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Img/ttGm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527C3C116D0;
	Fri, 14 Nov 2025 00:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763079232;
	bh=z0frrJOg2ArQpZ3oaNdKScM6HRNtLSqFRTUBGk6qmHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Img/ttGmvpwlGsmJg26j1J6efJqmrrPMQni67uXyqtElUpvSPrLDX6ZO0lEi64QeA
	 UlUjwZgUWv5UpHIzYYmNaUQ0JNg8DoCcskmTi+a43VnOs6jlrcMqTCf17qW9NIXlLb
	 jaJNNn6H9BPGN0x/a9J6JijRAD8Hfgq/Gv7Le7kAzx54y1ZwIUNDTGb0rwYFxIqBq0
	 4mAyD1dekpfZC3lY+uq94qWV8hPaCJ1j3MU21BDkOzO+Z22kgad8GYsIogToNj3qq8
	 vZNyXjJDWoVi1EgrcfbqhR3klryrNUumauCZ/Tf4NWIhjRDLNzZzLTs8PdxVybguda
	 TCA9otY7soJBw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xueyao An <xueyao.an@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: HAMOA-IOT-SOM: Unreserve GPIOs blocking SPI11 access
Date: Thu, 13 Nov 2025 18:18:10 -0600
Message-ID: <176307948651.2565969.3556842462809103900.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105054548.2347569-1-xueyao.an@oss.qualcomm.com>
References: <20251105054548.2347569-1-xueyao.an@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Nov 2025 13:45:47 +0800, Xueyao An wrote:
> GPIOs 44-47 were previously reserved, preventing Linux from accessing
> SPI11 (qupv1_se3). Since there is no TZ use case for these pins on Linux,
> they can be safely unreserved. Removing them from the reserved list
> resolves the SPI11 access issue for Linux.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: HAMOA-IOT-SOM: Unreserve GPIOs blocking SPI11 access
      commit: f057dab41070210e0b9c0271ea70dee6ce1d992f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

