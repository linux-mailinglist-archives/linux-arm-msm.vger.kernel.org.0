Return-Path: <linux-arm-msm+bounces-22607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7C29078E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 18:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B387C2861D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 16:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863C314A084;
	Thu, 13 Jun 2024 16:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhIGzCPJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A741146A7B;
	Thu, 13 Jun 2024 16:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718297774; cv=none; b=ZDim49y+LmokfGY9fu8zY5YHPEakfuEoo1vqGd6XMv5sVx/D+TnEJLK9jdHNe7pXuD+PVXYZVgPMjw2W+enyLIit5hb9FxuibxfMX0wNm1BoIA8kdltXFpWj5GNRk2lY64fDL9QRaeTd3wGx3h797GP1SylTGl1qfVpZPQyXEB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718297774; c=relaxed/simple;
	bh=AFsjejU6WOUxpZm3KWb1MCdL1at46hZYCD2xgeBCuII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TnoSVfHfJH9TGvUlJoG92m/z797z9yJLVdJsNtbWWHZT2R9LxdI4bOG46fjc360M6IqZ87IloUxM4NFWPEtTQEBWvh5sT9MWr7tin5zuTL/H9uzuE9sIWciK92Cj+kaI9QobCU90h4297F4JogwGMAnXXzfs05McMjbqwb7yfFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhIGzCPJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 269C1C32786;
	Thu, 13 Jun 2024 16:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718297774;
	bh=AFsjejU6WOUxpZm3KWb1MCdL1at46hZYCD2xgeBCuII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NhIGzCPJrsdHU5NRJPqliKJGNxWHDBZFky42hoImrCL3ysQrgM0XboZ7+9jfsUkPD
	 CZYVOk2/77hkOSdD2opFzY9m/I+Eo0jXl9rcQJLZyRHVCrw9SvAZxCiX73S+Cg4w7D
	 qQwtCIT7n26dt/9C/jK6LrDFMZ8lL5GxNcZVGO5ZOc+c5rhn2Wrpi6rww3hdEQPZw6
	 01h2op1LtrRFXzrlw0AuzQFNsCefHpl3F0DP3r8Biht1B7upxyE6ZkwcMXj5tzTEWW
	 yRAFD/zaHaeS1Gmn5c9GmyvaufF5e51c6Xip0LCOG4zhjuMXDiw6p8UddTV7y3PPUl
	 phX0DMLCr84HQ==
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andy@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240609-md-drivers-mfd-v1-1-47cdd0b394e9@quicinc.com>
References: <20240609-md-drivers-mfd-v1-1-47cdd0b394e9@quicinc.com>
Subject: Re: (subset) [PATCH] mfd: add missing MODULE_DESCRIPTION() macros
Message-Id: <171829777189.2716745.4962313737090017638.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 17:56:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sun, 09 Jun 2024 19:21:28 -0700, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/timberdale.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/ssbi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/rt4831.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/intel_soc_pmic_bxtwc.o
> 
> [...]

Applied, thanks!

[1/1] mfd: add missing MODULE_DESCRIPTION() macros
      commit: b3e691c26f55731fd937c4b7ccbc150e10aa30a3

--
Lee Jones [李琼斯]


