Return-Path: <linux-arm-msm+bounces-104584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O5GIou67mnqxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:23:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8CC46BE2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91FCB300A12F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3810F2236EB;
	Mon, 27 Apr 2026 01:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvAezRej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UyosXoNi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AC11F192E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777253001; cv=none; b=Cn0L0fP+KJKqKln9zmVyjZ0T9Or2sx6d87G0MXUkQMym1INwIKVZgufPbew+kpCxPnhgX3O56LXgi2Y2aF6R62a2sPJvNmFWILP81+i3/iywW4nIo03z/yUnB2F0pOVmhq9FEgGM3FsckgL3lAdkb7fWu61Ckk++STHOYTO2FkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777253001; c=relaxed/simple;
	bh=RwUlsANaBFXtku4Hox77+wBjC6p9hBm/pNBdSarue+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f5tvBR56sZwDD0s/LvpPLAOt8y0dx6vfVEEJ+6i08P/1M0cS9W4pIzuJ96q19SYC5Ocfn2RutogN174YrqcIS8625pdhpNeMbgbyYzjPDdyY2RjFcebMmyu6e0gclsO7wn07MJPJl9XLFs1uKacHELyq70eCDtEvVo7UYg8YgeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvAezRej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UyosXoNi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKrAu81437632
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=M9VKi5gQKjWc8ADbuosgGzXfdXz2HHxk6n6
	LzkIjytA=; b=XvAezRejzCv62VbmCX6IMqEFoxa7F/x+oMdrAHJ4D5wnQaeta8U
	rFnF3eg1+x97kNk7QEggmO+TvWPDw9JEZc1IW5WxaXVFsB1LJ28GHFNu2P6oNM3b
	edWpUtwBtcPGRNwa1u3fyz1ECDT6gveXvfzA1AtK2/5Jc6v5tAcNBr33CprfamTy
	0vhcTOcihNBobYAAIVgwai8w30E/Kz/zeBsKkYuEqAD2flQwANFXZb6U1sGmlf/B
	UJwLx2BLshLZpZ+vv+BMRzZ8gFawFfFCa3lcbIYMFMBi7m7yeOCsmgF/3jf/u+7X
	XmqIUmjo6+2KRkr64aOMjQhu6Waf4wRcfPw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf3vhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:23:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so13341001eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252998; x=1777857798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9VKi5gQKjWc8ADbuosgGzXfdXz2HHxk6n6LzkIjytA=;
        b=UyosXoNiMBMNRipRl+t+ELTrCWeaBSsv6Gdk3NPCTJgc7Xk3hy20bh4fkmXcXBrHEy
         C/0/wZdL5CVRIkrD34UGVkGgcjptNT1tt07Ry4EUCZbCgLm7gVrzQRJFV5CBjK+hhCqN
         31xpvcFBAzC+H8Oe0c1PBp21N4AGby9qRKrDr+q6T1HiF+yWSTyjDZRO0CWk8RJeLcPr
         65r3+5h7PP70aGMrjKv/s1yUtPMERcvT7+629L1lSnAwBNeVkv1tIqwquvT0JdZWm66k
         WWtSQEC059wupJaDqcugVX2yW7mngCRb2ISJ+4k9gcP7LAHAfKa4m6CsMIvsg6rPm0in
         wUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252998; x=1777857798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9VKi5gQKjWc8ADbuosgGzXfdXz2HHxk6n6LzkIjytA=;
        b=GRfdgS5A6L4bDBlpu5z8+MVIO0b8KrMa9xIN6PVMxXu/AvKKUNI7w410MkD6jC0K3e
         urUpJKTQckGPHTNvYvrPOjkomiUByOH2AzdH1Lmnq1gISsJpVQQ5g1kkvWlrvFcUq+or
         wovsgx5B5rwOB/+AS3hSUhhM+JZUw0DZ7RC3B9UOKIDIXJhhILophs2pzC+JWXzALHWV
         hZMMcn1qjnh80YJA8stTu8AoF+ns8g3vDzPiz8jOv9NYxFv/0MzRhubuSCbIt0U08p0V
         LfjWhUFYJ9H0izPV7GGe9yAFVTXZBWTTwMP7+uPj4ulI2yRH3wkoy4EntpfKNrGGaIef
         76UQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Mt0f0w7Uxr73U0HYtoZDqiD8h2kFqSlMoxxyq6+1rCNamqgZ8iGNs/BrqLaJkjK5OtVJz1H8YiMF5hxba@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7kdVprrjcpzsWNhzJB0x/qpF3leh41cctZq7BmtW97X9Ka48T
	IrbDrd+9Ju+bRXVwhtL/ixaFURhG/I80m7xwoJPXmwELTqV4dePDKDonek7I/JIL1MS93Yp5AAL
	HdbfpHWl5CfWp2AOflvuySfkRQOSlsULoi9tZdM6CzKRD8eiQyTQya8cGwJH3GClnM50V
X-Gm-Gg: AeBDieuD13qRmKgPl+MOPfAOcpSrLow3HxVFVxHApPc9bZA3Q9ba5+JRg4hWNe2WRHk
	yM6fR9uptP14x09q51sjzE7qWvKh7fZ5Cj0h0eVe7o+t3UIZdX9IfLhnouPd74BMTQTzNwICVFp
	iUHeZJG95W/E5xfzGVPQc9SW5jcw2nwrwllNbDVDBIxx/kvKa6MHAt98TZw4Mw1oCI5+8GtIMb+
	2cKBa5QMTF+vRtLwYOq83gHqd0yPSSwNTcUWqx2gafn4bmHCEF28gOm9GaNDWGUyciGuXdWVuql
	xcnRltvznmWoFvi454Vq8aZpelRGatZwXAO2bDCEwkWUW/2Dz3fvMwTcjpyiycrp4W8mxjXOgHU
	eW7H6q0gp5cOZA+ADy6QaY/UiGzlNhMZUyYdpGjJUqOIQvIXMwHLosACkNcD5p2cbEtijdTNU+w
	ICp/baU+oYxXzNLYE0
X-Received: by 2002:a05:7300:fb91:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2e464ea4fa6mr19533490eec.4.1777252997851;
        Sun, 26 Apr 2026 18:23:17 -0700 (PDT)
X-Received: by 2002:a05:7300:fb91:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2e464ea4fa6mr19533471eec.4.1777252997342;
        Sun, 26 Apr 2026 18:23:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2ce98csm40117714eec.20.2026.04.26.18.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:23:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: crypto: qcom,prng: Document TRNG on Nord SoC
Date: Mon, 27 Apr 2026 09:23:08 +0800
Message-ID: <20260427012308.231350-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Z4U5l7fSkA11OGqVQn0ZY1tMobA2NDLP
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69eeba86 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XbqZqKjfuBx2QgKHZ0cA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Z4U5l7fSkA11OGqVQn0ZY1tMobA2NDLP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMiBTYWx0ZWRfX2chmb4ydc8Pr
 3jp+s8jaHcDMv2X2bEX35t/xGBWPiIkSgUjSXX1bNx+B/mkkK9VcewuUep5oRAAwbm9CIaXdzvr
 21qLA9NplFBDuXBdB1g/jvWFnqfDpWAvCgBlKqrNwpYJ4/EgXBMjF4k0FvZYE/Aj0dZPqLEND/I
 Mb24x4pRTw3ODyhoP9gAAGSUbOX8ROM2FB1IMOxeJtip1a18pAz0tfpqOOCCgaRcVt5Qfo7/SGF
 sULSco7e/RNGb3aB7rXndoaot76jMlo8M/iIHCWm9r/VJUuoL/nbMMpuDB6Mrqc/31r0anER4VE
 LZbkwhpzB43bwWTA5TV93JW2NUY6xxBPg3KtzuxHxXP6vgKT1/8wGP5Ofa00VJbHUESZCCF4a4W
 LLT/PfNmn31u3dvph9I+k5uIhI12LoGXnYqiTn6n40rWz9P3S0IcEI1XchLb2fPK5UvljfO72dr
 Tp3MeEyS27PLY7lI/0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270012
X-Rspamd-Queue-Id: DD8CC46BE2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104584-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document True Random Number Generator on Qualcomm  Nord SoC which is
compatible with 'qcom,trng'.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Add missing SoB
 - Link to v1: https://lore.kernel.org/all/20260420025732.1240525-1-shengchao.guo@oss.qualcomm.com/

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


