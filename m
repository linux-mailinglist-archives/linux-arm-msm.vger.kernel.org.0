Return-Path: <linux-arm-msm+bounces-9732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FB6848A34
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 02:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E9121C2108D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 01:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3294696;
	Sun,  4 Feb 2024 01:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mvm2Cjrf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65924683;
	Sun,  4 Feb 2024 01:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707010267; cv=none; b=lus0ab1SNFB8mpLE1jDQrJRiXeLN5YqvKxH9FKv7LfUNaE25dOIw1Hcn7yyB4zGRPNqwotpHm/L/UbPN2BHTkIPDu4oY7qvN/lsPajOtOB6b7aGpWhf6ATZ1ks9tM7vhVIiZO6C6JsXkZC18dLzyEyh153PudpNFjMYP6qQYKTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707010267; c=relaxed/simple;
	bh=XRW28h1fQMp8IU8VcQUi378iF8sFOP6ADhPjPhUJycw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWBbDL/ygX0vFP4dHDlyMeOdAe6qhStRDh+QtsgsPbco9eLG9D0wek6Zru6IKQLFwmfN1A7jm7t6q0KtBidPPxYzRb0B980S2OZXpckWtL3dSG8fMVYHHHLbnzGu4bq9WYq6skx8XGEHGybwFvLpXn7V+1cSwWSjvWP/MyhhZ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mvm2Cjrf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71873C433F1;
	Sun,  4 Feb 2024 01:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707010267;
	bh=XRW28h1fQMp8IU8VcQUi378iF8sFOP6ADhPjPhUJycw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mvm2Cjrff6kLlvw7YJRIqZS0RSQn7QOA1WlIafq0CmiDZtte763VES5GGPWVngY6V
	 z5INN/2cFCnts+chu+KSypqYyvveIvhFcWGGj+SpA3ok7ysY7+whHiDjNXsoZJTb48
	 YAn38Zb/8ix4jLScTiH1k127m8yAS3/3D7rxglPARzEJo5AMHThEEqGoSvT5Oma4cn
	 kKSmBtf3Q0w951HRPZZ5cXjSdLxoS4+vjO+5C+N5Y4JGlQ1d3C1I+0Dv4DB5hWMBKh
	 pA81bcIgBATQLmEg6/9XOjJoT6pOYOQXX3aj5go7OQXGiWXYmj2Eg3amCOhlpIsRAM
	 rFYwJCP/scRqw==
Message-ID: <3ecb999c-8933-4181-a9ea-45116583bd9c@kernel.org>
Date: Sun, 4 Feb 2024 09:31:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] f2fs: doc: Fix bouncing email address for Sahitya Tummala
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, jaegeuk@kernel.org,
 quic_stummala@quicinc.com, quic_bjorande@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
References: <20240202165208.4091800-1-quic_jhugo@quicinc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240202165208.4091800-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/2/3 0:52, Jeffrey Hugo wrote:
> The servers for the @codeaurora domain are long retired and any messages
> addressed there will bounce.  Sahitya Tummala has a .mailmap entry to an
> updated address, but the documentation files still list @codeaurora
> which might be a problem for anyone reading the documentation directly.
> Update the documentation files to match the .mailmap update.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

