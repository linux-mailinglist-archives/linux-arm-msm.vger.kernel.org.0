Return-Path: <linux-arm-msm+bounces-61657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 116F2ADE207
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 06:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B01151794CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CF91EE7B9;
	Wed, 18 Jun 2025 04:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfBRSPEV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714C51EB1AF;
	Wed, 18 Jun 2025 04:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219772; cv=none; b=bBtazPlkLuTrsecjjIdgmSK4ZUAbP8tS9XyaASE6sAcM/36Ql3MgkfO6anGrBqwrR2ZgcqpT/BgQkKkrkcw/+VvpGrnUH5ht83+MmuGopBOFCLQdbmYgZLltlZzwRe6cMVAhzbUlcV1dvZauVCBA6UPNtPz3mKUF3PGvP6Q3vTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219772; c=relaxed/simple;
	bh=Pjw6Dm2zPR9KJTwrs7qZIwnMcij6/krhnEKtQLK/5Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tYKuKj50y2i/niblnZOoA49KRtmzC48qnCg1Hqyl3B9DbEfokRIW3RQxlzog4Fv//p7kMPdLhGjQVf0ascTDHvP5L8VPASw01HE3v24VIRLjA6JYUboUn0PjBk6Tq3iuSaGUgAWdftd5T/iXAgvW5x5us166TE/G5Ix4RxuHd4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfBRSPEV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEC8C4CEE7;
	Wed, 18 Jun 2025 04:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219772;
	bh=Pjw6Dm2zPR9KJTwrs7qZIwnMcij6/krhnEKtQLK/5Sk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZfBRSPEVDk/IdoN54Fo7vD7f5r3uOuVlOBwMryrFYAcCVeBvZWzjLxEEdk7M4Lqko
	 sV4//Ro/GSDvLTuZCPB7eKLJ8+CXw1DoNQw8zMqAOIP2mZPwXkg68dYTFRN1RJ91rS
	 G+mtNo/6mndrPBHYiI+FmbMxqe//7u6PJGLWhQl4N2Q5lF3wwTV7yw8u3of/ADrF9b
	 oQTzSmhIWOGn0GQU6qMLZ8yILxcmDgnYVaZBudJsPDDa5kE+jO+uIZHytl5tNgUaIN
	 uYa4EPVoND1C6tnl9WZUt3jG5bdE/A91PMrOqgVMcs2xQQX9uQ7dE4UDGSrRVbhp5A
	 NJWVr8i5Bp0Yw==
From: Bjorn Andersson <andersson@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org
Subject: Re: (subset) [PATCH v3 0/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add WiFi/BT pwrseq
Date: Tue, 17 Jun 2025 23:09:16 -0500
Message-ID: <175021976630.732077.9578676163556374821.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331204610.526672-1-alex.vinarskis@gmail.com>
References: <20250331204610.526672-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 31 Mar 2025 21:43:43 +0100, Aleksandrs Vinarskis wrote:
> Add bluetooth to mentioned device.
> 
> Changes to V2:
> * Fixed commit message misunderstanding
> * Picked Bryan's R-by
> * Picked Laurentiu's T-by
> * Link to v2: https://lore.kernel.org/all/20250331073423.3184322-1-alex.vinarskis@gmail.com/
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add WiFi/BT pwrseq
      commit: 642b55ce06c923a52cf52f94a2508c7a20b02536

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

