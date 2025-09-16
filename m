Return-Path: <linux-arm-msm+bounces-73773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C1EB59E92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 18:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3F1358036B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025FB313D42;
	Tue, 16 Sep 2025 16:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBXPQiFb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09AB2F5A3F;
	Tue, 16 Sep 2025 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041909; cv=none; b=bibIauRcrzPXF9SJPCRo2HZSmOQ1BZMCSp82P+8NSBpReD3oMiJmF9DjtOk2/crt0LqQHRt84nbJDHcZwel0sQ58lquQmIMoPjuXI2CLdd2jjYerO8n1G/vlpGVwqN8gh3Vywbf5qX4Uohfmq2c92VWXxaCHRuNIaDvFgLnDRV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041909; c=relaxed/simple;
	bh=WP0uiEmAqg9IllmwJSJMlOyy+20xYAlbwM76qzTXtMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vEAq9zslGGH3sGciYVwLIMB5FHxzjD2Q0Dyijd1sDzZpD2seg+I9ZkwKNJcrwLPbQSSsN+i9K2Os7xH/3zDMwgPCr8kGtxV6WYCKZ2ltq+g7COOLfqlchXbhKdL4gmI3KiWZae2Ew8VlFmNG2zCeb6D/WtU6EXgfYNa5rhBtNhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBXPQiFb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B8BC4CEEB;
	Tue, 16 Sep 2025 16:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041909;
	bh=WP0uiEmAqg9IllmwJSJMlOyy+20xYAlbwM76qzTXtMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MBXPQiFbVHXfrvzmXJjGWO/VcLs731PNU+c2b7v1BlcV8a5aYPtB97smea+qa3Rt3
	 KnnlsW0gofTjtwj8ZqudbRX9XE5HIxMRCaIPGEHKXwonjq5F78BP/0wJZFMOtmL45L
	 LIY/hQ2HpWKsYRzjVqwWIAOjqGcDUtpm7V5tsinjteloqPzGUR6r7AFcgupTIZcbzc
	 XBNmAEmr9hS2XDrrFZIQDNYEakRlSCSeVg1YHw0eF94Yy1XVMHGUJ/rqKtgqMGAk86
	 P0VFtURc8xo6j1Ykxm+iK+rAqTJxZvhlGS6FGHi12LtBMth6zZi8IKZLPfjgzT6HLi
	 Mlq/NUCrHy+4g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Flatten usb controller nodes
Date: Tue, 16 Sep 2025 11:58:13 -0500
Message-ID: <175804189851.3983789.872103790994368896.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250913182318.3547789-1-krishna.kurapati@oss.qualcomm.com>
References: <20250913182318.3547789-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 13 Sep 2025 23:53:18 +0530, Krishna Kurapati wrote:
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach. Enumeration of ADB has been tested on EVK
> Platform.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300: Flatten usb controller nodes
      commit: ed32443efe2c044bad53309670e5b58473a620d1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

