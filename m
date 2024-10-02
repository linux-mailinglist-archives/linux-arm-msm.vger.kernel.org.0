Return-Path: <linux-arm-msm+bounces-32927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FD498D0B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 12:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CF691F2361C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 10:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D8A1E6316;
	Wed,  2 Oct 2024 10:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwJ3dnoH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4EF1E503D;
	Wed,  2 Oct 2024 10:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727863355; cv=none; b=pjAVjSAWUzQF7pSOp8Zuu8Cg+Yj7gw1yu4/GpCD7hDO40AIeR8gKFEhlLW+sMIQiASlRoTsYEY//wP+HJNepb4T6Wll1JqAze6fCbaVRnQhq4DaAMX2Qu2iQaar0Wv0mRTwBb0oAnFZKkZAjmTOr79bK9D90q7imZbSn9eLO0J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727863355; c=relaxed/simple;
	bh=0uMyPUeXCbYvDYxu8/2Q36pRaWyEFmQn4NnsBqq3vtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYSg5jM5xYwCn1RGjLuGapZSgZ2SqFQ8blkp8zxW3KzXR1kYYbC7KCuk3267fwT7kd8HD0S6dFQUL2atuukd1+3zknT7CMWtmSr1bgOzNrGcEBjjjzHdZCStgGJs2ANpuUAkNxxcIuXdnL+cY/FhUMM5yFl50yjazNbwYHqGuLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwJ3dnoH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD756C4CEC5;
	Wed,  2 Oct 2024 10:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727863354;
	bh=0uMyPUeXCbYvDYxu8/2Q36pRaWyEFmQn4NnsBqq3vtI=;
	h=From:To:Cc:Subject:Date:From;
	b=VwJ3dnoHXMkr98OOGTJBH7PRsSZCloBUp+Q7UotMHXYoM2vsSnrVApB4qHOpm6LSX
	 vjUbOwTAKiaCntFqZsSSCMTDfSSoLZ8EnU+RD8YyP4ewP1/fZhn1wScTF82a9C561L
	 s1pynv8wIV9oia58wNkzQ0RwUsXYb0rhfc2jbavz5kEHsly1I4DSswlrxH5rOqGR0e
	 +ihwjtiVkiazKpj0oWhS/3YDOBCohbWcno9eB9YpnrUty+BscEk1tDh4qf9+ewfPfn
	 IKXX+LJ3cmOsHO6icNKknOX6hZXMdTnYssxKj0EjWqt9fZFjrkqke8wrWDlfR8D13Y
	 zJV4xfdWgQ/FQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1svwBm-000000004uu-31Nf;
	Wed, 02 Oct 2024 12:02:34 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] firmware: qcom: scm: suppress download mode error
Date: Wed,  2 Oct 2024 12:01:20 +0200
Message-ID: <20241002100122.18809-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When booting 6.12-rc1 on x1e80100 I noticed a new error in the boot log,
which I had previously also seen on reboots.

Turns out the scm driver is incorrectly logging the fact that the
download mode feature is not available as an error on both boot and
shutdown even when the user has not requested the system to enable dump
mode.

The second patch enables the download mode feature on x1e80100, which
from 6.12-rc1 specifically results in a reboot instead of entering crash
dump mode after a hypervisor reset on the x1e80100 CRD by default.

Johan


Johan Hovold (2):
  firmware: qcom: scm: suppress download mode error
  arm64: dts: qcom: x1e80100: describe tcsr download mode register

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1 +
 drivers/firmware/qcom/qcom_scm.c       | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.45.2


