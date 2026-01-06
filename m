Return-Path: <linux-arm-msm+bounces-87730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BF0CF9F7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 19:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62ABC308C36C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 18:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2C033F8D2;
	Tue,  6 Jan 2026 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3pBNtPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C389233C535;
	Tue,  6 Jan 2026 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767721976; cv=none; b=OrGiCdGxOe5XqLdkjqZ1FUi+kB/y47afLtDVpP0SYZBf6J5zsHOtazXjl+tiayhRGyPQ64iIW0zscQqD6W8HiTyZV3x7b/B14lDIx/sceJSlQ0goX3mm+4AguiwFR6fEcnz87juaspVDJpF5NCChXaJ1LZ9YH60RZ8PK1B4JFqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767721976; c=relaxed/simple;
	bh=regdfs/BvZ+lH9GC/Cm40PBS5JNiPY9Dskv7YKAbpmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mth0yCdAn/Qmpj55rd1ZgQhL6Y1c6zFo7e7imh4uHoSx9usd9EywNypRB8H6ulQMFRxlPcgograhm+vLpmJ6J+Udcm72ezVideL0qu7LOj4AF2iHWlzA2aEpFDZEouXjOnVYZ01sZEIcda5qqfedjy6V4gbMOdi1Jfk9Co99qvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3pBNtPb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EA0C19423;
	Tue,  6 Jan 2026 17:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767721976;
	bh=regdfs/BvZ+lH9GC/Cm40PBS5JNiPY9Dskv7YKAbpmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M3pBNtPbGTVGkyI81LhkBvU5WS1HzVFMLikQk3IRCtT9G7HWBH4sx9kMz45Z12wrv
	 NhFrlml+l5gQ074wIH2W69xJKehjBSs9Tx418Gd+r+aFPl0MjEFwoB+MV/UB7GAkeh
	 8Q1B6dJsW0QFPQYVHnvyFCBGn+DlY1ifuHE4Lg5aXXxuHx8AK88POaF8YbzOJsiJRh
	 icRLDCnAjW5B13TDDqRzGwZuWZ+sh8gVc8DB3QR1VXOQh4TMcUJ9880sLtasy6zo8P
	 QL52gG1QWDWWaHoCP/q5mwTlp2oJmwNX7I+8DRSTolqfQsbUJL6+IIVdViQEyXyvh5
	 C8gzaX0lAqUcw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
Date: Tue,  6 Jan 2026 11:52:51 -0600
Message-ID: <176772196923.3106040.18008733821108788066.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106-b4-sm8750-iris-dts-v4-0-97db1d1df3dd@oss.qualcomm.com>
References: <20260106-b4-sm8750-iris-dts-v4-0-97db1d1df3dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Jan 2026 10:07:38 +0100, Krzysztof Kozlowski wrote:
> Changes in v4:
> - Add required-opps to fix reported dtbs_check error
> - Link to v3: https://patch.msgid.link/20251120-b4-sm8750-iris-dts-v3-0-8715442c30d9@kernel.org
> 
> Changes in v3:
> - Add tags, update dependencies, rebase.
> - Add missing opp-570.
> - Link to v2: https://lore.kernel.org/r/20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
      commit: c0d11ff904753a99e0f6efd29e614268bc6e98db
[2/3] arm64: dts: qcom: sm8750-mtp: Enable Iris codec
      commit: 10d764c8cb1bdaff15020115aa49ee7a0489655b
[3/3] arm64: dts: qcom: sm8750-qrd: Enable Iris codec
      commit: ad0721bba4156d4d06c5f79b0a32e9d876f5ad0f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

