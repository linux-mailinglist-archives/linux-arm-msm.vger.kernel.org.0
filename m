Return-Path: <linux-arm-msm+bounces-51564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8E6A63C54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0A2C188F6A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585211A83E5;
	Mon, 17 Mar 2025 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7RZ1Lj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9231A5BAD;
	Mon, 17 Mar 2025 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180178; cv=none; b=Hbsv5R1aRIgcryu8j9zYFYGZB2B6zaeSENpy4be7Dt1U1SxhgcxlYZW8zv04Wo5EYmTAuGOcaY9l2ovLwos2kWQma8cX7b0C32cm9e2bX34mkPEKDk1UGnjYS35qFXxD5xFWDLlg5g9kXjgcquV/YykKvPZ0HG5rK8da88/NZUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180178; c=relaxed/simple;
	bh=F0mMlGAI2qSUBt8jRV0lWxK++Et3FEEw0l5tqppp3UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rAsbQZwqRAUa98tx6dgIX0tcUck40rCbYk4hXiQ0yQmmLC2Idd8LW09NX4W/xJxc8teBYaxmOyGzbUFoZKW6iqzUoOGaKPMXIPnkCSVrCf1QqMeoWF6ss1NsdCCT+brrn6GwmyVw3tHPK7TEhbaLBGnWlQlTaUCPrTMQxVyjDcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7RZ1Lj2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F69C4CEF0;
	Mon, 17 Mar 2025 02:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180177;
	bh=F0mMlGAI2qSUBt8jRV0lWxK++Et3FEEw0l5tqppp3UU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u7RZ1Lj2+NvubXYZNe4k27aNrlSR5KAvq92MAVSNqeXmDIFubN7KvXXnA5ZfZ2ekZ
	 bqVj+H/SVggTuIcsj8W/5VM4Be1wyA4ESuLasZ7sG4a+uYKjCA5J2s4jaQPJ9UYrwU
	 8eoR5DBiWLOTPv874YFLaV3Lx8+ASuFZ8+6Hpe+yYeqCvATncRsD5yLepy2TpJSs8Z
	 QFZQwBJWi42Omfc+ZgiVqssKhU5Qqdtach5TqSiktLfXVRSYfBwbjIeM3Z275ADizt
	 hwfT9LB3h5uVzq0/fY46j8wM/D09g8PuDvt8d1JuGQpifqlAIAWsIFfDr22GIhm9Nd
	 qbg1z5niGmxVg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Update protected clocks list
Date: Sun, 16 Mar 2025 21:55:57 -0500
Message-ID: <174218015889.1913428.6253597207467825890.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com>
References: <20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Feb 2025 15:43:21 +0530, Taniya Das wrote:
> Certain clocks are not accessible on QCM6490-IDP board,
> thus mark them as protected.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm6490-idp: Update protected clocks list
      commit: d40da533a701ef9e22f89e5ceee1ab48150daa30

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

