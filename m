Return-Path: <linux-arm-msm+bounces-118808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uS5gLwb9VGrViQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:58:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE6F74CAE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:58:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ofQorq/F";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q+hnow26;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118808-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118808-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 461183091845
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF5343B3D7;
	Mon, 13 Jul 2026 14:54:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A4643B3DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:54:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954456; cv=none; b=JHtReBFbFAHVlHw4IHFMhCeuF3Hjw2Cbid0HTrJFA02LFfli3AP0xEkRaDwJSNXb212pMKC91dsR3RELYsRhsMcKN7tVfV3ry9gYzif88a4rznzvk1MtvlqTRRA2YWhTPM7VoZQF/yBr6HJWvvHV+N2lpdJjXp0a6iws3rQH6d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954456; c=relaxed/simple;
	bh=/MQJsUKl7dlqiAcb7deGVSnq8frhZRWs5A4bt8zOj9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAk331htCgoz6m5BHE9+mmLTyBVFGUgJqz3KPFdV3hUFlpFuonEr+FCV17U0x13YG9Y1FPv9pmI9d7aurNieO6B+kIdjpY9wj2MS63ndBWSvBnbYj+XqXZdk34MvVe4JKKcDneErJOXs28MMjWw+Aei6t03tF07G1X8ktfbnm3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofQorq/F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+hnow26; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE3U91561407
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=; b=ofQorq/FVZQXrf/h
	muej9Xe6JugH2Vf4rCykWBdZPw2WxMym6btcT0gpDG6bFDG8gfkJgb6deXkN+Knx
	VfYwOLAmOQUcDXWYuyMY9pJJDnE867w+Y+NdiH3HshdsZ0sTauLMy0XbFRBj1RUf
	Ph3TQIOIzvWdjkYNZJeZ2VKOXom4OA0npNi0JFL8R0omgOsSgPG9a4Rc1xysCsL8
	U1LrASJ1/QdMtzPqevW0ijYTF7LigMlPCMJyQ6kCTkRCM/03wBRkLvTCPynEcBwN
	EsXM7DqdwEgwlNV1mm9ICwQuNZ81keaml09aQz9bIJCwzcga6S5+mwaxraokTULm
	XH40AQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3b40q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:54:11 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-43cd2d12617so5570580fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954451; x=1784559251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=;
        b=Q+hnow26g56Rfc2+LzLoDtgiHX6tfw8+wzNHpnTEFiuiKRrl7TIyyw/BMQwmgWajYh
         C1xLP/hCRrMOGvuZTzNDPZ5PfZPoE+LyOtc9S5STrXWcqG/1i5mWaViamwCw/LgeZs45
         dU1IdjQmDYx0c3mGVNq3zr4da4HAVFi1FbyB87ThxCGnzaPijK1z08bmvZA1VRjTnput
         +2kRdbwth5lNmMGJ4R1BuIwCzVx5nZlNA12M6kLBZjF5I/gNOIiemTbbNVaePr4aW+Iu
         t/OCz5b7epg1gqTMa/4WIMYPqc7eIkCkpibyWsbfPFIiOVhjb9vq3+UhOsK4z7tT3QGa
         2NNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954451; x=1784559251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=;
        b=NLr37UW8dgRJzngv9vC9OB6WagVWAeifC7WUzrDY41Z8hvNqTfkK/imO8xWZp/4Z4I
         dZZLJmf1ykmmUm0MXjUk65LBlkyqQdEZIM5OBugC5blJoouXSBNkV8pT/z49iWmLwlZU
         02fS/XHI0ED50nAv3tZlwKcCyrMnO8zeBbHXAUeTB/ikIIAJ3fkmPlnLi3+NSiPq/m3W
         n06kZZGph3YEJ+T2uROaI1sI1DME0v4MMEyXKsKoCzpUfrqxjnhmGTjd3f0x9ZaTEb+I
         SDGUDHJazit0if91imh0lmOA6rEJ9Lj3YsvFMpA8Qjmu1VNFzl4aD2pRiizoDR2IZQgy
         nIJw==
X-Forwarded-Encrypted: i=1; AFNElJ9wtoqrn/2VoTL5gvb7x8JqC26U7ZxWi5f4tkzIzabXrrKRsBbZlYG0YsK0v2G8Aozi/pU+wsGM4hJ8KFQq@vger.kernel.org
X-Gm-Message-State: AOJu0YyOsrxJbEGnPG8hX32QgPpbfj0Uok+LvJJVp1GiNaXsoweStZAc
	f5Y8Qjy1B0mnGtlNu50OLO/RkuOb++kd5nT/PQVkqTZrr1MPXbXJhtgJpCCF6iLQXeerAkGAuUf
	gosyfhp2E2Jlf1EjKtonLl15UnLkxMt/RVxDzgGU+WmVgAwb53YQo1SnfU+Xv9Ov2yzOZ
X-Gm-Gg: AfdE7cnu2Hl0QkdyWbx4K0lDGdLl7vwlFABGJZubq6PxgvULSfH0j6xyeavpfbSO6rI
	1KV9trL0KnIt9JtF8JN8Zehms3uEHarAoP4dkDcNEe5rFk1lCk6Fpp0BmveB77nAVZe4bi2SqAt
	7qmJjY9+zKC7YKFADFLCEPhUmKN4+8dFX9H+l60w4CxFkGAIWZWr8mv5I4tFs3H5FS1hg7ZTmpj
	nzFnkoGEC4qq16d2RVJWCiYURSxsUPZAkidNhTdXsUsLT1NSEZgLM1EParBml4drsaCcwZP8MHF
	N9sc4gsZCYtOKOvMsrBlzvtnhGcFK3S9kNTOZ6GSQ0gfU+LMCNTRWQVmJgmraldcJ8a3E7UnFY+
	MDLLPIWHmrHo9eDXCbW6US7+DXvjr5Abt8yk=
X-Received: by 2002:a05:6820:98a:b0:6a0:e15d:7a with SMTP id 006d021491bc7-6a39a54b726mr5693323eaf.1.1783954451169;
        Mon, 13 Jul 2026 07:54:11 -0700 (PDT)
X-Received: by 2002:a05:6820:98a:b0:6a0:e15d:7a with SMTP id 006d021491bc7-6a39a54b726mr5693280eaf.1.1783954450612;
        Mon, 13 Jul 2026 07:54:10 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:10 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:40 +0530
Subject: [PATCH v7 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-2-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXylvOY3RyHpKr
 AHD6953YPa17ghAC2GgFm12Te/xtLpIuzTfB8VXjr1esLsTRvQNswSDQNQP0vZRU6oOFwOEPj8V
 XUpMPXi5XXrRDDJWWOlhats35rqKeuhHCBoKoTry/960DAtxlLC1SbBVVXDSoGb15bMM4v37GJS
 xtb4dAULthW2RV7+hv2PjoirE//ntYBzvPcGmOG6KJiI8uLy/XEkFl6zTMJp9QY0WlhsiEoiK4m
 3paF71dBvOQ0Nk6pejMCuE7H0b7/VDrGfQM7VbuKyzi8YuzwZVs++0LQsUA3PtqgW3CqhJdqcN8
 ipW0+pMo3ehEhL04Lc7KfyysR+6lZGxrHGCrlPhavPRCrmSjpei3zhSIAhb2m191k4mXS2uZB9u
 x6jPWpX8r/lZDOAG9wBfl4VWA/WBibazSUMrb9SiXbMJt4Zhg1d9e/FMOCc4IuZCZtIWvWccIHS
 g3xWVIiD2/AUOzdjXAw==
X-Proofpoint-ORIG-GUID: 3J43_swWX2sQOU80IPkqCKREmjMvZ7fK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX5kK/lTo5x25H
 4Q/CblUd1JgkJVROqzmAVkzPGy6xhRK86sOtWfhZFkcU8V/2jxPsJW84d1vIT1yz1J9MakTandE
 iryw+cF161ZueNj6hIpQCQwOYzFVrEc=
X-Proofpoint-GUID: 3J43_swWX2sQOU80IPkqCKREmjMvZ7fK
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54fc13 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118808-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DE6F74CAE9

The Milos video clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented
qcom,milos-videocc compatible, this is an ABI break for any devicetree
using this binding without specifying them.

Fixes: a4937e974186 ("dt-bindings: clock: qcom: document the Milos Video Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-videocc.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..4d8d109cd304ef0f5afc5c3fc7961a6156003d4b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -26,9 +26,21 @@ properties:
       - description: Sleep clock source
       - description: Video AHB clock from GCC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -38,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@aaf0000 {
         compatible = "qcom,milos-videocc";
         reg = <0x0aaf0000 0x10000>;
@@ -45,6 +58,12 @@ examples:
                  <&bi_tcxo_ao_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_VIDEO_AHB_CLK>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1


