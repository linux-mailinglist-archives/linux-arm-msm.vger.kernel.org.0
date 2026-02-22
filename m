Return-Path: <linux-arm-msm+bounces-93560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNc8Gq1Um2kVyQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 20:10:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C70170216
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 20:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CCF1300D15D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 19:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0542325B30D;
	Sun, 22 Feb 2026 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3OJR1dV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ondk1Hxy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C907D20F067
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771787434; cv=none; b=i7F/1vq+Qqe723LpAk5ibig4auP/PraEIdc55vFZdS4duh9Oiv+cmhcX9vG1dNIMy3xPStXMix8caCjY2YkKheFxSjusbMZNM0gOxtLrSgqCH3Osaj2cDWzuuB6XiYcdXVr46UiDQbojWTpeJGpx0lmMIapT+Ww5sSueenw1g8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771787434; c=relaxed/simple;
	bh=6hOyKvhbzrucOjvQeqbe4yQ/FaIfwLLcQFEZoxqbF4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n+MSz1akBWhZeqTrSMaea9H2RkYuUmEijSSGrxP8jgz+Ug5c45DCSYaB1HWuU/5UHapMDVXsgMkPQ2Ft/cRvXEeCrRg3cXnyEdb8r1XKsnpnOoJPlo5GEeGACP9YmrzDCwcOdvi6NRs/fMSe4cX9ridcQBR0F026ZWsO55H6rXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3OJR1dV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ondk1Hxy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MHt2CK1416508
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 19:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Im8dZPlTzIiexo0trrH/fN
	RgOoF7knAn+6x2gD7kMBg=; b=I3OJR1dVApUGUYSs8CXmndUay51duEDEzI6fp1
	PNnZu6+iZ86sP2n4Tqa0ywR6ZXmwoezD/bx3wgyfys7+YNwK66dG3VPpgMoHrSa4
	df+sYD1uHDlz2hbNCBFFojqOCsX6u0BS6Q8HedHJ6mzdbC4uhTVpPYfCC6LWANeH
	l4Va5OrmkCwWaToHdd8fhtnSoF6vW69OGjOw1f66K+ywpzOtJDemNoG2VbhW5sD9
	G7p6Jdi8CVR1W3DQETg+TLGttIzkRG4fmymUDrsmkczlZ3fSfxJUJXI9rYcslkWs
	JsixPJaF9iRW3eyAC56n6LScTXlVfH/OBmPB7svhRhmApGDw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5watmwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 19:10:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aaeafeadbcso44403695ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 11:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771787432; x=1772392232; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Im8dZPlTzIiexo0trrH/fNRgOoF7knAn+6x2gD7kMBg=;
        b=Ondk1HxyyiJn0IURWYo81Tys0WgbH5iVKZHpnJntcWXHCnUkzhWviaUGbwX3HWK/sD
         99RbJ2NJXx7cR2xJztzfxwbwJ7ZJa+QQTKIEPr3pmGwBad7J1cH/hUasTbAGVmUCsvOV
         tCq8nIApMqF+LBln6HxV91HvdzB2HGWq5BkKzqYUJxCAsG/iUG+TPj02ZjHoO47TfHym
         /MPE4oOLoecEu1mGY8N2IBjsrsNaXQDQDT5Zci0S8mAHiLtLgX2pY+bPFVRTLRiypfn5
         aLTLB6dGVayC5tSIPuEJg0brwJ9UV0Mpx5tqLQPnOi/peSDS8z11+0TEpGK7DihmxzA7
         ls2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771787432; x=1772392232;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Im8dZPlTzIiexo0trrH/fNRgOoF7knAn+6x2gD7kMBg=;
        b=M+8FCx2tG/EoDz2fyItByXG0TGXv+jzHKc9HATOfG6bzLSQokOC7cg4iDE0lmzpiYq
         7MSV/9hqaku4I24NORjIMt09lrR3a+9x0rHE4fA7mvxGdJ6yGvYjq6dyakOnfLQicJgk
         IDTfFCD68Ql/yvj+JbZnoiyoknkgZfVKJSv8TIz3ptH/kP0kvpeYaBzTyep3JXRaKG7+
         pPhSQOcIuIzzp8PDXr4q29by1CuseuLMb52RPtf2vvHeg6MqnXWQTrYwSnHvGySrrI2u
         HqWIW0vb6Aqvz8+a/gqQE7UJO6q6h2tXNfVsqIfKTiTG02VqxgmutrPsedMWmpjjHHUu
         jMug==
X-Gm-Message-State: AOJu0YwM/n1C8FOa1S2TRvskzjBh00zeZF37TwOsiv7nmyHTOaNlswzP
	aZ59MDaU/ITmzg/8QMuqpGGDVDjZGtKU5NYm3QsAPegoPccZHtVzvzjSTv5IUZJOZN99/EMU4/l
	6r75vzbpazSlFGnmUb7jky3npUItJsG9dzWnaqYS+CHoX7V7JnFVDrY+jPH5vu64WUjGM4nrfmg
	q8
X-Gm-Gg: AZuq6aKOeva2fjAE/kcnORzuGr9vFDJLnWvSx7fl9IUywcOD/zjwUv+owcHcqpWTNsT
	c+WnIUtZuo9BRhS7mRPdpGn5brngk9XovQrUrkhcCPoCKBQhzyY1U1rvHNaSfiCDQ9PCxwVzTAM
	fm80Y4fEH0/TKNDCJ4Ate4nZjq6JmNG+6XQxyXO59t8Yl477wm3c9cArTkCrtaJfktDjsX5inND
	JLW6g3uY1zVZOStBU08rOjkdVuUsDmy/jte6ttgbiha4lnDynpkzOSspKIjimY2LYezVp9Jy+yq
	dbnIYlztxiSQ1c7psWVZyE+V2cwVDCy6xvwx+6y3mWdFiQXdNfhgzePnvvd3fszwQxzxO63XB6K
	A1/aC47KzGcBoFOug/yKLH68Ez8M6alWOk4gsmKh0kLVzskQu
X-Received: by 2002:a05:6a20:6f90:b0:35d:c68e:1b07 with SMTP id adf61e73a8af0-39545f9cf9amr6098246637.54.1771787431836;
        Sun, 22 Feb 2026 11:10:31 -0800 (PST)
X-Received: by 2002:a05:6a20:6f90:b0:35d:c68e:1b07 with SMTP id adf61e73a8af0-39545f9cf9amr6098231637.54.1771787431388;
        Sun, 22 Feb 2026 11:10:31 -0800 (PST)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71810casm5249651a12.1.2026.02.22.11.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 11:10:30 -0800 (PST)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 00:40:10 +0530
Subject: [PATCH] drm/msm: enable separate_gpu_kms by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJFUm2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0NL3eLUgtSixJLU+PSC0vjs3GJdS3MLc4PkJGOzxMQ0JaC2gqLUtMw
 KsJHRsbW1AJBnIhhiAAAA
X-Change-ID: 20260219-seperate_gpu_kms-97870cb36aaf
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771787426; l=1614;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=6hOyKvhbzrucOjvQeqbe4yQ/FaIfwLLcQFEZoxqbF4A=;
 b=90EVBPBr3Uc+gAd2gg8hoT5LUmwmbqpC6Y5RskSs/5RMx0bBTUShAR6f2sFKRqB4RvwWW0Cnn
 f2irSV5jiHLBWEdITo/cIU8Bxibj16MEFAcKJIuMfT/aGVY58pzZPCX
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699b54a8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L7USXq9lOa_sdtJDxDQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDE4NSBTYWx0ZWRfX79S2lp8qOPxn
 YDIL1NqJatc1oNafWQOGD16J4mu4y53+lkNNfYLhwFp338KUAbIlV/28lUjCPLSRaziKireJC1i
 A3TuD8sQ8EIQR8J2kgN6K8Gqu3mjztP4l5aq5aDafexT0Qlk5FLAA+N6URGKJW/uGlNLsFlLlUX
 3ScmodVFmvtkcafIz9ojV/Mg3FJ6Xnsp90GZMJyxiDemapgMEG5kwoeaa3F17H14oIycSWkvt+c
 a5rqBN24Fb+J+6+/D4bQo+ajdhJmZ5FXpVcMUllMLfHtlUD1YnS7FjoOWpxup06a3LCFCxEVu5X
 3vaQH0LZ68OdTF0Ex3A3/OGYJusXvCdNs19RX91xQ2DegR+jftH3pgQ7YjWXqukGaGokFjFoMjb
 Kis3EaBSUGNbT5S0Wwu8t7DF9i+z5s6WMZ8210tA5nMkzQhzobdF8uGS/qFwYiJF5y81a5bPExh
 N/wnJDX+csj+xMQBlsw==
X-Proofpoint-ORIG-GUID: C5urR8B0SDQqwe2UiQOXg0KHnBdCBWSZ
X-Proofpoint-GUID: C5urR8B0SDQqwe2UiQOXg0KHnBdCBWSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_04,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602220185
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93560-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0C70170216
X-Rspamd-Action: no action

On targets with multiple display subsystems, such as SA8775P, the GPU
binds to the first display subsystem that probes. This implicit binding
prevents subsequent display subsystems from probing successfully,
breaking multi-display support.

Enable separate_gpu_kms by default to decouple GPU and display subsystem
probing. This allows each display subsystem to initialize independently,
ensuring that all display subsystems are probed.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Depends on:
	https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
	https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ed2a61c66ac9..65119fb3dfa2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -54,7 +54,7 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
-static bool separate_gpu_kms;
+static bool separate_gpu_kms = true;
 MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_kms, bool, 0400);
 

---
base-commit: 50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f
change-id: 20260219-seperate_gpu_kms-97870cb36aaf

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>


