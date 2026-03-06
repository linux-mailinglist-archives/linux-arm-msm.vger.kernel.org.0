Return-Path: <linux-arm-msm+bounces-95876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK/MFiAFq2nDZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:47:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1359225570
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6E263008777
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED252413220;
	Fri,  6 Mar 2026 16:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eav/FiUb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXnXQKI4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C328440FDB7
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815642; cv=none; b=cH5iGdDtA90khB74XyWfPUxyH/SrcblRtqcqlXMNJokjnLd3kcgwxDy+g5zPCROwtxHDB3UG2YoSnLkybFdSmhquycCK4CaGoBkhiIz4C/0V4O+V5bTnUT4qi1Anx/KP8fIDgPUGvvjoACoS7TSJLIzYMHNbPOWphstip6d4TTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815642; c=relaxed/simple;
	bh=LVEC8YDeYt0+YXI8uhlf86j9fvAB/jpH4rPnw9P2IPs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FYUKicEgeuHAR1l05BK4m4/k0mD1sDLNOJkaQcXCvGESmoavDTnJHsa+s9Ms0dkafwMzRbuN+zfOaBW9K9btL0qgZ0ZMeIwA8ufMSPzrtr9LeMJmmdJp7vBiyANbB68tdTM5juDITyYUY1LrJP5DmREhnOpdx3HJcRc6qXiKbsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eav/FiUb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXnXQKI4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Fqx4s2007765
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f7DmKwVywjuTKzK4AuPgql
	wO5Fxt+zgxrdleTEw3DnA=; b=Eav/FiUbdeooWftx9IysP6JVjbQGp4Bpi80MY3
	SInWm0fJYweLxvpuWBGNIxDhLqaSCPZUzWSA/rKbXTL8wEckpFwdr0Ys3g7KFITc
	39Ya7ROZYt49QE/7HxjnWGRKJgsLKuh9qboTWm6knkivdrfsEtU6/LRR8Y6rcwLG
	xrplycSqw6bwBaz2mxa2zscuNQY/AWLUsKFaBWt83NSquiKvapiEiGLjTQHM337x
	hLUfLJbOAC5tMQgOdcKn2ECFcilkZsW08P/qkdiSCm8CHtOxz9moApNW19dwILlI
	SL4qk2nWH34UUg5pPHE4Bpwj0pITBg9kIQY2dY+QShxboy1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ahch9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ed6c849so2001346385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815635; x=1773420435; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7DmKwVywjuTKzK4AuPgqlwO5Fxt+zgxrdleTEw3DnA=;
        b=WXnXQKI4TFs38GBu7Hwh/MuaO8D3leklB31eSD0JE+k/hE3dZU2ppRw6LgrR+3lGQf
         WBD0YU2XDuYhSKQ9p2xZR5KlE/5Y+TrU9knkklPUVmrJKqyxJrpqnAaJfYumLgs29Uy9
         IYuY3gVtwP/xijbNw5pqlZJ81FsSDUemS7ZSKkLodoR2mbmRlqZtV651cE1wxYVJ6+Ah
         a2VTkn9i8Jqi5LlqT9n+PQGWjHcNrqRcG67E/M9RPGvXVeBGZm4TcCqU5YAx12Y2gn6S
         CRRlsETxseIKrJI0YgtEo0bI8wZrfgM24dSFfLIs8eMK12Xd9ia6B7aSQC0RUIW12RLY
         ikmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815635; x=1773420435;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7DmKwVywjuTKzK4AuPgqlwO5Fxt+zgxrdleTEw3DnA=;
        b=a0S1WLLceEV7tkaJOoWTkrQTH298QxrwkBblK4S2vKvYQAAe9g8e7a35gpULSqgQ/9
         9gDUn41GBYAjWKRfpwfkQJ8M8RuyJuoW9+ofrbC+sOn6HIXNd39+srOIR/PlcZ1F6Epd
         VpWc/wUop9LoZv/ILL141SeQaQBQQInB4qRrmMvHDJkh2//QEb5l7Puny9dHPXPJnDx1
         2ZabjqkeSVYaFBDWDVAiJS6COf95d5E8UqHtKDrR9wKAPbY9TcAnCIARl1jIkCkub42P
         0qAU3//Lc+jJgEWhuupnku2lL0q0XXJIbooIg+BMZJq/ijpsAnJL1OTopAeGfzG3YJZY
         MZCA==
X-Gm-Message-State: AOJu0Yy0cGWAfrltyaapizRBjNSiXTCK98v5L9JsoC6757cY45mjLHND
	GDAKqwAYzgcw9chiqctynWBgQNIUszObHrbot9zj+Nmm9lU21vV9unsDO9ObOvV95Dk8h0OggvE
	XXXDlAZnnwNMy6M45aOhvKyKaIZ3YIssnmy7z3tSMwvcYaklEaP22bCNjm+H8zZQU1hzt
X-Gm-Gg: ATEYQzwtU9rKGCnSA+0RsIqCEG4TjEEz9qVT+wyfUJ+AeCJqZ9b4dlyt+WGNsiVefv2
	Hp+iZv4jaGMBY/43Ddo/R7KeXU9uQNcCCvR8vA2V9UUqgUxzk/Pfo8rVcQMRwiCJ0ENxbrvXi01
	r+Khagz5XJ6xGipyqMmxd6d7Baqblq/xWzg8UxFW7m0hzzhxsrK4PxJPi9K8QWwfEG2NIw8fBSv
	nWSdifA0HHPCpOAHq//cybfeTzKAV0547zI9HDl2D8v4FPRg2g9YvoTGnZNa78Mm3HmC7zMxsiI
	ZdyNA/8FBYpUN+fAlxO5Mar+xg3l8m/4yuiatgG3YBadc2MZfHOPppqMAFxYU2SpNKhjFsYanO1
	/13rV3zWY0UExs9LRp3XqjEjlBWQ25I/mI+6QJUehLTXxSygTn/C9myUvs1UdeStBO3auBPtIoN
	rcAiQ7kpCAUWJviPyRkzSbaP4IsTPFclDVTqk=
X-Received: by 2002:a05:620a:f12:b0:8ca:123e:819c with SMTP id af79cd13be357-8cd6d3bd760mr356484985a.35.1772815634566;
        Fri, 06 Mar 2026 08:47:14 -0800 (PST)
X-Received: by 2002:a05:620a:f12:b0:8ca:123e:819c with SMTP id af79cd13be357-8cd6d3bd760mr356479385a.35.1772815633999;
        Fri, 06 Mar 2026 08:47:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/24] soc/qcom/ubwc: rework UBWC configuration database
Date: Fri, 06 Mar 2026 18:47:06 +0200
Message-Id: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAoFq2kC/22Oy27DIBBFf8ViXRQGmzHlV6oseAwJam23gJ1UU
 f49yN500dndK5175sEK5USFme7BMm2ppGVuAd465q92vhBPoWUmhUQhAfjqbp5nui35kxN6gqD
 JKSlYI74zxXTf1z7OR870s7bRepTM2ULcL9OUqulmutfTZEulzP76TLfbAARPOZVDKTDi4J3rw
 ZLZhv8AKTVvfn75+p3WfGARxz4ob4XSYDa5f2mrv+6Ucn4M7cR79MENUfVD1ANq63obFIwaEEe
 ByM7P5wsJHbBAKgEAAA==
X-Change-ID: 20260211-ubwc-rework-e6ce1d8eb520
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4128;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LVEC8YDeYt0+YXI8uhlf86j9fvAB/jpH4rPnw9P2IPs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUMy8F/PM8CFmkMna9fV4tNUgxcFUnfLPRwz
 kAyab3HTq+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDAAKCRCLPIo+Aiko
 1WX/B/9FAZ298A7KyypuWYq/l8KbuCgi7VAX+vD0SN/1Oa/D+mv7h4FfOKAnaga63rmOujZrGvB
 r3FBHK83DEh5VsmYaWKzed5l+bHiL0SHgH1tMpnYAsgiRP4LUvCENgLHD9tixxGkhaacHmRBRlf
 qvHAEKA1EcYXYl8xbRNOktKd/xRia9L0lf1gu5wG2qx5ByENnWIBYGmvQuwlHRMUTyG4o8Js1Nf
 s1LRj6hXP5oQN67IHdzJ+Ke/XBfhfSXQkTbABnKB6uaqiNCQBgHqKgDbbdG2L/2yKhAeWq6s9mK
 grxAm3W41Zv0VyMm/W+b2qKTN6HXM8ZRe+xIsxXuyUlB/bKR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: aNs-shAbPhoGthyPhGBQ1g7qEkGcT7XK
X-Proofpoint-ORIG-GUID: aNs-shAbPhoGthyPhGBQ1g7qEkGcT7XK
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab0513 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CrYQme8I2PAYreAbDuEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX/G5vsPITAESm
 44TJBnKLPyGID8BZFfSgm06mI89mJaiBbZE2mQAM7ANuKKYT+uVbsidtX9+C0vGdg83tO9LQWmT
 tVC1vR9NGBJ0wrwryPwNbGUrFouUNhr8JShKmu49C8Q+lf8tpvr+8iUKBgTmumj0y9qjUmmIouR
 ZlGgX8irpiLx4RYRI2cRlrx9+8LyxhclU52YXmCUFjOp5RgXyDqlUF/VJMgRtvAs0cxgOiLctOx
 yjv3NYo/d/ghbKyCWbBGZYrvjUsUbbqiX8Br7ir2QIj1XaF9fCTfHSE0Ik/EXf7/0+xfuqN3B+3
 8aINIK/1JJ/38uzdV5Xn6hNdngotT9hCyyMOxrnZD8gAFCTBinCEANxOmNzxw7XLSym2cm2/1Br
 8sv/AlNZCZJzz9tfDKpSeQ/g5apyxfB69hlPKdcJdX7ykOFd5eKZWYwwS8Icb1VukkZRWW9Loku
 tT2OwQTlGvJgJFNHt4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: B1359225570
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95876-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.945];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Currently we store several settings in the configuration database. Some
of them are incorrect or not completely matching the expected
configuration settings. Others are directly derivable from the UBWC
version. Rework how we handle the values in the database, trimming it
down to the UBWC version, HBB and several flags.

Note: I don't have a good merge strategy for the sieres, it depends on
other SoC/UBWC patches [1], which are probably going to be merged
through linux-media. Any suggestions are appreciated.

Maybe the best option would be to:
- merge SoC patches from that series and this series to the Bjorn's tree
- create an immutable tag to be used by linux-media and drm/msm
- Merge relevant drm/msm and linux-media patches to corresponding trees
  after merging the immutable tag
- Merge the rest of SoC patches in the next cycle after drm/msm and
  media changes are in

WDYT?

[1] https://lore.kernel.org/r/20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (23):
      drm/msm/mdss: correct UBWC programming sequences
      soc: qcom: ubwc: define UBWC 3.1
      soc: qcom: ubwc: define helper for MDSS and Adreno drivers
      drm/msm/adreno: use qcom_ubwc_version_tag() helper
      drm/msm/adreno: use new helper to set min_acc length
      drm/msm/mdss: use new helper to set min_acc length
      drm/msm/adreno: use new helper to set macrotile_mode
      drm/msm/mdss: use new helper to set macrotile_mode
      drm/msm/mdss: use new helper to set UBWC bank spreading
      drm/msm/adreno: use new helper to set ubwc_swizzle
      drm/msm/dpu: use new helper to set ubwc_swizzle
      drm/msm/mdss: use new helper to set ubwc_swizzle
      drm/msm/dpu: drop ubwc_dec_version
      drm/msm/adreno: adapt for UBWC 3.1 support
      drm/msm/mdss: adapt for UBWC 3.1 support
      drm/msm/dpu: adapt for UBWC 3.1 support
      soc: qcom: ubwc: set min_acc length to 64 for all UBWC 1.0 targets
      soc: qcom: ubwc: drop ubwc_dec_version
      soc: qcom: ubwc: drop ubwc_bank_spread
      soc: qcom: ubwc: drop macrotile_mode from the database
      soc: qcom: ubwc: use fixed values for UBWC swizzle for UBWC < 4.0
      soc: qcom: ubwc: sort out the rest of the UBWC swizzle settings
      soc: qcom: ubwc: deduplicate UBWC configuration data

Konrad Dybcio (1):
      drm/msm/adreno: Trust the SSoT UBWC config

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  11 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  91 +--------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c       |  13 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
 drivers/gpu/drm/msm/msm_mdss.c              | 122 ++++--------
 drivers/soc/qcom/ubwc_config.c              | 281 +++++++---------------------
 include/linux/soc/qcom/ubwc.h               |  95 ++++++----
 10 files changed, 196 insertions(+), 439 deletions(-)
---
base-commit: 3f9cd19e764b782706dbaacc69e502099cb014ba
change-id: 20260211-ubwc-rework-e6ce1d8eb520
prerequisite-change-id: 20260110-iris-ubwc-06f64cbb31ae:v4
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
prerequisite-change-id: 20260228-fix-glymur-ubwc-f673d5ca0581:v2
prerequisite-patch-id: 7982b5ad797f83303a7fc6c932c0c6973114e2a4
prerequisite-patch-id: 5bc7dddd09fcdb4f534f8468ab3ad51781667066

Best regards,
-- 
With best wishes
Dmitry


