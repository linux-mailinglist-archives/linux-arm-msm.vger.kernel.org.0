Return-Path: <linux-arm-msm+bounces-2239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6AA7FB63C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 10:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48C27B20D22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 09:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7B14AF60;
	Tue, 28 Nov 2023 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernkonzept.com header.i=@kernkonzept.com header.b="bLCJbpS1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81E4DD;
	Tue, 28 Nov 2023 01:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kernkonzept.com; s=mx1; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:References:In-Reply-To:Reply-To:
	Content-ID:Content-Description;
	bh=qqD5FhYjTlrMhvo9H9Ud7tOWyJdz/L1HRDU0aJZunQs=; b=bLCJbpS15T6e6UbeFBQuRcwcAy
	WRIkpCQVF1x0WSK/YCENnhXMk5gd31wDctSwhTOMPwgWm8wdgga2k2Cz2k5PbOLJ4HM7Y62kzWK1I
	XZ+NPKRxMQx1F1F3Ph2aAo4nfADdjz8BY1w+GXO31WTcxzz4nBa5IffczTRTskGkO+Y39E87yC0dv
	qtJ6OrL0biub8GhYcwg28WfQK+N5GXoOml6Bpfoa0ZyRFnJSlhwIGSpjV/NdIxwFhrxfV5+gji3Ld
	xegF/08FluSg6sK9HoB82ua2/1qigPzLJUfsmXS9FPvhf0RuKCWf03TNfQCoZE3x2xuEuW2lyu2t6
	iM75m4UQ==;
Received: from [10.22.3.24] (helo=serv1.dd1.int.kernkonzept.com)
	by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.96)
	id 1r7uhr-008Pi6-2D;
	Tue, 28 Nov 2023 10:48:39 +0100
From: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 0/3] i2c: qup: Allow scaling power domains and interconnect
Date: Tue, 28 Nov 2023 10:48:34 +0100
Message-Id: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHK3ZWUC/x3MQQqAIBBA0avErBtQA9GuEi1Kx5qNmVIE0t2Tl
 m/xf4VCmanA2FXIdHPhIzbIvgO3L3EjZN8MSqhBSqGRlcPzSujvUHB1WpCy1nhvoCUpU+Dn303
 z+35PDgNQXgAAAA==
To: Wolfram Sang <wsa@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stephan Gerhold <stephan.gerhold@kernkonzept.com>
X-Mailer: b4 0.12.4

Make it possible to scale performance states of the power domain and
interconnect of the I2C QUP controller.

This is necessary to guarantee performance with power management
enabled. Otherwise these resources might run at minimal performance
state which is not sufficient for certain workloads.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
Stephan Gerhold (3):
      dt-bindings: i2c: qcom,i2c-qup: Document power-domains
      dt-bindings: i2c: qup: Document interconnects
      i2c: qup: Vote for interconnect bandwidth to DRAM

 .../devicetree/bindings/i2c/qcom,i2c-qup.yaml      | 14 +++++++++
 drivers/i2c/busses/i2c-qup.c                       | 36 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231106-i2c-qup-dvfs-bc60e2998dd8

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Kernkonzept GmbH at Dresden, Germany, HRB 31129, CEO Dr.-Ing. Michael Hohmuth


