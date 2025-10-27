Return-Path: <linux-arm-msm+bounces-79038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80820C11C7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A791540272B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EA933A001;
	Mon, 27 Oct 2025 22:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFdNhC0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B56339B46;
	Mon, 27 Oct 2025 22:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604508; cv=none; b=joEWoK9r1+n/KgXc2x3zrHyK7VzR6QJudCPAO2LrwmsOsdma4Dx05G0cuhddpGeq0+PbjF8793NHLWm3actwDqCWpH8Q4/WtiM6P8cdvcqccB0oc3ArpA5urHL66dVqfnDBUCOB/k6nUq2PzyD97Q7G7U2Dcm0Qn9qDsoKE9PVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604508; c=relaxed/simple;
	bh=gsNHcJ7VN6oAV3xRgiAXFQ3/S1HydNGwNn115nKFwyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HRbfJjMSWJFBLlfQrCuvyh5k/SNRT5QoLJTmGrrYz1M0CYYyzgGm71nPRPy7Lwx3q58Qz5YKKGuZJc53ZJgYzs2K2fcOn9TlMWDLkngkvVfFltJ1RGilA7sMOSZKae9G6DTTCTamJMJq9w6f1/UtGmpe/QSDXsy8YMmYN/0wMM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFdNhC0g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63444C4CEFB;
	Mon, 27 Oct 2025 22:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604507;
	bh=gsNHcJ7VN6oAV3xRgiAXFQ3/S1HydNGwNn115nKFwyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JFdNhC0gkRP+u3yfaEsfB39KHVeicwQhIvCRWaF5nGf2BYVH5Sjmrl1nZbWYlui91
	 Pp4X90NK7cTJzOZqh0+pslA9wb8ZVncYVRug9ML1Nwhwp8WXYDXK9ghMnuBGFhHZX2
	 4d1sWCe/j3WZo/h9rASI9a638ownovZvukgjbWz5Rd7VedVk/hjgsNV9HGsHywnLRB
	 v48R/wdwEfhcQ1rnJz/GuclUaR9AwyLJJtyDYCBgOd5fDaF8ScC3ujnKRoQ2Lv+QPy
	 i8PdgRLeqzWTU0JwP83BX158VQDAhrPgMCZliQGv6oQ8K+ECkzswtAcJul+E4w6LNt
	 p5otkoMCFjlZw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Align ethernet interconnect-names with schema
Date: Mon, 27 Oct 2025 17:37:00 -0500
Message-ID: <176160465239.73268.17415746022880138058.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020-topic-lemans_eth_dt-v1-1-25f4532addb2@oss.qualcomm.com>
References: <20251020-topic-lemans_eth_dt-v1-1-25f4532addb2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Oct 2025 10:31:22 +0200, Konrad Dybcio wrote:
> Reshuffle the entries to match the expected order.
> 
> Fixes the following warnings:
> 
> (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
> (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: lemans: Align ethernet interconnect-names with schema
      commit: 4b6e99e4889bee6e34b9bad16d225fa66a8c453f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

