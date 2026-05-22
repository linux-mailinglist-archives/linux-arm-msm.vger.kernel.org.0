Return-Path: <linux-arm-msm+bounces-109415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJJRBXS1EGpDcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:58:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8985B9C95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78B7730684C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B353803D7;
	Fri, 22 May 2026 19:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2KZdCBh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jriXHxbB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB21384CF4
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479705; cv=none; b=ArrUwnJ0+ULLsWjCU7iDQmC1RJHZM4TvJI3fLqHuPZI1NBA9S/U7m9yM9gn6elvpx3Mc1tsCj0yxtvI/578cJa1TbqpMWio5ykws4hP7cUrpj/hR4Ar9RXIZQh42OQLtghFAgT8JUVD1ZgEvudgeKLLF0yqxTwCKMBqU/PBQI0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479705; c=relaxed/simple;
	bh=uiEHm22FbGo94IPUkmTFOLlbT34Ehyli4I6vfG318IM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0IcX24QjnHFLF/Df8FyEQr5JUVGHk0V+X/4WmjfBTz92jw6EMmz2KvW5VYf0wmbcGeGPyroM0WTC55NxQ0PWhCy8vT2ZyUePQaxFd8lX8Mf7jQSEsnIoi+TtcDiazWbs1F3t1oOaxECgVk3FRTJAoKnLt9dwAQdYVNdaHg44Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2KZdCBh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jriXHxbB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGap9b1733122
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PfKIGLYCw3J
	XGi/ljAprY1bO3flLnLiGTw4KC11KZE0=; b=T2KZdCBhhkzSGLu49pJPIKoSt99
	wGHG5Htp2qklA7QDXf1uvtHMPhYjk5RJDZ/R44Pfq2V5V05zNyrYC41qosjXqF9u
	WTRG20qpY+sWYp0Jc62/ar7OWtwcHSyL9KDL3ILgBdzyJCXtHpgGn68KI93JH/rh
	b7r6c6OAsVVzijSBSuiYCB7dQhF9mFMyd5/BLSAriu6vK0h8ax5/16AH2fvLI/fJ
	yVRpt1pkcClTJpcl8FgrhmaIZ7lxs9aLaM5GJgbb4RGFQlHntZ9CY0ZQ3B8BFDyR
	GPULG/O5JU9alyu/iilbl4zu5GXou4ZOvFj/adD8PFTJAGLVJWPq+jjORLg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eattq8pjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b99eb06178so179640915ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479702; x=1780084502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfKIGLYCw3JXGi/ljAprY1bO3flLnLiGTw4KC11KZE0=;
        b=jriXHxbB4Yiz79NO/BkTfupC8ynTmaeNFOMslquy7w4GzPHUNVsm8PMrp05+gw68t7
         I0Su/YKHSGK3oWCw2GN2OZNjR29UJf+/ZD7EPKzaStK2+RLJy4QBcmih33XSAYXDlieZ
         sx/etR2q5e4arDD2/ubutfGShfFZN2PsQ3afcYlMTHuyF+l2v3IMQoavAhKpennd84vc
         vMfbxxzNjPDJFzjCPB/gzJUrlInsz1HqYrR8TO5CFpOOoe6OuejjPcJWTG3HLbhIo5EJ
         wyu8P8I+DdO1I9A5pGCPRMjGXuz1FGuLovMA1KIG87uB2yE8hzJ/12lsXV9/+7JO952z
         6XZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479702; x=1780084502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfKIGLYCw3JXGi/ljAprY1bO3flLnLiGTw4KC11KZE0=;
        b=jmeJ+K4ltmpFI9WoutnOp7ZqiPe5I7DLtboP5BILcBLEo7Ml4xamUKjYx0+f9MD+m7
         7o17AvE4P8b3MHUBSJHTSUUBPUUGXssYVpShjmcgtuuOKi4gJgSxm5uMe9dX8zAzylKo
         wJyhf8Km2lgbHWMMejWoqEOl5HDXXURUAUfY8Okt8HX2e6AL+TwlqqPBvFArsmgXzylX
         RVC9aGZ0mdfA0oZqYEWh811VJsldC1MwAekpYhtLhN5aN+i7KtKjSMe1StUUxQqZTa3e
         agGHBjpU0xVsRsDbXmClyfmuzv2D+1JiSzVPNYu2wu3tpyEl/C1w/mgEcWlX3dn7DFWQ
         f09A==
X-Forwarded-Encrypted: i=1; AFNElJ8kBgC9jsW+Q+RVawmQ26KD+jS+0sWsbDfF5fmn6pJfCdPyx5CCNVwjO2JezO4hwA2Ou8HBsWYR6FtJcIz8@vger.kernel.org
X-Gm-Message-State: AOJu0YwhdHyh9vKyfEsqfU6bhEcgZkvnzNyVaHppnvI2jiycb83Wy/DJ
	DmWK8UiqOWGZFwWYe4hls6/kB5dSvZMcdp0RbJUkJjiToPY3fDtomfZapTHagL89777Z2jdecC4
	vOIaDVjiJYe1S/KGp2zAeoiXoUyxXwC7GcCrma6TOSX1SQho5lgsD/Q7NciDY+ilo4qX1slykhQ
	Ew
X-Gm-Gg: Acq92OF4sS8m73gIKBSIMptaJSlenzIEZPbeftwQxq+ZIEBIscBzYRWGjFsuDkJPPHP
	amhOMZb9gwWeKUwFaRKPvq37VUi94/uHGTbkcmMi4OvQVMKsJrvHYgnKA0jauQUb1ixrjFd7B6f
	Xl5nlY6lKgxGv1yX6BPZ+e6rJyG79dzhk8qIlf5/UuKIzmX7e+qWIdSeGVYW3W+1MOmZu7tuQ1H
	QkJJPq6649F/zgTXC8ub4Q0Z+YO/cgRAwjs20Jd+ddkt3i0xDif3i0pu22E1iFKOVhlX2UmiXVn
	hsTQ8v5jLwhODZMPaH0/Du6GDFrlIE35b6+Zqdkle/VCydbPoM5tGhtz1dS7PuXxGq0nFerLeKu
	wgQfx1IXGP0IxQ/UhaveiMs8R83hueKUzOLaLbAIg4+z1dZ5Ke4w/yjhqMxw=
X-Received: by 2002:a17:903:24c:b0:2b9:fb0b:b727 with SMTP id d9443c01a7336-2beb0675f69mr51754055ad.39.1779479702269;
        Fri, 22 May 2026 12:55:02 -0700 (PDT)
X-Received: by 2002:a17:903:24c:b0:2b9:fb0b:b727 with SMTP id d9443c01a7336-2beb0675f69mr51753925ad.39.1779479701778;
        Fri, 22 May 2026 12:55:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:55:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 15/18] arm64: dts: qcom: sm6350: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:06 +0530
Message-ID: <20260522195009.2961022-16-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfXxlCNh55MDID8
 gsHeD3htkRc34RPf6Kh81VmlqZi7C8UV336iVI769ub6UvfSJRY9f5MVr4QNP+gO/metde0X9F5
 1t4R/921Z3aklqfFGuL8z511LZF96jWqwQX0NE9kBaKVt6F9ur7002kZk33sa2tqplRQF5hep0K
 e10Nu6dLnac7OpWybx0rHULaoWgm10iPFrweFHxGGy8waMg2bm5Y0LJ01D0CbaKE1AErA8LXZ/8
 cWsdctljkX4bQRCnQcTQ4AalWZZtm1nXyl4Yqq2ZzJKfp71dZbMULwmAz6HaCfcR4eoF6o5hlvp
 FLjEqds7NF5qNTE3f1/pALGx+psYPZ59+iAWxj5WO9gRqilsnXjanDH1NKN0uBdMpMSSlgmeEKD
 C1zUmmRrYmzYxlkUkUfBE/j8fwEml9RBHH1RoAk/CdfBuTmzn7jgBuNsm15GosvK6ey4WQMJ8Uw
 EFmkUONhbWtLkj95mDQ==
X-Proofpoint-GUID: oEoJYYQEmWdqcLxCYLDktcOgBCN7Qw2L
X-Proofpoint-ORIG-GUID: oEoJYYQEmWdqcLxCYLDktcOgBCN7Qw2L
X-Authority-Analysis: v=2.4 cv=S/zpBosP c=1 sm=1 tr=0 ts=6a10b497 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VytTfPOW3k6kkw8Luf8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109415-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,1c:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	NEURAL_HAM(-0.00)[-0.986];
	DBL_PROHIBIT(0.00)[0.0.109.96:email,0.223.255.192:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD8985B9C95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index d6adf68563cb..06892ba22875 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -363,6 +363,7 @@ big_cpu_sleep_1: cpu-sleep-1-1 {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm6350", "qcom,scm";
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -2808,6 +2809,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2e000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@28000 {
 				reg = <0x28000 0x2000>;
 			};
-- 
2.53.0


