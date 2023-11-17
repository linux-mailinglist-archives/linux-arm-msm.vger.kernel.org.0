Return-Path: <linux-arm-msm+bounces-995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE9A7EF717
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 18:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19C201C20ADC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 17:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB39643169;
	Fri, 17 Nov 2023 17:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtKlfPUJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C428F14F90;
	Fri, 17 Nov 2023 17:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A95C433C9;
	Fri, 17 Nov 2023 17:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700242689;
	bh=EUDBFroF5TjmYX0MrqbQ4lm7E/YuA+W3eE3VkPGKcm4=;
	h=From:To:Cc:Subject:Date:From;
	b=mtKlfPUJjJanONH237bSO3hOyU3SFX6xd57lxI10FihF5J/Mibv8D4PbuIiO4F5iy
	 d4WA6/sHLhtXtn85tmoz8qRflR9TgpG14tbbU/u2a+SMRM04OTf2y5kJnuo0mfTcaE
	 gQEg3YiAE39DARcXgaIYF5Ia1GBGkJ168le7YTOy0vg6tGGvcbwVyn7HDnnam8h3LV
	 zJcX6KP7XzZSux28CArPbMBqEOCUU/OawwwhIYsz5NMxZWpfI21s3i3LoJkBgHAJ2H
	 AYbrHhzqOdeRqKQjNWy+AcyBPetP5rOABkVxIGI+Tc5v3faQwuhgO9stvbnF/Q9zUT
	 9E3RhmkCzm4fA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r42nF-0005Vo-0K;
	Fri, 17 Nov 2023 18:38:13 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/3] USB: dwc3: qcom: fix resource leaks on probe deferral
Date: Fri, 17 Nov 2023 18:36:47 +0100
Message-ID: <20231117173650.21161-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When reviewing the recently submitted series which reworks the dwc3 qcom
glue implementation [1], I noticed that the driver's tear down handling
is currently broken, something which can lead to memory leaks and
potentially use-after-free issues on probe deferral and on driver
unbind.

Let's get this sorted before reworking driver.

Note that the last patch has only been compile tested as I don't have
access to a sdm845 device.

Johan

[1] https://lore.kernel.org/lkml/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/


Johan Hovold (3):
  USB: dwc3: qcom: fix resource leaks on probe deferral
  USB: dwc3: qcom: fix software node leak on probe errors
  USB: dwc3: qcom: fix ACPI platform device leak

 drivers/usb/dwc3/dwc3-qcom.c | 57 +++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 14 deletions(-)

-- 
2.41.0


