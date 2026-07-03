Return-Path: <linux-arm-msm+bounces-116198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LwC8DERoR2pdXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:44:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A8B6FFAE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:44:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q0laT08N;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="FXHqXhH/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116198-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116198-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4D8D302C6C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0082D12EE;
	Fri,  3 Jul 2026 07:34:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6846344D90
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:34:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064090; cv=none; b=nWM0JBcug9iq5GwGGQf0FP+zn2uv03KpJuTxtskK0fAjEoJqZ1KQ+c4GSCKgZClVl5gEwBDBeKPlBXga9zUUbas6m3QXgYlaHeer1FbJkoXVxWe6ZCXRJqyPckYXACLZntVBufSNu9qvSTKRE9jDX5nzbwJzHV+ZPSbZnr1+f14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064090; c=relaxed/simple;
	bh=eauUBeRESJvunQL23izSm7fxSNDrylBGuqp7cFk566U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ACRK8OAOBvANMxV3olHQU0gvv4mUmwC92Xh89BLf2592iOPUG8mBMJfloyld+HOwLlaAOOk1EPThDqw5+eT+6rEd99EvoDLCynvkzTiJYnL+UzbPx9VldY8ZoPFtrjzV9YK9ktNu5o1yIhnbZQmb4R9ZzcIv+H7K2WZIFJS0fl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0laT08N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXHqXhH/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rb003129030
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EHyUhwDmcLAxlYD1aeefz89XCxrIqpex0Tz
	eDf8erJg=; b=Q0laT08NyimY/Qfr8Mhm5jGuxmePCQLZSjG7hoeWuOAijhPz5XT
	OMncWBvE/i6shCCdbyi9eiy0kLhPYH+kqVmx5V4KgqjHneJI7ydRB85rTxNj1XSm
	mZ03AJQs+IzO4s7oramstsZVOfpsryc4lRKFJnAIkx3NdmN4wi8gPZwLZdUpG6Hr
	6fF0T1TUVIChSo46Er341RL7bFl3wd0+mLi4Oq9MG+tor3qitq+isI1YXMSKWu85
	ZyJz4LFQaVnh1D5HZt7/2eVUr708YpVjEo1d16LYAbpl0RbWL1DmUPIVRBaYc7zx
	QccpDr8O+YsmeMqhDp+QVmPzdyu2P96SjQQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc4fhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:34:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9e9cb6a44so2730965ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064088; x=1783668888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHyUhwDmcLAxlYD1aeefz89XCxrIqpex0TzeDf8erJg=;
        b=FXHqXhH/HxG7He5i56S1nvr6iLMf8MPhCtR8sUgL+rgY+28v8tSmn5y2RbPLfJkjic
         /zqkqwDWH0EIyLK7DBXN452Eie3Mh/gXRskVx5Wf7HXEoOsmJTy+mA2gyzOkWMi9wFL2
         zTmR4D/genWs8dm4FpOm6o4lq8ZhQI9qRfTTQCLmnt4KdonKBiizIRIj2aeHXVQlxePF
         7MEasOS+Gtsj63gIlIqsMLuk75oxjuGFx0lDz0urWGlQTEjBEhG0tqeBJv31901SaJVQ
         wsBOFh+Ue6fq7icRp4lYDSPUZ9xabdQqgylXX5zopSbNPTo/jO77xNg4yD73TCKpYIGj
         ippA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064088; x=1783668888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHyUhwDmcLAxlYD1aeefz89XCxrIqpex0TzeDf8erJg=;
        b=W8YAFVSpsTgYa1db3GZO9+MytEi51IwM2Jb30er8Cm9U2F1H16GztOe+/m5Z0M2eh9
         hRKHZPFBQD6QTXcvHcwUr5+36EbYQkZwYJEcDR6Az061Cdcf6On8GyX5tOYgEM1SIVUP
         VqF1jen305i88OQ8P1TKSngN8fUODb7mPPAXX0HDN2zu+igtrHWOM3IFfkM3YmaBLf40
         EZ1x91U0lhXopc85MFKXF+Abmd1zbVhza4OXIvvXCIQajKZSPEq0V47FCExexvcNEjLW
         Zegf30MoyFzdy5kSh12qTU2CwSz3COTJrRm9d4dF72/Nd60caE7SH0zUPfnnwZ4AlZNI
         mlbg==
X-Gm-Message-State: AOJu0YxiqWSxEvDPx17rrmMuROpXEWko7CTPHlbnBzblKS8FyQ3C+usc
	xDObF9RqjGCnYREDJtcwPJr2SaUNylTdQY1Iixy+XQbw+IveOYZw0Yi0ucFyqWrHbu6EOclELwq
	28IsfYdhWYQDfkXyd4NSYZx7MBDAnVEV2oveb/0hwRRhe3NiP6+JnLwNyGMF8Xi4G1TcM
X-Gm-Gg: AfdE7cnwzSV32pGJ+Vk1q6kKGkXDoH1h8Xx8pIMgDC4UG1G0u+QGGQtEvjMdb4L8Bgl
	jdrAmdnL6/THiab1Zpvlk92mHF4d4NUMtGbIGVnYBUFFT259JZGRXowdSHH900JavFSl0yjCiio
	QOEe1S0SbPb0tyTXpT9FAHYW29QO7JrmDoROuFDn2Xg9McKaqCQ91gG3+hiSU/c324Lc3vuTRqV
	2qnBRRpIXwPgTCexfjWbXHQVr77lh0P3o9WiMo59WfRr8Y6FTGrppQi5s3BBPrn41LgLBjtbmkN
	FMB/fXoUSFeyFf/ONswFQR/y06X1f0aXteJ4p3p+e8cqi9q40A92MgG7ItEbvP4LUtRI6veaCym
	UDrmisaEil+omp190pfnPbr/AgtHdtV1MNUzl/mQe
X-Received: by 2002:a17:903:32c3:b0:2c9:ed16:8d8d with SMTP id d9443c01a7336-2ca911fe692mr84498705ad.38.1783064088275;
        Fri, 03 Jul 2026 00:34:48 -0700 (PDT)
X-Received: by 2002:a17:903:32c3:b0:2c9:ed16:8d8d with SMTP id d9443c01a7336-2ca911fe692mr84498455ad.38.1783064087753;
        Fri, 03 Jul 2026 00:34:47 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm5225465ad.13.2026.07.03.00.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:34:47 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/3] ASoC: qcom: Add Eliza audio support
Date: Fri,  3 Jul 2026 13:04:31 +0530
Message-Id: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8U52xg4wo9C0fN56n3JOKe3b-iMbIH8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MCBTYWx0ZWRfXy3X/P0wZjtkZ
 3ungT1rFLuPmXx8I5oLuSEBmSleqLuEVC2jRKZRwojfOfYmR3sTXxUXzS9Cc6kqDs5254pUWTyR
 DFRXS3AkJq0lJjLk2sv+ZZ/fnW5JDvqGkvf1KLCixBEeYS74N+QoYn3y2mdlTHNdnhmZzK8luYd
 AzRxw/FkMos570n17v8kIPrRsF5Ba3EJQ9n+e1FVj/97mTWuBK9mFIKK0ltTr+c2bN1EfApx9M8
 tCl+jqoM9xNgsQwOlvlK8h+brod4xxj9Z3Z0AIgJ16cwH/cfMVgk8QnhHkVJxxhHQ1w/lMOC1cb
 36Wjws1G1HwPqMG58cxsqBko9cOtpmT8vCLh9kpl8inKr0I1i0zzsFRkZFQBE6+Zf8D+Da14DmI
 tYesePNXO4oKMWSL6NQtkmVYPTFl9CXCdkEf/PVufhSlrmhbpz39wqHUylspjOJXwTWFYn2E6II
 vrtGvO6iUTdVHKL0PIg==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a476619 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=TcntpH_QWam1UtUSv7EA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 8U52xg4wo9C0fN56n3JOKe3b-iMbIH8D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MCBTYWx0ZWRfX9hFYFWmbevp7
 I5PasDTDaX8PrgxYIuyDGvDbnuZJG4g0F0qX2bW9M6t9ZVD65ppeOm4jByAWpv+4I8awnUq+KIw
 aP5z53Q51IIQCrMZWeON2JaMITkcwYs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116198-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74A8B6FFAE9

This series adds audio support for the Qualcomm Eliza SoC. Eliza uses
the same LPASS macro codec hardware as SM8550, so the existing SM8550
fallback compatible is reused for all four macro codecs (RX, TX, VA,
WSA). The sound card is compatible with the SM8450 generation machine
driver.

Patch 1 documents the Eliza LPASS macro codec compatibles in the
dt-bindings for RX, TX, VA and WSA macros.
Patch 2 documents the Eliza sound card compatible.
Patch 3 adds the Eliza sound card entry to the machine driver.

Ravi Hothi (3):
  ASoC: dt-bindings: qcom: Add Eliza LPASS macro codecs
  ASoC: dt-bindings: qcom,sm8250: Add Eliza sound card
  ASoC: qcom: sc8280xp: Add support for Eliza

 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 1 +
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 +
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml         | 1 +
 sound/soc/qcom/sc8280xp.c                                        | 1 +
 6 files changed, 6 insertions(+)


base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
-- 
2.34.1


