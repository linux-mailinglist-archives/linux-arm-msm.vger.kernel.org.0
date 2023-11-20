Return-Path: <linux-arm-msm+bounces-1191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ED37F1852
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 17:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98E4E1F25277
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 16:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9DA1E533;
	Mon, 20 Nov 2023 16:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQgenOGj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C121E527;
	Mon, 20 Nov 2023 16:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33359C433CD;
	Mon, 20 Nov 2023 16:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700496979;
	bh=RqLtxq3JS2WZJO5Z7BQnNMc6WxYyQfEIqiv4EGNlGr0=;
	h=From:To:Cc:Subject:Date:From;
	b=PQgenOGjN8Ejyic2TC8oSdPje9uSLE+ChZmT2IojOrV2JVwM4LY1pDg295rZaApGa
	 SzQ8Sefrjlq8VNBv7cqNkR9BKfMkIEEuk8ij6oA/TCUv6Ol1EqZmmS9CfgyOkXqUBr
	 ZXEEwuglqN7jLhqZwIKJO5YZWaKMTjiDe51JVoJR42gpqCGRG2OSMACDkVMBYU6RzU
	 S14zyWE7s6d5v9MSwHIZuoWSuxa19ZcD4ABx07HqqnlRErdk9ZtwMrnORFyI1JGhQ9
	 +lcO22aHCMjuOY27UG6Ek2JZZcse6tweWwcN/pWf+HAedtU3tN19QTeJ+wo/pcx8V/
	 as+OyRmrB3XJQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r56wm-0001vk-1I;
	Mon, 20 Nov 2023 17:16:28 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/3] USB: dwc3: qcom: fix wakeup after probe deferral
Date: Mon, 20 Nov 2023 17:16:04 +0100
Message-ID: <20231120161607.7405-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When testing a recent series that addresses resource leaks on probe
deferral [1] I realised that probe deferral can break wakeup from
suspend due to how the wakeup interrupts are currently requested.

I'll send a separate series for the Qualcomm devicetrees that used
incorrect trigger types for the wakeup interrupts. Included here is just
a patch fixing the binding example which hopefully will make it less
likely that more of these gets introduced. Fortunately, there should be
no dependency between this series and the devicetree one.

Note also that I decided to include a related trivial cleanup patch.

Johan


[1] https://lore.kernel.org/lkml/20231117173650.21161-1-johan+linaro@kernel.org/


Johan Hovold (3):
  dt-bindings: usb: qcom,dwc3: fix example wakeup interrupt types
  USB: dwc3: qcom: fix wakeup after probe deferral
  USB: dwc3: qcom: simplify wakeup interrupt setup

 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml |  4 ++--
 drivers/usb/dwc3/dwc3-qcom.c                         | 12 ++++--------
 2 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.41.0


