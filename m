Return-Path: <linux-arm-msm+bounces-99793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ME+L1p2w2ktrAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:44:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2AD31FEC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8DDF9305BCA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC7530DECC;
	Wed, 25 Mar 2026 05:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URn7TDI+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ULezFNDx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A816230EF7B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774417467; cv=none; b=c6dCKDxd1KR/CqsqT3xRdewVQeOizcKnP677RTlTe1s+SMBU2J4SVJewBYR2X6xFSjc3nWcM+2VKh8mHyv2+9hN7FyozkcQtdbdTz1c/0FX4BdSK9Wpo1ILO0FlZZlysiwkN2txQ9ydwzJowdDv5RBJNs4QGQR8btnmfwGrcZ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774417467; c=relaxed/simple;
	bh=WLCe/t+HeqUO/8BoXNHtP30S8rRP4nNzjYoPWvfllu4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=guZU3B1FLVFifjJ2dNHU9jth2SqB+rJD7mcey1kGT+74+4cz9bCld0i34T2FBo5QO3/YRGwbtNgeZhvK3JeFYBp0fl2ZNEh+SHISQLmlW43UWlofm2UoBo1WkxLO7XqZvjES0Zjbdyyb2ivMSIjQK5SLfts5qf3prsJm9uCDpNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URn7TDI+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULezFNDx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4O9OK2808009
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OhXXZsU144nDOV3KurrA1K9ytfHO9jrkfCu
	aPOLINoM=; b=URn7TDI+tAM59AXWGvXay9DxDSkJw9bhLcbeLfR3ZcmzaMaX2Vd
	zigEr7WI/ezdjzHECsxm6S8ihDnUwCjpNEGpd+tMTYlkBeMRi1NKXO/aFho7bc5o
	++wV3PGcHUNIPRyK030tIkDfobFZYx1m0v7UPdW57fIHLZHAPMeA4eeva/mwJVU0
	JfpR7Q2jXXz+SiEq4YUrU8tlM50HDXharvTkqMSAhp53sCRCV5q+NcQmmwobZVZS
	KDH+p+anqNaXcXPONgS6qvLzrszOYynyTM/bdKx6DVoEDoyYDumdSGWLe8IlY258
	J1os/UnGKl4EyfXEEa3oO4nvrrx1Lz6A7kQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ekh2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aec07e8aafso23559595ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774417465; x=1775022265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OhXXZsU144nDOV3KurrA1K9ytfHO9jrkfCuaPOLINoM=;
        b=ULezFNDx7s1ywKyObJoBBdBtu2O6KCp8DuaEDFlpMtO1Gf1muGC0MP9QUYMmixSuvY
         AcqrFRJsV2wxSdnni4ArhUStIk9XGnkT+5MZhrcq3xIZ0nzNda/yJOz+NPosTWkAL+fd
         DLRcIxaR7/CXqWh6gtqUneMB4lONvblFpOiEgQW+0SnprfrtXsJo0J8E1neamKZXwhlR
         R6zlhJHPulJDPCiUgHJGAou7hz/QJ7sH58OGlbEL2GTeOxRN22CCef5T3IQYCC7bTSy5
         JavkPDM6e+w+gRXS8t4RykpmF7HOdYL+1HNDLgli4ymIH3zaB/9l31U3VKywytya6mJn
         Ylxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774417465; x=1775022265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhXXZsU144nDOV3KurrA1K9ytfHO9jrkfCuaPOLINoM=;
        b=G6n5q9q3z5JWcKfqV4KlKcPmIGYul2WtBhUCey5pA7kdDtycHlXn9UBLBrft5saFSf
         OEdPJPd1aPGY5Yz4ni1JMtr7Nc6f66UiLhD7ZQX3LaeGGcKlRvYvqeAUWz2Kcv3liHT/
         7Xi4T5WD40/CiJ4nU4UcabqZ9RzupmDDjUUWlz1sdv1QVsFpFmN0Hde881/sXjJBv5cn
         RDwH0yPnGAm+6esi2mEWe7uY4SZIHCDRw2P37tMsFn0V9malXb5+NxfoPdoqDLjJgCqS
         OY7k+sDMhcDGP0zQkL+gtH92wMZyKlI8+uezCQMdMcvjwUFKfqVqv8wiYHxCnXHVSh+I
         +Rvw==
X-Forwarded-Encrypted: i=1; AJvYcCV2WBomRivojHnQkWvc81V8mqg8qGVgkpeKifZUPL+DGKBItwa7sSGRp2S6pWe5BAkLnitWtQrU/QstJJKI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7T1iZV31O05bNCO+CMSOBYkhtDPcsr0aVc100q3DHedAn7hCq
	HC3Q29+ChiD2HYMtQs7nEQJZMIr7KadTDs14nrvh/wx8yNILX0IWDHyzZTmqrAzOs0qnxR7rY4k
	wRff96sl41a+CxIeKg8aUupkP5H1qe+xTVJS2EQPnL9wq2yJ67fQ9xMoIjr9USY5FxW2i
X-Gm-Gg: ATEYQzwcFXn0/QbivVrzc8hCSLFnCxeXqZZWjcwJc7MzXIryjwVbrpYGVM3Kxw3r33D
	FMEd+Bi1m62p/fa3t6FLowsvgySKieYZnnuRc9hIGvmIadNZjQ862RpQytKGXTwg82NHO8YiRgg
	CQxTUjYh9MSmWD2w63N30xn89KWjzRLnB4ikfUyBk3l2axgiihGWFwr8m+mv3MlW79kGs20O1Af
	+yM/4sss3wXW6VfeOwMVI10lgquz/Cy79vVxZswfyz1VJ3Au2LNxeIt7oD42sRAzTwnmK3qkxnX
	sgYZWyxK2FJc8b2XRAjDsogMbnf1RJ1bHMVpSqdwzCdiawsUFoBDnRC979AmXJwRNXtWLrXIedi
	9bkjwMusFlBxrnv2cG8Axo56L7bZXfNgxSItmI6yStwiVAFwpL70=
X-Received: by 2002:a17:902:da91:b0:2b0:b18e:5d2b with SMTP id d9443c01a7336-2b0b18e684fmr19001565ad.52.1774417465376;
        Tue, 24 Mar 2026 22:44:25 -0700 (PDT)
X-Received: by 2002:a17:902:da91:b0:2b0:b18e:5d2b with SMTP id d9443c01a7336-2b0b18e684fmr19001295ad.52.1774417464922;
        Tue, 24 Mar 2026 22:44:24 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08365a62bsm223477415ad.46.2026.03.24.22.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:44:24 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1] ASoC: qcom: audioreach: explicitly enable speaker protection modules
Date: Wed, 25 Mar 2026 11:14:08 +0530
Message-Id: <20260325054408.1994556-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vu_uyvHf4KfCuIdGB1YJFJbVCN9N1tsu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOCBTYWx0ZWRfXx2YyhPSfoxms
 9jQYW9b80foJsJrNUn2QoZlxZNkdRgqhrqC4BGItEMzOQq7kaYvI0yy7bw7rW5UnXMT+NNcG5nl
 JeEam7npPEej8dCuLhMfSR5H9MNj0Sce7qNoejnPvwyeFyb/sh+ASnrp9Ld+z6aDYBoAlS2mbXf
 eg1Es0IhvcpZDHihhEdHTdFVxDqrWIu4NPr3Nj/L5jOlcma/XifFFnH+xVBLhgPZfmNxRVZqTlL
 qNfR55fItrTpE757bXc7pmmIBGgOSLoDVFm3BIuvBFLSf3mZRx009Nnyao19T98CIl9zTur0rQn
 JwUpvl41ddE39Ap50Q3ehOVZpYEhf3YL+0xjX+XXMJqtBGnlG/XyEYgnjiNSJv5wo6rCAtbZeT3
 JNGgnuhXxNGBpl2xY6ugyCSodAKwE4qiNKS3l0Z/2/HMdvsqbR2Lrmb6wioqU2c0W1OQCiQ2bXp
 AvQEEIVEHnNWwSpPnVQ==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c3763a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=FwfZqqFjWO-QNk8qJgwA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: vu_uyvHf4KfCuIdGB1YJFJbVCN9N1tsu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250038
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99793-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E2AD31FEC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Speaker protection and VI feedback modules are disabled by default.
Explicitly enable them when configuring speaker protection.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 241c3b4479c6..ff8cd55b0d89 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1365,9 +1365,14 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 	case MODULE_ID_SPEAKER_PROTECTION:
 		rc = audioreach_speaker_protection(graph, module,
 						   PARAM_ID_SP_OP_MODE_NORMAL);
+		if (!rc)
+			rc = audioreach_module_enable(graph, module, true);
+
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION_VI:
 		rc = audioreach_speaker_protection_vi(graph, module, cfg);
+		if (!rc)
+			rc = audioreach_module_enable(graph, module, true);
 		break;
 
 	default:
-- 
2.34.1


