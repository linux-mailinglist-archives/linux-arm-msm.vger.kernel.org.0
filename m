Return-Path: <linux-arm-msm+bounces-68556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1407EB214AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35CA83E45BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB402E5B11;
	Mon, 11 Aug 2025 18:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m66Hl3Fu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319C82E5B0C;
	Mon, 11 Aug 2025 18:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937683; cv=none; b=ucPmCLPJMPIHzpdhKKMkjRy9XOUsieP5atkiSVvo1Bj8lIU/SpUyhcGdvLMLMkS4EnjXx4GCFUH1Ok1WpWCR+0CZ8lA34enVWw90xMs6piLSs336uoCmMDaZqAry2jMdIA6aUnv9sRCqmURkJJZvzE0k7A24wTqpOGFIFYEAlOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937683; c=relaxed/simple;
	bh=GEn7wYSJ8QPZM6/NRVy/VEuhEHI2ARJZUVO5Wbt3JHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JSwzAiyIxNnf7ypWTAAggF2W1AZ0OPOI+uCitdxZbc8LT8eniQo/NeCSpWRjhil2EkN3LYhS0BReUfPIROhyKy34j0TlSWRHxWMk8wzxLXt43FO/3R4/+IrZfo8B9i6ab3op9Ja2ZdMPrfWYrBW6JLFoS+J8G7c2GO+LPM761RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m66Hl3Fu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1967DC4CEF8;
	Mon, 11 Aug 2025 18:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937682;
	bh=GEn7wYSJ8QPZM6/NRVy/VEuhEHI2ARJZUVO5Wbt3JHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m66Hl3FucW+CVLnF8/sRXq2mhfEP8Xuuu/TaDkO74hW8SKlfWxEy/b2WmujzJQwRM
	 cTPYVMOGY+RNGgwTtstadK8Hn/2FB8y5OvLVAiJpgSF57U/NoAkp+4Gma4SWrRfMhw
	 8tek6xrwTBD6TToqaLmEyGGh4+TK79UQEJTDqo3GVswOjlDhx6iV4NhOtLZ7EWLYup
	 IU6KSctzIsPNW6TvwdWypI8AtzHTHZoErJfz8nqIARXP/HQe1AalUrvtgiF7qVDWLx
	 MmwCLSKEEqEID6iowDxgdVvgB3Ia/d3nF3hcDgrsCnN+F+4Z5DPGwqr1Tyw7Q1ZnyS
	 17xvyAI26SlKg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Add rpmh-stats node
Date: Mon, 11 Aug 2025 13:41:01 -0500
Message-ID: <175493766095.138281.496052462562156095.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250801-sm6350-rpmh-stats-v1-1-f1fb649d1095@fairphone.com>
References: <20250801-sm6350-rpmh-stats-v1-1-f1fb649d1095@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 01 Aug 2025 15:40:59 +0200, Luca Weiss wrote:
> The qcom_stats driver allows querying sleep stats from various
> remoteprocs. Add a node to enable it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6350: Add rpmh-stats node
      commit: 9af6151b00528b0a7298aa3addb122600e514b1b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

