Return-Path: <linux-arm-msm+bounces-87470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36744CF42A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B3BB301B312
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C1032F748;
	Mon,  5 Jan 2026 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EoHR01Sf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA608286425;
	Mon,  5 Jan 2026 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622087; cv=none; b=F6awM7hbUOoeqsmAAk3hpLIKmX4FLnQoCCMESSuJp4K6Ua2VhHtWHjs3CgIFex+Md/IU3YqRyD4OzrZGR9iOymi7zUtlHDn4VMBnqqKKphN+1i0hcXd98e10a/QcGGK2NVcJKXroLg8rElRABxMSu2PVDpTf0smFpL4ltWy/YnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622087; c=relaxed/simple;
	bh=NJfFoE5aAGC1zpRIhR1swBjICgCuC1HQ68jCCk88IWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMJMMkbhPnoyzZGVZF3XSNFUCKII4WydH+gS9SY2+jbpFPwg9S9Bq9xu80Zsn5QS01hOTUXeQI+xbT/Zi4DeTvi+DVebbw9uIwkebHtlK9zpSfwar8yWcTScXaRCDQS2UPPETIpN4HANrTG2vAj67UB9Kea5zWbTyyyKVPZOoF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EoHR01Sf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86675C16AAE;
	Mon,  5 Jan 2026 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622085;
	bh=NJfFoE5aAGC1zpRIhR1swBjICgCuC1HQ68jCCk88IWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EoHR01Sf5sZ8NXJyRfpg305MjmGKjBb4iLh5LLzVjXimWDOdx0fH87RB1GnlxxUSb
	 GtczR43OFynjUS9YV6ddL/JQW4Akd8ovKspv+bxoRskpocagexdrE17VRyOEmW6ISZ
	 rWnKTlTAhPFn5opPlnsDa5RGe+SUfppVlI81JWTykFpcOUVhXHHxazYeWQaPk9hAOp
	 jr5QpZ+GXbqQl1zu+WG6JYarvgtV5y1U5KwUzTmofBa26OwEskpdr0NN0YatWZmE6l
	 vFM0/XhUK1vbblbx9bDk/E09KaV4e0XW0qbYbYFBi4c/QGyv4ZyQhfx3Q5ITGLSqsC
	 9ZRXBIn3YRvjw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm630: fix gpu_speed_bin size
Date: Mon,  5 Jan 2026 08:07:17 -0600
Message-ID: <176762206377.2923194.8079190393031358291.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211-sdm630-fix-gpu-v2-1-92f0e736dba0@oss.qualcomm.com>
References: <20251211-sdm630-fix-gpu-v2-1-92f0e736dba0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 11 Dec 2025 03:27:45 +0200, Dmitry Baryshkov wrote:
> Historically sdm630.dtsi has used 1 byte length for the gpu_speed_bin
> cell, although it spans two bytes (offset 5, size 7 bits). It was being
> accepted by the kernel because before the commit 7a06ef751077 ("nvmem:
> core: fix bit offsets of more than one byte") the kernel didn't have
> length check. After this commit nvmem core rejects QFPROM on sdm630 /
> sdm660, making GPU and USB unusable on those platforms.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm630: fix gpu_speed_bin size
      commit: e814796dfcae8905682ac3ac2dd57f512a9f6726

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

