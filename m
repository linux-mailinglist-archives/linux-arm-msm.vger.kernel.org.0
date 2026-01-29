Return-Path: <linux-arm-msm+bounces-91089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN47EMKmemnF8wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:16:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF479AA2E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 473803055E50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 00:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC18E749C;
	Thu, 29 Jan 2026 00:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDK1j6AZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bg0F+2BB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315974D8CE
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769645663; cv=none; b=WWg0orELyjFOYEBNfqrIbH5VzXw5rTgn3c9sSueuKsrtrc7xWc5rlk/ees/uR1/mzQmfsZSF18vUd888aYDfx9vFBewpWN9/QQqPV7lb01xcVLCrRDBx+ic61VPYzsi/XnIoI3Ky6O7jlueLigo7LsrMh11UCfbsjb1+kD5Q5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769645663; c=relaxed/simple;
	bh=McOFs17KMBE80Kx1yQ7dtWDsgmcWE2xvIe4QDqWpGkk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=caO5GLm7PacjcCG2NVIszj6+O0X4p6lt5kcckqRl9PbXIiFG93Pv7y/pg4k+PkOV6RSp3MsShQ+2BgXI6iv4Ek9sMic3+dWyXJR+etHNoL2LHdhXgIennUM9gC/69e3qoyYjj9dbj3qeCtoxrqOboAKflll/cYlVZ7z5cYLtnes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDK1j6AZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bg0F+2BB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SN49Y73249540
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bjsGqclSC5A
	+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=; b=lDK1j6AZAfcF+jPtTCC8DHVIBey
	oPUMg9iJ+feo3ZUUK5Y2q+4TMe20kg4C9h6iPAZY13621rQYAGNuUoloXm21EQzm
	oJXIfEIvNQJ6XB971/aXhmIEIyhm7F900QNUG8ZDSTrpun3kFPSxTKX/8dKqPydf
	9M0SK8xvaepfDt/aPGIR5hn5iwWcJeZ3qtI4BKH0tqDGUVYXgl6NWZXh2GEiRc9R
	86m5deWZ44jmUM/m2b3jgj9G9zsEy8LRIDYRefAK5L8elmmPM7tKW32sZ076SC3l
	IxO2dAKU5ZHp61jC7N6096+msNfhbsRqoR6NrlNexGHOsyHQqa9hE0bDF/w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk3erg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:14:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a79164b686so4579935ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769645660; x=1770250460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjsGqclSC5A+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=;
        b=Bg0F+2BByyWaF9tWwSYWBKOX6E/Bg2Y7j45IEwNKW7Php8XNDDBrXrCdii8l7S2tzG
         zP+dgGxvWxBaMxayyQF3oYVSNU18xTm09nYiouFVXj1xYefAJewIFVz8TCfads+UWjnw
         VdTnl2nJlSPuvVagdyoCVh2GfNwSje7Ahv6TOwjCDbvpq8mVyYbP5uCJmOQBwvI14RG7
         1YPPXtSm4Zj+eiOZ2VD4NPxReivFVlrB+Sa5h2CNho5L87/q8Wc/8nkNJv9KQMBTs+48
         CNhx5ErSxsmRE+YHaQkWdUR05Jb7vSAc/9lOCaf0biC/wqLwSGSR6b67erOtWRpGsXKA
         3esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769645660; x=1770250460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bjsGqclSC5A+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=;
        b=w+fm0t4cR+yafWfYv/rA6zgmOq2aqqKxr6QRYRLOKXqjp3kPBULogobatpM69pXl0m
         FpOg8/cvPxadHYuIRc+a56gWx3rye3XhVoxTOjwtVG0RbyEv28tb8StX5cn1+GSW84Ol
         upJhV2BmmbvaBHwQlzJak9UUXf6KeJz96o/ZLW44byf7YQArD/ORAG7vkX0eHDu/K4j5
         GFaOJXAHgWzrq6GaZ+8D0PfwxIKDQ+NFeigZJPRuy5llJQnwHmyi3cWpE4GdQ6ghYIKK
         E8NPJofvbmAPK6EqC3yHqS4YrLLA4W/oI65IPI+ZR3vqv+0ru2+ryHDk1pwB5pDz+5hT
         IMrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9AE2wZ9cpf+gj94Mxd/n0Qyr6NhqWG4HdnMpvYTLt0hWxKXoYrQqHFM7I0oD7ykxG56k9Q4X929s8v7dS@vger.kernel.org
X-Gm-Message-State: AOJu0YziDgp8jshhqJnwhqS+CQIRzdY3RY4Z99LvssvhijemxQje5AAF
	kYkPaF7wx56TPFcOVPknneGYezTMauOsYa+RHcLYniQUu6utMklWAiBr1YNY7UWS1a3gMk+sX+l
	2Y4Tpl1n8IhPl6PbBxvWeycjjbFOMC4ROHl4FgNsxYJpqahuCA6bP0JJ8h0N5o/6hYfmN
X-Gm-Gg: AZuq6aK+7ExfVbURv9HNdwfgo5RWtQqPzVRLRkGNqjUL67Bp4OqSJmu9UGjdoof6k4C
	XYXj2Bx5h8tu0POoGWZwT6cmbRvooapoUO06avY4iNeI7CaXkI26DEO0qi8ZW+1MYgzWA38v6v8
	YkaP8F0uMjDDdZ0F0EI0clneSQiwpzk1lcsXu2/cRBXlGZ1b4Q26ToCd3BkhYqfVMOws0aKUXAC
	RWM5iJTb2t6rtI4hZPvonzJBM2dEz4uhgo0vD3HKQc+DhjYfUJbt+KmpFBrS3EQfjgbC61Gwulo
	W7H7uy9z0d9zCv/PhVZQ3ziAZy9r2+9sL2xtvCm5nXbD1F3fABbb44b5fYuZZBkQoutDADSSUIG
	GG8Eu9pK5rIdaaV3JhRX1bP66RYGbc8pEeLsqoH1JFpT1ZFo2nhHvbtKSGEig4+Icj2DUndlRWC
	fBErax2Sy/Wh46jgkcJPhxwEqQ
X-Received: by 2002:a17:903:1585:b0:2a0:fb1c:144c with SMTP id d9443c01a7336-2a870d2a07dmr71197425ad.5.1769645659956;
        Wed, 28 Jan 2026 16:14:19 -0800 (PST)
X-Received: by 2002:a17:903:1585:b0:2a0:fb1c:144c with SMTP id d9443c01a7336-2a870d2a07dmr71197145ad.5.1769645659464;
        Wed, 28 Jan 2026 16:14:19 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b29sm32055845ad.54.2026.01.28.16.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:14:19 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH V3 3/5] dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
Date: Thu, 29 Jan 2026 05:43:56 +0530
Message-Id: <20260129001358.770053-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDIwMCBTYWx0ZWRfX5/foQx5DLzeT
 w9Q8YuxqpSVyiA7bVZLU7TCZQ5L72TZaEqkDN8on7KebcF2cNyoTH7QrPlk191KNrT3eAe+XXDb
 tB4LxYnNm2ixFn5d/0W4CTDZStpO2X4u/E87NTGspGyoU0m0LjlcfPGR/v+BEHj40IiFcqGsPG4
 +FEfSXn833foiriJwVcSYjukKJwnP0i/IktPCHeTYqz1S7ItJvxXY0FQCa/7Uq/MhyplN+XDzVR
 CfYu3VNDBGDxsYUYQPVFKsHAOG2umV8B+tCDluD8+KGsQIaROm9XW/heyYjwzpTPuFdJnoWIb0T
 h70KI0WB+0Lx4HNl0PYs1YsFiUf7OFrnhJXDcjWqn2Zapel0YkuD2G5mMG2kWO/mKz5eOC+scWn
 8vyllYuu84RMszd17eWoA18Ao2MpAXd6+mbooCbeemmZDonArImJhOe+RwWccA3c63RkvE4D2K6
 snGbRivS9wEOb4ECM1A==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=697aa65d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Eu9c2-cO-uz-pbzhnSkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: vL6GZvQUjkxB-VqXLmSP7ueWsLVD8dxT
X-Proofpoint-ORIG-GUID: vL6GZvQUjkxB-VqXLmSP7ueWsLVD8dxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280200
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91089-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF479AA2E4
X-Rspamd-Action: no action

Document compatible for Qualcomm Glymur fastrpc which is fully compatible
with Qualcomm Kaanapali fastrpc.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index d8e47db677cc..ca830dd06de2 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,9 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-fastrpc
-      - qcom,fastrpc
+    oneOf:
+      - enum:
+          - qcom,kaanapali-fastrpc
+          - qcom,fastrpc
+      - items:
+          - enum:
+              - qcom,glymur-fastrpc
+          - const: qcom,kaanapali-fastrpc
 
   label:
     enum:
-- 
2.34.1


