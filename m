Return-Path: <linux-arm-msm+bounces-85673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D02CCB6DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 11:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28F8F3016911
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 10:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BD033121A;
	Thu, 18 Dec 2025 10:35:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59749331231;
	Thu, 18 Dec 2025 10:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766054142; cv=none; b=Fy/Y8+doGeli7qCNlfyoJbDRfSbGToZtNlR9OkdClCAduIJ8ufpx6mbyJvbYvRoHfluV53fUSmWauaOdiT2R8UqTt4Ctl0UWgfiw2fnENnNexKSLxS/h650JK870C9UETGjMgd4vJbbvdHZxu68BjGJtaCDLGMbaVI2/4VElyic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766054142; c=relaxed/simple;
	bh=YjP8Wi1UvK1wIxy3FI9L3c3DSuIMPKUD4PwDM2XENrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQ5JCHHK77UiJIf208xgYu+EHBkwWZZrcnEDik3rwekMld5JTV7GbVg6LpFYLps9fNtM4GM66++rFa6iMHfeULJDVf3kH4ci7I4wlB/18C0FKttg8a4xYuCF8I1/TMkyz8qaXL8/yN3dCHwiaAMK4BZd0kltzyrMtHWgOff9Vzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61EBAFEC;
	Thu, 18 Dec 2025 02:35:30 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 962393F73F;
	Thu, 18 Dec 2025 02:35:35 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1] dt-binding: Update oss email address for Coresight documents
Date: Thu, 18 Dec 2025 10:35:21 +0000
Message-ID: <176605409291.630972.15776682739253158062.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902042143.1010-1-jie.gan@oss.qualcomm.com>
References: <20250902042143.1010-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Sep 2025 12:21:43 +0800, Jie Gan wrote:
> Update the OSS email addresses across all Coresight documents, as the
> previous addresses have been deprecated.
> 
> 

Applied, thanks!

[1/1] dt-binding: Update oss email address for Coresight documents
      https://git.kernel.org/coresight/c/7009646d937f

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

