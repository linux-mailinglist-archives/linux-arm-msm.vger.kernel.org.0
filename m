Return-Path: <linux-arm-msm+bounces-80180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F70EC2EE46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 02:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B52163B7E71
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 01:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1F423EA89;
	Tue,  4 Nov 2025 01:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2TXhMk4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0357223E23C;
	Tue,  4 Nov 2025 01:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762221290; cv=none; b=XNpLNUHxHpNelZBRWJBLdStk+RzWBe+ZEyrZhv8vty3h6XogN2fgrF++arVsOHn/KJyTObjG8AeZdYpozo7dh8S+bcy57a58QjXitqASBC2Y/uiqZmI4DkbV/JLkEaJknzmh/YkcbPAGcepJ1oWO91B6q4zgKdUyUwPrMpntdoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762221290; c=relaxed/simple;
	bh=8FIBRaWo2y3qLnQKSIxXDNvqE2Ltb2MI0B+CQ3lAMOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZL+qV4PeBsrvnlIcC54tV4D+vBhdNXcyWMPawS/u71HlMMfSyz5Geff03/eErKfReK2G8MWz7O83/FzqI806SAk02eYZVILe0vhGnSpDZM3IvT2UVDsvAKIE8YspA1J/Sni5mdmGrPUbsrppxEOWOStVdSTfBuTpoPM+RFHnVNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2TXhMk4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F8FC19421;
	Tue,  4 Nov 2025 01:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762221289;
	bh=8FIBRaWo2y3qLnQKSIxXDNvqE2Ltb2MI0B+CQ3lAMOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C2TXhMk46qojaU7uRGh7Telw8cTNkIYOY2z3uhPcCM2DnB9k5Cy1iLFtq80SPkEpP
	 0MbQb23T1t6BkcYV38l9hZjHoDmCb/IIR1Vzzf4hocB4TXVMbL3xZ7mH+Hd9zuyTb9
	 Hz8Jv5XWAtsVjpqmV0TRxmCb1c+xVbWV1v4r9QG1NOe1wYTrRMyqGFM0sxczosVZTB
	 VpwCe4iyjJtprZXr1s+dUd1kYiEnYfik7jszg4QRrF+7OEQmnX0ZtnARKO5SV0Mtwq
	 j113c2L0xoEuCZYuuxin3Ma7LayXjiXGHmaxcjdj+00XReB4cwP6sHsREmAV1NfPso
	 HW8kxJuLSJatg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add Qualcomm QCS6490 SoC to socinfo
Date: Mon,  3 Nov 2025 19:58:15 -0600
Message-ID: <176222149539.1132260.15372306128869633795.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103-qcs6490_soc_id-v1-0-c139dd1e32c8@oss.qualcomm.com>
References: <20251103-qcs6490_soc_id-v1-0-c139dd1e32c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Nov 2025 16:53:09 +0530, Komal Bajaj wrote:
> Add SoC ID for QCS6490 to socinfo.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: Add SoC ID for QCS6490
      commit: 98c92de40f6ab05452f8919cc2ff800ade5dd9a3
[2/2] soc: qcom: socinfo: Add SoC ID for QCS6490
      commit: 40360803622c180747096aa2f165a02fef3628a5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

