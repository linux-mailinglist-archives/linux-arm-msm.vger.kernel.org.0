Return-Path: <linux-arm-msm+bounces-115149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TIW7J+9+Qmpk8gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:19:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4E6DBF23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:19:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JvD2Gvqw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JAxkfNK9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115149-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115149-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7453300D74C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A00D4219E7;
	Mon, 29 Jun 2026 14:16:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21AC4219F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742616; cv=none; b=tHHlOhOiHqyUErcwSKI9ZrwsPDOC98EFTkxy7kfl6X9Qr0zPvlKhvrubuDGT9N8annZQhfVMtJLT+FufiqY4sVNfnKdrbOp3EZvaNQ7g/j78fKU2AEUSikGPc2bmRdxaeoY+rjsgM8O7Zh15uMN6Lhr2KjRbn+JssAh9YDk7SgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742616; c=relaxed/simple;
	bh=Tea5Jce8MD/RzZsevZLf4xjvhzOhaNCerFeZKirGZak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hcq5Z5QJDq/VxKmhyKA8jsq0Bi28ArDyPbsJqWBuhWlsezWMASid0PMnXL5PRztQIX/aHQ+abCnn38LURDtk+TvzeAsy9wH9xNo0uTL3BImsecm4IimkyWP1UZVP0grIsAqNy/ajltxxTTEnpNs93LMl5hHfM1cSZQqAVUH3oR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JvD2Gvqw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JAxkfNK9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATC3Q2647685
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nQqaaloZaS5enQFI+d8KGIEPr3AeTZ/Dz4Bxlwebq68=; b=JvD2GvqwA25f4oVk
	7N6XZw4gJYRvggnRYLf6FnqxBHHwIF9dlsH9JJIsrgWZYfxf53Ip6C0l699E/VJC
	wtnHtqs5YpvA80D7BhCLyjd4XIS9o8DeTNAolS5ak/Cpa7CoPQqiD2CIYWd5D7Bo
	0NbusCyQtcXOHO9w0zCNN/vADCO5Z1oWDz10Ozf7k7vFlNRGG/BYxRISnq/3XvGY
	FqMhaIhzChfzsgJyG0PK7bqyJreIOaRWypiaPvZNtPsOIZHR53eP55sEbnYdv2Sg
	vFjY6MvB/GYhze6J0paLrcyqhh1cg9izuA3XHb1LOy4KhS4XKvQXI4yzRTDIq9o5
	uDssUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjhp3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso12834841cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742613; x=1783347413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQqaaloZaS5enQFI+d8KGIEPr3AeTZ/Dz4Bxlwebq68=;
        b=JAxkfNK9SHl747x1OnJeOSMNniVWM1/6h9tcrLAUD+JzoD3nH/6lU3+zGbB+c5wOqZ
         FOYtGt84bl1zuBTairLltPmnd4Oy7k9QXR5EetwGs9Ikt01pFxCRbhVpyt08iM5nZOV0
         uUWIN52qLWnyx+RxsryQ0eqjqrP7rPVczN7hutZepOA5uUWZuFSCd3qWKAvkXRbAKqmT
         FZ6E/75taeanf8RRrY0km6HgSu4SFPZwqVpkTSAadWWlOy+GjB9DUbOEaRxx48ZNRL0X
         2XK2m6n/7V6iG6wLHrk/Gf3I91567W8M5DcfOPuCFdNMygU+Ohxw3Kxy8t6Qkq4jfNHV
         p8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742613; x=1783347413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQqaaloZaS5enQFI+d8KGIEPr3AeTZ/Dz4Bxlwebq68=;
        b=QXCrYP0+PwLDexBmfWIl/pMn4UNhoywRN1RZBYXN1yz82bbZjm2ZL/lXfFkQ7g8ygd
         gYIiT9Dm7rAxrYuKPjS9OJFxEyhfYh/bhJ0YSXvh4jHuMDymDg+qneUW93tpjEL1G9lR
         XCqLk8M3w44X7E9ySPghAG9nOeIv9bHE0g1jNd3ADXtVY1OTRG08BUQI0T3COp+olz01
         APsokbbJ4gQ7PKYoGSZkPZxUS2UvHn+Y2QGs2F/IffpXZ4UxYvKOW74dd/6bvTaZRELc
         0oMKLzI5biUKVAEpr9gHHkMYB/8a55cQLUsYV1mDAYDDy9JS+Y6YkcZyu/YCEAbkOiwp
         Zqog==
X-Gm-Message-State: AOJu0YzjNmBxcHhHi3wvo4ffZqwI7Wa2fOawiVJJvO74DWcz2JFBZOmw
	HLDXZ9BIU8poZxC03eUPsYpYJAEcmFnUemi+DUOjJ6rKSMh2lKRQMcpEcJoxPMkLYlDFtOdZ84D
	165UtznI7dTlS0n4995Y+Vl2NBix8MURQPwfFKrTKnQV09jyoR7uYQayF3S9p+/BkAZQL
X-Gm-Gg: AfdE7cmh/aZ/QEZITavfPrEbZZ3ySkhBN5gf+xkI6F/0pOJUPXii5HqOE5rA1VxoDMD
	nQmndqIeEjtcsuqozwkLIOH7ZtswGyQRzH2uNagzmf219zkqlsieYnhAxouYvO9QO+4AfEhyaj2
	hH8ctJjmH+1ytjjfH6tc/ouTy43KKoQANMlUcGsgFQiRuhIf608DToFKHRfZ3huP5tmdHRp6hEo
	iFPKnmyXAQFeltU+qYgtL22t6/6PvBnj6GooL534VX9rG2L7l43V/93qShLEzQK0N/nqn/rBZ+J
	Am1QAntgw/b7QoYDCMjYw194QHIkUL3XsKLA0IiW8FU9QAJeNdlMIh5GSS/tAiVkK+3WBQ0mIYr
	L9zuvLSR5dtjXhGCe6A0Vmd067JBhBQr37EEeQ2CunIPt1IAI3i/ms6A30gv5jqNAO3m6cg==
X-Received: by 2002:a05:620a:4107:b0:915:6ce1:3576 with SMTP id af79cd13be357-92601f1bdbfmr3942143185a.20.1782742612864;
        Mon, 29 Jun 2026 07:16:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4107:b0:915:6ce1:3576 with SMTP id af79cd13be357-92601f1bdbfmr3942135885a.20.1782742612090;
        Mon, 29 Jun 2026 07:16:52 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:51 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH RESEND v5 20/25] drm/msm/dpu: expose dpu_encoder ops for DP MST reuse
Date: Mon, 29 Jun 2026 22:14:41 +0800
Message-ID: <20260629-msm-dp-mst-v5-20-2ed6aee1867a@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=3441; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=Tea5Jce8MD/RzZsevZLf4xjvhzOhaNCerFeZKirGZak=; b=W7kVy9kZCtWevW5mfwZ7km/5fbrIgOf+iMotKR8RHLo6N+JtiqHQGD3YkAEeTErpGmO3fg171 T5WVMEwKDAnCeLzkzsAmtXtLIY5nEd8aAddEhiCSucYojjSkwB9C1Fw
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K__z1B9_N4QeJ038T5n0ftSrkm7jr5Sk
X-Proofpoint-ORIG-GUID: K__z1B9_N4QeJ038T5n0ftSrkm7jr5Sk
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a427e55 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8o_kNyP7FEPhiWKY2ewA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX41i1I4ZRgN9T
 zzxgIaZ/PlawT2uMJhaVz/nIYbkItj6FAjZi1LLGTQkeT8rytIFrnqBIjjJ9vSKbLFaKKLSZRt/
 KAMJNOb/zHbb8CE2k2iUFOOkGbXeEWs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX90MTeW9zM+Pj
 9ih49e2H+oqei+d29HFZjb+Z/MLiQbnBVYvTvPRFYU2fSHAjFYD8t+W4b/gJ7PykzTX8pdc4TwP
 QokXs7W4f2ji9n43gVFC7FsSToCtCuss7RUUJm6i78mPvQlt6vV3gyBEAoaKemnbQPwVQBf8v9C
 CS52Mz1C4qGb8NhoJkYpfVC2nseBAvI+ApN2XFIougoT7EKeIc7RrPExV/6iNH5FCSXt4SK5mT3
 +9gtFZ+Ee1qMwWTnOpzRQG8dYLzRzC7FOwEfWoBKdoYy5njzbbF1hwrfo0w6qLzIg1LWj5mEvxQ
 l/hMdSc6P5Bz/Nbld/wjzhiSO5tOa40ZyPI3ppa/d3JMYXZTxvebEgGizINDAuedyycQU2+4Kfe
 S6bQik2zeNUrAzL/IMvh6I9u+fexNjknhQ2PTrc9ffTPdV82kPN6KHPd/gi13booE/hHH7ytCTp
 8xbJ1eIP5g8QAaFeSIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
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
	TAGGED_FROM(0.00)[bounces-115149-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 3FF4E6DBF23

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


