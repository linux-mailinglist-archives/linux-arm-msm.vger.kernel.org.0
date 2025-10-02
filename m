Return-Path: <linux-arm-msm+bounces-75740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 038CBBB2272
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 02:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A906342332D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 00:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB9E3BB44;
	Thu,  2 Oct 2025 00:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsXqFKn0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B28D5227;
	Thu,  2 Oct 2025 00:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759365427; cv=none; b=eu2fli/Lmw4Pq7muUfMQMtHWYFTkdMTE2cWFMrmE6zwdo77mMFQ6/sehLyrjPyhcZTU6r3t/nxqGrdQw0hLyCsXsOIUpDbc1MekwxKWzAjZRoGIYwMzFfNlAppzraNeAxo2SVGruIRdye1EzyvHSeOpgkAUIfUYB0hYy0FIIBnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759365427; c=relaxed/simple;
	bh=kHKQ8XMS0aHS1J8DY2i0xrspGqEu0jVIyBUJzo9bMiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXKLf6Y0RmEyrNzLPli70ihYbFNTe7h7GnqtVj6GV1ZVfUCJ6/yIgEx7tRQXwocoiiZykknEq4zrSKuRXHrVpDgjubj94B+oB7Xno1RG95uu7DuyJ4BtqHZ6vYD2/ANUy45oxf4PxE7XpCnFBEfLmmW3KzrNPd2kf1kp1ar8apA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsXqFKn0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A6AC4CEF1;
	Thu,  2 Oct 2025 00:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759365427;
	bh=kHKQ8XMS0aHS1J8DY2i0xrspGqEu0jVIyBUJzo9bMiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsXqFKn0XpgvKFy3ljziq5R/02wb1nFWfXQGeRTaXF9pqMYsD4xcBNiMgvuMJSaUO
	 IJfnevgSe7S4MjBICHhS3C/KXYUpUj9f3SyYqAnuKzwtLV90csD/n+jqdVRkYrlEjI
	 AGxbzFqnS54/c14RrYWKGKwv/8VCv79R0PfB7UTraN7DDaq0/l2R96zk99U5CD0+X/
	 J8STehMjn84BxrIDkKjxzx56EGVqK3kectxwBa+9V18oIZE6bVe+7/buzBg57WiDZd
	 R4WbCju3iMArFX4PGNCirKF69tB0LaZP9e3ujYu+hmORE1zOvNj118r0FeNLmqVYax
	 s/9RyAGxvtYLA==
Date: Wed, 1 Oct 2025 19:37:05 -0500
From: Rob Herring <robh@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mani@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org,
	konradybcio@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: mailbox: qcom-ipcc: Document Glymur
 physical client IDs
Message-ID: <20251002003705.GA2672888-robh@kernel.org>
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
 <20250924183726.509202-3-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924183726.509202-3-sibi.sankar@oss.qualcomm.com>

On Thu, Sep 25, 2025 at 12:07:23AM +0530, Sibi Sankar wrote:
> Document the physical client IDs specific to Glymur SoCs. Physical client
> IDs are used on newer Qualcomm platforms including Glymur, since the Inter
> Process Communication Controller (IPCC) HW block no longer has the virtual
> to physical mapping in place.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
> 
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20250922-ipcc-header-v1-1-f0b12715e118@oss.qualcomm.com/
> ^^ patch seems to assume physical IDs are common across SoCs but it doesn't
> seem to hold true on Glymur.

Maybe QCom should sort that out before sending us stuff...

> 
>  include/dt-bindings/mailbox/qcom-ipcc.h | 61 +++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)

This belongs with patch 1 as it is part of the binding/ABI.

Rob

