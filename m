Return-Path: <linux-arm-msm+bounces-115103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P7eUG1N1Qmq07gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:38:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0497A6DB53F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:38:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o9Y1TRSl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Uxm2/I1L";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115103-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115103-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 380E33120824
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85B7423168;
	Mon, 29 Jun 2026 13:18:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0038C409100
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739094; cv=none; b=SLa/9rTekiqIFhMSlM9d0LOP2N4OhYBWFEqllK2MA/3QZF5BTaed0CPmrpv69KHPdkj6EjCwvnaBkEEY1WHm55jMUOqCKiyaLLrzChHGmmaay+3Oz0XarfYR74V3Wz+TFgpgG4NSHbon2MBYobQOEjYw+BZDOKjqnNH/V2WhFwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739094; c=relaxed/simple;
	bh=Tea5Jce8MD/RzZsevZLf4xjvhzOhaNCerFeZKirGZak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tcb+NJKfzZX0RebLiupvV1a76+WzJxhPOhvg4cJuhgiaofIAaVpZPDcM5wF1mV9HmKbWsg05FjM2e1pye57lbrsn1oOUEZNauQ81ThaZC5Iq2Q/J/XsZx+wjLzkw6lGWzKrB2ndoJNeXFJNcFra0HTUlEd5+FypwpbbCFcxe+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9Y1TRSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uxm2/I1L; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASuBn2603455
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nQqaaloZaS5enQFI+d8KGIEPr3AeTZ/Dz4Bxlwebq68=; b=o9Y1TRSlLWPBNBbb
	BV7fMM09Bhkg4WQt8GolLyniCDCNlqhMguOgFaYbPl3v9oXGC3yrTeo+8TqzxxBb
	hYJNfr4roZcVSiz7/LFgIU2YbQ2Z9p38QEfQpkyswLloWU1W3kbz1Uq8RlVJegTA
	ELzYXIvBlrFbDBS85CqSNDsOqm5EOLUojfs3H6Fi0nZIZ26voM6sMmKZZq1eepjf
	qtCqAQYYg9NDUxxW74KNhDA4oUrGVCmYMi8w/f/MK3hfpN3Eh808jtnD295CiUsT
	kuKMivNwEEpDq2ObddbJciqyRnxapQaOSgjksfVa9FlsL9qV+BxpNeaVChGXspeS
	91yelw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq88y44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso46462156d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739091; x=1783343891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQqaaloZaS5enQFI+d8KGIEPr3AeTZ/Dz4Bxlwebq68=;
        b=Uxm2/I1L97mixHlqZcJCbk2Zs9OcRp7oX/HqrBr72YxH/P1JOwqM+1yZiiqQ8HuJkU
         UEHOOdJlmIDYjQlv94yMHyGQwup9TA1W7A+rTurlOtEheIs7+ZCl5Qo+J3AnZxbNNY3m
         Slz1OJSPVacP0lwv+EbwZxnnOw5AmpkyBi5RDrZH46u+ybbuKjdBvik+e+XzsFKyIw4b
         9WTswfp9L6tzN+1SjtH7AT81MCaLhM+2S72ArL3ecfHhyuYmVKemGgPbgqiPkkfHeMQ5
         F64QvxMXK/Nablmh+iaYKSdufADZAF9Ne/Xh7sUp9jyM/CgWCPBb6ZLDvtHCrWnHWoCE
         Vjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739091; x=1783343891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nQqaaloZaS5enQFI+d8KGIEPr3AeTZ/Dz4Bxlwebq68=;
        b=ZmVkG6FGmIvFP11r6ueTjOH2PtFnSn4F27Sxic6BxD0DTOHc1d1IricGNEYnwYNp3A
         Pw/mYDLdYK/4pru2qIg6G2xNTHkkilhhe1nxAfV1Fvtz1gSYOSmcQNmyamq12Yu2gyUI
         aDjVrOIgyq8Lc59SpTxLvY/Tq46zokcicn/ExgpbtIcB0KMOD/Ed6X7Bk92M8LAOIx8t
         KFtlXrYerqdCw6Zr8sgk3I+vWic8ZaX8NUHNuqvVvMyN9YL7dZdV5kQeijli+qYzBX/x
         C9SAl5vGJQXx7RNgm0b/HuEhLT1+l+VH7SsFK2BoZZCNPCBfNqdP4KMYeGc/5lkWgPtl
         wtxg==
X-Gm-Message-State: AOJu0YzxiJ5DGOrFSv0WwrLeHSL9O19NqvAF4PCnzPBexFIHuKhkxUJb
	kQe+R7KtWLb74JxR7RFBarpeoGu0EQKZmqIPuTDj9MCMQOv2PdQYzmsZEYQyHkvLajSIBcgiOXk
	xjIYvMRwwhOkj+jLKaOYkOX3SZsQu/hNkOBgKKTt+LVYSLByNw6a0OvcUV7MXzla59AM+
X-Gm-Gg: AfdE7cl6Wy1ol6YU3wf+7/puePulC7GhQXYaRsiJvbxC9lXTHFvXZHF8vEiet9RBNYn
	ty3oxkTXQ7h3v57K3hhOcZr2bMZbSdHsXb0r6Jk+1HdEHOtQO90b55LgYgg4VJ8VTM/PS/puxqS
	faRIVgDoma6cQeOkiBzoNoYea1gfbAGcKNfsyu1R8TUswirYbu1Zu5/lrkAz8KrWmbZkHhjQrQ8
	eSslNXxxm+OTfvAJtZQd+K5V2X+StF+VEJEzBEbQJVFwuqV5lEJW8WS6K12io+55EVzYaslWpKr
	3N6oPf3Ck8D3CS2nj6nohgkGTHEk6Bmzf5xoA+44Gl1Xsabbsldy+egPTgdRhGSypsFMq8a/g3+
	SXtM7ZS4xxUMQGjZcMaKS0yTKghT6HXmoAsSYtfMspkhaXSLFJrDjnSB1KnKQjpX6b2aXZChdKQ
	==
X-Received: by 2002:a05:6214:130d:b0:8cc:d6a6:f54d with SMTP id 6a1803df08f44-8e6dc53bb25mr248660456d6.8.1782739091222;
        Mon, 29 Jun 2026 06:18:11 -0700 (PDT)
X-Received: by 2002:a05:6214:130d:b0:8cc:d6a6:f54d with SMTP id 6a1803df08f44-8e6dc53bb25mr248659806d6.8.1782739090649;
        Mon, 29 Jun 2026 06:18:10 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:18:10 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:38 +0800
Subject: [PATCH v5 20/25] drm/msm/dpu: expose dpu_encoder ops for DP MST
 reuse
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-20-1d882d9012f4@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=3441;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Tea5Jce8MD/RzZsevZLf4xjvhzOhaNCerFeZKirGZak=;
 b=03vrRX0qwfBSkfomWsK5+tGFhYlK93ryAf76FKomUK8Vpam59lbtxLK/MKJdJktg26RC5giMu
 tDN0xdWTdR/B2ARLA++41ZitJT3+ICyDiNAuI9uI64RGxWF9s6k3AuA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: qYQ5pJCF5fm_GPuDBekznqDCbTJ68DRH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExMCBTYWx0ZWRfXysg3faFSysZj
 +cJUavb73HE3V4HSaCn78E1V4StYLh8EpxwhbL7+bLFK1uc57dIALdLQluAWNaJrmF2DbverFnw
 MmLs4jPAGh1Jn8vfuXdoTvUP7HrVuS0=
X-Proofpoint-ORIG-GUID: qYQ5pJCF5fm_GPuDBekznqDCbTJ68DRH
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a427094 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8o_kNyP7FEPhiWKY2ewA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExMCBTYWx0ZWRfXy7rnkT0g5LoG
 JWeKRIOO4xb/MPtdpLhqe85bNRNqtUdc3M6ap8eVAwQrut5Nw+7MJO5EvDS6XuFcFV75uxq9ZZ7
 vo57BLzJ492j/vKvFMP/QeObwEFJqUqidci9bV5j/frBfDJ3HhCnaCungKYU6oq4CjK8alOY6ns
 VTJ0rL5Rmza+Cbs9sHAkmduWqdCgIikQK65NosON/0NpdmbjK0CFEYidS1pj2+K3Iy1Hu9CogrU
 JbrtYXXznR9Zw9rihUI1YdaatddON8gB4HNFv2OlsMq8ftKLr4KIWceuHWWoYfXHuvN2uPec+0r
 /HccDUJOZsmJlNYQ/cGWAYX2CoB+oy1nqs8jC6aW3wLAe9Bg1M7N2ZoWxlpydabcYhwqYJXnE1t
 xefCgpGHyjRyNBtA5bfL50wWn5BfO9X/211zLoqesg4ZAsNQ6YrmJl7TDl1ysveFRoyu4IfoWcX
 gww3uOSNJPfdhxSfiaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115103-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 0497A6DB53F

Export dpu_encoder_atomic_mode_set, dpu_encoder_phys_enable and
dpu_encoder_phys_disable so MST encoder helper funcs can reuse them.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 778e231d4967..1c74ff6f0dbd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1149,9 +1149,9 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 	}
 }
 
-static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
-					     struct drm_crtc_state *crtc_state,
-					     struct drm_connector_state *conn_state)
+void dpu_encoder_atomic_mode_set(struct drm_encoder *drm_enc,
+				 struct drm_crtc_state *crtc_state,
+				 struct drm_connector_state *conn_state)
 {
 	struct dpu_encoder_virt *dpu_enc;
 	struct msm_drm_private *priv;
@@ -1334,8 +1334,8 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
-					struct drm_atomic_commit *state)
+void dpu_encoder_phys_enable(struct drm_encoder *drm_enc,
+			     struct drm_atomic_commit *state)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
@@ -1381,8 +1381,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
-					struct drm_atomic_commit *state)
+void dpu_encoder_phys_disable(struct drm_encoder *drm_enc,
+			      struct drm_atomic_commit *state)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	struct drm_crtc *crtc;
@@ -2739,9 +2739,9 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 }
 
 static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
-	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
-	.atomic_disable = dpu_encoder_virt_atomic_disable,
-	.atomic_enable = dpu_encoder_virt_atomic_enable,
+	.atomic_mode_set = dpu_encoder_atomic_mode_set,
+	.atomic_disable  = dpu_encoder_phys_disable,
+	.atomic_enable   = dpu_encoder_phys_enable,
 };
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 4942097e7613..25ade3dbbeda 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -98,4 +98,10 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
 
 void dpu_encoder_start_frame_done_timer(struct drm_encoder *drm_enc);
+
+void dpu_encoder_phys_enable(struct drm_encoder *enc, struct drm_atomic_commit *state);
+void dpu_encoder_phys_disable(struct drm_encoder *enc, struct drm_atomic_commit *state);
+void dpu_encoder_atomic_mode_set(struct drm_encoder *enc,
+				 struct drm_crtc_state *crtc_state,
+				 struct drm_connector_state *conn_state);
 #endif /* __DPU_ENCODER_H__ */

-- 
2.43.0


