Return-Path: <linux-arm-msm+bounces-98940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHaEIO5gvWl09QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 15:59:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1458F2DC2F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 15:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9ED9315545B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A7D3C5524;
	Fri, 20 Mar 2026 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKugyLLF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CH1QYRpZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDD73C6605
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018170; cv=none; b=b55+bku8bYK1vJCfV9AdLpaZ/y3JrIVXY3W8JgwzlVahq+0FdcBd8r3c034WBmDUfLVoJZaKvS0UXQ/ZJE0jy/ycUScL1vPcS5G1oHm01GK1t4t5OHSJE8byOV8AK8bl11fKqfkAfgjH/Cbv0oj4GpVMMPhfYZNAiqwSOA/Ali4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018170; c=relaxed/simple;
	bh=6jShP5otc7Z/xglFZY5mqaUqDhEckaI1JOm+jwe6kcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNJim3qhbPaU1OToo8EZU5bkgnZlMm3tWMXT1vb/OpttuXjZHeexFEJftVaaM+yefaUepGk7mvAlpjwimrT6iXm4CNjTzJxS2WVR3h/zAF+TGFWh4cNXTSqpqQEhp61rQRYxl7hyg1sL3yE+d+jBPqL+ROiU7R+jGpvObOKm9dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKugyLLF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CH1QYRpZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KER8IA331914
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWL+GAYqNp
	+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=; b=UKugyLLFffJgxwyOQephHKfj6xm
	KIiZroCPWFahqNu4B2fA4ORCuZcHOvzzbnjqBIvCtdCpZ38sYtR6UZ54oQLG2bCa
	CXRJGR+9mZXR9MOaf2KdCfAZOyhVIOQciOxa8jcoRi+QQis3R/S3kvlcgglsH9Dw
	mpRKs8V9su4VTXQL70DgmCwvylbEdzzv83Hh5opuHEXnVB+6vQlhgNrG4FNg6MXt
	Suui3JXHtpeo757+04hlRwiWxDOhBBjyKQuWzIXhBPfoFoES4BewF1fr8kXjJs48
	9n4Rg7oPicfJRlS3TC647055epdYxFM2ZzQoh83I2VgP4ZrejJooujAMyUw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k083pb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b274f94f8so129802511cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018167; x=1774622967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=CH1QYRpZqeRhZYSbOZPoGwuc+X1yIQhq43IwsyTSfOVXiGopOVc2IYK+Tjvzo1Jk33
         YPX+ExGNveQgSixTWw6i74Rtp3ddYz50npO/wEJwFjCBViMcHgH/2xY7hSCnjusAwxHW
         7UUM8aTAruZAC/Bi1H2qknYW+BGEcGV4NHMyY81UhsFeWbeA0eM1RrdF0WCD9V7+Bhh2
         D2VG0TVO1lfHVtg0QETOzkbWWGt/WSR5m3sv+fC3n61Bo+W8rbYJDruJTCKGYSDLQjB6
         sPbDGkyZtSlIDQBiCTZdbTywo8U8tIRkamthG1DE+OTEEXk2sLfoK0pMeMQ73R27+dSr
         fZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018167; x=1774622967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=bJO3teOPwlSgB8mZXI7q3LrkVHdhYrgL4nbTsUHprh340coHgMGjxeMnxLtaordBfO
         LAjkf5llIS1Y/zcMXWoi8AGnt65ApyUBBAcYvJetYyr9y7bkQJjbhn0+WtEVX40fbLsT
         41kgjPJwv114ty7dxfqRjkFoLzGgliTskXtpriVipHrFgTu2/3pU1EQ1Cu2R3iXamqsN
         nl4y5Zx1PHLORB28zUdMjkSgMkjqhdRbbh/+COQdFe5+qpA3lgMV+hhaCCzvi0GdyDwd
         R6sJr72dL5eUKBUvcUhWeMdwToDjeCDsmxEuh1JodYQqNeApEKgn1eH8LRZERnxECZca
         Mrqg==
X-Forwarded-Encrypted: i=1; AJvYcCVUueImqbkXpxyB1nbS58dEtPoF7+itRApRwpkv89i1iMUdS0ByiRJVSd9fu7RyZS5LoR+7uBiefXvxDZLK@vger.kernel.org
X-Gm-Message-State: AOJu0YzYVnVkCZIXpVS8B0L95HEw8yTSsGPRXPqzV44hWRY4H+wTGnKw
	QJL5O2AxIT+BRdd0w/WRnnuWrY7N76fSxHjAkXhq3hz4QX9/ZKHYrru357LFAf7Xg272pi/nI6z
	Yj03yIJv74Ygwh9rZlyobM1ZPq5dkiGTkdPygxrv7pFVdSLXJ/Yl3EMvgwhGOKhtA771d
X-Gm-Gg: ATEYQzxGYErVCcJ/n7AkUpR/Y9wxEi5kjhJK6byhm4fAgWrJuaxxCSPR0HUL2zI5HrJ
	HmPMJL5qo5JW6pMRKR+UvNtFk7tlW1a+7N7RFXv827g55qDRdiWP+y0ChGzZ5bjRB7cZ8C+ZdQ0
	t7kvIz1jlv5A6ITPdT9iOlUmPZ9NZsMHy30qMyhT4X+wZWFjcPUYQO2Uxsl+/v9PZPJPPPyoEqT
	ac2gQVpIOB0kdCGBQfLqAXNku0dbbJ2QOcDjSBpWF5tHu3VyN0FZVG98M41JuLGpw0nRAo+2XrD
	IUEJNt1nd1aIpjTycOv0n9S/7bPQFvF5aTqwYt00HvO7mPKVRre2i3097lGqIzqb2nPNzzRylYf
	SOkk4i9Dgl/yIqc1+aD2q9IAuq+kYUFilhguLtNf8r4C3yvmUQRFdl5A=
X-Received: by 2002:a05:622a:146:b0:501:51d4:df30 with SMTP id d75a77b69052e-50b245b43e7mr103801511cf.8.1774018167455;
        Fri, 20 Mar 2026 07:49:27 -0700 (PDT)
X-Received: by 2002:a05:622a:146:b0:501:51d4:df30 with SMTP id d75a77b69052e-50b245b43e7mr103801031cf.8.1774018166894;
        Fri, 20 Mar 2026 07:49:26 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:26 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v6 03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Fri, 20 Mar 2026 14:49:08 +0000
Message-ID: <20260320144918.1685838-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MYhhep/f c=1 sm=1 tr=0 ts=69bd5e78 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5HTw2GpdgXbBP0wXRk4A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: omGQEDYDPjUUGc14SSW0Je6hDQzYHeCp
X-Proofpoint-GUID: omGQEDYDPjUUGc14SSW0Je6hDQzYHeCp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfXxTHEn9loqOml
 w0rFl74ej6d+v2y/YB5z4qwZt7iv9xi321CuazxGdxQ8fRbGX+6OrkHT5/cW++69qR+9ukCIYIW
 rLv8gkpYVr6+ps7UBB+lc9gLcCkE68PtDgvQqnshfVaLHYduPhPWkLvKszjPmCuaMbAfhLfOZzd
 k1riRnuML2FYux9ASicirLoOu2fUQ3ApcxJzHytp4/IDIVGG4F19EephG0FSfMC/MTpqSP23Q0h
 WR+s5Brl71iLlwKKxcJzxnE5lBHfs+863MQn9OgFmN/vvN7GH6RgWu+bnIfm6BigURF76zXtdqX
 MAOah5Hn+lp2G4xe9XHCwU3aMp5iGp+c+EPbHKNPRgcWfVySf1L+FP7nFj84vRjJq5Oe8Qugc9u
 ouFoePL3vgyrvjRyI3jyA6bayNbrYS0iVfUlMsApTakd5edZPmJUyC+EoXcL5Xly1olBvZkuM6l
 Uz8M/64j//FbWE0gzPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98940-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.972];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1458F2DC2F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index e732fac9b8ca..1f69fba6de26 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -952,9 +952,6 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 	struct audioreach_container *cont;
 	struct audioreach_module *mod;
 
-	mod = dobj->private;
-	cont = mod->container;
-
 	if (w->id == snd_soc_dapm_mixer) {
 		/* virtual widget */
 		struct snd_ar_control *scontrol = dobj->private;
@@ -963,6 +960,11 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		kfree(scontrol);
 		return 0;
 	}
+	mod = dobj->private;
+	if (!mod)
+		return 0;
+
+	cont = mod->container;
 
 	mutex_lock(&apm->lock);
 	idr_remove(&apm->modules_idr, mod->instance_id);
-- 
2.47.3


