Return-Path: <linux-arm-msm+bounces-109573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF1PFor8E2qDIQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:38:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C28325C7344
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B02423009F0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 07:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BAD3D1711;
	Mon, 25 May 2026 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzhOOWa5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VdLTAb6c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB86202C46
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694726; cv=none; b=ZdotNm4uhSGigKL/xi67MaJFvjA60p02aAFc4Lk9o4oq9dVU3NOWwB3N7Ucr0pAsUl5zgoRxy8RF/9tZcX3YPhQ5SL04ldpuBj5hNp7/ZTPzwOZqr6Lfy8rcoTX/3hmctNzZtvypaV/xv6ceF8ijoungKhci39ccEoDf9YxTBy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694726; c=relaxed/simple;
	bh=6boc4WIzd0JfkKRrJIJ+H7SrTid2KQ0r4H9mW6NvyTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oe6FXOIiwvVhZ+oh0CRLZRnZA6j7CrTM+Z5ezvUFxNQLOwZMLoEWYs243mZz8eGh9P6UdhY/pZlh9hAVoPueXPXfFH9NKqfMKEJdX4+6f0TRBciTwNHvQqotOAqDqBjzMg60eWp+/98XVOZWcgFWE0LnpqaLLqc1JWypf4kny3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzhOOWa5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VdLTAb6c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6YK4Q281139
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SoPYeAAd9cGruMR0s+E8XXpcAyEuOT7yjyx
	PiX5/aHM=; b=HzhOOWa5lw0+fxNqQrhpEzl6OAUmGK6YhxBYc/MdRe+zoNE8sfU
	WRNLuhaXBkxjl11N/RfrJovXugnBglS+SHPrvhenbCfl1mfNyRlzXCmTCrf8SEp7
	Ilj5rNcQ5iSquY3UtYrnkrpiKTrMMjsgX1WYDoUnJigPNIJ3Boz0cZ0Rm6zVW4pP
	fK808dXkE1oBoO79dKl4W4XND7NOjn9vYF0sx7FCh9gB2Mt6ASrwD5XBZHd8G/rP
	a2UyavRsHFDS5qbZ0D10ZB9AYD0gaunR4cAnRyU39JJc8CWe+1TblzHs4kBrJZwO
	NEINjLRmizpepfomvA31W/ZDaJRDNT87PqQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3djhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:38:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30457ff05b8so2314259eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 00:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779694724; x=1780299524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SoPYeAAd9cGruMR0s+E8XXpcAyEuOT7yjyxPiX5/aHM=;
        b=VdLTAb6cg5VBZAYX5lAHiW0lNwITzuJ0tp1Kiys8kkkHk1nhJhuuRB9kpZ8Zs+zBTm
         twqTGgV3pw6WF5foK4d8sPiAG4ej0kOd+7lFaS2VDvhkAJCbV4mLAAvk/zyvBOCmRv4l
         p/8ddBATk74yNobQ1X2RZTKWhO6sg6Bth/CMzx8cT84Ry4mMIhhkzDDTPVVMFdeap/KV
         O3OQv1UaxuR3QluAUFtyvl12NChMnlGQsXCXS53DMLynxdA2pU9IzoAy8OIUzcJbQdyt
         9lHdTqVYlJWLn7AJ7InoRXkX6P+bRRdCvAtrlaJZZqPmkDvYxW4LVlbtrZfY1jkHGjcL
         ESPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779694724; x=1780299524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoPYeAAd9cGruMR0s+E8XXpcAyEuOT7yjyxPiX5/aHM=;
        b=m1InzZAXGr/2CtRhWYgn/V+gzKHXgn1WspljS2vT089RE8rH8xiXjCOUohPABFznR9
         sXDOT4y1pAUYfCK30w20oOOXXRsWhdfCV/G08/wcniy2DpOu4nGUAMNfbYOVURa3n5GI
         RMmU4juLQuwYqjVkZyB+n6VR3s5nq9apSigqp9W6k8q/6S7+1DPTslHHpaoVPkEV/HXO
         9pg3NlX5nR3peTC4O4XTlj8EQTWCLviYN4UAYbKDPPrsZcZyjwa0K8kxNoWTRJKRv82M
         8vJ7MsHVeadqPIjtE+CdCokRLHXdvw47ggzuyHEq8r0CfDojuvuyfLenLEHlnUOlkqzM
         TvuA==
X-Forwarded-Encrypted: i=1; AFNElJ/7gTESiG8omQ1nX1TJGSXuDSbkWhY5EYTh8jOVcB9EguifnX+tWmvuhCEZqmqjYv1vqHMLRAsFSNYpP5Io@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxqZ0fVJLY09db6ubsUH7DKmtoKFYjjIwR7FcyXdI+elSXV8v
	0a0WCi639ap6V3qqtRy3fBzIe+TgnMuRddSbPyut1YroiLYj7F3qdqIRYVGziPvkNis+mDP18O2
	S0VzcifuV75dvkfaDJwCUUIC2sxVpee3bcNwbVjKn2gqkNqbDxefDjf1VhPBIO6By/hKM
X-Gm-Gg: Acq92OFU2VtCxngdcSkcQdGaIR8wzxbcXv7nOAlPQosAOxod5Llkon2A12dGrjyQTy/
	eN+BIcm1mQP+LW4Ioj3rLFNqDxNol2PIH5lX6REZSwITBLa9U5ul+etTR+R6yf9l8X01CIYmslv
	QXfPmfY7PMW+QF0HrRuAWZJrINrr6cxikT1om3IDPm6ocLZchDBb7rNrZmZ3OHoWjdTjMKumyUS
	iYloRCHHcfmlqy4dj6go56dbKO654eXczess4jzOz29dG7wR0RB+g9xfV5bDSNe3OhpHX3384zR
	TFmWe7pTTHoF34oCpzaB4KE7YejMWXZW8R+exMSQgqyPXR1CCdjpkGjQTAl0VCINmWfiQyJQskx
	q6cCjfpOZWUGfx4wgz5ITV015zSykjD3hZ33X1iRtEh5RHe69+txt4SMLYRBeWUGPFbR/udJ2FM
	vCkazC+Q==
X-Received: by 2002:a05:7300:8b14:b0:304:8361:a87e with SMTP id 5a478bee46e88-3048361afcdmr1525663eec.33.1779694724141;
        Mon, 25 May 2026 00:38:44 -0700 (PDT)
X-Received: by 2002:a05:7300:8b14:b0:304:8361:a87e with SMTP id 5a478bee46e88-3048361afcdmr1525653eec.33.1779694723660;
        Mon, 25 May 2026 00:38:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef5492sm7113853eec.6.2026.05.25.00.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:38:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom: pas: Drop start/stop completion from struct qcom_pas
Date: Mon, 25 May 2026 15:38:36 +0800
Message-ID: <20260525073836.1579375-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: v2pyDejYA6dxE5IRUXKT7Gf02P6Q-cWd
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a13fc84 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=awQiEI349jCaSHzWWtgA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA3NSBTYWx0ZWRfX5PXCDBR+2Kvt
 eTDJR6dyS/xOzKEyhDmCSgGBL6Nwt1VBWTSPUClhupx58sQqqmoHjcxk+bPxqFxu5Z4j8A4omRP
 p92mmiHdrl9+brcfJGVvdgD0LknRTmn/S6X8uJuu7sO9igTGYnbyH/ZhUvnlqj5u4YNVDsph5de
 dvkzInZx5YZYZuWlvHRfu9MuVuME8LBYRuQSvvZrQyri0aDm/11x6leSrPHIdkWBHPCkMM93PPN
 MQ8BZ445lPfMKpOU4ItU20M6fGkUVx/R8N2rPABiQqxo3URqDYRwInuXVaKHcB1+YMdzkpCCSQu
 1mj64OpeOoD6u7laJhqB/5KvDoXy81cG5hY+Ttb8IZSOtLF33u4rFH02tvA8LpZH2+/C5KO5v/T
 2iJN6kJdIBslw7Oq7pbEGdeQoEAoVVWZhjueKJzqI3QCJOZAurDIX8tmfrWpl0xK3AUd//WnUKX
 yhjkCJo2AIVXIDzrVaA==
X-Proofpoint-GUID: v2pyDejYA6dxE5IRUXKT7Gf02P6Q-cWd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250075
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109573-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C28325C7344
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The completion start_done and stop_done are leftover from commit
6103b1a616ab ("remoteproc: qcom: adsp: Use common q6v5 helpers").
Clean them up.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..dfb9c58b67c8 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -92,9 +92,6 @@ struct qcom_pas {
 	const struct firmware *firmware;
 	const struct firmware *dtb_firmware;
 
-	struct completion start_done;
-	struct completion stop_done;
-
 	phys_addr_t mem_phys;
 	phys_addr_t dtb_mem_phys;
 	phys_addr_t mem_reloc;
-- 
2.43.0


