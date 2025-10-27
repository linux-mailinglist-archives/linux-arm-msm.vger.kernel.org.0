Return-Path: <linux-arm-msm+bounces-79054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1662C11CF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DDB8188BA1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33C634676B;
	Mon, 27 Oct 2025 22:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lK82TLR1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A548345CDF;
	Mon, 27 Oct 2025 22:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604521; cv=none; b=d0xodzKiRfNQM5dNICra8ojblweAJn68BsEeD86y7if0LoRpHYJJsOdLGcfQlvu2lZ7zual0GiEaEPyYfZ9Ys/p8v9Or+Tv0l+RTgnB8r4DXgdoYmjrm5j0Ql6VE4KZxS3a07StKe0dE0QRyPHUoANCcPv9XJpJf7W9upfxEejY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604521; c=relaxed/simple;
	bh=EjEo0KoqrRx7hm0J0GCQTp0mKLkIGffDJHupLvSE5OU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QqgIhOkRPJAcQ3T2/Sm1zBSYp3rd8vWe98iuHtVi+VfXBIphVXeKA2yR9HbHdpPNN+4VEMfpxx0swfAciGRr1/HdGlgvWVA+t1UAOC+e9po5AQp30TmsteOoQHJkjGHQkLpWHiT+FPgnj1w6/a7+xlI3vjAAMiCzwgGGqebmQC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lK82TLR1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B01BC116B1;
	Mon, 27 Oct 2025 22:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604521;
	bh=EjEo0KoqrRx7hm0J0GCQTp0mKLkIGffDJHupLvSE5OU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lK82TLR1Ed3JbQZIAbPPcgic+9nyfH2dsTyGBwpCWEqqlDYqkBgQLmhG6HN6usepd
	 0J6tMdnct0ShBMmhsZb59bJEv0+jMQVl9sS84q+MXA7oApuWum1uVo1blPal04ANmQ
	 ag7ULdJqxyuhBD8OStQAzV8WoC29zuSLqJDCz6VS0f5dpxMoUD8NTkQv1QpPcpb9KJ
	 qS+sMlUAkbuXoMGAh1SR3RZ17ly8RONoM/f8iss7WqjauHFRSPEJKQwl1JfGe7ZQ8s
	 y3vpbJsLJdpl83hkaNqQffmYSpQw65kHgKJ9Hvd8O19zpC8T8CVxommtzAfKSh8zxs
	 KeAUH3jtQc5CA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] Fixes/improvements for SM6350 UFS
Date: Mon, 27 Oct 2025 17:37:14 -0500
Message-ID: <176160465254.73268.8815685950018576928.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023-sm6350-ufs-things-v3-0-b68b74e29d35@fairphone.com>
References: <20251023-sm6350-ufs-things-v3-0-b68b74e29d35@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Oct 2025 13:39:25 +0200, Luca Weiss wrote:
> Fix the order of the freq-table-hz property, then convert to OPP tables
> and add interconnect support for UFS for the SM6350 SoC.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sm6350: Fix wrong order of freq-table-hz for UFS
      commit: ec9d588391761a08aab5eb4523a48ef3df2c910f
[2/3] arm64: dts: qcom: sm6350: Add OPP table support to UFSHC
      commit: 06d262bcdb3bc86805739de1c484761f0a59a453
[3/3] arm64: dts: qcom: sm6350: Add interconnect support to UFS
      commit: c1a45887a36ef7ded3fb4bac59d4a3445098b04b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

