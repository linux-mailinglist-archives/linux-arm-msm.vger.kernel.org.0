Return-Path: <linux-arm-msm+bounces-65357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F11AB083EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 555FF7B9E1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99ECA21C9E9;
	Thu, 17 Jul 2025 04:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuWZVKFC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C321C179;
	Thu, 17 Jul 2025 04:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726689; cv=none; b=YjCJBxraOcPD++F7PlboLSO9dOIHjRS/FOqUREBxQ2j8J+XTRtQI5zIf9ZLzrATBEClc0umNHeCIBPWE8i8QFQbPFF3RNBjCDT7VJqlD+BAHADSt1eaM2lGA+ROubkCOXXTQfFWzh5UMyz6TpAS1ImKMSXjlXw2mxY86MW7dzIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726689; c=relaxed/simple;
	bh=719I8J1KcsNJYSo9vj9TLd+ME0xUomrWSOnuxtuPsh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kqZIS+hnnScq690Ey5C3bV2YaKs2WL5TM/pKH3Gd1v/2gQoA4l+Db0L1gBCW36Q4ojNJwTaaagAAD3KRFP1UbGaX/J1bTR49hBLYqLObYE//a6ShXr9p8BuX5R+LO82PzeNKVDl/OuksMlnOLuky8LZCTCSyNWjNp7sHEsCNd+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuWZVKFC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CECBC4CEF5;
	Thu, 17 Jul 2025 04:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726689;
	bh=719I8J1KcsNJYSo9vj9TLd+ME0xUomrWSOnuxtuPsh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YuWZVKFCjtYe/4yGNe2tu+x0hJqivkMtmH/r2btF2ZPXei/HqjZEefFRldGdDq3mm
	 /i2ZYbaGNPOKLLSEWjR4uUG+PBhIMnsxkAnW9yQ5W75H8yENHrjmpHPYVkoWxrC+cx
	 BtWXYj6WGHnRzcNYDfWb4SKIUhBYvytSN9qfX4FuI0tW+R+8gGorBqlXlmDhvI2joh
	 nUg1pYIICO8Bj12iG2IvEjAp+d2ApOE2uXh3ByBPrsfx6jRgHPPoUMMMTWIwgvVY6z
	 VHRRikNT/fWCldhwiElAi152nMSJLl7a+UtY29DjW8YKoOu6Kqwj2BPNKFoLrZtc/l
	 BBLIqXDuIpjew==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add SM7635 and related PMICs to socinfo
Date: Wed, 16 Jul 2025 23:31:03 -0500
Message-ID: <175272667128.130869.5489942944873490330.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
References: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Jun 2025 11:11:43 +0200, Luca Weiss wrote:
> Add the SoC IDs of the 'volcano' family, namely SM7635, SM6650, SM6650P,
> QCM6690 and QCS6690 plus the missing PM7550 & PMIV0108 to socinfo.
> 
> 

Applied, thanks!

[1/3] dt-bindings: arm: qcom,ids: Add SoC IDs for SM7635 family
      commit: e53ff5b79fbac35d1fbf2b8c28a5a5dcf125567e
[2/3] soc: qcom: socinfo: Add SoC IDs for SM7635 family
      commit: 95f3b09e7e8c963c3206ce5450a88747c4653343
[3/3] soc: qcom: socinfo: Add PM7550 & PMIV0108 PMICs
      commit: 9c4299b2361892a2eb8ab4ac63d07b97acd8a1ab

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

