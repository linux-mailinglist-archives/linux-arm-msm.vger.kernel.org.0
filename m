Return-Path: <linux-arm-msm+bounces-102918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI5GHKu03GlVVgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:17:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBA43E9B43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 839343007B87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCBF3B2FC1;
	Mon, 13 Apr 2026 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5On11Il";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXqQ2nvv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF533B2FDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071826; cv=none; b=NJTj3FpGJYN6h7uOuROlgmTnGpyKBIBdJFMeohRp+19zlm9MpnFKE863vmPwQvtIued5dBo6/zOtxvZR0rPXTgRYX43ia2b3fsDWIDFzIU/qc4YYk5zAeetfXw0KTm/igBMmTLy6aCZ4wI2PPKoAmBQvL/4CVhrOb2+3tt98+1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071826; c=relaxed/simple;
	bh=lqq2IfHlkFH+xqMsu2m/xGebIN7BMnOm/EZR6HzHe0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXiCjgOiFtaYFPDxcAa9RXzysUFK8wW+dSecPd7nq3ayqV4oQNaG67qergudAIF9FmBF5I053LS3jCC/mX4aiN8EGN0YKCLEWvLK2LeCjbRkOgwNwoylSceiZm6/AY8k8VHCAFMXoLpIuhoyt8hwfU0mfEqfsKJdet+1OEauKck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5On11Il; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXqQ2nvv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5aPwT439818
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rtDg6wg+zXc
	8K3rv9TpWuQ9j/5nJjIGixceMJjhljqE=; b=h5On11IlkOUikTS7qiX7XptJwkr
	aazoPRWF4eu01m1SslcLMESAPQPtdI+x21KeTaLVIc/FqwQ/eaSIZaNHCziWVAda
	nsiD5ZxZtGbkVbDU7i8XRmv6AYbp1uMV7U3iI0DDoWeDrVzld0K0+luOhpq5ykmZ
	0aT5Ippo2vCvERHXtrAHUAATsfn2cjlS+cNYWTHfN91S8tuOPoEuHt61JNSLxs8R
	lp7VaTVUrdv/hwiVUZ8duSHdjue3ZTOF3LIerUtI54KC/hDxLZoQh6l46hYOzUo3
	gnEah2uRWoBD+WSEiVBKJllUZt6KGmKVGT2v2U9QoxAOMYEP4mGdt23HIMg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtmnpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:17:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso5907487eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 02:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071823; x=1776676623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtDg6wg+zXc8K3rv9TpWuQ9j/5nJjIGixceMJjhljqE=;
        b=SXqQ2nvv120yCDiDl2tRUWVd1zK+7Nx7nObRyjzBGJ23w9z+s6UpTib/DYy8LFS1xP
         V5xia9XkLQZfSL6WcZA9yhLPrVMeSM40S3r2dgtb9Xf0Gn/74dORLqufi1HLICCJz2aX
         Zu4f1AqzW4+bPxAvEVl10wXyzi0s8a6zVp74n8yh2EaO5nQraqQGdQRyQ7DwGMoj87Zg
         /AMdltd+PQQHl9Bjr74vnkw4Oggm7PL9K9Lt5mVI1X6ob/bNA8NbmCjIpjEpaoZEratQ
         cjvO94PpxgJ8xXvxdmHa8pWpGZ6o4leqv8BSh+WKisAwrWAJB1dmIq6H0ndnFWxRyuHP
         r+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071823; x=1776676623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rtDg6wg+zXc8K3rv9TpWuQ9j/5nJjIGixceMJjhljqE=;
        b=g8/H/Sax522nzIlf+Svtmhp4QzGwnxskSrX6pjef8ET4vY4LvCUjSlOJv3/wrryNQA
         Z+ji4/IxKsSX+kpnEzFWBZaiwADZgVYSefGDkUZldiF48VOb8Ihjw1AIIpg4Swg+a1pC
         nOT5/Dh3pA0dA3i2/4cF8jZixaVVeyF2T6cb4InZIxGrxdJuoJKTJm+y+4pDXm2N1EhE
         4geJ7iOpZu3XIp7JY03dK+rAymPljJE+DgTXGRHWmUbN6dinsSMcyKqc+leNmV2o81Ak
         jzcDPbSrjSZ6PBTU/q5AZ7+/mDMhVxXXogqi54xT8cbR+8bhIMaVndoeo8TNjGUamOK2
         wiQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iK1HHOqh6SaUlsxkp95qf+rRtrmIVOksTqWBwUQKD/zGg6vYV2P+KPknACt0ow2OtQdL1uekHuQIKQVSA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7I/2Ly/MRB13ZnoVUt3Q8CfUhmZzL/R/7eRve6a7KFBR1xQq6
	GgnMXP9XrBdAvcP/CATzCt/26Qq46AvZkDNoWY24jPP+8bgzNgsn8YaTi5cMUSrrSplDoltINa5
	kz6hyGAu6KYSDBgG9USFPoquNmDeDsjIZlmsb2Z4knU2kmiLzZQuVnhnm9d41dPmTqVRS
X-Gm-Gg: AeBDieuJSrWG24Xe8KCWK0iy7pmVGT9csCTISxCmlmvxZD2TXyg9ZU+gq7/V32fP/EJ
	5XHciqq4g8BI5uyuFPpY410roOLvwyEU5RNuLEm+PjZUIn6RGkYvQcGtdXcyw6r3sPP+GWP+TPS
	CF2oAbfjQfKUpNSpoOVy7Z5g1XDFlqq83DSBpJ3TIjaF7WOprGqfR1HH80dZFX2YCwEF+MOu8Rx
	LM9d3ayjuiXDk0Cx320Y27MOOzHc0NllyqVzIe+QFYtlEq+z/3sca4mvfCrJw+lWAYqW+QTbwQ0
	iWM4dexBow4uI8cw7Zt+ONfKFB5d+ftPgNlMjdjkrwIQZ6TkabEMrXVfliaPlv75asNm+c+N6aF
	4J0rZ/jRej2FfybbLiJKm7fWjmbj9f5cfGO0D/jUfDdHYtL0S5EZzjMNNpQ0QuuiWAtVZiIv+x+
	xzztq6hA==
X-Received: by 2002:a05:7300:1489:b0:2d9:9f55:25c8 with SMTP id 5a478bee46e88-2d99f5527d7mr1048990eec.0.1776071822750;
        Mon, 13 Apr 2026 02:17:02 -0700 (PDT)
X-Received: by 2002:a05:7300:1489:b0:2d9:9f55:25c8 with SMTP id 5a478bee46e88-2d99f5527d7mr1048971eec.0.1776071822244;
        Mon, 13 Apr 2026 02:17:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa571csm18349212eec.10.2026.04.13.02.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:17:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Date: Mon, 13 Apr 2026 17:16:25 +0800
Message-ID: <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dcb48f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=qjHcU3mlnP7Z_ZZz7yIA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: VAKdCyjkvNvcBdwZ06gJ8FOW93-_4DXU
X-Proofpoint-ORIG-GUID: VAKdCyjkvNvcBdwZ06gJ8FOW93-_4DXU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5MCBTYWx0ZWRfX/0NnTE96ziC/
 Sb7TMFn7GE+Y60NjU6cTwJ2wQXFSXx27tluYIfQS2KqZg7zLxk/Z/vl9SU5UbPd8L14AQ7j1+c/
 CvMfsGYpKtIiCoeJdJi7+ls+dr56W/NrFj6izA5TQRME/D3eC8hDj3SAkP4ogThlNAk1vL4SEij
 YL7ajd6dLx8vSvUBpMhmQ9/NjJk36TVBv43dEjz6dDNB4V3wagzKS5uCZFp5ukYgXvI0VqW6kXl
 sHpof3gSxTKR7I4Q6YNvsfTwXvtYM6IP5e4OV9h/2JYBq6COYj03+Ea0PCbZK/rc1tAZHbEH3p1
 wbvEwtB1PaliSqR8q58SelPEp8wIm3ik0tBpcLETpaG0cFCMUhUxaQRRPStGixPjbqnFAtZQHIq
 2lvSBnLSGVBwQVwSziZZEXMAl7sp7jUHSGOBBSZWMV+P4eWqzAZEDSZ7Fypcz2dOGj1Iv3VsXgk
 ymtpAbzVeqSOf8MJPSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130090
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102918-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DBA43E9B43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm Oryon 1-5 is found on Nord SoC.  Add compatible for it.

  $ cat /proc/cpuinfo
  ...
  CPU implementer : 0x51
  CPU architecture: 8
  CPU variant     : 0x5
  CPU part        : 0x001
  CPU revision    : 4

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5f5ff5e51e51..5be89c584026 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -223,6 +223,7 @@ properties:
           - qcom,oryon-1-2
           - qcom,oryon-1-3
           - qcom,oryon-1-4
+          - qcom,oryon-1-5
           - qcom,oryon-2-1
           - qcom,oryon-2-2
           - qcom,oryon-2-3
-- 
2.43.0


