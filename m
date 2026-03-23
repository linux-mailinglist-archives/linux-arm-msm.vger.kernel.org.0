Return-Path: <linux-arm-msm+bounces-99391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ2ONpefwWmFUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:16:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7C2FD139
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB00F30AEDD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C261C3E1230;
	Mon, 23 Mar 2026 20:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWO6czEO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaYtVc2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF663E0C75
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296801; cv=none; b=fma22JCM+jzavNj2RkOP9t4axuqhv5tevwmqrEFlV+eKNlNuFPhVtyv7ndcsZYVVTODKwGdzv24aCRkVHpzo9xJS+ZvR/94DOZUqV1Y6QJpgUmhGAF85CqBSHitODbmiYS7RqjvqW6GlSKsczPLSZK/orxKY4leUFAVZzEEoVxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296801; c=relaxed/simple;
	bh=nnupNIOeLrMXfkuUyA2tcvNb3mffh+T80cPwHVdQi3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CtF4tGOi/qcDMQFfXdns7cCCzAfeEP63YrSK1HLpXcAWp2SGqGh34x8+rTzfLHqy5YKtL8wIhhwXRVW8W+ut10vFw5CHoDQBdQ3hOhLBpY3X7z8eUEq3W5Ur7Ff24BO0fjFYmsT31njJ34UhATwRs6yN1uxnLipUegP1yB2fgnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWO6czEO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaYtVc2Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHrDuk618994
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s55BbPd47G4U0MWootUpuQFOjqvge2EChb3luzG9YmY=; b=GWO6czEOxZHUTfuP
	izJhaXgEvot5as2nB1ugMTX7VRUAaZ0xW15h4Q1YgYjKdPr5SDmz99OD6XY7fR+L
	XaSmUX9gynnYxEWCKh6q0O8DdgW2BwAi5hBRbYEeyv9VveKBpvK1slDOIqqra14m
	GkqqDDATh8nFpUOI9Ioz5qBZrVZFiSE/IIs9OLpVYcIzDCaFUY29XxxHudg7EkJs
	GE6z4xnk+cAE2VIf1eD5f7V/L6rhsimeqyeVr2GBnpRAqzzso+41Tfd/S9axdsLH
	67RWgW/paAgsjl2P+4RZ+jy4WW5v/kInVwQxEkD4bBSaavnxOuoXYW7+Kl6JUsam
	j4vbBA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgjkg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a106b687cso325372b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296799; x=1774901599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s55BbPd47G4U0MWootUpuQFOjqvge2EChb3luzG9YmY=;
        b=XaYtVc2ZN+xeLloSG4Zsbj+4e8S0HwS5+xCKeWhgSyvAmWQ+zZAHq+YHhpXrMYrtxD
         fFkCN/jGxRB+/HiMtKRCnREKaSzOMApSKpExyAOYtEuJvZxfx6kDdV7pGoa/GEQ5LHMQ
         MMZunu+H1e5J83NeigZizDWf2Zm4pf/xpIGjeqrBuuvafUubpG/0Ekvewb3sAWSE8nM/
         UCqussxmxtU80fQU5KXnYkC/6zOVh87WeCiy3W6kOmApsdt7GavngBsnFs5X0zFJYxYP
         dpT11Munyvw8waqwhYzYV6mFdwSd4ck0lx2n2GWEpbpyn/DfROBocWiywQWrLC5UBvep
         Fc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296799; x=1774901599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s55BbPd47G4U0MWootUpuQFOjqvge2EChb3luzG9YmY=;
        b=DiyIQENn4eorf/UZLRvjbJS0Abvjn+N1gSkrYkmHhw5MsqCYAKrwKOZOKTV9R9smsW
         Ng+HQfy5SlzxZ4a+OG6yXBlYCAgQLxZRnr4Cslie+EJapn8bmgu9WcylC4w5S0BYR6yQ
         Yf+lBYokeBDXEmAOcDrxQjfODyXriT8hyuWhJ+iCgFsmEQzSMZMEY1aUusxiWcrcsete
         XK1h4lHTzsDXQmQHA5dlctr3L3ewJU4/QC3IO+vwwbsueSdsXB9+2A9Bkvwt9mywEr6v
         iIL1432EAeRxiU5JARenVJsrlZxGsWjPKCy7AkeByE2q1etvIvROsA3Gd+h0F4cqBNpF
         9mhQ==
X-Gm-Message-State: AOJu0YzGQWL1DEWytrfvzars3CtVdVAzxNXqKUNFAmDttrUApyR08iJm
	W8fYupE4U0d2L4XkDIGsZY9sGDqJKt1DM+gcrfb2n8OaU7fCzE5hKOEolUH7A5SuOZq5ikW2OQG
	cJO4UhRX2Ym6w3Y/lOREiu9ga2EKqOGekBeYfeSPBlB36Lmr7Atr0vAN9TERPjHE1yPMr
X-Gm-Gg: ATEYQzwPM0Be9rup2EiwVo3x2h0egiVeX9SraAdjzt8B7aCTa+BZ6i6w8w5qvnIIUNG
	w9KFgpmrclhXyGS+I1tf1bb+8kfDU5lKLxUi6VfPYJEpjuKarzixtGilu9awXiL7AO0B912oQ0e
	9+xIED/wVCp8T+JFUi3S+AnKvWS3aWYvPHAQheY2bEdzynCAOkmRDXkwf+YdEZd8P3qzqqJa7Ui
	Jv6JDgN/ejbMfxwUk9Kl8rnQPv6CHcU4MHPOGIYDoUCOz1HoYu+nMXRThRdlQofd1oiciNFcb8m
	IWapTORAHRfBfsHjzjBclsP0BLA5lwopvnh5UxJGPL2BDjIaMol+QETN2wgtTr8su+M9GZjQ9Sg
	B4s+z5TyDlxNuC9E0UOpgDO/z6LNmlcgfkFMyeMKwqj+ScQ==
X-Received: by 2002:a05:6a00:1707:b0:82a:6461:6d1e with SMTP id d2e1a72fcca58-82a8c392393mr11129947b3a.46.1774296798783;
        Mon, 23 Mar 2026 13:13:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:1707:b0:82a:6461:6d1e with SMTP id d2e1a72fcca58-82a8c392393mr11129922b3a.46.1774296798223;
        Mon, 23 Mar 2026 13:13:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:13:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:19 +0530
Subject: [PATCH 07/16] drm/msm/a6xx: Use packed structs for HFI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-7-fc95b8d9c017@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=3900;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=nnupNIOeLrMXfkuUyA2tcvNb3mffh+T80cPwHVdQi3c=;
 b=wYEXOm/R6Vsxc4rBfrfyT9WUhx8CW/T2BOGGO+xofnEJDCbPmC1wyW81635C1kRzkWrzKXy7u
 JYNCqh7a/gdBW5mk2jJTJvHPIghQWautFCviH27ZFJuilb3Nhxx5u75
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: khQD8Hfcgztd-HNvf8TbIGLMZmQWFOA2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfX0VPf8bNZErnx
 Dk8sbmNIvBKS3W7TiOqP9nZ6gciR8LUWVcu5lai2ca8h3Ry5L+EsYOz6m5OspuaJih28hECucwX
 QHgndsyy7XxUq0s4EZDP1qZFnxkwsR//b5scWETUllFrVbRuMY04oERciBf0lP5KhyS//pC+gIx
 mMVkCpCZLeaVekb1nycRxGPGtotvyLT4XiXe33wc3+82MaiurggwpKOuQdolu66zO0/EWjHfyt0
 BBo1UooCUlknokhDcypV3VF+n9AFh2ooAOSZwFx76cZtlp1vi8jq6Xs3PpIRJ63ht6XR44sVLpF
 6xfLj69bEV5Oi95NcpW2nbHYhAS9+ZRdZVWuaVtnngwAUZQMqdWxeUkyhBdFWNvhNjdrFzbXAj3
 JhmZTxs2TYt++yCu9p9Mgraug+XwnWXjnt/9coXnL9aiXDi1cvWAHXh3k3Sp55YuNuLdtoQmnFh
 7/qBB+8525eMBbNc7BQ==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c19edf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ArFqxpKCfli7nxZMP-sA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: khQD8Hfcgztd-HNvf8TbIGLMZmQWFOA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-99391-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 5AD7C2FD139
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HFI related structs define the ABI between the KMD and the GMU firmware.
So, use packed structures to avoid unintended compiler inserted padding.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 40 +++++++++++++++++------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 19f6eca2c8c9..217708b03f6f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -13,7 +13,7 @@ struct a6xx_hfi_queue_table_header {
 	u32 qhdr_size;		/* Size of the queue headers */
 	u32 num_queues;		/* Number of total queues */
 	u32 active_queues;	/* Number of active queues */
-};
+} __packed;
 
 struct a6xx_hfi_queue_header {
 	u32 status;
@@ -28,7 +28,7 @@ struct a6xx_hfi_queue_header {
 	u32 tx_request;
 	u32 read_index;
 	u32 write_index;
-};
+} __packed;
 
 struct a6xx_hfi_queue {
 	struct a6xx_hfi_queue_header *header;
@@ -74,7 +74,7 @@ struct a6xx_hfi_msg_response {
 	u32 ret_header;
 	u32 error;
 	u32 payload[HFI_RESPONSE_PAYLOAD_SIZE];
-};
+} __packed;
 
 #define HFI_F2H_MSG_ERROR 100
 
@@ -82,7 +82,7 @@ struct a6xx_hfi_msg_error {
 	u32 header;
 	u32 code;
 	u32 payload[2];
-};
+} __packed;
 
 #define HFI_H2F_MSG_INIT 0
 
@@ -92,27 +92,27 @@ struct a6xx_hfi_msg_gmu_init_cmd {
 	u32 dbg_buffer_addr;
 	u32 dbg_buffer_size;
 	u32 boot_state;
-};
+} __packed;
 
 #define HFI_H2F_MSG_FW_VERSION 1
 
 struct a6xx_hfi_msg_fw_version {
 	u32 header;
 	u32 supported_version;
-};
+} __packed;
 
 #define HFI_H2F_MSG_PERF_TABLE 4
 
 struct perf_level {
 	u32 vote;
 	u32 freq;
-};
+} __packed;
 
 struct perf_gx_level {
 	u32 vote;
 	u32 acd;
 	u32 freq;
-};
+} __packed;
 
 struct a6xx_hfi_msg_perf_table_v1 {
 	u32 header;
@@ -121,7 +121,7 @@ struct a6xx_hfi_msg_perf_table_v1 {
 
 	struct perf_level gx_votes[16];
 	struct perf_level cx_votes[4];
-};
+} __packed;
 
 struct a6xx_hfi_msg_perf_table {
 	u32 header;
@@ -130,7 +130,7 @@ struct a6xx_hfi_msg_perf_table {
 
 	struct perf_gx_level gx_votes[16];
 	struct perf_level cx_votes[4];
-};
+} __packed;
 
 #define HFI_H2F_MSG_BW_TABLE 3
 
@@ -145,13 +145,13 @@ struct a6xx_hfi_msg_bw_table {
 	u32 cnoc_cmds_data[2][6];
 	u32 ddr_cmds_addrs[8];
 	u32 ddr_cmds_data[16][8];
-};
+} __packed;
 
 #define HFI_H2F_MSG_TEST 5
 
 struct a6xx_hfi_msg_test {
 	u32 header;
-};
+} __packed;
 
 #define HFI_H2F_MSG_ACD 7
 #define MAX_ACD_STRIDE 2
@@ -163,13 +163,13 @@ struct a6xx_hfi_acd_table {
 	u32 stride;
 	u32 num_levels;
 	u32 data[16 * MAX_ACD_STRIDE];
-};
+} __packed;
 
 #define HFI_H2F_MSG_START 10
 
 struct a6xx_hfi_msg_start {
 	u32 header;
-};
+} __packed;
 
 #define HFI_H2F_FEATURE_CTRL 11
 
@@ -178,14 +178,14 @@ struct a6xx_hfi_msg_feature_ctrl {
 	u32 feature;
 	u32 enable;
 	u32 data;
-};
+} __packed;
 
 #define HFI_H2F_MSG_CORE_FW_START 14
 
 struct a6xx_hfi_msg_core_fw_start {
 	u32 header;
 	u32 handle;
-};
+} __packed;
 
 #define HFI_H2F_MSG_TABLE 15
 
@@ -193,7 +193,7 @@ struct a6xx_hfi_table_entry {
 	u32 count;
 	u32 stride;
 	u32 data[];
-};
+} __packed;
 
 struct a6xx_hfi_table {
 	u32 header;
@@ -202,7 +202,7 @@ struct a6xx_hfi_table {
 #define HFI_TABLE_BW_VOTE 0
 #define HFI_TABLE_GPU_PERF 1
 	struct a6xx_hfi_table_entry entry[];
-};
+} __packed;
 
 #define HFI_H2F_MSG_GX_BW_PERF_VOTE 30
 
@@ -211,7 +211,7 @@ struct a6xx_hfi_gx_bw_perf_vote_cmd {
 	u32 ack_type;
 	u32 freq;
 	u32 bw;
-};
+} __packed;
 
 #define AB_VOTE_MASK		GENMASK(31, 16)
 #define MAX_AB_VOTE		(FIELD_MAX(AB_VOTE_MASK) - 1)
@@ -224,6 +224,6 @@ struct a6xx_hfi_prep_slumber_cmd {
 	u32 header;
 	u32 bw;
 	u32 freq;
-};
+} __packed;
 
 #endif

-- 
2.51.0


