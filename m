Return-Path: <linux-arm-msm+bounces-96393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GJSCPZSr2m/UAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:08:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A71DD2428AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE6413152F91
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 23:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB1D4279E0;
	Mon,  9 Mar 2026 23:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPv3YztV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMD611H/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F533A9621
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 23:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097556; cv=none; b=ct5j0zQdmiEWpaIP+zF/gCcwBca+6TQA6i50kNsOKEV76PUvsmKxMXI19PoNcjP7LKFfhXNmaVkReSeEZ72CnpXlhFl/PpmVhNz4Gi3+RS3VR6TXnK/Fe2s4MLdYPGEnTDfAS3+xwyu5CnIWWnb3llBmvqMXu25yYATinP1/Mt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097556; c=relaxed/simple;
	bh=BaDqkDWGu+XD1uojRzTNHydt5ix2dxjskfbmR4KTJ9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzi9RKxQANawVaR1xy4swGtI+eAsQic8iuohyR+jtHhPZP2mU8OXSAXkKrHkinaOYyTFSrYHPQpSgQXw0RpOwC1Il387D5wlPibEctr2uWJ0G8U5/QGrH41GUBvhFYFqX6pKIjWCTPx9I5YWube1Buko4GoZ8dAQ7uNj5hOkXpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPv3YztV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMD611H/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBn0S1920907
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 23:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=auzznPiIzKm
	n9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=; b=EPv3YztVJ+FAUct0n2jY0AEZbxq
	N4yJ5ZDT1QeglA759UBVXPrEh3zXHp5Ray5s7pgfyA7mLlCX3AQyJdv4N0XHVz1V
	OZ9QVTI8oCqhTWzLM+cVUnCNq+4M5Yzl97VoxT6SmJnlYgveq6RE7m8Y0lU7CCcx
	k8Haf9d+4068xXR+NUlHuEi8Xqxp2N3uCUYTJneVk3O8E/tX30xB4TcMIxeqWoZ0
	JUFI6cMGgngrsXg/IZO2SB9y28JcPOBNpWnXBZTf8w6+yGT4I/WFdTaYfJcOf32Y
	WMB2yW2wjsiFRzhTaGFIC4a37N06tgo/lxuGc/eVVPmJ/AV+usj7OzLW6dg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy81uw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 23:05:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81be6f05so1097698785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 16:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097553; x=1773702353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auzznPiIzKmn9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=;
        b=NMD611H/h19jKpuLsVaSIEZmStieghkesArYWyGMCGWr5SFxYZngAP+FBROJe/lsSS
         K/adZlpKfn74TdinIBrHZIegYjsL/LU1xzbEqeNOJO+VF800E0Ko9v9fCbsvI3KKQJhn
         +F+gkU8beWD/RXhKXtAi7STEGjltqpOFs0uAZCL4QFObQFVzbKNV86yxc3Rp/wZNJx6l
         Zl8dGLD+82evulOHrsiy5GnDWGFlt3nlf/In8XAniBX6BexHUvyfErZHz6De0RZtHciz
         48kkU+3UA3qB+zqG9fCPxaWdDJTd87fGTjipMzRupo2yZf/hc0AcbfGeLv2sMbwmIduP
         GzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097553; x=1773702353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=auzznPiIzKmn9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=;
        b=PvkWRB/bjiXLIO5Wi0m5alKAOEn0mMXJO3fzGvdrM3SRyrRXH+7hjimFcCVze4P2gV
         1xXNSwmdoX7RQxpQgWqPox+rMLZwNC1KpH6JkG8+2Q9yewLlp0jmeI9LZafmTk4wCTdl
         iI4DTDw+TE17e3Ad4hsVZh8hcztVZsa/x7EyEufuOX+GI98TZ1bM87K/WBjCt8C3GTpN
         HWiGGmrANNxiuQrxTdx0vzXjSI02KGo5OU6VAENSR1uI476HgJUsYBzAQ4u78HL1XYT6
         49nQAI0a0suwcSy+qsaAwJDcop4akj/SgszSbI1PWAfeRZhUWXjMRmWsDVBUJcUuJ12e
         sl1g==
X-Forwarded-Encrypted: i=1; AJvYcCUM0x/H8UoEy2BbKIHymc3CmLhFrullqi1BAN9R61Vpdpys513Ci65tZCCMbRnd+NLFyH8GCRT9yX2tipbZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwR7qifZSRn+rdd2oexYrJhZAbX1mm5v+FULElI3EYxupUrUBr1
	wLQNQ9gHTIYVSeyxrrjZqArFIDGmXITVfADJ/Y9zE0deJz7VGgV2SR3klS6iq+BLX6QqnCRpmEK
	nioVSZ5DGQn5yQYXv2QGZVGD+1Koi6C8ufILHA9C7qH0m83iQJwzPdA/JHg91rW+/yhyf
X-Gm-Gg: ATEYQzx7nD3UNbMK7vBSQH0KJNse+3/1+8wEpLDxPFPjVB9PwLbRVTp/omZh3RBSnOv
	ZtMqp/ZktckqMODJSAX2tU3zgTDCwUHBWCJfrV0uDmeu4F0nPTMqQ+9NlPt1VyDwhcQHzxrUcTN
	6b8Ei+AqKCO5ld29ExjEOFg36fpzu7IeEp7XvZn9v/reG8eI9nIvoIB7vR//O3fcvqWhjNfC1hz
	ZZodSuayDwHFNga2jma3UcSqWyhVU2GSTmrBmX/0ax09nPCS4oVavbwSeDQZWkrgKM7f8LPo4EO
	qyKMAPbzefdFeRMvwNiHAUNEVWny4kPx7b2KYk0sO4/GuqZF7L+rANs7d8oBNiqP5tZse9fK/VK
	vX/MlZDDprUEUhBTUEjGK3UzFeT3nfsIdZ10p448KscmwBVFU4w==
X-Received: by 2002:a05:620a:269a:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cd6d4fcc9amr1622778385a.77.1773097552990;
        Mon, 09 Mar 2026 16:05:52 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cd6d4fcc9amr1622773385a.77.1773097552533;
        Mon, 09 Mar 2026 16:05:52 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:51 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:33 +0100
Message-ID: <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af5251 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=LIGoIQd8k4OXu6S84WYA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: jC13EYNZCYXcz7nmpa5a5eL1FUHojyK4
X-Proofpoint-ORIG-GUID: jC13EYNZCYXcz7nmpa5a5eL1FUHojyK4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX1ZynjeOv3ozw
 /qIB/S7dRIURip2wNKeGr4l7UPsfjsUOfVxDjY/2+lVrgAvIliTpTYzLQqbE3l6ZUif8E9Omy2v
 C77QKenrT2EazXCJj5UeNsPeWiSIuKINxeYqyn8XjHJ3QNPmggSO+sK/zi9N1969eIciDggfIjJ
 YYDqKHW2tA+Vn2jbSASefjiNvgesemO8GtO7dNAF9vIVAPk7u6aaRSjZga34wxXxi+pOZer6wn/
 v234CdcLGnuBoZ3V+FruOt6yWFon/qe9PF9v64ulKosfnpKX4D+au5e5uAo9pUI/XhzZV5NCcUz
 fszk8WVnpTdMsT35cB313TuN63Bh0qnMi7hfLQ6J0zlz09q+umeHI/3WJnk0uX3Xi+8sYixeTEE
 L4VcVkmEtPIOEGRFm2MlORWNCXkrCravtM/PCIuvuoBZFZ3kEQTWt4VPcCFkiRHbUy6DWkWgW3O
 Hl5VI/3ryZog1lcD2oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-Rspamd-Queue-Id: A71DD2428AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96393-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index cf10e8ecfb8f..5bd4147f1f37 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -677,7 +677,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 		return ERR_PTR(ret);
 	}
 
-	qmi_add_lookup(&sysmon->qmi, 43, 0, 0);
+	qmi_add_lookup(&sysmon->qmi, QMI_SERVICE_ID_SSCTL, 0, 0);
 
 	sysmon->subdev.prepare = sysmon_prepare;
 	sysmon->subdev.start = sysmon_start;
-- 
2.43.0


