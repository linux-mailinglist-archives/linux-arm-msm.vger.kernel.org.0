Return-Path: <linux-arm-msm+bounces-108323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBbXKoz5C2qISwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:47:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A175778CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE077303E4F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8AF351C1C;
	Tue, 19 May 2026 05:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQEtp9bC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkhGmwAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B21534D389
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169646; cv=none; b=q4gbB/e2WEDCG1SCZuGOlrUU/GvQP0ZmyyTYngmnHNJmWZQ1LwqyMJZD1PPWdITxcx/fpAO7ORthIaMg6KIdlcGevJRcMwr5uhcsUtohEAbFnVRaLSus1Df5vVnjS8pf4E15UFieFF2B79H3nU3LSPOR226ZOLwfmf5F7RdRvMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169646; c=relaxed/simple;
	bh=AL+R7tcejSc17oERHvjpfVsvjomjIli7XDrAaoyWxNI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DdNZFyY/fi8GqrZCNd0hNklYH9M8qLNe+cMyCbGGumQRylbIJpy4ZuoY0pKCUKhE4lwnGYexa8DRcsZhaPTeNLeo/jF/cWg4VWSBDwXi1FKVwzccvCZJZcKv0qx7lSmlFWjGgKu5enXwsS+bRlx1NPPKSudiqceeS6Bkf+dGbDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQEtp9bC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkhGmwAC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4etYO1251904
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RIl/QjTRUfNuNHrFs+lzTz
	ox5ub4IH4cARGRfY3jhdw=; b=eQEtp9bCG4Rctt9TxaCwpcPHzqcPDEPkt6O1lj
	nihoyLAY8G65wkQFtiF/HWqLX0pSPb826QSHJlICDT7GwJZqjds06plGwNe+pyMH
	vFUW1M49PZ+23ac7zgc0OvXqjEGDjcZHWMsDWieH92ZMwctj/B42cISmg26iAGuW
	jo8ouglL1T6BfRZCjqAzraxOsh8qmmXlyOmKKzJE33TZXalTpz4IxgBHoYlJL3YN
	WcWBHyV8c+WC/h0rJpqSxAnq/oDqKY2UuRaw3nOyvGDUFPnN60bd0dtKxmwtKt2B
	4w/DHvBLVD3DcEiknnh9QiqSulXdGm1/Ppv7096wxo3AzNxA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0kj8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f485961555so15871403eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169642; x=1779774442; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIl/QjTRUfNuNHrFs+lzTzox5ub4IH4cARGRfY3jhdw=;
        b=YkhGmwACqKlrxm47iXZAJkb503FFtmqqri6DHsc1yKT2ybD6PxXK2liLnyaoHcZ812
         cNxCpcRzvqWp3B/44yidHrtFVVqKMc1SpmK8PTFlhW9Y1nTm4w7bmDdtjtIHyWQ35DIS
         o9J1yWNhOKmSqQ798d3eIEJKSbAyAjC/LmBFGQGP6EvJXWhtaRmQ8xE52+eTpqcU+/Bc
         zN0BbGFKjENmHuAToWgrU2FV5Qql1gaqdLEobbKwL9h0zcEVfBKzbCx3qnO9PrTBBtqP
         cTx/F6jyipBAly1Jw0iZYX/AremA+J/D9UL8zYOKowx1bc2FFz/Yjx7kp25LclNbGJif
         aCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169642; x=1779774442;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIl/QjTRUfNuNHrFs+lzTzox5ub4IH4cARGRfY3jhdw=;
        b=BnIRQf5O5iejoiG0nv9/UWWbKag+Mh6n7D5KeSKTEB6GNeClhN8r9VYtG3/yMplHHu
         zzCYDsE1MbrRFiM8g3js/48us4jiLvKcqkbpHLSZmn9AABlNgZXLZYzZW1oXkScRFJZB
         OIlq1KgMLpkf4MW5QyMNwQ8rzE3LP2rf1JuHUy7phj8ccnYC1SrXx+fg9Mf2jOczLjs9
         uRYHYsDXngfKC7F+ezwbmzWEOBm/JAckYL0LbCWXJcIUlVGEhnsZlVk+Nfmx7khMx6Mr
         PvKwpno6mB1oj1CJNs2CoTe6yxoIx1PCz11KYPE/7AwdeL8aaln7M1mcLX1Eh8Re2l3I
         9nBw==
X-Forwarded-Encrypted: i=1; AFNElJ9BIqxU53g2pv/N8lX6XSFIhWsilvVS0OpIV7zT0Fz/NSRI4r9x2M/QuRB/q3twcEv0cvANBR1ThCXGKxOp@vger.kernel.org
X-Gm-Message-State: AOJu0YyVwaiTHg+6yEalJl4/kLpFbyJJVyLgNX4gD3AJUAgbDX67ulhX
	2MVYBIQkWcdPRF5BYWtNorCsXFVj+kURBiXls4h9LmqZVzvKL7+lBPuM0fkWsKdrClAd/K4rF4Z
	HNO3y1Ks0oINDVqqJ6PdSuhUyG26SybdohEY0Km8WNynLLhsdTIttxsF8T5cB6dcFBcn+
X-Gm-Gg: Acq92OHDbqnDEbs/84+QioFf8NxwzDypt4Ehh0jr6h8Gcai3+N0LDaIKanaH1FxXO0q
	28o8ZPJcBH3/Nlki/PKsuboexcN2C+23spnm9WUcdR8gDqIcucSnvdLsY7JeFCd5TKTNwuExltD
	Zv0VoV0RT9FMTJe76/vsvGhzjIvuNPMreTHjxLWfF3gyulSJsXvaG/1x9312ydiw6Z0m23NyysP
	Lm2Qo3WNMcwSFGxwr6FY60JGHWcLcqYSYJi1YAGaq9LHFTryNoSzYrN4LUXLgteJKb1L8sdGpxg
	3Mh3JrfVDA8YLUeEiJv9tfH8Yy2mxaHpvRe3RYzUdKkQQnajXHX5+iAKu5AcFbWmWZ7fPFmC7fz
	DRlZfyAFM80+JBEy4dkjITVx0LvWrBttzrgaHeAuBTpgRwo4E7tCYntjPiLVOuqD6EhVU
X-Received: by 2002:a05:7301:2c8a:b0:2f2:32bc:787d with SMTP id 5a478bee46e88-30398637044mr7603072eec.23.1779169641771;
        Mon, 18 May 2026 22:47:21 -0700 (PDT)
X-Received: by 2002:a05:7301:2c8a:b0:2f2:32bc:787d with SMTP id 5a478bee46e88-30398637044mr7603045eec.23.1779169641218;
        Mon, 18 May 2026 22:47:21 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:20 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH RFC v4 0/9] phy: qcom: qmp-pcie: Add link-mode based
 support for Glymur Gen5x8 PHY
Date: Mon, 18 May 2026 22:47:11 -0700
Message-Id: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF/5C2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDU0ML3ZzMvOz43PyU1Hgg11LX3MDCxNIkOTXVKCVRCaipoCg1LbMCbGC
 0UpCbs1IsRLC4NCkrNbkEZBRUWVFqYSnQuhKI2tjaWgCv2FU7jAAAAA==
X-Change-ID: 20260518-link_mode_0519-708494cee2da
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=5263;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=AL+R7tcejSc17oERHvjpfVsvjomjIli7XDrAaoyWxNI=;
 b=5LnaFyZ6Hj3xMpKJv7wS389amXY+e+6Kx6IAgZS3GGYSuWHXzhVzNoezkYvui4vJNAgjJzQwq
 oeHvYWlOF8nBkvzRYcmrNY/nk3xOmNlND/MW0ZLUj6Gnoxm7RgyXqll
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfX+umSF2OSMkE0
 neZ0q8CeKTumjYI9lYzVgzMz5Z3efhNJgtSlXTLbRb4RW2rkv3x133DdNKBpwqbwke7T1orKz9t
 uE932iGU5Lh9Wpa6+pQS/bbflBMdN4O+sFNwcBb+ruURfeFyvouzhvqpNY5KlV87+5RWg5ldtH9
 M5bM7ZWPZa6x7R4OivGWSfJe6UJCZa6tVsN8wFWiZPJtLt+fHP9jxcM/DVzelifNF66hiSwlNvT
 rUiAEri8XQyqknWB9v2kKcv3iwWgLLVa3dhclQ0Y/mfndW/r+zvUh+wKDrOZchgMuizYaZsCO/L
 AAFmXjI7wtHWwAu7f98NOqh68mQ5+LBNz5CvS2ZhNc6nNzr/LJgdMZAC5BTdEr72DJgQECrBJVX
 8NF/PUqVt/SzKPOFpidEfZXv1+VfRv6ybXifT/fKAKCqSctLnnBIrnjsRnLIzn5nryWtcffumFa
 crvfJAxGodQtAHjJncA==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0bf96a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JfrnYn6hAAAA:8
 a=mDV7jF4A4kZc2-CVMwwA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: p9Tsq_QDJ8cH6Qfi8QxflN07_A6JJubf
X-Proofpoint-ORIG-GUID: p9Tsq_QDJ8cH6Qfi8QxflN07_A6JJubf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190053
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108323-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,infradead.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11A175778CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This RFC proposes a revised model for Glymur Gen5x8 PCIe PHY support.

On Glymur, PCIe3 uses one shared Gen5x8 QMP PHY hardware block that can
operate in different link topologies (x8 or x4+x4). The previous series
approach was not accepted, so this RFC reworks the design to better match
the hardware model and DT expectations.

This RFC focuses on the link-mode model and associated binding/API changes
while keeping prerequisite/independent patches separate.

What this RFC changes:

- Keep a single PHY provider node for the shared Gen5x8 hardware block.
- Select active topology on the provider side via `link-mode`.
- Use `#phy-cells = <1>` so consumers can pass logical PHY index to get
  different phy structure.
- Keep legacy (non-link-mode) platforms on the existing path.
- Validate mode consistency at probe:
  - if HW mode matches DT mode, continue;
  - if mismatch, allow only when selected mode has complete PHY setting
    tables for all logical PHYs; otherwise fail probe.
- Keep programming link-mode register during `power_on`, so DT-selected
  mode is re-applied when TCSR register may be reset after low-power mode.

Mode/cfg selection model:

- Introduce mode-indexed match data:
  - first dimension: `link_mode`
  - second dimension: `logical_phy_index`
- Effective lookup is:
    cfg = mode_cfgs[active_link_mode].cfgs[logical_phy_index]

This allows one shared provider to expose different logical PHY sets per
mode.

Impact:
- Keep existing qmp-pcie PHY operation flow (`phy_ops`) unchanged as much
  as possible.
- Constrain the new design mainly to cfg selection and provider/xlate
  wiring.
- Reuse existing init/power/reset flows with selected cfg, minimizing code
  churn and behavioral risk.
- This RFC is implemented and validated on Glymur Gen5x8, it is designed
  to be extensible to other multi-mode QMP PCIe PHYs, although additional
  platform-specific requirements may still be needed.

This series depends on a prerequisite patch by Krzysztof Kozlowski:
https://lore.kernel.org/r/20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com

Thanks,
Qiang

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Changes in v4:
- Replaced the static bifurcation probe model with a link-mode
  architecture: the active topology (x8 or x4+x4) is selected via a
  new "qcom,link-mode" DT property and written to a TCSR register at
  power-on. This replaces v3 patches 4 and 5 with four new patches
  (driver refactor, secondary PHY clock/reset lists, link-mode probe
  infrastructure, and Glymur config).
- Updated dt-bindings to describe "qcom,link-mode", #phy-cells = <1>,
  per-mode validation rules, and added a new header with
  QMP_PHY_SELECTOR_* and QMP_PCIE_GLYMUR_MODE_* macros.
- Patches 2 and 3 (multiple power-domains, multiple nocsr resets) are
  unchanged from v3.
- Link to v3: https://lore.kernel.org/r/20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com

Changes in v3:
- Add description of each power-domain.
- Add 64bit prefetchable memory range required by some EPs eg. AI100 ultra.
- Move PCIe3a after PCIe3b and move PCIe3a PHY before PCIe3b PHY.
- Link to v2: https://lore.kernel.org/all/20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com/

Changes in v2:
- Remove pd_list from qmp_pcie struct as it is not used in phy driver.
- align clk-names on "
- Link to v1: https://lore.kernel.org/all/20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com/

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Qiang Yu (9):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add glymur-qmp-gen5x8-pcie-phy compatible
      dt-bindings: phy: qcom-qmp: Add PHY selector and Glymur link-mode macros
      phy: qcom: qmp-pcie: Add multiple power-domains support
      phy: qcom: qmp-pcie: Support multiple nocsr resets
      phy: qcom: qmp-pcie: Refactor pipe clk register and parse_dt helpers
      phy: qcom: qmp-pcie: Add clock and reset lists for secondary PHY selector
      phy: qcom: qmp-pcie: Add link-mode multi-PHY probe infrastructure
      phy: qcom: qmp-pcie: Add Glymur Gen5x8 PHY config and match data
      arm64: dts: qcom: glymur: Wire PCIe3a/3b to shared Gen5x8 PHY

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 140 ++++-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |   5 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 333 ++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 631 ++++++++++++++++++---
 include/dt-bindings/phy/phy-qcom-qmp.h             |   8 +
 5 files changed, 1021 insertions(+), 96 deletions(-)
---
base-commit: 4359f733f8edf6be944b9f28ccb6a6c6e9a24aaa
change-id: 20260518-link_mode_0519-708494cee2da

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


