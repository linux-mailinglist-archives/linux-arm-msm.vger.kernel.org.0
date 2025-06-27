Return-Path: <linux-arm-msm+bounces-62745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 608AAAEB3A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3077B1BC3868
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 10:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C379235C17;
	Fri, 27 Jun 2025 10:01:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA95B14A82;
	Fri, 27 Jun 2025 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018507; cv=none; b=lHVZymUWd+xPEud/MkoJSMyWsdHcG3rLlz6inJ9DmTHX8vm1ssnMQlGiJrM/OCC1M2IMSn2JKrxkEmYcvYK7GDUHIiV3ZLc6/n+iuwyLN71+mCSIF+CN50ZHFGLDhGwqCKXnfIKVbPcslu4rNWjI4Dtu7wQFFNT0W/M3tGaW+u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018507; c=relaxed/simple;
	bh=Jf1KpkJoKnDbypKeq64n3y9P1zWNZrYUkYkgRR/qjLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uai4sGveQFv7+nRkUhkOibEfANaCGV7qAapFYV5Zbj+4gpwuR23Ty9Glx2A8BprXdZJocJV9sVl+q5H3bbiFrA+gfYEtBSr5CL3duG8srV18YpgaAoa1z3qV3viVn2hjFMoSVWqd6lCmRLotvDXT5+LgkI5yze29CuR9AueSDFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E422F1A00;
	Fri, 27 Jun 2025 03:01:26 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 232BC3F58B;
	Fri, 27 Jun 2025 03:01:41 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: cristian.marussi@arm.com,
	viresh.kumar@linaro.org,
	d-gole@ti.com,
	quic_mdtipton@quicinc.com,
	avajid@quicinc.com,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix up turbo frequencies selection
Date: Fri, 27 Jun 2025 11:01:37 +0100
Message-Id: <175101845016.204664.16770138756754507753.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514214719.203607-1-quic_sibis@quicinc.com>
References: <20250514214719.203607-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 15 May 2025 03:17:19 +0530, Sibi Sankar wrote:
> Sustained frequency when greater than or equal to 4Ghz on 64-bit devices
> currently result in marking all frequencies as turbo. Address the turbo
> frequency selection bug by fixing the truncation.
> 
> 

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Fix up turbo frequencies selection
      https://git.kernel.org/sudeep.holla/c/ad28fc31dd70
--
Regards,
Sudeep


