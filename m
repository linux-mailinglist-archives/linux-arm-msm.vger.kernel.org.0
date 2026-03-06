Return-Path: <linux-arm-msm+bounces-95806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCKTC9vHqmlTXAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:26:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96282220912
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BD95309E756
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 12:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2415338F255;
	Fri,  6 Mar 2026 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6j9A4S8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJlvksrG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F6F3909A0
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799744; cv=none; b=JPq2l8OGgGz+sqYv5mkWe+LM+1MU2Mm1khsaWm4bnAMc+MndnhmQHt57m84bo60sMowDpDRn4LnBAhTCxlV/NO/T8SGxB4UlhRe6zYvozoetQLfNexth9xDoHAZFJubOV5z2VlBPquuO0yX4n4LeC3pwpqnv/tE2K83Rjku81HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799744; c=relaxed/simple;
	bh=iafQmWDeFIqwxoTztlKqMCFwj+DaAdYsFKAlvo4MX7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KhMhRUEqOe+E3hUDYj5LjdRLB3SDHmRPfaRxBF96ZUZSY/MwKOjGNtFl0/6/oDyi7e5m4e1I326tpmzrn81+6jOr+c7UzPqzBSzNwqRBQrEo/mpn0NKNjTaa5nybo2CEWtfpbAuRW15SHV+lACKNAEz/KCEadPq4ptKd3v0J7rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6j9A4S8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJlvksrG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bb4hY629072
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 12:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lh8JDFjF3Cp
	/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=; b=X6j9A4S8/ZYYxhKpevuaYEVz6GE
	GPd9JoHZsrekQm5J4PH9iFEv5JF/ohDFNmRX2xtD5z8Zf5Y2cDCxi29PEKTrHFbP
	tXiLi1eBcDDLsX0up2XNwtDi/sufdJU1Fp8BuksbhICeq51Qer6oPdASr46Q8N4p
	uumAY+UKtBau70RlPnvDdYoljBdJcHW8mMbMDI+crz/lpjWMeJalZM+gVNH1pvAL
	76z2mmuvpYyzQFDJ1vqRg6WniOgpCO4IO5ZZV0S6dZgyQ8YtG1yamEqn55Rad+9D
	On139bWonIdCI3NGmEz2aMloyWxco3/ZfShMU7EVfYo1Qi8IhISOWUvXPEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4sam6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 12:22:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3ad1b81aso1505839985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 04:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799733; x=1773404533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lh8JDFjF3Cp/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=;
        b=YJlvksrGiaP0nVmTxP7ctRR2Pyzdq85j00iQe9Ex2dr+u0JFQhwOL6t0VoQc3bc4Xo
         mX+B/ZlVu64WXb6EGuVGAyp0Bnwg4S0ZTg/Z8NiZ3gVlmGngg7HavzrHoBSCHbXbjw38
         bkPE71b+wYsTUdc6znwOqJRMxLId/ZdZ0lKTeRPbxBjS8RuZE0MOXhqxLoINEgZ6BayT
         UrVMjJmdU/rcOCVmExoAg00thxJLUsla+6e7ia0bhsB8sSve2JkrEyx3MqXzvmQqoxog
         Q6hjlaRBIIgHzx1w6pPSf+XrDDyfYVDSWMbZSP2oz3wqZS78YvfBxwvTN4HlcbZ+domm
         eAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799733; x=1773404533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lh8JDFjF3Cp/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=;
        b=dgS7LHXFrm9EHn7osvjm0tmX/Nr7zagrk5/FU/HjxZ7V7LQ6S/Z57EsCGg6e290ddg
         rILmUTJO3F+/SPp/vbVixwscCMWcOtxKAuvaJNIiiD+whCRkstqIZLuyJ3gvrAeIocus
         zxynxPUX490G6Xra8t3TsGcXNayY4de9o7ph3dt+47CMVGGc6Spy5cpaVaUqMIp+woZm
         ov1lPDqlP3Y+VcBmdvRJC0rq6XzBU/Qn0Fm/9Oj6gCnWSYQn6BlWxnG0idltDnTcXlST
         ewr77fS3uzYYk5J8p8hZtQUAX7KnpNi8lPv4dtnrb99FBW6s2ZHYb0fYOra0bORoYLqD
         lbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg0NJPwkCN3JRNxHHXsuD0JwpvcACpsglcoHqNzbtIWpPLue0hJnsbO2PL3q8ukLhciPynOfT7qJBL3iuZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxQwP26tZ8s19Gl2AF3wD9sTiBvpdWXeaVu9Rsy5Q/lFC9snzKp
	M/DZvL9sOa8OKdOq9P80+Z6Q1rixEmL3WXvaowxCdrO0Pxf2c1eU+wa0YEHW6XRzVITogX2JXqe
	NJnhXbNS/FDJEhSiZijcfo1lHsuF6S8lanblpZXAUfmN3onIkNUpNEqbgZF2u7H+uknri
X-Gm-Gg: ATEYQzy5HfVGoXBObhO83Lkhj9DPI97/SyVMVNw/98uNsiXScibF2N8qr6fg+UZc3+c
	i/ZHac9E/1smxaDEX692Am3e3mpmz9//sTqkULhoKEXfttaktL7FHOnZMQV/TWiY9JySRO/ct3h
	Nyp4xaiVnYGqo+zkKLTXkzx9J9lTgb6m2lEh2Ms4Q3GW9+Df99wgyFq6SuwSL8M7tcWsAKt1dRd
	leBI6srm836C5feUkTEGJa0jAVnS5i3V//xQHyi+VqKCU/9IRb6gcB9vZDk68wAtZ98rnFCsXCK
	YYZ13xyYmWbjFyUoKqu/RZkK2n63p1AyQznYx1+H9kzEJyo5UrQ0SrKscej8gfW+jgueI23FBnQ
	wN4xSomuDTi5ZE9BMrFkQQ0FyfNNwnQj8M/VbyoCWAmz5SfRy9WBePPI=
X-Received: by 2002:a05:620a:408e:b0:8ca:105a:f5d1 with SMTP id af79cd13be357-8cd6d43d5eemr233444485a.30.1772799733226;
        Fri, 06 Mar 2026 04:22:13 -0800 (PST)
X-Received: by 2002:a05:620a:408e:b0:8ca:105a:f5d1 with SMTP id af79cd13be357-8cd6d43d5eemr233440085a.30.1772799732770;
        Fri, 06 Mar 2026 04:22:12 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:12 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Fri,  6 Mar 2026 12:21:12 +0000
Message-ID: <20260306122115.509705-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX3mV9WvQxHnQG
 iJezh1bKbNCx7lBuX7JbzNs5TeTKB6BRAepK/+/cymo5hzeJlqq56fUikYjsu3ub75CsIqOYff7
 EHVW+Xbt1QSJXeVwU9OF+hAnWUofbOqvsaeDRnw4KqnD6/AVulrx/cu9AAM0JeMtDXzquAJSbBk
 ufvnY2ZdVkNRxC3ZZLIVSI2KYlBgTksOjjcCXF4kZR5MMd6GSgPpak8pEfpVi4ScbjDwFnnpcBM
 0ByrZlcBxlqoZSKbGoGh2AdUHHSzUvCTcWjnWsaJhOeIsI0XKelmRLh7KHspY+2SYiYZj+UiOwc
 Rlf8LXmpmK85MDDMdA9wC+r3tVxskRpTCGmsF+KBlWNacZZ+zBa53djL+ThYMQdlQWe0wB2BguR
 RKdVQF9KbQX5JjvjW3LGjqhCjmmnGYz5Ee4S8/HedHGo2I53/EzJ4zW0b9Wg+Iw19P9xj6p7B5z
 O5FKzx27vjn/LR4k8ig==
X-Proofpoint-ORIG-GUID: c7gDV_ItQMeSwPCwRb047PKjmx8CViSS
X-Proofpoint-GUID: c7gDV_ItQMeSwPCwRb047PKjmx8CViSS
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aac6f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117
X-Rspamd-Queue-Id: 96282220912
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95806-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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


