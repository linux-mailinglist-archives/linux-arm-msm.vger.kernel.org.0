Return-Path: <linux-arm-msm+bounces-82373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03545C6B036
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 18:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 942924F720A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 17:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C456349B0B;
	Tue, 18 Nov 2025 17:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fasN/W7h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EA833C1B2;
	Tue, 18 Nov 2025 17:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487201; cv=none; b=UrzbqK/x6yU718ySv7BGOvrBvjS1Taucu2BcM4FdDVI9ZhDIqPC1/WN6DY4sEv3O2EEBoFgFeun9EJN8pefjpe1KngQkSgtdZjrYwkcdkKQUjcOBLxFhgYO/g8uIlMWpUifLLScLA3dvrjl6FkEZqN9wBMxF5aTxF0Ez9QaO9xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487201; c=relaxed/simple;
	bh=MGtVji2vSVm/fOS6ONdrpFFxYiyv80fpbkiyEEmC8io=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XTCS41bZ7p59ilORO8jl2CtY+rZzwa67rKrpY62QnBPf89Hp+McG30hZ1ntTpkpiiNSgm7sFw3nROL1L6lUGpAJpRCKeXdZqjea+3EEj1yl2RDbfVv2XhlytFN2FMZnpqTYRr45ZAUMWRAUGN7X7wEHN5s20Ll7xVED1hkcGAvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fasN/W7h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A822BC4CEF1;
	Tue, 18 Nov 2025 17:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763487200;
	bh=MGtVji2vSVm/fOS6ONdrpFFxYiyv80fpbkiyEEmC8io=;
	h=From:Subject:Date:To:Cc:From;
	b=fasN/W7h2ZAlzq3iSmxkuMZzM963zJCUclnWpOU8Px+bTWRqwCOvsfpjn5iUgSnr+
	 R4Futere0mqiQiitY4xhN41C742q3loUKaL2d6Uk2QlOfYwxIafN96qcphhLC2zJvz
	 K199U9d2xJC6fERezCOmK1jEVcrmNummY9f3isqOHPeYNhs0pVIv1n6uh8Tprez3Vl
	 WuiBcv9RpjJHVW/U83a+YjgcHiEGCM8tI0ucuvN17fl8hAyVyH0nnqymOrjOKCqkfL
	 q/Qi5tu7T4totqDvXMt2RQMQ85lvpJrtOg+AQxo1ViI+XYOMk739zWKgsc45CDJJq3
	 /ChdUtrelbzcQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/2] Add DISP_CC USB4 router link resets for X1E
Date: Tue, 18 Nov 2025 18:33:10 +0100
Message-Id: <20251118-topic-usb4_x1e_dispcc-v1-0-14c68d842c71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANatHGkC/x3MQQqAIBBA0avErBMaK7CuEhGmU82mxKkQorsnL
 d/i/weEIpNAXzwQ6WbhY8/AsgC32X0lxT4bdKVbRDTqPAI7dcncTAlp8izBOeWNQdvapZt1Dbk
 NkRZO/3cY3/cDF3c53mcAAAA=
X-Change-ID: 20251118-topic-usb4_x1e_dispcc-d881a5af9b23
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763487196; l=645;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=MGtVji2vSVm/fOS6ONdrpFFxYiyv80fpbkiyEEmC8io=;
 b=nFq2k/E5LODGinAWB27vjR4EqNIypIoGIxEnMcJ09YjHWhyDtVCYMi3N4HZkJY9TOmX3iu/A8
 95TNxF2nHgNANi0sU7Xn3iOIf5ZiExUd7AufMtp+06NbFBj6gXanvPn
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Those are going to be necessary to toggle as part of the topology setup

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (2):
      dt-bindings: clock: qcom: x1e80100-dispcc: Add USB4 router link resets
      clk: qcom: x1e80100-dispcc: Add USB4 router link resets

 drivers/clk/qcom/dispcc-x1e80100.c               | 3 +++
 include/dt-bindings/clock/qcom,x1e80100-dispcc.h | 3 +++
 2 files changed, 6 insertions(+)
---
base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
change-id: 20251118-topic-usb4_x1e_dispcc-d881a5af9b23

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


