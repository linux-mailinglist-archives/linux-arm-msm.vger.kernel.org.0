Return-Path: <linux-arm-msm+bounces-50819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D57BA592C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F3F63A71C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 11:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A291521D3EC;
	Mon, 10 Mar 2025 11:33:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F1B28EA;
	Mon, 10 Mar 2025 11:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741606413; cv=none; b=A0y7XGxVEXdFiSRfv5f9pWODidZ6YhRPJ5crv6zIptIpw5+R5pOoV8SfthIGj3J2vZaH8g5ASUzkJGkPAnCmPxijdf3DZ62A4b1gcmz1tr8Nk6aGium2sHvHxsZN0c10UedPywayaw7JT6DmSoRmIVejsJZk6YioZMu/5XWu1BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741606413; c=relaxed/simple;
	bh=pxrpcQs++i4d8SALStlzgmyvN9v2uohDYnh11BvgeVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UU/HK9W2W3OoVA37ji40C6cM8R4JLBwoI6MruleHh/MeVDEx9WEH5E+V64kJ8D7iiyYi0JOet1D8v/cLI3FrzaFHU6pSFUvwA81hzUSiP9j5NhKM1Ai5RF8OOIjDSGgdTkyjn5FCUWWdIYnRtSt7Z/VvYmnDYkbUL4GAiKmMqzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B7981516;
	Mon, 10 Mar 2025 04:33:42 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D93563F5A1;
	Mon, 10 Mar 2025 04:33:29 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] coresight: add verification process for coresight_etm_get_trace_id
Date: Mon, 10 Mar 2025 11:33:17 +0000
Message-ID: <174160625281.2197960.2271358102397768915.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310102724.2112905-1-quic_jiegan@quicinc.com>
References: <20250310102724.2112905-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 10 Mar 2025 18:27:24 +0800, Jie Gan wrote:
> The coresight_etm_get_trace_id function is a global function. The
> verification process for 'csdev' is required prior to its usage.
> 
> 

Applied, thanks!

[1/1] coresight: add verification process for coresight_etm_get_trace_id
      https://git.kernel.org/coresight/c/ab37128a

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

