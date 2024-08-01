Return-Path: <linux-arm-msm+bounces-27645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A3A94419D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 05:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 305231C2229B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 03:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C8213D606;
	Thu,  1 Aug 2024 03:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHqVWmKS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A10813D511;
	Thu,  1 Aug 2024 03:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482394; cv=none; b=ST8K8wd4Wrx9pfxN64jV3ifE1HFxYSkx0rg3RE0GUQzl18utvKH+8ImR1IV9uwLKBZoaZzF7CnZomlXBUHe4iHp0nzOorCV7N6ORSxWRgykFGkRzUouR6N+s4f8XEum94fJzFjm5ZyrouDxyMGVEp78OpBtKxgcVhhMFChF0AxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482394; c=relaxed/simple;
	bh=hq4fbO0nCQySaHAPhslUho5zCLTVTAPlslWr291HDKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W17c+QwoxoJmMzQAvJJzW4jTneixAqhLcxMAGPfjRYZvVFj2h8XEK1sR0pEkyUN2iy7xYd8NQCjSAgLfVD7LsjSavr604MhMobgvB7dj2N7cAzm+BKvsfFqSsrUWox6C1xVOVp9M9qHJ8mddU34WlxYAMvEvYfmF9g/j3zsfjC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHqVWmKS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18F5C4AF0C;
	Thu,  1 Aug 2024 03:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722482394;
	bh=hq4fbO0nCQySaHAPhslUho5zCLTVTAPlslWr291HDKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SHqVWmKSl9pE1TV+5t/34D4SnsqzdPUhVXoG0ScO8o0tVa1dVRjk1d/gjxXugY3+T
	 vRKXmCYUTo2roTXVjOieKNvOSxBdx42UYhVQ+AGnqs5SEhitsIwkg8ufh1tNCkLsu9
	 8OMPKTY1WikNJmfMTQ+sIBm7UJWD8tIeiGvCGAyG8AazMP3ummgYoytr97YKZxzoNL
	 hstTmA5aIL/ZexhDYActmyaO8FGRuDOxf+A6+Yi7SbETEUcGKDWKlj7wLZSOpCHalq
	 J8ym84hpfeLibXinSm9J8s8S/2g4FzLqtQ/5S/4wWehQb+602QsdWIIhbO9LxIUw3Q
	 zTUmoxDzzX/zQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v2 0/7] arm64: dts: qcom: sc8180x: Enable the USB multiport controller
Date: Wed, 31 Jul 2024 22:19:38 -0500
Message-ID: <172248238596.319692.11676986885229900887.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
References: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Jul 2024 20:24:37 -0700, Bjorn Andersson wrote:
> The USB multiport controller found in SC8180X is used to driver the
> camera in the Lenovo Flex 5G, and a couple of additional USB ports on
> the Primus AUX board.
> 

Applied, thanks!

[3/7] arm64: dts: qcom: sc8180x-pmics: Add second PMC8180 GPIO
      commit: c8d8e936bc820eaad0ca725ac0456f4839e50ad3
[4/7] arm64: dts: qcom: sc8180x: Align USB nodes with binding
      commit: 82a40c7b06566bf0ff4fb7fbf29ab7b267c78f03
[5/7] arm64: dts: qcom: sc8180x: Add USB MP controller and phys
      commit: 96aab8ff59a9fca54dd0e13660684b4a8e73e1a3
[6/7] arm64: dts: qcom: sc8180x-primus: Enable the two MP USB ports
      commit: e12953d3b126dbff40a8531b99c377d653f0e27d
[7/7] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Enable USB multiport controller
      commit: c1ece392ed906cc598a7b96234961721060aae05

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

