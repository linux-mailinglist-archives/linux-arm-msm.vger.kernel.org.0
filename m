Return-Path: <linux-arm-msm+bounces-115784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G1/XOnN3RWrpAgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:24:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C32346F1706
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:24:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="FK0/mAWg";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GIGFXpkU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115784-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115784-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F536306039B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 20:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA9F3AE185;
	Wed,  1 Jul 2026 20:17:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9DE431E51
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 20:17:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937051; cv=none; b=HB5JSO1CchCCM17RloHiD1ca3J0xXy+TMJpbeKqkEJ9QoUfmohFBimAOVSX3vNLnDitNh1qV6/rGd6hlPaASWigVozIu3/HR83Z6f2mFZsyodt629dznP9GvtV0ts6XZ+yHyExd9Aujspjy8rFBytVwU2EDVripm5eUd/RcX3Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937051; c=relaxed/simple;
	bh=/kt2kc2jbmuzKZ4McYNdX0AxlRXrEDLuEDhXarOS6Z4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jYx4lcsI2iOJWRuq4K81iAHhWdAY+MKx78EuFygA44jdSJ4OkDS5tVuLUENzD7Xvop9x7wD/0CVJM+Hfg8QEi/3FH45Rmt7rRvn3QzYwfGlRq7n0xKuSwf8ZOVFbY9HxcNGH5IPf5i4ke91yo7WzsuBianKzHROYHebiR37WCg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FK0/mAWg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GIGFXpkU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Gmj4N1590015
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 20:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Td6g8hWIX0u7vVaqxIzSNW
	VPp5ms54iIRYivzwTSa5E=; b=FK0/mAWgoxbLlxXZmSkFi49rmaMGa2IOel+VXV
	rllUlrSiUx+JUNdUl4c/eAGvJdj+eQDLOQtJXXyeyk8+mXTxSslNmvL3hZalQRV9
	DFeqcg+D+cbUPfWf0nTq7OjeYTkTnkyGA2zpVdY3ZAeLFV7vyW7Ny/EA768Xu6L1
	ZNlkVPWa9o+uED0h847l+NawAlnEhFE5MHFsMd6A2e3kyBnj0Z9vJnf357HQoLod
	MLFRBt0oian7szrUAiwkZlJne+E/g1TzENAY2j004VlGVh5SxEHuRYT/oBHvgHeJ
	NyVSmhgVM0MHqoHpuSTNHNVa9FIkUnVnFDwf6yDOtgHTAsHw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q09p3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 20:17:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d97955899so1123475a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782937048; x=1783541848; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Td6g8hWIX0u7vVaqxIzSNWVPp5ms54iIRYivzwTSa5E=;
        b=GIGFXpkUf4BpXyflKLsEdX8hJ40bfFG6pd71mTfwznOwzJVZzASWOrQjhwwrW4nTXK
         PFZA8NFuOpkUtq8vNA5TefJ+Ze3LyqorBLYqkqXBbHIoAdWQN1sVP7spKQa3sJ11bo3u
         vq24EdV4yjz6lupJ9TlP6zohTQdOZL2yZ3pxIJA2oT+w2NKbtIx3EdwTRxbr/2K6uyLP
         oxg9Sj6D6sdevFngBp45MqeTZPVT5lZe7NoU3sH8NM/JerEVznTpfS1vuFmtlWwrPvFU
         cctw+/SSshmcfY1TDac/zBZ5uqv5Xs6REDvVCpFP7yYVHfIat7BFbWX+lW9dYvFMAMFp
         LmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782937048; x=1783541848;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Td6g8hWIX0u7vVaqxIzSNWVPp5ms54iIRYivzwTSa5E=;
        b=Bujs2nk0t03gC+H9wJrMp3hY1XNH+vPop+aErNa1p0xhXk9IULn+ygNHcBur30ItIe
         g6Cyum2Io/0ZsycygFRsJP6pJXQtwxwvUuwaFmxa+u7feQaMdno17FfiWsKqnd7LUT12
         bRqfq1SHtZk2bea5Ixf2N2Ns4HQ+AmcKRK+xUycbYnXJUU1q3P1msg6UpeXNGdFFiDln
         Fh+5N32VQuJmNTCd/j4aNXeibzcQ/sRvOseW7cF2XYXqBvE/034sfH2gE27w1ZrcS15m
         4DcZbXQF8xYE6t+JAG6WkoiwtLI+dmUulZGUrn4giQuBjTjJnjabe3PQoI+cz/ps17Pq
         XtKA==
X-Forwarded-Encrypted: i=1; AHgh+Ros9RYtzYlKLbvj6Gcs6vUVSfgLT/yPMSxnsRiHHRbHk/O5KFM7E4oMaJ/oL24YbI0IKK1BD1GgerbIds8a@vger.kernel.org
X-Gm-Message-State: AOJu0YwO8/XZgC+gFGY0vdyoPi8Lx9yp/AS2ebodUIpPSWDKSBLnLYdX
	ks+O4aLGIVMMo/aGwM8582t4dCUMmBcD6ZYY2FQKw6ngW+/ZYLbXADN9f8/8mh3e7elhS/lFPAx
	pYBLw9S+f53HyxLtQKOgOFzbWmUszdqVtBcp4fBdhshHzw2ZWN34t998rshz92v98nQdP
X-Gm-Gg: AfdE7cmZZ3A0f8vWnbukaBAPyhFHtHAASAM03YxcUnJ3FMUMzKnJX9KtoZ76/E3+wS+
	avWMIVQmLhsfqQ0uqbrBm0/TdJpUTqeq5qo9qaTAX8VC0onqTp0haisucgI2eiUFCKgLNgNCtu9
	/5PunvzXYeBssokQaNEEbedezY+aBWjPt6SzQgUvFSgu3vj4SwUhxHJYyWWTMKHbD5RZOUIPVdJ
	SmywfgVyCjGSiVOc+V3/u3W3GBk9XGpviY8lzHHuVD/FCkP/ED4AwONa3NMzQIJ/qN4/sjjGutH
	iwo6KiC44aAgq1N/9AjvgVs+zZyVc/ZkGGM5qUfnkhqDxNjA/fDI8wlrBJyDHRwseYHi6dPpnm0
	h4m6wOaRLTCts4lhQOjRPRlU0kSFE3euR3avmbFXXdn/a
X-Received: by 2002:a17:90a:d647:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-380aa221bf1mr2879512a91.23.1782937048241;
        Wed, 01 Jul 2026 13:17:28 -0700 (PDT)
X-Received: by 2002:a17:90a:d647:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-380aa221bf1mr2879454a91.23.1782937047700;
        Wed, 01 Jul 2026 13:17:27 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc79231sm948685eec.31.2026.07.01.13.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 13:17:27 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Shikra: Add DT support for ICE, RNG and QCE
Date: Thu, 02 Jul 2026 01:47:10 +0530
Message-Id: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMd1RWoC/3WPy27DIBBFf8ViXSIgvBxVVf+jiiwYxg1tHTtgW
 42i/Hux3V3TDdKgO+fMvZGMKWImh+pGEs4xx/5cBvFUETi58zvSGMpMBBOaGcaplzSf4mdyDaT
 rMPbNGstIWxF0UL5l0itS1oeEbfxe0W/Hbc6T/0AYF96SOMU89um6ume+5DaNEvwfx8wpo4wrC
 VADsICvfc67y+S+oO+6XXnI8b65El6m0mbcDiAd5uzWNofqebVoLn4tNIx01oWsvQavbPDSmD/
 kl+XkBxhR0wjYYNdBk6dh6FOh2ULjTmjkhhtv1WOad6XT8hPHQ1U7sHIvZdhrqQyo2lqmWxMsB
 r7XtbOegQKpSsP7D7NHPxy3AQAA
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
        dmaengine@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a4575d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=FNyBlpCuAAAA:8
 a=J1Y8HTJGAAAA:8 a=psUvNacZHcIMRI98aYkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22 a=RlW-AWeGUCXs_Nkyno-6:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-ORIG-GUID: 0Tfh4EFVhzlVu92mBi48olc36Vc6UeND
X-Proofpoint-GUID: 0Tfh4EFVhzlVu92mBi48olc36Vc6UeND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfX0hCI6vomczeu
 /2rbpGUCbFpR+O98MZHUzTohDH5hE7MbBFj2dQtownTaAS4T6Hwe6Mvvxt+z45f6B5dlFcwwkkP
 OtVca/TMh8ddp3PwrJuDnef2ggCeXK4VO2Pd9BPEShzaSj5SFHbNVg6O7ivI3pVqNJu+Vrw7ArY
 RXbhDLRA2qmpwJevDCBD+PwiBA+foPqt/XFKuqNq4jeKnRPNKS1DlJiHIrU07BP1mJy1lNeJVFz
 0oIG1vcOzwR9b3dPgnuBwsJBI79/7h+Fog/DDZ6FXaw42dYJzU4nejKojkrryt2nGDzFtmOPiJe
 T88xFUcHfbQd6LWl9yYztIw6AMbmXISEN2FWRqhlrGW4x626FQ+XnRcgpVd2bOSvfAdV2xYxeHf
 i2Z1MIn6D761o5ipbT3ysvdaaj7iwibC9fsx1P9SmdSiKwnFoC3j0A5dJm2PaLSGCkmtRufjOhM
 RNcr1GkRhoI6hLRB+CA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfXwO08ezyURGOY
 qEGcUwU7KVzj3NVcMAoaM4d3c79ySIh/F0kPtaZUmY2eF5kgjYj6L9Khiw/GkjOnp+GoWPwpYnf
 x1MOj9Qss2wPV7mAa76UgqdOu39cNu4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010216
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115784-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C32346F1706

This patch series enables SDHC ICE, RNG and QCE support on Shikra,
aligned with how similar support is modeled on other Qualcomm platforms.

These DT and dt-bindings updates were previously posted as three
separate series. Based on review feedback, they are grouped here as one
crypto-focused series.

Previous threads:
QCE: https://lore.kernel.org/lkml/20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com/
RNG: https://lore.kernel.org/lkml/20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com/
ICE: https://lore.kernel.org/lkml/20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com/

Prerequisite series:
- https://lore.kernel.org/all/20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com/
- https://lore.kernel.org/lkml/20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com/,

Validation:
- ICE: driver probe at boot
- QCE: kcapi tests and driver probe
- RNG: validated using rngutils
- DT: validated shikra-cqs-evk.dtb with dt_binding_check and CHECK_DTBS=y

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
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
      dt-bindings: dma: qcom,bam-dma: Increase iommus maxItems to seven
      arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes

 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 24 +++++++---
 .../devicetree/bindings/crypto/qcom,prng.yaml      |  1 +
 .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
 .../devicetree/bindings/dma/qcom,bam-dma.yaml      |  2 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 52 ++++++++++++++++++++++
 5 files changed, 73 insertions(+), 7 deletions(-)
---
base-commit: 9ac84344d36457c598806f7d8ed1369a8b0c5c45
change-id: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5
prerequisite-message-id: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-message-id: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
prerequisite-patch-id: 0118397958b85e4297b47d6553ba4bf5b84024bb
prerequisite-patch-id: b6724798e8b73fb2182d11bda2a7aaa58976c7ea
prerequisite-patch-id: 4101033ee8eb0bc79c8dbc4a6c636cd527bf3bd0

Best regards,
--  
Kuldeep Singh <kuldsing@qti.qualcomm.com>


