Return-Path: <linux-arm-msm+bounces-96121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNi/ChFurmnCEAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:52:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1F1234689
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F40423004D30
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59687363C5B;
	Mon,  9 Mar 2026 06:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7EJA/Gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MfvXRfO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD6C3624AF
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039106; cv=none; b=CmDPmBQHuWZxAT+ID2Fk2Vuyv4wPrLvIy5uCEATAdpdHZ9Tfl2BJ5Bv8KWki8P0w8SdAjqYf0c5anhlMim43YgLgcDxz/nu8VP4XdV1khjNBOb7zk6pCT3/LnDcEwYmpw/iHhAfg6MSC27MufyoUNwX14p+yu2iDThrxfdNu8bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039106; c=relaxed/simple;
	bh=fldykUob5Z2453rW/Bu+WyVup1MSOjtxkIDMh+tQ1tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZyzGApFQ418rgx83mXtRFvLCW4BCXUiftSCaQcNxuUDt4XLsu4Bt7/DWmStHGaCWTxd3APxQjeSSFgscaK+cBsxQGHIKTQKljd51Q+LxDY14joJQjC8pDaQMP0SAY0GdwfrvoA9ztC0u7dfW1akYQBaHQ0O5rC4E5nle2cONpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7EJA/Gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfvXRfO3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6296HEis1888903
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xEO2oGNAYFh
	ISLn7OT5Tnbx10tCrKXxJuovsEhU565g=; b=J7EJA/GhYJBktUzKojKzKwY++/C
	etPbAUN0zX+9c+khiCB02NGge53Poe7/4Let2AdzSqHetqV+BSacX8LjbCr0BbzL
	DX2NCRvbxMOxKjMrUXNsNKvBWdMBUiA+dhvT9Em2I31EvbJLu7rYz2sJaQfFFq/3
	cBJt0Pdp9DiNn83xWLHw77/Wctbzkm/K0gGsxcoy9afa12jSSyohD0CSROIpK8EV
	TMA0UsRCb9ygjRz7lwJkk22QdFbYg9Wy388dTI1JIuWizn6PMm6r59+nK+eM74+j
	mP1vfZujhUvomuWCBQAE2dXjR47ZHVxyRAs7JCtEhB7PR+08zVmuDuh/iHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc83c6vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:51:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd84943c76so583885485a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039103; x=1773643903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEO2oGNAYFhISLn7OT5Tnbx10tCrKXxJuovsEhU565g=;
        b=MfvXRfO3XANsx196vArNFI0PxHSDTf30d1MinX5STGu2wuzYm0/PY3nXh5BjGTX5aH
         ZdH4Zh0AMpiulaJAkNfBdDO/iXqbdgkb7PXfSY+E0wfnEov4v5NsJWr00KQy/cYwm+x9
         2Gl2ZcKr6FyYlCdQ+owPEJrKu0H29BrCDs4mS1YyWdOOhV8sDjBt8ONux+OiaYM7Gir/
         Jxx1QWkGNELITDzMI0yse7Hyfwys7P0yQYdTGS+MSvyk4sysLOE4z8GzFpQeqmQXLWS0
         G5wyGMmGoteb6otOKB6zriYP0O+9WTc8saM99PyxEqw10ugtlsOQJuULgRReF4P/6ANf
         19tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039103; x=1773643903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEO2oGNAYFhISLn7OT5Tnbx10tCrKXxJuovsEhU565g=;
        b=J5NV3F4yD25Nip93BrtBFirGdPGv2JRu2P4pnAAOwLF0YSF05s4SwfbNSciCe3yd0K
         0WYgcuyPqtQ7vuO+FrckOk6UIcajaKWFxI6BmOos5AFFfYIxFjegsCVijdX86ItWrKWJ
         lkk6InwafHO+ivjxlxFBnIrZfaSS1hrkIx4MLCSlkaZewdYR3iufHccEofE4cyYhZOU8
         5iWoi81pukdImxI4U9QnDuK62Bn+qd+JeadBaMzpok/4zpyM2zHsci9Tph/HJA0XPHDm
         9hqC1p//aIEU7f0swO3bp/ouBPDCU6iQGFIE7ITXcaSZkeduuKIZIqnVOEy++LJFqUOH
         92ow==
X-Forwarded-Encrypted: i=1; AJvYcCUW90ybj2TF4TF0zknUNAIhDWSeEY83sPRo2sdBPQGndgjDW8yhbl+odTidRniFJFpSFo3WOiKWaYXf+RAZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxYjRJQlmz2f7YcTJj7YgcmJpiNWJPjKjdJGFgHc5XoAiR0vOuk
	swpnVKjY/fs7ODvZF2pPYx97evZGd3ZxOI8h/3U1CLLf5iGQDHL8ZPwvMVoLdF3eZ5KQ8ArmSrG
	oXLKA2tX+NxDnl5aNnnuGUQDy28U6JOLi6xrK7jxS8PYhoa+u1dJkx3AgIC4WYLO8ZNDK
X-Gm-Gg: ATEYQzyDFau/Lcw496A0GsSgdJyTi2jR8E5ogZbPMgiIHXFjqFCs9hUM5TtAeP1VKZ2
	SavIJicZR/QuBBMyxJQPRiRYBIXdPsD+DZsJVXc8TWsbMaQNavKpWVB3BIGq3AFrF1uV3eVHQBn
	a0xdk10bPzpNMuSDzqEXcRfUtpRg38n3TpbjRd2xEifGC0YSqUhjSya4CXYwpTMnqWPOBNoe2hi
	IMMHcI+6e3wG4JyNd3noGtVo9ecnte351bwVZ1lXE6522nOB87FmBi0949gw1EMbq7q6KpDJmSf
	wnARk/VI8IMWsjKVZm/pr5+t7kbna+2ZY2uDj5/4Vozyagy/htqXWnFUMvCAhsLOgtOF2hDJ0JA
	aZPLvOJOf62u3Et1pryAUNxiWxMvGSz6pMGRvMAydlSyIkxy2gqZ9y/4=
X-Received: by 2002:a05:620a:1a95:b0:8cd:85a1:d136 with SMTP id af79cd13be357-8cd85a1d759mr317508785a.4.1773039103133;
        Sun, 08 Mar 2026 23:51:43 -0700 (PDT)
X-Received: by 2002:a05:620a:1a95:b0:8cd:85a1:d136 with SMTP id af79cd13be357-8cd85a1d759mr317507585a.4.1773039102735;
        Sun, 08 Mar 2026 23:51:42 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Mon,  9 Mar 2026 06:51:26 +0000
Message-ID: <20260309065137.949053-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ae6e00 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=WbEMVPVtDBSXEMPt_8MA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfX9H213ZFO0Wmj
 F/IGdvuqq1pcQ/toYHD9MZ2cLwk4Ylq+Z0lIyalOjXEEefCg0lyxfIZoysVIIKUKPF9yRrmHgCx
 aZjFDEawBp9+g43GToDuNFldZaG2sdnzFYwH/iZI/PuAoELQusQjKer+Rb9V48SzaVqhQvAD2Ic
 9R7ERkmnSjDx6LHa6+RXiXlQ8SUnyOd9iqAc8yOGYAbjRb04njSYngybH5xGU6s2eqfEQMhHrI+
 Lk9XTkS1jfyvltwy4moPPelNk47uuE4v8OU8fMsKLzQ8zhfgR6kOhgfSC31Px73FSzAdIY8xQlN
 +m8TMamGM/coBY8c5+ds3Daz27lx2KeCjtlC8CvwV2NpoAMjsS45R4GnMUsL4Hpyt8oUyKu4ZQU
 VxS5TAWHo0YlmjBa9G1lYm57S0Kxlpxu9G6jBX1w7c9Lxho8DIArQ4RsziwG8K8ath4c42rXGCf
 fyDSeMBR+0Ad5aidmsg==
X-Proofpoint-ORIG-GUID: uoMowJxVsFpcyD-WMs-v2jdtI7qUtSyQ
X-Proofpoint-GUID: uoMowJxVsFpcyD-WMs-v2jdtI7qUtSyQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061
X-Rspamd-Queue-Id: 6C1F1234689
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96121-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by using a manage version of of_platfom_populate.

With this change when the dsp is shutdown all the devices associated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index a4c662be52e0..ebd5e3ac0366 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -752,7 +752,7 @@ static int apm_probe(gpr_device_t *gdev)
 		return ret;
 	}
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+	return devm_of_platform_populate(dev);
 }
 
 static void apm_remove(gpr_device_t *gdev)
-- 
2.47.3


