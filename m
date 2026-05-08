Return-Path: <linux-arm-msm+bounces-106663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL1IDj/L/Wn/jAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:38:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFE04F5D9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1E7C3075FEA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21B13D566C;
	Fri,  8 May 2026 11:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpr721N9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QxLWERQN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ECE3D5670
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240132; cv=none; b=Ca9S/HDq26LflJl/OOVpPtTcU9uVm5/PfPg7K9Kmqmx11Lx/mOtJTts63QALMVkTgj1FxVjQWlRN/2fi6tiR5KaXETvaYHX5eI4BvH5uj5/oyZoXFRlKs3sryuOCmsC/0YzP2E7ZCmWcrdZm6x+vfFUkG7kg+OogTvVgrhpMXx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240132; c=relaxed/simple;
	bh=NlQZtn8DstSzwn5GfF6MCPKiJ3wQUfF2KdGszpPbtHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Py+huhuTLSwykYK/vnkoZmZ8RZeMvTb4TYWm9oJWL49jtxoa2EEhRA904qXbdj0/dlkIAUUKWerysj1TfmcUn3XdMu04OhJevhYLbyLRrLa6osJ+FIFf5DIb7j+pvqf7PjIYbUkAbA9S5BCEg5oZr4F4NNI9auYdCP85is8ZTEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpr721N9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QxLWERQN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489VF9c2771491
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JDnZkDYkQHa
	2ZUxRXFBjMCxswhOtEBVuTzGFMevyzBM=; b=lpr721N9HQ46g6uRpBntDNQRvs3
	5/q9xR9QM5STLeiFqc+OY338vIxWaxcHWEUScN/V+ne27xYL9QqpTprEmnh+x3FZ
	766LndK3Rz8AbfVNISJJ26ISruo5+A26Wif+dZHQxLbQOTSpAcldq4JB10vw4b3F
	IVLP323ixmGDtC5+oevvxtnTR1pbgI2EBOwE2JaeUbhH3YURNbkdRMLgNLFLyTO6
	ZgzzvvDHZYL10NDBwa77kEjbCSyHRQwojCJacd0RV3IcHP0BogRDHm54moGAPqb3
	qqnhyetjIjGDib0ZnIWenldI6uI/sMoslVJ/xG2Pr2AWrhZ7yJlgR8zes2A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5kg9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:35:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babc42244aso37726145ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240128; x=1778844928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDnZkDYkQHa2ZUxRXFBjMCxswhOtEBVuTzGFMevyzBM=;
        b=QxLWERQNdelnPRmk5/CdjH4qDZjyNRYdVte/5KfnBe4Rklce7JgX49fRVCYQw+efMy
         26WDcO/DllIM0ckcggNBewYffkazf1BVH9vO/K6BnmjpUrUtY+UDI4u+84XjyvmYViXp
         f6/IlaOM4XETtxip5ID1avotckgqoL5RM4sC5pQalMKznwjMXyaPFxbdXRH9aiFwm1Ar
         Te5+yn2avzA3VbLpNGbZ5995vu2+cLe5NVHk4tDEB80r/Wb6SZ+MqKY+FA1UPgR6cX+4
         GG3qJbWLFkgbfR8C6IE/S7pfcyw97bWgVOTEbPH8ahwE1nnHqB/9Sr7wipQuGtv63ijO
         O3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240128; x=1778844928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JDnZkDYkQHa2ZUxRXFBjMCxswhOtEBVuTzGFMevyzBM=;
        b=RpamuUnyG03fCmA9CzcW7MmDZX0wV3QO8ytsWkS4qp/WqR2nAnIlaoIoiJFW5qD5Le
         PWOb1NubLu2COaOdzYq9X7r5kxQ2MojquYAbYRHCjjpIoAiNprCz9BRCxhpp0BwF3atu
         kQEn2Uh5V6O8yk4W9/gNEGW9ZhEjKZuZHxKzGnsFhNpgw5B6j5mftNb8nkx+zPhvlJA4
         NfqJbb89G1gXR9Lm8Fn8hgXx1f2buI/Jhj/cSXK26I9LUnxe2VVMxfmxZifvK5KkF01s
         VsXExzEg8FTP6ZQIIrOeRe1SjXYdxc5HZiBGcSWueLeihiDEr8LgakiqClcDKULpVuSQ
         PjwQ==
X-Gm-Message-State: AOJu0YwiQ69O33K+nJAIc+kUgqsh0Qgb6kIK353z8miMNcf21VR1UOoU
	txcF/AYH+/QrCPKN6cU+ngHN/fL1BTuLSivJ7dn1YTuAL8twaxMrRP/xZzLL7kaDSxL2p6XAIOL
	0qMkoJtDves+CjSvSLR3bQPiSXuZhQXS3iKDGm8B6gRfB4b/CEa/mVG/I/zptvJiYmiP6
X-Gm-Gg: Acq92OE+13bHJow6UgkIPjKI1w1MkOFCNz4yEBz/sUvH9DXeQzMl+/voifGCmULzH42
	hlEoVnwaIk0lkiahNMTW+Pv2Ziesngr/aUWS3t4djUKYD1WF4RytTlXoghNr3vNv2lcOMYJnNC9
	+DOd2u66nntGLs3lcNL9ae+EmIiIACIrwhk/yN22sDcmu3TSzMr3LocPwY76tvIg2s8ELm2yycQ
	pfJUZCglkyCQ+fXHDl++QbxZ3gtQMMCdUqFI5UEqF91c8gT6skD2GGksTsNsUK+F/xlx3zayl6T
	9aKpRXZ0hjBRPQDNNxOGDMzL3Hfwha7AlticTi49blxscHp48p+YTsWGUnaqxDKOP9dRyyAc2Cg
	3HPHV2IT0jmZGe1dw9MTradZkTTQYBv/v6cn8KGPSO0hcS/orXZ2ZVP5oYSUC
X-Received: by 2002:a17:903:280e:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2ba78f63defmr94486095ad.3.1778240127828;
        Fri, 08 May 2026 04:35:27 -0700 (PDT)
X-Received: by 2002:a17:903:280e:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2ba78f63defmr94485835ad.3.1778240127353;
        Fri, 08 May 2026 04:35:27 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm26616005ad.36.2026.05.08.04.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:35:27 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v3 3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
Date: Fri,  8 May 2026 17:05:03 +0530
Message-Id: <20260508113503.3550647-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com>
References: <20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdca80 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=E7064k5JgmqFsk_8azIA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5-HsqJyp9e7sZH3bdzS2cs608DcFQyQj
X-Proofpoint-ORIG-GUID: 5-HsqJyp9e7sZH3bdzS2cs608DcFQyQj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExOSBTYWx0ZWRfX1lYFLEhEiYsl
 6smh2MdLzgjsIlHFEXDlF0hM7crtuGgJ/VMqEyDS8gC1tnwahy6yA2RFaMaeT7kyqD6k5OBGuPv
 uQY1ookY/+JNUjYCRrJb8Mcf9LCVDjumYwe7k0Yj+VjOG+UTO/9rjU97M8A++9YqzkN5JXzztXX
 mdyUH/v0oUnoVIrtwxXm1VV7+NtdVON7nQoaIIaCvrvDGvjIu8epQR1WCqF8+gzjOemwMkB2kB6
 JHcyyKm+QFxxsl2qu/qIP3xsKwU5skHO4F3nc+0DqH79ojEQGQ5m4gnvHFz89In02iug+7+WExF
 CJLIWcg1bzFEB0gHKFl0cd9X2N4TlEPhePxeybmtmqlaecMmQ4sHyKe5ZHQqA7BZcBugaec//Nn
 QpxNJgJZILDtCisniMCDZ8RvPFDsVPwXx4GpcKQMucGwg2iuqO0tfVr7QJWrciQUUhaPSv7LWDW
 xWSoomCyEYhVdfT4Mig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080119
X-Rspamd-Queue-Id: AFFE04F5D9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106663-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The WSA macro driver registers the MCLK output clock using
clk_hw_register(), but does not explicitly unregister it in the remove
path or on probe failure.

Switch to devm_clk_hw_register() to make the registration resource-managed
so the clk_hw is automatically unregistered when the device is unbound or
probe fails. This avoids lifetime and cleanup issues and simplifies error
handling.

No functional change intended.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6148de1d0da0..ed442863f4fc 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2655,7 +2655,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	init.num_parents = 1;
 	wsa->hw.init = &init;
 	hw = &wsa->hw;
-	ret = clk_hw_register(wsa->dev, hw);
+	ret = devm_clk_hw_register(wsa->dev, hw);
 	if (ret)
 		return ret;
 
-- 
2.34.1


