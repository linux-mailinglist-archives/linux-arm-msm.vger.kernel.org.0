Return-Path: <linux-arm-msm+bounces-76923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B17CBD17BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 07:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE3394E5300
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 05:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9411A2DC764;
	Mon, 13 Oct 2025 05:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzNLZgaA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EC61A5B9D;
	Mon, 13 Oct 2025 05:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760334265; cv=none; b=UiuXiZPVF9HzvOHADIgx0bL9XkoWvdiAc5bOutIHKc0fd3X0RSvqWX1Xen0MfgeApE/gxljO5JjekVrhbzUQtFtfTagWYWlu/k91gbEqGlc1A5HIIBu2uAKnqec7jqu5vQPz5EwI0qIZepPyYieMeaspjgHOiDbxHiizXZ9AcNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760334265; c=relaxed/simple;
	bh=YBX+sR9Wq6bEB4uA7++MJZyExLVWLuC6r1wmXzxpJGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6fhwyEreh5quDNv7LhySwIaztNCLOuzrtHBtuNzxJEY+PMYX7k39z7EXyuR6w9fX6M3flvzAmu9TJBaFjyCxEIPxqTUA9XDyF5qVNfs4JsWaOBlzhzZklS6jam7Kii8o6gX0J9qvRmhM4eXW4znaMmFzvmD8j83azSokoPY9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzNLZgaA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67D6C4CEE7;
	Mon, 13 Oct 2025 05:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760334265;
	bh=YBX+sR9Wq6bEB4uA7++MJZyExLVWLuC6r1wmXzxpJGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HzNLZgaA1BwutUws84DWTHtjEOxjk2mlgELSTnZSnQHGiAfJau+7ytjgK9yka07Ca
	 Wre/3bRYlCYRJZ8H5UbhvGfMkTFWUu25Q8GfhFBUYm6sZUB1UCIVDUSZKvFLcRy/DZ
	 EW/wUr6+c2nVb0QI+gpMLLb2ZaFOrabmmP8HFfGPSxlE0ODbNpzjKr2H0PMLqKEtvM
	 4LzH0PTug1ca8Uqp/4KFPbmZ94D/KcKmrX713Ka1Eg4H8mip9BVxaVermuCw7H5fM0
	 n1fQz9gZauuC4xwHMBw5u4643xpfITSar5RbOLJbR78+vy+H7eY6BMkdVjYf70dkM2
	 sj67G2clzJKfg==
Date: Mon, 13 Oct 2025 11:14:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] soundwire: bus: add of_sdw_find_device_by_node
 helper
Message-ID: <aOyRtp5BqY15DreH@vaman>
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250704121218.1225806-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704121218.1225806-2-srinivas.kandagatla@oss.qualcomm.com>

On 04-07-25, 13:12, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been more than 3 instances of this helper in multiple codec
> drivers, it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod

