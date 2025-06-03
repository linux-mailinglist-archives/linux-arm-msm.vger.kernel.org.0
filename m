Return-Path: <linux-arm-msm+bounces-60143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA60BACC66D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 14:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C9053A398D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 12:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7335F1B393C;
	Tue,  3 Jun 2025 12:25:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09661E86E;
	Tue,  3 Jun 2025 12:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748953513; cv=none; b=oEBGh4H1PCXqQRalNC3am962/r1m6X9NW3tV1mPCdE475mo4yfuoUnGfWaxxSMav5ta3ADIMAR9MR7RZqPA5YlYEDzZ9m9yITMPDba7lFNFklz3eFWFDejW0I8Y5MhfNExGLqJu3bWokUGMEAzArpWMdCwBDAUjEoLsKzW1a8Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748953513; c=relaxed/simple;
	bh=YsyA7tNc0e94qj6qio3wOBZShN/xA7ABzjpd8r1yO1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvM+ee9plidIxdzp1JrllSo3oW1BvcYyXMXQLb9exDtncQoj57VmgNy9bjF7zkg8tVYKn+uiWxMg75HHN0dEHh3MT6B2AKgEn0/pOH+4EvTLoogVzDDll1LC7C1rsw3d3O2CXf8JfqOoqm/y3Lx5cpdmjp/IczXlOlvE0C6ZzFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F32812FC;
	Tue,  3 Jun 2025 05:24:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 873033F59E;
	Tue,  3 Jun 2025 05:25:08 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:25:04 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
Message-ID: <20250603122504.GA8020@e132581.arm.com>
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
 <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
 <20250523085655.GD2566836@e132581.arm.com>
 <4d54e620-abb9-4a36-bab0-3970c7e30a5f@arm.com>
 <62d1e4cb-cc13-4333-a160-66a280dca5f6@quicinc.com>
 <17abf8b5-8a2e-4573-a870-e2f98ad866a6@arm.com>
 <20250530125944.GB666854@e132581.arm.com>
 <eb7dbabf-d878-468b-9945-36d8b14a4e65@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb7dbabf-d878-468b-9945-36d8b14a4e65@quicinc.com>

On Tue, Jun 03, 2025 at 11:22:58AM +0800, Yuanfang Zhang wrote:

[...]

> Using both dynamic and self-contained IDs within the same system can result in ID conflicts, which may cause decoding failures.

If so, please follow up Suzuki's suggestion to expose Sysfs interface
in TNOC device node.

Leo

