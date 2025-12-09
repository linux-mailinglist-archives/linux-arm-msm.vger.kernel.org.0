Return-Path: <linux-arm-msm+bounces-84780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0078CB043D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 15:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D005305D429
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 14:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A19B2C158D;
	Tue,  9 Dec 2025 14:24:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C8626E6F2;
	Tue,  9 Dec 2025 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765290283; cv=none; b=sg8VwoIQ1HkO5QxYYcWr1N7BqyX2JgoNsTaZnLhLX63c5N/2/78zZcCznkzHrnqLDJ6nAvlkrLeNDv0h6TCn0eKV7NiLezslgsShq6TwvK0b6W9sFO6z9NoEBz9xb6l+02PJ2CyCsGmZSuzJpbkskoN5H3pI4/mlUepS0ZJJQ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765290283; c=relaxed/simple;
	bh=5bLN5yOVWXjBMNEIxFlBFEFxKg0L9cjEMdCcLhdefTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g91iIWk/JscIC3x2ZX1AsCtOOqOgfKjjeKc6esz+ARlSm7f7q1zAKJxH7fufPD3CB57vHAf/RcdlH2sEqRZXQz2324Jz4cd5XBxn4IjZmtFitGT0Wc5JHWZL0Oy9KH+AEYkZKhRgJ800LWdhE78SN3k6icBbSWf23Abobn6HptI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87635175D;
	Tue,  9 Dec 2025 06:24:33 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 635FA3F740;
	Tue,  9 Dec 2025 06:24:40 -0800 (PST)
Date: Tue, 9 Dec 2025 14:24:38 +0000
From: Leo Yan <leo.yan@arm.com>
To: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
Cc: mike.leach@linaro.org, alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org, james.clark@linaro.org,
	jinlong.mao@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_jinlmao@quicinc.com, suzuki.poulose@arm.com,
	tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251209142438.GV724103@e132581.arm.com>
References: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
 <20251209081649.105623-1-yingchao.deng@oss.qualcomm.com>
 <20251209121916.GT724103@e132581.arm.com>
 <1fbe140c-b960-4f13-83e2-b0a0733a67bc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fbe140c-b960-4f13-83e2-b0a0733a67bc@quicinc.com>

On Tue, Dec 09, 2025 at 08:51:38PM +0800, Yingchao Deng (Consultant) wrote:

[...]

> >    void cti_write_single_reg(struct cti_drvdata *drvdata,
> >                              int offset, u32 value)
> >    {
> >            CS_UNLOCK(drvdata->base);
> >            writel_relaxed(value, cti_reg_addr(drvdata, offset));
> >            CS_LOCK(drvdata->base);
> >    }
> 
> However, since we also need to handle cti_reg_addr_with_nr, it will be
> necessary to add an additional parameter "nr" to cti_write_single_reg?

I expect the argument "offset" has already containted the nr in
bits[31..28], so don't need to pass "nr" parameter to
cti_write_single_reg().

You will change inen_store() / outen_store(), e.g.,:

    cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIINEN, index),
                         value);

Just remind, this might be a separate refactor for common code and you
need to write a patch for this, then is followed by QCOM CTI support
patch.

Thanks,
Leo

