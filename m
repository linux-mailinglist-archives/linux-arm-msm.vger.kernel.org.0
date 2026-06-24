Return-Path: <linux-arm-msm+bounces-114396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lQteDIcsPGrDkwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:14:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 829536C0EF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:14:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M4vFishr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jTvFWU2a;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114396-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114396-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F324312BE4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13D0343890;
	Wed, 24 Jun 2026 19:09:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFA233BBD9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328165; cv=none; b=he0nZwmgajsLm7tocx0lzsxC+EWtxusF9diSamWFA9Pel0KrmtUfKIQsiNDSEMOCmk9giGihvgNBtjjT3mcjP/X0OSsHpUmQSdJX62lap1A88IKCFx9H3k/xxe3LadpU6qsYypdGL1s/WqDVEqP3Pmk3r7ui+WRsqvJb+ZCcvMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328165; c=relaxed/simple;
	bh=ljkxxdkibHf/zG13tbBNZF0bPNJtB23442nbC4IkU54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RS71qP4fgq05Zy9txvW/3VB7HENoJHLemABEgrCckDJWxnJmbziw4fgii300IRV3bqpDUQKmq7FXW/4xvgeulKPbM5rGYccthBC51pfoBDDA7hOZykfUDcc/UiEs3RgwrNTTyc7/pipOeXqkwytW1Jiv95CM4yduNGkt4//qwbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4vFishr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTvFWU2a; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHitWG4119287
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hIPF7nn3fup
	mBAWrRVX0ZLNwJtzwsq/OA/kPq2MNqW4=; b=M4vFishr5M2279l/H0QzTbNsaIe
	9CrYX8dK/kP8TDuiuWF/rtkKVMpPPy2aPzg5K6KsW5BUOSKn0dy0MR97ha+N3TIX
	Fv2lf0kfPrqRvQ8tFFtFQPaSKpBTg1YaBzmqcCHuzHlfJDM9924sjn7jGfGnUU5F
	sqN7g7x1ZB2ggQRICA6MNUuTOA1jwJL3uKVhJndcduOonOBYRc1SqlOSkL2GakBQ
	ghkIAka7tkeIQWQA1pZIolDshdCXSF8+ad+Nt3III9mYKe8DO8dlSqJsQni7xGos
	rqa+UaM/NeHWXh9uEz0xy1feiBbx4h3BWAJ5KhDijIODD9p7Hs6Yf/2MCxA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajkvuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c860544c077so1752670a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328162; x=1782932962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIPF7nn3fupmBAWrRVX0ZLNwJtzwsq/OA/kPq2MNqW4=;
        b=jTvFWU2aICKAcvVvInL0CMJLAHiwgCGxSREAzMjUCXaiWKbJ6TWkx1hHtdoSKUvj2N
         jMuDitv3Mr9icqbdqZ+4/3k9OvbKxZQipKjZP9h5Pa39DhEL3OAh+Qtjt3B3cmYzB3Np
         9OQb6ibN5vc+6N+QYedtrcuuDj50U+HNPyVhYADg3x3YSXjtOG0FqoIn46Y2Wq3dV42Y
         PyL1InjAelOg/Jv27Fa2LXjuHukilcU0X696u0X2PMZplKMlbH72tcD6cUBf8kPA3L0S
         pwQ9BkQkucPpKSM0iBKsVgI8TP2D39KcGKci76efBIB5t3uG05q7+D3VQxWjBqEueAdq
         JytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328162; x=1782932962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIPF7nn3fupmBAWrRVX0ZLNwJtzwsq/OA/kPq2MNqW4=;
        b=tEU9VVti9Rd+F73Xi4YAUqGKq6/6o1DxCmbMC1o/VBt0odIpl5vuF4BKcBrDUCkQej
         tim+JskXCHwFoIoSJ4k57w0C9ChnFOrVrZKsuFPJ2fw+9xDwAc+y6JPaoOGNSaNVDzun
         vxraRJ7PFh17xnBxgTSAIy4XcAA9sKi57602qRhwwKtte3A4ySN0BHFJUqaohP+/9+aE
         rx2k2r8YcpmYMau6dhA1PPA78O63B1Ismh/C4q5nTvdEDVB6D5OwmJQGD2zjjbck2jet
         6OLR54UuNgLoEcNNueHltPoaPwCksXhRPte3CrZY4rRqUc7aSACFo8rOOHum58Z0AbvY
         WkHg==
X-Forwarded-Encrypted: i=1; AHgh+RqWi6TkDMaapmLw2ekmHy2caNRm4hiKBwM7jjPPuDS6zuFtIudSktJAW/Xf5Aw+Ay2PWg3Pvzq1rUqsYDZe@vger.kernel.org
X-Gm-Message-State: AOJu0YycrWgjAY6mrjn8Oze2gIhwrsRxHPd/wkyQAY2RGMeD7nb5ea5b
	xAecYnlYq+Dw8El8erBjFYdKaFhIgSJy5eN8y7oHGSyPuel3chtk65bN/6Eujsnjtgh5E5VEN6i
	Pngvf0EF283qEMlglAxHby8Frfm6PkBA4df6W4QNWnOuxVjUzYjrxYSscyd6bQgs8fF3D
X-Gm-Gg: AfdE7clknzw6/g8EnBZw2efKvd/3ExEoYKFXNfgszcbpqlVXfFtwxoqrbtFvKvHFijj
	wlyVyv2wVZQRfdsjPVfuz2w+dNbjWaBZYQWx5pPwv5xT2sExCESWp0O0lxS+63oxYwdebtfvJyk
	n0+vj9B9gBh/tRGwk6PCy4afjqxGmfK6l+6mOF9w/UQvFuJ1zgo0p4JVWX9rTM1/lfYx3GOuBs6
	tVYHfYMCK/z62+jkaGgZePVfB2cvcTDUjpCsRyv8W0jlXpoQ6PeRm4BYGNvVTOfIe4HJAq1e2G5
	LCY7ecLkSdO3abeYyxlbxuxqr/qoLKT4cBRJrrplHylPlhZf+BPcw9zjnffIbiTvAiqhB8WwQ+P
	hLJV6Y9/Gg/ed9DktVZoJzCgstmbWrFk//2G7QA==
X-Received: by 2002:a05:6a00:f89:b0:835:532a:3468 with SMTP id d2e1a72fcca58-845a2c015d8mr6141762b3a.20.1782328161721;
        Wed, 24 Jun 2026 12:09:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:f89:b0:835:532a:3468 with SMTP id d2e1a72fcca58-845a2c015d8mr6141720b3a.20.1782328161083;
        Wed, 24 Jun 2026 12:09:21 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 10/19] arm64: dts: qcom: qdu1000: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:21 +0530
Message-ID: <20260624190830.3131112-11-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX8noJhrqfkAuT
 w2N9bicccQEbO7Xi5mPLWFkfsTl9hm+S3cNq0DqdQ8June4vvsLQsZdQyb2EmfQlqlZQZKknk6u
 6FitO7icfkn1iEJPfcYAf5FUa/BHEtM=
X-Proofpoint-GUID: Zy_g532Ew-onNOVfv4bVUk6gkMMZbcjN
X-Proofpoint-ORIG-GUID: Zy_g532Ew-onNOVfv4bVUk6gkMMZbcjN
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3c2b62 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Y4MF9b6SBr3vJwSF5iQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXzwNpSoJE5HUx
 XaJN28Q5e78IuSEXNGrqfGeitm5z6IuwDOdAQKBo1gKNz7IkwwgNcEzUoj+eQB/2o/FwU4ItbId
 1vhrs/EGr6RC3gDtqK1w2XsIWuQuuC6fVLipWYcQHnrcbfBl0ieT0moY8TFpY+hGNbTbW5EaME6
 fCUttgZBtY3xnKOxcl2kAervRUxEohhqfpYovQnKS62H+DzAjWZDUKS2451MTymmss3lgrT8FID
 klke2jXntmD5L9rYqWatAExLTX1U8Ve+zuamQjfrnxZ5oIheB57XlGgUbhD1FMACyBXoDLU/WCs
 QqOH+c0amTQfm8Mhq3BwW8FOL8Qd0g30a7N3UKwDCjSjCfYEpYDgCPf4dq0CUUdc5xNQv/gV/vo
 t11F3cnixJTCy5ZTXbVIXFvnbM0e4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240160
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
	TAGGED_FROM(0.00)[bounces-114396-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 829536C0EF4

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 952d4270d118..0c6ae3ff06fb 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -171,6 +171,7 @@ cluster_sleep_1: cluster-sleep-1 {
 	firmware {
 		scm {
 			compatible = "qcom,scm-qdu1000", "qcom,scm";
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -1369,6 +1370,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0


