Return-Path: <linux-arm-msm+bounces-115097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KmB1GDR4Qmrx7wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:50:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DFD6DB8C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:50:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BMM5j4DD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z1hIvXKE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115097-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115097-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F021C32F08AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC33041B369;
	Mon, 29 Jun 2026 13:17:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11504219F7
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739066; cv=none; b=NEqXJf6n83XpCNdyOzC6moJ+SceWqOY3NvOkx51qQsA1zrNslgJnSpEObSXWvBxaxZYfy6teX0ngQRDu1kQv324hzzSSg+V/D1VlefOpLD1T7kiSdvJ2ooGSqlO2Ss5+gwE4uqZ/D5BdEDtsl9zT58MWpIhp52pLxHhNE7Ep7i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739066; c=relaxed/simple;
	bh=xGdkG90URTLG388tBIYWOwsvVzPJImnqlIcHGWOZa4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fauLdqSUF7E6hdeKg2j1bzldstXZ7xqXu+dX/lnZXGb/F2qWgZMVClPkqfZuk3kWhoTDaZBR6WyiXnGGdq1hMpqXr5HXeQOOmJBSyxhhcD2dbxXCcDXkqVZ0Mi8Uc7dWwAw21VWa5wX+8jbJ8jCniCk6eVqqhi0z1mcc/FtM67o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMM5j4DD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1hIvXKE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASxZL2641127
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzV7EjoUtPZtDBhS+QkVIWq9FjNr7Nkm+r9qnzqK9RI=; b=BMM5j4DDORq5kv2y
	8XSNs7P9RTh9Exa4hf5HT0pDCSA8LWSbpYI2OGRFr5yJpe5wAZhsfuOrRYImjNNW
	TcEoNe1vCeV152HVGfA/6b9VGvVxfjCX/LJdF8TvCXa5L+Id20Tg3xmbHsD5dLve
	jpp9/cDj1I90lxc4/scsNx+LN0ptI3HOkSR5WFO1vq/aAQGmC7uuvOPC46WNftsU
	wJF6/JEbaG77GWErkdF+pUndY7Os1kGD3lI09lHKp7sVDKhrONIfMO7DMo1XVmKy
	zrkAQgWgEhv99qn1YjdlMltYZLgD1Q3vyMMaqaNMOzg+lcjdzcIIo5f0n0/ygfjw
	kAwBTQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s14pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e9489f62bfso68147836d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739063; x=1783343863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzV7EjoUtPZtDBhS+QkVIWq9FjNr7Nkm+r9qnzqK9RI=;
        b=Z1hIvXKEvMYO8+O+0j5AngtI6vJq85Bd9x4t63MGUkfEAYgYvJylEPpWfgJvMQF4XI
         eGXcAkJbY2MiWR5S8i/8OwC9f7V6mg5XaIFvee/I1+iBk9ooQq3zk+zcV5uu22iSL52S
         UgsgWTtaAMCCTM/Hzr2XXlceMEiyYrd+QINezdez4k/lSF8kmskNg3QB4+LiIzPhY7/C
         +u7bMn1n3oV6Vf0SuCNa2fOjNN5G4qdl2fXygMv925jaW9vDzY7omoIrNpDnjUYCzoav
         V8aaJF7kfW6QTqqQ28jfhpumcNpVNjB2PU90s4iyh34+RD+A7NlHzq4WN+ufapjeiG3c
         bUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739063; x=1783343863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LzV7EjoUtPZtDBhS+QkVIWq9FjNr7Nkm+r9qnzqK9RI=;
        b=D+hvZOASKryyUo3/nBnGIb9Q9loIR6GIc2jZLSPv9iQOx+6H5U7al3bsYKUS/CuFuC
         9zKDJyUuCx5lXZx5nyhvfq/CGsBGtcTlGSTs8pEVgbF5XoICooCyQ7cO2R48G3mMiCcO
         nWb/GLYemnxYWtdhqOzMgCskqmTylFJ/MP1p5TzknFExpoOkzzVpYg3ORmiNaxMHaPbH
         gYU/SpdgvHNMGpNP84SQyJn6VCX8dFrMUx3yQlphHWStmsdsOdRLAVJjqWCsVhOZPERI
         9nfVaWvyfeCJ59Y3K81K04zL10iz0XKK6lNaok2+f7DVLW7gMTm6QGVNlQ/C4YxqUvX6
         hiRA==
X-Gm-Message-State: AOJu0YxtPfR8Z6Lv1PDbMF2PrJgUzgGwlzqpISnTAY9QFcoHaFXmtpDF
	yYe2l6Y6gbLHcUYq5lZZ0Z85KjxR7DYnyoJe9usZgtVBldYE1i3E8C5o3VlemaPLCbPJoHiEcR2
	68h15ZRpV096ehx7lQvQ81FL3rGQ+74HiKlSKVjXfFfM5uzm0DMdcYDBnLuOZPNiJKm0e
X-Gm-Gg: AfdE7cnNSM307ltTwSVanOyWiSLu7x4rHt9hdgsvfgF/o65VpLeuv7WVFxTaLL3m46W
	CsdiIWPAlGPVIb4XaA1sL5pAeXcnVsqbBBpFdFoL7UHlxbzVBkoirBeuismbA/8lznji/RgBhQ6
	uCH7xV4UlG4tWe1Sx36YAmqFsjk1UOgnu88G47CehJ04hdsr/NUWXFJTDPK+kBsQ3GHzg/02Y6q
	PBBFjYTO1tnCqO3GE1QtKCX57psJaDoxEn3aUDbomedtizaZp++itlNVCvnWPdGANiGBD7tXEFF
	C60j9sYMpuAiLwATPTMAPsnvgGcf0Xki8ERgP43Wrr7bO0pmAdIGD9Bm6qYHxZhpZtBSYN5zKy1
	A/1JAygZ01R0KEai/FiYn3aUgowyO+kVogc/qTH3V0Orq+nCvTl8QI0VLmO/NpnqRgSeOjW3MlA
	==
X-Received: by 2002:a05:6214:ca6:b0:8f1:505c:1d2f with SMTP id 6a1803df08f44-8f1505c20eamr13345506d6.1.1782739063148;
        Mon, 29 Jun 2026 06:17:43 -0700 (PDT)
X-Received: by 2002:a05:6214:ca6:b0:8f1:505c:1d2f with SMTP id 6a1803df08f44-8f1505c20eamr13344646d6.1.1782739062528;
        Mon, 29 Jun 2026 06:17:42 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:17:42 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:32 +0800
Subject: [PATCH v5 14/25] drm/msm/dp: Mark the SST bridge disconnected when
 mst is active
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-14-1d882d9012f4@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=1381;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=58ED0OzaID2aMTdkIIoG1uZJg33GpZvfm1KUdw++Gl0=;
 b=U1Zb7oADAm5o3+xrnnPz2levK99dw0V98Lj9r0eI95mHB3sYdSIq1N/em78YTrcv8NMqOebgj
 gTqTlr3ZRhDAyRNZYcgxFKPN0uJByrAigMoQxx4uZG8EDAXORAo+5gs
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExMCBTYWx0ZWRfX68N2hj/yLqBq
 gIAvD0Ql7QGvUcfs9xc1KoQDYto8fRABN+iZcsg+Nmu4iMyp8+JaIq80/YWMrTBUMKaWOAjEImm
 +M0DbT5sMjJJsInf8B337ei2dyBCQSI=
X-Proofpoint-ORIG-GUID: UPx0btXUjMuZsqkt4qjn4jKfC6nXIKsj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExMCBTYWx0ZWRfX0e2NJSnSI2Aw
 IxVsIUNDVsYoE1QMuoftXbWuQCdAUDf1QQcZrHhS/AyyWNMkvhrYNKcgegL0fv4q3ihLZ7hXOX1
 AJAAQFT50gJH7gegsd/57tlKk/Om0DCXGPRdCB2Wjje7mivIqBBvq7EvU96bZmpm9nloMI/2582
 rya63PMFBK/IncoosDtq+IsOk6pjSLpFkJ6lA9QZYAB0oSLZE82Ei0Mf701jd6Kvu7z3/LRyRUL
 Xc3o9tI4DKfHo2MisAscH54pocCJ7MbKtOK/iAAh9dSHIsW6ZwyoeebC2p7WoylkEHxGHbQomLn
 GjkqZ1a+GxEx6CuhYYTo8jRyuUmUvmDuADo00qSD/jHC3TBL1u1TyL5OmHi1sNziTnr8VdRu/MX
 ilFuYYLZhVfq7MhktNL9HNEjDIIQmZ5bA5pEmDMuX6wfvgocOkh/gpx5+RFp1gjaLOv3Ih6YKkd
 XuWSKINr2LoLKd6mKeA==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a427078 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ao9NmXljvuVdf-BuN7wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UPx0btXUjMuZsqkt4qjn4jKfC6nXIKsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115097-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6DFD6DB8C0

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The bridge detect function is only applicable for SST. In MST mode,
connector detection is handled by MST bridges. Skips detection for the
SST bridge when MST is active.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d0081ea9f5cd..5786e598a406 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -910,6 +910,9 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	if (dp->mst_active)
+		return status;
+
 	guard(mutex)(&priv->plugged_lock);
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
@@ -955,6 +958,10 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 			status = connector_status_disconnected;
 	}
 
+	/* skip for MST */
+	if (priv->max_stream > 1 && drm_dp_read_mst_cap(priv->aux, dpcd))
+		status = connector_status_disconnected;
+
 end:
 	/*
 	 * If we detected the DPRX, leave the controller on so that it doesn't

-- 
2.43.0


