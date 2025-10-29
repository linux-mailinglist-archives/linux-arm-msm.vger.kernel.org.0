Return-Path: <linux-arm-msm+bounces-79527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A43D9C1C8FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 18:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D7D6641076
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C5331283D;
	Wed, 29 Oct 2025 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="af158orq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31E02E1EE1;
	Wed, 29 Oct 2025 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761758410; cv=none; b=QjAXlo5xLcPlZ0WhCS98dT48m/yniZJghhNizdBxG+yjTs8w8tGitRTVnLTlQz/brRYBpaPtNy9ZZk1QcQwOZLoz2DSTsQRGqh9tR4J3/ESHBrtoZznPf3ukwybGC5y2bv/N2lJalj9kDiTXhFrwSOx2/9Lqs4Pc3I5T/TyOZcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761758410; c=relaxed/simple;
	bh=lTMac6CsiekTI7w6uSR1FvLqh4nJy2pX5IdyFvnRlqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tu0HRCi7MH3ueGGvwy0K/7QpcVdjP6HI/9VKsAVogGKDpMdEznCY+N91qh4STdbkdctF5Jc0YhRMQGiwddFJy+qDz//BkV7CgVL0GYl7q7qrBG4zwAmaqgVWeontt8wD8V6T08naHDiN6AZRsjdmpZHc3Eonxdh1vrUWMjJEwIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=af158orq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E9AC4CEF7;
	Wed, 29 Oct 2025 17:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761758410;
	bh=lTMac6CsiekTI7w6uSR1FvLqh4nJy2pX5IdyFvnRlqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=af158orqR+nr83LSSnFCHt7LK2bG3UaN7ci13A/m/B72uo4kmmmGc1pMdCqYaMmJf
	 TSbdFE5zdSvUAF8SgwTUiwg6WfttvmdhykK04g3kinQgi3rZ7WGqtLZ2nWnda8OAQg
	 PX7BH/5Ek65kSCNdjcclMyU1E/kM68pL7zhrZtfLKSFXY1/MboelkmV+kdwIi+oQmk
	 hIbzbTp+2XOFiav58XT0+t6scOv+hMfk5Q/WrfNmG3B/s2XTz27vmpv/YmvKd695bd
	 ADqLwm/k18MItRcVgYQeYzLkcKuSiyWEhWDj/JHAZnvnMwATdcLurW+9fIMl8hkXn2
	 OWmPt5axG+81A==
Date: Wed, 29 Oct 2025 12:23:14 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: mailbox: qcom: Add IPCC support for
 Glymur Platform
Message-ID: <qyfxtoe7ixko7k5whtzjpkynwpeqxzb2sgwq7y4y3kstblapz5@ggny5uq7qv6s>
References: <20251029-knp-ipcc-v2-0-8ba303ab82de@oss.qualcomm.com>
 <20251029-knp-ipcc-v2-2-8ba303ab82de@oss.qualcomm.com>
 <67038d9f-7c6c-4bb3-ba64-b06816b76be7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67038d9f-7c6c-4bb3-ba64-b06816b76be7@kernel.org>

On Wed, Oct 29, 2025 at 04:49:30PM +0100, Krzysztof Kozlowski wrote:
> On 29/10/2025 09:15, Jingyi Wang wrote:
> > diff --git a/include/dt-bindings/mailbox/qcom,glymur-ipcc.h b/include/dt-bindings/mailbox/qcom,glymur-ipcc.h
> > new file mode 100644
> > index 000000000000..3ab8189974a5
> > --- /dev/null
> > +++ b/include/dt-bindings/mailbox/qcom,glymur-ipcc.h
> > @@ -0,0 +1,68 @@
> > +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef __DT_BINDINGS_MAILBOX_IPCC_GLYMUR_H
> > +#define __DT_BINDINGS_MAILBOX_IPCC_GLYMUR_H
> > +
> > +/* Glymur physical client IDs */
> > +#define IPCC_MPROC_AOP			0
> 
> 
> Here the same - not used by Linux.

How is this different from e.g.:

include/dt-bindings/interrupt-controller/arm-gic.h:#define GIC_SPI 0

Perhaps I'm misunderstanding what you're saying here.

> Don't add these, they are really not
> necessary and they are not helping anyhow. For longer explanation see 2
> year thread for PMIC ADC v7.
> 

I'm sorry, I'm not able to wrangle a lore query for this, can you please
provide a link?

> Or provide explanation in terms what Linux interface you are binding
> here (please focus on Linux or other SW).
> 

Don't we use include/dt-bindings to define hardware constants for use in
dt source as well? Has this changed?

Regards,
Bjorn

> Best regards,
> Krzysztof
> 

