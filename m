Return-Path: <linux-arm-msm+bounces-87154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB4CED418
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 18:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ACF23005E8C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 17:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4A52E6CA6;
	Thu,  1 Jan 2026 17:57:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC06224B04;
	Thu,  1 Jan 2026 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767290262; cv=none; b=qPkwsCuQ+6SiyugvxL0+PhjhyoDO9OltuxUTLGVf0FPHZ9iFsXsnAGiuqshkZhguzpfxy2wsManN0Dfacn6EHAPUIUoHNvA9m98CWWZOpK8vQsQvW3ig8tjOgH0kUfpekL1mHouUHUWON4zDFUoaenGSFfJFFTU0MJsL2G/FZ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767290262; c=relaxed/simple;
	bh=s4HBPBSbrxWZHpIWrXRBOGyKLlLPx8T4HBXW8mL1Cyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i3AFjAAJcW8pftm1/M6bdqW0rhUe40QRIlRUkAqOinxSBNlXW794Db7Wetc/QhyEWbeUe4aBR9OZ+ObVPM1divRxEY04kz+/8932/NHI9neVBT+k8cvfoNZ9cPQLCgyUZ2p1a1soEvu+MAXYMOtAD0psHrdfQRYoVcMEIRd51SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B8F4497;
	Thu,  1 Jan 2026 09:57:34 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5E143F63F;
	Thu,  1 Jan 2026 09:57:39 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: cristian.marussi@arm.com,
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mike.tipton@oss.qualcomm.com
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
Date: Thu,  1 Jan 2026 17:57:36 +0000
Message-ID: <176729019292.118211.14540259893282155265.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 14 Oct 2025 00:34:54 -0700, Vivek Aknurwar wrote:
> Some upcoming SoCs define more than 32 operating performance points (OPPs),
> exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
> (next power of 2) to support these configurations.
> 

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
      https://git.kernel.org/sudeep.holla/c/6c2fd7a71e7a
--
Regards,
Sudeep


