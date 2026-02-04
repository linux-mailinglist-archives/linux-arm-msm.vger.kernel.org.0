Return-Path: <linux-arm-msm+bounces-91836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAMILu6Fg2llowMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:46:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE58EB184
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58C513070109
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 17:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D317934B68C;
	Wed,  4 Feb 2026 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ph0Zwv2I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTzvtXoJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A6B348865
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770226974; cv=none; b=oPmIJDqFK2gJ+qO3QKhtev+LKKSgh3moBcj3jAudJTxS1b3Ixs9fojxrBNcuJZlN/J12vq00V6QtUZtgDvOqii94AguTwB9rZNdHH4kfJCSJHo50UnsB8v3wocnAwUJQ5lSkZK+Vsd2SiE5LzPr83WDKIqRr4KM4f3fBbetiE0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770226974; c=relaxed/simple;
	bh=lxAoslCoGfU7do1qJxQC7CExg6SOCvzg3I3OOrDkREc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZCZD8y7mLGL9jdSm3iGFV/OO9p4ThekcY+ngItAEP8WVTCc07A+r+SgYL5gAicRsSUEO5llEXUOHXuM50OzKxRCOPLTmeRiw6GryVlNOgnMrk9vUSx2l68gSdO6BuCUx3OLwDM7DG0UBOMYg+GvWuazeLGdN5IDVSpisJfgvl54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ph0Zwv2I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTzvtXoJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIbJC795222
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 17:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7zWGsz2dqtQaICdB90yHQ9K8yiLD4YIaOfG
	q4qsMxSc=; b=ph0Zwv2Id0TsFqjU04PBDuimC9V9Pe1uEYvuV0sN2BWKrk5sJD9
	rzm+exKmCEox+9YFExbjZ4bSm+oa/0yW6iD+y3yQN+8dzMTIovcZAMVLQY1tS6ch
	sCZyVg7RlEOZWQrVWkBf/6wYT43ekVe2cG8E2ZI41ffZ++O/OTrfhYGFqrdRWXjV
	BSFVfITlqsfL6JV4Vphkk2QvqJ4lACaqA8Pe3CUUUa3qzIdSfCuxazwuHkMBmFTm
	5oHk9oee4Td16YR46ap7LN1ajFQTpKf9XXli9EUu0ED+Sier/h7hDy+/LrlNMCEL
	9pcoa7rNHEN43H07q7oE8uUNZYL05uQpf1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43uxhgca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 17:42:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c7166a4643so1894287285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 09:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770226973; x=1770831773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7zWGsz2dqtQaICdB90yHQ9K8yiLD4YIaOfGq4qsMxSc=;
        b=QTzvtXoJiMYhLLsdMozGhiCRCOdL+S9X+Dphki94sEk7P+GhqkHusBVu3g4ry2M2Fu
         TCoyP5Ep7IvustxtrnsEuBkV8J01fRDI/iLteXK0hQaEPtjE8b1eyu9pbLxj4A/6UM5A
         9hhCwVXplUPWytiFgCEAsRrDyXkZvAYccSDd1Ambxj4J3xhhUleK9DBjK4ffMo47Y9yu
         Pov03dCpzonVAfa8YLKnYnJt7B+W6VxzrgD1tYS6Q77bDIC+rbJEbgq3Hqp8hCnbSHzj
         6B2+CUAxNVV5yvPcmp+bYq7b3TACB3z/GY5dAKACl8uW6WGpBS+ScCUtIzBNE3n6y4D6
         f0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770226973; x=1770831773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zWGsz2dqtQaICdB90yHQ9K8yiLD4YIaOfGq4qsMxSc=;
        b=hoN3Tr9sZMUReI9oswjQzlzgySoHakEpsSie8wDbBKmpHCeI1tjoKYgpLJnBTdQxK0
         S9eXj/142l45r4lg+45SJcANuF4+fLnZ5qszgOeJu/BomUskzqzlQSN7ezPonX352eHt
         Jc+T/iZVnr1WbaZ9UYHxRo23desrtI9a2ItG71aNgFU2x/j5ORP8v2Mkin7E2jJbN4rc
         cIZXWH9WvwX5ifBYeI2cnFZQMlEuh/AqMa2QoIX3PV0aHAlCXSu2oC9cOCsGQt6g1e37
         +QJVtoVU0aWTCM+IZxx5nSaQT4oQS3i2w9djZ9g9lXOxLqnXzBuoVDEyZtDFNJp9CLeT
         G8OQ==
X-Forwarded-Encrypted: i=1; AJvYcCViy4FqP9jrzSqDK0MRyILbB0md4JnvvjW/4n1VnbPxOtdnW9URzCctYB2jQJ9dwfOfn5992AkVofBYaUE1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq8Vtz3trR1LSsodxlCXL9eXBAiC16dLN3cJadZxjbFkdE/oDR
	nga1DYsH8GU9E64pwkH3ud59pH07xyG5tbJZjTMAjpGinDGh7mmCxnBvi34ILydgFi2p0/K2+5n
	aGYdeaFq1DrhHkAI0Zoh0mI3ZqDXPOuZ99eVxIqAcx+LUTnd+ILgBOrTQwArjV/lkqUnP
X-Gm-Gg: AZuq6aJu/bOc8clrUf9nbOC19BIHmt8a29sGDfcqJMz6P1AGBYEj2bTme7SBNaqLOsg
	2Wq5pZ9bowxkHUmvWFxlcaMBncOUluXwwKdCovrnRdmVac5XxieXJDoA5zan3AMOV0+lfkmzo+O
	qfuaCgPNLo8GLh+E33t16ZLu1RGZW1b1l0/ZrvBBGFkLeD2l3td9+hhW9MwM7a0U20hUzemdvHr
	gfLS4akHKBr+QHFoHKswnDoD+Tu9z3s+vfFsaEeY+vEDENi7mxPi9fk6IBDilWER/7fOY7GM+9q
	O3xvlNz38dvVyb1ftbZsJ1BdBkqP0WxnPwlRuIyadEROxxa5jyB42jw0ETQb7/dOpfGFpOvIg7/
	ZrQHrXzrtonBIGyF7cSJjWWWiGN7OTLG0MCptvU945lY=
X-Received: by 2002:a05:620a:3715:b0:8c6:a8f8:9645 with SMTP id af79cd13be357-8ca2fa6cf98mr486520285a.90.1770226972898;
        Wed, 04 Feb 2026 09:42:52 -0800 (PST)
X-Received: by 2002:a05:620a:3715:b0:8c6:a8f8:9645 with SMTP id af79cd13be357-8ca2fa6cf98mr486516685a.90.1770226972431;
        Wed, 04 Feb 2026 09:42:52 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483179dbdcfsm959985e9.0.2026.02.04.09.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:42:51 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, srini@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: monaco: add lpass lpi pinctrl 
Date: Wed,  4 Feb 2026 12:42:35 -0500
Message-ID: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=StqdKfO0 c=1 sm=1 tr=0 ts=6983851d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tLhI3IazSDFM1hWFGSEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: c87Nj8X2lWmhaf-yQ4qk8B0-AtL8a1fE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX029bva3pawKu
 x6Bs+JJayW7TJqH9nINIL/0R382RquwclSorqJH/hCgqxvTcRUUhMcbwkLypytXPJ0txGpOPAKP
 u5IAYzLaOJqenBlCu0mWXjB7AxbgguMyGBQo0etK87HoPQcCqjp5QozWuzYMbiHjG2wi8IsH5ze
 8vGD4ogvK/p5FbEKcnAP2PhD046z1OygVCWLjW4cG5fFbvo4tq5pl1f8LouiOic5Cqhbc0NYWw6
 w/7XjOR0gt9OfzzvOefhS2WBu+bmUEKZYB3Z72PbNPGPUt7qnyUpQ5sCISSVb20L1KSnCNkU984
 mXLKe5+hF2uC9Jc3jGxPoEjL1XSEsokq8FEGI6OienJcpnVGiPeg3ZvIz+t36xjOqvOMcPg4oxS
 lKImOrlW6Nf7lXmx5fiPKT3ar8AXQPHG1GCcRbAFcuW24lB1rs5TIfu3W81VVBD0uu1IKn2Aeyy
 UUwaqxkXbe0Jz2YXGhw==
X-Proofpoint-ORIG-GUID: c87Nj8X2lWmhaf-yQ4qk8B0-AtL8a1fE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91836-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EE58EB184
X-Rspamd-Action: no action

This patchset adds support for LPASS LPI pinctrl on monaco which is
compatible with SM8450.


Srinivas Kandagatla (2):
  dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: add QCS8300 LPASS LPI
  arm64: dts: qcom: monaco: add dt entry for lpass lpi pinctrl

 .../pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml   |  6 +++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi             | 16 ++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.47.3


