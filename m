Return-Path: <linux-arm-msm+bounces-80465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D87A0C36F33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 18:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E5A4625DD1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 16:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF0231DD97;
	Wed,  5 Nov 2025 16:13:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F96322DA8;
	Wed,  5 Nov 2025 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762359224; cv=none; b=S5g+hMJ5xXvvVjO13IrlY2NnC50iZQB5cow95UBT5x5wNqeQbuVydzFoK7UJCNYwpVPRXcZBjygq7v3WoMLZYCL60c+8D/9gDQSgfSPtrwb/3ibKWDhcy8qOFBOK8/CLcwcesA/KEJkrUTFRZdz8vjk8wxmFV+tQNC/6sNVI5jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762359224; c=relaxed/simple;
	bh=172JSa7BUeqD+BCdvg36zRUWUfM4kvpHBnPyt20IG9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HKK26QNg5v82sIzc9FYkny8eTaOxlf3OHjzXwYhWQsn7Ri6G1lW27xuYaPB8MRyUOo6tHFOH9zbOoH8ufU4aOOgO9H5/w135hv/z4kRqCL3zjBL5I2s3mCpgTuAMhCHDo4foCN5HfWiHWlYAtbD/a+tDtJi09gkZH69jH8R+yrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75BE5169C;
	Wed,  5 Nov 2025 08:13:33 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EBEB63F694;
	Wed,  5 Nov 2025 08:13:39 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Linu Cherian <lcherian@marvell.com>,
	Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
Date: Wed,  5 Nov 2025 16:13:30 +0000
Message-ID: <176235893222.387743.2128022832743502879.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
References: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Oct 2025 16:45:25 +0800, Xiaoqi Zhuang wrote:
> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> and enabled again, currently sysfs_buf will point to the newly
> allocated memory(buf_new) and free the old memory(buf_old). But the
> etr_buf that is being used by the ETR remains pointed to buf_old, not
> updated to buf_new. In this case, it will result in a memory
> use-after-free issue.
> 
> [...]

Applied, thanks!

[1/1] coresight: ETR: Fix ETR buffer use-after-free issue
      https://git.kernel.org/coresight/c/35501ac3c7d4

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

