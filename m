Return-Path: <linux-arm-msm+bounces-21385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A35BC8D7390
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 05:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EAC92829C7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 03:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B68F171AB;
	Sun,  2 Jun 2024 03:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCKvZcFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E6C134A8;
	Sun,  2 Jun 2024 03:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717300434; cv=none; b=eZGfiql8sYcJ0e2oGlLIwAq6ni4mvQKY37qtbCyXhFVyJmg1d08CClqIcG8Q6P9KJREUx7z/bmQrZhilsWYVS6N3X2Ya5eB3+un0YW0a/LPTYRkQQXymUAKRh5RS4I5yfW4TxeaQqlgepI+Z7SGhQozQ2HeG4XddOW57omLel3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717300434; c=relaxed/simple;
	bh=uxGiLC94HoCcq12DaCtK5e2W7kOkXuvieOZLcz0FbeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aYMoAw0wn/zyhx2+f/QYd5sLTBPoDu1I9iC9zDoaaZPyt2BlLoblE4VF0M37zCS42OUvhrEiaVPhYfTv38pyHtX6LJh7BadQEvLvdzsYW5F7+X0gal0sgtktidrAWEFW3h7XcgTovOJpRsv7MtDNvbXTLre6fsC/ElNBPOU4o0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCKvZcFe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3791EC4AF0B;
	Sun,  2 Jun 2024 03:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717300434;
	bh=uxGiLC94HoCcq12DaCtK5e2W7kOkXuvieOZLcz0FbeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PCKvZcFeBlYTge43DZccXu/HTSGuii9Hvxm/UbUzpDoNHrMZCeH3TsgiFAuUp5Sab
	 Q9qUGpQkhfkdYSu2vLmnsVwY9wDm9jhAuN7ATRdVeYV1n4+GLezrzsCa0AE41a2LA2
	 w3hQ1gizH8qA/vMq24UrbSGLleOt912SHb6xKyve7gqQQNso6QjHRX8E5hEoptCxOY
	 ZEwL70d2I+A+fv2kEtB9EKrMLwDqWVkmClPUgPWORvTsG+N8k7gzPIe0KS8YMBIPwl
	 tB7OFicVNvXw3S8GUvWDGFC66/2XgSSyOSpdQqwq+r2RzQmYskZUBkuNTx+9i5qbLd
	 KsqLnd4bmYTLg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>,
	David Wronek <david@mainlining.org>
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8550-samsung-q5q: fix typo
Date: Sat,  1 Jun 2024 22:53:40 -0500
Message-ID: <171730042579.665897.11378108730114576749.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240531-fix-typo-q5q-v1-1-95f10a8eff9b@mainlining.org>
References: <20240531-fix-typo-q5q-v1-1-95f10a8eff9b@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 May 2024 14:05:59 +0200, David Wronek wrote:
> It looks like "cdsp_mem" was pasted in the license header by accident.
> Fix the typo by removing it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8550-samsung-q5q: fix typo
      commit: a5c84d2dde8089ece5e13f264359c6117ea3186b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

