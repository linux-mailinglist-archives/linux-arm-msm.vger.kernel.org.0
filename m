Return-Path: <linux-arm-msm+bounces-25432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40089929581
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71CEA1C20B3A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F920142E6F;
	Sat,  6 Jul 2024 22:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfo0HyKR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E5A14036D;
	Sat,  6 Jul 2024 22:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303301; cv=none; b=st22E4eCFWceJ3kc9DexNvfFtt4LzIdO3WsztTbh5h35O7BJwlvSo1oRzW8uas1BHm7U1ZHHgEQHiWp84e49e4uvsOfqdJxuCFfsMQHi1hDon80lnU+0oqXswvfJrnJEgKUiiJVMXavvmitQfSw3WJ/uZCsEFjAqZeWRZZ1nIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303301; c=relaxed/simple;
	bh=wdNnOaJiX/VT5+td9QKppYZ4ZVlw14p0tPuOG5IO/lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=suCSTJfmp7GCiZMatxR9mlI29b0Vco9AroKBfVsZFHzv6El9s3zF4N6i1x4eqmYwS7iXg+2B4Tk54HlLpQ5EJvjUaPKqzHY1LlM8czmU61AmKGjeIZdtD1e940zLEtC5CmdCEz6Tgq0diy9ZDCbIMq8mqas80XgqK3EJCOt1qAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfo0HyKR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC54C2BD10;
	Sat,  6 Jul 2024 22:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303300;
	bh=wdNnOaJiX/VT5+td9QKppYZ4ZVlw14p0tPuOG5IO/lM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kfo0HyKRJSqrfUbIBrGtaVD44IoGyouTdi0WLDQA4LFyTptgEXhuCj/tYvikVbyhl
	 EnWMCm+dOW57eivzsaHAlDn1QexiNxvjc6m3eQaseRcxZJE9aL/3UEKn4XyU/7cOFu
	 i9PwcjTuVBb17kK8pVMyQOObhpFGY0OMzj0hWXeREEho4lK2y0x+dMt7hjX/XRg7Lc
	 Zldve5mw8AKvPPT3tz7mKJbvErXazh4GMUfe+vKR7mMUh2AyX3E62ZZrANiqh1thyp
	 qhTTHy/zWtzsROuUSAAXd6N8uJVWOUQGPZk2p/rwwlrozDaCJUAMpl5tGeLc0xHyPS
	 Qsn/qJUFpbHBg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] More thermal configuration for Fairphone 4
Date: Sat,  6 Jul 2024 17:01:23 -0500
Message-ID: <172030328809.28909.15694647738799552654.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705-fp4-thermals-v2-0-a4870a8d084f@fairphone.com>
References: <20240705-fp4-thermals-v2-0-a4870a8d084f@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 05 Jul 2024 14:40:08 +0200, Luca Weiss wrote:
> Add the thermal configuration for the thermistors connected to PMK8003
> and PM6150L. With that all the external thermistors on the phone should
> be present in the dts.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sm7225-fairphone-fp4: Add PMK8003 thermals
      commit: 4d37847187b3fd7ff1fac23248a8ec11d89b3e55
[2/2] arm64: dts: qcom: sm7225-fairphone-fp4: Add PM6150L thermals
      commit: 8cf636a03260352853ff1c949f30c418600e7b2b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

