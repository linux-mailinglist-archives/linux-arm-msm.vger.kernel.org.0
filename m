Return-Path: <linux-arm-msm+bounces-89860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOIlAcnZb2n8RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 20:38:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F334A974
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 20:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 632D088D31A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 16:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2F033123D;
	Tue, 20 Jan 2026 16:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lt4PSfZb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+Cp69Pk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139483469F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768927648; cv=none; b=Ub/2I27wQcdzc6TQNDiJEKaMqgrNExYa0oRl79BB25rQEVvyjP7tQDeYogohUSg32CG8PFJdSqNIJofi+71PIjj62BGd4Mm0KQ4gPSwuetNovApd0MJaoo/epbm2ugfPn7uRcyxag6mNZiUJaN3yxBSbpYlG/qK3Uw3WU0AM3gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768927648; c=relaxed/simple;
	bh=YbOnbFd/7aefh2keRqK1HOFcKinb0XZdETYvTeH5gIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sAVsDTMQOgXxTe3aKYq7UYpkgGsh9fLbFMK6YTeX8m984XuPOofszAbJJUckwA/hm+PqpQW0IpF5T0WuOWQhqeOGfT+q+KUa90B7q3Y+HmpagPubnGmGWUQFjqrHFAOz81I/h2XhJbpGB5BtBn8DTBDNITnoZU3F6hR0ikQ5eLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lt4PSfZb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+Cp69Pk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KDgeeL782019
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 16:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X0LtZmj23gE
	qAv2OA4FzTwpxFo55ctKnnuyj/fzq0/Y=; b=lt4PSfZbVrn9R3ad8fT0KQfpbEi
	z0RJFw6OK7nr454jum5IbsPM5efsMiYECj0kKMvhG0pXn4n+fJMZNyxuq4Zapgut
	qVt8WMQjqzMNe1JmDFENCIOggdDcqW/3V5x7QJGwzD4/WWMT25P7XySI9qmFV/1u
	jqJWTgiKeA7oOPkOV/ZlEqdnWnM1uIc2tN9sx3L7yimtD7vH3w889HzHi7j/9C57
	Nbo8XHpHMmI1hwKE9CYyNy6YKQe7U+VZyPje5spxK48rbVfMSCV0RvIjgJrphO1s
	g5VTH7PK0Q2PoCUZrOtcSBAOOVN4BZshkIy0tn3FnIiz2QaBgJrtgQlkbqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btatyrm8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 16:47:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a69b7813so1075212885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 08:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768927640; x=1769532440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0LtZmj23gEqAv2OA4FzTwpxFo55ctKnnuyj/fzq0/Y=;
        b=K+Cp69PkyZEYL5helFRXCZUeST88m35UDmwAEsJNdMxzv7gpFRAIWChU2vbKoit8D1
         Ly9aWrM8TuWKcFzKColCoGNLbbwB0muYm+s+JHvR/OkDLIFZqYmcaD4jmSCZRx3b4y4J
         dInBxXh9toEmK3MpSgy5wK7xXR/i+8k73XBkF7p8JD/PRhJvdI05Q5ht/1y7y0Og60vh
         sMp/pwjlp3ZlTzZHRwFlidc9njFknGtE60r5pYp91hMXZ/8yPmZqZS4EF4X3StCGuLnp
         FYF0vRaAMm1D1wF0xlBamZ2ZViMph3GIDrUtMAttA2btj0Jk0jm8wN5P618S+KH2YVcn
         T+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768927640; x=1769532440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X0LtZmj23gEqAv2OA4FzTwpxFo55ctKnnuyj/fzq0/Y=;
        b=qNqwJpwzKWbaanSlTwY1P0f+uSXJSzLVUj0f0gy4y3/zsilP0wdnRVP/RW+DmbwSFl
         592xk+3h57kSSviC2RcM6LPSoxD8+PR6iwNhluoYo2yFnj2KwqlIA5iTTg9j1kgq2i/d
         pbSnd68lJSsm+NHV+CXh5BHGjFdghs4sPDZJXCOKaOMg9WJH00QKH2SLyeuX3VXW6PRd
         ymLepc0TStJSO6Tfh/kCe2g2rPANa6JHpUYgfBX7GIGgfOjXa/2oMOYJb+VIofOQka1h
         N398Ggv8FUAcCI05h2PJ8Rg0jciBY3uTYW2J47TRLFSVRFgisGmpu1+QuCeZt/Xa+n3U
         TQFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQmCxlHSrrUx3BHMuqHhA+70/CSsKElE7HtnG4cFJuhhoS6hmCHZu1qt3JPT/1P/E5/AWlB9IjRn9fU6xy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhi3O6QmmJ1tUFXiNxKFvLFJSQqZIrPC31i5W7aZb5sbjea6ME
	chUpatSf1YG4H4G2ocsH5Jn/5d24aCf4sgtWok7w8lDe5c3fDUvUFRLN+/tBDFEpud9nxkFdumw
	D9HLM06aAkO0aq0nX3oaddUZ8UDrIdL6FvGlNzvrtiG+R3DVivHsxU5kHX+Va9EwKaP6F
X-Gm-Gg: AY/fxX6smqjJzFRX3zxmfJUgXRcCK32jfoQPU/GBZjOf5JpDACsPtyJyXOIyJy8W/5m
	yEI9Kn/Eqw441AdJUG9QPIZduZEt9vY4uS3IbKECGDGv5UCg1TaI1gbiJxBUcAQrJBaDLkR6Uon
	pDlYHoSJgAMi45+SQ9/py0kVqthSdCD+Dq7Mq66V/VkJdImjdBSCNVSqcAjk7AwJcA+yWdodlsX
	NwfOSk50VYjeyF+/dpfxj43q72SW1QtSZC4xwNoOzQx1c6OuZgLheyH4V7OHwSqm1v7UrPMpb7A
	s7o1l/qF0LHjOhEVDnEA1C2ol9D3kQdzB0kK3OG4NyPL57aDhi0t9xl8gKZ/ksug36SR/UbWrHq
	8DJ7pmQHpLurjCUcHPUVN5bwb4Q==
X-Received: by 2002:a05:620a:6889:b0:8c6:a734:7d8a with SMTP id af79cd13be357-8c6a7347e67mr1966233285a.4.1768927640043;
        Tue, 20 Jan 2026 08:47:20 -0800 (PST)
X-Received: by 2002:a05:620a:6889:b0:8c6:a734:7d8a with SMTP id af79cd13be357-8c6a7347e67mr1966229885a.4.1768927639554;
        Tue, 20 Jan 2026 08:47:19 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cefdsm29511772f8f.24.2026.01.20.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 08:47:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/2] soc: qcom: socinfo: Add SoC ID for CQ7790
Date: Tue, 20 Jan 2026 17:47:08 +0100
Message-ID: <20260120164706.501119-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120164706.501119-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260120164706.501119-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=775; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=YbOnbFd/7aefh2keRqK1HOFcKinb0XZdETYvTeH5gIw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpb7GNcpivhbWxX2k/ZraF8/7kgWVIWySUK54S6
 NyF5d57fOKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW+xjQAKCRDBN2bmhouD
 1+rpD/9pJgCN9lcn75AzCglL1BRYTM14NiR/sZoLGvDkNskZhKn/P+ScdMxlQpNNs9ypco35qsT
 W0qi34188wPOW/KzpdNdKct7p/A5dN3Ysloj7uzgS0zc3I1lmaMZ9KGtguU+NwRIgInFoDoXjlx
 FM2yNpyYEZHRzmq3w1Wpmjdlde4XmNExIVGozCwLtFcf4LmTaQpVfmrJPCUt8qThOd+JtJROomu
 sVpqVwvZt2o6cyYwqe24G1N35RYwlx2nI7IFYpojQQh7Fs4FjAzi/q5IMv2Momi7UiYNLivKepv
 eER2Qg9f67Cwu2Z7loB45uSPeqosdDUzm5e6ioLNYR8pA4W00rGi04/tkNhKqGFtOK2amFiazph
 fTiUFmYFK8Z01TFkode6eXzvp5H5EjlU3wCqQMYNHEzZ22N1hCXEphCbTKAXFlZmkyNYGNw+17y
 6510psTcVbqZpU81xJf9o49eUDnQz+z6LnmmfCslKgMP2ySnMKZ0ghPn/G5FvUIVP+h8Otg0aA5
 eVRcfz25I5nxAko5nXx6hVIZvzrgM1iiepgV916vevJ7o/RjV09PLP26UWF6YBuQ5r35Rk370e+
 b6kFw0MZTJiMrk/LQGnR6COaBUa1oZmBfaUegb+MwTARqZZKHUNmuTcw3/ZYrVzJ7S1BhodhHkh 2YC8yovYKrbptng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0MCBTYWx0ZWRfX2HH0dVIkJrzx
 6vQ/YQfi9ceg3xLiObHYp0h8OJwml3Qjkc+uMzo6+yq5Wa2pBxTll95Lo7OY1MNA6PzRLHTio9z
 MeffPfU3hfA+4GSjsqBQqHl8bMQH2TG6RXjcVlRuQs1Sy2MBSIOCb30XMzMWN2psgdbvSR2GTK5
 T0tRqrBydvjLVV14C64B20iei+L3FB0zOS9E3UVqyOi/QUKcOXuG4GcNQ8Rp/Vt6DlV9YmOBZRW
 TlKGNo6ty8i1CqVrHEyzLSrzxay4D407goBLeshDbhcuda/wq1yjpqYLpu/I9hqNaViRNImlfy8
 9lsVdqJ0VaHuiZo9kHeFV56dIQORA//8xW/aJx9tcRWT/ELMNtR234WPTzgF9quSRtqYm5Mlc7+
 sjEW2Yy36FKabS9/iWuQk0m/Ncs0f/TFSY1jS746fqgVMROAGoqz+z+wyi8rgyUx7FgSZ1vlTtc
 irDLnB3ev1MnVSgK2wQ==
X-Authority-Analysis: v=2.4 cv=IYeKmGqa c=1 sm=1 tr=0 ts=696fb199 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PP8aMIA6NNbLyI7UcOwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: niZZtCMkBmurTR04gJFywp5yUO2M9b0H
X-Proofpoint-ORIG-GUID: niZZtCMkBmurTR04gJFywp5yUO2M9b0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200140
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89860-lists,linux-arm-msm=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65F334A974
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Recognize the CQ7790S and CQ7790M SoCs (Eliza SoC IoT variants).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add also CQ7790M, extend commit msg.
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 003a2304d535..41867601d250 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -522,6 +522,8 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
+	{ qcom_board_id(CQ7790M) },
+	{ qcom_board_id(CQ7790S) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.51.0


