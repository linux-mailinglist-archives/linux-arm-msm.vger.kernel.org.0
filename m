Return-Path: <linux-arm-msm+bounces-28992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F28956F03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 17:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A78CE288583
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 15:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A2A61FD7;
	Mon, 19 Aug 2024 15:40:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93F761FEB;
	Mon, 19 Aug 2024 15:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724082055; cv=none; b=Dn4n8lc8ZIj62W3vnDDuxJKWjujkOuOEXITY+Gmtk71HK3+9Ypij1izTAoCvdTdHdzvHJOsJu8fzZnuUEpJL4ftNIAiLxHAE+yyuyYmLNW4KzRL4f+ejkTIp1j77WdIkTExTI/IMyWAvWi3TBCbp8D5VRrbDHxLj8ErfEVwzf6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724082055; c=relaxed/simple;
	bh=WAFcq/UQ653WF4WfX3AZMlRduyx7z/dt/i3lZLGcS4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=koU35gNX/MFm+e5NQR1oo/2oAx98IFiBPOHzU8hgfbIpsMh2+7cDnczwD3qituUIhC3KvfUnh4hz6QZIT2zX1iCvssH0+b26d6uWrxkm/PkLldC1bgl6ePhIsparGdChXxztc4231tr6vxUNDcNnrzBjEELZUEbWBL4Yc3VqebM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E00B0339;
	Mon, 19 Aug 2024 08:41:17 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CE29F3F66E;
	Mon, 19 Aug 2024 08:40:49 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@linaro.org>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Jinlong Mao <quic_jinlmao@quicinc.com>,
	Song Chai <quic_songchai@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Tingwei Zhang <quic_tingweiz@quicinc.com>
Subject: Re: [PATCH v1 RESEND] Coresight: Set correct cs_mode for dummy source to fix disable issue
Date: Mon, 19 Aug 2024 16:40:40 +0100
Message-Id: <172408201690.254020.2666550278120752551.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812042844.2890115-1-quic_jiegan@quicinc.com>
References: <20240812042844.2890115-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 12 Aug 2024 12:28:44 +0800, Jie Gan wrote:
> The coresight_disable_source_sysfs function should verify the
> mode of the coresight device before disabling the source.
> However, the mode for the dummy source device is always set to
> CS_MODE_DISABLED, resulting in the check consistently failing.
> As a result, dummy source cannot be properly disabled.
> 
> Configure CS_MODE_SYSFS/CS_MODE_PERF during the enablement.
> Configure CS_MODE_DISABLED during the disablement.
> 
> [...]

Applied, thanks!

[1/1] Coresight: Set correct cs_mode for dummy source to fix disable issue
      https://git.kernel.org/coresight/c/e6b64cda393efd84709ab3df2e42d36d36d7553e

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

