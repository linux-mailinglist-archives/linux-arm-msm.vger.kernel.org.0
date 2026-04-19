Return-Path: <linux-arm-msm+bounces-103626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEsjJXbV5GnZagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 15:15:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3332E424102
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 15:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A646300491C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 13:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5845D27FB25;
	Sun, 19 Apr 2026 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oy709ag/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9Lr/sV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8D8218592
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776604532; cv=none; b=D/ByhlJZLSAfBhueOTD68f0qJPEEGC30HWeg/9M7nXohpvmpyMumstxy1I1kVn+dx4hnn8htg2EI7encik5cn7e/uF9nub0m8kNydueH5b8isoVu7v/Xe3Ox6cdhT8L26mIEpt8B2O23aO/bhLJu1nA2cWJv/VUTv/OVywXmSzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776604532; c=relaxed/simple;
	bh=3GJTVkGWdKG/0u/D46r/zaehe+YudRxi0usu0JAQjPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VW/wWgtRKCqAHgQ6RT44ka0LG1VOOtEN7p/OH8Qw0twqlmVcHtOwlqt2QPmJ4FwpCVq6c7sZvCUaWsixJl/xIdOKuZoPPsoZtsxlt6Ej5G9SwEx7lxXQY4BcvcKYosq3gH9OqOrgLJqB4Nhg0zmxe3dAv8NeUMSqnc1pZgR8x58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oy709ag/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9Lr/sV+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J5YWAT3311323
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 13:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Vsv3SYUJiBgqh/SPcMBIsguD0aN7brwYVSK
	N4QZmS0I=; b=oy709ag/Yax71TZkufT/fqKWGu23xtAymdTfINM8stQkNbQr9kf
	kjDfLFaRbcSzR1Z+27GVh6Pvk9eaW7yEVxzijkuF/WNmGIIIdLsro1sEBpGXDnW7
	/adMhZ2vqufTDeCDPvwGRkDxYaWPbGdSGfCaxpD0pUIuDtVlKUyOhl4vLcQEyBAL
	spPJi1cLpvnshwwCNc4sQ4sj4oQX5Ib59RLh3mHRZ08MH4HhKnhLflMFLjJ3Cerz
	th+LIH5J1gcdEF3tt5zZ67eRPJ2//nKOw2pnQDHRl4Xga91uL8VpdIKyjUvIvoTp
	I3EuJKSqJMQgAQA2TTaSZD5cqR0CwhFseNw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr2q1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 13:15:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2dd6fb4c867so1160607eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 06:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776604529; x=1777209329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vsv3SYUJiBgqh/SPcMBIsguD0aN7brwYVSKN4QZmS0I=;
        b=T9Lr/sV+LIhKhWS/5/HD6HuAiihIMwYecpf8oAcaTt+yYBu0IkPcpafX0U5ho75SHJ
         PZnXw0UC5DIlCQyTs2IsS9f4uz3jvTlwQxuMX/4hsnvFjty2JydvA6wkyPkpBsD9knzZ
         +DR4ajKt1hm9l7BJDx3Yv20NZr+YRl+rZ5IBUB8FRWwpoOXOfc0pz6Dj7N+TxC6N34dJ
         lwptPdQctTnEV74omFZXniQoIpyxtsWqlrjEPXwZiCjckECHB2vgoEli86PQF0n1LKn/
         jvTAvzBg12oC/31qGfMnE0wBxARcFH6/lRad7E+gS519YUSdvkYgLzcP02HVVKS3BWIG
         8pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776604529; x=1777209329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vsv3SYUJiBgqh/SPcMBIsguD0aN7brwYVSKN4QZmS0I=;
        b=QJVloF3cT7hjJYQGk/aNTLWS39QlhVNnNC57YwdL1/4/LwfNp6R1tARLrVBXHEb6dP
         wKauwsblS5oYNzer/US3SElAMY1ejvkN7x/7trBUg4czKugll8zbA4h/MugYT6B/QjJa
         7IovYMMJHeg9AQnZnPvrjq8N5pXPgYOnlnnDsMPHg76KtqnmuhzMWcPmEePd0TD3tGCY
         WI1nDOEIpN+rmxkh5SQsKxqfTPGepokM2K/9XLcrtaVqadleEA8+Yt0PcgpgkaJIxqH/
         +O2jLVZB9KJv2wnqYtVY9SFtxbXH7rCGyXiHeZTWe5bos+jCclsBsIpJyz2nmM2C2BSO
         Spfg==
X-Forwarded-Encrypted: i=1; AFNElJ+qqhfCgLbTDpkGlz9v7WxW525jVELvhBLpHcKxljKInOZuch/ZQYkJ8VLg57XSzAFpT6sdOOq4q0YT4inT@vger.kernel.org
X-Gm-Message-State: AOJu0YwOIwe8YLoqn3Jx8PmaYTIJHKdl+mIjRJ/3Bz56ttjRTJ7t0nM7
	q9RQ9NWDXKb0mpHMrlCdiBYWktWn+zs+igN5xsC3+GeSK+8akVtO8fm1jxyhVoUCyqj3uiGhiSI
	v3VWRff3yxqGy+q3AEIpnHGn7vE0OkzOtlvz4zBiwWsHKEomOAKDpMyr2fvGzZjjJ1OMepjGLNC
	t/d1s=
X-Gm-Gg: AeBDiesP8kO7ekbqmXo/5Gx8PDAFQwoy2VObZzgrgFg1JrEyIiTAZV2mWd0JTAAarNo
	5N+OknQfEdDG5YEdW67RIaXLgnHCox85HES6dvUVvBsWW8Ojn5HPv7N1O5OybcqH7jfr4XFxjWY
	DeO8kCYSpVKgJxgv1Yi3gppT0CGu12E5HaosM3D38iC1JVvvHmwSuPGZwpevAQ9ZRc9pzl2yEcn
	hurz2dz0h4uUAttdQ+9dHo/CYOpgeR4zruu0Bjq4PvR8eN8hWJmOcF5mfA1BWpdbb+tO/O5LyLf
	nn+qqeDFpazKfWgK8GVaE0mfFPoS0TCGXd62eTF7SNxrkvwJey5E3K1urPF0N3n1psKC/ZtPKwq
	dBoBQ6AJPRUFwQ9P6r0neYFgEWrH/53MGhIT9UIUFYvV8iyYjOJ6fJ1+BoeDWBKTXJDITp/sK6D
	kSLA/drk6WVVXJGyyp
X-Received: by 2002:a05:7022:6191:b0:11b:9b9f:426b with SMTP id a92af1059eb24-12c73f9725amr4772871c88.20.1776604529419;
        Sun, 19 Apr 2026 06:15:29 -0700 (PDT)
X-Received: by 2002:a05:7022:6191:b0:11b:9b9f:426b with SMTP id a92af1059eb24-12c73f9725amr4772842c88.20.1776604528862;
        Sun, 19 Apr 2026 06:15:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749c46c8sm10362989c88.1.2026.04.19.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 06:15:28 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: socinfo: Add PMIC PMAU0102
Date: Sun, 19 Apr 2026 21:15:23 +0800
Message-ID: <20260419131523.1232835-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE0MSBTYWx0ZWRfX8ieB39e1jvhR
 DLIoa5lnP66EgiL9ae1T8yAhGVJF0wJWAz+6/UFX9TybbnhJz0gTiwUFnz/vJ5qdauHisI5/17p
 EPCEDY/d9R3zvJVb6qPjVgPFckmg1GgApTqj8oEm4WvIiqDw3x8rdj8FtRSFUZL2jpUFv9aWdLo
 9F3fZe/NqiSjBq5GhCecX6Daqi8Kca7SdMxSxwBGcwzlluzD7A8hz0KTb+ymnR+RMIbbKqrYOhk
 m+COvK8TtMaf2zhEy+6XLRFl7sL8a1S97cPGmmSaRAMfhgfjJGC7MDWb/npDiQcu01rUXtZgl43
 qEpIRRPp5yvv/sv96lyTJlgM2BT6UqBRWo5PMx9oCv4OqfoqwSWc79c+XtxXvV29I10k+hOlC/H
 KaEcoMAqPwf6WEmiyPA0gDw0fBmVJ0j9mUyaSeNOtesHA5DNU6r5JWE9xpYXBOm7qDPnaltENjo
 ga3XdmPGGMEC9+wl9wA==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e4d572 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=zb98Ush_G7Yu90MNSwgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 1PtByPOvd11dui8tDjRiFfdSJmTNcEaD
X-Proofpoint-GUID: 1PtByPOvd11dui8tDjRiFfdSJmTNcEaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190141
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103626-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3332E424102
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PMAU0102 found on Nord boards to pmic_models array.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8ffd903ebddb..f9b3c0037bf2 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -189,6 +189,7 @@ static const char *const pmic_models[] = {
 	[82] = "PMC8380",
 	[83] = "SMB2360",
 	[91] = "PMIV0108",
+	[94] = "PMAU0102",
 };
 
 struct socinfo_params {
-- 
2.43.0


