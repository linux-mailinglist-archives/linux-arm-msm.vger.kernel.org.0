Return-Path: <linux-arm-msm+bounces-2237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA77FB61A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 10:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EBE41C210F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 09:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450F74A9B5;
	Tue, 28 Nov 2023 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernkonzept.com header.i=@kernkonzept.com header.b="mcT9MeLj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75233D6;
	Tue, 28 Nov 2023 01:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kernkonzept.com; s=mx1; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:References:In-Reply-To:Reply-To:
	Content-ID:Content-Description;
	bh=dhnXcjMI9E7q+q8qflgLfPbgmQz993e+7z5nLM7la5Q=; b=mcT9MeLj12lISJj27FhbjYI2Bw
	hfjPVGBe0GInISaBancGe0GbfBEamz5K2VungQeIhCN13DEfySOEYS9G/uiUMyJugwi/3TZJ6tsL8
	Od4rW6Kd4krfdT+tYao73grAH0mrqSGzffqpUSFfPuZVuwOgzstLFS4avpxlm1v3BzHTaAssM6olK
	E9WCOfsk8bfFqG+5UmqIX9UD15zZa8ahDIjO/bsAzfekxKWK3NpZSWoRuLcgsu+NPeT8WYkxyrJRE
	ZC7Zjg8dqYnHe+BKH/ex4/B1q7DKnubHb02hxb8T6n0ekWVmSEwPfJuiq5iFBjGHvnldZ3dj24jHa
	HhnacPNw==;
Received: from [10.22.3.24] (helo=serv1.dd1.int.kernkonzept.com)
	by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.96)
	id 1r7ucz-008PbT-0B;
	Tue, 28 Nov 2023 10:43:37 +0100
From: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 0/2] serial: msm: Allow scaling power domains and
 interconnect
Date: Tue, 28 Nov 2023 10:43:31 +0100
Message-Id: <20231128-serial-msm-dvfs-v1-0-4f290d20a4be@kernkonzept.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEO2ZWUC/x2MQQqAMAzAviI9W3CTgfgV8VBcpwU3ZQURZH93e
 gwkeUA5CyuMzQOZL1E5UgXTNrBslFZG8ZXBdrY3xhr8fNoxakR/BUViT25YnKNgoVZn5iD3f5z
 mUl6NnpBIYQAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Jiri Slaby <jirislaby@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stephan Gerhold <stephan.gerhold@kernkonzept.com>
X-Mailer: b4 0.12.4

Make it possible to scale performance states of the power domain and
interconnect of the UART DM controller in relation to the selected UART
baud rate. This is done by setting up an OPP table in the device tree
that describes the necessary power domain states in relation to the UART
clock rate.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
Stephan Gerhold (2):
      dt-bindings: serial: qcom,msm-uartdm: Vote for shared resources
      serial: msm: Use OPP table for DVFS support

 .../devicetree/bindings/serial/qcom,msm-uartdm.yaml   | 13 +++++++++++++
 drivers/tty/serial/msm_serial.c                       | 19 +++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)
---
base-commit: ab58841ab9fca536e5579312d7b46cbc4822e29c
change-id: 20231121-serial-msm-dvfs-aeda58c55af2

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Kernkonzept GmbH at Dresden, Germany, HRB 31129, CEO Dr.-Ing. Michael Hohmuth


