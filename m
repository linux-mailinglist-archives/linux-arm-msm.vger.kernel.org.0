Return-Path: <linux-arm-msm+bounces-95655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDt3M4mXqWlKAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:47:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFE1213CB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 079C4322604E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 14:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65F43A962B;
	Thu,  5 Mar 2026 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceLZRLgV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+61R0CT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749EB3A6F12
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721065; cv=none; b=ksF8V7VCywrldqXO0RX8QlHdpO2Ci1bV6pXp966HK1z9OQB9gnbHEp/Xj4ja1dINm/UiKxnmV6c3dCFEXuRZUBs9E6IgiV+pcqsPva/oSIMyk4mCqGnXueL60ZFeRdZYiFBGwNPpKoZo7WbyLTHKmPqUsBVUFBBUSpd3VQiQOmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721065; c=relaxed/simple;
	bh=uXjrwf6kVU4yfPAvO2dRImodIsQs6Els2Ljkho09jGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wz/1oOWKnV7XnbG43edQuCk9f7g+zNB0ARCqgZ3JXsYHlfYnsrksMDyu1BSYeu44xaIYJrKe/RrosKvQ5rW5R7gCXMwce2yiPDuqFnMgje6OrvRthdvNgJbUx3YHp/xFhG15iI9mNc9QPCoWOLjMcXyAQuMbWy6zSaKiN1SgpWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceLZRLgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+61R0CT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AVRuP2399721
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 14:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XHiLCL2Q/VJoKNHmnopqEVjk+hwroQfPTl82ni3pxPw=; b=ceLZRLgVk8jHQ9/M
	hohkNADPvfLT5HyhOkDJjY5LBvmfBSeuirkaFv6Tbc4CvJPP+Nm3oDz72ZploFhz
	D4jgCv7R/q9JVP69bcseYtk8xxWM6+iOkrPPOshkMW4DuranxeRQBIcsJZPXoCgI
	McA1i7uMdphKd0ZEJVJubojxy4sW0BmZQr39/l5hysITHcdqUPX4DweVebmP8NRG
	Ku5LWmow580/bCRsvY7hz1lWMd25m26z6eM4SnDbo2WOiy6Euz663dI3Nhb/fFCc
	8WM7O8ed5FsezrJ7P8CmbqBR7ggR4ZuSIFD4nndIMKRJ2T3Dk+PsuiBqTf3Zxbo4
	p+sLbw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq85dgnwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 14:31:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ff9f727641so2273514137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772721063; x=1773325863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHiLCL2Q/VJoKNHmnopqEVjk+hwroQfPTl82ni3pxPw=;
        b=E+61R0CT2P/TpFxXrmvpN3sS2VpKakWHd54Np4DllzrUKD3xrNKJjPrIThmOnLcNjO
         3YgvDqAVWI7XM4qA39HeFoQUgxNtKAbOU9y+V27ADEa4EivsdifEhT8d2eHdMcg5AlUN
         f9WXhJnHvqyz5pxfSsY8u55HeVrhdWMXZhQ5+DnREf/CDubNRzVY25zCfTs4S9bims+I
         k39BHD4hlBzwLhPwW51FLPxDYGnI3aP1/vOgzvtNodyZ/x7lR5HjxJffLYq83cOGsaPN
         L9DAoocsaNxhYUkRXcQDxAWpllr+QP3agF8uS6ZVfCsEfAgKLMuH6mkpqF0jzYFMDcEl
         QzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721063; x=1773325863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XHiLCL2Q/VJoKNHmnopqEVjk+hwroQfPTl82ni3pxPw=;
        b=dLZeB7UBlpD4MO0NSEevip7Lgsgqcnd428NitN+r4Ta+WsY8bqEqQUFt7+7HWodg2A
         CCLT+DJcD/so588JK3ZpbN/nmSCiJhLFsx0TJbeXp7B0sBNJAayDx6V/gX7NxNaPEqx+
         4jWWvAoNO4qjPrntH1CtT1UQ2AjRNoXvMCYWMjUgmDI9JL9tKylt88CbhLwi9Ua5Iobl
         SM9twQqvaMpr1JD1lfor7FT36925H04G6wQeXmXYRjslSEgVUw+HmxjSTrBWo1NX/yYj
         YJ0XQj3sZMWnFbuGTUKKB825rIvfHinkWFk0z/rL2ouvO1nk1/PYJR/h7L5d0+t0Vir2
         sZhw==
X-Gm-Message-State: AOJu0YwZPVzWYHSCVrQit/sJm6u1DPlJoi1HYUM5opfG50j9gRSig9Fi
	LYLtzQXTMAj2ghooNgtQQIMe+/xieJAHWTauuLzYu3Sxn5S6ywxF7rE9bbzt4kuuBhIgABkpUbX
	ftnX1uZ8owwKBSC0r4x4OpxiT9/Y/B9BDyTEXYgv0Mx+oSR+CIPaf4MMqW4WWYuwVgHmI
X-Gm-Gg: ATEYQzyBPwr5J5toRDeBND6rSVlEGgfeEhI3Zi/lDVnchWn/ltlofSflWzrczERWlX9
	Johvex2Bv4VL1R8Tmd3JnhEg6Iv3s+8qGq9uHuN3IxBmvGRlrHD7XHdawRO1R1mLSktXVGsf3Mk
	xhHeJiVFEfIl6orRar8ck8acYY3XCxs0qQSWRXRR2ygxhNtjMy8vJ+YzDFx/hd1LDUrZ3rREDhs
	0IH4tk6O60cmdpuo7JCb+GBCtdS3MDTOmS1imQXCVHQjUyysAYNjdqFkLbiRuWcIE4M3PxrseC2
	SzPXXRY5dtrg9ZpuFuyxwwEGyOnGWr2R8QABUZBb6c5JeO1X//rLAbwX2xI58DmZ1ber4wPthUN
	A02x2pfh9Btjn1Eq7MBXV8kVudzgrf9K3rKp56GtpfbWLlNSYcmhwKAbVKZ9aoiAC3RdglPwQNY
	19dIyA7bL2hCsjNGoKuBkh5cTNghVjwsA+GiU=
X-Received: by 2002:a05:6102:2913:b0:5ff:cd6e:85f3 with SMTP id ada2fe7eead31-5ffcd6e8968mr775550137.33.1772721061229;
        Thu, 05 Mar 2026 06:31:01 -0800 (PST)
X-Received: by 2002:a05:6102:2913:b0:5ff:cd6e:85f3 with SMTP id ada2fe7eead31-5ffcd6e8968mr775509137.33.1772721060212;
        Thu, 05 Mar 2026 06:31:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:30:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:48 +0200
Subject: [PATCH v4 6/9] drm/msm/dp: drop event data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-6-39c9d1fef321@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5908;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uXjrwf6kVU4yfPAvO2dRImodIsQs6Els2Ljkho09jGo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOZPMNKFcGv9m5Q3LD4Nvt36+SPyZqiRmLc3
 KrK2MAgHmSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmQAKCRCLPIo+Aiko
 1Rx7B/kBlcyEkD3uku+ktv4gegHOeY5dLhX2TnHEj2QvBgblCGeJoRfZRtGEa2bKZ5VnX/yzpJY
 SzUfiiffJEGa/UdrYDgzCBUhXp7H66bNhKzIWc4858VqdOK9UPBlZwr9mZoFVbVQbmL3qhRTHGF
 czSgR800dgvtkjmrMmYjzxABc0Yd1yPvrLC6E00bKZh+XemXl8nCXVim6mjB7aX+aVsNDRUgeTP
 CLVzbIqs3IysSyr0QXLeMJtnsDVrbxp17mi67y4WH9E0XQZuE/UYfQy7jnQ+uViJFzNz4YMAjTA
 UNFChVpyRyjlsHO6/oOp3BMBoQx2Y5/mrOJjjLXukasOVlCB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ALyv7YOpInJTUPOA4dZFOjwDBbkIvCjK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX6n5Na6EVRh3d
 wtV1Y9q3L/psog1lIqBcJ1vBzsPP5/BHFffSf+3K7GEqm7qIxTEDqazIKC3TcxO3+L/Ai8xpUAk
 IK9Ns1Rk2WzU8tXZ8VXuuYR7hShU1yVFt2YLR/fEXmkBy5dgIJ/H31JAKaByO1pWqDy4ogIU/U3
 bieVZjs24J3HIDHdd6PXujk4/v8WjnvvUY+PRnWei/7yqdBAPNY/98Oa05yLn3jIlqZwUNI+bxv
 t7MHZ3tqTNYDFsJPlt/4mxqsggPel5LKj2TyEFQaDR0w7zYZVYmbuQCO1cnvdb5ZvjwVowwAJ9P
 89SA8wqkVZ8oig1/lKhS6GK3oRK8lWVZLjSceByGqoeogX2hfROvPDFQ/A79WUyVN86HNw5xcR9
 RvdwJTaoLKQiYqOmu8M7l0P9NAodACP0lt1yjnDQHPc8kgu42fyv4+sb0rAgdZ5GLABW8PCDm4M
 iKPL0KA9mSprcTWSbIw==
X-Authority-Analysis: v=2.4 cv=aOb9aL9m c=1 sm=1 tr=0 ts=69a993a7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=zd47t_UtYfsHpvN5YEcA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: ALyv7YOpInJTUPOA4dZFOjwDBbkIvCjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603050116
X-Rspamd-Queue-Id: 2BFE1213CB7
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
	TAGGED_FROM(0.00)[bounces-95655-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

With EV_USER_NOTIFICATION gone event's data is no longer useful. Drop
it, removing also the argument from event handlers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 05c292e27126..bc4078c229cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -69,7 +69,6 @@ enum {
 
 struct msm_dp_event {
 	u32 event_id;
-	u32 data;
 	u32 delay;
 };
 
@@ -218,7 +217,7 @@ static struct msm_dp_display_private *dev_get_dp_display_private(struct device *
 }
 
 static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 event,
-						u32 data, u32 delay)
+			    u32 delay)
 {
 	unsigned long flag;
 	struct msm_dp_event *todo;
@@ -236,7 +235,6 @@ static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 even
 	todo = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
 	msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 	todo->event_id = event;
-	todo->data = data;
 	todo->delay = delay;
 	wake_up(&msm_dp_priv->event_q);
 	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
@@ -576,7 +574,7 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 	return rc;
 }
 
-static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 	int ret;
@@ -602,7 +600,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	if (state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_DISCONNECTED */
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 1);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -644,7 +642,7 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 							plugged);
 }
 
-static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
@@ -706,7 +704,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	return 0;
 }
 
-static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 
@@ -724,7 +722,7 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 
 	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
-		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 1);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -1079,7 +1077,6 @@ static int hpd_event_thread(void *data)
 			todo_next = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
 			msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 			todo_next->event_id = todo->event_id;
-			todo_next->data = todo->data;
 			todo_next->delay = todo->delay - 1;
 
 			/* clean up older event */
@@ -1105,13 +1102,13 @@ static int hpd_event_thread(void *data)
 
 		switch (todo->event_id) {
 		case EV_HPD_PLUG_INT:
-			msm_dp_hpd_plug_handle(msm_dp_priv, todo->data);
+			msm_dp_hpd_plug_handle(msm_dp_priv);
 			break;
 		case EV_HPD_UNPLUG_INT:
-			msm_dp_hpd_unplug_handle(msm_dp_priv, todo->data);
+			msm_dp_hpd_unplug_handle(msm_dp_priv);
 			break;
 		case EV_IRQ_HPD_INT:
-			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
+			msm_dp_irq_hpd_handle(msm_dp_priv);
 			break;
 		default:
 			break;
@@ -1212,19 +1209,19 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 			dp->msm_dp_display.connector_type, hpd_isr_status);
 		/* hpd related interrupts */
 		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
+			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 3);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
 
 		ret = IRQ_HANDLED;
 	}
@@ -1649,7 +1646,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	}
 
 	if (dp->is_edp)
-		msm_dp_hpd_plug_handle(msm_dp_display, 0);
+		msm_dp_hpd_plug_handle(msm_dp_display);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
@@ -1721,7 +1718,7 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	if (dp->is_edp)
-		msm_dp_hpd_unplug_handle(msm_dp_display, 0);
+		msm_dp_hpd_unplug_handle(msm_dp_display);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 
@@ -1843,7 +1840,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		return;
 
 	if (!msm_dp_display->link_ready && status == connector_status_connected)
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
-		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
 }

-- 
2.47.3


