Return-Path: <linux-arm-msm+bounces-105281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON0BG1/s8mltvgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:45:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CACC349DAAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63236301F4BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D31176FB1;
	Thu, 30 Apr 2026 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCt3N4yV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIkSeOc3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEE336C9C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777527895; cv=none; b=cCSW9LL4dAoNxAQOg9LMKupcXAATCzGm5hzUAsZggHPaOKPlb5c4srYZIObfFL4GA4vnMA9zvppwwkdk8C8mRdChaJONauBCD8mBF82z1R+KsT/u8ZYuvKi++WCfx5SosppbX5IFd5CN7f0k8QmBJk3faQF8OeJXWt2T5MeY5Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777527895; c=relaxed/simple;
	bh=4QtVTf/kcp6PI2WWiINIQNaB718D1pAnUlaOldDVU9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IEV55t1/eDef+aZrGXM+2wPhwYiW7vkAFztY73j8Pf9ZSs70YG99efqb7UIGGJS15bItGqqTy33zEJF3PXOUmJu++hZG4hpw+4ygPresfxGfrY3yVSh6Wo1z8lhhOj9dvNEnYEK9ncUGqHH/27r9FpOjjhjkj3pzIHEHNi43Jt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCt3N4yV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIkSeOc3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TNeVjZ831469
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7TotAmjoMV5t/Ifey0XxwS
	1AKg+VW7hMH4YIH2Uj3Qc=; b=TCt3N4yV6CgZHjTXB68NGjXYV8qP4MHaNx7brP
	J3Y7uF6BWmug+0Vs8d9LT5mK98DcqeU/1s404p2Ppkp05sgPBMj7KX7bU8/+z3U4
	Xa2H37NQrkimN6Htf7JexHZeWCCX9stRddcXgi+xlNliKTct6H7vDpfIeexldIrk
	UCF3SmWXNBPiKb7T/+f6fM1hwx6hLhKweCGtnU5o4mJ+y6wyS6R5Rkzcm8rjKTln
	QY6Q2iYu/qe4EFTsDN4ihNQTIHiw9qc3KOGwqa79GR7WnVWAqHUcIX7QSV7xdusR
	KQeLeGfWaLxe27HCi0nAKcKwP0oGH/OzTtAzhzVb+EBD3RIA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duuvb10r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:44:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d9e67f6dcso1072780a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 22:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777527891; x=1778132691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TotAmjoMV5t/Ifey0XxwS1AKg+VW7hMH4YIH2Uj3Qc=;
        b=IIkSeOc3R+Hwna7QyyzNLiUCclhng88fSZioU3rHB2vNSQaA7M1wKP2ZCy0EXmExCd
         5jHPu6z5qFuwV3NHWTyCvRrfvUjAFyqNS9sgekV8h4Y8b+ieupoahY2WEfId6oOZnCAk
         8I1g8lnxYmRzZAJN8N7Dxqw4cL0/OBe7UZtYmHIK0aBUuPS7re6zSmGX2MrmykTmoiyq
         VCaLUGJuewXRWGx6KULVp2v/ttBtwsf6jRtfHp5jUWuF4/kuNkzrS7naWyfA5rxp9qCo
         fkaYC7Mf3yOqeX4A2/LY4PbKbYOpjIksnuvi+bTOl1qJhFxYlwj3ZVqyDhXd+AI74Idq
         fHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777527891; x=1778132691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TotAmjoMV5t/Ifey0XxwS1AKg+VW7hMH4YIH2Uj3Qc=;
        b=czGsKg2mlYe8cVDhrjP8wlbBvFgsdC7dHfS7jp0iWfHBjJFdARioF6nQScn0dr10pI
         nIezkT7QmHlfVn0u/s94Iaj0MHl3MISBWr+EjTKn2pDBzXq+G/6Ekm4i2EczVNX+VXgR
         U6jZ7xp0yyc7k2/HCcB8tbERjPT01wtIWrP2KruEV4/SxQGWXC2pvzKGqxOww1iafVWv
         wXDgQRt5M0eKPvVhLubGXBQfHgd4dMINy5XVdYM9wBSOYSkBjh8EgYgv4g6R27gVVBmP
         LrA40FaMT4D0YXjHgXNmeJ8424SRgmhiJxw3qb/PzVQqGrDHF3hlf8B5mUoB3e8rNm36
         sn7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9NkhqH8qd9dqvDcJgbtdXktPcCXXCCk/LRRx5CR3rDGZL4I4YjnV+NivXst+Zy6NIQfpaDuBeP1eDA/bqQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxbOEN7uZedc7ci+2vsmOAS/h52FP6kTXraPqfgISN4e8ixtSfW
	zVb5fkB4sTSkjRRj2yaz58xWIekV2P5DQriNxruPfHutyUjxWKJiD6eyKIV68lG0tF3iZ+mUZqG
	8LSH17qioFYY6FRUO29qOZXEwe87pICPlPHF2b0cQ9tAcQ2YA/90h9BgAGo31wiD/TlIl
X-Gm-Gg: AeBDieub//wb6rB3kNnqTUnzjYEhn2U+FgyuD5lSgg3uaSDfclhoc/aiJlRzvX9C/sN
	TK9X66dW+NaRhmfvkLPVu1C1wFF8jS9CS3a8C7VfPJXMfew+fcQxIJmFaVgMqvlnLurJHGJRrP6
	H6gzyx90uWEa5qnXsSbDDuC4YO/V61iAwntWqoAm2tt4AJvVkhpj/jTKg74e9OQPW/JDtoGPS1z
	IgzXJYiHPs73PqfvEzjLENM+r0l21ucoXG/wzV9qbcvcdCsPRL9TBM2QxgCHqNkQxwqO5Iy8Mns
	sOWMTLO6icJSIvCv0BLdaG/go6V+MSqQ0jizqM4K5kaLgt29WeKs8MxIBB1uN+7iNstQUMPPuQ5
	UfI7I1MVoCsCiPPlQaGSBPyOT0gD2Jv+wP5cTdw+Ezz53XQw6I1BaOSZTOoDEPefOaQ==
X-Received: by 2002:a05:6a21:339a:b0:394:5513:ce5 with SMTP id adf61e73a8af0-3a3cf8f3911mr1942717637.51.1777527891358;
        Wed, 29 Apr 2026 22:44:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:339a:b0:394:5513:ce5 with SMTP id adf61e73a8af0-3a3cf8f3911mr1942690637.51.1777527890938;
        Wed, 29 Apr 2026 22:44:50 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd64f21cbsm3955231a12.19.2026.04.29.22.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 22:44:50 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: [PATCH 0/2] thermal: qcom: tsens: fix temperature handling
Date: Thu, 30 Apr 2026 11:14:19 +0530
Message-ID: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9zOUe0OKcq3hI7baRBFsBcQmazgmokwa
X-Proofpoint-ORIG-GUID: 9zOUe0OKcq3hI7baRBFsBcQmazgmokwa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA1MyBTYWx0ZWRfX+t3mYEafoLxr
 eJmgc4ejcZDDK61tb1gWqfLu8VizEF1iV0Gv0UkalMJ6RmRupmVE/XLhuHlD9noakN3tlmojIeP
 kR7z2rgLU+sGlkDNVfQ6P//wb7/9/ttN1hXnfli6srS2OA3QCYhaieHGF2CqSz0w6gmD1pwUy1w
 OhY5DutpUwQ5mItwt6Vt96dA4GtZfRglodpcsBix0ukfp6YHYG//dCRF2yTiRrM7a42+HDhTGI/
 ndenqjWM4FxnTcfHpRDRhMFSQxJiCwtGrDCVz49nOFv16J+mJWN73DWn2xPuWJH1GXaMawe48dV
 omd526n4uGzuhDC0FUMPpuBVRNClO5OHvTGE9cT5f3MLLCGLzZsVH8GNrtOAhmkarMYsPCmQuof
 FKYY8UAgQruLxRhCVn4kTn17oWzD8Tg/Z+iykoXssg2Q0q3tksoMhCPuocySAWImzLgFCagxxOD
 TQxPjm6PsCZ/ROfUuvQ==
X-Authority-Analysis: v=2.4 cv=V+JNF+ni c=1 sm=1 tr=0 ts=69f2ec54 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EQKb40vYdxLEhVMbLbQA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300053
X-Rspamd-Queue-Id: CACC349DAAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105281-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series fixes multiple issues in the Qualcomm TSENS thermal driver
related to temperature sampling and trip threshold handling.

Patch 1 updates the temperature read path to atomically sample the
temperature value along with its valid bit, in accordance with hardware
programming guidelines. It also implements the recommended retry and
fallback behavior to avoid incorrect readings during transient hardware
update windows.

Patch 2 widens the software trip temperature limits to match the full
hardware-supported range. This prevents repeated threshold
reprogramming and interrupt storms when devices operate beyond the
previously clamped limits on newer chipsets, while preserving behavior
for platforms operating within the original range.

Priyansh Jain (2):
  thermal: qcom: tsens: atomic temperature read with hardware-guided
    retries
  thermal: qcom: tsens: widen temperature limits to match hardware range

 drivers/thermal/qcom/tsens-v1.c |   6 +-
 drivers/thermal/qcom/tsens-v2.c |  10 +--
 drivers/thermal/qcom/tsens.c    | 118 +++++++++++++++++++++-----------
 drivers/thermal/qcom/tsens.h    |  22 ++----
 4 files changed, 93 insertions(+), 63 deletions(-)

-- 
2.43.0


