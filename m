Return-Path: <linux-arm-msm+bounces-43440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0460A9FCEBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E4E3188365A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3470D1DB36B;
	Thu, 26 Dec 2024 22:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEEPOsp2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F064E1DB360;
	Thu, 26 Dec 2024 22:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252756; cv=none; b=V+DQ1vSQsVaYG/z9a7kRIyGzQ4Hj4xqqCxIBDtnj3udhPmJsF6QmXgXLZr7GsZOngLyQT3HxF0ng/gXZu1mq9QR/RoHy9/BnR6oQUtfQKLfPq5/j4Sq2xwdwVIlpFEgf5iw7Fo8vHLYcy+Xly+wmQZ523DBR+4E0jaPSP/IjdnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252756; c=relaxed/simple;
	bh=MH2MAtAlKmMynOwGUhobtHkjdwqX01DMyMcw/cDzHQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NCRTqxRsvIKLefTk6GHKPC1SY2lRMZ7OaIIOVza3XPm/6C9xLWqm8aS/GHrmLzpil/lyWAVzOfs7EACSbfmUT96Uy8rpO27qKB2KBe4TPWPoqJIY5HHPUiaLM3gC2ypM2VrDhzx2/lQQQKJMrkveYNlKqeXjbShuT+EMTusW2EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEEPOsp2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8483BC4CEDC;
	Thu, 26 Dec 2024 22:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252755;
	bh=MH2MAtAlKmMynOwGUhobtHkjdwqX01DMyMcw/cDzHQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YEEPOsp2cdoJWLmAbVMtU55DZGhvxia/dKc8qUHalOowCtAZBrnZ6JBeQ42e9SxT2
	 T9i0lD8Fzpd/5RiM+zOa1Cnnj0y+pIrXa/G1MwmDu8VVznxpt+DYmP/c5QKmJjZ0gc
	 NFamabw7X57+S/QO+NiVZL2LMY8YLtXRpNX6zNk44Ygby0kD1WosaAD+qc4Te7zSeM
	 rwy56mSQUtd/QhaYPdbh9c4Qp/2k1o9391v9SFtSf7ok5NAbi9LrVEbeLjvrt7gEHE
	 uLo82ty6CkslB0UHWTjkyOXUDuRU13bNzk6vXc77mhXltZJq+nl6MSMAmNS0YptEuK
	 4bXcExs2l3P8Q==
From: Bjorn Andersson <andersson@kernel.org>
To: conor+dt@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: chenxuecong2009@outlook.com,
	devicetree@vger.kernel.org,
	gty0622@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: qcom: Introduce Huawei Matebook E Go
Date: Thu, 26 Dec 2024 16:38:44 -0600
Message-ID: <173525273260.1449028.12726535123870878692.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220160530.444864-1-mitltlatltl@gmail.com>
References: <20241220160530.444864-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 21 Dec 2024 00:05:27 +0800, Pengyu Luo wrote:
> Add support for the SC8280XP-based Huawei Matebook E Go (sc8280xp)
> 
> 

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Document Huawei Matebook E Go (sc8280xp)
      commit: f99c52954a82601d4d46677e9399e87c8b6c1bb3
[3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)
      commit: 1401ae5c28a259f684ccba7b460884b88f863596

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

