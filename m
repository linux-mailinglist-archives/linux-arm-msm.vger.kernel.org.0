Return-Path: <linux-arm-msm+bounces-95681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPEFI8fJqWkAFAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 19:21:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0A1216F06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 19:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2287302A040
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 18:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7043E3A872F;
	Thu,  5 Mar 2026 18:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TcpQIZGQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHhbPVL3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2815D1C2324
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 18:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734916; cv=none; b=GvCzCcow2CS2pG/b7Fws1Wcs8kjm6K+W36yxodU9k3PtqeTgGFT990ngu8miHkjGvKEfB1Kz/GA2DZFxrn6VELIppanYQNfzutr1UCQ7OcPLv3RTQnUxWpwnnK6zF60z2Z7PWQtVGxZMe9c6dyXb01nUe1izDOSciEcj0WDmP6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734916; c=relaxed/simple;
	bh=t10gycm7XN6yp836FuswCQpUYixNfUW82DsaMspLZuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QzbwQ/3bQnjsXqTguE/iJJj/XeHWIdHDnK50JJ1YKpKTbNTtNSkY1P6bEe7mo0XV6MszI0DSrqISOl22FKRp0a1+Pow8CV0aN1fXP7mQCkQv7CfXLhydQo87u/e5UlsSl3EB6eVO8JkX9TafFCxEqFwhZDjJ7fJ9rQfmZUDqRzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TcpQIZGQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHhbPVL3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625CN5BR720112
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 18:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kzn/Z5bw8Ia071qhOd3mvT
	Rpo1/fZve5V3cUsd4M82k=; b=TcpQIZGQFaSUPDl3+IedSaeMSqdcfbKVf+30Lo
	YDS4btWhTW56WlQVFcRVkRr2jzH41PcLFmpv/5ZUElydSQBCx/QQMmmbfnI1aeXh
	wN1Q34IrBgz6dEkddJVwrzzfJqxzlcepViFVjZF0l9pjkK7GdGAg4LoREpSWTjTJ
	TCj6ETZfV1SODyPQnzFL6oCkR60UgXjYQkT43ZZ82wlYug9ImdV9l44dajXAWj79
	rEOKrbKm6g9ZBr0BNnYo06Rni9eo/fQ+oWMhjF9PH7AufaTIfCqoB/JjWZtFIipR
	XWZowoG2tFkA6dhIf0/rkenbraa415sZiZGzpu/NywPdBJ7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srh7r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 18:21:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae47b3adacso47539285ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 10:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772734913; x=1773339713; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kzn/Z5bw8Ia071qhOd3mvTRpo1/fZve5V3cUsd4M82k=;
        b=OHhbPVL3SrzhPh2xp6Aw2VYbhf8PpNadvdOXiwnYm07R3sgWy5IqqZZ+fUk0Oxs1v3
         6xfJeSJ9mHaQja7HF49AE+TBDVqSlYu9LeuMvGfXgJ4NmFMbIDDr2hGBT83DhdFeINO3
         mTqHYDfrixkNahmnuwrzduUKZp7jmxCJfOXI5/5DOtKiNQziAN4rWPAK5vjp4e3tKOfu
         yLgnIvZ038wjBDs1zdCBfUc1qaavRQ+d1sq3KjeAzvaiff+qaJptZTXKxHhUJW3eHnRD
         IdDx7/yDyGlpVHk3X4C1TAvijiik825/45uMLjZ4MW/dLRtdfUMhqaRzOdus4U0dH+RI
         nsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772734913; x=1773339713;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzn/Z5bw8Ia071qhOd3mvTRpo1/fZve5V3cUsd4M82k=;
        b=gqUUll5q0gFqiO05S2GKCSNIfrioZjlW5zzn98Xffl0iD3zqXMLuK9XZkLgtRZZ6hf
         hZ1CR3e2RSV1lveP4FlKr23XMy3LbNC3EAzW3/bfzy8/CAbwbF4vpzVjUxuxz4rIqt7v
         gl/D4IM/e2fn/lp+fGMuXHhEWMezsAi27GiWoJzKnDdHFmW9ZAZwsksFKdQBTavtNryV
         9hP/K86pgwwLKHP8iHVZE8xi7/50qag/94Gg5sujAs7WFiOLXEQK6yocFIDvgjb8CZlM
         NnvjjTzAxk5BK09NKCXVzn9+RA9SrxVIm7VFTh/S3fjBz6kAX/EqrJntAJwjuptj3NpB
         XEug==
X-Gm-Message-State: AOJu0YyXeWk5rSlzVX15I9mrOqybzI/n94vVptVAm+B0fk+TzKa2QXtk
	MGLgGZDouYZ1qZX9FtEq/vvILqqrAPoPLoZRYcbeWQCg0QC4oaNJasan1FrSn4RZut47RKpq60x
	ToBEABn8Xd6rKJmaVr1HbJ5UD4gBhrsCxH+V1T/4xQNAp8suvqV7hw0KFZ6M4FXvhxLEl
X-Gm-Gg: ATEYQzzyod7ahHFjsyJpNgTtaFOWdcxSrMZKrilNkN2iGN8B5X+I5BgZDaOK5i/V3CE
	d+oH/DQN167cjDGUHv3GPTI4D9B/FXqKiWP5U/79xcXiDOPjdbIkUXM0KC0vfn22X1fHfjBu5r1
	zNWInKGWffojI6TX4WPZWs1aKdpw6BOMal97QstiX4eKdCN/RJ//PWqVMGl0LpRRC+TCIRjEhg7
	fFlRnFm4V/0IbXQh36DlnyMabbHpX2gP5iH4OG2sMvYLqn3L4+LHAGP0pE4IlctbWvD9XbDqDOp
	UxdnD8zrrqKCqS3d3RjMhtNsk2zBzGEudoqpoPLV5da+JUKFVfKvWhsqqwng84TcIgVrkBZUWZF
	o2bcJxmXPNydsOHcwJXBgBpHXfT7AYk8B81jERjV/vgjXHg==
X-Received: by 2002:a17:903:3846:b0:2ae:5275:4d52 with SMTP id d9443c01a7336-2ae80292b1amr5866395ad.53.1772734912883;
        Thu, 05 Mar 2026 10:21:52 -0800 (PST)
X-Received: by 2002:a17:903:3846:b0:2ae:5275:4d52 with SMTP id d9443c01a7336-2ae80292b1amr5866075ad.53.1772734912343;
        Thu, 05 Mar 2026 10:21:52 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c183bsm238554615ad.24.2026.03.05.10.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:21:51 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 23:51:16 +0530
Subject: [PATCH] drm/msm/a8xx: Fix ubwc config related to swizzling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJvJqWkC/yWMSw7CMAwFrxJ5jUUI4qNeBXXhJC54kRaStkSqe
 ncssniLedLMBoWzcIHObJB5lSLTqHA6GAgvGp+MEpXBWXe1Z3tButeKi/8GHKQi3TiSi4O3jkC
 dd2a9/71H3zjzZ9Hs3E7wVBjDlJLMnYk5YSrpqMPm9fv+A99qQGKUAAAA
X-Change-ID: 20260305-a8xx-ubwc-fix-a7eda2dfb02a
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772734907; l=1645;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=t10gycm7XN6yp836FuswCQpUYixNfUW82DsaMspLZuM=;
 b=wP9Gmp7/cuBD9ZtEtl7gNjgUsY4RTnj0lBI/zX7KxJHHjUHQXjxTpoQzJDaAOkHT+/9yR7DZB
 6Vru41JFGJlCg1+Pvw1LU4jkTmufP2U2zkp2gY7QkrTX0+L1Ej+9m0K
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69a9c9c2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gtd1DNuhXpllK-bHf4IA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: oNKvYemQ9RWigtQFhvHKBlfun4PQVhak
X-Proofpoint-ORIG-GUID: oNKvYemQ9RWigtQFhvHKBlfun4PQVhak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE1MSBTYWx0ZWRfX17OWwuTX/ION
 4vaYNlXx4bONi0QlmaT/1+etTqYzLUoZwXDmPb139n4rMFFuvwSduRSGKXBHw0t+Ysv9rucjUdd
 UkaEHaa7Qg7Kylwwt5JooyZWRvWKQextXYvcHZQXEbK+NPHpEHYmBPjUhKze7acCEU7tvUrGFFF
 /1yAyvKnJSXJKCmInnvP1kHbD058XCgGV8EF6Q190RF/y4inhLCofczpUAL4Tt1nr9Nk3RHdf+L
 DNKMu4BRQ/s2sRLaK5CiMl8qji3hlYOfvQ6lHLNqYZ3MLeJkwh4MNhX+ESUSpk2x5dEwUtFTKYp
 ys2lG0BzJiJgHFqe/uLgwE2crsoPzC+YN869FQSCFESLnJA7caYUCNaVfRLL3zZrxg6iDp3U96T
 eHDYOiShBqgLSNnbbevgOEyji611/2xep2dlIjQ+2disJqBKIP2iEDCWk6O6DQ0sWPZ5HH1SLZR
 gBiQp04NEcwC1nzU4Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050151
X-Rspamd-Queue-Id: EB0A1216F06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95681-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

To disable l2/l3 swizzling in A8x, set the respective bits in both
GRAS_NC_MODE_CNTL and RB_CCU_NC_MODE_CNTL registers. This is required
for Glymur where it is recommended to keep l2/l3 swizzling disabled.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 5a320f5bde41..b1887e0cf698 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -310,11 +310,21 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	hbb = cfg->highest_bank_bit - 13;
 	hbb_hi = hbb >> 2;
 	hbb_lo = hbb & 3;
-	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_GRAS_NC_MODE_CNTL, hbb << 5);
-	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_GRAS_NC_MODE_CNTL, hbb << 5);
+
+	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_GRAS_NC_MODE_CNTL,
+			hbb << 5 |
+			level3_swizzling_dis << 4 |
+			level2_swizzling_dis << 3);
+
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_GRAS_NC_MODE_CNTL,
+			hbb << 5 |
+			level3_swizzling_dis << 4 |
+			level2_swizzling_dis << 3);
 
 	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_CCU_NC_MODE_CNTL,
 			yuvnotcomptofc << 6 |
+			level3_swizzling_dis << 5 |
+			level2_swizzling_dis << 4 |
 			hbb_hi << 3 |
 			hbb_lo << 1);
 

---
base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
change-id: 20260305-a8xx-ubwc-fix-a7eda2dfb02a

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


