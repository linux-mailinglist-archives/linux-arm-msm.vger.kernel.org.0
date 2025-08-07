Return-Path: <linux-arm-msm+bounces-68016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73902B1D87D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 15:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 057223BD396
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 13:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7443416F8E9;
	Thu,  7 Aug 2025 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1Lf7Ngw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B551DDF7;
	Thu,  7 Aug 2025 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754571811; cv=none; b=KZJty+4RFt2/oRBmbZsfwZQojEVMG60e5+miDFHioY/hfm68AOLrzn+BH1ImTC4Js2xhoNNu9tCTMhGprmjgT4rf/D9S29UY3vYNlpshJRuRQqpyDgUuJSSagdjcgyb1rHNEu+ekAdUYgMGKz3h+cwRCSMEGn455VBVeX0Tr2iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754571811; c=relaxed/simple;
	bh=ITjeV1vhs/OWV7VDwZrJVXBhkUVHJfvZRS6GRlX1xaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiSB32R9YWPeA68NclOgbpm9xbgpPAWs/ipyTIzhIWRULljwa9EWgKQVHw8NHZek98VqW446tXA2JGyHZ6yzq+bpHTDcRhGwb2cTGBj10wI5D88pOYPyfRbkx/DedNSGbHUyrXFVd1C+7NTiPf5Rdu5dfsUOVnAYBd3S7vcqsBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1Lf7Ngw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8005C4CEEB;
	Thu,  7 Aug 2025 13:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754571810;
	bh=ITjeV1vhs/OWV7VDwZrJVXBhkUVHJfvZRS6GRlX1xaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1Lf7NgwIrMo5HOztfwNfC5MynlHS2F3ACdF7Bn6Tn16S1UiE1Cb3M8ZiwUsXZJp1
	 g0SNA1/FwVyuaIS2k5piEq74s9jhSZPncOfMNik1qI0vlYwi3O9XonkwnrQxmXj7ps
	 bipDhxJKa2oYf1QpIWxqGuYCV0T0nmSsiQIXjrtFhIt25C2BHiFDfReKKrEJUw91nN
	 kPG2Mt65cEBjaLc2WVZiy5H/ciEsJN1qfcrc1UoSivzqa/2dxjJJCQzfvxra7k9m9C
	 XqQo4A5bN/Hura6MAmB/Nn6Z6tyTE4tgYDmBsdLWb8r5sWxpBop4fa+ZdoHes0LUlS
	 rKiKSSqkVvx6Q==
Date: Thu, 7 Aug 2025 09:03:28 -0400
From: Sasha Levin <sashal@kernel.org>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: lumag@kernel.org, abhinav.kumar@linux.dev,
	jessica.zhang@oss.qualcomm.com, sean@poorly.run,
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
	antomani103@gmail.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Fix objtool warning in submit_lock_objects()
Message-ID: <aJSkIJPbvj5xuu77@lappy>
References: <20250805225557.593192-1-sashal@kernel.org>
 <CACSVV02Z=4Saw=-MA6zz-Dsye8T=AcARWs1AhUbWnyA8sY7fdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02Z=4Saw=-MA6zz-Dsye8T=AcARWs1AhUbWnyA8sY7fdQ@mail.gmail.com>

On Wed, Aug 06, 2025 at 04:38:19PM -0700, Rob Clark wrote:
>On Tue, Aug 5, 2025 at 3:56 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> Restructure submit_lock_objects() to use a single loop with break
>> statements to fix objtool warning:
>>
>>   drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x451:
>>   sibling call from callable instruction with modified stack frame
>>
>> The drm_exec_until_all_locked() macro uses computed gotos internally
>> for its retry loop. Having return statements inside this macro, or
>> immediately after it in certain code paths, confuses objtool's static
>> analysis of stack frames, causing it to incorrectly flag tail call
>> optimizations.
>
>Maybe we should instead just split out a separate
>submit_lock_objects_vmbind() and restore the error path 'goto error'
>instead of returning from within the loop?  Ie. basically revert
>submit_lock_objects to the way it was before commit 92395af63a99
>("drm/msm: Add VM_BIND submitqueue"), and then move the rest into a
>new fxn (with 'goto error' instead of 'return ret'?  In retrospect the
>vmbind case is kinda just shoehorned into the existing fxn.
>
>I can type up this version if you have better things to do.

I'll send it out :)

-- 
Thanks,
Sasha

