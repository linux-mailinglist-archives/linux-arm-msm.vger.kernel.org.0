Return-Path: <linux-arm-msm+bounces-56721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B04AA8A16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 02:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B14B31893A35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 00:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FED63C2F;
	Mon,  5 May 2025 00:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jY9I134T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB94620E6
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 00:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404100; cv=none; b=gorDcILL+rEgT1IU9KlS54Zr2et2VQA9k322nSm7hvjtIz2fUDtgwFgffKZ7Om1/qnkBwXl6z88HH1y3icvN44dWlrRUvfA0ursCGCLk6yL84SMhtrcvrEQP8pn4eaTQu3op259m7q2roDFUTb3GT1kSazndTIBe6Ay7tcfQUTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404100; c=relaxed/simple;
	bh=7Pino99IS4gxmEVNtT1+Fg674jvsTFh8QsSqJonlwOc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IHNyKuGNj4hHYUHw3VvSAhasGGxZRCtS/8PAAG4drTU93wiREtT6PH2ZFpdq4thqQU81QrFZ3m0LPETGS18/uwH3GC3aYIt++HVzA47mO1UgJ+44/JQQdXMa8Hr3nFCGo23Ptrpze0XOIq2GUJCvzwtmRnUo4xc1JZMcbLlVksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jY9I134T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NU1Td023427
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 00:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l90h0HGpLRpkB0qNvwdUHZ
	hYMuIvBrbptPLn9QIs7xg=; b=jY9I134TbSePusW2ZUmNzl90f6cO3f74Ixjv7u
	yI8bgMxgl8HLcl+s5jrsf9P7q0Rab5hFw2FFPoNeVXpTCFeb8dR5E5U0yhJsjIyo
	qYG/mrCSNLGTZxnmuoYIgmE60zUR9jQnxpiCUV9Mq6qmp212qr0TcHPoKE03rpvk
	Y15L65dvlVGWfAZZxo6merFAtgYPrrvPWM/uCIyDIz6pj0QuLQHWb/UU/oA25F92
	vt14aSTRPPFP434gsloK2g4wsGhdTcqLytE/Jj/mJ/Nu+b2uVv6gzQMi32CLwkvw
	xCrvJS0TZFFay7A7v5yrhJJ6Egdc/GaRAiK+8Wo3ekXC1J4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rtpm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 00:14:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e9f6e00so869614285a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 17:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404096; x=1747008896;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l90h0HGpLRpkB0qNvwdUHZhYMuIvBrbptPLn9QIs7xg=;
        b=RXPm6wgrBSSOydSyjBvl5essZPJC5nbeFvgqBvv76VO8UU4bBK1h6GsKj/dSVJJ/Er
         +j6Pmfqu10B/GFb5lToWs6/b3gzcwhuuyWpPGnSfgy9uM5L1U/V05G4q4t7TOP35pQC3
         DaJ2DEfnVoxNJPQUhJViZ8A9WrePnPOKGtR3dA2pFBJAbmFjklhD/G9Hf7laqmwHyUAr
         olCpnEifq4YFjo23gWJG/0o5Um6bskg/tEE/xV+CSBUAkHvcA2EI7XG/482rSz5pNI1L
         t8uate8Sbl6Sihyl9Lx0KPgaK0jnW2PFdPer0erNumIT6CtHzWRmuFohkW6cQz+ho9VQ
         mFZQ==
X-Gm-Message-State: AOJu0YwqGyPTzoiaf2jnG1V/f4d+MxM0hqUIGofeKSEOpn/n6bRCNRBo
	LvSOtHsDXpxE0aNqNWhfSFpE+CVw/P7nMXoGDHFf7F4C21hpij2WZkaqRwA8RFXgbdQTRoHKe3P
	7KaHtFNAxSOrAX7q4sasm+ANcHPehPBDCD48TddrkaNKa+td6LZRmOjJzA4HKUtjJ
X-Gm-Gg: ASbGncu3MjFr8gVZo1o/1Wztw8MsQkh0Xfb5GyU3RJWWzux0ihcbFXC0AicJsHhJ/+k
	xHLJnyoXGoA46SzrS2HS4yXQhVRKwnbfStZOo579/ZuCm2/ImFkDeLCO/xHCNHEE3DdKIveMCWG
	A11wBM46AU6qrK3UvsWaa+N/FC+kN2GLIeVw6e6AmKnpjJT/928Hy5phDhvxAOTQDDbwfxSH5BZ
	yY8yldKnEYK5qRB/Oag9mm5bA09U3PaQ6pjAr1G5G3uC2Taee3ZczJsidUG3nsqO4XiQe8hd241
	2I0tVZQQO7SfN5AVn1zWWYOdx9cFugLmVU2lut8bupRBkkQRfx3LarHHacAQaJMUa2e4QsUUVfU
	UNhIBUFIFanSAzL3nQ/5S/K4A
X-Received: by 2002:a05:620a:404e:b0:7c2:f39d:d0e0 with SMTP id af79cd13be357-7cace970621mr2280185185a.3.1746404096360;
        Sun, 04 May 2025 17:14:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtGJXxyiZuVoheTixj01E/WidOroFmG3EK+TLgG2+eb1c8BMLiBCNLo1GSEwRMtdW96uybvQ==
X-Received: by 2002:a05:620a:404e:b0:7c2:f39d:d0e0 with SMTP id af79cd13be357-7cace970621mr2280182385a.3.1746404095994;
        Sun, 04 May 2025 17:14:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:14:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 00/13] drm/msm/hdmi: rework and fix the HPD even
 generation
Date: Mon, 05 May 2025 03:14:44 +0300
Message-Id: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPQCGGgC/22Qy07DMBBFf6XymgnGr4Su+A/Ewo9JbUHiYoeoU
 dV/Z9KqgggWXtzFOXN9z6xiSVjZfndmBedUUx4p6Icd89GOB4QUKDPBheJaCOgDxDAkiMcAKDv
 TBXTGImdEHAv26XS1vb5R7kseYIoF7d0huZFccK2FbFrTCQlPQLapLI2zZanxPc8vH2m0JTe5H
 FZpTHXKZbk2nMWq/r/MLICDl9wF13rtW/ztWdvM8gc2dHkDS4I7o7Q1yrtg5B9Y3WFN/Z+3sCL
 YCKG06TB0bb+BL7dhCn5+0brTbR3mbEXweaC/73dDHR7pwYiniYDLN4Gi1WOWAQAA
X-Change-ID: 20240522-fd-hdmi-hpd-e3868deb6ae0
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2844;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7Pino99IS4gxmEVNtT1+Fg674jvsTFh8QsSqJonlwOc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL7k34CTyL+GciS47k4GgyjUDHX+AiePEWZZ
 PZu+mKeY1aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC+wAKCRCLPIo+Aiko
 1d7DCACkX6diSixrEFcrvdjBBsobYTaNgNHevK3bgBqUR79f2pfonOim2y8lJLX9Fg9goVbj1qW
 al7hSm6nEwi6XSkld5cDVhg4U2y6DgZDOVwGUtre+qLRAx/Cb84RPUhUmpYsZyn2EEDke7sgoNl
 nSqNbc5I+gGdXVKsL2NUyZ1EwLtwKsivS+5gt3TvZvhwsSWdi8iFuXAAVICpIhMq0RHH+qLm/pJ
 Yb3ZFzWt8++wR9qcVZRjufl6hFe8/zHs0PcHaHLqtjtC7y2Qt6mTlATiNLn3ijqIRVgYB5eWZw8
 C829W9kv/t0e/7vdGOcCuEBrjBLc+Vy/WiUfCSOYEL0XhMA+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 4eHjZDMzKQsjKKXyuA7veQKcm7MBaCcv
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68180301 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=xeEy2NUaHwTvFDDSPagA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=pioyyrs4ZptJ924tMmac:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4eHjZDMzKQsjKKXyuA7veQKcm7MBaCcv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfXznBPoFZXRJ9J
 qEsyb0P+S7L2b/9ZAbRXkIBVPVKnLhkPGDJXilqLRGKWyfNTLEsDM9luBUUF6QhL25rWDyictMV
 Z/CPmSyNHGADhjJgAvWA9ZdE/GlDCgJxxBZSMPewiC8VmukoO0+CmmhwqteG4zKuiG0v9smSEjv
 BpRnpYQVdz5bDkrgF+WXwAqGTPvYGewGA8BAJEcpGaxJtjKAbUCeMR8V4bw+QytMm63EWAZfSE5
 ag+7Bk0A1rXaqvTC7aXzw9oHClsVw2LBU2cNEkj9QYnDGgEaVntJmNvlycY+ayqaX+qd5EvClKJ
 4wp6Ac/+tlUEifCOSTJW5m5rr93T83N66S0VBpJ3PhuO649TVPeeohWcKOdEUA6WyNqhQx9iykF
 GggRbEHcH/g6c/Lcb+6kZ+3b4R/5bGbgT6tvyrZtw37zUWjA1g9ICTMQYVNVqwgWy/FdZf6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000

The MSM HDMI driver is plagued with the long-standing bug. If HDMI cable
is disconnected, in most of the cases cable reconnection will not be
detected properly. We have been carrying the patch from [1] in our
integration tree for ages. The time has come to fix the long-standing
bug and implement proper HPD handling.

This series was tested on msm8996 and apq8064 boards. Previously HPD
handling sometimes could trigger in the CRTC event handling, however I
can no longer reproduce it now.

[1] https://lore.kernel.org/linux-arm-msm/20171027105732.19235-2-architt@codeaurora.org/

---
Changes in v5:
- Dropped hpd-gpio patches (to prevent ABI break, Krzysztof)
- Link to v4: https://lore.kernel.org/r/20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org

Changes in v4:
- Added bindings patches. Dropped hpd-gpios from the IFC6410 board DT.
- Fixed checkpatch.pl warning about non-const string arrays.
- Rebased on top of linux-next and the MSM HDMI patchset.
- Link to v3: https://lore.kernel.org/r/20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org

Changes in v3:
- Rebase on top of linux-next
- Dropped the patches that were replaced by the HDMI Connector
  framework
- Picked up the mode_set -> atomic_pre_enable patch
- Link to v2: https://lore.kernel.org/r/20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org

---
Dmitry Baryshkov (13):
      dt-bindings: display/msm/hdmi: drop obsolete GPIOs from schema
      drm/msm/hdmi: convert clock and regulator arrays to const arrays
      drm/msm/hdmi: move the alt_iface clock to the hpd list
      drm/msm/hdmi: simplify extp clock handling
      drm/msm/hdmi: drop clock frequency assignment
      drm/msm/hdmi: switch to clk_bulk API
      drm/msm/hdmi: switch to pm_runtime_resume_and_get()
      drm/msm/hdmi: add runtime PM calls to DDC transfer function
      drm/msm/hdmi: implement proper runtime PM handling
      drm/msm/hdmi: rename hpd_clks to pwr_clks
      drm/msm/hdmi: expand the HDMI_CFG macro
      drm/msm/hdmi: ensure that HDMI is up if HPD is requested
      drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops

 .../devicetree/bindings/display/msm/hdmi.yaml      |  15 ---
 drivers/gpu/drm/msm/hdmi/hdmi.c                    | 133 ++++++++++-----------
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |  26 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  55 ++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |  89 ++++----------
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c                |  14 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |   6 +-
 7 files changed, 135 insertions(+), 203 deletions(-)
---
base-commit: db76003ade5953d4a83c2bdc6e15c2d1c33e7350
change-id: 20240522-fd-hdmi-hpd-e3868deb6ae0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


