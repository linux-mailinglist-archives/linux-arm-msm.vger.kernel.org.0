Return-Path: <linux-arm-msm+bounces-103754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDlkKPsc5mlurwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:32:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8C942AC34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 168ED3024907
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC90249EB;
	Mon, 20 Apr 2026 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OkjI+iv0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0TU6/UB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3192D39FCAD
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688316; cv=none; b=O6w/5Hax6ZzEr9A59hAi7dpfiJriAGqZ+BPK1678mVMXHxCQWTkRTx8HfeltYy8yzcHo3cYHb9EYEbZ5C1Oya7kH9veIdhtB4GBhQ3G1uIm+VL4QTbBlJmYhvj4Hk/QzevEsJpBjAduaA4RgJbhjOVecDEmpjrlmBbuKgdQSIZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688316; c=relaxed/simple;
	bh=fijNuC9FR1cZ4vpqQWPAtPUr+djgOpl0AYC6SN2xKEE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AjQNMQLPmIZ+Nnr+Qusx5Uz/OJms7qmSLnGsVKk3CrE7H0Lvwc8vysrpA4p3BfZNOZ5OVQc5QKcpZRLCEMGduvOvKjB+4bjCqNwexzQAU142LHCyZdiuDp0lmJzNJuFayxpuwh9lJhpKfVU82xdX+5LQSaz9ZyfcWQ3yfJa2odk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkjI+iv0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0TU6/UB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KAvSZC3015238
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eyXSzsk8PjP1o8Rxe3vocqKQDzDOHBKK7Gp
	9Aex3a2M=; b=OkjI+iv0RLHLiEVzjOLDxXLTbWrRCgGymwE+1ny4FecooC2QwpL
	yccBYzY7LFrldqHdK6V8382iaUdwUj+y9P9XNn72fKAJbvCctRZVFE9F6sHq5XRo
	FsJmAieRqF0IX+H6hV/nGwrwm5qRec2dlq4Da7ldISkzZ7oqvMgU2VxM1MXo9Lhe
	X+oZ1bsIaipF5Wfj4jTvx52Oiva+6l7samDDOy/qDOznGc9huu6e5U4Jq0GkN45/
	/pF9QxJXbWpdzlomaaZ7Htkz3sGes0bP3c4lHZdDs+t6WJdC4yToYvbJwczlThX1
	DmQnNXhvQvTz115JZz2uHQkNMSaQoHnCExQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjukr95u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:31:51 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-794b240c0d3so86203207b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688311; x=1777293111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eyXSzsk8PjP1o8Rxe3vocqKQDzDOHBKK7Gp9Aex3a2M=;
        b=Y0TU6/UBhLbXc0VZr+SFcNNxGYj/CVKqxFXUmXtCtRht+iL0vmmPsIclaqhc/CIhNc
         68gDEOkNX6zQZx7D5Lle6RqDgccvaTSL7uFNiSjcOT0xJSeHt31dDW11w9qhhopRC6K7
         fyrnammpPSOtutpFq2+zQQtAhJpIDrrNutp0N1ZBS9H6O8YQKZZq/Hg7iISKgcQeS2vS
         HvryBeE/Z+hUEu9B7vw2PIBnqhaVIrO2SVGy30DX1BUnkhircXP2u7YzxIGTDPWoyQCo
         tgsgOKE5WzOGCn7C1DGPyOu1XgA5ZGkpbbdzwgkR5eox5DBYQJVsUlPQc9lqZE1RiXXH
         tUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688311; x=1777293111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyXSzsk8PjP1o8Rxe3vocqKQDzDOHBKK7Gp9Aex3a2M=;
        b=fOGZrYM2Mq5M4JvvR5X0ywQY1k16AXVIW7NhiC0Z8/dfDzQgy7bIOMoLwbDDF0oj2x
         VLubEpYQ7mRy5nTnAi9chE6pdV0VgnGh1z9pq43U0FlTpfrPYbMzhROOjAZCX9vU1L0r
         KrlZgRZMKnot2kIIXpVgQ07/QRVwqglQjaMJPT8J6VCJilrfgUIt6nPY808VnfLFNt0Y
         0FfkQteLvgbudz1iA+I8lxWzki0UqjXZgVLbmc3jrlZFcvB4OQe/qBhrhYVyBjjmieNB
         uWDowO5Ja9nSTDGARelycYEu7kLQs5CT3qJJ89CmxWk4NRs7BhL4ByRiJ+WoJw+GFODO
         mz/g==
X-Gm-Message-State: AOJu0YxBFGnPoLwk10KWfU069EJvCmau5gIYqx8ZzVwtFHzuB/aK5o8c
	pNHXtD8C1lVyXuIk8tW/AcZA/yRZYA9Ed+pvRlUyx4aD2uBfZJL0iT5SP405r+4DCFcas9i36aH
	daTB/YvxL8i8C7MUSchf1Owmok1KFM12vs4rokEgXYcN2xy1DT07GcMto1ASC5sPXpRnM
X-Gm-Gg: AeBDiesXSYqWg89jqNuGm3wC7vmT4DW68K52DQ8MS59cP3unzLXb1RwfPsap69lQj0k
	gWGtvvkVuwCMfBodhM7Mhyf/qTBXQzm7/955s0ps0Furc59iaNl0hXDX1ttDgvHCTBkO+PtgX/U
	r0RVvoicaxcaROfIYlCT6LDDXQY+EAdgWkHu/exblxt8s6sfYqp47KKUtgGyx/Or5b6Q+qz65I2
	ZMtqflQJY0cP7G9MtnxDCOoT6mPycS8yxFF9WiwOiefJeL/Hs3sBXRYOzx2o33Hb+K2fFirvc9c
	Mu4wUnSSIQkQOH+/FbdJd/6YDaT/tSutmsapUQSN/f4kD15xYMR6zeWuUhdzglAGi/QKLNMR39W
	yi/lBgvTxZbj2+tL1VfMq+nHeYAbLCF1PldFJ8MtzonaWinawiHlWNUnv+8uB
X-Received: by 2002:a05:690c:14:b0:79b:e346:9813 with SMTP id 00721157ae682-7b9ed2ce09cmr110296617b3.10.1776688310656;
        Mon, 20 Apr 2026 05:31:50 -0700 (PDT)
X-Received: by 2002:a05:690c:14:b0:79b:e346:9813 with SMTP id 00721157ae682-7b9ed2ce09cmr110296307b3.10.1776688310218;
        Mon, 20 Apr 2026 05:31:50 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee8be8e4sm44014267b3.14.2026.04.20.05.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:31:49 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 0/3] pinctrl: qcom: lpass-lpi: Switch to PM clock framework
Date: Mon, 20 Apr 2026 18:01:32 +0530
Message-Id: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8ExOAq7KUT7E45io5a08nXMcNmjcf3bR
X-Proofpoint-ORIG-GUID: 8ExOAq7KUT7E45io5a08nXMcNmjcf3bR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX9e2h5Mx1zhov
 58UYeQwFqgRuJKkBKeH45zJjj1w+yO3IY0ED60aJ7oEAweNg1jsJi68FdjAOLOEOHCz58seZXtT
 kukZCrdqpxH1/uZrCjAGLaufV+SV/xd6qzpHo8DflfYnT/ek2eGVjIAj7dbcJaAgEQFHwMfumIG
 /W5BYlcPUZQvAqdQzbMHBVI845Kbtcg6MIQyAVZmFQrT+mR8NAyuWvrY33FAxxnF77r64yl+JKk
 qLNM5WYTcdU/DVe3AH6Y0BrIMql0ULQY6nTxZkXZfmUMT+38X2w6+xVvk9yRYWxZpoKlOI0Ws7h
 bNstogn6Hg6j4nBkGufdkxlDOArjXcPC3W+ehzP7jTuFRXJ566QTApqTh0KPPXlnikaUQXU307h
 08SrHJWyuNMzdILmAfw4QYdM9vrctLxSem4MRXtKhWH8D9ulApa18YsIppqEWY30KFfZDYLDXbk
 hZHPblCww1rijV7PuLQ==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e61cb7 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9dJ8MUsXuwlyAIs3VwEA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200123
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103754-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,sto.lore.kernel.org:server fail,oss.qualcomm.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D8C942AC34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series moves LPASS LPI pinctrl runtime clock control to the PM
clock framework and ensures GPIO register accesses runtime-resume the
block before MMIO.

The common LPASS LPI core now uses PM clocks and autosuspend. Runtime PM
callbacks are wired for all LPASS LPI variant drivers sharing the common
core so behavior is consistent across SoCs using DT-provided clocks via
of_pm_clk_add_clks().

---
v1: lore.kernel.org/r/20260413122233.375945-1-ajay.nandam@oss.qualcomm.com

Changes since v1:
- Kept GPIO helper return type adjustments in the runtime PM access
  patch and switched access paths to pm_runtime_resume_and_get()
- Added runtime PM callback wiring for remaining LPASS LPI SoC drivers
  (sc8280xp, sm4250, sm6115, sm8250, sm8450, sm8550, sm8650)
- Addressed style nits in GPIO access helper declaration formatting

Testing:
- Runtime behavior validated on Kodiak (sc7280)
- Other LPASS LPI variants compile-tested; wider runtime testing welcome

Ajay Kumar Nandam (3):
  pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
  pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on remaining SoCs
  pinctrl: qcom: lpass-lpi: Resume clocks for GPIO access

 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 48 ++++++++++++-------
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  7 +++
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 11 ++++-
 .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 11 ++++-
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 11 ++++-
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 11 ++++-
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 11 ++++-
 9 files changed, 97 insertions(+), 27 deletions(-)

-- 
2.34.1

