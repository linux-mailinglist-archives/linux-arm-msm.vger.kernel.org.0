Return-Path: <linux-arm-msm+bounces-25535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 052F992AC16
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 00:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA576282809
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 22:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B64E14E2F6;
	Mon,  8 Jul 2024 22:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJjYzmFq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF050276;
	Mon,  8 Jul 2024 22:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720477825; cv=none; b=pDfss6TO13tBHEYgmUsuszEkjU1/I1kwHUN8fddzu6kGqff1hWh9Cs4qZif3D7IAN7LhXKewDBlfOPFJAMUUCGyjJUnuN1m4ugo2jBw3Lxd1WvddCAyi+fk/znMS3hC7cSMiJ5+1OUsIU9bbJVLhPYzkHYwR3h9/O7ofozLBpGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720477825; c=relaxed/simple;
	bh=6JE4nXgPjNuNNKkaz7S9Z+jMtV6+A3O6FZtrLMEM12A=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=fOtb2M9YhNBgl4SY3zwXRQgghH6d9Dtln9CjhvXbZHNaP/AP0MpxyjdDLbyQw9jzv6e1VUKRh14XHWvuoaAoPX32mrGj2LnWGpdqh1kkUA+H54LBGuNeRw6Z0oMlgknT4VcCnp5uV5Oqh8IiNUY6n6HVFryL6jy9CdrJmpnm704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJjYzmFq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840FEC116B1;
	Mon,  8 Jul 2024 22:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720477824;
	bh=6JE4nXgPjNuNNKkaz7S9Z+jMtV6+A3O6FZtrLMEM12A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IJjYzmFqXld0rCCL1yctkm1fasws1Rm+7t1VBj2mq0b6euuf8ABB71wzAJrty8O2G
	 K5CywZPbZtVyyR8hH9SYhOY39tKlEN93AFDVc88R6OffnYyoRd57NFYWQAZZXnGzbr
	 z7xTYQe9XikxLKRkm4gXbD2/H3aZshD4GMy/kf/zShqFz7WCL924biOkRfoEkCVteW
	 urLIIHbHWDZsugmMuUcI4w6lSY9L+MPHNOZYIRTHzFBmXVPpFfsS1Qw0ErrnM2EL2A
	 gwHfK06RmPSm4SeVhnqLpHv1pdNz/B6+yk7brHL+f/nBZ3LtZrx1RA6A8OcEKnw/9r
	 nWdcmU+rgCBEA==
Message-ID: <5153b8f8a6c6ffdc1254e00c47a888ed.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240628-gpucc-no-request-v1-1-b680c2f90817@linaro.org>
References: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org> <20240628-gpucc-no-request-v1-1-b680c2f90817@linaro.org>
Subject: Re: [PATCH 1/2] clk: qocm: add qcom_cc_map_norequest
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To: Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 08 Jul 2024 15:30:22 -0700
User-Agent: alot/0.10

Quoting Dmitry Baryshkov (2024-06-27 22:20:22)
> The GPU clock controllers use memory region that is a part of the GMU's
> memory region. Add qcom_cc_map_norequest() to be used by GPUCC, so that
> GPU driver can use devm_ioremap_resource for GMU resources.

Why does GMU map the gpu clk controller? Does it use those registers? We
don't want to allow two different drivers to map the same region because
then they don't coordinate and write over things.

