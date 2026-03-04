Return-Path: <linux-arm-msm+bounces-95320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPe7OsovqGlPpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:12:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CEA20027F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DF7530F0582
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF331370D6B;
	Wed,  4 Mar 2026 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOlRJTNo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FafwtGyV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA83221F20
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629655; cv=none; b=osod83P936+pRqYrsJvlWswEmxTMId9+aXnbZzIud0M8Uv0N64WgBQBpw6vv1OEHYvkUs5JhOx91K9Mu02ua74Q0uni3r6ktzI/Z1mMTIZh9K4ligAojwcPFjB23OWlOvwvkh/0qlsefR3QbHa5xt5m+75PQyBywtI3as+27qOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629655; c=relaxed/simple;
	bh=iafQmWDeFIqwxoTztlKqMCFwj+DaAdYsFKAlvo4MX7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnKY6rGHkDgIA0MzgpBvzmMKwYRtpKEP9R1ec2c24ZDR+MjGSTPajIvTpwpyvRvkDT76GOeG+AtiXdlgENL2FTPyCK02FDYh7kPdRSIOzykttNK43rnXyh3f63g+dRA9SmbIQv5AHjgMSFABaR2OhgaU+oyh7ivhsGgjqgPGhhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOlRJTNo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FafwtGyV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249KlOM1456003
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 13:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lh8JDFjF3Cp
	/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=; b=XOlRJTNoBfXKSla9ZelgkxoX0U4
	u+6LcnOCzSs5aA8pblScN0139MWEeEPVdC+d/qI+i1cSDV2U+eNgxkrNWQN+HFTm
	dK3Fp0+7IZTbnu7FXiCCvO1LgskMHxprmq8/64urTd4BBigHGjhQjhuLYM6Fmxbk
	mUGqW062nmoMcjPqGCNspLJUmpusNtOdoZN1XnvmarLKutGR08kZ1T7/RmwJjH2x
	IB1unL7slbIY5pzlhzYjmJUYJtIXDf4L7vxhiYUQJov5b57hbRcQ0DX8AymHO+/Y
	fBms++3VBaaO+Tu7rCBCwgLhlakuoq8LGsIyNVn2iGCeN5x+pV3pyTBzPjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj180n3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 13:07:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so1062355385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 05:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629651; x=1773234451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lh8JDFjF3Cp/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=;
        b=FafwtGyVF/666/G+0lNMwDaOmskgQqPYvNJUR6qjZy1uo9UBDXWZtqJ8iWWGUZu+IR
         T6PHOGHcFhVyT0tmuRbgdYe7DAuxbGuMZOOQC4wYQ5wR5+cmJyNZ3QAJ3S93P/I1WLGT
         nyoeUwb+CiT/+37F+QSIxXb4pdnKQdIn2UUdl0s0ldRRYR0bqR1Kn2Dd1FKPy2VUebid
         a0yJKpdvTfz3B7IqSC03o7LjkOzQOWhtz7vR5MYWIWqJ4yqlRom7h9GMd7YLf0oZ6mFj
         p4TSlfjdueUiZ6UlW0LNtsQ6gtWr4LjGstNBrvr1ZGsUm8SHV0s/t+gFs53mEJ1POoi/
         l3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629651; x=1773234451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lh8JDFjF3Cp/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=;
        b=FB1vhRDL+y6R5rIWjDan0DuMThFlpa0ytsGV/bhZKcO+SHrjfxeujagyy6SD5dThxk
         BQDei4ijgoekTdi2/mseSvoCbKi/Bh8w6J6x9kaXTN0uD/tFMaXIbp+YIePZK3Fu4hR/
         wmEj4Hioto9FM9pyYLMDq2aKHsT7hb0nbjPCqW4KkL1tmDcNuvMnn3x3s13QtiY/Ju9Q
         eFp/TliPQMEltM4peyZnD+l9WiHakaS9t0x4PAMio/T4SrtHHB/3PUaCQL1a4eLy0nyD
         08tEUuAmH+ixlJruZK2Wd42mkubq1VthaMK/ZF8EAI2em6/EjGRCr89/RG3aIIIl1H91
         WVSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUGscIN6Gbj2+Uev4jcN48huPtoZuFR5uZpM4QisAhjHZJs7F6JqsOWWJK5VwrO4ia4jLvTmnoYMgboN3P@vger.kernel.org
X-Gm-Message-State: AOJu0YwahopbfEZDTUWxU9ZBwS6NusDphSi7+HFK3yUH11C+PvRQxEPx
	DH4GAqir0XTKxiRwHw37q+IMdUzNRlMDVR9WwquvwFjE19dXeOPVwdChj+ZgOdpCGKMa2H1ZqBA
	xxX6pGLCMz0XEAtBBoqB4Nhui1DdutNLMWHhbez0ddJTLL1s4Etvr3ZS1Qwnt2loPQ7VB
X-Gm-Gg: ATEYQzxxP+MPni4KfWDMmhksBWIB0bxAfIh0vtK7F2dZ2KfK2irK2Nao3NmjCS8GLy2
	UaUOf++IRZhRb3BjixA08UnsLC9L3E5p9Qz6jSIy1rqrdBeM771bITqQuPkC3OFs/Q1nw1lIP0I
	FyVtFl7udCpgRjTleF6R/5CGsSqdx+UA6IFEQ0BcYXpao/Idp2HRVFB8ww84WtGlbHhAqQF/yGH
	zeNIqPvXTxBG3eiBruSvSAotGCtajNC+Fgx88Ksq/6De2Eom/o3I5castL0Db16bSGPYYhWOJ2L
	nclqxaw1AxZHNU0DQdZkD8Iwc33I6Tf8vU0zrvugA5hWLopSF1BhjLNAkVPo+n9goOs5Iuv6l12
	BWe7vrMKShbdVi2rDzoLc1Oic2VhaUi+zbP0sRXoJIaaNz4hOUS2DQ5c=
X-Received: by 2002:a05:620a:4155:b0:8ca:2ba8:b988 with SMTP id af79cd13be357-8cd5af80326mr235750085a.41.1772629650969;
        Wed, 04 Mar 2026 05:07:30 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8ca:2ba8:b988 with SMTP id af79cd13be357-8cd5af80326mr235743185a.41.1772629650444;
        Wed, 04 Mar 2026 05:07:30 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:29 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 11/14] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Wed,  4 Mar 2026 13:07:09 +0000
Message-ID: <20260304130712.222246-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bNamrcmQXete5Ea7_fhDNgGM9n3PV5vl
X-Proofpoint-ORIG-GUID: bNamrcmQXete5Ea7_fhDNgGM9n3PV5vl
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a82e93 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX7Edtkv5jV+xM
 HGE9XSbCKdmIvxQtrckVmRm0fHwLndYmTDxuBymRX1dQ8qOyYpg1HynzJYss4fimGuHk86X0vJy
 Y7x9kP3sI9+O7cF7b00dLYdTbZSSjQRdHrRNJo5kngU3m7Beb1MReOffcn+tUoqAct1A65zRkQG
 l26YIidZHbLNwxSmF64XrDdgnmBhfNVtjGZPvsCJY1Mfn3Pl9lVbfaZp+AEtahK1CgX6sZ+k84s
 yt2I/TNNarQ69uD9BjaQ9/cVrA9NfcbeoI3SjsNDlxonsGyXn75fghwaiYzNCRre/rwhX4lWLrK
 Ve690KVKdtNkCwVlKq5y2shxF75wrHEw4K9d4MLHuW2WgqhulLt6cDzYea/L/vz+6JYn9rzW7NV
 jXyg6RlxpDChuyjrtKXCyoG30MU8ABC9yvp19l9L9f1avgcQnXkIbWgbe9Kh/KYR2z1clZWt8YD
 JtMqyLalgU9DDmJ+EmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105
X-Rspamd-Queue-Id: 91CEA20027F
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95320-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Fix the error message to reflect the actual graph stop error
instead of graph close error.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index f68d4b4974f3..472b2114c81e 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 		if (rc < 0)
-			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+			dev_err(dai->dev, "failed to stop APM port (%d)\n", rc);
 	}
 
 	if (dai_data->graph[dai->id]) {
-- 
2.47.3


