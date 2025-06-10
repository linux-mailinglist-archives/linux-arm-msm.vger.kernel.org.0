Return-Path: <linux-arm-msm+bounces-60856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81888AD4121
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9158917A14E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622CA24678F;
	Tue, 10 Jun 2025 17:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dijdZ0zw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B46248886;
	Tue, 10 Jun 2025 17:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749577444; cv=none; b=oAHfEyiKwkZJmwNZR8T/K5cmv55lD/gCyw+HYDoI87r8iRT4zV9f1WILGWEgqiPApl0zAO6d6ptTnTq0Sa9JUGg9Ld0qsY5F4Q/p60kUGUQgC94NgzXEo7/l9kYOVXx6IFarY0zmhujoldCEHL7XrYgWSTAxV2LVSZWCVK8Wdcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749577444; c=relaxed/simple;
	bh=skPNfg0DKB9z0ZwfOj12n+c6qOYgaKHTZQzSHQd4rIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/AZuaSXXZDOk0CKyChMRAEQTach0ucQIlniRiD0jx3bSEefdD/OocsQkp32NTp+7iliQ/qkeuvkdcNNCK/NZCM26ObDjlvNCQKWi8sA071ObEzmSDBDZTVNB7/H+OWfDjjzFvWzg76r0bHUI2FwGScHsKRCh3e8OLBfHkT5vls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dijdZ0zw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273F5C4CEED;
	Tue, 10 Jun 2025 17:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749577444;
	bh=skPNfg0DKB9z0ZwfOj12n+c6qOYgaKHTZQzSHQd4rIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dijdZ0zw51d//wja66zq/Xw+7JSc1B3vMXGscJCNJNhtOflhmEyJq15u5JonjSC78
	 leWf3QeWKcqWeDwCxwNVGzwc7e3o/YQyC9kQVMPqjs9SBtQ86d36BLnUzT2cdjZ+BO
	 PWr2Qt8gLj0SEHZiAnJhn/thtYtntW5ec3v3lBxd+Pyr0KN50xucXd6W9qnYW4JQrK
	 4pVb19xAnUCP3Er1PtejFyUAsUL/4ER0F8nb7hQz++J9DpuJpIIAdKj07fzodBXD2z
	 yEgVz4d7vvClzWIbBTC1mtboIHq5ML+c/i8QL+FrJ3q7OJVLJGZI9UeXagXyDSipFC
	 qzKh6DMfITNsw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable fingerprint sensor
Date: Tue, 10 Jun 2025 12:43:56 -0500
Message-ID: <174957743671.435769.5400799228514556433.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605-xps13-fingerprint-v2-1-eebf84c172f2@oss.qualcomm.com>
References: <20250605-xps13-fingerprint-v2-1-eebf84c172f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Jun 2025 18:39:15 -0500, Bjorn Andersson wrote:
> The fingerprint sensor, hidden in the power button, is connected to one
> of the USB multiport ports; while the other port is unused.
> 
> Describe the USB controller, the four phys and the repeater involved to
> make the fingerprint sensor operational.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable fingerprint sensor
      commit: 8a2bd44062347f56ee09a645eb24b47c45457909

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

