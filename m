Return-Path: <linux-arm-msm+bounces-97077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCEuFmrOsWmQFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:19:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA218269E84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0339B3091B1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 20:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C9538F255;
	Wed, 11 Mar 2026 20:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcPc29Xo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FT+2Unnh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF2938E5D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773260271; cv=none; b=OX5isxVfvPoDKe2M1BPyQU0Nqsd8vWYqwNuKAK89uNYpaAQFdI0U54haDKmmBVpPTK9+/e9LIQJzUXlbqIgLxUMMah8Jls4Xqmriy9NGAiUwXVCsymx4Tm+qeog69QWCmlAruZWq4O9nNHU+kQ5nvX5bIix+Vb5Cs9TOCnU0L/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773260271; c=relaxed/simple;
	bh=HFld0pGzK+gfRaGsz97iqpHu891+p4M8R3L5EByimK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zw2D19tDKemz+jP2E1AWJbIqZWJpuDDZpx15ZteG4g/s1k0bDHVR/ufWmZ9UkSKYQ/wApzfaVq46fo2q2kglWr4/ioOqWFlyyMfMczT2o59PTaUdDZhBXd1MyXkPMk4VX9mQOz5WsFnn57LUVsMq52jtC7oYPfW/WF6YUcu94r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcPc29Xo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FT+2Unnh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BK7BLZ4032630
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5D1PWw6dwGUNePclrhAZ7JX6Zeom3TPhlQscH1nfVp0=; b=OcPc29XoF0CKBW9N
	tAYcb4AJrSY79XBPol9uxjyZfSRbplljRV1nJ03Eh2pC7DrbR2dHIupukozZW5vR
	sOU3zF+/7KCY2tMk0ZqH2peYxchg+qbBfnUz/giM5Sdt8szufY+a70FPoX1E6WvQ
	G8z6/pgFCBx+cWc01/vsOlBsyArn4YBMbYFy6uUiViH9tCuTJM0s8ecwoaQQhEir
	w4ZLEadlQrErS0ZWpEiMVW65O+W8TNeBBxje8phw5/7ux5VWSnP5q7pLmV/wYRRQ
	u/2GwH8QqeYv9G4R9fsDynX2G3EoD6OadepZLqsxem6iGxsMRjsaFVCs+yZqatIz
	JDgHMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu90t9j5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb52a9c0eeso198050085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773260268; x=1773865068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5D1PWw6dwGUNePclrhAZ7JX6Zeom3TPhlQscH1nfVp0=;
        b=FT+2Unnhf4y7nQ3ojkOQbMM1K+BgZ5TXC1PeRPfPEs9uizpe0ZtbnwcxCvegKyhAMx
         luAYwH9M9x0RNJBGq9nc6uQoHOnf+FOk7lRla31ZetTBj3ggfABpMXzV4yx84gTXvicf
         jz9EhMHvRlvFi+FdXZ5a0umpIXmHckFv0DjMrgtXEydMagat01na2oOAl0XZEdkmmqEC
         J5DBgmF8KFurmUqwS997cfxhEw9rCn/Cenbfg0A29jeSoD2xQi334wqILknsuF+qNKb0
         ZXE1YybXQFA+PCFvDJb2EtPP2sh4U39aab0Vx6anoJnDqr2Uqxsxg2RXThwGIQj1nNSV
         67VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260268; x=1773865068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5D1PWw6dwGUNePclrhAZ7JX6Zeom3TPhlQscH1nfVp0=;
        b=ECc0Vjkkm24wipD0pc2b7WRoL4BaFbLwqn5yKeOe0TTfa+0KkI7W0KhWl+/dmYgOzD
         aaIkDtG+AbcJ6NgsIIKXNg3pP1EKnlUCO3bsit6XVnUoptmGCCS3Uqshp3fb/TrfaAvJ
         rEz6RUeHhZ/e5WSmH6fkuwgSVa01f3GX0y6QdX+atPv8j4pL9pNJUhWlvBfcjfEGW19f
         eNcwhEYT1O+R756Tf+8SpAT/cUainbD2RKLJe7xnfeevTNT2DjNk4LACKjJyiKGseLe2
         Zm3Fe+f05bRXM4HLmKkFSHlGkKF39RYfRK2lreVGiUX9fxW69iS0UP3xfzA6ZyOeBw9u
         3FRA==
X-Gm-Message-State: AOJu0Yx6wJ0s7knxMbWTKIS09eJ7HU6V8l5uYg1eu9o/sPSPApkw1Yg7
	YL1/xqLbx2vte57Y0BlMyfCNoHpo+5kaUrnaY9HQEjRmcG32LM8TEncXSYgUU9j9FlUUyVyJE7J
	mtU0AEkS4chdlppgGGkMmnlKdRTD/TQwqxMDqEMI2RZXP4K92O3Na/T7VM57o/TA0DeQz
X-Gm-Gg: ATEYQzzfU8V5/DP4rXQiT0iPIESn2fidlCdGhmjZXiUvQ9/15D07k/ZGNNzrHV8VAGd
	EC/hGSgimr/WFv/qXyou6uPzzoG06dDzdNEM5nFXxaRyp3vFPnRdzhPFvG+Ets21U9Eyv8tTWzK
	r9JfPjGtO4W5JGckojBea4r/jDgngJxzCmGx3WwisvCueKxMAoFajM6Q0sqp7XtjR6xsNE5sDfv
	DW9b+w4aYV1kmgv6EM7F7ym32V/7x4ZJPpd8IVUic3Eu9khbS2HT4pIhmDOOEFgYrZ1uv94ryHN
	i7mmZfqF4fdM+cgLqnAUX46QxeFy8uevoznUa5D3S31maITxR0Dlr1VGmFM9hBI8I9phmh3cFHD
	dNbDP4IrrfKh4YjDGEa+RhX7YcT3JuCFgcoDxwoc0Fm2r
X-Received: by 2002:a05:620a:448b:b0:8cd:8a55:5118 with SMTP id af79cd13be357-8cda1a3171emr523156685a.43.1773260268055;
        Wed, 11 Mar 2026 13:17:48 -0700 (PDT)
X-Received: by 2002:a05:620a:448b:b0:8cd:8a55:5118 with SMTP id af79cd13be357-8cda1a3171emr523152485a.43.1773260267614;
        Wed, 11 Mar 2026 13:17:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm79257255e9.10.2026.03.11.13.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 13:17:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 21:17:30 +0100
Subject: [PATCH 6/7] drm/msm/hdmi_bridge: Simplify register bit updates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-drm-msm-hdmi-cleanup-v1-6-c5535245f6de@oss.qualcomm.com>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8132;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HFld0pGzK+gfRaGsz97iqpHu891+p4M8R3L5EByimK0=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGmxzdui7HiIP9Vggsu0TMdxFdLFK2khXiuGgxNyOMroUlZ6S
 IkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpsc3bAAoJEME3ZuaGi4PXsAoP/iyF
 1luTYLf7jLW+y9QDBWpy73TGPrtBKFqExUlgmBbL99PjWr2CB4b3GSS+NryZv7+A15KbIW+MG4Z
 sz5VXzhXfUPaYlE1s8RBYhj0A4Ci4MaxLGcZKTcz6f6Q/05OuNbIo5HSoKjUPRTsD/xjwmBJVXm
 +HwEwWdyGdW05uRObvHEWywOpBNUxp8CacqYdAivujq3xeJ9DtN6gbxnQft2P0bFetbBxVSejZO
 jIZyKZV4KUkwY0ArhJyacGRNlMuZrjh2srm1IPbeG+9m96c5PP6z+NYMjVItHA18MbV3DNKHPxW
 btgJvugnIWGEPu1fbPc1JVSq7KC3GhuXGEOMksEGWwPI9AuWsHSm/dmBgKqRZCBtgUdxPKO5CeF
 4BF948n9OYSLWi/RBEN1VLTQgZ83tpVhOv+ArYVYHpGAwVgm7kFH8fMV4UzZg+S8dX31uoxmNPn
 5/QEyAFUP8SQydzGlCId/r13yaoD6JpCYv56db9+cVY7La28vs+rTyqMflcb0taVHaCKG6MkwLN
 Y8k4I1K3nPLv76EiSUy3jnCg73UXSjdvgeqX3KOY01/s8n+k4U4IcqNA6nhc20x5pcaMomqOUp/
 fsB75aYVKHh8a05yuWyD9d9xP0WEy5ByopKcbRHLqak8TEApdjK+XX9A+iO6Ef7t/fN+eUQMGPM
 sX5VK
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 2H-WXW1VDObLUhMPSEJ1uNSkbNPd9Jzh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE3MiBTYWx0ZWRfX6YWrA8I0SmXI
 /Ff+kfYi4gzOu0XDJ/tRJs8WlSnAF69KoMNgkmSfYfMYdZdoKIXz46lhM8B2Fi8MvCH2ap9ucSr
 yf9LPaYxh/u87GqiNsuO0/nSf7hLxESBXXsGjd1umCawPlK0FG9TMaqmqAdh3x8bbnwvh7M1OWm
 DvI0ifNwzDP57otOfpN8HiQMM2vuxh9hzrl8DB5zvo9gRBSlkr6S8bnQ9LhqefYmJaF2ki3yIZI
 nSI2vC7vl+Kcahtvqi2A5NAUJgeSU6S216rsIzXNhNDaOBjkNMBKfUwchhbxtAKAfAvIUR/Epvn
 qeAFI2yPF6/AyPXeLBE/OkWBTjXO+nMMClCcG3fjgpz/JFdq2Ow9ZPOdV7KFLF1a6ilsilvA1SA
 MtimeSJc5ugCVK46pLjjIdr4ACWi8+r+otSmSG9GhvgzQGU2Uj+eOCuJzg1GL9JrFfrEkafRUAG
 nY3yvlSfwlFhjlCq/mg==
X-Authority-Analysis: v=2.4 cv=DfEaa/tW c=1 sm=1 tr=0 ts=69b1cded cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=aOjUM9GFJvKfr9THBUUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2H-WXW1VDObLUhMPSEJ1uNSkbNPd9Jzh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110172
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97077-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA218269E84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify reister updates (read, apply mask, write) with a wrapper to
make code more obvious and avoid possible errors of reading and writing
to different registers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 19 +++++++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 98 ++++++++++++++--------------------
 2 files changed, 60 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 49433f7727c3..436d4f9fe346 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -112,6 +112,25 @@ static inline u32 hdmi_read(struct hdmi *hdmi, u32 reg)
 	return readl(hdmi->mmio + reg);
 }
 
+static inline void hdmi_clear_bits(struct hdmi *hdmi, u32 reg, u32 mask)
+{
+	u32 val;
+
+	val = hdmi_read(hdmi, reg);
+	val &= ~mask;
+	hdmi_write(hdmi, reg, val);
+}
+
+static inline void hdmi_update_bits(struct hdmi *hdmi, u32 reg, u32 mask, u32 data)
+{
+	u32 val;
+
+	val = hdmi_read(hdmi, reg);
+	val &= ~mask;
+	val |= data & mask;
+	hdmi_write(hdmi, reg, val);
+}
+
 static inline u32 hdmi_qfprom_read(struct hdmi *hdmi, u32 reg)
 {
 	return readl(hdmi->qfprom_mmio + reg);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index a9eb6489c520..b6ca334fb9fe 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -58,16 +58,13 @@ static int msm_hdmi_bridge_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	u32 val;
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
-	val &= ~(HDMI_INFOFRAME_CTRL0_AVI_SEND |
-		 HDMI_INFOFRAME_CTRL0_AVI_CONT);
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+	hdmi_clear_bits(hdmi, REG_HDMI_INFOFRAME_CTRL0,
+			HDMI_INFOFRAME_CTRL0_AVI_SEND |
+			HDMI_INFOFRAME_CTRL0_AVI_CONT);
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
-	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+	hdmi_clear_bits(hdmi, REG_HDMI_INFOFRAME_CTRL1,
+			HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK);
 
 	return 0;
 }
@@ -76,18 +73,15 @@ static int msm_hdmi_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	u32 val;
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
-	val &= ~(HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
-		 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
-		 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
-		 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+	hdmi_clear_bits(hdmi, REG_HDMI_INFOFRAME_CTRL0,
+			HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
+			HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
+			HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
+			HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
-	val &= ~HDMI_INFOFRAME_CTRL1_AUDIO_INFO_LINE__MASK;
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+	hdmi_clear_bits(hdmi, REG_HDMI_INFOFRAME_CTRL1,
+			HDMI_INFOFRAME_CTRL1_AUDIO_INFO_LINE__MASK);
 
 	return 0;
 }
@@ -96,13 +90,11 @@ static int msm_hdmi_bridge_clear_spd_infoframe(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	u32 val;
 
-	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
-	val &= ~(HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
-		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
-		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK);
-	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+	hdmi_clear_bits(hdmi, REG_HDMI_GEN_PKT_CTRL,
+			HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+			HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+			HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK);
 
 	return 0;
 }
@@ -111,14 +103,12 @@ static int msm_hdmi_bridge_clear_hdmi_infoframe(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	u32 val;
 
-	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
-	val &= ~(HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
-		 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
-		 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
-		 HDMI_GEN_PKT_CTRL_GENERIC0_LINE__MASK);
-	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+	hdmi_clear_bits(hdmi, REG_HDMI_GEN_PKT_CTRL,
+			HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+			HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+			HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+			HDMI_GEN_PKT_CTRL_GENERIC0_LINE__MASK);
 
 	return 0;
 }
@@ -129,7 +119,6 @@ static int msm_hdmi_bridge_write_avi_infoframe(struct drm_bridge *bridge,
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	u32 buf[4] = {};
-	u32 val;
 	int i;
 
 	if (len != HDMI_INFOFRAME_SIZE(AVI) || len - 3 > sizeof(buf)) {
@@ -153,15 +142,13 @@ static int msm_hdmi_bridge_write_avi_infoframe(struct drm_bridge *bridge,
 	for (i = 0; i < ARRAY_SIZE(buf); i++)
 		hdmi_write(hdmi, REG_HDMI_AVI_INFO(i), buf[i]);
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
-	val |= HDMI_INFOFRAME_CTRL0_AVI_SEND |
-		HDMI_INFOFRAME_CTRL0_AVI_CONT;
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+	hdmi_update_bits(hdmi, REG_HDMI_INFOFRAME_CTRL0,
+			 HDMI_INFOFRAME_CTRL0_AVI_SEND | HDMI_INFOFRAME_CTRL0_AVI_CONT,
+			 HDMI_INFOFRAME_CTRL0_AVI_SEND | HDMI_INFOFRAME_CTRL0_AVI_CONT);
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
-	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
-	val |= HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER);
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+	hdmi_update_bits(hdmi, REG_HDMI_INFOFRAME_CTRL1,
+			 HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK,
+			 HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER));
 
 	return 0;
 }
@@ -193,12 +180,11 @@ static int msm_hdmi_bridge_write_audio_infoframe(struct drm_bridge *bridge,
 		   buffer[9] << 16 |
 		   buffer[10] << 24);
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
-	val |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
-		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
-		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
-		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+	val = HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
+	      HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
+	      HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
+	      HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
+	hdmi_update_bits(hdmi, REG_HDMI_INFOFRAME_CTRL0, val, val);
 
 	return 0;
 }
@@ -231,11 +217,10 @@ static int msm_hdmi_bridge_write_spd_infoframe(struct drm_bridge *bridge,
 	for (i = 0; i < ARRAY_SIZE(buf); i++)
 		hdmi_write(hdmi, REG_HDMI_GENERIC1(i), buf[i]);
 
-	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
-	val |= HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
-		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
-		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE(SPD_IFRAME_LINE_NUMBER);
-	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+	val = HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+	      HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+	      HDMI_GEN_PKT_CTRL_GENERIC1_LINE(SPD_IFRAME_LINE_NUMBER);
+	hdmi_update_bits(hdmi, REG_HDMI_GEN_PKT_CTRL, val, val);
 
 	return 0;
 }
@@ -269,12 +254,11 @@ static int msm_hdmi_bridge_write_hdmi_infoframe(struct drm_bridge *bridge,
 	for (i = 0; i < ARRAY_SIZE(buf); i++)
 		hdmi_write(hdmi, REG_HDMI_GENERIC0(i), buf[i]);
 
-	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
-	val |= HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
-		 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
-		 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
-		 HDMI_GEN_PKT_CTRL_GENERIC0_LINE(VENSPEC_IFRAME_LINE_NUMBER);
-	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+	val = HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+	      HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+	      HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+	      HDMI_GEN_PKT_CTRL_GENERIC0_LINE(VENSPEC_IFRAME_LINE_NUMBER);
+	hdmi_update_bits(hdmi, REG_HDMI_GEN_PKT_CTRL, val, val);
 
 	return 0;
 }

-- 
2.51.0


