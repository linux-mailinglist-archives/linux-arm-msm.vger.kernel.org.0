Return-Path: <linux-arm-msm+bounces-44681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D094EA0834D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 00:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 923943A7C00
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 23:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A287F205E13;
	Thu,  9 Jan 2025 23:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6PdrNw+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8A6171658;
	Thu,  9 Jan 2025 23:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736464482; cv=none; b=jTKILshpyKhndiEhTAF+aahFNUcFvYUtA2u2ZyNgoFmBrZH+ANOKHUOcuj6q2V4Sb8Vp/rOC7GCDpB7rcVmNMMC1xAkbtZCWU5OFQaAoi2S9mvuAsO7H+g1M7xQA+4YSQgdjIaQ2Eeko52GCMETU4MqyeRRaEotftZQuLtHdcLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736464482; c=relaxed/simple;
	bh=7RNYoRoouwMMHLrRUrcH49Z1dH1ydp4Nxs2+oz3MYGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lYjeFrIbII5qgUthnbjZjejm0svP4ZwCDFUDcsQBfjwCvR5rB2btyY9VjlQk5NcvmyCxqntSyvVGV3yZR9eIJPR/lHvedSLds8e92tm/RfOF+IpgRm6IIfvKWPf4te8PQCBi7parJVtZnPrHVABoGWG2pjXghytfdzn5l9RWlsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6PdrNw+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72574C4CED2;
	Thu,  9 Jan 2025 23:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736464481;
	bh=7RNYoRoouwMMHLrRUrcH49Z1dH1ydp4Nxs2+oz3MYGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y6PdrNw+8WUUWULRgG7A/7cFVo+4zqbHdTRtAuKiHXcbgMLKpqnO6IjNyV3L39NEz
	 3T6msHfRaADcMz6OoO2N0bHQvWMibmMHArmpSf7OgUo4cQitrdL1oyHYJZTMEa5zbR
	 RNdcqyGnYiZQajAQ6cIxu7aUsxRQ8j/LOmpEz+wMugypBXqdTsr9hUvo846f2UAPSI
	 zKBwE6Yhe7mV1KYlcwpj2w0urcIF1W3arwzPIwh+TuO49Z18ADUctCAl31Y9NEVdV5
	 geNQh7vSg3GH30R3UjxzQaUhXRFKHZGdzPRqPQH9x3Xc7ALdWy9UNFcW+ASFdv0mc7
	 xnI7n0zUh9PVg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: qcom: romulus: Update firmware names
Date: Thu,  9 Jan 2025 17:14:39 -0600
Message-ID: <173646447668.213428.15301324993031009963.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108124500.44011-1-joel@jms.id.au>
References: <20250108124500.44011-1-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 Jan 2025 23:14:59 +1030, Joel Stanley wrote:
> Other x1e machines use _dtbs.elf for these firmwares, which matches the
> filenames shipped by Windows.
> 
> 

Applied, thanks!

[1/1] arm64: qcom: romulus: Update firmware names
      commit: 983833061d9599a534e44fd6d335080d1a0ba985

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

