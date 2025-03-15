Return-Path: <linux-arm-msm+bounces-51540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D86BBA62F4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 16:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8BCE189B5EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 15:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4392F16EB54;
	Sat, 15 Mar 2025 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aR8In+pX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123B717BBF;
	Sat, 15 Mar 2025 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742053101; cv=none; b=EiWeiQispzUmtXXuGozdgL0W9jqYtdtqKklT91FhTjaV8ilrmcOCdBm6L8a4QTz2QDCieHboNlLsY9cVPRHfQt4RStP93wlZJCthLjA1WUO1xKBY+svLwf1ubMfQkeUh/1qr7i0zREAMk0faQdDdA6/cVLCovFxS3kFHjzOfO7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742053101; c=relaxed/simple;
	bh=a6Ti/Jz0EnyQzOF6ksSQ3WST73zH9uNCX05F4CFxkZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EfA1Ma+PeaJSBrxxCnOD/pzBdVRP1hsFq11OutccS2ngxdUF4lwUSmIQ1tKvKU8SMmjl1pTK0TCZ0SwBu6EWazz90P9fsIztf6g5jg8rgubMXvKlvXzwawIhnxS1NDY5YEqk7WoUh6/T1XlH4Y8QI3sd4C5AmjqPw3FuzMbY4Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aR8In+pX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06DAC4CEE5;
	Sat, 15 Mar 2025 15:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742053098;
	bh=a6Ti/Jz0EnyQzOF6ksSQ3WST73zH9uNCX05F4CFxkZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aR8In+pXG4VTkQG9o+GBSQqCz4x3YyRMhC7kKsgPyktZ4ZyyxOfaJGvXGG1bAQ9a1
	 feWr82FQ9gZfnYK6HRIxSkPO3+C6wLvbvo3qcJb61zeBS72eSoJaPdwnc69rdj8hcI
	 79Uwa8OMIuZXVIdVR37OByMYnNzYJo2So+TYbqPHI76bOYn5eu9GtZuvCffjEf5FTQ
	 AiCV52nfqj/TqIJNl6z3GvkA42xTvk5PSL3nEFkCgJ8VV1a6PMfB9tsQJffuHKoKvE
	 s0LeQ8oJZjykwuRn4z3nQvtwb+HhPNINxfuih8JpawN/1uFjjqWpeeUIn65eg/gYqv
	 xcsrZO2QKxCfA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: add minidump_id to SC7280 WPSS
Date: Sat, 15 Mar 2025 10:38:14 -0500
Message-ID: <174205309197.3372517.2896355070369674479.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314-sc7280-wpss-minidump-v1-1-d869d53fd432@fairphone.com>
References: <20250314-sc7280-wpss-minidump-v1-1-d869d53fd432@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Mar 2025 09:24:31 +0100, Luca Weiss wrote:
> Add the minidump ID to the wpss resources, based on msm-5.4 devicetree.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: pas: add minidump_id to SC7280 WPSS
      commit: d2909538bff0189d4d038f4e903c70be5f5c2bfc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

