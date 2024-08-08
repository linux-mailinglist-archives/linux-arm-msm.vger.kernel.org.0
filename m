Return-Path: <linux-arm-msm+bounces-28188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B41E494C4E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 20:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E594E1C25239
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 18:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09923146D57;
	Thu,  8 Aug 2024 18:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ioMKZKna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAD113774A;
	Thu,  8 Aug 2024 18:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723143107; cv=none; b=Vzov3m8McmUZ/NWncpE//THMgvRj5gQ7EX9ScaqMqPDDHn7gwkmIJgyNQZ7F71ZmlqKAVC5ilISyoFET4kUbcsHciRzo7cCrRlYuYww5LQbRkIoiTvHggmvnB/cA5eQBbctpL2CIT7Jj/pfZC+eyxzpox37MkHh/35CmQiPE2pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723143107; c=relaxed/simple;
	bh=/Ls9Jjwq1Z4z4+wbQLhMP61UfgonDm8QY0pDPfTvFAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXVa3A88FbP8SYQ8FbWHaGrfa0xC1YErOBcHHVbeZkkMBQ6JqhhNOUMP2yOvpmCtY0oVr44KuWzRbI62glzk6GhSy1Yb+q0epvbEKqWukzoco0MzwjkNeVN7RxrHEy0nc6AheyuXTp3AXv9p7+XnZq/pu4qS8TuAHJ0wiQN11h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ioMKZKna; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CFD4C32782;
	Thu,  8 Aug 2024 18:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723143107;
	bh=/Ls9Jjwq1Z4z4+wbQLhMP61UfgonDm8QY0pDPfTvFAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ioMKZKnaG2orrvUI7VSBu/2OsjESDRWtYnirGaZMRF/+TTZ0ULb92RcOHcCdN2TZE
	 Cd474F/6IPyelODJg6AF+FrEEK7+8blTRTncNO2j1/cJjzDfAIqv8ukrtUSeqJYIyA
	 SR8MRxar/q7q0RYehcqyt7zEHkL7ws33AnKhw56Q4WvCsSMv6sjqmD9EGnC0V1JWk6
	 nUlH+tG0MfPdQ9Aoo0lK4jwMJGkOb6mc9nnw3/j394IwGfS4eYl7D8YY6bJxlTzE+l
	 jbMgdba2vBM+NEcBrCWPL5dpA5aSjOHVPGQXbDWZKVJKvbAZO3cCq+8DfW28eXI+yx
	 fUicR/yNlqRPQ==
Date: Thu, 8 Aug 2024 11:51:46 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] rpmsg: glink: Avoid -Wflex-array-member-not-at-end
 warnings
Message-ID: <202408081146.09AA68D69@keescook>
References: <ZrOQa2gew5yadyt3@cute>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrOQa2gew5yadyt3@cute>

On Wed, Aug 07, 2024 at 09:19:07AM -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> So, in order to avoid ending up with a flexible-array member in the
> middle of multiple other structs, we use the `__struct_group()`
> helper to create a new tagged `struct glink_msg_hdr`. This structure
> groups together all the members of the flexible `struct glink_msg`
> except the flexible array.
> 
> As a result, the array is effectively separated from the rest of the
> members without modifying the memory layout of the flexible structure.
> We then change the type of the middle struct members currently causing
> trouble from `struct glink_msg` to `struct glink_msg_hdr`.
> 
> We also want to ensure that when new members need to be added to the
> flexible structure, they are always included within the newly created
> tagged struct. For this, we use `static_assert()`. This ensures that the
> memory layout for both the flexible structure and the new tagged struct
> is the same after any changes.
> 
> This approach avoids having to implement `struct glink_msg_hdr` as a
> completely separate structure, thus preventing having to maintain two
> independent but basically identical structures, closing the door to
> potential bugs in the future.
> 
> We also use `container_of()` whenever we need to retrieve a pointer to
> the flexible structure, through which we can access the flexible-array
> member, if necessary.
> 
> Additionally, we use the `DEFINE_RAW_FLEX()` helper for an on-stack
> definition of a flexible structure where the size for the flexible-array
> member is known at compile-time.
> 
> So, with these changes, fix the following warnings:
> drivers/rpmsg/qcom_glink_native.c:51:26: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rpmsg/qcom_glink_native.c:459:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rpmsg/qcom_glink_native.c:846:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rpmsg/qcom_glink_native.c:968:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rpmsg/qcom_glink_native.c:1380:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Looks correct to me. As a separate change, I wonder if the strcpy()
should be replaced with strscpy_pad(), but I think it's all okay as-is,
since channel->name seems to be set from another fixed-size array that
is the same size.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

