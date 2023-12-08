Return-Path: <linux-arm-msm+bounces-3987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F7F80A67A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB9921F21058
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CE8208B7;
	Fri,  8 Dec 2023 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nRN2lXk3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5675910DE
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 07:04:41 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c19f5f822so12575315e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 07:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702047880; x=1702652680; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+r9LdgVrGwLNz9vZnl8ONcTpL/BtoeRyH/gmcpnXldk=;
        b=nRN2lXk3IQoIINvej1Vvswoc1uaon4cbbkNkLYfS4KixdpGVkwmiQaqLocPjER2ElY
         2jO0pJzsEvhaz2bKoN+ttVPNvBwaOXTz4sEBRYcuoQWCtl9E7FLoLQIjTaViboZhcuMr
         goH3lH3L464mQDoJlZqIt8dJNzT9mgOpiQuc/uGQeL83M/UB411sENlJ3vNz8Q9P+S6G
         1rVhd51HIZ4kuSPm/6+42HhQaANgw0f1M5SNvYRWJqjRcVwb6airP9aY3gKe5udjnwFb
         XFCQLmDJN4PAq8jSH7bysmSHKtXa0qucqjfdXNRK6R48GDjXH9ZCuM9GuLJPqubMw5oA
         g6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702047880; x=1702652680;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+r9LdgVrGwLNz9vZnl8ONcTpL/BtoeRyH/gmcpnXldk=;
        b=VoZA2sSzUZQ4leelv7k8RICiwjS2nnNAo6fpZOXVWZb/nDCRVsuH3WP2HvDCXip43t
         9n4dePtpaBsa31K6lCKTeDZ9rBz0TkvaaAqTOJliofa6oZh/upBRLwBrfV440xI9iTcl
         74s8V6Uf+n6jsXeUea+pCvGvWRKXfwv0GcwmrsTvcW+/g4/pJC2OE4y7X7DdEH3a985q
         pRvVY1l15TD70nlsjSEPSE2MK2Z3BxBY/k1DSo8+yT0f4AjQeXtMNQtFZPRRWpmGjZIG
         B0+dUPgaLw5a3N3U935rQu9iNlB/617dRMJLn07ZsifyFanxRR4mlr7En1xfZ/2/BvCJ
         Qedw==
X-Gm-Message-State: AOJu0Yz6RHtefU4oer02RKNPBlYbFdKeQI9WCRRTdiocMWD61aX+D1Hq
	iy0yEV35H1dhvsBCZCGDXQ8BYLp21F0+csaDg7cXx1qH
X-Google-Smtp-Source: AGHT+IGRJ5x1wKTHSst/TAB5ZChctEBraf9d8JaYfSP0itA3IolFXzX6qBCUoOVSs0m9e/COtjUTeA==
X-Received: by 2002:a05:600c:4749:b0:40b:5e4a:233f with SMTP id w9-20020a05600c474900b0040b5e4a233fmr148446wmo.65.1702047879626;
        Fri, 08 Dec 2023 07:04:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm2000403wmo.16.2023.12.08.07.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:04:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/3] remoteproc: qcom: Introduce DSP support for SM8650
Date: Fri, 08 Dec 2023 16:04:32 +0100
Message-Id: <20231208-topic-sm8650-upstream-remoteproc-v4-0-a96c3e5f0913@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIAwc2UC/43QwYrCMBSF4VeRrI3cpG1aZzXvIS7S9KgB25SbG
 hTpuxtF0GEWuvzv4jtwryKCPaL4WVwFI/now5CjXC6EO9hhD+m73EKTLhQpI6cweidj35iK5Gm
 ME8P2ktGHCSMHJ42xTQ20ZgeIzIyMnT8/Jjbb3Acfp8CXx2JS9+sT19VnPClJ0jadJpQOqnG/R
 z9YDqvAe3HXk34TC/pC1Fk0tAaqWoOs/icWL1HRFw9IRRa7tiudbS3asv4jzvN8Ax2arfB1AQA
 A
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Mukesh Ojha <quic_mojha@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2371;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=o1G/sD2ghNyWM7z/dROChbIoPttfag+11xpiG9nnwZM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlczCD5iSNZbSepEcn1qFeKyAmucvRyu+sq3vpZ82V
 zBRzJOCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXMwgwAKCRB33NvayMhJ0TAxD/
 9cjvagWEP8/qgxN+CMBbMzCKGirMyw1/cQd0L/UNuUwd0MaT8aQZS10hEO/XFO6W1J7XkrdyuGhmAc
 bhg6KbTZ6ycNadsANezc2Y/t8hohmx4FP29NtRL/iF2wGw4Wzh8xK1XfgAzHsCceznFgDn1YFFgImf
 PPmqu+u+qTniDR8ci5kO5c12TmEJwPNGwx37dO95CafK42sLY4CKa/T/CsNEEo1tb3htKDkIigG1qF
 dRCRwQgAYAC/xOxqt70D8+OSbUuYxI80+UmvU5Uvd3wpizOQh1z5rK+EnqGXifppti3K22t2XgziI5
 4oRDN+a8SEE3/XziASa1Nt3mcZyJJAfCt3ePIcksu7JBr73o1klm2rTfhOQAIg7xJPyG7kpH94OTzg
 LRKXOQuihm20ZdoPWv2pI4RZBkpHoSaXoQCiuaAnKdZRI+zx12+HGuL/K0qB7JK1NWd/hV7fn7jb+Y
 2ziEtcEWmoYgL24/VyhI8QQ1Tl+6VQZvgtGBsjGSpXm40c5qHmbGH1U5h3NzGZEAV1BQLHAQoSTkzT
 kEcId9plA6pI+/xHzTNLX9B3sFD+1c8VGePFFRK5OvPvjXySGi7/RONyHDGjnRcKH0DW3fLD1+2fWR
 eMY4DgSWQxaELUp5b1GPaZEw/kFKHckXbqd08dP0INbAF6tbru12KURcPPQw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the bindings and driver changes for DSP support on the
SM8650 platform in order to enable the aDSP, cDSP and MPSS
subsystems to boot.

Compared to SM8550, where SM8650 uses the same dual firmware files,
(dtb file and main firmware) the memory zones requirement has changed:
- cDSP: now requires 2 memory zones to be configured as shared
  between the cDSP and the HLOS subsystem
- MPSS: In addition to the memory zone required for the SM8550
  MPSS, another one is required to be configured for MPSS
  usage only.

In order to handle this and avoid code duplication, the region_assign_*
code patch has been made more generic and is able handle multiple
DSP-only memory zones (for MPSS) or DSP-HLOS shared memory zones (cDSP)
in the same region_assign functions.

Dependencies: None

For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm8650/upstream/integ

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Collected review from Mukesh Ojha
- Fixed adsp_unassign_memory_region() as suggested by Mukesh Ojha
- Link to v3: https://lore.kernel.org/r/20231106-topic-sm8650-upstream-remoteproc-v3-0-dbd4cabaeb47@linaro.org

Changes in v3:
- Collected bindings review tags
- Small fixes suggested by Mukesh Ojha
- Link to v2: https://lore.kernel.org/r/20231030-topic-sm8650-upstream-remoteproc-v2-0-609ee572e0a2@linaro.org

Changes in v2:
- Fixed sm8650 entries in allOf:if:then to match Krzysztof's comments
- Collected reviewed-by on patch 3
- Link to v1: https://lore.kernel.org/r/20231025-topic-sm8650-upstream-remoteproc-v1-0-a8d20e4ce18c@linaro.org

---
Neil Armstrong (3):
      dt-bindings: remoteproc: qcom,sm8550-pas: document the SM8650 PAS
      remoteproc: qcom: pas: make region assign more generic
      remoteproc: qcom: pas: Add SM8650 remoteproc support

 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  44 +++++-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 150 ++++++++++++++++-----
 2 files changed, 159 insertions(+), 35 deletions(-)
---
base-commit: 0f5f12ac05f36f117e793656c3f560625e927f1b
change-id: 20231016-topic-sm8650-upstream-remoteproc-66a87eeb6fee

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


