Return-Path: <linux-arm-msm+bounces-51492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8601A61BB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51AC2882EE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD1221420E;
	Fri, 14 Mar 2025 20:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCEPLuJR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B13214201;
	Fri, 14 Mar 2025 20:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982513; cv=none; b=hL0u1sgGFh7Ei/iqz/kYv5n8TYxzh1mRFY97OmbS5ieYrpfUF5V1TXKdn+LYDwE54ZgLv10CumZhJD9F5pPW+Jsg5UiFnuyi0iEzxnJJfELGLz/Ofq/stbX4RCQmJfagU7erGugYqQV7o+TIsFzPQaue/pZeCK01PXa+w/Gt/24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982513; c=relaxed/simple;
	bh=YAwJ6XeAEieSW5NGnzpw0gwkoI2rrP1+hxDhpfursZw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JK4aCkWSz+4yVilxePfduM/dzsJtw7iCGxfZovtvJa91RZlxOKhKd6Ftxg+GfO5gnwb05qnAIf2Cih15hfK9mzrufMLCn/iSrzDVbQcTDlfYeg9w7OOR6jDMsRtiyUhHugi+Ev4ZdMjFa4WWdAI0vfcAr947nPXNmwjmMJmejfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCEPLuJR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B0AC4CEED;
	Fri, 14 Mar 2025 20:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982513;
	bh=YAwJ6XeAEieSW5NGnzpw0gwkoI2rrP1+hxDhpfursZw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VCEPLuJRPn90dJ9feoCEOqAITN3S2/glutrdMNmqh9uY8lMdF5MQ8CL7xrsJ+gfZ/
	 JKjfk+CWsORElE+9nHldCtrAT1/xze5OREgckme42f6p/TBYLqy3ubuNlr5sBOcehv
	 /XNIKwKnGI7XuzzafxxK1nNOS6l8EkN+pRR2BpNaozfptl9vPFGHSBscCgnK9pe+Um
	 y10ePMs7PhrguD5PxYGiXneCQdrTe3yyXMyHXD3TOAgh/61/SynUo5eGZITMDaZUXa
	 VvH/ClloQ/CLvB4dlDP2JPETmae7wtNT8h3Joq5pSSaG6JHE/2hUTSlcdWH5+jM8JR
	 tzTa5ygVpPMug==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Md Sadre Alam <quic_mdalam@quicinc.com>
Subject: Re: [PATCH v2 0/3] Add SPI nand support in IPQ9574
Date: Fri, 14 Mar 2025 15:01:06 -0500
Message-ID: <174198247889.1604753.2520666435876015305.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306113357.126602-1-quic_mdalam@quicinc.com>
References: <20250306113357.126602-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Mar 2025 17:03:54 +0530, Md Sadre Alam wrote:
> v2:
>  * Added Reviewed-by tag
>  * Added new line befroe "status = okay" in qpic_nand node
>  * Added "qcom,bam-v1.7.4" compatible in qpic_bam node
>  * sorted qpic_nand and qpic_bam entry in dt
> 
> v1:
>  * This was a part of 'Add QPIC SPI NAND driver' - [1]. Have split it out
>    into a separate series based on the community feedback [2].
>  * Additionally, address comments. Please see individual patches for
>    details
>  * The 'dt' and 'dtsi' portions of 'arm64: dts: qcom: ipq9574: Add SPI
>    nand support' are split and posted as separate patches in this series.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: ipq9574: Add SPI nand support
      commit: 2eabf101f62a158fb66c2ff4a80ccd1581606568
[2/3] arm64: dts: qcom: ipq9574: Enable SPI NAND for ipq9574
      commit: 2f24e13c8f090344482fbff4911240eb3c1d9092
[3/3] arm64: dts: qcom: ipq9574: Remove eMMC node
      commit: 8140d10568a806864c915613ac03afb98ccd349c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

