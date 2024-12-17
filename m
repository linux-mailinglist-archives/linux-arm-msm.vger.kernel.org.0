Return-Path: <linux-arm-msm+bounces-42577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FE19F5142
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 17:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0CCD165CFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 16:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7BA1F8918;
	Tue, 17 Dec 2024 16:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="thL9zEd/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D456614A0B9;
	Tue, 17 Dec 2024 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734453543; cv=none; b=bdnX/OFR0dSR1y+XeKKsntGDNWrXeBk4Lu35hx4YLnHhinQ7mayEgfb5py12/mJBCoz6D2aU7PSAOPY5JnL8iJG4AXGXyA/3IrT1zmqFkOl3YcGBPSacdHGS/XB+JRtld8UO0qp58y8yM1PMqdT/6BIQCDVsEH+V7/Hvbyk7PjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734453543; c=relaxed/simple;
	bh=ngcVe0U6Ws143zJJ7L2/bPbD19hx+VrgJhnrIbe6sBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S6GnjVqPfxnvZ+d2FYHrNhg6y7wW7cWmL7L2knOuq1Zmrw6Sbl4Vj6s+isMoWz9nivseqlCgpfu4dyy6ciNB7KKfLvMm40SxcTa6JLWB7BDm57i0te8u+rnoyAq+DiG7aLmU6eQN+7NW5TLDwve6NtQWpDR5hP/oTO+4JP9BrqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=thL9zEd/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F90C4CEE7;
	Tue, 17 Dec 2024 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734453543;
	bh=ngcVe0U6Ws143zJJ7L2/bPbD19hx+VrgJhnrIbe6sBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=thL9zEd/Tg15+0A6qhqzRu5x4o3UgUKgT+8ny5NpGCAgBEMn+FN/yzHZdJcqWZna1
	 W7ZUIgBrIVUzWwy2q1RtwsV0dYmMBJpFgW9Sv8s2DbYwbIABCkoiBGd1cVeWMQoYPJ
	 NfTA1ERpwWDX/bI4qYjbnIZ9FfPNeej8LomIB1AHTjyZLMKsN4SjSnlMRBWyaxX9Rq
	 rL3KNQDWq1ABSNh5bikxwyQEu6zGkiJfPFainyCptzAos0movMcRQe1FucjOTdNlqH
	 zc8VskEZH1gcy1K318uNONDP+N+vz0ZnNS393uaqtA5CHg9ivWHmEqbVP2GN/kT2Vn
	 27tucpH7xg02g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	"Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360 separately
Date: Tue, 17 Dec 2024 10:38:55 -0600
Message-ID: <173445353300.470882.18010649806339301141.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210-x1e80100-disable-smb2360-v2-1-2449be2eca29@linaro.org>
References: <20241210-x1e80100-disable-smb2360-v2-1-2449be2eca29@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Dec 2024 09:36:01 +0100, Stephan Gerhold wrote:
> At the moment, x1e80100-pmics.dtsi enables two of the SMB2360 PMICs by
> default and leaves the other two disabled. The third one was originally
> also enabled by default, but then disabled in commit a237b8da413c ("arm64:
> dts: qcom: x1e80100: Disable SMB2360_2 by default"). This is inconsistent
> and confusing. Some laptops will even need SMB2360_1 disabled by default if
> they just have a single USB-C port.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360 separately
      commit: d37e2646c8a5cb8acaebd03f4ae33a1bc0d24991

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

