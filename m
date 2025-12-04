Return-Path: <linux-arm-msm+bounces-84344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB82CA33DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 11:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65549309D87D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 10:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32C52DECA0;
	Thu,  4 Dec 2025 10:31:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCFE2DEA74;
	Thu,  4 Dec 2025 10:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764844316; cv=none; b=djchYlWYT3UlpPS9OvNsWMpAR/SC1ipFAmRgJBlQY/9+6UxQ2eTF+M3Kx/YYsHMfv3y2dRmSOyUYxro5M2pk3dckFkN2xMG9VYwsHjKOcXonjsbOrQFUOtxLyEbV6FBCWXkWnOiEWxwqfGYTxl29f6MPdcTu9iIjNV2VbCBc6Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764844316; c=relaxed/simple;
	bh=ewGCe1hnXjLvwlXbUtozK5MbJhduhZSnsapzH8XZHlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7041mtZFqYqgq0uQ/K2WaLK6F+8QQg+VMijdq+lX5K+GG2GoYkwAlBVckJedXXBAzK2eRfibVyOLvkJZgU9/sct7y6JGJ8wfJpZFDE69UgJ18Sb2tArwPGszmv6g2EREB11eu3KDTkDBTfLOW9HE8WxGC4Zp3RC7P7qBUi1r7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EBA0339;
	Thu,  4 Dec 2025 02:31:46 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FE6C3F73B;
	Thu,  4 Dec 2025 02:31:53 -0800 (PST)
Date: Thu, 4 Dec 2025 10:31:51 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	quic_yingdeng@quicinc.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251204103151.GK724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com>
 <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>

On Thu, Dec 04, 2025 at 09:07:56AM +0000, Mike Leach wrote:

[...]

> > I saw CTI registers are within 4KiB (0x1000), we can don't convert
> > standard regiserts and only convert to QCOM register based on the
> > standard ones.  So you can drop the cti_normal_offset strucuture and
> > only have a cti_reg_qcom_offset[] struct:
> >
> >   static const u32 cti_extended_offset[] = {
> >         [CTIINTACK]             = QCOM_CTIINTACK,
> >         [CTIAPPSET]             = QCOM_CTIAPPSET,
> >         [CTIAPPCLEAR]           = QCOM_CTIAPPCLEAR,
> >         [CTIAPPPULSE]           = QCOM_CTIAPPPULSE,
> >         [CTIINEN]               = QCOM_CTIINEN,
> >         ...
> >   };
> >
> 
> I suggested the dual offset approach a couple of patchset revisions
> ago as it actually simplifies the code & makes it more efficient. The
> offset array in use is set during probe and the remaining code is then
> common to both without lots of "if qcom else " occurences.

AFAICS, we will handle the QCOM CTI particularly in three cases:

  1) The register access;
  2) The claim tag;
  3) Sysfs attr is visible.

Now we are discussing the reigster access.  As suggested, the
"if qcom / else" is encapsulated (e.g., in cti_reg_addr_with_nr()), it
will not spread out.

I'd use standard registers by default and convert to non-standard ones
only when needed.  A new "neutral" index layer seems redundant, as the
existing standard register indexes already serve this purpose.

For the sysfs attrs, it makes sense to use a central place to decide
which knobs are only visible for QCOM CTI, otherwise, we also will not
spread the condition check.

I will reply separately for claim tag issue.

Thanks,
Leo

