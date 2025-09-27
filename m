Return-Path: <linux-arm-msm+bounces-75355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5E3BA570C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 03:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CA031C2454F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 01:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83751E3DF2;
	Sat, 27 Sep 2025 01:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXxXeZpQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064CF1B6CE9
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935081; cv=none; b=lYH1eMCzt1L8i/St4JpLJLdz1cnxY+akcPPqOLQ7hupSqveYfIeBzKDUB+nSrgXxyEQwqObqtVccPSUezJFWrbvl8/8aYa0nY5GMMXd5dJaAPY1CmfkzHlmqAN1ewS5i3COXf9T1+ZAhNOGZL2Nr3YVO1In4GBja8H9F4lrrio0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935081; c=relaxed/simple;
	bh=Q78XSS/y8JtPNnJI6s3J7ArXOP9v75Iaz+LCtP6FojY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eOkpX9E+7MzAmTcpSY6e8UMjb2XeHOmWCdA3Zokp577xbmaB7u1lOKrAQKXb+y1/HvE+J5SqbpUFNXwr22yEMM9HOr4U9xfsW6zQT11oF6+OBtruG4QGgjV+vsV5DH//8CaipW334pKkrEGfNwM1f8Pf3GbYpfdKBDSZp/6xp40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXxXeZpQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58R0Jj78010662
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qc5ocY3tSciWpBAvhCZm/2
	AVYNgu26K/bDoBWBIx65s=; b=XXxXeZpQoQZGfQAi2J3GHrxvHFMaIqSGA8mLTB
	rnF2pRGvy4DfAWzwdfPwq1G1VkzwbRpa+DNA/e4Mod/7Hg5r4jyvIHCBDIYiVxjJ
	pnYpMjy6S9CKxRLa2Og1MkeO64/smHZWkYXXCODCFETfDud3kKM3TPx0WD0OBwx1
	NrFXorE+zOCSYPwPageBqGT23TBYlS4T4FXqsup/uf0BepZ1JVUjM0G3PFXYZyAf
	0yhiJZ3JSKwjWYtM02HVQDEVOTT9FMznbznv042MZBgS0UH23Ek/vnQs9A+7P7pr
	aaZWbwxX+5336Ur9HGVIokMuoMj+yfa3ZP+n8mBet6CxwVJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59mr1y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:04:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8217df6d44cso493607085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 18:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935078; x=1759539878;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qc5ocY3tSciWpBAvhCZm/2AVYNgu26K/bDoBWBIx65s=;
        b=KPDv14sRYsSc504HhCWwQ61WmzdnSjLAyqpEO8WK484Kx5rak8jZFZitjlXQwhAYdA
         djSB5vLeIyZqYpB2nbi4jC0FbXyxHGSrhZ9nOena7QdMXKOIVKJRJzpmcO4el3NsWHKY
         gzJHrsHLugOlGFWqcrLvGkE2b0/qlM5jRSZQY4jqLHXbL+H4wOBxFkxbCcyjzPNs6T1V
         8XNIvNiU9qKPuB6Ffb2ckb+I+3BvrSQwOQR4p6oDtlyxuSBqBTxd710k5DSC2VTsYXS4
         nwWkNkNnbRxxO5MsEKmg2tHDa1no0sqRxTdPGy5zk+YqX6ywEHvjUN403UJ1fAULYI++
         ZI+A==
X-Forwarded-Encrypted: i=1; AJvYcCW2AerD9EpWUehYYYPPLGC5+xuBvNHQGRuOoTuNArrCm+cUa3nCRO1sRza5pwWkjcPy2WxSV8IWxF6Pn+zY@vger.kernel.org
X-Gm-Message-State: AOJu0YzNGoxch344Cz1aDsQLxsC0VW4dtW3HRbALRAfMIrdVZdgw0zpi
	Q78viqWM2CFmd70pGboBzXN8IiO83cY1UGSXk2hcJUzVXaUu3z9kEi23cPorGgC7BRoWnKxMvi6
	B/2grgPAtIzEfE8v9XMYtS39kdWAR+mkY+JIgWvNnf3VpbigM8FQdIzJmheO6Cgslhj6O
X-Gm-Gg: ASbGncs0W2SjtljhcQ2sfHqkhVd0u/hgut/65bAG5EvCrryQLsQgXeuKzgwwiRColxU
	6OSvv0Dyz8K0BWoaPtXoHMBZOp8rb+i3mfnUAf4oZ+Hsk70zRf0+h7lGrYLzPgtZior2NB+CqUC
	VhmJjhrhDkZ5rGNdR2VqEpqRUOEUF6tpPgnB5JlHu+yVQcVi8RFL7Cdn84Bzbk0RICVokOvYcuo
	kmiPKE0Q3VoQad8RIUullosUlxjdyYmG+iR9CnpK+RrFOeyYskOoUKmy1E/A3/jJteKl7bdSY6O
	xZaV4v8RzKiGMCPbLwelR3sL7WgjWV9V8mY4Oki5VCb6lMsFwKx5wPRP1wgKx7aZCtvfJpNjuK3
	xgkflkN9g5tZpyaA4TyLS4LyfOHwkWysZPn2zzgaSmeTAlA/G4bji
X-Received: by 2002:a05:622a:4087:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4da481d940dmr135262531cf.17.1758935077700;
        Fri, 26 Sep 2025 18:04:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfLcwV5gyaQhWH6cMHnOYm2QjhypSrV9zAMf4Mjq0wafZNaibNe24/I99cJs5+682pxDxsRQ==
X-Received: by 2002:a05:622a:4087:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4da481d940dmr135262141cf.17.1758935077228;
        Fri, 26 Sep 2025 18:04:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/9] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Sat, 27 Sep 2025 04:04:29 +0300
Message-Id: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB0412gC/x3MQQqAIBBA0avErBsww2S6SrSwGmugLDQiiO6et
 HyL/x9IHIUTtMUDkS9JsoeMqixgXFyYGWXKBq20UaQtrrLJiRL87qPbOKHGZqCaDRFbcpDDI7K
 X+592/ft+cVBFNmQAAAA=
X-Change-ID: 20250927-limit-infoframes-2-6b93e599e79a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2197;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q78XSS/y8JtPNnJI6s3J7ArXOP9v75Iaz+LCtP6FojY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zgfvqV9tNwSDjjNu1bYmTuEZAt+bf4bJeYD4
 z1GvExeq5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4HwAKCRCLPIo+Aiko
 1YkbB/9JgqkHjaGTaOuUPOXbyqKe3xWoHX6CP+gZcmjWeLTPttNPll9tRPecwLTPJJzjqwb0Tpd
 eqnyT/OKyrEuPOjBZfBfYDV81Oe7BwMvlG9l+8UZrv7ek4sTJTW213DoX/sXyAsI9Pv4Xl9cAD/
 YZdFvqbUbR/PCDvU8iqBDjexW24uxIMybn+ywBSLeIRCCWkLYAkFXuvFTxTv+zAD/rqZXMfU/1J
 uxHBoTMU2CSIFXyngR6Ai9qcFLfRK8BZqqdUtMEVYvWvtKnlcfrNLyu0/IuFaKyobHtojURMCfr
 0qoCsi5cPINJIPi0VMgx0EIAwXBhbcnQKrtLOHJq5CDQ8gDA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: cwfE5F28NR1cIMYs7RSZVG6FL1RX21uW
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68d73826 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=BiG78YgtQv3mHEaFN1cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: cwfE5F28NR1cIMYs7RSZVG6FL1RX21uW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX5oitsbM0j6nn
 MVziZI7Wnl2MVFPsv9pxINCENFTkxQkQsuuv2p9qLEVUs/p3BanESstHIXDAfi/iWbjLMt4mR3x
 LKc+xhVLzFlJriTUGpf9JpfKQe6Ib3qXHCTZrGLHB+/vXC2fqov2zJXD+SGk/abyK7j45uI1adG
 A3GkrUZpkikySHtXpReTZBY1SXuQ45jXTp6gFwIMKi81BLMt7egFvDUsOjeQQI/zv8Px+sgicq2
 lrib9m8MxqWbxoXqiQ1BLXKoz4YkfuJJQOpP3Po5FjiKaGZf8xZgrJTBWA3wgwZ4tYCSVrQlPHm
 oCbRTW8vl8vQ7gTINr6fomcPzFF1/J4HgZ8trLwPT+xw6VEi4BboZWIsYTmcDSB5kOcjWZMdU7x
 htsSy9ZdME+lJHVKRFKktv0shLeHGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. Currently it's mostly ignored by the framework: it
calls write_infoframe() / clear_infoframe() callbacks for all frames and
expects them to return success even if the InfoFrame is not supported.

Sort that out, making sure that all interfaces are consistent:
- In atomic_check() callback verify and disable unsupported InfoFrames.
- In write_infoframe() / clear_infoframe() callbacks return -EOPNOTSUPP
  for unsupported InfoFrames.
- In write_device_infoframe() / clear_infoframe() functions warn if the
  callback returns -EOPNOTSUPP for the frame which is set (or was set
  beforehand).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (9):
      drm/display: hdmi-state-helpers: warn on unsupported InfoFrame types
      drm/bridge: adv7511: handle unsupported InfoFrames
      drm/bridge: ite-it6263: handle unsupported InfoFrames
      drm/bridge: lontium-lt9611: handle unsupported InfoFrames
      drm/bridge: synopsys/dw-hdmi-qp: handle unsupported InfoFrames
      drm/msm: hdmi: handle unsupported InfoFrames
      drm/rockchip: rk3066_hdmi: handle unsupported InfoFrames
      drm/rockchip: inno-hdmi: handle unsupported InfoFrames
      drm/sun4i: hdmi: handle unsupported InfoFrames

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c    | 20 ++++++++--
 drivers/gpu/drm/bridge/ite-it6263.c             | 27 +++++++++++++-
 drivers/gpu/drm/bridge/lontium-lt9611.c         | 22 ++++++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c    | 20 ++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c          | 19 ++++++++--
 drivers/gpu/drm/rockchip/inno_hdmi.c            | 46 +++++++++++++++++------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c          | 38 +++++++++++++++----
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c          | 49 ++++++++++++++++++++++---
 9 files changed, 202 insertions(+), 43 deletions(-)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250927-limit-infoframes-2-6b93e599e79a

Best regards,
-- 
With best wishes
Dmitry


