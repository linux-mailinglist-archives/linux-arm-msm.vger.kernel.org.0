Return-Path: <linux-arm-msm+bounces-119183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qOFpJBRFV2qPIQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:30:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF3A75BE35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:30:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CiWlGEiz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VQbLB3GA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119183-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119183-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B22763001FA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683F83CE4B6;
	Wed, 15 Jul 2026 08:29:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE183CC7EC
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 08:29:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104197; cv=none; b=QiJjjk+6pUTi8n/DmqDVC94SHohCwjl2uEc1qzMXj0dbtEgrXMb9feqr1HKg4Cz1uMxstXvrtFXu/NmhMMe6UN51Tnlxa3YBa98gcp6tBNJExDEX5sACbyHBDRX2pjFxm/IrT/2HLR7VLkiY9nrG2+VJ5j0FZP1fXl7eiwH2ksw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104197; c=relaxed/simple;
	bh=o4ARZ01tTH4LKxC7OaN73OKp7OJl5tf3fPsvab8XkZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iWle+/PNNfoFFMu2RSEDE6M11h2toLQ6fjY0cfjwLBMg34Nh0WxvZRpuqSmGJ4VcVUJJL7mSwlQha4fb2DYDCHo5A7GZWiBf8rmAlyGE6IJ8suvoLpgn0izZWUjIxM1XDrqynrxK1ds+h8kBO9CXEaHgJlGIq8h9qkGvyvRR2Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiWlGEiz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQbLB3GA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lxh82374697
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 08:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IApwrUwL0UHXKJe/ull5musLsDGYYHv2AUyfZVVBGsE=; b=CiWlGEizouFQpuOU
	Cout2IRecONlNqFVS5M6W/6jWv1ovgZ/lOKQSvL5UM4oSbPhci30WXyDhcZLB2WD
	I2Er+DwT3ksue517pyJ8t9/Z9LcjozDSRd0SmeesSJOm0QK+bjEHLk52Vw29iLlr
	Jd6Wztd04fEVY4EzDYywzP51uBmDBChmzChkFXEQIvaew6pV3tJMgR07DWpJpNpX
	NZefIc2wVTFsmLZ5uXvheSIBOfSuTF2HbbzhCz24YPMfU6wr47np5SgwCb4FaWsL
	z7wgTIqgmw/jElzyWihUu3Nh91aEk1G899+FeMwuvUxwjg2xdWCK8WdTd1vCYO9e
	DVib5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk434h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 08:29:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2caa9a3cf7aso5197145ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784104187; x=1784708987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IApwrUwL0UHXKJe/ull5musLsDGYYHv2AUyfZVVBGsE=;
        b=VQbLB3GA/O9X/RCv+BIkXXvqd1LRQ+MTRNK5G5SMo+0dmbM7UpHddL+Tze9a1E8G4u
         F7e9dJBNNGR4ckbDojZhI3//Gt8+9F+WrllHYoYPQkHIg8lEYmjqXsUUqSQ+g76aTCDg
         rbYEcm5rKePS0fzG5dRqHcNX+0oA02G5vvoc3YPRaP9H6o2WsYEZmxLshjpUqvpEtuV+
         xw5c4705vvJiboUochjEPHEK1M9VrsexF6EI7Ek3j401/YDSfcdHrXUAYwQqWXBNNJKV
         dRLVoJgPVRP7XIi8YhC7e2WQz3229nUO84mWAuWUMSBkGKyVtFvgSnYvVwa9j9qyyahC
         BMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784104187; x=1784708987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IApwrUwL0UHXKJe/ull5musLsDGYYHv2AUyfZVVBGsE=;
        b=XzM8oarnYe8OxUBh3tZauCh1jMV5VBLVcJPTjgUgavkMp5CTneNklhfZknL4r0+UjW
         50t32Y8oOc4gu5qKBBL41OTRC6Rjbdd+XHGTyHxNsMQBsAgBeyEovzS5e3+hyFXsR5cQ
         L34QM0R32q0nSuutzF0aCLdlScqrlU+dCb0q/PaPsRRnQZneHwjbgQoZbgFsXnrfo2LG
         3ZpZ11xt4hJbbJMq8GsKV/MB2lReo/L4Nn74LGuM9Y4hoB2fIOh4Hohpj+p/r6XxMERP
         DNLySL3w+L6uDI26xz+IRuqfVm0BMzEQWDtesPOEp+/N1xiX3bC6g4xxI6HJV1gaXnNY
         grHg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6gaBVuiOl/ynFhncAOgjMii69idWHzJdq2EFERtWMGYJ+6dU8lwycl9LSpSCchi9rmT2MRSyGo5GgPR8s@vger.kernel.org
X-Gm-Message-State: AOJu0YzHOcEFqhMRRwgv9ihFdadJcOoPKm4+fpKl4JY0L1gZb4MAuW6N
	7VrE/NX9krFd45Va4OPZQvFshUbaknYan7XwQ904tBW7SWLTi2U8OzA4m+h+e2HDiHD0dRTHOYd
	sxuPLZSb24r2Bv7+87frmHBcgzF0jblqrfQ/l8he6i6Y47D+Z3SXQXO1ZEsJGW3oy+RQ5
X-Gm-Gg: AfdE7clMyb+bJRg9hIFa8dVGkqV93O/FKSZ5dUmOOFLC2S5cigjBCfMAYNfX6FgKF9P
	SAoAn71VWsj5IyJOjeK/VmsgTcEhysHdn4kjqnMC38FqfPh65RzpGs0kh8xPj3lQumAJDCf2GxH
	FJf+GRmQUtLpfnp10jVXj79AAGau1lUHj2u/TXRVVaVxv/bbkmxKaFWMdPlfVEbFm5ZZ2DsJpDi
	XuhH56kzX+WJI5vmbED+K7h3keSiXkNKKUpBG4Zek9OkIYDH9WMlYuTM9eScwMOFcmQ3l8zLJPL
	sJB0XkjPfjsrOZ1D+Gyeg02oQiS5CK/2pEpf9EJt+xosUq8ii3P6fLJwmY9WxzaAjppGH1IR8Mo
	8uUiLGKrYGC9hFDU5ggQzHxwOtsPVFmKm/R/Svrw=
X-Received: by 2002:a17:902:f70b:b0:2ca:eff:ff58 with SMTP id d9443c01a7336-2cea17fa4e9mr157420415ad.15.1784104187058;
        Wed, 15 Jul 2026 01:29:47 -0700 (PDT)
X-Received: by 2002:a17:902:f70b:b0:2ca:eff:ff58 with SMTP id d9443c01a7336-2cea17fa4e9mr157420195ad.15.1784104186647;
        Wed, 15 Jul 2026 01:29:46 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb75fsm129260715ad.8.2026.07.15.01.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:29:46 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:59:24 +0530
Subject: [PATCH 2/2] ASoC: codecs: lpass-va-macro: check clk_set_rate()
 return value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-2-f0c713ff0b4e@oss.qualcomm.com>
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: GkjMYAOHCKq4Bv4GEXqelURWrkNEYnJm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA4MCBTYWx0ZWRfX5yJkWSHgZcZ3
 vTjrxsKfVUiy5fpSktI7vBoF4aBbPe1nTzLvM6z22viBCBO12Sa9OGanEhiGDuzDphb9udw1gKH
 oip9QXFxRRSkiAnXOnT1AhYqkF8ThBCG7NCw1M5JxDdREa7EvGQJ/eMLWOGrssAqtz/vzGhJyzV
 mMB1vYKVCMPXl1s+d/j7bHSjoaMoj8sn+QKG0ieXJRXFspcUYSlBWqvvUZI5a1TY3QGbyIGtzys
 nWcuSve7zRc6ifdfL+3jPRZThmBr9yhXDByvkMpUr1OQbAMnLrhcjUqccI+M9zDWEAr3tQ17tMM
 C//xSzaSC2TfTaGAVFdOCwWLhlrp6WG9P3cCpbNiEhYG3uMZ2yiG8VC8xLCOnrQygDDFWMfoze9
 VrWXbo8xMFQZenk3WzHJ8PaXcMWKlVeAk/7Qw3NMt1z2jcIJWlYwev8K1zC7j7h6mKCNwiEYP9Z
 nM/ecQ+98RkQHXdAaBQ==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a5744fd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Rw-3s851JbwrW9yZSY0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: GkjMYAOHCKq4Bv4GEXqelURWrkNEYnJm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA4MCBTYWx0ZWRfX96ybNyVqoUku
 70uGQE572tBAXX9OLlwS45GFBjA2MyUg53fyXQYxisDo9kgbND0EWijEejvvZWZvsvUYDry7MBg
 R2IMo33WoIVV7RdQnRl3Fk4hlGV4ABc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119183-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6EF3A75BE35

clk_set_rate() returns 0 on success or a negative errno on failure but
the VA macro probe function was ignoring it. Check the return value and
bail out of probe on failure.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 946051698420..dbc5795b9273 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1605,7 +1605,9 @@ static int va_macro_probe(struct platform_device *pdev)
 	va->has_npl_clk = data->has_npl_clk;
 
 	/* mclk rate */
-	clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
+	ret = clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
+	if (ret)
+		goto err;
 
 	if (va->has_npl_clk) {
 		va->npl = devm_clk_get(dev, "npl");
@@ -1614,7 +1616,9 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err;
 		}
 
-		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
+		ret = clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
+		if (ret)
+			goto err;
 	}
 
 	ret = devm_pm_clk_create(dev);

-- 
2.34.1


