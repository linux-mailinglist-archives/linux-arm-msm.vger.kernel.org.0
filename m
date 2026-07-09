Return-Path: <linux-arm-msm+bounces-118003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YzWxB96gT2pGlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:23:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1690073186D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:23:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c4Em7PYk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Rgn90CP+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118003-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118003-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 863F2300CF28
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB11B29B8D3;
	Thu,  9 Jul 2026 13:21:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FA82980A8
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:21:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603291; cv=none; b=nhp4p0KP4zexe/qXHc/kiz+406NhllH58Gg9NebzMOZ2uzs/xBl/5DrsbMJnGBls0uUpLk55kDJZfbO1NIYy9s8yj4R95zchn/p+NRTHH4+5AKlYkyl7mcrrz626pCFsgmgh2XyK7+aNdr4D4Gepjp4c5j30sYS9WuYWf+nqfaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603291; c=relaxed/simple;
	bh=iw4jjypV807T2+O0iXHkb4zhYfmqDqtmQaJO5VIoqXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=drgJ1Hq12avnbpaFu7W/mpyixKJ2hI2bKJsJtsPoATJlNEznlDu9CzjQDbumDWDxitaaR9Wi2YnuBv5Qyenx6WcMjq3lVecoA9CJ2sbII9Q+OlBesL9HDfrcH1xWUk5hX7Wgldo98hJXCj6KC/JVzBJdHTwXNAuIU5p+u0JM31E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4Em7PYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rgn90CP+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNNCi1628519
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SkRKCItPG6p
	H7Nu6ompVZXjE+N3XFi/uKmpyY3y+45s=; b=c4Em7PYkhQpAuMaHL831E4QLX2v
	B3KxB9AIzYug9T7ih9gERGfKNaG7a1kJlipNDM9W9qovDwiwHOBM6JsiT+wHiI2L
	LVgoxFS53k89e2V9oFBK7vfE70vZP8jT+PQU9bO0xcD3sUaN7Kg1bzVIlB9ZNQW8
	54cvuwRmx+0DfinztKkIxSMLHHCP+EZX5DRGaxvH5a0D0DW1K9yGM8JCGGDll3Fa
	+O/z7PmeQ4+Vu6GG4dB88+gzoqZT8+Sin0/BaYeyrvZcTH45/b68Uis3TRSAG5OX
	ChPIOQHltlWW79RdTR6pcJZnjOwGkx3Uu5Z+Cnrd4IPFCpbcPWPz6KyORmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvuum1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:21:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e695a3b28so107421285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603288; x=1784208088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkRKCItPG6pH7Nu6ompVZXjE+N3XFi/uKmpyY3y+45s=;
        b=Rgn90CP+fNr9HHRzIi+kkglSseV9TtrWFuKCtfAZRkzEhfMUbA0Xw40AUpLrKAateF
         rxyBg5sS+7PFZIPJspULvAR1ky5VUTT2B0TVnilQK1Aus9vBklJSUFJS7Nenbg2cZA2b
         AvQkYONPh5jpGTtaTGVdQQYKHfi+1MzcDy4qsW98QFQVAs24fLYMyDiaZaAsjkJYji7o
         WyKFJxpoRNBSPFEc5N56YyvvXGcdCjHCGGzD0H9ku40ZkFCVXrZ3EVBkWkZZswuxmmRE
         LTdU1aZYs1E+QzV0LAXZDv/GKnaP9HJZCrxUbsg76YkKizXa7TYrf1FFIU9siTfkQdCB
         U4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603288; x=1784208088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SkRKCItPG6pH7Nu6ompVZXjE+N3XFi/uKmpyY3y+45s=;
        b=P+WajFd1usIOcr0o9vK8uODZe/fsqx5HWrcKkU0d2JpjhB4Yk7KfWySGQdElgQMfBF
         zKSUd4zmnaCqE0fPuK4u4bH+3wFJOuV246oIQi/6JJRgsfC6Yf+8B0kkkkouDXSW042s
         9Jd+qWvtNDTgLIZXuhGhy6vDitCk77lD/VEKoK30BBCyd+Ymi+bt7oudi2sszDku5TaM
         UC09qVMkMduB1ScSDJ22+jtyHOfcWXO5E2RZndPOfna2Fea+f54fSqQoCS112kjSq1bO
         UHl2okhmk+w8mPJ/PkuLbk8AAjOD417frxn+ejjjYp3UStx/tNvbiY2XT5+KYEIemVa3
         NlSw==
X-Forwarded-Encrypted: i=1; AHgh+RoNXYC1tnBPAP69ddXQ0jHKY3I6e7vFZrV7eXO9Gc09M7XqAUoBEtZpOgKdRTOturMV/tEvoXIt2cWSSSpH@vger.kernel.org
X-Gm-Message-State: AOJu0YxKY6JgnvzgyHO5+wS/NIH5+kCMfbAlZ0PeGIjiv2ApxEkljxFh
	LI4p7NtEiY5jLPEGvYhZseNxiG3Vpo0doiVp4sToL+kUDymd+1hSH5lup3U2GCOCU37ia9AxAq+
	VsaU88pXmqpmVsw6ql/+9E6J0rE9oWk/0TJ2i9XJDGZ7C2WYTikXXkE9lz/r2IlFnUyxS
X-Gm-Gg: AfdE7cllb87q1ZMTF2470kmvh6a2IWhFFfff6B39gqj7v1vD3963jFtUXRmlpa23z/X
	m7ilQfNisDqEwLVlED5TaRZgARGoxBEmtSx1zLVctLWbPpAN89K4jCH6kGRvfSF24xxB0aYR/Va
	fhylNKIP3PwZQ5B9TwGlUl6W7jG3WntU9Zcy1dkdZfN8McpvpVxtCgHDRMeprPGUvxtiQ6nD1Rk
	idjyWqHKj3F1b8ruglybzxcD0cWTICgB4ELHHbv5HscAEzEiu0twDrTHT/Mgsshj+Hi0h97IFTY
	Mo9dhOJQfD4Z37kYye+5RMxCe9oxq/2xvvD5Sd1y1YFoslqvvyZkI7VxtXDeMCFXNyCT2FKNeNS
	V2h6dvfhjTKEiAWDA4lSCJbV6QnB8/HNjvRYvtbTLWQ1caaOOGrmJv9vcNpaz/FuJhPZKmpU=
X-Received: by 2002:a05:620a:4043:b0:925:dce9:4773 with SMTP id af79cd13be357-92edac553e4mr322541385a.35.1783603288123;
        Thu, 09 Jul 2026 06:21:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4043:b0:925:dce9:4773 with SMTP id af79cd13be357-92edac553e4mr322536685a.35.1783603287682;
        Thu, 09 Jul 2026 06:21:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ce5126sm1654976385a.41.2026.07.09.06.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:21:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 6/7] dt-bindings: arm: qcom: Document Nord IQ10 RRD board
Date: Thu,  9 Jul 2026 21:20:12 +0800
Message-ID: <20260709132013.4096850-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfXzzKGFf9NWpiI
 v/cOurws5OWqmr1Obh+QmNaYtlq5O1W6BBELvyXsKkhHd4SZrSo/Ogsr/ZVqDimlPAcneun81m1
 BRKcSv3pxmxF/qpHs9DM9a/9zs0Zhhw=
X-Proofpoint-GUID: NsE5TIZBtCF2Wl8txsrHc-1FdLRE6aFe
X-Proofpoint-ORIG-GUID: NsE5TIZBtCF2Wl8txsrHc-1FdLRE6aFe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX2kSKAhmbIywG
 oEDx1Pm+IapCTFlm8gpss9t2oz/6LgzIDIhTQ/yiRu+0+TRlASwDROCJCxHZ0FHkYa+Se5j1J+X
 G78im0LVaMy7Ueh/GhlBIOR/8kL0rLkqK4EEIKyqTcCTIUoqYYSHjZmzjU+GQHolpEx32WyO4f8
 prxd1KI4VGIQMW+up8kDWUY4Eo2fSqWDV0XGJKuxQZNQARUyn3f9tpLP4Dz5S8pMPfVEki8BxD9
 XVUF8V+TMXXnzrWKEIemLwL+GSzObu4Hqb7HWyTzYBYRhyKu9YvhCJVrEsGPwE0UZ1MRnOko/kH
 7gJlEtgnoI/jR7vM2lXCiPzT0uEADDM0SdYEqnRzFjx4S5SGNUTobNFLV5RVg1ElzEGTjvISOFm
 KrYCqXmkXl+Su1CLLV3qt0yqwE0C/8J7g0TOYsGhdhj6dTNt0ve6SgTrf/94cOdEOwDaNFn7Exo
 Bp0JTph1nIKa2umNnaw==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4fa058 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=iL1qmE2IHoXjD_DZLx0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118003-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1690073186D

Qualcomm Dragonwing IQ10 Robotics Reference Design (RRD) board is built
on Nord Embedded variant. Document the board.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a7e8dc994b35..3dada073a992 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -391,6 +391,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,iq10-rrd
               - qcom,sa8797p-ride
           - const: qcom,nord
 
-- 
2.43.0


