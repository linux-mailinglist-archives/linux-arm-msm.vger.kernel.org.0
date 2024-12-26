Return-Path: <linux-arm-msm+bounces-43394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 180909FCCCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAD88188329F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E221DC1AB;
	Thu, 26 Dec 2024 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAx9DVSw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CDE1DC198;
	Thu, 26 Dec 2024 18:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237649; cv=none; b=o/vSK8DK3XbFgtZDi1oayx4CsVuJgY/6zzKNtZv7ohbg3aZKrHueWX/xhWyzRHYdLv66sYetBMLZ1ahXf6ImHUO2TDvstR/oddfRh+wS2A9jAv5agS0QNIdKaD4VW+KK7dGwiYqO27yAwMVKZBi5tTRZGiwcIdZvorWNTcksdw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237649; c=relaxed/simple;
	bh=93mqOe0JB42YZvJDC+jXPRbp/QekRho4fXl3FDDBODM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HpN5O7dmN6bCJkrKeFSqPXb8hX0lSQkArSrek0VTsVUjTsNWCjt3mn2FEVMlQRuU2tHrWKlAu/nve8bN74gZsaBCZ/beArwapGUxMW8r1HkQYaSHKxDYzOLBbcjdmfCCQ8qHGgL62BTV2efn8GoTeOmKHGogVOgg/rLkiNSpo90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAx9DVSw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BA5C4CEDE;
	Thu, 26 Dec 2024 18:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237649;
	bh=93mqOe0JB42YZvJDC+jXPRbp/QekRho4fXl3FDDBODM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LAx9DVSwNbfNaCgKDp4s13vW/9JlRmRRG5ky9fETSn/U/j5Ns1DSUyVr2pb6/tjq4
	 J2+mvYIVaJWKHRez0VePkPwD/FSqg1IZmgrW+sZyrmZbWU5bikdYjKN3vorC7bOpu8
	 Lge56knJq9KI56M8eMHEavtKJd4KbN1Xlkmf9uk0RZQjkI0R2nEAsY2v8vTCXhSuGT
	 gmD4+YOOw+s5xQ0TmGffa3zMe0nlSQb4MLUQL3L0vsq9F3puBs6lZI1YrPJ7nGXYUS
	 YxxjaN5ipTbxHe2I+m+gq2zRhVWR3iGsLdTUEY9EQ/ECqD504qqreSZTTgKVeHIhsy
	 cwr9w6gOeyzBA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jianhua Lu <lujianhua000@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add qca6390-pmu node
Date: Thu, 26 Dec 2024 12:26:47 -0600
Message-ID: <173523761395.1412574.10662186854294667989.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241201135716.141691-1-lujianhua000@gmail.com>
References: <20241201135716.141691-1-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 01 Dec 2024 21:57:14 +0800, Jianhua Lu wrote:
> Add qca6390-pmu node, which is used to manage power supply sequence for wifi and
> bluetooth on sm8250 soc based devices.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add qca6390-pmu node
      commit: 6e4ec5f6940d8ae38ffe23c7f2f7da9de57d0cc1
[2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
      commit: 1993f0255347c98b133d90e4150a4ce5f32646c4
[3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add bluetooth node
      commit: 8b14c0648673439fb736b68096804314b934653b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

