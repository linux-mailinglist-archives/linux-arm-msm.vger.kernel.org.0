Return-Path: <linux-arm-msm+bounces-118998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a4x9MCUKVmp+yQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:06:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A36753335
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:06:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PPjOKo+Z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IxxjfK0G;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118998-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118998-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93D083011113
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D013630B0;
	Tue, 14 Jul 2026 10:05:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4428634E75A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:05:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023543; cv=none; b=KpKB0WTrPu4alMFo8NSapcxDfUFlE4rpQh5TXzvr1d4uQJc8na9m6TUoQzXEf/JvQJDCmI4blrBhCetxxCG7wytZlfoR9iqzF8IQoWwqbQI0e30ruaH61cLVOd5BzYW7Bz8x/7j+cGABCTcggUEf6r1S6EGNk5qlheTGi45miXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023543; c=relaxed/simple;
	bh=NQruLk/ObqYkO2tZ+lmnjFjQK3S/7P0PrPBa4cKxzzc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y74/wsVL8/akegAGYmpOg6QjYCgBkhXPzMI7IieOUinLDeqVO2aBuGiCDko8xGcvP2PqJ3rFN82x9F3iv9HOjoGcG3/XkZWn91/pd3CDntqlKzQOx8DFh5cOA/Nytk3AAW11p2PxrIo16rUlUle8gMS8yBqBB0774ys/OWo9i9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPjOKo+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxxjfK0G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SdEh3743931
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XbCHcSVsCTXwaDdxV9iQ5J
	AMAibIMpvYz9V47nfKm1c=; b=PPjOKo+ZaimbN20wG8euX1Zjbl194RLn9x7TfI
	rSAGbYg6cyPxEh4ZxUEyeCFngg//NN80Rhnu/KpIuYldyNhmTr8VRoR/Om5TKFjs
	tvaPHLM1mUB5MPW9PYMfWLZzbTbBC25+79BH5oeiSmKPMQZ1Oc46CmtHdrCrmyEA
	F6JIspWQ11L/YM2Y1FxIAPaxjiyDKRZf7YufUDSEKMRMUsUQXU3Qztn5KdTBfPEl
	kDgT3R3MLnVbOA1kmmK3Ev6xYYTUS5cVXCqxZ8ZzAVKnycexRcZ1znWnTEdIuqPr
	6H9O/y9gQ9NpcoDALZAxXzRhyHfEzmWdGcQh8EmFuFcDT48g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p34xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:05:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce02cb769so10846835ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 03:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784023541; x=1784628341; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XbCHcSVsCTXwaDdxV9iQ5JAMAibIMpvYz9V47nfKm1c=;
        b=IxxjfK0G36H0WIBK6IwLclM+MX9SCzDxrXyDHJrFtPPBYIUh/LIB5VzwmClvHxPhaS
         duOOTvtPv7sgjiOsRicNR+0bPWN2tt2r74zs6iA4yD827RyT4H6Mm3QsPDH/pxYKGslS
         CFGHDiOct0vclKBQvmVxE005ezCeONQ/Eb55VNuT44jmCU24GdKMBOgrCBy9VZdfvx/7
         xSgzvopm07mcozPhUnXe+Vn6Nx2e6+UVEFs0INNDAqfOreRVcWc8Ox+wsjdK+KBcFym/
         Z2JGolRmB6Xo/iz0eTxBj0V7tRTxJhYHqfjX60OwdU8/aV4tq9ZD/r0Jd2HfkdHD4WTW
         QiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784023541; x=1784628341;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XbCHcSVsCTXwaDdxV9iQ5JAMAibIMpvYz9V47nfKm1c=;
        b=WK9kMMMeE4GxGvgosZxT9fTDTThXCe4FLr6j8+szEgvoOdGVafO70aQYnYxYjUb+jJ
         f4F0AjzfcpDHySYIgGM/ci2dIkrfFGN+u7zazeBErRKRuoodWcFJDA6ip90catCU16U4
         KagE8WK6/klFmy61cY4GXJvWbt6Obi7gNwCZxY8FpKgNNmI8zJpMGO6xHARQVg9FCm9P
         +jCw7PstVL4KSa+JbHb6oz/lvdiIR2zbBfvUFy7V/wmjB3wft78V7jSBXGLL4gBXAf9O
         Fpm7o5hSwLqzF3a90li/FFYscFTmH9Vvr55g8eIffHi0hNZWG1R3dt4Y6V4IQaRLrUMZ
         DO8g==
X-Forwarded-Encrypted: i=1; AHgh+RqBlYYA+wqDxRNfoj2y9a8zmgMT6n0VmGsjUCBNVhH/COMJucA+HIAQU2oFKHYanzLwA58bDJzVI7ZPPo0v@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv1ujEV7UpILEaLFJdEUvjGx0XovmapuEZj0+lvIPTpWCYQq10
	bG/vEy3S3oqAE8kt3n6lZw+etixPydE/AD4Q4kbi4gqLpF/vEJcyQrxxO0pDvjD0m22Z0zaYFXw
	Fp3I1WsdqCBgyE55MLhsn3wsAlbJVHTJN6rhypsASbV+omdcdkQcY8ix0yzrNI2r7jm9CHQHrT6
	o+
X-Gm-Gg: AfdE7cmZVxESjCdl5ATQ+QF7jC+XKuFz/EF/ZzPS4sXpcLEztngGlsBFXp/Soe2y/VQ
	cRG5/l+AXnBjYfialmT9AyKY3Bbt1s/ZG9vFjTwGy2Bw1cbricDylVwRNU6uzvU78G2Fu+e6v7T
	3Yvq29EvN+8Sh6gNXeO8TOoSgjDSCL2TmtkmRKjs2cUbmlkmYNmMg9fB+EjLtApvnifgQGoXBSQ
	S664RJB/12d1jD7JECdYPyaguxrte5wCs7O44KtKmby+7hI2rRgjQMvuFw5Kch70Amj//sABuqH
	eKHnIXY3v4wOtdsO482eoEyoFFUIbuL1A+hfJX+XihaAALMMjj95Y/dlbUMSwBY8EKNcIvxS8uF
	L0RkRwqL8Au93NPAU6+Oaqw3sqsVouZfhkWWswbg48p8P
X-Received: by 2002:a17:903:2a88:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2ce9e5a3c11mr122463885ad.3.1784023540807;
        Tue, 14 Jul 2026 03:05:40 -0700 (PDT)
X-Received: by 2002:a17:903:2a88:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2ce9e5a3c11mr122463565ad.3.1784023540366;
        Tue, 14 Jul 2026 03:05:40 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf737bsm112653485ad.19.2026.07.14.03.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:05:39 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v4 0/6] Shikra: Add DT support for ICE, RNG and QCE
Date: Tue, 14 Jul 2026 15:35:11 +0530
Message-Id: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANcJVmoC/32QwW7DIBBEfyXiXCJYMDg95T+qKoIFatokjgFbj
 aL8e7F9aA9JLyvNavbNam4k+xR9Jq+bG0l+ijn25yrky4ZgZ84fnkZXNQEGimnGqZU0d/ErmQO
 m66X0h8WWPQ3glGtsYNI2pJ5fkg/xe0G/va86j/bTY5l5s6OLufTpumRPfPatMQ3wJxkTp4wy3
 kjEHSJzft/nvB1Gc8T+dNrWQeaoCX5hmsHznyeoPKW4FgECtFbshxIf8MRfnvqHJyoPhJUIrJE
 A+sF/97WL5Iextl3Wgog19Xw2xVLb3wkFYiedcdoFpRC0xFZpA5rXNXKGBqxtK+z+A90eyi/CA
 QAA
X-Change-ID: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfX8+R9++T9rdop
 iBF8Jab1QJJU/GcDsMW+kIN+F+zBpgSXjirZpypwVLhLjDr401otn2hEoWx0EXnWwW13Fz5PSk7
 jwiZ+qZ+tRaWIAzpjVBI8rkWuze4HCs=
X-Proofpoint-GUID: vC-CKjzqrHINaQgdrJi2ZL_0jktLQ-pd
X-Proofpoint-ORIG-GUID: vC-CKjzqrHINaQgdrJi2ZL_0jktLQ-pd
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a5609f5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=FNyBlpCuAAAA:8
 a=J1Y8HTJGAAAA:8 a=psUvNacZHcIMRI98aYkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22 a=RlW-AWeGUCXs_Nkyno-6:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfX+tGV27wpdAs4
 J3Afv1DoBS7w+sBWCbPZCBJW4zZoYcKJk2jKoRg4H7jL130RM4oY/jtKPexbhYp4Ln+VSAG47DO
 qKWtxwzI6/LObEIOt3n8D0CoWXiOMRfMr3C4CDA8MKv7fGWx/owTML2Ze9cVbrcGk1JQY9NdLBo
 wnYExNLxAu9ds+tn+WX1+xcfbTVqNMBVQRcSnaY+Li7qJ2xH8zLK6gOofs64y++mIPvpTxVHrW3
 8yLQTT6dpwxj7G6gF0Q1piyGuCRME6UEGk0kxc4GmfYXdxA86RN3vBVh03A5aLmc71Gzdt7khOH
 Wt6f/M8CntSuZzjSAxfLdl0ODELljrkuuOFyskaBM0a1rhuk5J3KIMETz0wmMouahgfIuSUM0Cm
 fLmxGhL86O8DDpwd8+D81tuFBNOgDFvhfbxX9R0O4kXQF5JcB2lc2zYjUcPMkOtNGpnXM4cDNGZ
 qCbDPSWYfcjrAmv70wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140105
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
	TAGGED_FROM(0.00)[bounces-118998-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10A36753335

This patch series enables SDHC ICE, RNG and QCE support on Shikra,
aligned with how similar support is modeled on other Qualcomm platforms.

These DT and dt-bindings updates were previously posted as three
separate series. Based on review feedback, they are grouped here as one
crypto-focused series.
Previous threads:
QCE: https://lore.kernel.org/lkml/20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com/
RNG: https://lore.kernel.org/lkml/20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com/
ICE: https://lore.kernel.org/lkml/20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com/

Prequisite patchsets are already merged so no longer tracking.

Validation:
- ICE: driver probe at boot
- QCE: kcapi tests and driver probe
- RNG: validated using rngutils
- DT: validated shikra-cqs-evk.dtb with dt_binding_check and CHECK_DTBS=y

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v4:
- Update Patch 1/6 commit message to accustom hawi special case.
- Collects tags(Krzysztof)
- Link to v3: https://patch.msgid.link/20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com

Changes in v3:
- Fix commit messages.
- Collect Ack and Reviewed-by tags.
- Link to v2: https://patch.msgid.link/20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com

Changes in v2:
- Add fix in ice bindings to specify 2 clocks defauly for non-legacy Soc
  compatibles.
- Update commit messages.
- Link to v1: https://patch.msgid.link/20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com/

To: Herbert Xu <herbert@gondor.apana.org.au>
To: "David S. Miller" <davem@davemloft.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Andy Gross <agross@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: dmaengine@vger.kernel.org

---
Kuldeep Singh (6):
      dt-bindings: crypto: qcom,inline-crypto-engine: Fix legacy/new SoC strictness split
      dt-bindings: crypto: qcom,inline-crypto-engine: Document Shikra ICE
      dt-bindings: crypto: qcom,prng: Document Shikra TRNG
      dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine
      dt-bindings: dma: qcom,bam-dma: Increase iommus maxItems to 7
      arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes

 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 27 +++++++----
 .../devicetree/bindings/crypto/qcom,prng.yaml      |  1 +
 .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
 .../devicetree/bindings/dma/qcom,bam-dma.yaml      |  2 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 52 ++++++++++++++++++++++
 5 files changed, 73 insertions(+), 10 deletions(-)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


