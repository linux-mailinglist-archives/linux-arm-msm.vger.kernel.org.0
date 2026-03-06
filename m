Return-Path: <linux-arm-msm+bounces-95797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHC7ICLHqmkyXAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:22:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD572207D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D11E305A23D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 12:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EF1288C22;
	Fri,  6 Mar 2026 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQ/QcREN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/4yHYSn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E517C38F654
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 12:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799728; cv=none; b=cDhvG/MBh8XUD4sBozfuRfcMEiSL92W6NdAa08M2rnRiKvZ29dvBgepvQYE/csiz/X/1LXVAVmRioH++5q7vvG5LwhKjkjrJz7OU1dx5XYOedz581VNEvXLenPRBFlmD7A7elO3HageZjZuez1yViv3XDHAuAz/D7poj5niSoM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799728; c=relaxed/simple;
	bh=fldykUob5Z2453rW/Bu+WyVup1MSOjtxkIDMh+tQ1tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d9TO1V/+fB/hf/H0nCrY7DH6PeiqXml2S1YEm32N5ZqfmpT/Y9WQTcuJANg2TO9N5IlqbHYr2KXoabAUo8WhDSQk3i0ifxMYFthEtdbLq3DstYuoVvDV0SkaxvOHzQOLW8DaDV1I8N30EvKJG7GhiNNfqwJkUyLpMdQ4XS706jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQ/QcREN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/4yHYSn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BarZB3716585
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 12:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xEO2oGNAYFh
	ISLn7OT5Tnbx10tCrKXxJuovsEhU565g=; b=CQ/QcRENr2KS6gpMWhsW0hjCLO8
	bQSLFhTz4p8mQLjs/mGDMqd7wVbIZgreE94hxjOHS6vlxEqoMuDWhaUcnSKLFo+Z
	XWicrKgrQXnBGCsAP2kzduEov+jNc/NdDB7ZPDT0WvFsezXtvhcO5qG+ss7Ex4t1
	r0Mi5CTpGe6LP79kjqwlm7X186g/aewvqOJJxNrcoyJatXXX1XglgAVZ/tC5NZX/
	Sivx+lEtXai46Y16FZgHbGBtnkvVaRmCWKo1Y0Di3SewiubP51Xoq/juZ6iw2lF+
	XQNaDIosh9FfRAmKCxYxyuQH4qJfoysQUD1LYVsw66w0Nk5V5SDQNXZIS5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98ggwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 12:22:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a129cd2so5848975185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 04:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799722; x=1773404522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEO2oGNAYFhISLn7OT5Tnbx10tCrKXxJuovsEhU565g=;
        b=Q/4yHYSnkkhFCf+gPNcu2rQoZBeZ1Fa63d7vJixFexw/Wq/LkZTvEshCCab9RQonq8
         YEfOUDVCjOQkALKAef63b/OCBwo3Yib3H3oq7n7plnPr+eFgE5GpgPorJKHnWDrxlm0F
         hKpUEzuxiBElXefB+iRqeeARBvZwGmwWyolhulyQOIXRFD9EOE4gd415Zl7iqMZAQ1RQ
         Y+qyoBvw/0YZ1377foeH46kdtb9qGMjlZeAxliRNKp+Avtefo5W6CdX5MiFGSggg5gZ2
         8Xm8V1H2qQnaL9c89QTTb5EgLi6xKFbItv4Gmc7QJfL0P8+6pufed79EtkSnlecM1uOo
         v4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799722; x=1773404522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEO2oGNAYFhISLn7OT5Tnbx10tCrKXxJuovsEhU565g=;
        b=mYqmMGJu+KA+2320mylRmdQtzngeFB38ncYuVU39712ZrR4AGQGoGPW7PJgPo59ZVj
         skPtOXksiqwkPaZNJ7LGVrgxxqduKS2cmnN0K3pPnvqIOvTE2HFbmZuJa0AcUnmAxS5E
         usmV4M0g6742V4GSVJbrA4zLFNC2TRR6Vh94jhQ3u4AR5rHJNNPzfKdwrD7vqW2KflP7
         RzoFiJU4gUpPGTsPjjmaMT3g0YQdTnf4ernAzSytC2PRINWEOVW14PwksD8QKkZYdbjI
         EIAHfS8jmhhn2BEuwe4LE6/f2ASJngSxH/3FmjC8et9CP1Xxg6fzUeX4d146GRGhdanO
         1cOw==
X-Forwarded-Encrypted: i=1; AJvYcCWbh81ba8f7JEsetEIy57GcZA/pkQbKNv78sqk1gA+JA+WYi+3RTaAbuEUfbUeyeOb2WSNbFUSAjDI9Q9wA@vger.kernel.org
X-Gm-Message-State: AOJu0YzxL+T9reQGUGuwepmzHOEcDJzg5eG5GJjDyv32SFBlJpR0KKUa
	ET6bPH/UA175GAakMbQ5YM0/GejJA0fgrpurnbdDWhjyXGMgiCZv+xREHSpMNXYTqwm2Ew/W9TF
	dav2yBJ7Q5U00eV9o8m7gGpLLaB1ZRQRqv9ZrkuU0brA/HwWd4VY9a8fzQmF4zPXwkZDf
X-Gm-Gg: ATEYQzydgS6/JMOz0QqgprMDvTJFi3OKppHm5TH4lUMB4yQRMkEnLfJ75SavEfCrd1U
	pZ2Y6NMoecVFrjxji2opzHdXQZ2XR6I+vIvh9bvD3ptClE/8j2TR9CqKuCudWSxW/6ZCAFTWlLB
	C03etZ8osMAeSqsDpPTDGMQkymXSYez47+goRFafefo06WFloQcZdwXEIlqciucL0YiQ+T76x+W
	kZyXFmTRGg5BTJoHQms+fJutyHmaohK4ssZunn5QpsJvtizE+GYDTze2Ytm1DMNKTvCcyRTvnGb
	5ikeGOdLHdPTM6QaKyHqjgl5GMAvVdOvjqq5UgNzrT9VBDv0jWteAA76gPb5qjXvcLHN7xR5M45
	OUmSpoTshtwGDorev+wnNn27Ba7qWML3CyfXn+/hBnC6Yvs6llNyGf4k=
X-Received: by 2002:a05:620a:4108:b0:8c7:1271:f336 with SMTP id af79cd13be357-8cd6340948fmr651648785a.2.1772799722101;
        Fri, 06 Mar 2026 04:22:02 -0800 (PST)
X-Received: by 2002:a05:620a:4108:b0:8c7:1271:f336 with SMTP id af79cd13be357-8cd6340948fmr651644885a.2.1772799721635;
        Fri, 06 Mar 2026 04:22:01 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:00 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Fri,  6 Mar 2026 12:21:04 +0000
Message-ID: <20260306122115.509705-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: NnsEEEbykndTw97SgvnJldhF4ws7GjuZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfXzyyilzOEkRhU
 30QCY6vD6zvTgrH/3qSRuUJF/GFvaDBfo4ftbDd5FFnT0qoZEIIN64khJRYeVripwKBnBoq+i7i
 M4bXJVUDm5OJFBKGJbMtgJcnLz/A4x4JhQePsdejMdeOWOJ2ymHmQSkeAPDnei77UwTphOi2dbf
 vE/ksAZ3cv6eG5nAubW7fCM0PTNmo+To+m/1jXmM+uAHJi0SLBTDdNQGba0v2J4OAlKyuojhMSj
 r70fkszV7ujQSFnZbzxSl8R9YSoocB9y2cFHapZvyKgynjr6oQRXjSUDmjKkwJ2sAMou63kdX4l
 ql4/tr0TLAMpL0p6be7kzG8WA/b27QGVUMUJihvO4OdWJJUnk+362jQgHEDYBwZpOS7EqH5g5F5
 hsuQEzoETjafCOQElKT+pDlmpmsI/SxsOlEZATCAljWQoCqwCU6kisK/QNGj2USiJJv+/uATG+c
 3C7qOLpsIoKBw1ozsBg==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69aac6ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=WbEMVPVtDBSXEMPt_8MA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NnsEEEbykndTw97SgvnJldhF4ws7GjuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117
X-Rspamd-Queue-Id: 3BD572207D5
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
	TAGGED_FROM(0.00)[bounces-95797-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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


