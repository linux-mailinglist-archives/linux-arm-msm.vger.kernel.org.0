Return-Path: <linux-arm-msm+bounces-89169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A996AD235F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B09BE30376AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D7634D90F;
	Thu, 15 Jan 2026 09:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEWsq/6D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D410B347FD8;
	Thu, 15 Jan 2026 09:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468385; cv=none; b=kpWxLtcjRRCckXuo3HpET+5gK0wb0ef1oba/qU+LoS9wagPHo057NoSOLYCg2BXn63QHaX8wTXRhkzqy0c8rOHpioKFUL4TKFnXJyfj/2BFcXTpt64ztgwHWfu3rHVmdvJBg9GuHYb6thSFbQaVnNAPTF7TpKb1wE5FKOzbsCf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468385; c=relaxed/simple;
	bh=ktf5t8rKckanHeeSMUq0v6HMAMPm4fbmn7zo57Bhq4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbWt+JouIK0hRO1XrBDwHNl12BkGrQOjtlKkFokftqthpbkXT8wgt9coa5XyAUyptk7tvIOYuokgoQzGEVtQXbZ4WD58nXO10CreJh/ygpjzU8LH1FwR7WKWCC4o7GXVA9mCydzOgbp7APombAagtl71SPHQ9wKoVwZkuenKJPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEWsq/6D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DC0C116D0;
	Thu, 15 Jan 2026 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468385;
	bh=ktf5t8rKckanHeeSMUq0v6HMAMPm4fbmn7zo57Bhq4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEWsq/6DAeW8byfxQ/m6OXGey6suH6ODj8vI03hO2Pn1ejQmO9PR2+1vfPwG9wskG
	 XkIzrBTRxQdt7eSQ9Qs/niPpZ9zCU/S3i4ow7NSwOrhfmNV5yam7MgdqrE6Yv0+ga1
	 Glk6JU6fRlVZl5U+dfy+9JS5epONszMTHOuDTcjGOC5J+atmjj51x108y6l6A8khWD
	 +sGwY0y1smCaj7z1jigg2TjHnRKbJCm5ZmH89B0A773rAzNyx7wjVkEAZGUOsrn0bU
	 WJqFtSBO8pDRG5TQYoDvtQces4R9SbtFjfA1xsFennx7MSq31EDvkodvFra/7uKBa2
	 XHxzrQPFGUhQw==
Date: Thu, 15 Jan 2026 10:13:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: soc: qcom: qcom,pmic-glink: Update
 X1E80100 compatible string
Message-ID: <20260115-powerful-impala-of-music-d281eb@quoll>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
 <20260114211759.2740309-2-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114211759.2740309-2-anjelique.melendez@oss.qualcomm.com>

On Wed, Jan 14, 2026 at 01:17:56PM -0800, Anjelique Melendez wrote:
> Currently, the X1E80100 compatible string is defined to fallback onto
> SM8550 which is incorrect as X1E80100 and SM8550 are not compatible
> devices. Update "qcom,x1e80100-pmic-glink" to be a standalone compatible
> string.
> 
> For now leave the original X1E80100 definition with fallback to SM8550
> as is inorder to not break current definitions. This will be removed after
> a grace period.

Just do it in one commit. I don't understand what is the benefit of your
approach?

You still break ABI, still break users, just silently so they will not
notice they have isues?

Best regards,
Krzysztof


