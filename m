Return-Path: <linux-arm-msm+bounces-89304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A79D2ABF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 04:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45EBC300B36E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 03:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F513431F5;
	Fri, 16 Jan 2026 03:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giYEMuhu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442D729A1;
	Fri, 16 Jan 2026 03:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768534186; cv=none; b=S6dpLkZjfFhMVicQ5Z30Qjene0lVra2pYD+ZaeAmgHk80gjq+VvitoMahtPxetbwnvmRwLIbRBlWjymSHnTbKl+FXi7NaJmORsukKacgYycfWK/5bTTEaJFD/nbkdC/Sza+Wc+rnD+MsE3RM/WVahwZmx2UGqDx+ZbvoyjyiEOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768534186; c=relaxed/simple;
	bh=4dA1HwbtooHbxCCBYUMCVZeLwwqYEoSUTEHkOTzXLcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qLaip8aTWJ9aljGF9NqIz5FbuzsqXRFgPnyJ3B8zgtW1XKMDSpWeEqXmFCfRBtR7xAlYRXVfRQ8jndqo1X0Usvf4S2oxRdEb2K540tmf0RLK4TagQDjbfYNvhL3kHP7vSFCyOUtIEL7Vq639jHjc16fekhbbnTCg2+iI4LFWTUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=giYEMuhu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855B8C116D0;
	Fri, 16 Jan 2026 03:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768534185;
	bh=4dA1HwbtooHbxCCBYUMCVZeLwwqYEoSUTEHkOTzXLcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=giYEMuhuofNhVlWRY2ftZfuFBeK60CFoTKlm6Z8qJ5SJn9PKo14nB5YzIoFxd7lGz
	 LmFheYQkBV/rTphRUqdjJPPItd7iStwQXftUTxFXkgdCDckCOsUo5qcMtghwi7shN/
	 5MKQ4+s4AdEKUqO/dV4KhVQVg3P0iBEeYaekUw3F1PkWsjrhejECE8kadf8vrDPu8l
	 hsmPYMoX3L7LfN9HeX7iiSdQK6qar8FxF+n0rBeSpqz6Ih3KKtf0vk3P5AV8PG0xBB
	 DYsKv7v4PIzRr679AGsiidCxIHeDujZ2pSt59DdZ30yNXLcwyixojSsyWjoAceWA4A
	 LWHatAJrywzRw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v10 00/14] Peripheral Image Loader support for Qualcomm SoCs running Linux host at EL2
Date: Thu, 15 Jan 2026 21:29:42 -0600
Message-ID: <176853407255.304792.18323741500490233525.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
References: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 05 Jan 2026 18:52:48 +0530, Mukesh Ojha wrote:
> In May 2025, we discussed the challenges at Linaro Connect 2025 [1]
> related to Secure PAS remoteproc enablement when Linux is running at EL2
> for Qualcomm SoCs.
> 
> [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> 
> Below, is the summary of the discussion.
> 
> [...]

Applied, thanks!

Not sure why b4 doesn't notice that I picked up the other 13 patches as well.

[14/14] arm64: dts: qcom: Add EL2 overlay for Lemans
        commit: d27267558fd25acb07d7ff28a7ff44eacf799eaf


That said, overall, this adds another 10 DTB validation warnings, because the
PMU and Bluetooth nodes are lacking supplies. I applied this, as it's
"unrelated", but please have the team prioritize fixing this!

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

