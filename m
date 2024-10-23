Return-Path: <linux-arm-msm+bounces-35505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D51FE9ABCBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CA1E1F24273
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E811494B3;
	Wed, 23 Oct 2024 04:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dl1YQsjo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7455149011;
	Wed, 23 Oct 2024 04:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656978; cv=none; b=KX7inmDN6a3J+T5mGoqK1zWE7tqK/kxqqcZith17zxX8VE5qTu3FP4aTVde1N+ncg9OHtXyklsbxO5dlclcDPR20jydBJnR/wFWtQlrCg8kIRMJ1PWxrmhu2JZG/KuUoId7B2bC2yIdQDNKM8GK1EWFVcM2oW068EHfizgYkj8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656978; c=relaxed/simple;
	bh=6dAyh6FUplj/AMPi0dtwBF/WFj0wqDpw8f/AAZPaqfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uapwKH6HNz1YX7+fI61Ansgi1liRDYEr8ly2ZWuAg2CedD14GoNcGfxMJDTlghV4gvmOKZgMrjwYSXjnBINAOuSnf0JYCRcHZnM7sii3jf8M1senNIDvqihtH5OjaalPvyglFzLhkezCCTdysxZUg72iJh9RHBY2i/yL8DUz/TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dl1YQsjo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB3DC4CEC6;
	Wed, 23 Oct 2024 04:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656977;
	bh=6dAyh6FUplj/AMPi0dtwBF/WFj0wqDpw8f/AAZPaqfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dl1YQsjoRO3eEubw8IKS+3dAQuCaDuaNOWA/MGjeRBvV9ciRh3C/vjmUYYwgBQU33
	 XZQWTFdRTR9Aqe22tpTmoYttZ3W6pCX3bnZeXwQQ/YnPOKHNHSphwDX6otNIBuZp2I
	 qjtV7FM2LkNClF1ihTuDvFddeTzpJrk6V5IJvDV2FZQM9R0zCXmQyMrzMUpMe53H4j
	 DovL2d3Ln/uqC5sdLEha83xhr/FbeqT/AMKHeJ5qhsLF2l1f7DofatyauugyG5WOCN
	 N7yvtp11tzcE6vD6sQpxuNEyUb63Fe3qVQCtSDqiCIBhiQOY+0jxIdxSHjoPpbZfbN
	 2VG4lBQoacPkg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: smem: Fix up kerneldoc
Date: Tue, 22 Oct 2024 23:15:54 -0500
Message-ID: <172965696389.224417.8066222975328993519.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241021-topic-smem_kerneldoc-v1-1-4825904a7e25@oss.qualcomm.com>
References: <20241021-topic-smem_kerneldoc-v1-1-4825904a7e25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Oct 2024 13:54:56 +0200, Konrad Dybcio wrote:
> Fix warnings like:
> 
> smem.c:504: warning: No description found for return value of 'qcom_smem_alloc'
> 
> 

Applied, thanks!

[1/1] soc: qcom: smem: Fix up kerneldoc
      commit: 11cf9a72bc0b31c16d0cca7487966710a452b6e2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

