Return-Path: <linux-arm-msm+bounces-84435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41123CA718E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 11:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4827C324F219
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2569302149;
	Fri,  5 Dec 2025 10:04:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E5D30C375;
	Fri,  5 Dec 2025 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764929084; cv=none; b=BOcp6j4hQ39fBLGWS44Ea31YQKBLjgFXpGw/Yv+0AuaQORV81ci0FFuit468Yosb9ppsKHjERoX1dvNFk3Ew9X0e6UoBei1DTIMzM8W+SGW8Vx7dhfmvpWayb5xbCXLVoTbTS8YIrkgWy5UhamqQdwHybKAecjbOLRB4w5t0yms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764929084; c=relaxed/simple;
	bh=nAkYKoyDuyzuPULwuLrwv7mWiIW1DcK4j24hM6qlSj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDhBdTklUFpxKjUHzgmoPJ6el+kyiaUeu2hpL2m+tdDJltzs4SBXyLgoZD+XSRoVqygiN133AD6BqmacGOG/yKOcTGc5j98lrj/MT+eVxV81VSGMgw4JFcbv6iBkBf40AVo6Tug3xvPB0BOMKL0QjvX/UsGY4kmXaD3ewV1owuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F544339;
	Fri,  5 Dec 2025 02:04:27 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E6E73F86F;
	Fri,  5 Dec 2025 02:04:34 -0800 (PST)
Date: Fri, 5 Dec 2025 10:04:32 +0000
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
Message-ID: <20251205100432.GO724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com>
 <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>
 <20251204103151.GK724103@e132581.arm.com>
 <CAJ9a7VjHHkkTz9XJqjdQ+11_XX9zXuY0ZcQzPtq=Zvi4CN__0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjHHkkTz9XJqjdQ+11_XX9zXuY0ZcQzPtq=Zvi4CN__0A@mail.gmail.com>

Hi Mike,

On Thu, Dec 04, 2025 at 04:17:35PM +0000, Mike Leach wrote:

[...]

> The tables in the patch are
> 
>     [reg_type_array_index] = offset_address;
> 
> e.g.
> 
>   [INDEX_CTIINTACK]  = QCOM_CTIINTACK
> 
> which resolves to
> 
>  [1] = 0x020
> 
> where index is constant for a given register type,
> 
> As far as I can tell what you have suggested above is a table that is
> 
>   [std_addr_offset] = qcom_addr_offset;
> 
> e.g.
> 
> [CTIINTACK]             = QCOM_CTIINTACK,
> 
> which resolves to
> 
> [0x10]  = 0x020
> 
> which does not appear to work correctly?
> 
> The registers are sparsely spread across the memory map, so a simple
> mapping does not work, even if we divide the original offset by 4 to
> create a register number.

This should work.  Though the array is not filled for each item, but
it will return back 0x20 when we access array[0x10], I don't see
problem here.

> The largest standard offset we have is ITTRIGIN = 0xEF8, so assuming
> the compiler allows us to sparselly populate the array (which I think
> it does, along with some padding), we end up with an array of at least
> 0xEF8 elements, rather then the indexed 21?

I tested locally and did not see the GCC complaint for this approach.
And this is a global structure with about 16KiB (~4K items x
sizeof(u32)), we don't need to worry about scaling issue as it is
shared by device instances.

If you dislike this way, then a static function also can fulfill the
same task, something like:

    static noinline u32 cti_qcom_reg_off(u32 offset)
    {
            switch (offset) {
            CTIINTACK: return QCOM_CTIINTACK;
            CTIAPPSET: return QCOM_CTIAPPSET;
            ...
            default:
                WARN(1, "Unknown offset=%u\n", offset);
                return 0;
            }

            /* Should not run here, just for compiling */
	    return 0;
    }

Thanks,
Leo

