Return-Path: <linux-arm-msm+bounces-80399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F142C34575
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 08:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 99E274F0A7F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 07:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E14E2D7DC7;
	Wed,  5 Nov 2025 07:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cr5bOEnC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0968B2D7D2E;
	Wed,  5 Nov 2025 07:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762328944; cv=none; b=iZMUZEG5XPCX/KKL3hWOnbhXcohM6PgPTdlGCj+R0ArHFrToZ/Fsgre4jgd2IijM6oGniTjtsYZzW8FyF7JX9BlHIpO0KMaQmZ9WmcPkvhhzhGZ2nZek3vOxrZdMqtBT/XekqcWeXhiFIKY96kvGUhEV+vTLrtFh5XTjRukvjas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762328944; c=relaxed/simple;
	bh=xCQ8qfR2KgLeEPbc/DYOmaDRKzViHmxTQ/CO8dMUAXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzwGdwh5Bj90ArzZXMiGifOvBhUOnhmjC2/8RaTXI+nho4V3pMFDoMi8RY/h0csRmihfj0LYAzDmN8NDvOSjr5w51Ln7KEgK0UiDC/oxgQa7YARDyPg/n1CvY60A5dptDLUkY4/JygoyvU0iIoqj9tuckpCQG6pddSMM07sXNnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cr5bOEnC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11290C116B1;
	Wed,  5 Nov 2025 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762328942;
	bh=xCQ8qfR2KgLeEPbc/DYOmaDRKzViHmxTQ/CO8dMUAXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cr5bOEnC326afXGJki8yAreexH0F/CEDIWkRMy2+iyAjrRAdGqTFiA2VIu/Uf2zdZ
	 qEm27wpBeTazf3jTh9CFnGy38meeGGre9gKElxKp/hTh1+anvRWMAHpQs50ZHSNwzK
	 6LfEMdtR69e4oiAfdW/3QGPCVdja51QDw3srKfp0aVUeqdLSSeJyB/GL4rnRU6EXmb
	 a3eejQhAndCfxYz9ummeOWsMgO+beFpxnmYIVB9TJufbE2gPojB6BO9Y3cW56Rnef7
	 9vSSBM66h9skM6jURzGp4iy1bfFZBeqt4GJ+5XWMTkFSo+Ky9qq08/dk/kgZFGci+C
	 Jpy8MQ5cBSDFw==
Date: Wed, 5 Nov 2025 08:49:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Songwei Chai <songwei.chai@oss.qualcomm.com>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com, 
	kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
Message-ID: <20251105-industrious-oxpecker-of-valor-af17fa@kuoka>
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
 <20251104064043.88972-2-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104064043.88972-2-songwei.chai@oss.qualcomm.com>

On Mon, Nov 03, 2025 at 10:40:37PM -0800, Songwei Chai wrote:
> The Trigger Generation Unit (TGU) is designed to detect patterns or
> sequences within a specific region of the System on Chip (SoC). Once
> configured and activated, it monitors sense inputs and can detect a
> pre-programmed state or sequence across clock cycles, subsequently
> producing a trigger.
> 

I do not understand: You got review which you ignored and then you
removed pieces of this code to make it incorrect. Go back to previous
versions so you won't waste our time re-doing review.

Best regards,
Krzysztof


