Return-Path: <linux-arm-msm+bounces-49368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C33A44A1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE7E2189FD91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7879F20F065;
	Tue, 25 Feb 2025 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbRczQr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F57920E71F;
	Tue, 25 Feb 2025 18:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507516; cv=none; b=EWP0T4vesnq0RYA/JH1Vl1k48Om7Iwx8yMYbql/ztmS4TUhZw7TncI/nlxXPP3I8Uo5D9GXCo+cihlHiXIewj2275tdQuW75jguO7Ttj+VvT3H3Mk+q4RHk8bdjYeBL+TjfJjWMveT8+naueMvITtFVA7hW/6O+5ZY2DfQhYpEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507516; c=relaxed/simple;
	bh=KJXx5Ixc8wyJpXxrPCh+XaFwOxdmHtPmzU3yp1yFCc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OT0DeIWbWHoNL6RGJZvlcmAHL+rzVuf44Z252llqtS02akW+V7kDpCsdFgFr0TeSaqy9pbOJs2Tv1HSg2739QNEVJNd4WnQnk27zOXMsoGxcJ8fYHLhNEu4Pi1/+NPbkPA1Q7u9SzcWULmoNs3IDPZW/O2vToiiyuLITKw3fU9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbRczQr7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB57AC4CEE8;
	Tue, 25 Feb 2025 18:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740507515;
	bh=KJXx5Ixc8wyJpXxrPCh+XaFwOxdmHtPmzU3yp1yFCc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qbRczQr7MUbOvq/N3GcEfDKxx4jDUOGtSQIIoSRINsm6svlG4KMX2HpKCIvo4mxnx
	 e0VZ/jyHifXCMcqlb+4c+e/RZEk15AzKzoLS2uDxPjY0yWA1qJLes1uJ3JFqVjOo5n
	 mFPkqML+1srvhjhkF4C3hMe3/nXZnSkfhbn4vXi1UAamDv2mJMN0Y23xFGvhnjvLgb
	 18Lgrb/Gwqj0EfTXmunz/LcEX/SPfgTukFdUGEWFGEAC3DWNywydTE1s/zbGpmiwls
	 MnP9PolOIBAbzFhQUYAqjmD6tvp+1VZ/OLsoNiygh3oHyogwuv+2zryRUrpSQHrGcY
	 KVHcA730yqh3Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Add uart3 node
Date: Tue, 25 Feb 2025 12:18:12 -0600
Message-ID: <174050748691.199016.6602469360420588343.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20241112124651.215537-1-wojciech.slenska@gmail.com>
References: <20241112124651.215537-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Nov 2024 13:46:49 +0100, Wojciech Slenska wrote:
> Add node to support uart3.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm2290: Add uart3 node
      commit: 44ebb21f6080ec0d6492a01eb3d2a125655fbb51

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

