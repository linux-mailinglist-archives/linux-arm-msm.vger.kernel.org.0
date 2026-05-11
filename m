Return-Path: <linux-arm-msm+bounces-106990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKjyIYMPAmplngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:18:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EFA513446
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADA9F305816B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3BD425CFA;
	Mon, 11 May 2026 16:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CW80ft3l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilwCuMYX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E520F9D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518693; cv=none; b=omzSn9ZWa/dSUVmjSAN5oGmMZQ80dh4t5GI3UA6dJ2YR4dm63DiPzuIhf/VhxBHbgsaqEMWMF9+altok1O5Tw7eCnysCUObDB6Rc5/eXs49LEyjngS7LhXG8x1eAO1/DuoU7GyMYcuGUkBObHhJaTq5t+Qxy76UX0zT9WkLyTQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518693; c=relaxed/simple;
	bh=CCyTJyjoMYkKceetEu/Ag+Z55ygei8JsGGaDTaI6Q/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IhBApEFi5PSJ9lWaeP1H7zGpG9+2VK3uqf22Ptf2hjyTB5bUb9U33p4VRsjM5wPfYS+cbhSRspqJQz620be4SQ5XfWI8nfQC8Oc9TR6JBfgZhvj+RB4lEBLWiId/PpCqoZdZE2yTQ/VFGi8faBaEjx+1PsiAroS4pFMcvdWYpHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CW80ft3l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilwCuMYX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BC4Jfu108058
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iZuWkO7Gxcx+6mEhB2yhKD
	p1gVtoR1+b1HN8lKmizSo=; b=CW80ft3li4UqLstEpCJRLvOb0vb6CzbPChQIOy
	pdW/E9xPJ1NMWLI4PUHKbzfWEMOCKFxLK6hJTscylwp92XqWYhfzMy5A6lMS6tyl
	9U5KZSX5Ey+1SxPA9MntXLvmPRg5ewHi/MoMjoLMoRnA5gT9QuLUG5wux4FgpPd6
	U8A+2Y+KWifwr9AxvZpcAelS8NjdDjXD97Taid/AzTRrUNC3aAFX3eM+zHQg5DAp
	5g4woZX5CFbxy+5kLVduBwe8bRf9IUANOW0EORuOfiGhU0zEo7PRfSQeZv0/mX3/
	XwwWL95wRlO9io37tCsoaf7XtG0anD/4qU/EvwDjDX3eJC7g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3esys9aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:58:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662eec51e0so2402477a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778518691; x=1779123491; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iZuWkO7Gxcx+6mEhB2yhKDp1gVtoR1+b1HN8lKmizSo=;
        b=ilwCuMYXkEvLL4tPDG9sv0K+1hhGRDiK1aP2hrccz+lxzkgduYb3W487WSl9qzUzU1
         x6rdeHpCR1lL+Xa3FLDAhd8zwQnwxzDA/uDzykIZ53SIOMeJLVn8fsYebCuo7G3u2TG9
         M2TgDSNoqRFk3TsyrqVzCiJuqU9pgZuT2LRRkOuCMqLbkCiThQ+Blairy6UO17YKwF07
         gjuetJTgB3vAnVLbMUKIF3gl28QiPsQhsSz/iiR9s/jHmrO3pre+f/qdLOQkcxyLh0lP
         +8uIyAdrCOM0hQDVJlRWp24t0BlfaRscpYIQn424l2+cvBSq/AvHa1FYZ1nnpD5Q0ejd
         9kzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518691; x=1779123491;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZuWkO7Gxcx+6mEhB2yhKDp1gVtoR1+b1HN8lKmizSo=;
        b=D5HKbfZTsTKSyOIHEyhoxqNd003GsFXnrBqHdT+3bvWgiTXv9vuOfj+f9KLg2VznEv
         7HZxNvBx7Eg6iu2vm0mDjrHaYnLZ8LBe9rbta8z6AX0pqs0jjA6r1KU5URwA1exqgUgw
         UBBEd2a2abMntlIMDmrGB5fFyb/VvlJDnxn2Cz5dWthoqiGEMH5KcGEBx5hI1QjoFeFq
         Xzqs3SweUvjU/LdwTam3n5eNniMff5XF/0mvFUvU0tVveuDX0SchLWnUVv2BWptruMHx
         Wez8msOoOUD3uJXecV2wJFN/EZkbCFFKRMEZT9ClTJDw1PkRSi/67v9SQydsvED23/YK
         GjyA==
X-Gm-Message-State: AOJu0YxaHI4bgmT+gJ1PiU+pQI0zbzWAovfGgXaTqlr4/p7XD8R+V7ih
	nt4tKispFXjvhsTpNsL0KP3X4jlCgNF6/55kVBXjgKEQ7tYnzsugm4opcnhJIXlpOfGmrYeWZl9
	sOEHywU1vwSEXU79IrTjRl6r5GEkG2u5NUSj1sGtdHsbbePoJXvBWOxcI1DXzQNGmaQEh
X-Gm-Gg: Acq92OHz/Q+Z9CGehd5/4TwZgI3YEWW+yD0bfsOMnuXri2we4I8qRsnm5TBDgdlaX+5
	Ke0QqL0E8f7oF22Wuoxfx/VqgtfZIOOBBNNfpnq/qvkiWOmUq6gXinGUzxxiPTw8+TJXNy/onOc
	qoQ/sDHsn23f4aw4zNYYf/7El3ag+uBc5RvLdxkqdtzD/CBm/E846x8OxfF2LQmNjVk3PFI2FHZ
	M0qSdYVEmUf5Zsw/E3wNzLODqGm7oAUQx3WndSxbjyciOoB2mR4AEOu405jrZIJ0dBxD7tYsL0Q
	97YWkuKX/Y5NHZCHLsPn2KQjCnDuQikjg1KYfy8Q3X2hqzBBK3d+g2avZa8StRsYQFx6oLjJtek
	iFYShlUBeto8qdcWweu7Uf/1kVbjhPlhSYXGS1/HRou8Kn9yNQoGogP9Ro/CnCJn7u8cHXG9sJ/
	BM0l9/fKwQ5dUBphy7LAFLTW9ZpdNZL5iAWNNBdobMx36PT0jdkXKsDVY3
X-Received: by 2002:a17:90b:5683:b0:35e:576e:5bc with SMTP id 98e67ed59e1d1-365ac79c531mr26699040a91.25.1778518691124;
        Mon, 11 May 2026 09:58:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5683:b0:35e:576e:5bc with SMTP id 98e67ed59e1d1-365ac79c531mr26699002a91.25.1778518690624;
        Mon, 11 May 2026 09:58:10 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367de954ec0sm7716420a91.13.2026.05.11.09.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:58:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 22:28:04 +0530
Subject: [PATCH] dt-bindings: mfd: qcom,tcsr: Document the IPQ9650 TCSR
 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq9650_tcsr_binding-v1-1-a41f612da54a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJsKAmoC/yXMQQqDMBBA0avIrBuYCEmxV5EimkzsdJFqJoog3
 t1Ul2/x/w5CiUngVe2QaGXhXyzQjwrcp48jKfbFUGNt0WiteJoba7DLTlI3cPQcR/VEb61pDAY
 foKRTosDbtW3ft2UZvuTy/wXHcQJfhU+2eAAAAA==
X-Change-ID: 20260511-ipq9650_tcsr_binding-70d665950fdf
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778518687; l=994;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=CCyTJyjoMYkKceetEu/Ag+Z55ygei8JsGGaDTaI6Q/0=;
 b=OFZea6hnnq/jBDa8gBckeilKZc6qliG7ZE2b+mbGOx5Wsf0b/LNFOlTOtGRUABj9SCvljec9o
 14rPnGV59sEDXn+/NbQfOEQA+CGev5XYbjlzG+xILV2RKbXAw4sa5eu
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE4MCBTYWx0ZWRfX7sV3NdWOPhWO
 GusKcvluWyrmiwfsTB7CMh6Mg8+PX58D5WKO1Gd+7RNekEFdpHxDIL4yE6vFMlwsLLZAtCcgOPs
 mmHXSxeteihfJybkYzUrJyaWaIMz+1HXDBkKHNyPlg45Y/SOPp45KFi+31DHe2xqiDXnwMMzMUs
 TMCcL1cDSmqiN8t9K6EaW0CS6D+NoQolzANNLdkJkBNhKu5eOeR1UP1v/YteVyXHfraSt+tBz4E
 NvIGKz1NYyVNkfOJ7ICHWeTml2D1ixZHmjbZb12bp+9FmtOV0y/U34YKBm2SMPtjTRgSas/LOPX
 Q57Ylu6Rg0mPxnXW7X+3ofSxMufzwtpa1bFAAoJVxXznIAHU57ixE1SwbhZElrCUXygiRM08GYc
 xyphfUe+1jZLVjLMkcJVnJJ5vWzCxLCrhP1jT7XdDLx5f69Xq+MsLLWjXp0Th/KwlPzpc6007lv
 RQyFvj/rZPMUvkO+6ng==
X-Authority-Analysis: v=2.4 cv=AI/DAN7A c=1 sm=1 tr=0 ts=6a020aa3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7fb54yGoueoaJA_UZa0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 7t8PoUpAje68dBF-ZOk8sgJ2W_SftdeD
X-Proofpoint-ORIG-GUID: 7t8PoUpAje68dBF-ZOk8sgJ2W_SftdeD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110180
X-Rspamd-Queue-Id: 20EFA513446
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106990-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the TCSR block found on the Qualcomm's IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..8914c882fc35 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -48,6 +48,7 @@ properties:
           - qcom,tcsr-ipq8064
           - qcom,tcsr-ipq8074
           - qcom,tcsr-ipq9574
+          - qcom,tcsr-ipq9650
           - qcom,tcsr-mdm9615
           - qcom,tcsr-msm8226
           - qcom,tcsr-msm8660

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq9650_tcsr_binding-70d665950fdf

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


