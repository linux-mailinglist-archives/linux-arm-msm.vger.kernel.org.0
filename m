Return-Path: <linux-arm-msm+bounces-68554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58886B214A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39AFF1A2341B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5FA2E5437;
	Mon, 11 Aug 2025 18:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBDMQnpw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9A2E542D;
	Mon, 11 Aug 2025 18:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937681; cv=none; b=iMnIb7wqsPIdttlCu8Uamf7r3Q/+tUM0clbXJ3Zr7p8xyedqI0cAczm3x6I2nAxdXVMxBHjDKoW+rjqkBsmGdQCRfbSdAC6ax1GDrxl0AvtxPhNpVZqttWlOzJXVp8XBDFIuVC4vsvwz4AXf0RGXV54CLyyvV9yJbg+OpNtbPEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937681; c=relaxed/simple;
	bh=kCpYHWkoktPy10d3PDonysTKo1f042+BRKN9yoLmPzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqZuvedrr5DxBjiqvEAqxb5pw9GAh5+DPIXkJxW4a4oraV8GVhiKtBkBMIl/hxkPthKFk8fc87qIqNcdwEyUdWNsalGpohV6nsZlcBXCX4JcpA9bK8aWNYnN6D5Ms2aM1FN9scG/bh7wFNH17+g22reAwCXgqq2VXPJWsNmvF2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBDMQnpw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085C0C4CEF6;
	Mon, 11 Aug 2025 18:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937680;
	bh=kCpYHWkoktPy10d3PDonysTKo1f042+BRKN9yoLmPzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RBDMQnpwtgvXZxQo/lC+M0nzii6wp4zK6+A6y7PO178EZsbZKmb1Ml2HItCJdHE/u
	 RblvV39ICb24HuS+s4cnNiMoVh8/cBDCRcLpk30KnOE4rUrC6TVxrQWhmNaWJnAsRf
	 AWzvcOZDJCW8YiMAAhH8r6Etsr59VNcZ7alzW4Zc834sLMLlgrIvuu3UQhQpcKHIt7
	 XpmMJU+nYFZX+opd/R6fRRdkLragSInBh8OdMlX+VLy6fPwU5lmMx0ZGWm5PckVf61
	 Irtvfcg2Q/a0iHeViEIlk971rbxOLa086osVXKIyTdlyCxLclJRCcltdo6GZj6lKme
	 yAro05KA8DI1Q==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable USB audio offloading on Fairphone 5
Date: Mon, 11 Aug 2025 13:40:59 -0500
Message-ID: <175493766094.138281.6775771838103465097.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250801-fp5-usb-audio-offload-v1-0-240fc213d3d3@fairphone.com>
References: <20250801-fp5-usb-audio-offload-v1-0-240fc213d3d3@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 01 Aug 2025 15:51:04 +0200, Luca Weiss wrote:
> Similar to Fairphone 4, we can enable USB audio offloading quite easily
> on the QCM6490-based Fairphone 5 smartphone.
> 
> This allows to play audio via a USB-C headset with lower power
> consumption and enabling some other features.
> 
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sc7280: Add q6usbdai node
      commit: bcfe09571350d24843920aef60edf4e2bab62d67
[2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable USB audio offload support
      commit: 073f2c9b77065390e6c36c1c4fb29b409712808b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

