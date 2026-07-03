Return-Path: <linux-arm-msm+bounces-116200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 74V4KKdoR2p3XwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:45:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F7D6FFB47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:45:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gI+qpXxq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jj7aBNpF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116200-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116200-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A882308CE7E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2012D12EE;
	Fri,  3 Jul 2026 07:35:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9F236AB6B
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:34:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064100; cv=none; b=QjKriZqi23DTPKVXG+hmcPXCPoJnitVSO8ON/huOLJhCzfXyyl6GxVKyCMKNK7NZLA5XPCG8tZ4488MffyndIWY4Oh3hE0T0eEsiJCqvJ9+Pety1e/2NElH7pqDEnfgiDubemjwTb53n6eh79mdJHq6rrIEId4ehEBbXbnQJxkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064100; c=relaxed/simple;
	bh=D1UXnt8xZvDn46n75zacF2bracmwImWOgAmSBddxQR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gkH3t37B+zvCD/E2ieRZFcgX9GdQrOD+3iNpnuiJ0YdPgkagRQYNZZSkkqrLxr+17KWoQqrZ2i7uNA0lRdymeM/nf8G4EuPzAQf5GuRIk1UfritGVGcRha7jA7gfdC9Y9lGUtYAKe8Ex9NiK95gifFwBmdepXNwqONzUWPi+sDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gI+qpXxq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jj7aBNpF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636h08N3144241
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I1muZPBkf4c
	S6q1wIo25pcwrOaIN4VA5bpCprELX+mU=; b=gI+qpXxqgIudcYxEZEwjTA53HLm
	ohKMPjbqwQ9EAgFP0U10z45LrEsh3KVsI64T9iYOg3ov9tr+ybHn1RdEdChVHzC2
	dP5HKWElu0VUdeA/i6FG9RiNdwxpEIqCOrjDb1Udj9PtMAL/qB3VO6EksEzRvdhM
	E7I1GvdLEnYG1IpNcM0ENyflb/BB7TBEIxL9jgIC9jK5XaXsxrhhqhqduZQr/2oA
	f6ygZjByCu5ddyTt2Ee6sMLkIT2YJZT5S9yB+ZhtS8jiU0G8eLTcvn5ToDwSCQSh
	imqlFcc6F5lzqbOkNZg/1lUQ5hdnTImXK9ihxGjetfRwdjPOaCQz0yj2AxA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682br6t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:34:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c804e38c65so6033615ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064098; x=1783668898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1muZPBkf4cS6q1wIo25pcwrOaIN4VA5bpCprELX+mU=;
        b=Jj7aBNpFuispoCI4dwJ7fHDDBPO1nZZ2f4lX9OU/huxCORb1+jrKjB/1+BmNnNXqbX
         RHRgL7CdokAkpyQMEb7tAMBdUFJcmAGoye9sJTLdbCRgZQU9DLodVSTKXMXfBpnse9cN
         z8NQe2CmaslHMPYiJBJYZnz5C9Se9sIw22kGS0Kc3nhG7imZw+SlRV+Y0DSFKoIKj7w6
         iYIu12nxG8s+rzlKRWvUEIBtwwMscg8jESscVUDTmfm6svJRAw38eeE5REha95HEgZvt
         j8JYmzioo60OblNluMrLkofYU7171eDLlgAh6H0SROJU2vEpShYs/tABPewP6LmSAJkC
         Znzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064098; x=1783668898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I1muZPBkf4cS6q1wIo25pcwrOaIN4VA5bpCprELX+mU=;
        b=B//qpuvHYlhc82xX2Hjn2MoCQh02qZ1n5ksimdJR7/tBmHMwN6fdeHWdAyevXCzizM
         2AXxEV8uRKCThxO8bFFayQI0exmlCCZhT/nB7dg2TjYMcp1v9tyoMUt/OPOLCDvk8JAL
         Jl6m+HW8/p3Rdl2dxx3V4GTlT0DGAvg0gIk8RfhTi9Iiw89MCwL9WjHvI/loQlmzVQp3
         o34zzg1vm7srnLfdvVYWXozVN/RM0GHIj4SP3C35HZyxkg0XmxByIVXil05Y0NkqDoiA
         Kk+T8bJVrFgOr5V1FmQzSG+MC98lkbz75sfe3Wr/vRgywmnjj4A2wzKUrrD3OZq0lpwY
         /MsA==
X-Gm-Message-State: AOJu0YxXWEYlDcr7ndmkD2Y7Z0i4+JVQEzXbd2bpvaTlKjVAiUEjNVrK
	ct92q1O+q2dO3XsXoNkogTWr/V6+0UPEF4RIGz9HeXeoExuoieVGUlOOHiNK45exukEzYw2GImZ
	AjvSsiCJ7wlLy7pRR6Wdd/s+Q595bDBolOWsIdWYrWWQkcBpc6cM21ddbjfVU9pk76Z0r
X-Gm-Gg: AfdE7cmX8dJJCSA/KwtDE5x/iE+OIgAtXyH8WyEQXQoC43l41BpwJBqk9PWzgiFy7w9
	7dK3Drx3fRjmGj4vNnMvwioxoDC5bToBkFfLd9kcCPlA+LeJ4u7ghSQLrEC2YDKhwgdQBjF97/V
	8S0lT5G/kqiNElS3RKUXvAmgmZg3Cr7zojczVlcwsKYIImIo9FCjSBHQCyIxIn6oFnBQn72s4Pw
	qZ3RxJ4/cPzo+ktvCMvOB6qRBP8AHd7EAdGgPQ2XyhNtMaEeIm4kfJrGgjzXhtWcBa2Aq/Z6BMB
	uNQAyWko6E5GqN+EbnoqpLQ3PLb2mOA+dIA7WG402RgY2TWfPiTGgmWLGlmZb77UnVwaDbKeg3u
	QoIa1vleEkUwfktE73yvlEUEdymfZ47o7vOTQbXqj
X-Received: by 2002:a17:902:ce91:b0:2c6:cd96:6a8 with SMTP id d9443c01a7336-2ca7e75b9a2mr101622085ad.30.1783064097722;
        Fri, 03 Jul 2026 00:34:57 -0700 (PDT)
X-Received: by 2002:a17:902:ce91:b0:2c6:cd96:6a8 with SMTP id d9443c01a7336-2ca7e75b9a2mr101621765ad.30.1783064097268;
        Fri, 03 Jul 2026 00:34:57 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm5225465ad.13.2026.07.03.00.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:34:56 -0700 (PDT)
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
Subject: [PATCH v1 2/3] ASoC: dt-bindings: qcom,sm8250: Add Eliza sound card
Date: Fri,  3 Jul 2026 13:04:33 +0530
Message-Id: <20260703073434.2589657-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
References: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX8L7V0qmRWA3O
 g2XLsX9noi2qFBUUP0P9l9nVF3FAGjI+2ub2CJxrQWV6qGPL73OHQZzi0sVRAln1Nilc8X3t2qu
 aVQ3nDZHZNyg377XKXBAGv+S7FUlH3WiwfV21BAwWiTiyUXAK8HQ+7kXMKnAkaVyCVR/ta9tql0
 Iano+TQ1kLcd4SEUqNV6f2/s+J+9s8CCU8OTzXzlFTMYXjZrs7BQzBSiu/FcoY3tPAstNmBIbqv
 WkhN351OwHwdZ1+4gkq89E3POtNf+G/sV18hv8ORG6BYgQQE4tuuIV9WwdT9jUaK+qm93005MAS
 ceNUlmKevgI2bH3acj7AlwteNWvrkgfMgtwE4I6xDsxIKSNiIG6OcfjDmNEYbW0kWg6qEGh5APb
 zlo7Itwkfxz9JP5eQWMxiDEdmlF6YVtT39bbok0pj2CvgXBx3O7UIjKwDI0K5UX51oZ+0zncHMw
 sTXHZcbxpcYT8pYWvpg==
X-Proofpoint-ORIG-GUID: 7nmrTsyBN6luZf8_n6BXaqQFOiLy8aGg
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a476622 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ohep4PdSOWtoWzxL3IwA:9 a=zgiPjhLxNE0A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfXx6Ck+7ZSJ4v7
 6hwRffQgJnEMeeiYrIcfNpdRYoXIAxD/AR4Mgr8FPYyQmgc9aMnlklIPTvmwPk4sUoE6Vm1+Vg1
 tQjoPabCgdvRaprGjMCQN25nRPNeS7k=
X-Proofpoint-GUID: 7nmrTsyBN6luZf8_n6BXaqQFOiLy8aGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116200-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03F7D6FFB47

Add bindings for Eliza sound card, which is compatible with
the existing SM8450.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..dae440ecab59 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -23,6 +23,7 @@ properties:
           - const: qcom,sdm845-sndcard
       - items:
           - enum:
+              - qcom,eliza-sndcard
               - qcom,kaanapali-sndcard
               - qcom,sm8550-sndcard
               - qcom,sm8650-sndcard
-- 
2.34.1


