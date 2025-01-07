Return-Path: <linux-arm-msm+bounces-44179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27351A046A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15A3E166304
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F82B1F63CD;
	Tue,  7 Jan 2025 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjGZj0P6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B1B1F0E3C;
	Tue,  7 Jan 2025 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267953; cv=none; b=E5bwlfNXaWKnw3X6+FRftO7MMEs879w5yS2mTHc3te0uBltJLVECUErib+bN6GjkGkZbfEEQye8FyI//wg9nbVDq7g3NcAVp3nJApAiGmQ/ucAr08z+LRqkYmsFKEIoh9h7owIp2CqnAWDlmuXWl20CE9xrlU9iCulNHTN4xKCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267953; c=relaxed/simple;
	bh=8drSh8ASuP/Z9yOFNzatzPF6o4rizkcAXT2Lpnq5eZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OVuKRYBs/RohXDvNMd1TMabzEa6ryUEfguhliE8rxyALOQOgjBToJgcU+eS74hJNWjLoGnN3rKecwYI14BZlYKozG8Tox7vn9/2wCVnUdqR8Anw7EUpOG2unVJw+ARDgU81/2syI55fZS3ZejM32TnMPDl5jPrBabj0Yz3CSaQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjGZj0P6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0643C4CEDE;
	Tue,  7 Jan 2025 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267952;
	bh=8drSh8ASuP/Z9yOFNzatzPF6o4rizkcAXT2Lpnq5eZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gjGZj0P6R4AzAum+xCNLc1317IBe8pbS0DwUj8djdXWwNRtFalUN1rbqUT5MBdFTn
	 AdjxtLeYYKwmPZ6thCBflMevA/BQPj1R095fPnN3OAlQCzVn1VJ8RVVRDWl4D4tu3g
	 GJQIGD5PgWN+gFkGnbVsQht3Pkw7/BWZTNOhgn29PGP7yAz6NKGf3W99E9lOV/hmtO
	 cM+OfVcVzBw2pAI2KzDbvS4hWiOyjKkdWtQQyHaAqLJvaEX6V+BBHeFiYVAC8DmqPu
	 WDBfPSJQTRD259anVHhj5UEK9uminhMKj0Y4lgySmFcWU54PZH3dr253kTDwxdDduh
	 h94WXS/Nlk8ng==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>
Cc: quic_anshar@quicinc.com,
	quic_tengfan@quicinc.com,
	quic_tingweiz@quicinc.com,
	quic_aiquny@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Add capacity and DPC properties
Date: Tue,  7 Jan 2025 10:38:43 -0600
Message-ID: <173626793413.69400.610730838263089173.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206-qcs8300_dpc-v1-1-af2e8e6d3da9@quicinc.com>
References: <20241206-qcs8300_dpc-v1-1-af2e8e6d3da9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 06 Dec 2024 14:41:13 +0800, Jingyi Wang wrote:
> The "capacity-dmips-mhz" and "dynamic-power-coefficient" are used to
> build Energy Model which in turn is used by EAS to take placement
> decisions. So add it to QCS8300 SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300: Add capacity and DPC properties
      commit: ce4b3c48e4725a28b4e52802fdfb963f176801bc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

