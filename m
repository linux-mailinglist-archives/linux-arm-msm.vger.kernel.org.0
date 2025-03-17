Return-Path: <linux-arm-msm+bounces-51562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D73A63C4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A64CD169054
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B10C1A314A;
	Mon, 17 Mar 2025 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGHIKYqn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E366C1A2C25;
	Mon, 17 Mar 2025 02:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180177; cv=none; b=Hjg0CBDV5DxAQI+zOpGEfCDDTAa1ETEgChk2VVTIQ1avfZ0Ql7TGxGi2iLGJ3Tpl5pe3AxuO0pfPvXpGprbVWWqzGLDO1FlWBjQTW8eNCPD5lMdnl5P//src5iHIeviJARJ7xOaLTyijm1BS5Z8Ki7dVvkThr7vi75GvT/6EaAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180177; c=relaxed/simple;
	bh=OOsU5i6gcTF9Q4Do+48694vFL5yFwYLv88l4gt6MMsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n6P2rXyR+yuyxWV3zJS6mUWGacxPvbLx7F4QGeLvSf/oiTexTx8124yHOc3PcYP3uPIDx7dOlCQKMlwiLhZ6Gs7K7v1FphFysfv2i3Exk3b93CJxmvE8thxinGQ//z1gg43VgQ4f7uKpgtIHxeD7tG8s/UkXvdSDcln5hTiL70M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGHIKYqn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C97AC4CEDD;
	Mon, 17 Mar 2025 02:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180174;
	bh=OOsU5i6gcTF9Q4Do+48694vFL5yFwYLv88l4gt6MMsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KGHIKYqnU75vuZlMHzoDxOpCnr+97ITOwLubDyhqthOQWEiJ54Il/sfQl+AMNWloF
	 Ll3e4VdN8Dl/Fj6vGgNM5evpp9cskae1PDxGli4dYNBtAgs8KfQMhguysV5D7ooXC9
	 biVYu7eCDil7KD7omFKBee33VrXo546DuVfRZbEt2clBfzYWp5kjS3ESQRMqrIokwY
	 iDYR0h4P2Fp7Ai1hByaOlvjTYsk7XqhGWd+AM+GeKiFbiSaVKQ8KLrK88wmZkQOoMm
	 GfL70MSZhlBUJkjNtjQg6lO5UwzpYmSQLyaGMnkP3JDDwkkdhEX0YNmK4r48dil1tt
	 qGz8hyx5ucNTQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add LMH interrupts for cpufreq_hw node
Date: Sun, 16 Mar 2025 21:55:54 -0500
Message-ID: <174218015898.1913428.9599724042850830500.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117-sa8775p-lmh-interrupts-v1-1-bae549f0bfe8@quicinc.com>
References: <20250117-sa8775p-lmh-interrupts-v1-1-bae549f0bfe8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Jan 2025 16:35:54 +0530, Jagadeesh Kona wrote:
> Add LMH interrupts for cpufreq_hw node to indicate if there is any
> thermal throttle.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: Add LMH interrupts for cpufreq_hw node
      commit: cc13a858a79d8c5798a99e8cde677ea36272a5a0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

