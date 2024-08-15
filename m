Return-Path: <linux-arm-msm+bounces-28686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD30953BC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 727EF1F25A62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F4315B96F;
	Thu, 15 Aug 2024 20:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+CqiGyR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8854F15B130;
	Thu, 15 Aug 2024 20:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754478; cv=none; b=oPOCEvJYrUSoaZZRwgQzaSZD1QBFmaUad0hjjnYJ0T7iNZ0iN0tJKYc7H18xE1sTsmi0f64xtBaoLGa7ICLzawgv3ysB9duyZ7SkLtBSVZensv4nb7BqxadpmT+mRSTga42ElQuE7JNX4RaSp3geoH0kGaY9Y013/C0bd9gppMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754478; c=relaxed/simple;
	bh=/uOB3F0s8gDZ1e0iid+lQaeOJ2vBwf5jp4894qntvqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s1GMHa0vseXCRlBsPah9UhbgpwYFwE2b8OLIG2j67v8pJtYr6RzV/8etYl16gG51ru/nmUxtRsp0MpJ6Wbj1dpsAWdFd6wCJJD8CphdekKJlU/bKNAnljxxQm7bf3BrXyecmYSuh66jy7uMI11aqglmDnhGTkn1NbB/ZRiS+7eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+CqiGyR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F724C4AF16;
	Thu, 15 Aug 2024 20:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754478;
	bh=/uOB3F0s8gDZ1e0iid+lQaeOJ2vBwf5jp4894qntvqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z+CqiGyRVbTJBe+KnuOSA50iILP31a5UOGG0gbZ1mpchmsB63rYYvx3cBloD0odk5
	 yF+w3RAqFsYvvqndMfnrTOCFZm74TjOdE0Kq6hqeETXMksQfF4NyjhQ3jsfFwNTypC
	 RZfkP8vAdsb0l5dXY7+j4GSqsaH2c7zswvKrzRAMTyCnDbZgqg+u5hozgaZE/UWH9i
	 FY65Sp9tt4z21HnYydbusdiN7HdFZ5yz/bS9U/cO5h6ljMAhaNpzqUf/N+WYUl+x7K
	 1lKG+79jZO5A0F6PigjRI6epIIuSuf+oe/C5mYShb2/tom2TxgvocLudqzQMB18X+/
	 yCXXN24JGjVYw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-gt58: Enable the touchkeys
Date: Thu, 15 Aug 2024 15:40:32 -0500
Message-ID: <172375444829.1011236.10097862784831028118.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240806-msm8916-gt58-tkey-v1-1-8987b06c5921@trvn.ru>
References: <20240806-msm8916-gt58-tkey-v1-1-8987b06c5921@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Aug 2024 20:45:29 +0500, Nikita Travkin wrote:
> The tablet has two capacitive buttons on the scren bezel. Enable them by
> adding the keycodes in the dt.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-samsung-gt58: Enable the touchkeys
      commit: 3e813b5408b7b9b061c2b1733d0089e4fae2e1ba

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

