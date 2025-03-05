Return-Path: <linux-arm-msm+bounces-50417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E5BA50EE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 23:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2B9E3AD29E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 22:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFE9205E21;
	Wed,  5 Mar 2025 22:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFjhWvcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896332E339F;
	Wed,  5 Mar 2025 22:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741214685; cv=none; b=F1CTRY731Hgk4eVRWE24qBK458Ge6qfBVBobA7tQ0WN5OJR2Rj0QpDXt68se7WSVnanhqEDCVSFQVSp9kRw0r7ZbLhPKtGuC+RTACeYdHPUhpkw8xHkhx2Nre6vl1+5XQbSfCr4up272glYCfjeiCqRc1MR1OYm1bRxzOUZQ+Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741214685; c=relaxed/simple;
	bh=m+B22u9Aqj6/oDms5/yYBB6yk0CyqE6jQ8Qo7nxZEz4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dL0mzHP5X9wYJdpWkfzGX2+vi7sLdSvDvKv22YgCL6oEy33V+VuQdtLJxjg1fnopQeYESpOCmM9to6+ITWlttltbwo++w3GGuFLDNydeNmZomLVWtKZ8Y++PNvO8YGD97/icLRSK1wJXFJSm30QWYiOfLP86jezAHGvLI796MMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFjhWvcF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F944C4CED1;
	Wed,  5 Mar 2025 22:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741214685;
	bh=m+B22u9Aqj6/oDms5/yYBB6yk0CyqE6jQ8Qo7nxZEz4=;
	h=From:Subject:Date:To:Cc:From;
	b=FFjhWvcFxBohFFaqD3LiFL+FdhkfEmUpRkJIHMKGKdRaMkUsdocvytFWjgwG3iz+O
	 HXgRqTT1npyFgJqwrBjc1AirrnwGhV/OnIXBnsl8xL9Un+zsidWQO8hRTHSg/mh9A2
	 miFe6iYUUXRS3V0irt1HivQ+/iXFY/6blTGvHFABmL9XmcmJkmrhK6ACTB/js8QaR1
	 aJPRTXHERtH1cjRS27Mqbwh+EcenIDeGE7DpvE6o+rQ9KPzBVAvtAC68b5BYWoZM06
	 cIJ3cFFv52MsvPOtr06Hm6VKG6GdE/bjLxO3aXIDbVZJoSUAzfS/6ZTGc8ffZ9SzSC
	 bkPX00f8eaBlg==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH 0/2] MAINTAINERS: update my email address
Date: Thu, 06 Mar 2025 00:44:35 +0200
Message-Id: <20250306-update-email-v1-0-9a231571e905@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPTyGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwMz3dKClMSSVN3U3MTMHF3TREMLi8Tk1JQ0CxMloJaCotS0zAqwcdG
 xtbUA9UbI6V4AAAA=
X-Change-ID: 20250306-update-email-5a188acedf84
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=636; i=lumag@kernel.org;
 h=from:subject:message-id; bh=m+B22u9Aqj6/oDms5/yYBB6yk0CyqE6jQ8Qo7nxZEz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyNPawLxw7i/5YgqCcD75ZhMf+oY1DZmqYqm/4
 BuaxE93y7iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8jT2gAKCRCLPIo+Aiko
 1dNhB/99EOuC2OYCMOYy3nK9ZnP/MCqYIGiG2oEWf2uRlYsXyieS460JZctwU3uze7EqIMH02c0
 WN3DqgHrBCUZQNecVhyTXruW6iA73fK0XJnMVguRU8J4ubSW4Pkz3Q4sUSIHMBAgh2Hrdrms8jn
 nBJ/LSrbol8jX4FLsyJpzPp70PVsbjxpr4+iXCKP6VkNV5Rf2CYoFJCEW9mGv+BMCCkAK1WiNcF
 HaPuGUQczB36mDu9A+GFGeDVJC+tPZPLsgbfBgJjVCqTrUXrjdoCE6CXS96MIq9UeeSBUUpm/F2
 geYF3cs20Mxoy1Ab9az4xNMY+CfJIriSdoELLIqa7t891o4/
X-Developer-Key: i=lumag@kernel.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Update .mailmap and MAINTAINERS to point to the @kernel.org instead of
the @linaro.org. Linaro address will stop working in several days.

Rob, could you please pick these two patches?

Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
---
Dmitry Baryshkov (2):
      MAINTAINERS: use kernel.org alias
      mailmap: remap all addresses to kernel.org alias

 .mailmap    | 9 +++++----
 MAINTAINERS | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)
---
base-commit: 20d5c66e1810e6e8805ec0d01373afb2dba9f51a
change-id: 20250306-update-email-5a188acedf84

Best regards,
-- 
Dmitry Baryshkov <lumag@kernel.org>


