Return-Path: <linux-arm-msm+bounces-55855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0C0A9E8D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 09:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF65317A0C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 07:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19E61D63C5;
	Mon, 28 Apr 2025 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2IPHs8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FBD1D63C0;
	Mon, 28 Apr 2025 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824046; cv=none; b=OvITCtlionWvCVGUySpcG5+4wcoWOQpBBWXWlVRd6tvwjQgfq4NKGi/PUxtTZ5aohl4yskqC6fuQGos9X1Eo/00LHuLsn4y2BcCR32IwfOGlWJoAUR1n93dCJSmUL2RYuJpB9FEuLtKgn2Cz260nUGJiRYNAA4IZJmmMkqpzcfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824046; c=relaxed/simple;
	bh=Nz7ID0KToPMLRXoXRYtKNRVZC8wb0mcN+wMWOp3WijU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZhkMlSsaCxuNwphWPS9mJxkv4GXtFrJoRbSrW5eymWinmTQnCRU5ol4YwRzQrYXpwf9jmO2fiwiqLSPw7tec2Zi/zyyisC8BoQ5fxhPCJsI0aNlPHIbWzaSHt/hcZwkY3M1jh4D9v1wJji3vkKBs0qSC0dMvckcO+rkfcyvyGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2IPHs8W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0891C4CEE4;
	Mon, 28 Apr 2025 07:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745824046;
	bh=Nz7ID0KToPMLRXoXRYtKNRVZC8wb0mcN+wMWOp3WijU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2IPHs8WXiEp2VvZ7TMUE9w3k/oj3rFB5rX5Fgr30gzWv9yabSWM2Ux52QzK/wKS0
	 9OAGc3WOjJtvf+fcR66C9RMywHJNOlOjOim10D47qbgpd7Btzd2VYV1wWSfbcZ3lnX
	 OVoiBBSevbdqWtYKmFXCupz4qBHpQcK2wHwb5/2WPV74xZZU/bSx//8INuynhrHMjg
	 L4B2ahTodIs9UrUqXuzftgsLm8PnLOshl/efG810xdbglMMJFgjk6xcNzlWlMQWoWv
	 UGf7ABlSwaMDug2sG/it5/hPj4ynwtDO+J3xzfhARBnm6mfSQH3HJLzU1R8WlI48Md
	 kJopY1aYx+OwQ==
Date: Mon, 28 Apr 2025 09:07:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Lee Jones <lee@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add
 qcom,apq8064-mmss-sfpb"
Message-ID: <20250428-prudent-hasty-pheasant-aecec4@kuoka>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>

On Fri, Apr 25, 2025 at 08:47:01PM GMT, Dmitry Baryshkov wrote:
> For some reason Lee has mis-squashed two commits, picking up one chunk
> from the first patch and one chunk from the second one. Rather than
> trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
> Add qcom,apq8064-mmss-sfpb").

I don't understand: that commit looks like direct, proper result for
https://lore.kernel.org/all/20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com/
so where is squashing two commits? The diff markers have offset by few
lines, but it's still just few lines and they do not matter - there is
no diff/patch mismatch from that point of view.

Best regards,
Krzysztof


