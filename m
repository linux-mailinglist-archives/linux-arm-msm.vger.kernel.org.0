Return-Path: <linux-arm-msm+bounces-91984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEirKaGihWlKEAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:13:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE0AFB4EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E42F3046DC6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 08:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321B8346E5F;
	Fri,  6 Feb 2026 08:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ku494ya8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwSLFMq8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A8D346E51
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365573; cv=none; b=Gtl3pF6XPafLTxOJETTIfN15+wulFxdz/PAE3qjxMY/K9y+MucSmdXk1leimu935u91q5RVA9CPamik4W9TnA7ZhL4s+Zi+pIuLWXOo658Su/2VCpu5lBpNsT8AKvEgO/BkVousVL0R3OJYFznQJx4F3ip5I8FfCYaxobbC4KuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365573; c=relaxed/simple;
	bh=iFs45nynpZOghqFuo9jLK6SG17R7NMwuI2dqh5glhlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3p3SIRsozZSfVkeQKFPMgezFEhRyhfe6weTmBKt5ZW2opd1t600ocHVo85b0CNxN8QVgCRL37RSnBroeoAJgcyBbqVZkrrVYT561e/bkqhr9Dq6+8F+oDS7iMWxk77Ev8zu34P2y/ZAlBrUnjY3Sd1kwHNtBH5he3LFJyJ9VFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ku494ya8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwSLFMq8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6160xlqu2314345
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 08:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SV7QnoYFt0OYeGaxtyyD1/N76oSB4w/4ECLI7E5XX9s=; b=ku494ya8ZM0fM9wS
	8E5NsfpIPtVMPRk6cy3mD/IQHGOH1fJH3znwCYG66yE2lp2LG1uN8WOqpKxEsyD3
	yIthS49e0kv4uhjgMD2T8AG1byfnoRbkICIM2JcKMeryxfzfwG2DM7LaAIeEFNd8
	d78fGHDfyoPCPTW5d5St2JNVpQvNVDvINOG5be6rF8Cnf3uEfnToL7P7j/59cAuT
	BI9RGVcM+pP/2ZW+1IxDXjYlxr3b7QgoPtABzna+3VMkR3Unyste33LyzMOvDmDv
	OCSllo8vCw+VN6lixvLwXdRZPXRhPqNi6MoBgurGBS52NcaTOqT4PXqzz67dGDeI
	6jy55Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c52mrj09r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 08:12:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81e81fbbb8cso1862932b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 00:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770365571; x=1770970371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SV7QnoYFt0OYeGaxtyyD1/N76oSB4w/4ECLI7E5XX9s=;
        b=WwSLFMq8HadsQqBSh0joL1x5CR4KhZNVH81cxTo5BPmBILpAkOXYrAI1Pqrh3bwREB
         DHRxMY9ihXL8wHQYlZFFsipfI2YbPcb1hjz1k6ljtZMrdiTrZhe3tCIqRciQ/nZbVpR4
         HGL/R9/RNlpCKRw7KKQJJWOiHi7jjLRo3gZD0/KiIFwbrWourC0k5cUGzgQSMpgizZmm
         ccJFp+jSOdbz+qW+tDQMVdVluLuuKWmwSiUPGmiBLEZzuBHYOprjHDIq75Fn5ckYSD2N
         cWGJdTg2UMijT20EchzxvVhkDWT/bWtsx4z0gnwuKiXl/lKBxGqLoOdS6s2EI34+TxHq
         Dc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770365571; x=1770970371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SV7QnoYFt0OYeGaxtyyD1/N76oSB4w/4ECLI7E5XX9s=;
        b=CRA6b5ypvX0NjOm1dEkAovLF58OFdpL9wwe5JZVGi9hzXNU0teCuv7liIyjOPPEoJi
         Oa2Upt5BuVV8amO/Zn1XDUKp99MX+hK2xA9xfHcvgmVeBWLfmxixcphhzawK+tUENdCn
         wuO1+J9kaZgSuv8EnEWciOuClKzKmxMW/TVYU7/L0DGRXOjAfjytPgKkMKJFZUJV6hco
         DBAFAYP2UmpPWUcNfOYED3OUGD2oZ18AKw8PmqvfyEWIJkT4qwkMtFihMyvsYljrdsyA
         lXbZTaGjlktNL9DKXsnb/LRqbUpVE8+PjqBjmJcEqvFRImoCAOxacAH6tk6QG7nTiP10
         Kx+A==
X-Forwarded-Encrypted: i=1; AJvYcCUw9DDjQzancgu/ZSa8fRCi7Tnv3GMUgZmI19jjXIWBsWpP2nyUH8GONw+5LtmXj8pQdVsa028R/hjOawN+@vger.kernel.org
X-Gm-Message-State: AOJu0YwXU7sXjpA5AW46MOTrvjemQBGcXAfup53iDgSoH6F9EBnHZ+/0
	1koeV3DVEvUu1C85zrAE0JhC9qNthFWFPBxYwPafZzKcWXFSAojpJrTV2gQQ6gS4ep2zjM2Jsxc
	BR3MFmlbSUAE+5cSc618kM2VpuIM8ZSwbdHuc/2An6PHZrkkuNNdExf+pqNi5FQTEs5i6
X-Gm-Gg: AZuq6aKI/eT2G9wY8ssCunuPZsWoT6Mux7CkMIoa8ysayAv7rBp8AvIFoF6sQk+T55q
	bx98psqXb1Eo5q6Q6xm4E26+YddhaWpD0k8VtyyQHBtJJVeChyTEIGGdNqjkN/0ogVqWvW+MPcq
	Iuk1s+rz2jUwOPcxHao3KmBRceLPlALRVX0Y28BqwkaiuLWxCObAncs/RFCwQCruE96kDAwulll
	AUUDDojJN1g9n8IqVgbusfrlvECFSyPooOSMZwWRKFiCpfJTY//Ozi0GXhvqJZnL9uPkAAd/TKz
	ninsc3dL4dzqvVi9aXiYLkEkVdELg0VRh3JagXAn7Me8GKVYd7pPib4gFXXhRfjIFiIgg2j4cwJ
	eqTPxVXkgSyA03fl0itW/57yRU99j45WTDs7D87/RyLTgsDlLF9RD9wpQ+QSnNz2HFq6OsMnVqm
	sCc78Je4Xm
X-Received: by 2002:a05:6a00:6c81:b0:81f:473e:e8d7 with SMTP id d2e1a72fcca58-8244176cb4fmr1857905b3a.54.1770365570579;
        Fri, 06 Feb 2026 00:12:50 -0800 (PST)
X-Received: by 2002:a05:6a00:6c81:b0:81f:473e:e8d7 with SMTP id d2e1a72fcca58-8244176cb4fmr1857868b3a.54.1770365570075;
        Fri, 06 Feb 2026 00:12:50 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884b75sm1671866b3a.39.2026.02.06.00.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:12:49 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 06 Feb 2026 16:12:12 +0800
Subject: [PATCH v5 3/6] media: qcom: iris: Add B frames support for encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-batch2_iris_encoder_enhancements-v5-3-fb75ed8fa375@oss.qualcomm.com>
References: <20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com>
In-Reply-To: <20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770365554; l=8832;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=iFs45nynpZOghqFuo9jLK6SG17R7NMwuI2dqh5glhlc=;
 b=PqQrTJLdvxBWO4jFxBtxbH3uxYyDidXaAUtWIzhINz25bOvtB6jtWlIivH9e92/ap70u2JcI9
 2HIhRauAJKVAEL48iZrSodXJcC/cDtuGRzNLQuxTVX62+4m81rt/9yQ
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA1MiBTYWx0ZWRfX6X9StWWgrN2i
 74K1HHL9KQvop5uWKZTPgR/QHM9oRu8rksMUQuBxiTya+8WlKxiiSfdSpv+H2YIhAz2r+pWLKrC
 s8FHNwteERx9z2Jc5rjuRhX/ZHSJds3MkG02WYk3tsEEXUG0fds4woSCSMHmysYh1ckM1eAdboF
 KM2rqVJ7GI0dPMyODpXrZ1xHVMJvElis4+6ggh3I9uB91Xx6cA4x9xvnB38AjrkyuzcbxO7MPRO
 45g+0Q3WQHeTxfBuIzXc2/hoCuvpblaYQLGRTzQxhr/9aZ89wXYfGudafWNeJqY6P0LoO/oxlza
 sbDFLg02GQPnAS02WODUEO366Gri6y1HKwlQNhYKpY4MbRT3qcRr2jFzdbmtyL05mkmDLeF8Q6g
 Hx+znAHvpn5I33l7ykkCzKcAyf6IvN00MF+C6bqzWF4+Fhen2NC8e9zbMkYD9HG8n67af7oXeYG
 dU8iT+yGCZuEmFgHztA==
X-Proofpoint-GUID: p2O_YxhrlThNEdAODwynVZnzZG9KL7MP
X-Authority-Analysis: v=2.4 cv=e4kLiKp/ c=1 sm=1 tr=0 ts=6985a284 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2_V6wWdUOSEACiTAc7sA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: p2O_YxhrlThNEdAODwynVZnzZG9KL7MP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060052
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91984-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DE0AFB4EC
X-Rspamd-Action: no action

Add support for B-frame configuration on both gen1 and gen2 encoders by
enabling V4L2_CID_MPEG_VIDEO_B_FRAMES control.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 30 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 ++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 10 ++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 18 +++++++++++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 10 ++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  6 ++++-
 8 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 9a9dec022b35e94c800fc13ec35bdbba520e7168..e049c28db1d8395736ae6970b5efbb351ce427dd 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -118,6 +118,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return USE_LTR;
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
 		return MARK_LTR;
+	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+		return B_FRAME;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -225,6 +227,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
 	case MARK_LTR:
 		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
+	case B_FRAME:
+		return V4L2_CID_MPEG_VIDEO_B_FRAMES;
 	default:
 		return 0;
 	}
@@ -1161,6 +1165,32 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
 					     &hfi_val, sizeof(u32));
 }
 
+int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
+	u32 b_frame = inst->fw_caps[B_FRAME].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_intra_period intra_period;
+
+	if (!gop_size || b_frame >= gop_size)
+		return -EINVAL;
+
+	/*
+	 * intra_period represents the length of a GOP, which includes both P-frames
+	 * and B-frames. The counts of P-frames and B-frames within a GOP must be
+	 * communicated to the firmware.
+	 */
+	intra_period.pframes = (gop_size - 1) / (b_frame + 1);
+	intra_period.bframes = b_frame;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &intra_period, sizeof(intra_period));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 996c83fdc6f492dc252771129fc1d62e8b7a7e07..609258c81517b71523b682ca994786cdd020b07f 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -41,6 +41,7 @@ int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 74f9feacfe3562d44a8415de83fb7a6c058a3d8c..87871fed09ed753760b6057ad4afa87be5f91b69 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -720,6 +720,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
 		break;
 	}
+	case HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD: {
+		struct hfi_intra_period *in = pdata, *intra_period = prop_data;
+
+		intra_period->pframes = in->pframes;
+		intra_period->bframes = in->bframes;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 34249fc0d047918c2463517b8303e30df3666b97..4343661e86065f5623b2c02c7ee808a3c47a8c41 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -155,6 +155,7 @@
 #define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
+#define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
 #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
 #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
@@ -484,6 +485,15 @@ struct hfi_ltr_mark {
 	u32 mark_frame;
 };
 
+struct hfi_max_num_b_frames {
+	u32 max_num_b_frames;
+};
+
+struct hfi_intra_period {
+	u32 pframes;
+	u32 bframes;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 544c65dea922ae693adeeba972f1418002fe3f92..67acd98e467df037d49d2ea1830038c0c8fecbaf 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -165,6 +165,8 @@ enum platform_inst_fw_cap_type {
 	LTR_COUNT,
 	USE_LTR,
 	MARK_LTR,
+	B_FRAME,
+	INTRA_PERIOD,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 42addeeda47a849dbab2758b11e948606479f25b..e9016609127b83b933a18e44250fd43d25f05959 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -295,6 +295,24 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_mark_ltr,
 	},
+	{
+		.cap_id = B_FRAME,
+		.min = 0,
+		.max = 3,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = INTRA_PERIOD,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_intra_period,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 617879ec0fba39c0f8529d69ccf0bc7612445110..a7ee63e5cbd8b476d765f29ecb3a7d5d52fae269 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -770,6 +770,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_use_and_mark_ltr,
 	},
+	{
+		.cap_id = B_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_MAX_B_FRAMES,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_u32,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 891aed5091c7a0fd0bf1f1a3a7737d49e6d8cea2..0ed82dc2b8af8c789df1b8c10c1a5afc51ef39d8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -936,11 +936,15 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 
 static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
 {
+	u32 bframe_count, ltr_count;
 	u32 num_ref = 1;
-	u32 ltr_count;
 
+	bframe_count = inst->fw_caps[B_FRAME].value;
 	ltr_count = inst->fw_caps[LTR_COUNT].value;
 
+	if (bframe_count)
+		num_ref = 2;
+
 	if (ltr_count)
 		num_ref = num_ref + ltr_count;
 

-- 
2.43.0


