Return-Path: <linux-arm-msm+bounces-107275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPGTFDZuBGprIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:27:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C32A533087
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40050301953C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE546406296;
	Wed, 13 May 2026 12:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FRRLk1E6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Het0Y9o3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F183FFAC4
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675146; cv=none; b=pia3W2l5sgJz6AtFtmK4GyVj+Zk5iNlTX8g7rSchJQgIg31+ymU+OIACcE266wNdGVVUusMIiqSCyAVL9UPp4cz7Xvo6z/DKKmQz1eyi/bkoI2jZ/lDWaXoFr5Ddc2tccAXhPn1w9RRT38T4b4xchS1uHVTOrNHsz2bW7Z81WrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675146; c=relaxed/simple;
	bh=hgUS6WhYq/FeM9zVlSayQlXMovcd08cs49sDDGdfKEM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=CNSUqfvOxMgTyidQMI9UQeCScugzXwnpt8uVqW22rjiUV0ePrR70/vvPyWdCNnuyEDDpdY8jlkeFYHGQMbdv3onvTCraXvcWHM2+c77fUkikQAIl1LanEu5Sbu/GCV3G+j1wkdvsAty5Kkmpkj/DvX7hyyOD7QKlxmV9iWnq9/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FRRLk1E6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Het0Y9o3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAeBgW978368
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kz06LLvxrz87pZcw3mCLup
	iiX+M3Wbybhy62VcpJhXE=; b=FRRLk1E6Yxhzr+jCPzevx5PWdaz5iSivM8KPkJ
	R9zeGCVNyV1kvlpKm4C/mzVIDvAtirXbSXEEDosKcNN8rlt/kXQ1RzBzWpyK5ZPn
	sQKkR11VxHoWcqrhP7L5i2vAUbsm6k9y1sMbEtCEtOZxfdGgl/2jDW/Oenv2G/DL
	ZM95yz8OWbDnddp2t6wjh6z5Sl39Wl0MxoaY6vwsLzQ4pdNn/3w3fjMF9S8NnBNv
	Y2IuCMaimxuy8dY/5TR3vBcW7GST3MVHjWCbkVhmYW1UgNgvfzvKHGT5YITpybJS
	4zKQbDkvSc1rt/cmSsEVMZ4JEYDkFu7jheY3rBK0TuRFUIdw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9v74y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:25:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662990c03fso4691084a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675143; x=1779279943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kz06LLvxrz87pZcw3mCLupiiX+M3Wbybhy62VcpJhXE=;
        b=Het0Y9o3k7loDuI8uFxExt+S+H63RIVvRpG0wH2EMNCnYRD1gfxZA+aoNxx23pMiVH
         aig3lskzRfvZ/6ymbKgXeJxx1aj7AGp5BZI3TtTYOMAp78fhedT7wacS6rZ81/n44W4O
         zvIrTaf+cKBxOcmHvksCkY9MYHKbKKjl4lE6GbhJo94qXMaFumBfUhOcbVtGf10GaQ4Z
         BUugE9oaSqdsDBWEVQScC43Adf2LTIls1nmg9TF5xt6lyB0UQ/AMBSjunKbgEmHQX1Kf
         7y9aiPXKcs9yB0YfMCtPRAdZGOIkslDcvSss9ElipRnr715GG9fSrMxIf8nZq9W8Mf+6
         hf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675143; x=1779279943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kz06LLvxrz87pZcw3mCLupiiX+M3Wbybhy62VcpJhXE=;
        b=qE1ESXORv68YivIJoihT1VwNoDi22F6gjJfPh3MHAmAtiMKdL6cCnVKAdDNJ9GBiyo
         JI+JmRd0D+EwTh0AQ8wdo/1hih9ASrE8PgCYmemigqhB1apKcAHTjo1e/g4jVgLXx1tn
         boT6pcGShWluKpmpPlF3JTk4AFX9H9HTnJISyf2KI8l/GnTNpnZ9lBatqyGxtEbf60sC
         lQDtsorxwHhx3ZcCHGydYsVkFFOUkK52CWOxMq3FbmmvEKOmQEftGIkhsht40mGFi7W/
         +bjn7F2Ieh9QLp8pAUDt1jWIPuP8Yr9FV8nfXeVjpe6cIGYiGAXHl10IwC4oJwFuD6mI
         Oipw==
X-Gm-Message-State: AOJu0YwQMgJT7VkDDgpvaDmSgdDFVpNGOPkH2yymIIARc+/Hkmb2it1/
	kKlQcPtl5/UoMOpVQIdBMMUuEGBDoiwqhKO0JE6VAyHFtZe3RmYeFHuY5ouwg0nKgy6BAw8fORC
	sdYC20/sn+uWvjTVU7HIDZCyBSSktwIOYKM2U+aNAQpLyUT4LUergeR32RYgUOJtaZn4j+kz/mC
	cH
X-Gm-Gg: Acq92OFB6jNNUm9Klp4WUiR4EIjifNCLwLwEfYLoz1VM3jbuFkiBSQYDPNH2wjxq2lR
	MwFaUsIxGgznoVB2jzgj65Aaysz2a/RzK/PJUFPBFG1h1yQO2ptMy9muGX7vXyNsVzVIrY2yEh1
	/y1OC5LhQ+5AGVWMPxN+s5lWYmC4IUwqQtYvRaK5/tIz786dvCO9HUStOZOy7PPIHX9l2ZwWOof
	qXRTOzP42iVNdJH/FrSpRgHeSZL9nZLAVqD45ESBZWGaEJae6R85LrTakrRKYc4dguPNA17a2xj
	CnkQNwD0p7LXdOxKM461ChXuY/SMJqKJPIKodBtWtS4dX6H6CGQ2L9psL1ZwL/8HYLzGVAZ9rH9
	cb8qMuKGv1Fjc+1vMYrgKhjowCletaOfByu9TEqUn2ci/xZZZyg==
X-Received: by 2002:a17:90b:3a8e:b0:366:5283:cddf with SMTP id 98e67ed59e1d1-368f3d1b489mr2754579a91.9.1778675143096;
        Wed, 13 May 2026 05:25:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3a8e:b0:366:5283:cddf with SMTP id 98e67ed59e1d1-368f3d1b489mr2754561a91.9.1778675142621;
        Wed, 13 May 2026 05:25:42 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eddf4d84sm3651894a91.3.2026.05.13.05.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:25:42 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v4 0/2] pinctrl: qcom: lpass-lpi: Switch to PM clock framework
Date: Wed, 13 May 2026 17:55:24 +0530
Message-Id: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMCBTYWx0ZWRfX6nHqpJ8jVSK5
 PwrOCV5Mwy+t8pq/sJC11ANz+V6kVJd+zA0CGwUBMIRGIYFn4g0Xtny/yUSHJnaiOi96DobzgLI
 09wmjs3u49Pp704rP0yeLcYLSPr+8dHZGnUATi9u5q6y2liJALFKN5jzCWGiqK+XQa133t/KZH0
 bTnfGP1WLZ36caTfOIRimSu2MeQ1e2VaF1QS4ahC1u7U7XWSHLuAvzkkpoPWyz6h3m1CkeWJyHf
 i/+GjXnA3N9TyGp2dmX2Nlg3sGnNo1NzTBLOgw6krAbXmBWuGgo71g1ZrMXYXNoB+W2DJFP/esx
 6tgd3wqlrzhJkDJy3ilgjeKJt1pH4aprKmSJH/TTTylzhUBu4PlNWZMjd6YdrKJgjiU44AAC1J8
 c4nxbhLMfgTQo4v8B7pJ3CNCqa/hEeiav9xWg8SlFoRQhEcsuiUkwflzNpif7sQwjOTka+uJ+dR
 fegyc/PjZ0Nwse48WvA==
X-Proofpoint-GUID: je7SPTp2jiPJuX3Ju1XY4MGuDLZh3S0l
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a046dc8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9T1N9ULeWXxYjPfK8U8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: je7SPTp2jiPJuX3Ju1XY4MGuDLZh3S0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130130
X-Rspamd-Queue-Id: 9C32A533087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107275-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series converts LPASS LPI pinctrl runtime clock handling to the PM
clock framework and ensures GPIO register accesses runtime-resume the
block before MMIO.

The series is intentionally ordered for bisect safety:
- patch 1 wires runtime PM ops in LPASS LPI variant drivers
- patch 2 updates the shared core to use pm_clk + runtime PM access
  paths and completes sc7280 wiring

After this conversion, LPASS LPI variants sharing the common core use a
consistent DT clock flow via of_pm_clk_add_clks() together with
pm_clk_suspend()/pm_clk_resume() and autosuspend.

---
v3: https://lore.kernel.org/r/20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com
Link: https://lore.kernel.org/r/20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com

Changes since v3:
- Clarified patch 1 commit message scope to the LPASS LPI variants
  updated in patch 1.
- Explicitly documented patch 1 as a preparatory NOP until patch 2
  enables runtime PM in the shared core.
- Called out sc7280 PM-ops wiring in patch 2 to avoid ordering
  ambiguity in patch 1.
- Updated patch 2 to use scoped locking (`guard(mutex)`) in shared-core
  register programming paths.
- Updated patch 2 to propagate fallible runtime-PM calls
  (`pm_runtime_put_autosuspend()` / `devm_pm_runtime_enable()`).

v2: https://lore.kernel.org/all/20260420123135.350446-1-ajay.nandam@oss.qualcomm.com/
v1: https://lore.kernel.org/r/20260413122233.375945-1-ajay.nandam@oss.qualcomm.com

Changes since v2:
- Reordered for bisect safety so per-variant PM-ops wiring lands before
  shared core conversion.
- Dropped the standalone "Resume clocks for GPIO access" patch and folded
  that behavior into the core conversion patch.
- Added preparatory PM-ops wiring in patch 1 for
  milos/sdm660/sdm670 variants.
- Updated patch 1 message to remove explicit SoC list, drop "remaining"
  wording, and state that patch 1 is a preparatory NOP by itself.
- Updated patch 2 per review to use scoped locking and to handle fallible
  devm_pm_runtime_enable().
- Rebased on latest linux-next.

Testing:
- Runtime behavior validated on Kodiak (sc7280).
- Wider runtime testing on other LPASS LPI variants is welcome.

Ajay Kumar Nandam (2):
  pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on LPASS LPI SoCs
  pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM

 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      |  81 ++++++++++-------
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |   7 ++
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c |  11 +-
 .../pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   |  11 +-
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   |  11 +-
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   |  11 +-
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   |  11 +-
 12 files changed, 168 insertions(+), 47 deletions(-)

-- 
2.34.1

