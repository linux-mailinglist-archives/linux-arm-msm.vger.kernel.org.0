Return-Path: <linux-arm-msm+bounces-90430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH3RKcv+dWmDKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:30:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0197A8030D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E05B3007F7E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 11:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A78931A077;
	Sun, 25 Jan 2026 11:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pfmqLdEw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXQokvmT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA303191D5
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340615; cv=none; b=E76jjDo547lqI/GTt3DF8xicnXk0Lf7zAdBoBZk8HUAgzrB3v+kUPEqbzaMK9G2vpF1WNA2HzZQO3uWNOeDLjKxvpfvg8IGGSIw6yXgsVFXr6fYkd3pM3HqIW4n2YgEcUB1dgEYQNON8zSEj3jIuCnpuy5bLvK1GnGfuIQn8yNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340615; c=relaxed/simple;
	bh=yxvtY2TcUe9da2eqiOyfy+I+clyA9zCVHu24HYwUfeg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IhdYkMph9o40pBinX1sIKFgoGvEampTyAw4d4HARA6Qswgpl50+qQv3kG5D4XJsoWA/m7vZsxYQiZ1cjOGdysW2eERevgF2MpuUR4O3SlS2RjQQeQ+2dzpL3SY4PufKMNZHuHLfxFpBOsoyDQx9V8MDL+Ud/oIz47hTQowpxl+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfmqLdEw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXQokvmT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P8oHQC3692731
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mvGjPy27pCFkjdHDNHlNeC
	iCDhTG5RP93QvZbHsxxUU=; b=pfmqLdEwpQe3NL7aIbRXYAlchzEDdkA252hH/F
	8hg2CBLnyw182BbClxAN7ObC6+BxuRu4/bnFNEQ+fh0BZPoUf7RLWepaoLAe+aBd
	sEMOmnMesBsXSKVYzxXscog89ZgcCQEyYrRkv/5baQiAQC5oUFo9KAk+q34XIeVm
	eYfcXWdF96zV0YwahcSVIlnxb7CCvhzu2eA0mJm7wWClDtcKjsnO1CDg5Gvk57l2
	ET2WW+Lo7ck1k61n+kp8VeUE8fsg8SjzeGIJqnF9jxMQOsJlpEaVaEVn3q0bECpp
	wdDCcv3fdDbFvCBiG3TAT7lkALNpyg8wMnXb8Z6v1NnOR9wg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwty9fyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8946448adbdso118467686d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 03:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340611; x=1769945411; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvGjPy27pCFkjdHDNHlNeCiCDhTG5RP93QvZbHsxxUU=;
        b=YXQokvmTsvAeQDT1a8opeHtYOAGHtnN0omiMEzoPVl1W0KXCxgMVOiS3rtOQVTUJ+m
         k8y2znPes2UCxIliC8nsQp9hrO9VM2LxX5QW8qDEOWjkc9aDNI3oP+w5JhgnKaF26Xuw
         6UEqqJj/BjjxIyO0wDSdex5Txt3IgMEmgN4+i5fFCc1Utw+SLRJ+wCncdjzAusE7SZO2
         qGPvO9mu4J1fhcOoammfp2PGklHeeBv2YLrUmqPo1yVj90y9uQdREbgnmAvOH8HUDoUW
         TbRftxGSLFlrU79Zw4kfj8lDQjUAXRutRomcbzHk7NWInmhbz0lozPCKi7lLtbAjQmzR
         SB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340612; x=1769945412;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvGjPy27pCFkjdHDNHlNeCiCDhTG5RP93QvZbHsxxUU=;
        b=FU7PPphNwPky9uQkIlVRW19PdCc3vdVQXdsvEowsJVtQ3I0Xtv47FX2vL4aXpeovOl
         yf0bAt8PDt1LPYLa7HGfNIxElMZ2rB/XJE+yyMpqk467i7y13sHxTBIQKHBQmD2NMt80
         PS4Sm6AZb3z/d7hln8DErMiI7FyTp8p4+mZH2JwtyeYRX7NKyHDxeB1zUsfBs76Ahtt+
         Y2octzV+cKWnmymDWtf0maKuy2OjRPP0Xqbo/Mt07rhglLfnSIFYJNNgInIevfGwFvwy
         VzFRzAnIhMg/LGWRl0QX7OFfAscGDEiNp+AJWcunbd/9a4eTERT+ip3JSMhC1bazy6py
         Af+w==
X-Forwarded-Encrypted: i=1; AJvYcCV795LZP7yWV17Cu1aFQz5UDx+YHN1SCw9IJZLBKSPIdK/YIBziTMV7Z6SZc4/4ztZR9SS7K6PyzeQ2IPwv@vger.kernel.org
X-Gm-Message-State: AOJu0YwH02GButFuiKHbfKpyckV6RVIRMORc0jVwXjRfx9rky7BmfKpQ
	ClKWhvAIJFm7Jxx4BeZn1NIB1XxQ35xXMXKIWpIdsptMYhIEJxTLD1RfTrLRUIsHotpQbC/PLgS
	9EG7BcTcnhQrXgN/sXm9zIVYHt01gA0bg4jOktX+CtxObCaU/Y+qLfoKtEzkKbeGEo+usmVpzMV
	h/
X-Gm-Gg: AZuq6aISjGSsGnmZ/B+MJuVa8IUCAltGDr4WdQziHfuXa8UR6Il0qYu/mVQb3ith0c2
	AMxnClWBfq2IBBvFeUzDoqaJiF/1lc77jcBXUjC73sr2e5mX3XQExdg+D5XigaUoveHCabCWe8S
	TI7LZsqd6Mf76y43LMUg9fooHPei2krGx0er5brcyiyhsWfuMiDa21t+o0KpNN6zmMMp7mzsWet
	bDiZTN8L3JHcBJ7p4Q1XousUngrUkc9l92q3mhO9eUr9lVBeSk8Ctw9bGgJoatHO/GwGKRh8WY0
	fEsuXPiT7Fpi/OE+sgV+L1mZFaO9qeHjwihY7SE4AvHb10yjELGUqTnxd1BsJlokQdeEpy1I3N0
	RTzcjrAOI15VjKf08R3bts/GCkbehvDJB676LVHFxx2k2E/R+6lQwMq34qkE54PQRGpED8+KLmR
	P6KKdmUMzy8e4jeVyrPHBF2v0=
X-Received: by 2002:a05:6214:1c8c:b0:892:670e:e60c with SMTP id 6a1803df08f44-894b07b7e86mr14217816d6.68.1769340611592;
        Sun, 25 Jan 2026 03:30:11 -0800 (PST)
X-Received: by 2002:a05:6214:1c8c:b0:892:670e:e60c with SMTP id 6a1803df08f44-894b07b7e86mr14217486d6.68.1769340611183;
        Sun, 25 Jan 2026 03:30:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/9] media: iris: migrate to using global UBWC config
Date: Sun, 25 Jan 2026 13:30:02 +0200
Message-Id: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALr+dWkC/3XMTQ7CIBCG4asY1tIMPxlSV97DuKBALYltFSxqm
 t5d2hWLupnknXx5ZhJd8C6S02EmwSUf/TjkkMcDMZ0ebo56m5tw4AiMAfXBRzo1b0MBW5SmaQT
 TjuT9I7jWfzbrcs3d+fgaw3ejE1u/e0piFKi1CmQtrbGqOY8xVs9J383Y91U+ZMUSLwFRAjwDU
 kjU6FpQuv4DiBLAEhAZQOTagAOFrN0BlmX5AV3o64QrAQAA
X-Change-ID: 20260110-iris-ubwc-06f64cbb31ae
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yxvtY2TcUe9da2eqiOyfy+I+clyA9zCVHu24HYwUfeg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6+PTUsGvtXPFQGrsOHTPISCh3U3cXBSjbQv
 x4loN6j6VqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vgAKCRCLPIo+Aiko
 1RkBB/9g3KkwEkAJtt3dPWgX3Onu6us4HIzLBdpWi6pwUkmdyJRsfNJ5wM/IRUvP5lwERwSctcL
 rohYYLsxPRbtDqSU7ffnD8bLQ47mac9BD4iiLwc+PKUnw4eGobMk9oHnHNFXHWtjVirjIu4AOGv
 E4b4iYzrdGbRp4HF4ZdrXt8ziR9fcG0vw1c9mzexGdexfre7yySIzcdb39c5HpXD4OIJhyyFD/h
 EnYSa8MdO+oRknF4IYQEnAa032FYoQNJDK5N5ZU1NELxMAXtw1UeXFfWlLzpDC0b7pKPp8MDF8L
 bH/OgXuJnSxOkxWFSASL0ONMGvJV34tYWLzgtg3KseD5mtVR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3mzxR3NlIiYvchCmzEevW-dnbTbZPSH7
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=6975fec4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 3mzxR3NlIiYvchCmzEevW-dnbTbZPSH7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfXzQbFQgETDwBo
 C3Fc3HeJMq0vsKEQlUlA8L8ekTpJuBjkmvku/wNPIeVotCdo4SloeLRrC+s6RbF6YlGQ8TuBV4A
 Dr5AWlbQNVdOr+0S6u5hJBEtDdJ7Om7IwLo66ZOh4HGvjQ7cobETXLvzRGDc5FTyMVX5BAOYzz7
 XQPzwyNTRcPT/cHUuRj3P0s3ArFjgCNq8xPAfWeaBsFSwat/LxiJMeLoYenz8ao5MTe2PwSjLcZ
 8rWcBk9/JZQvmxy2pRQa3o/Tn1EIp0sI/DVm83/jWcfHeWjIPVcMygNNyMk7WwhovruZ49GKssL
 /et1b+QYhjUCbQwCkFwChJkJzMK5LvthVAKzRoyJ3E2KGPq5YKDCh2At3aIzUiXoJ8gC6mvapwN
 zo/pu+2JYPheMMMESdS27QXtJZLjgRBS+ph0QzYbFJShPGhnQ+WxfmtXgQpKINgyE7XAN4e8A2A
 lkjv85EzZHBPofRbHrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90430-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0197A8030D
X-Rspamd-Action: no action

Having UBWC configuration in the driver is error prone. For example, the
driver specifies fixed values for HBB, while the actual value might
depend on the DDR type. Stop defining UBWC data in the iris driver and
use the global UBWC configuration registry.

Merge strategy: either merge SoC bits directly through the media tree
(with Bjorn's ack) or merge to the media tree through the immutable tag.
The drm patches will follow depending on the way the SoC patches are
merged.

Note: the patches are compile-tested only because of the lack of the
Gen2 hardware at hand.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Rebased on next/master, fixing the conflicts.
- Link to v3: https://lore.kernel.org/r/20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com

Changes in v3:
- Dropped applied and unrelated patches (they will be posted separately)
- Include printk.h, decoupling the series from fix picked up by Bjorn
- Introduced additional helpers to retrieve the data.
- Link to v2: https://lore.kernel.org/r/20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com

Changes in v2:
- Extended the commit message and added a comment for the min_acc length
  helper (Konrad)
- Link to v1: https://lore.kernel.org/r/20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com

---
Dmitry Baryshkov (9):
      soc: qcom: ubwc: add helper to get min_acc length
      soc: qcom: ubwc: add helpers to get programmable values
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration

 drivers/media/platform/qcom/iris/Kconfig           |  1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 18 ++++++++++------
 .../platform/qcom/iris/iris_platform_common.h      | 11 ----------
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 14 ------------
 drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++++
 include/linux/soc/qcom/ubwc.h                      | 25 ++++++++++++++++++++++
 7 files changed, 46 insertions(+), 32 deletions(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
-- 
With best wishes
Dmitry


