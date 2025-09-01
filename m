Return-Path: <linux-arm-msm+bounces-71430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D377B3ED44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F46E18942F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 17:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47CD320CBE;
	Mon,  1 Sep 2025 17:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsVrj1hp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BD032F745;
	Mon,  1 Sep 2025 17:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756747183; cv=none; b=dnvEdiBe7m4xoqHLi4pCnZwtRM2uuMQjFEbmHMmsWGgBABK3K898A7CZeKO1/cFEPSrosDQ1k+Pffm1Qb/CkxIOnKtKH9lWTpcLYQzNkqd88D1WBkcaPFCGxVB8Aldg5cM4yJe0wIflBUKVwAIAY2k+jMdRLgG1wYBdB73PqI5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756747183; c=relaxed/simple;
	bh=LTsYfXSoWy+6ymATvvUmvSuhPhnA+upAcmRN+APLQ+M=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I26ddZIlEoZAJq1gQWW4VN82BRl56wkPJ+gIFQVGISUNnVZfZLnukTQjMdBLxdsfD+sRzNQXN+Qq6M+kqy3Q12S4tzKIN0w1IZVngOjWZHakC8hjnt25TRvCLwmRlVm3zVZKkRVV9QsEbEv4iv8Ri5Env4gDc4DG32sUckT0/qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsVrj1hp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6422C4CEF0;
	Mon,  1 Sep 2025 17:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756747182;
	bh=LTsYfXSoWy+6ymATvvUmvSuhPhnA+upAcmRN+APLQ+M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=bsVrj1hpsh4DPYF6zULELEC+ysh6Z8ZCPnDW8UiE27ff/hX0IQ/6zbyV/Jz3ig0xu
	 aN823OHRzDIEi9oj3xXnnASY0xZUQ5nERJo9nSVmOaPCG53rsYFPQFrrIyFafeMLQf
	 um2107p8JESZkK7c/gmHsg8FzlNPdBTQmmtQVME3s+cAiOtfmOHejhPOXv04TsE6lC
	 OFRNEwXhdn1f1/yyESCztRojIXgj3ttpEjB86V292we/+EzPyNG/sO3OF/uoMZdjX8
	 OJ7dc75UQf4+h8ZMUACeCQ2Tl/euUYeqzlXWGvrsfnihBCymYrtNG2ZW37Lf7/UBgH
	 /ZzPoL49HkjYA==
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250814142428.282639-1-rongqianfeng@vivo.com>
References: <20250814142428.282639-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH] soundwire: Use min() to improve code
Message-Id: <175674717945.192919.14320510843993196619.b4-ty@kernel.org>
Date: Mon, 01 Sep 2025 22:49:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 14 Aug 2025 22:24:28 +0800, Qianfeng Rong wrote:
> Use min() to reduce the code in qcom_swrm_xfer_msg() and improve its
> readability.
> 
> 

Applied, thanks!

[1/1] soundwire: Use min() to improve code
      commit: 88f5d2a477ec64b12e83b488407490bb4a9298f8

Best regards,
-- 
~Vinod



