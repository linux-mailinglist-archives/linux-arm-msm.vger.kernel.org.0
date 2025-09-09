Return-Path: <linux-arm-msm+bounces-72852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1F3B5035E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 18:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07C6C17FBFF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1E735CEDF;
	Tue,  9 Sep 2025 16:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdSgX1nH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7098435CEDC;
	Tue,  9 Sep 2025 16:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437003; cv=none; b=qSi6t6Qg1CjGYkbyy85mnLPWvCwytPGJcC9OgtjL+ygRyC0lSDh1Wdd4oItUGSqipeNk+LC7Do7GkIpdvF5Yip4+be1P9oAiHt34b7y/TovPXq46/dnxCebyyTlYLBOriOd2a8UOlsrU0Vy2kMtfR5qI8u3vTwi1o38n27ZHPTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437003; c=relaxed/simple;
	bh=+r8mDA4yCkz2ncRANEB55SO7yWNFR6rNQqrLvvJyUZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GOilEJ3rs/B8rJRP/bu1kpS+HvNDVUQ73FAt1n7jpLagPb8uVbl/XxUgnX98cjiLUkKMgChZFDiSkVeMzlA4HFFRpIVZyGHKdxq9i7oH5mvUoOOt6BDPFptqBAj5oKZONIAW07o8BoHhg4/4q1vKBTQSC4NsoCH9ISJufND8Doc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdSgX1nH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA42C4CEF8;
	Tue,  9 Sep 2025 16:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437003;
	bh=+r8mDA4yCkz2ncRANEB55SO7yWNFR6rNQqrLvvJyUZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UdSgX1nHM0h+DGszo8LEfSvtH6HX4Fvhat9I04nfz2X95jYFW67ar/ho2cIvvEK0x
	 mfDHom8P1x01fUtsJDdfOHrUYtwynjhhE5uOx2ekZAvOQ3OTNnruzYN8JhhPPt0XhU
	 ZCRbdtvDRVFc8n0lKUEC+DJRvWJiSupdMTpGJ7XMkgGFd/mWNh+eeWI/I6dg4IwJNY
	 NI3NvPkVUXMau5Zr3JouEo4KLi1XcpKadxCRGtDVcFGMrc77rLnyL4LL6d5paLwr4r
	 gGq9WiQr//pT1vo10cQ0zUOnVOArMpF3FpQhyF+sj+cT8BRUxLrFvvnLVC5TkG68rf
	 7oyzk/13kYkNg==
From: Bjorn Andersson <andersson@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH v7] arm64: dts: qcom: x1e78100-t14s-oled: Add eDP panel
Date: Tue,  9 Sep 2025 11:56:30 -0500
Message-ID: <175743699546.2735486.13197597490732571884.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814-wip-obbardc-qcom-t14s-oled-panel-v7-1-89966ae886a3@linaro.org>
References: <20250814-wip-obbardc-qcom-t14s-oled-panel-v7-1-89966ae886a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 14 Aug 2025 21:16:19 +0100, Christopher Obbard wrote:
> Add the Samsung ATNA40YK20 eDP panel to the device tree for the
> Snapdragon T14s OLED model.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e78100-t14s-oled: Add eDP panel
      commit: e696e7aa439f1134ca5f91d6c86b332b72e57d9c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

