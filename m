Return-Path: <linux-arm-msm+bounces-103649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APkgEy6W5WnrlgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:57:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DFA42674E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F183B3007BA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 02:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2651437F727;
	Mon, 20 Apr 2026 02:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bfl9yydF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3Od2MBe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF24E37EFEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776653865; cv=none; b=deLyMwmdOxE8cusxKv/5M4pS5hJPn1a8kY71If25R+ynLParNVbR2lkKABUXoZQj/SKci3EecKM0coP1Og15o95Vsj0PLA8JwlCi7FLArIw5IowSA/37ld66P+wVRSLmPGYYjaXQZlhPtPmbJQqUjqjuD+fzsMbM+Nxm3k2wyeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776653865; c=relaxed/simple;
	bh=9dOaVE48Hg/Z6lF6josr/LqHefZ+NYo+hszbsN9lkMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i4NOaLnwBEgoMlaeV4nIGG7PWwv2tMFfdwGqFl0aDaHg6AGn2/5vTU1FUIJv29BNB4K4WkAIlQDmKg+gL1nw6zjgwq3j6WRY0TNxqR/uUtt2TlpIz+2qTmZXC6qn/DWzlejuhYwMbKkJOEo1AlHUQedpryquMx/u27LziHE2SsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bfl9yydF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3Od2MBe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J5CCAt033548
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aVmKcB2K7HMO18UqcPnricoqZOY6WNlZ+jF
	5oHV/nMY=; b=Bfl9yydF/gqkmIK5iN4VBoxfLJmWF4sPg6doDjMaFM4T0Il5qC8
	XaiuiURyKrx4vZwnk6L6ZqprsLGaIWE7VnpQ84pXT4jYrvnduhTHURgKP8vruZpC
	uNiE+ggKdmFikebv0ybjGPpHpSvvXKmKRLLuhVRguQK9ZS5Ld3FAWt0pk9buqV+E
	pLgOc99mLElWVdvnmYywhmVWVG+oJxIsuE3D6niyyvuyeOrMKqWyojK0X22s3NlP
	TmYId+ISTd8q438U1FWZz2jDl73jxqYow+E1P3JtGWc2lulo9UIjcsS4q0XHGU9l
	0Y2nbBiEOSyUo/BAHeOgwyEUNFm2K3RDRVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx3t51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:57:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b249541063so22167255ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 19:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776653862; x=1777258662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aVmKcB2K7HMO18UqcPnricoqZOY6WNlZ+jF5oHV/nMY=;
        b=R3Od2MBey0Ok5KmfGoDgkD+O9wk9soHxufzbYDrSrQG7lD17HJGxFQHnr2zf2PnRUx
         CBX91hUY6AOt71u/hwhD1ad+S1slN3GW/U936lwRo2SK4dBRilHUopbQ9EDOyeqGeKLH
         OQK5UF1Cw5CkPepio2iF9gqQpAUqFH3BHc675QPJVYxu0hL/JOXKP49070eRf3rDKvjM
         sWARVEg5d3JFZaeGVYfkMyDvUN3Mjqcev8rIw8EJgFpnOeYsoPrR8r/tnVBtfv8h3tZf
         MlQfiLs5ysuWkdFtjsVWsATE6i9WksAH669gshfU6RckJq/ZTnhmAZXtgPdkp4kaCZYf
         LEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776653862; x=1777258662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVmKcB2K7HMO18UqcPnricoqZOY6WNlZ+jF5oHV/nMY=;
        b=XUkeEdk7ZBMgOc61rZ842EcyM0yaprWXvcKgA7PA76a1tl4nvceZEhtw5TPsoX9Nze
         J6FaBJss+3BIMQ1IgbotyWNLrzwe7DOEgKKZZiRcWsqcRvyWMlq5weIDnp+NJeNo0YrN
         TKe5DdXLyK6tTvfIAlxnRq+CkCA/UCOO/KP4Pz00e57W4sc0hbBY2e7lUiu8PM35R4uZ
         XdhMMT5zNrndIyPPtPMnBXQgxoK5lmlPo8NyRn8N895KBJ5EfpXO072JwlrowwimBCcy
         nVhxGBUKh2mgwbvswkpx4A639gDFbSitL3K7YINIm4O8a3itJtBkpIzjcPwRDtWalKI7
         zrQA==
X-Forwarded-Encrypted: i=1; AFNElJ8iJc2ENOyYpdDjLC2HGYQ4FELAIgEjGuo9WtJLRYjM/FiTzbnjcRZlghrDrCZ6qnNvgM13cfRKugyGPAI1@vger.kernel.org
X-Gm-Message-State: AOJu0YyVQi2MPu3U1y3wn0UbltG3J6sJUfP456EdcJDPBWZXmKji9tAN
	8LfkV7XaFu27DOfIDno7T9mDlfd/QnbS2OaM4dLJ5JLTBHb38M0OAT11mrFjDsFql9LvPZv5smH
	Kk/9SeAOmqGiaOvyCvCdgI5uhKCQ9psRhcplxv7VFZwZYVa2/cS7w8mC/yCPGJr2kpueP
X-Gm-Gg: AeBDieu2kWCRTOEbTDbqYXT2A4EelCTGmncCT6ir5sDb493vXsJb2Bbbm+CxEswulbN
	aKR1zqrZ4v37f2xHhs9ajdSLRK+1odiZxRiXqpm3duge+KuVRVzaEWajPFxorFqq74qxrkUr/Zi
	iP4zE9QZoVU8/qQxEAdbu629mhQj4Od2m8mPEJh5AGIKFmq6GQH8KwHgH1/c+oOXh784qfpl1rw
	liRZG8TC7snM2xdkg8ofF1Fl1GSA76Q/B+MWsEUnjqbQG+UKVJKP3+0/VyghRWHAsnIK2ogos99
	PBP9QqxwLsbfYZqBxscjCzw6hnHM1I/RnDDIcZHht59y1bjxvKhsuVsyz7by+Bh+PouEJCjdNMd
	eas+lBd2RHzfsL2On/AyYpkgd4kmAII+dAel+fpxUONwtGnqE4yPRakqaanykOpk8
X-Received: by 2002:a17:903:1a45:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b5f9f4f562mr127496645ad.27.1776653861515;
        Sun, 19 Apr 2026 19:57:41 -0700 (PDT)
X-Received: by 2002:a17:903:1a45:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b5f9f4f562mr127496315ad.27.1776653861049;
        Sun, 19 Apr 2026 19:57:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm80865365ad.29.2026.04.19.19.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:57:40 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: crypto: qcom,prng: Document TRNG on Nord SoC
Date: Mon, 20 Apr 2026 10:57:32 +0800
Message-ID: <20260420025732.1240525-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1zyc9mcArvvL0NAKj5RiLLa-xPsUHnBX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyNSBTYWx0ZWRfX/n2C9mosAV3i
 LYbo/0OHPT3bg69xv1hZXOY3N2Fl146o1LVQj7Nsws4fqQawRXPeUpoxGYxhqAzR5Pl57zYlzSE
 xhRG9T8bvDh31FZrtrsr07UO/PTwZ7Fu+Ai6i5bd+d5YqRf1D4WfZdKYUrmILV1e1KWzaCTvnH2
 HpriMRuxgckc3d6F9zCoJ16yK7SgcVAmsGNpZgWIlbqcafngc20VetkYIFo6No+op/Ir7MixF27
 6V5JSWi9fBT9pp79wRquN+HTWYbHaBEJ62nT/t6Z32UBffZitONwxEZFCx+bbUwxqB0OT5b6iD3
 3VLe4V2tba7BnFIVI7OnVuSE39DMx/v1FBAvf9Z9Nbj4Ra6dhwA7oh2YFdyWrvIEj2dPwy85tBk
 lcVHUTSKeZWYRhcNnl8BdFTUAu61EAFmd/vpNtJcU8U2EU2f99voHfUaAdvhC3PuQG4CYaNkWSm
 Yrpfk1DvfYgqmD+GwGA==
X-Proofpoint-GUID: 1zyc9mcArvvL0NAKj5RiLLa-xPsUHnBX
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e59626 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=TDQlr1YfmYFMKhKHBNIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200025
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103649-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 98DFA42674E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add compatible for True Random Number Generator of Nord SoC with
a fallback on qcom,trng.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 41402599e9ab..1362a8b748a7 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -22,6 +22,7 @@ properties:
               - qcom,ipq9574-trng
               - qcom,kaanapali-trng
               - qcom,milos-trng
+              - qcom,nord-trng
               - qcom,qcs615-trng
               - qcom,qcs8300-trng
               - qcom,sa8255p-trng
-- 
2.43.0


