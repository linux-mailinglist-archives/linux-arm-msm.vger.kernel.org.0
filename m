Return-Path: <linux-arm-msm+bounces-107273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDw4LCNrBGprIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:14:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2EE532E32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89E4E3126840
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F136402BA8;
	Wed, 13 May 2026 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="duMB3yix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjNS9Lo0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF99402B88
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778674213; cv=none; b=K5VQ8zyAunOIpXpNIFFrPPKVO4dSt+JPt5uw27IHmRKet9DACwFreK8UaXx2nYFHBPrrHJBL3f+f1Tei4FGjd/GY6EIfeqmF99HH5iwzcV+iFwZQX+p2E/14SOXvKnx4Ikt9D/7E4kafpOuSo0fdWyQVOVzoREKM6p41SLTyy1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778674213; c=relaxed/simple;
	bh=BxcFsJDDPMfPmeMRzH5u4RozaCkDIL9K7l+mYCQe0ic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p1bnt1RBdrEpwb3mj0jMSQlqe7EZOXu/OSJsxB4wpDPq4Uj0ez3aN5MVVM9k2Opp3K7VDiK3QsxzZQRnjlowafFqK2hdGK7F9b2zRO8qogcr9sR39zAXChfQy5GSVGbQ+QQ9x57uXC00VndppfxCkzRHo9wzxw69s3PWotGPNl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=duMB3yix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjNS9Lo0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rw1J4084166
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u5/wQQP6k7HnfbIPp4SiMU
	w0/4CEYgu6rOXikREoOQM=; b=duMB3yix8/y0I9BjvScr+Cmt2e53BzUTkAac4+
	gPF0B+bRD26RcEkWCKd7hUQgFytfUNXNOkf8gMqdj3YvsDvOEVikdJ1g2FI7enwY
	3hajCAiNCIwxiObwXEbZ+pJOpMky2zYT4E6jXI6uono8WbpKBDqAlcQH4K+eMHI2
	CPnuCokG/ROMvkbrMntSluvj8VtC1plDlOi5CDSflw60m9gO4o+kNwyG+sLJqF+9
	dp6f8RZYXPOuyqn/fJT7xdnCbZZrM2Fb3n4pTLxyGy+2Tc7hPFy35fDWcXtMjI2O
	mUnMMgoQBsGlK9eYBvWpLfHtb0oxdQ91wg9YGOL2UiecwBsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e0pvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:10:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514d2b22e7fso42629061cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778674207; x=1779279007; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u5/wQQP6k7HnfbIPp4SiMUw0/4CEYgu6rOXikREoOQM=;
        b=WjNS9Lo0I9E3DhRnXyludca1FnGWn1AwJ34ErROlqatNYvoIPqSFM7BN87FLy9UUCI
         VoN6eDDwFhw7E1ZXM1Ltclrkt6LngY5xKLtND42iv6u78EBQ8CtfqLHsbB50ucj/UVJQ
         jACuglapoWxKWB6LSJFqrFCTIriHCHdvQoLfjiSpG/jvikXoPTJVC4wrmuXLI+nFhc9B
         jgpExszKSmRyG74sqvUMODAf40IUm28FBde058ECKVilNOdt1CQhPb3iARz19kOolVGC
         QIIPRPkrptDNiQRpgfw2YnIjCUkhbLpmG9z5tejWNaO22HbQTZEDVl/mHM4vhCg5OQZg
         hzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778674207; x=1779279007;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5/wQQP6k7HnfbIPp4SiMUw0/4CEYgu6rOXikREoOQM=;
        b=hOAcdhrNst19VfZ2uAhzKwt+qsp51sOpVfPmh9vbtMc1pxzU4oBukdBmjnH8Uo9gaz
         7SsWsJKykKoCQeHAjmydufH4TevV9zkQOBWRf/+1xmHoq8nsRh0utFX0V7OVvVBwD+gm
         Ib970GZbnUNs+aIzcMlAMF8v8q4mRJ0wcWp89TI+Vd3yaqoMDmOfrDmrZ8wisNdgjrdn
         SaDeYsC8yz1ctu+zux8KfuomD6ObLUTNTUjecNmF8bLlrb+Tj7CBQkIkTJlgDPDetMJK
         yIMpyhqY8jyuy6ZA8e87ht2fhzznoVhMPnI3fS8X9s9HUi2vB3ad40WEir152WaT0rw3
         n/mw==
X-Gm-Message-State: AOJu0Yz5w4oAdGLO8mjjBj/ad0dWha1hfvYRrgh88XYEpN/loqfl9yoV
	+qo2nLVLudM8Ldacrx64igI3jYD31HFU6sYn6arBuhdpGqVpPl5qZeKoexwXxhHAszQgPhrUjB8
	d9raC4SbN4s3lyWW5hrL4Wc28OsZgbFr2tEz8NoYVCCunwsllYLBpDkjGqMLBbjubHMuoO6oZA3
	S2
X-Gm-Gg: Acq92OHBA+GzrB46XH40AyQyAsjtWL+HgZydvKevT48w41ZJ+/zEvPYAAtxXkKzCIs8
	3dzPjP1evr6PmzeD4diewtYGxDvGQcisrB90z9NqOt3S3bWQMWqRUxTtmVG8+O+sxNSyQKANPpw
	AjHQeSXcbwtlbv1LNHDHJpymJ3glElFZIFzn8ovoiiixlEu+Fq/ApUsYzvCKL2gEFjX1MsxRpQr
	s4Sn/+swThSm2O4OxHcttf11WadfRVkD2Rq84ZBJePZos+jfAitODAfonvXvh8GG9y0HwtXbM54
	n7Er9FHKJZauQ2QLv06fC/dFKuYxVnNBrSIPOczEfCsbRDOqYCIl5W3rpF3FDyYaemXVzjpGpKy
	xbUINSsEnlZDtq9nZ09DWAalkr4QREg==
X-Received: by 2002:a05:622a:5807:b0:50d:8b23:4948 with SMTP id d75a77b69052e-5162f5f8d28mr36819031cf.46.1778674205965;
        Wed, 13 May 2026 05:10:05 -0700 (PDT)
X-Received: by 2002:a05:622a:5807:b0:50d:8b23:4948 with SMTP id d75a77b69052e-5162f5f8d28mr36818321cf.46.1778674205404;
        Wed, 13 May 2026 05:10:05 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454917d57aesm40691056f8f.26.2026.05.13.05.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:10:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:10:02 +0300
Subject: [PATCH] dt-bindings: dma: qcom,gpi: Document the Eliza GPI DMA
 engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza-gpi-dma-v1-1-d8e37f026c36@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABlqBGoC/yXMyw5AMBBA0V+RWZukrVf4FbEoBiNeaREh/l2xP
 It7L7BkmCxk3gWGdrY8Tw7S96Dq9NQScu0MSqhYRDJAGvjU2C6M9agxLqMglCqRjUjBNYuhho/
 vlxe/7Vb2VK3vBO77Af3QyZZxAAAA
X-Change-ID: 20260513-eliza-gpi-dma-6b5341271f09
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=BxcFsJDDPMfPmeMRzH5u4RozaCkDIL9K7l+mYCQe0ic=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBGoa+FCgBaWjPT/DOS5ogvV6nNkvqWoZhwpSD
 k8IbVf9b8GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagRqGgAKCRAbX0TJAJUV
 Vs1lD/9M2L2ek/DdKbXZWa1dKlsqMJAn2hymT0TFPTMIMBEpMMdlH1gzK2P2SwOnZDxbYNi8Nb8
 i/60vNTPiAbQ7MH0RYCvIimdwG1ihd0V3VUPmTl8ou9EYnVwgspwhPOd1avpelt/LuqEyouimtj
 D//nW7kWnRXYecC1oEqXdZuDAq2cK/v0Bnw3kybNh8Fd39cB8W2UP7JzIFIAfV3FdXJb9SZe2rw
 RyTxQnhxNvn7bnpLnm+P4da2EnlhhTA0FXpoJKhYXnx3sc69tJpEpWMtJTJ3uG5i1kkdCDQXoVz
 aN/y/fWrSvVWOBspjqp9bvlvrdPJM4Y0uMJ5wpNoa1Q0g2k1WfsV2yaZemtcLgOyZVX9GBL6PhZ
 y0uvMBriao4Z+SlKrmoOGil+yF8jDcacCfloE1g+BrnOWbDco0oE7CjzPkmDydYWYmeALguRZxI
 q9OJz7adwE8Z4Z6W18+2OAziB8ui9ZV55yHt6drTFPzZqyx45ICXWom1K2FGNmpNirJdLB1Iemp
 whKZg5Gs6M5UXpbTe+scKWunJGNLlqOzZ1RV7sAe18NDgMFy4vTcJSFAd0kkrag2QuVNc95J3i3
 EoLM08dcc18eoqP7M21szfqI7iUgK3Fqc8K7RZ5WxvxPyjJGQL8FrtDxN5rPSYaegcjFc1weiBF
 f+gTvvYvZXAN30Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Q3iUU31drqR1Tyba1zcGCOzBosdsjysC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEyNiBTYWx0ZWRfXwzOOitCj7A+x
 VylgwMs3vcLqNC6ey3kMu7OzwcX6YdbGBSLXj7pNw+AL2kBLkuovt+/MsAbp+wKY2tU283lVkmG
 kJgM9B+QO/i8e3TW8D6iXO8WRraCGkrn/6oMKXLQNHn8Lhpjm31xoBY+6Qs+4bJGDmZSXyxmqNQ
 E2wmO6Oi/zIxtcp1pwvcBIP2lLjC9FrBrk7aiV2MuQ3W6dnIENB7PjQyM5SuRyYku5GN4sCTwwL
 zAYsibHQzeUZHTFz5yANxPeJvrqermlmh/cFz5anILruOlMQT25TduU10rnf8zymQPuNrgDW9VS
 JsbH2jRa7EluoLLeKPHzUZpvYEO80JHwIKl41ZjAPvM5zPQZJ3O+Z5GEhM5cL066HzRBK1l1NvD
 hX6YrcwiXw77NmIUarDiTNjZAd5c8GZsfzFnfKN0NgGgkRqBTVGiR9qBkWs2Tuhp7XCzlhMpY9K
 3HK0bKaEwucyOGfp0sg==
X-Proofpoint-GUID: Q3iUU31drqR1Tyba1zcGCOzBosdsjysC
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a046a1f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CCA8mRsehYleCwTCPhcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130126
X-Rspamd-Queue-Id: 0A2EE532E32
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107273-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the GPI DMA engine on the Eliza SoC.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index fde1df035ad1..d40b0a8dc9e8 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm6350-gpi-dma
       - items:
           - enum:
+              - qcom,eliza-gpi-dma
               - qcom,glymur-gpi-dma
               - qcom,kaanapali-gpi-dma
               - qcom,milos-gpi-dma

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-eliza-gpi-dma-6b5341271f09

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


