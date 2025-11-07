Return-Path: <linux-arm-msm+bounces-80781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADB7C401C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 14:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBE941887133
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 13:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1EF2E2286;
	Fri,  7 Nov 2025 13:28:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D9B218596;
	Fri,  7 Nov 2025 13:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762522132; cv=none; b=KLsLWcG87aZvFjmXy3Uc9vvGGziz2tXJHhQ4FLDXFvJ/yBU4O3y3/pNjJ26EXg/MsqgSMaERo9UuyIuli3bh3UfS+GC89DWefJ8Szo4IOZjqfA3/4wIPsrfndtpe6+XbGXh5rArp8IceV0N6XCXEuzzCc/DCZf1c4/NKi3iHa/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762522132; c=relaxed/simple;
	bh=1RA8Ywb3xQZqwlDNsLFGElQlqaj5m1urfIZU9zoAv7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIOGBWHGCn/x/Ig3vn15Gl52r3bFS+XfBlSrxc7wICYBOfNCzOldfP9AQDVvrzp87bBczaPdfGQkmlg8nw6+UlXzPDx84Dj2B65bFmF0x/2gqLp964/5pm8ztQahv1jsdK+f/VTdoKH8R3r8tyCsu6fqsS1qgThXgUT3huVHW40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95A641515;
	Fri,  7 Nov 2025 05:28:41 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E2A43F63F;
	Fri,  7 Nov 2025 05:28:48 -0800 (PST)
Message-ID: <2835dd93-c945-4c19-9d10-0271b14147b2@arm.com>
Date: Fri, 7 Nov 2025 13:28:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
To: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linu Cherian <lcherian@marvell.com>,
 Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
 <176235893222.387743.2128022832743502879.b4-ty@arm.com>
 <CAJ9a7Vji3fFnc-XPhdTxh00QW+AjqLqJo=zt+SMwovttQRwR8Q@mail.gmail.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CAJ9a7Vji3fFnc-XPhdTxh00QW+AjqLqJo=zt+SMwovttQRwR8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mike

On 06/11/2025 14:14, Mike Leach wrote:
> Hi,
> 
> Is this fixing the correct problem? If we prevent the buffer size from
> being changed while the sink is active - which is probably what we
> should do anyway as no real good can come from allowing this - then
> the problem disappears.

Good point. But this is completely fine for a running "sysfs" session,
as the values are not updated (unlike perf, where the session is
scheduled out and put back in ). So, I don't see why we can't change
the values while the sink is active ?


> 
> Changing the buffer size while the sink is active should return -EBUSY;
> 
> Mike
> 
> On Wed, 5 Nov 2025 at 16:13, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>>
>> On Tue, 21 Oct 2025 16:45:25 +0800, Xiaoqi Zhuang wrote:
>>> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
>>> and enabled again, currently sysfs_buf will point to the newly
>>> allocated memory(buf_new) and free the old memory(buf_old). But the
>>> etr_buf that is being used by the ETR remains pointed to buf_old, not
>>> updated to buf_new. In this case, it will result in a memory
>>> use-after-free issue.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] coresight: ETR: Fix ETR buffer use-after-free issue
>>        https://git.kernel.org/coresight/c/35501ac3c7d4
>>
>> Best regards,
>> --
>> Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> 
> 


