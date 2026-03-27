Return-Path: <linux-arm-msm+bounces-100345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKnlMtCQxmkyMAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:14:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72968345DBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B55B830255DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7236B3ED110;
	Fri, 27 Mar 2026 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3Ca4B8g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KovpBJme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5EE3BADA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620876; cv=none; b=a7K05YM3uxvbdXUnUYkOAX7e/7ce41T/YipwvKEhs0tIHEELhAciIuBUk1d2dqagZSoVKdY0YQb+eEii7U3FKktpsL/vSFwL3/cxI7yL8NnCrHlzlY0+jahMEzUQDe47RYl1syXiZ90jNoOrj89NkBVtpsEh7Z1NIJje8k/uWdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620876; c=relaxed/simple;
	bh=FffQtVemK4+GxuPiabXgNhdawSo6PkG5NaSQJbKynBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LMJIr09gyG/ommFkBgvH4Plx4gtkRRPwVUQAh/yX9ld8w+SCKExws2JyuLAYUFocdA6h9ZMB90rHmUgVZIfXMprpU87h2QCKsIGm0iALGgtSXOg4xK+fW18pEwyMG0wehaJpOzA4DUz2N5FgqS4fhHP0tZM8sCLG4sWfMhpUJIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3Ca4B8g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KovpBJme; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDha2S1203828
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 14:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CBGpQvmwcGg1GnuKnAy2UQ
	+REwprmWMOKeO8PWhJsYM=; b=K3Ca4B8gLDQfSTmf4Y4jx1pI5Ljlz3vazQf7tz
	9ZR+lT7qaNLMBDDTkBlEO8vNKfXgDVeCi7ZG7jU5vgo4oJRRjp9qdzoAcZbmNISR
	Lm9p6hrzJAKaWWMG+yz//rSmXKvFmTTtDmDQMlaUgr+MOjYEWzeR3/pXNbANRaB8
	oBjz9cI29YMYrn6g4vFSPCWUboFNIu7EXzjcpUYrq3VjoFHy3esqBd+vauSfUAu+
	tR5F50deSzxYr87Mxb0eSsrD9FFNyUVC+C8IdVREYhOtDUzwXXaT7XRLtqDCFgA3
	65+gcXSrSZWV+wRuY8VKmVDJeLN1+m04PfmyIlRXj42C9Dag==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8ud7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 14:14:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso66433621cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774620873; x=1775225673; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CBGpQvmwcGg1GnuKnAy2UQ+REwprmWMOKeO8PWhJsYM=;
        b=KovpBJmeSbHKJ9D0TVhXrh07J727zuTqL/XnwvU4qqz2r54TweVhAigUJKKbRCchcE
         4OZ8FcTetZr90I6nwixmiSC2SSowDiWqNOhAYxqE9cG2j9M0G6mE+v/4qXtiXe3sekZW
         nxpCjC193tLG+bfQ8wwAbGi5YBBdDhlfCy0dXyGnpTtk1Rfn2BwDgUuq4sTwrkilZORE
         6uFHTPk4DjnIcIjQE9lSoDfz7BRCWdoTzPFBXObig+p41OcRxmVz38sCCcsVfYjGOJCz
         DOL46Qg18GnMz9ZPIhClol1bLrnABBiGBgg5bn2NcD0MWftAnm1vlkihVQyRUdWiBco7
         z3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620873; x=1775225673;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBGpQvmwcGg1GnuKnAy2UQ+REwprmWMOKeO8PWhJsYM=;
        b=l5+V9nl/GXV7dZuBFY6EQgiNfg18Q+BKUD2BOvrZhuEKGifH8wQ0Nz3QV+mCBUN7YM
         02/fdd2eQT/r9SwVLyT5fRbCapNKqu11fIGGifQyTqu44PHlUvr7zI6kMWKuhVwmTTEp
         S7lno1eE0FgPGblC45xSn7vvwCWqYEwZ5QqCZ2x+Rc8vxqQWTTuKFyPxq0pCysr3TAGO
         A6vrCvFJkKwd5qTxFGhyMU5kbbK1Ol/3S4KqXzt1aiVQQZ8LVYsJwocW9JX+XXFFg/DB
         J6Bh1jtEDHGwdHZfOb+Pq8xfIrrsUB3WBXDQL2dN3jgdLg8HZGHizMgjmSFHxwebkJOW
         0I0A==
X-Gm-Message-State: AOJu0Yz2iWwxgryy699nflQrAfQrWbq96WWnULDjHpU3WS02k6Ugyben
	9+u2o1vqxdFwUvk1j0LONA71T07u3AzDrwUhncO8a9MPBR8HVIPaJjrQtBjNdhfDQMLdGKDx4/r
	vbIajCAkHeMMpIxMXDR310PR5KgDJCPm7lJXN0JJAy7NNpqthC3uvqhbwKSbYuC7h0i/u
X-Gm-Gg: ATEYQzw6YYSRvU1NNB1qXRTpONpqXI9fJAKaZionKKUPutWGf9VRHCXI0n3wXsr8gAp
	ucyYgtVfNWBaZDS73lPqKmQK865c7i1aMA2Pynp9C+O24Z/d0KTbs6Yzn+VSv6IXB3oFh/nZXZN
	XJ703l8tzT3aDwmBZNMybrDT28jE9qS9MyiwWoA+zJKoxnLksBWvFpwHrRjn5MO4a66ACVYmrGW
	+VdDqbfI+slwsnwAumkD7hT/+AT33uJehhe8lwmIJH9wOt6J8VuYEyZWt5f05UYHqYDZxkc2suP
	AFVHillj1XolnYEdg1HQrAL1e5SbmtU51PhYkMMFU1+S1k5V47awFtJP/XyC3AR8vErmQbkG4QX
	hOL+hF+Ixctl4QklSG92MvpgH4eY=
X-Received: by 2002:a05:622a:4a17:b0:50b:5336:1d20 with SMTP id d75a77b69052e-50ba38efe47mr35435251cf.53.1774620873257;
        Fri, 27 Mar 2026 07:14:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4a17:b0:50b:5336:1d20 with SMTP id d75a77b69052e-50ba38efe47mr35434531cf.53.1774620872644;
        Fri, 27 Mar 2026 07:14:32 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d23679sm191174815e9.9.2026.03.27.07.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:14:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 16:14:27 +0200
Subject: [PATCH] dt-bindings: phy: qcom,snps-eusb2: Document the Eliza
 Synopsys eUSB2 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-bindings-phy-eusb2-v1-1-1f8a9ad6a033@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMKQxmkC/yXMQQqDMBBA0avIrDsQx6DQq5QuTDLqSEklU0tVv
 LupLt/i/w2Uk7DCvdgg8VdU3jGjvBXghzb2jBKygQzVpqIG+SVri05ikNgrTsOCPKsjdN6GQKa
 01nrI+ZS4k9+5fjwv6+xG9p//D/b9AALQRfF8AAAA
X-Change-ID: 20260327-eliza-bindings-phy-eusb2-bc4dd201444c
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=FffQtVemK4+GxuPiabXgNhdawSo6PkG5NaSQJbKynBc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxpDEtPdOv6+1gfvxnDu3hoLjI7ccgr+y31kGJ
 D7ZEunASWqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacaQxAAKCRAbX0TJAJUV
 VhZ+EADGaluTf35ZyOzsEvgpReELDDJiewkNTKYwIAaEUFTKndlR/GDYRSgeLt5aXnnLEHHgfID
 T5RC6z8gidB10d9GI1nKg8hIjxwu8iU1ZE0/7PwPpDXkiC8xBESBjf3Z/4iAy6kfLdyeouEjI5a
 kM59d2GnPFZC4VOlVoZl02kAoFlopPHzqMa+MwQ1rpXmcQQ+H9vYBNbL2laeRT84FYEV7n0GTPs
 NVAoUovd8oMb6xB8YYF1BWyYUDW2Odf0qUgVNJ3tEN7c6M0yYPfjHYhgqUDdnN0eaA0K3YzBt2G
 P2Pn/QvDeqtrcc5+lNdkxLW68HWHX7ml9Rhe6fE6T2+HF0856DDmcUUdGl0g3cgIeDpXtC3z5Bw
 7Fh+uvjrvEks26nHZ+pVblNYJPipegkkG+1dv85NHLygvaBACY1jfhvB9NrIKNq6ewF/lvSmhbp
 dKcWi/0FBq1XX2D2bjPfPQDMkjRpyTSQAo1LnNxA06pDsh7VYwujBmMEJ1GF6pTr09/JIrizFPV
 U/CbLTmeVXXVDRUzCYDP/2U0Q/xEn7I6Ib/OzDKdV4PQBmeH4a60YUfKL0hkMs0fjuWJ8Ws50LB
 Jn4oWiYbO2YYjI4z7ZKL0Re0H6xBYFLF5H5CPeF7MYCtID9ytcuOh8k7Bgsht5EStJQQdRXrOBq
 OXdMtMk6zJPpgJA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5NyBTYWx0ZWRfXx4d1Gm6fP9AJ
 rt86kjt71rJGrFz+JnvVJcwZnHNPKZO7LdageeodoH0g1fenbtr15X6G5VhNKKnyCeo75MXybb9
 aX5MQHrzNdqDpG1yt12ewXSmU9p8hyDpVZ85CIh1g3VYf5VzLrtIuV9EST+7sPb+Mk1L9cxl5/y
 zAVGmm/HRFg5YJwg3OYK/+JJHRbjAQKgee/f47N3Ftedefe97pY2mRSW/seyyK4ZxF4K4Zr8EVu
 Jwtnn/k215X8fA7/Hlcc4KkMpESB3egYD8TeH0ybGAdw35PApOw63wTeZXv63hrxOtdGo4cS+EK
 KBCmFsDrq9r668XGCQqJ5hceK/4rM266XUZ5BI9Ovnp7t2xYHwh+2iO/hqTaJcW3jlu2ctJPFj5
 BLio1nI49lsp17gRYBT9CqpU8yGXvJnaDqJL/njR1vtxTFgCFEKvSynpoBvS5AvLV0zSgzCbuI1
 oiZmN4nzuLKzyZFRSwg==
X-Proofpoint-ORIG-GUID: pIdY2VDL8vX3bH7GLiMh1KjWETjXyIdz
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c690c9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gb61f_RGkQieOckiKckA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: pIdY2VDL8vX3bH7GLiMh1KjWETjXyIdz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100345-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72968345DBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Synopsys eUSB2 PHY found on the Eliza SoC is fully compatible with the
one found the SM8550.

So document it by adding the compatible to the list that has the SM8550
one as fallback.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 854f70af0a6c..096f6b546632 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,eliza-snps-eusb2-phy
               - qcom,milos-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy

---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-eliza-bindings-phy-eusb2-bc4dd201444c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


