Return-Path: <linux-arm-msm+bounces-102941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGqCIR3Y3GmcWQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:48:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E9C3EB80E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88A87300C306
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACA3387358;
	Mon, 13 Apr 2026 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+6qnwHh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWdLdtPV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDE132570D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080917; cv=none; b=TzWfcz9b/iaFjni6dYLvqawWzc0dpDm7zaCAxbwXHFS47Ld6dyu/LesF9FIeB5Hu3GoCeEKBVxROnj8sIy816aOnAn6h0gLNv66kco53a7uhJC1egmqC3gKpRiIzoJg+yCQcReg9JDhch1Lub8AAfJ1by3QPcQmVW++t6RTROvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080917; c=relaxed/simple;
	bh=3Xxy3phe35nld0d+I8ihN3Dz4LJeVPMdaQsjUmjwBFM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZH2q0APF7ZJtrZcyy/k0/gmbocuMvs7+DvW+AeYeQXCe/K2cvGg4kEIRd5+gnI1ItBIw5KVe9OGN9bYtiyGhZiFY6DKLZmBeQIgz/oJoVM+37MXa4+0B6HAd67f4IEAyoFTTSNig05NGkeVIE59OcnnrWIonTOCzRPbEiyH+DaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+6qnwHh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWdLdtPV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DBY1eK531178
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mbUyzb2hgUR
	R49pOk/6k47H04jOC2pBiHnt3w2EMRMM=; b=e+6qnwHhHHk8iZbg6lY4iyrlhj6
	G2TkpMf35C1EutOoZJ+vLKBb3WBK/iqleaho3vhpfZYWDxzLWtbgsom+NhrI9I6M
	iSBzaJpY2QBbkON+KGPlK2ZymP0RPeQ9YmML9hdGMvWp1zbCTEEdZPdOtysldUzm
	RHSt8lI/74tPC5iS4Cwuduns5CJtMTYHHrsWXvu28gQmpK/6ODnMQkW0p0nmkzgg
	jtk0hFMyrQs37P2wiMSJ7/P1tD2cjl4i8RcILDtU62uwx7+LmiU6sqLEvnv1Za9Q
	bHsflbLexgiocECl8EdEc119+W1l+Yh2gk8PITa83xiii4V2Gjxy0f3biVg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2bd418-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:48:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70ecaef21eso211781a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 04:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776080914; x=1776685714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbUyzb2hgURR49pOk/6k47H04jOC2pBiHnt3w2EMRMM=;
        b=NWdLdtPVxGwgy29eDeIRvTTlopXvt/RJ/9Yk4Sk1W1XRjA/PMwNhQoAxXe70CWQ95G
         gVGWgprem55Zn+H2T1c4M2a/S7YyTzxZmT6ZkliFU+XswvZKDPxy6f7G1JYiFMhhk6/P
         x80O/iklGli87N4rHOvnA2U9pJUxr7c2Ka2m2VWp3b+J9040t3hX9nEsVDRLYtRaDTxi
         h6CGPHadQK5u6lXVE5SC9rdMU36cfeMTITq0+lz1/onSlxe8005TYSasyu21bxWw/0HG
         MnP/gnewBtiE6e2oTqsbXrCnDvS5DB/TTEke1yXNwYRAND897G0XEpkcRj9IyfzX/+ZN
         zhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080914; x=1776685714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mbUyzb2hgURR49pOk/6k47H04jOC2pBiHnt3w2EMRMM=;
        b=pYnCP01flZWcs+KB+wbzWncTBdYoB/QoWIXxliWSMbCY9iZ/fI2cQgpxb/OWIcGWen
         ZVl9d101BlJFyp+0iWazfUMdJa6Bt4Lp40k03cuXIACjMHwh7cCJYudJ6DMj5KooNF1d
         N08+lVjhrivX9nkn33AmZoH3QayBwdxy7Ft8ZK5hZJxMNmuLNBChk2OwReWLO6lO879A
         j0ZyXdReS5lQnkecxVLQducf3L5efH+WCiExsTkGTPML5eYYWqAG+KYQVllkjkK3oOur
         ehzLFX+V9htHQvK6B3RpF1OkRAT/tiguhAgrxAnKEaqgfvz5BIv5sUXqY8z5hI6cLJ35
         ECbg==
X-Gm-Message-State: AOJu0YzV/O0TekbKOEKUFpE72CQodQKNBe6AJMTKzFERfebTFrf34rfW
	Gntry8yXBw57h0AmaFKDkNTGbqXo4VowupRNpkKOITYQ9AoZ1+WRKPy8YsZmKcRCIJHYHNPi83m
	GY8nHoe8tz55zAYIotWqJCJ1gwiGsAngxBGuWsmQtkR19Zba5faNTGpONHfm+Pg5IuFjR
X-Gm-Gg: AeBDietNvE3xuyVOC++hE6sVGKIA1Syx/1RKBDyWiPZPCHgqISXChxN3Op1GDcJycQK
	7aHTMtOOp6fhsvrVFVY4IHg5w8BUwIeymeoM8HTEkna7eJKhVOucBQweszM4Wb7/XDU+2We3zvU
	xgUaMoAchdSTh0drncd6SDmOGhG9/Wja6HCaVa6Qd44o/FTCZy8CU9N1IhzHU9gAE/cXVcCVrj1
	mlIWwpcZMin3eUfsw/8Hy6Xz9uwn58XSDbJ4D7DJ+9h1tobWQnuwBv5AlbONfokI+wa2FXh5n0h
	ivA0pmZYxpQtHA+q5Hn03j/qJ0eyg66+I1qsoEzt255mqjNnHm0eq4/0KOb5CVpCmzbYbVufcz0
	MtQloTze7WYeAT9FnVIrnKcrlnRh84BL6GQdayMKL8T5FGiCtdZkf
X-Received: by 2002:a05:6a20:549f:b0:398:86a3:8806 with SMTP id adf61e73a8af0-39fe3faeaf6mr8210932637.5.1776080914518;
        Mon, 13 Apr 2026 04:48:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:549f:b0:398:86a3:8806 with SMTP id adf61e73a8af0-39fe3faeaf6mr8210909637.5.1776080914007;
        Mon, 13 Apr 2026 04:48:34 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a12adasm9822453a12.26.2026.04.13.04.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 04:48:33 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: qcom: Add monaco-ac-evk support
Date: Mon, 13 Apr 2026 17:18:18 +0530
Message-Id: <20260413114819.3894307-3-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413114819.3894307-1-umang.chheda@oss.qualcomm.com>
References: <20260413114819.3894307-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExNiBTYWx0ZWRfXwTL9kKLn4LeY
 nXlTBN68SdkBFdRm5ZI3JIgx3y3GO4xwBdH31pU1WrKN4FmpstQFcSHLZcdNgEQcjH/FvmoVvqX
 ZGdF6tuIpo/clWdVOg5dPYEXVt0DV1axPQ7suN3BPZSHSGH7nDVfWg841ZKy4zGfhLkd1SWC14p
 9B6n5/B3Pe2GllngwAgeR+xhkZa3tdZuccGMkCxBGD/QttjfIi6pIWrET6rrdGLZWb3UO/IWDdM
 nyqoguKD44Iv2zzeSvckx9UOvay0kUE2vWYu5Od7MRIZa/p3evpLiBkhMMnnehWQFq6SCFTnKFc
 R+pcyHXEPx3PPjX5XkarzraA4WfOm+vZzxr1RkQfVbianNyOloIxV3JJGA2AKpRniY0Fqo4r8tS
 9MFIWp5T3uB/RWdzSm76K96vQgTPwxHU8nZD+DQ2PPWGrrgchMX7DOgKIAiR5RY+vE81P5fFeEz
 FNq0YG93q0x5/f4q6ug==
X-Proofpoint-GUID: qGkMT0_M8eIJoTK-qTcsIlZiFJrzbA_9
X-Proofpoint-ORIG-GUID: qGkMT0_M8eIJoTK-qTcsIlZiFJrzbA_9
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dcd813 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7Czdxb_1pZKpEXywf30A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130116
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
	TAGGED_FROM(0.00)[bounces-102941-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41E9C3EB80E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce bindings for the monaco-ac-evk IoT board, which is
based on the monaco-ac (QCS8300-AC) SoC variant.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..7531ab3143a6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -918,6 +918,7 @@ properties:
       - items:
           - enum:
               - arduino,monza
+              - qcom,monaco-ac-evk
               - qcom,monaco-evk
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
--
2.34.1


