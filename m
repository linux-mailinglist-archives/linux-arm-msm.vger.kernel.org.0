Return-Path: <linux-arm-msm+bounces-119229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8pBQL452V2p2OgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:01:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6409075DDE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:01:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iJxxydr4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d1p5T6dA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119229-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119229-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D1103112018
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C95144C641;
	Wed, 15 Jul 2026 11:55:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E4444C654
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:55:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116543; cv=none; b=OK+SSPBk0BoklNEhqKTyF8toGj+u+gwHJEB2N8cVoFHlPmqLoxY+KzpgpqIXufEHYMNk9RDX8TxVhFkpewC/5BcA2fOnbHj/s4oiJlvXX2+ry8qn33gsUEBA9U/X+4bHOSYJ7BpfQ/XJ4QApYoGaeXzaANARY6QyMdQrO+Tqrcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116543; c=relaxed/simple;
	bh=4AQ54cmWPnFr+3twy3tWFaNtgWbMsdIwWCHjq4Tfy8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5dI89W0MytQBCK6yGmX4dz0kBijOOt1yHFlEv2AOFEvTSdkm1jV6A2jxhrnKLOI/93TZ2t45Vj1+CQYM48qFtEPF/Z6KbCddASTbW2Hj80D/83JZLFrsk29+b/GbZ97I3iXILr5xmRImnUrHsH+WpIITGXvPv+utTVI7sAWfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJxxydr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1p5T6dA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBchY13599457
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yofOFhOUZ2WUf0mVwglBwOGTWyTf8BugNAcaGQjT+eA=; b=iJxxydr4g2n8GI1W
	/L1dnOmQJ5XK0MOqkPemV1kPlPlgkZ5mqObSbGD8oE6fdQQPUv6wcl7zMgwCGXXh
	4gN3pZMnZjatSuRqMI8pp2az50cLbA6tCK05AKzEDuqOpD6x2czdD9xG0CDiNMbE
	Ad0mzfRsX1OFLgRw05eSAV2XVC9g8mjatDq5daa1RfX+FMcSefFUxJWbDsxjX3B4
	le5wpgFf+RfxIYhw4yo55KFwWho99fEMRlnrv7Da5XOErhYVSB3NUfJoM46pkwsd
	jzXPT4C9Ji0gHzzUEm/pa57H18WINsC0ALgkXECP3ynu9QimzTUBsionGPGkNhtF
	1NWPUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q60h8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:55:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso2517858a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784116540; x=1784721340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yofOFhOUZ2WUf0mVwglBwOGTWyTf8BugNAcaGQjT+eA=;
        b=d1p5T6dAPWOibE4Voj5s/7cFy5XvAYeEP9pOpgmagRxS0Ugx1bZrHkqRwVrXbi2zZg
         I3nufVzdKLq+Yh1S9uetNYjlrmvcViIppZBfiVbt5l1KdNwUzoi4FEIJcqutpVbkX1ZL
         YiuvVdwtkBQv/gp5jFxBQnKLo9sJsA2lEdVtJ5Kh+7Hfed5xSwoPwEE/skx1R4NcbkF1
         6D8U5RLJg18FVmGiONLa3Fk6VoBlfHW0aCdCuvpXz5M4AkZft3kd2t1l2i63r56vmV0M
         xIBrRo9Ffr3KPyy0fI/oNdRdIOZSqMCztg2ekVRiDZK1nZjMdNpPUb1mHqvOD4Wr4z5r
         vRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116540; x=1784721340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yofOFhOUZ2WUf0mVwglBwOGTWyTf8BugNAcaGQjT+eA=;
        b=KPxiDB/LJYfTcvOzAorrE04ZfOEiqVYxk7Jm+5KqHhiKryX9a5XnkRGhK2yNAeJubJ
         kyyAAsVlZsbSmdXFdWXIPDj3ALpK5cQvkAePmMHoQoPiO9AmkWLsqzWRiYs6ztu+xRDr
         YtMY3dVH28K/qHUBIvXvX7KAMkBeGz6VMgvsv9LRdx3GOP66wTcH6Y0G8kqb8ZlCjFYh
         3Bu++BC90CiY91OE0EAUSfzpB85VmNPXua/P7Zm8ZjG2FM71cQp2sQQJbWbEmNVQSdmP
         05IPBg2lBleNJDjMEayEOvXaZW3IjqdmxKzRe+2hO66lnhJymGTj6PRldXhLCTguv28K
         KKNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbimuUZH2fFsnidUoJbX3vJavjW0FOm0yJelGdcXyMuOUeuOI3AMCnW4+X/qN1UvfMZuKaH+qiEYOPu0e7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6UWPxa8IGYUrFAPKlTYhPJ68G3xtBeqcjC8gFEfZcGVy2nGJs
	uTn+MZkwTbb1dsvvj8yunA6oJCqj+3Bb4AY6a5xeIexpfgIImo3VkHLp7qrpmWluir8MdDA28AU
	u2MF7FJMqIJZXj1UsfplaqDnqXFLer7njqxFBaCl3aDecFFM0I/vPcyYaVqCNyFcBxEinw2CI38
	bc
X-Gm-Gg: AfdE7cn1EFiU8hnvMfYhrO6uCtqag/6VfZD6kPL034SFjRZWBsLAXfwwLVQ676gc9t8
	RKmu63KijOgD5CsmD1C9fszpM1MK8/f+/RqNLPSJHsP9YCpbbjaHxd+uXGaDGVxK8ZM8mRRScWQ
	XshmWknElV8qj/rzGXzMJB+iLtbqugxcqJJVtt4a6LwbwOmvEOFXKjYXSlWEiMhaYpO1/Hw4OhZ
	Jtdv7XxCETjJbu2eWEVHfVzQalLZQPa3LSzsNNXywQqxlocQouIgEghouHzhY4DSmPW72OTAdEe
	aUxti7YuCtwIOhqIIGZOc/tZ1W/clMp+MeWwhq8djyRXoQvY1dNFFoTaLSzNppbmnSz9J+4/Ym6
	BhkP9G1ejr9Aepohx1mMd1vC6e+0wb1ZV+wKnX20=
X-Received: by 2002:a17:90b:3ec7:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-38dc72a4995mr14964175a91.0.1784116540057;
        Wed, 15 Jul 2026 04:55:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec7:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-38dc72a4995mr14964151a91.0.1784116539633;
        Wed, 15 Jul 2026 04:55:39 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5326c0sm870683eec.11.2026.07.15.04.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:55:39 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:25:13 +0530
Subject: [PATCH v2 1/2] ASoC: codecs: lpass-wsa-macro: check clk_set_rate()
 return value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-1-16ca64c2b929@oss.qualcomm.com>
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExOCBTYWx0ZWRfX4X9xxHU4VWpx
 8Oqx01zk0/LTqCFeObVX9A8EI88/6Y13uysEp4WPxGOCnXN1IF9JeYwiHdkDJi/GBta9/s493um
 nSlNGyYZDlr+TpQx5Ih47S379Xj+Gn0=
X-Proofpoint-ORIG-GUID: XqqcDnoAR5nm8ipgV3Yw8yTgPw4bP9Nd
X-Proofpoint-GUID: XqqcDnoAR5nm8ipgV3Yw8yTgPw4bP9Nd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExOCBTYWx0ZWRfX3CuuLHzNMsl0
 NHtrnEArWG8CandOUYRGN3zbR7ETGeeLIFoLvITCKrN07G0YiB6/3e0FteV5J8YcIN6bIv0v3AI
 AROYzQTPNwXwqidRfjQHOuU2+lP+4D2XImWz6EhFOB/HCCP7u4lQ1/NCSIhYrxIiqmTlQ9oGw1w
 WR6EhjADV3GJLu6R6G/CQVgCLaSkOkBMFO8TKLoLIjn6AuiUfC7SDmB0L4I198PGhghB6Bs8i1f
 ck0Pno1rEZHTHKbbVNTG/HEuL8qxvbcIKrWyPxmLLMN/N1/x+J3N2ial5rEG7zbLTIJ1E+YBh1L
 nOdZGeIk/pomM8H0wOOZGEWqlBSFjd+0kWpPbVBaDDvZ4N/FapovH5eHB1SzksJvAfZf7XTeRsO
 cQ5d3qi2sPO23JFZL8KCSC0Ld+GdIAk5nU8ndjP+5DI6985RDMSqKFeX2Oag4pb/I5s3TBDWChh
 wmYdPDAVjZVMFMDNElQ==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a57753d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bBduwNICHDKIrEYp1ZQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119229-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[konrad.dybcio.oss.qualcomm.com:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6409075DDE5

clk_set_rate() returns 0 on success or a negative errno on failure but
the WSA macro probe function is ignoring it. Check the return value and
bail out of probe on failure.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index f511816aa4a0..fc9e0a37c042 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2773,8 +2773,13 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	wsa->dev = dev;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
-	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
+	ret = clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
+	if (ret)
+		return ret;
+
+	ret = clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
+	if (ret)
+		return ret;
 
 	ret = devm_pm_clk_create(dev);
 	if (ret)

-- 
2.34.1


