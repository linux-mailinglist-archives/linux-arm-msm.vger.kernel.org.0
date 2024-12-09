Return-Path: <linux-arm-msm+bounces-41025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9626A9E9205
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCE1C163C8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470CD218E90;
	Mon,  9 Dec 2024 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhCRyQMy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1868D218AA6;
	Mon,  9 Dec 2024 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733743237; cv=none; b=WT3NXPzjesEFg+qofdqGSSJcwg57IM+LHEDQlYKQ70VMy2yz0WGEGyzQsX+P3nRtrZXL/2hIsKEpRs4BikCoys7vVvuNPZbT1TkFQbh1sbe3AmVXu6Kv81mUixbW/mOygoWrR5pfMN9ZcWIuDeS9AZeQPytORkfZwruuvMWhlP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733743237; c=relaxed/simple;
	bh=11vQLLmphFwGU+kKNcSh9cY4RnEZ6CybkaKni0OR3eE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tKA3ku08DNJIrNVr8MAz4mznxJsa4QiuZqqmwt0RpurM4/7QUADaRf3UVUkF0NI4ZdX7axoolpjYYNWt0GALVGO11+O9X743ULE7Up3tDeC/F+SVil6wPzcseig7FCRNc3mFqknMA+nU79Muy+93N0DLSSnRp4Ma6AcrglZprCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhCRyQMy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47D9C4CED1;
	Mon,  9 Dec 2024 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733743237;
	bh=11vQLLmphFwGU+kKNcSh9cY4RnEZ6CybkaKni0OR3eE=;
	h=From:To:Cc:Subject:Date:From;
	b=IhCRyQMy3NIaBeMIgCV7dcFcIhpN4w+cPr9FSmscCMbqg3DG6c6CPGceUHM1gPZMC
	 xn4lASh/8mwyq2DOKcc4EMEayGfFJuIss8D5zXGsmtJeJqCL7wllDKrYaXwjZHdBTU
	 zmLHK4ztJ+eR1hzupos2aYPwEXmf2m5TD75xEG3Qvzll9qDoW8qgP/Ko5Dg9ojcGpA
	 8wKYfUIRE3zlF+/qpgZOoQgijeZuQFtVJodJNccT/3BFQn9q748nGBVuzS8bTnYptX
	 nMfjtRS5DdveL/zDfHo++7+YPZiV8MoZnnp6aEl/oNfcIdO6gf/HD2kbTmSvYQzcbS
	 BoIUBD0iDuAug==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tKboc-00000000869-1f8e;
	Mon, 09 Dec 2024 12:20:38 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: x1e80100: fix USB OTG regressions
Date: Mon,  9 Dec 2024 12:19:03 +0100
Message-ID: <20241209111905.31017-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change enabling OTG mode on the Lenovo ThinkPad T14s USB-C
ports can break SuperSpeed device hotplugging.

Abel noticed that the corresponding commit for the CRD also triggers a
hard reset during resume from suspend.

With retimer (and orientation detection) support not even merged yet,
let's revert at least until we have stable host mode in mainline.

Note that Stephan and Dmitry have already identified other problems with
the offending commits here:

	https://lore.kernel.org/all/ZxZO6Prrm2ITUZMQ@linaro.org/
	https://lore.kernel.org/all/hw2pdof4ajadjsjrb44f2q4cz4yh5qcqz5d3l7gjt2koycqs3k@xx5xvd26uyef

Johan


Changes in v2
 - revert also the corresponding patch for the CRD which breaks suspend


Johan Hovold (2):
  Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
  Revert "arm64: dts: qcom: x1e80100-crd: enable otg on usb ports"

 .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts  |  8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts            | 12 ++++++++++++
 2 files changed, 20 insertions(+)

-- 
2.45.2


