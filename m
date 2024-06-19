Return-Path: <linux-arm-msm+bounces-23248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5599C90F48B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AC39283121
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 16:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C826156677;
	Wed, 19 Jun 2024 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="bElNTWFO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98263152792;
	Wed, 19 Jun 2024 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718816068; cv=none; b=O939UmxcuVFeEgrs3egot8J7sR9SVoVTeRIFy+N18o7tBWn2I8UW4qIzkdA9Ty50kuhnLic6u/Giw7RvO2Hikw9dsbvQyW6+yjlDsV0ioB2fI71hD6whxdxA+QcahyLQzDA1oVTIzUQeeEzHTPwHCVB1KGOQoM+DvEYCkreVHlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718816068; c=relaxed/simple;
	bh=Sjz3DIoq0Zh1oqp2UL91MkPA5irTCigjw/wM4v2Ete8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TI4eLSJ5HDx5T+nRfULUq+F0ysbbtf0uq40MpYEkp/lF8Ko4o1Iw5Cj/2fn+xhT22zbGPdRi+Xk6Xxp+gzuVLkMhxnEmaoh/+dkVInJeRfUSHtJoNCXAYdsPD+jyxtQ3LSmH0wVgElzTOQwhi2yLcC2Rplfq8ctk+4oUs6fu/uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=bElNTWFO; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718815509; bh=Sjz3DIoq0Zh1oqp2UL91MkPA5irTCigjw/wM4v2Ete8=;
	h=From:Subject:Date:To:Cc;
	b=bElNTWFOh5JZGMsnkhAZFdRe1VI7JexFIgS42n+cBE2eSJ/C7FvlQjFSmitwNzoj9
	 flZALDLvdwonMvH8fhqXb5waBQrYLYQaMzN7e5v5cuiIF7rJRqkN8//r5RoBXOehcy
	 5fqPd6fxyMHDZB1SnxOI/q5yDANvu9ORvclQp1yA=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/5] Use mboxes in smsm node for all dtsi where possible
Date: Wed, 19 Jun 2024 18:42:26 +0200
Message-Id: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHIKc2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0NL3eLc4lzd3KT8Ct2UkmJd49RUy5TExJQ0C8MkJaCegqLUtMwKsHn
 RsbW1ACJmDChfAAAA
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=Sjz3DIoq0Zh1oqp2UL91MkPA5irTCigjw/wM4v2Ete8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmcwsGi+azjYtioTEK81ULklvONA/PxjCMDDJUo
 er2cAYmHEyJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZnMLBgAKCRBy2EO4nU3X
 Vt+MEACggRg23I5azN9XXQOVy/+DAS9NOTRox5LbANDItnF5Z1ZQPSRS9ZLesA+zB0shlZYTcoF
 lCFl6Fz1/dsGV315xoOKbs+JeHmTVR8ASyt2ZIqgd2uigi34F1VBcC3Lu5lVb4uf1a5Vqa4DsD+
 Pj/Ur/OZdEoW3Q5pMKn2fIWdc9Xo5CAzLyG4dwTLdbr2kKAk22IW8Iouhi2ycBr1240rpjnMHVu
 LU4h0ZsX3UUGiYToEXNPXujyOXFewZo2CHxRtp4dWOQ7H5/jDoV370/JTXi9vwO/cYVpuACgSvY
 Sv0e5t5KgzrZKNpF3IwT40v8b8K6DUpwjqL7QXka1JGmjh17IWzk7sSqXKBhwHAF2D2u84wWd91
 1a6ewjoBUyJ1U+NGLTvLNW2ncTLMYa5gsZ7gNM4XIwzetEPTqLv77XjhB8AVIaWKh3ecv4OWMqh
 wsGStZeBjqELYLJb1usgi5uiaUw2oSoUy0nK139XVJDDdpONvxeDOLxbSvhOTMfafKDEa2x/6qC
 kkzeMoTUfhq3lLhug4cw3fWrlLoU59e33BtBOsS4unv1I4lfW5NYWFmfqS0RQvuciUqDtQ/MzzX
 zvfPXkWP23HUy4T3PbDJ8sXDECnOP7gCxzguVotUIwizg6amnPlG4N0rmkcgXqyi9xU0DrmJJFc
 Izi9YSBxGTuGORw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

With the binding and driver patches queued for 6.11[0][1], it's time to
update the dtsi files to use the new binding.

[0] https://lore.kernel.org/linux-arm-msm/171840533352.102487.9576671528001022676.b4-ty@kernel.org/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=drivers-for-6.11

@Bjorn: I think this makes sense to only apply these patches for 6.12 so
that also in the arm64 tree the driver will exist already, so git bisect
is not impeded by that.

Patches are just compile-tested.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Luca Weiss (5):
      ARM: dts: qcom: msm8974: Use mboxes in smsm node
      arm64: dts: qcom: msm8916: Use mboxes in smsm node
      arm64: dts: qcom: msm8939: Use mboxes in smsm node
      arm64: dts: qcom: msm8953: Use mboxes in smsm node
      arm64: dts: qcom: msm8976: Use mboxes in smsm node

 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 4 +---
 arch/arm64/boot/dts/qcom/msm8916.dtsi    | 3 +--
 arch/arm64/boot/dts/qcom/msm8939.dtsi    | 3 +--
 arch/arm64/boot/dts/qcom/msm8953.dtsi    | 3 +--
 arch/arm64/boot/dts/qcom/msm8976.dtsi    | 4 +---
 5 files changed, 5 insertions(+), 12 deletions(-)
---
base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
change-id: 20240619-smsm-mbox-dts-3ee9daadf81b

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


