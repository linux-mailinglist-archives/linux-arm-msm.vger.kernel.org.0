Return-Path: <linux-arm-msm+bounces-87494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05624CF4215
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C8FC3018CA3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE42433C198;
	Mon,  5 Jan 2026 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXMSFs+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F91E277C9A;
	Mon,  5 Jan 2026 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622123; cv=none; b=r/sG7b+R/f2ttwZZsGGTyhoVta+wvntvdCu/I5xaFzFmi2fAHegI5cxwotJLzzit/NTPu3INvCMCdEG/7OtB7+qVp4Y/tgOmT/a2hn0OgdRR5AYHr5Kq/0sTHdMaff38sNfsZuftASM2Vbo0BUEotmAcikf1L0YefAbE+0RtPyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622123; c=relaxed/simple;
	bh=inRMPpvRg9GgLohYKESF7uoo/L1yGUB2AXPVoDf4dvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SVCRXFswusAqvZhDYdFn6vyZ2tPsM6a6iJ1gWqYYWrxdfx62FmIGL2aIU/5U057I5yKRqeRYLK1Br0ZWWYzPEE8hzquoiIc7grN6yU0ghp/IO/6enIAOcRSGArL+7gBqvs2x4wrqgYtBwppwZmQc8aujWHsLZsSWJWX0L17hIrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXMSFs+q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B408C4AF0D;
	Mon,  5 Jan 2026 14:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622122;
	bh=inRMPpvRg9GgLohYKESF7uoo/L1yGUB2AXPVoDf4dvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AXMSFs+qTDUfoYXPFnoBdz2bapqlfHgrJZXbwAQpxst4hH3ewL2EnxJgweMZCigNF
	 r026KmcubaMm1zSBtW86XwB0DTFiWN2rdWa8xTVdFkrISnVFMFyMWoGx0M3PlVZyZB
	 f2t6ETS2v7ioxNSIFLjFgwr2iCyn9AZJIOJwlB2NS8OIHSzkd89CCdv+uSkHR9aRDW
	 6PwaiUbWnOms6Yt6j8Spus+itoricPsoXQy0YkQICdCeB7wsglsvlRZUbtR5tyzg2M
	 rAh3dnyb+KAPMVHvA6Ad0xo+VIJBdFQ50Qru8smUffhmDh2OYDqDWOlMcD+c8Dw92E
	 R5VQSV+twBLSA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingguo Cheng <tingguoc@hu-tingguoc-lv.qualcomm.com>
Cc: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
	kernel@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: enable pwm rg leds
Date: Mon,  5 Jan 2026 08:07:41 -0600
Message-ID: <176762206414.2923194.3519328517461927165.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251114-add-rgb-led-for-hamoa-iot-evk-v3-1-5df1fcd68374@oss.qualcomm.com>
References: <20251114-add-rgb-led-for-hamoa-iot-evk-v3-1-5df1fcd68374@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Nov 2025 00:13:03 -0800, Tingguo Cheng wrote:
> Add RED and GREEN LED channels for the RGB device connected to PMC8380C
> PWM-LED pins. Omit BLUE channel to match default hardware setup where
> it's tied to EDL indicator.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa-iot-evk: enable pwm rg leds
      commit: e50c63e89236beb249507f986c3458b2b670cfd6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

