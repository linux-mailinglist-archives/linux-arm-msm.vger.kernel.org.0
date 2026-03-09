Return-Path: <linux-arm-msm+bounces-96129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOyPGxxvrmn8EAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:56:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C63B02348A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43607307652D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A1F3644CA;
	Mon,  9 Mar 2026 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mip+dyYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqZDGnib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3929036493B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039118; cv=none; b=TiNcRHtI2AiCQHdjQrTBFCmgydz8epH1RhHr6xejEYbJjwAYDAM+Nklc5Ef/QXOcnETzEC68JZH5uaEq0+ImJdWCuMCsguL0bTDvDGObV9yfyps+nGG2SFKl6iiq8SMdopBkqaLqU1LW8nj9aoVddSByTwscSSlJS2gbqI9DSlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039118; c=relaxed/simple;
	bh=iafQmWDeFIqwxoTztlKqMCFwj+DaAdYsFKAlvo4MX7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRsG6eYeGnrwMIbKmZ6T8J/9w4372z8wdLUM57PwfiMn46tsygx9cYfn0lwz1PJdueLADVZhT5JipMIywu103z4J+dbv4RZGplGFaP7NuNmvUJC5LUx51xH/spu/vpEQ6YsVqy2GKrae0gTT13WFzNQMNU1Ow2cghBdnwx09SBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mip+dyYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqZDGnib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628N1C1j3016718
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lh8JDFjF3Cp
	/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=; b=Mip+dyYrfP6k57L77mLOfimZZA+
	8Vs9P4O2J8G/5HAaihReWYlnb+3pPr4Me0+Cnm8twNACJgatK0SGH6UnSooAFc4D
	Hx3P5NzBD0Z2PyeXc5VwStbwwWAXFvJVMdvJ2VzwdYZTnNYTI5IUXroOPSLJHBEr
	bJ0HOC7FSoE9EwW3C2aSvZo2xq48coRE95U9Pim1RdCkLbovcAFR7vUUdvdHvaiz
	jYvKpygL44yL1ee402ofLVf8nKIwfudPmP2lazmyMMLHRuE9Kiycd7H3HH5gnRgH
	zLqwhV7N8ptmM9b3mFu8cNr5aeR0BOgIx1zwhtoMC12OsnB2mQulwikKQrw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxv80t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:51:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5033c483b76so792172311cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039116; x=1773643916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lh8JDFjF3Cp/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=;
        b=PqZDGnibcShOo2/L8bcLzqyIifiuEJMRJk13ETrecbWuuS2vIPh9JihxrqyQCcnIfD
         qNgAhzG8lb4h6zDFXwHHfWS8M377jAYyfGWOF5Ifq7ehnby5Mqd5O9HoOXGx4fLcJM9N
         oiRqYeEMEfIEcuipz3ToLiH3q/zs5vTXtf65zNZrSx+zOJSbPxyUhxjyBSFL1p9akEzF
         hJmQSrmBMw3b//ZJpRUbiska1oI67svZ1sNXYD0KR3bOrC0lPEKkuRa48P0l6OJWc6+o
         WmkyZ7WwWeegn4vd5SiHvCvQJcaSrIbTJ1QIDl/6d7/+a24HohXYQkGAHqal9SqV53Ec
         +RPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039116; x=1773643916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lh8JDFjF3Cp/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=;
        b=fHrNjwAfW+qLnuihdTsU70kb7NXbGsNjWwYeUxmpN4qt/6gd2NU/Jfnb7/rzJn/kS+
         PdiSDUiUs9XtHFmgYt9/qDugPbHmuZtnD9BKSbxrOKZnihL3WSBdtLy73b933TEtFYZq
         ZhyfHxUdv3snG8rAd2wPcZNMOH1m5K8nzXrNS77krIj31smLnU6fAJ7HzpBOwpqsPUcP
         FDkeDRptpd3fKwZFM++lhRKgEKfMTO7/QV/XlH26kiJfH8W0q6xXMC3eiLG0aNWOPar0
         xJfCEddavoYeZlsEiH4vsXVnv9TiX8MRdk4yV9k19MK2A9roXlWUyo9banQOjUrL65oI
         AYMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw3zUk9Ve2O4IswQahUKNBBpDCZbJu4yLiyn+eP9I4M6h9PBLZTcQWOgn/bonWPWa0D3L65v87yor2mqv0@vger.kernel.org
X-Gm-Message-State: AOJu0YyNC/rhWkMVorG3uMtdCK2Q4gZYqbMDQhr8Z7UZEQGMGPqr+MJG
	Tvmyn+7pgH54AtzR1SCEkce5eLJQQYDawaX6S9PULY40QX3sIJDfBEfQRD8KgDfjBbKvWEB1nrg
	4SQIFBQAWTW/OvKxkWZqmBpOUH0ymGyvaf12ZqVaTCzE5kMEcdJqTHf1prv2jzxvSJDNT
X-Gm-Gg: ATEYQzw1QlRabTa/WFj2zdbwbCgTz15oHpzcoo7r1Rvldk+z3keIv1AwCyLYyPQAcD4
	VQa77gcRo4ctvox3IE+6Hxue8swf+0U8EUVYF/M6Bx6bx4g7RTtbP3Rvn+IWY6hvkPNVTB3VIln
	skQSpdL9zCLmXP2CSwUHzdkQ/bpH5Jl8wTSETQF9rSNsijFkREMy9jD17AixDz4IIfMvfCbaY6N
	LAka/O3yQrPHcd6nxwvb1Eyrp4EalDmP6zVlv/NrZh9v+Zm9LfOeKXUHg5M7ojb6K3WWcWqKA7b
	YZOQB2CblnJ1ycolvtJpYLs8l2GiRDjlLoeuGH/9kblN06y4wFQxXqfQcRVuR+A3AYbjWK7aZf+
	8a5S0LJHo4AuSV3VAUTlU8ACBxqiO9jq4SnDzoa2ztNDsr2lhMDYb3CE=
X-Received: by 2002:a05:620a:1375:b0:8cd:79aa:693a with SMTP id af79cd13be357-8cd79aa73a3mr572511385a.67.1773039115800;
        Sun, 08 Mar 2026 23:51:55 -0700 (PDT)
X-Received: by 2002:a05:620a:1375:b0:8cd:79aa:693a with SMTP id af79cd13be357-8cd79aa73a3mr572509285a.67.1773039115331;
        Sun, 08 Mar 2026 23:51:55 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Mon,  9 Mar 2026 06:51:34 +0000
Message-ID: <20260309065137.949053-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfXzPqhbdluqPFt
 Y1paQKbzR4A9BrjlkQg95dsVG0WxpLX6g2BWVCHZn9/rezgjyo61Enf5Dobb22CbhnxMOr3vDrv
 4VsU6EC5SMwLPteZZ+YvnSAhK+RWdpoEB9UTwWsTVjbtxbxMqSW/bKLQ5uWC8D/rmtKSlAU+Ubm
 tQBOmH/AOfXN+sOKlz8sotpdQjO5JD2EuTndWSANVSCSwBGWWJVzAmJQ7of/8WkmgzaykOmXKgi
 bauCfNRE2xr8i31767tCfyG4U4D7YrxLsprb7CriCa0xz7PAIjfWRnxddfvFh+l2BiAkaEoBNED
 nW6izrpbElXD7ThPdedNcpwO+L8xza5UrB/j7lbFSOGGyP7LZgJfGM/7x9/4NfhSG14oPZvgjR9
 O7F996GoQOuLcT9vTBtCZvFusxo6dDtfS8NJqyToo2wCtegy8v9ZoHkyQ13CIbArVeI3Mus1aZm
 9XzfVo9ks99gwHZ5BGg==
X-Proofpoint-ORIG-GUID: LiqZG7LCwynbC6PceWUEmfV5fnwJT6PP
X-Proofpoint-GUID: LiqZG7LCwynbC6PceWUEmfV5fnwJT6PP
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ae6e0c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090061
X-Rspamd-Queue-Id: C63B02348A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96129-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
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


