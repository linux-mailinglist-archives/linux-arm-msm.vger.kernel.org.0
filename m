Return-Path: <linux-arm-msm+bounces-99399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNySK5egwWmFUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:20:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6798E2FD1D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D626430814BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194803E2774;
	Mon, 23 Mar 2026 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oy9Dfmws";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DcB7HetM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDA43E0C5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296848; cv=none; b=kV29GIgVyvLMpK6n+5uAgttjQR/V0CAiMOygX3EXnUXxP51HRGEGbj6PdU61RHCaLKIebgqcDoR+2ICONzX2zdRRtryTdbpJI4a8akyxqKarBCdUTXgX2ndTJo1icL4wYYAqQR7e7vc50fmlqFYQ3vaS/Tt751OqYjStRpkzjxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296848; c=relaxed/simple;
	bh=xUiKo1yj6GLcQVb+vkBst3BMjf309OP8s++yQjsuSJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oT10QwLVI2COeecs4ztCQKp3GyBmABsMUUHcKqe1Niblp/B943qD78aCOhJ5ccLSSNVKSGf40HRw0SjcrN62Yh4kV0PxoKAdgDq4XBjQ2uJdxRgU3YOES+On/6sFrKfsJvjAlG5F+qdXxkNmsixqAelkcKSuCs28UWYhYIQWR3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oy9Dfmws; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DcB7HetM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqiFJ3934853
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lVL5O2LZPIVIF6OfH5Vaje2elHwGIQmYJFJtw0KLdVs=; b=Oy9DfmwsqoNtpWML
	ED2eU9yOaMJ4rrJYBNPK8YzXD/vtV4jd02IDqCfqQQLi/Zn9BxPuhE1iDkrO4cgD
	WJ+BKUnL9gvthLXwOyAANsaYAQpwm07X0qrbqiNsj6hrbaX8QDDLGIg+2X2tQ/Rg
	OWYnGKovBs6iDyuV/hUFl3Xj8WC24u40eI1CzTMYVmM5zgkTo7iVWTO8bYN7DBdS
	TP37npjrq+9BXkYFnh4WmVEUyxhhydGj/yHIJz2k4qfg6OwNfGWOGUi1XoiRfYlc
	bVwo3/0n81VK3rTJ8CwESgNWbzTvF07kFYAG/kb+EXFoSKQVEontgctenbSuXhBj
	jt59Jw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0h6n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:14:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829ad81b132so15774863b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296845; x=1774901645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVL5O2LZPIVIF6OfH5Vaje2elHwGIQmYJFJtw0KLdVs=;
        b=DcB7HetMmFTrpdKj0QpTy9BzFs02oQh5ky3MCL8wD81uO8F9M1TTSBZuikv6YXp+77
         MzXE3+kqqrQ160uzRuoOlIy/nBWsPBR8WjIsuJsi8ZEM8GS+ZTVPDlsxIbLPco3v0wFm
         xDw6FaduHDW+lxngXZM4A35dmHJaHZURMMlTRQGV3/bmFupqJfPLDvWRuVv8C3e44rhz
         0qQxakpG8G5mhpUWaX2ypwtIoRCBEIstehIyRx0R7GBu+j1t8JmgfgjIvtGHGq5e7w3Y
         gHjoLfhWRxIGtrZJlRaV49xYLVNZRtY3gHlhzdgYfssSy18Ux82apj6w7pfitmrxsFby
         WGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296845; x=1774901645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lVL5O2LZPIVIF6OfH5Vaje2elHwGIQmYJFJtw0KLdVs=;
        b=M+aFWDWT0YJOHpYWFKmJl1PrhwSXClwYTFkX+G6xMz8Q/2Y8e6DFdEidTqmd/TVEtu
         a4zrKe1LRwRzToS+gd8GCfgT4yQy7dwZ/jtzGi3Sz7OkK1NwsEJX32N6gNRxY2fe9TI3
         7F7gd11bdpmMOU4ikTJWwZC6NLnHw52TVRnNDH0aTXqzez8PBNZMT7xKNpJwHZfgixqS
         FDPUZ2Or4SfC/OccvUpZoJbE7udYeS07SOZSQgqfvfdfVkhDeBZpFzqVIDPtwhhnx8EK
         a5/MmHZLdkha5JhJeYzKz7bkAeyfUpoW1/wF52/ynAj3CCtVaACmn7RCBQ7MC7ZPGUrd
         iceg==
X-Gm-Message-State: AOJu0YzOhbrYBTksTOCAmTRMBKO1HTSyDSoWGMagFzuXPbhpb5ZYTd1u
	D58ELB24AED8GztPkJYglRx+c+cTCkHRAkN5obedYzt89Li6CTRU8zFfc0PAew4zMytumujvr9P
	0+4tRmOdXZfm3u+fz2PxBkrTHM66gsORMLqMizgXpyIEP3TuFv3+tYNULX7IFqNSoP1Sj
X-Gm-Gg: ATEYQzyMVl+NBwTjlLXtxpq+J/NFwtEeiY7LdSD0mWoBUw0zyg+pjGl9f0R8YuXNmOt
	CpeacSK8n36N9lOkSicQfnehErYXB1Ly/SK+lQwjKAmS3oO9hjo0RkFSXdBPyXSQDfFlwP65hcl
	8FlsAZTPeKIon5IQ2E35PGclOBBGKrBiQudodc08CqoCnOgNwsoZCCvNxPtJQsKx3+ueN//qQds
	9VPuteUXj+evKQ31RyotHLJPmPQ3MZ1VFkT2aA7TKurQajs7xFQhXp3p0FGJIbRVuD6vQacd7fL
	kIw9Yjit3Xc4uKjDMJpVLR9Olah4UyDIQNhkUQxW7wo6YXlaqYHo9opVVKcZf81V22iKQtiet3u
	N/Vb+Y4IGHoZX6JmuV3ssGoIFSOCcNc/JVcOLsbUGhqvYAA==
X-Received: by 2002:a05:6a00:4148:b0:827:37d5:af5a with SMTP id d2e1a72fcca58-82a8c22d010mr10820913b3a.19.1774296845449;
        Mon, 23 Mar 2026 13:14:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:4148:b0:827:37d5:af5a with SMTP id d2e1a72fcca58-82a8c22d010mr10820884b3a.19.1774296844899;
        Mon, 23 Mar 2026 13:14:04 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:14:04 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:27 +0530
Subject: [PATCH 15/16] drm/msm/a6xx: Enable Preemption on X2-85
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-15-fc95b8d9c017@oss.qualcomm.com>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=3858;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xUiKo1yj6GLcQVb+vkBst3BMjf309OP8s++yQjsuSJc=;
 b=2rI1YvLFs4YYZPHksxVvp7iWMp+avy/Jx1t3dSt7bJZ5N8uTnzF/6lWeRkdCGwsPD//qlh/0f
 /PZWHx81nUxDi8atrdNqCYjYvRLPGVWtk5p/y/wNKIQGLcEePilBj9U
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c19f0e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PN0yGgm3WGXANvjD27MA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfX2iDDjFzS7q/0
 3X78JL9E+GwoGLHH0k9J6g4T1hxj7Jgg+uYJfOWsiM6qR4cBXk14QaV/mIHgNTgFIIW5FXCa/JS
 P+zZQN2L/g5Q9UjaEYGnTMrVlT9YSGrBMrJ/MkraAC1goFaEF03WMpKdSRz4G2yungi9rqVYNsg
 drLeAkfxt8jhFl0bnDGgtog1/1Aveiuz8ds+zzhl4Y29Q2OC8uiwbixhd7nXcb4hxCwF5JKWLcU
 hakVneYrbOc2egE8nxL9igc3YMtvhcLW2y/eWU2ssdEIk5gWDijOCutgAwmOta4sSbLNv1yWbYp
 ap+VF61mzV8R87nznAF8ZgMsjQcpztqO0kQ5s6bubUotBYQI3R/TywHXbJDfFSx6u9nDWauNZMG
 rteLKigPcJcEk3aUVp++zIL8a7f3fs9KyoS56aIbFGUeeSMWgze8ic1AYHuNfSANbZze7ZCEycn
 tGVNNSHd2RhX9C/I+Xg==
X-Proofpoint-GUID: IBLtmy1DewIDpCiPHgePA2EHEk_6w3qr
X-Proofpoint-ORIG-GUID: IBLtmy1DewIDpCiPHgePA2EHEk_6w3qr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99399-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6798E2FD1D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the save-restore register lists and set the necessary quirk flags
in the catalog to enable the Preemption feature on Adreno X2-85 GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 21f5a685196b..550ff3a9b82e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1761,6 +1761,44 @@ static const u32 x285_protect_regs[] = {
 
 DECLARE_ADRENO_PROTECT(x285_protect, 15);
 
+static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
+	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR)},
+	{ REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_RBP_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
+		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
+		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
+	{ REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
+		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
+		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
+	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC)},
+	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIPE_BR) },
+};
+DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
+
 static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
 	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
@@ -2082,11 +2120,15 @@ static const struct adreno_info a8xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION |
 			  ADRENO_QUIRK_SOFTFUSE,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &x285_protect,
 			.nonctxt_reglist = x285_nonctxt_regs,
+			.pwrup_reglist = &a840_pwrup_reglist,
+			.dyn_pwrup_reglist = &x285_dyn_pwrup_reglist,
+			.ifpc_reglist = &a840_ifpc_reglist,
 			.gbif_cx = a840_gbif,
 			.max_slices = 4,
 			.gmu_chipid = 0x8010100,

-- 
2.51.0


