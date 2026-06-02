Return-Path: <linux-arm-msm+bounces-110722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BM3DDQB/HmpMkAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:58:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87400629439
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 498643009F83
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 06:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C153A8723;
	Tue,  2 Jun 2026 06:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uz1ELxjZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fng40ApV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1AB2571DA
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383095; cv=none; b=KTGBfQkaHg5Dyoji6DV7JBncJoQcuxGXvTKffQWw6mKGvGHS+5nbZ7Cvtw0Miq3KH6nUCsrep2qVgSELUQWU0+mBa/vsBI1HCX0LPKU+AS0KUZjr0rGhYRMufQI2GdS40lS2aInnid2ChCQZQuuuD0BlHDdGFvqOBBdRVnlNFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383095; c=relaxed/simple;
	bh=dAJCJcvTZrg15xJ5E/ljL/FmMqY3NfRmZnPBFAjtMBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=chOGOztaSFos24NA3DeyVXUOxFQTsj2VPPRoLafuM0TBmknIUK5CcXng9N2si4TtkrFf92Nb6jtJN0KAWwPkttpYyvisBUBYHp2VhavqlVz8fIS0YsoCaEHJ0cdDXVxtbXJQhRMcOCSiz7EipdL8ph4qKWaL3iJA4+21Gk6Zajg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uz1ELxjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fng40ApV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525ir7e1316736
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 06:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GsTAm6yVAc9OEQ2D1Uqg1M
	9QdUAqEiPVaCqDuP9TshA=; b=Uz1ELxjZqczXD17wRd0wF56noCBTlv415ORYjG
	z2TZ9AxdfTddn91doK/LvPM6MrYhYhU+xEpqz3kXsYjqyVkW/9Y1HL4ZYOf08/Fg
	9yNPU3AHBxYC05yehFB9AecU9pN4s+hlFvGrGGmYBAHFjem+2PdpCTX12yOaNT+2
	BK+qT77mvPHPJrTNMRn5TgsYtrS6l3FCPeoVSF3LcyDOjR+rVdXwqRxYP4Tr+pKX
	an6Vf//qREggOn96B86ROKOdjgMhuOHlybExcv4QPS95rJRpxx2rInq7g6AS0NPH
	y2/rlT4ZrZYIM0tIYzEAQNegiKBMlJBNzVpUSKsgNnCSVnFw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vr8h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 06:51:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b982ec27aso3803243a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 23:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780383093; x=1780987893; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GsTAm6yVAc9OEQ2D1Uqg1M9QdUAqEiPVaCqDuP9TshA=;
        b=fng40ApV1xo50z/FHN0vcK7Anup9ejLQYLcJRSRWnCGIZ9OEn1RK3uS/O7dvcMOQLP
         sy+sQg5gTohwBOIxf0H7zl3ZSObADYhkeV8J560ORVLyEu/XrQ4sQrlvfEHRocnF+6qc
         YW03MG4KKlznvp97wbx0wHkM0gEaCTUd97YX7CZn7PIt7/YRaVOTBB4KwuDnE8RoIAp1
         DpDNO1g++PpYxcaVEzDjcc6bNIc50P3hey4cmYcaH7ZTeYnxYoNcg0aDrLRlQnkMj2X7
         mM0jC64LcNU5WY288Oj9vDQsd2F97SRVA8mK8U1ZN+YmCTmPrUuw+zwqou9d5ZJ+eIw/
         0ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780383093; x=1780987893;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsTAm6yVAc9OEQ2D1Uqg1M9QdUAqEiPVaCqDuP9TshA=;
        b=My7NHZsY3wyiAcbyMw2EE025oYR0/6JQePzKWTi4zjgNrYt6bujiNkzhf3Bv5SCd8e
         WoyTIF/7VqJQEmVnOy4DUinyY3Rc3IBF0haLUY1UY4PTkCa182VL8GOik4QWfbKOfjNU
         L6kUmkbhCgmlgLtN/L2OJ0F9rAnkV80UZF7ifKWpe6D5x3EZvRTPR+8ZO6EZEa3QpwcQ
         iA8yyuwwAs6/tDTFNPOhCvf3TYICV/jLkPv/fmg4X8e15scfPmoRT6+C6JHGjkRPTDyl
         6V9hw3YJZuoYT79fxA6ap2mnicGOJpHR7DLJYPJXfnIKQCdH9CVpaglOXYcJfxUZQCtJ
         dOOg==
X-Gm-Message-State: AOJu0YxyPjUvCFv9YWAYTXOBPfwOa2/A7n914vTX86/Ol1f8HJ0xLR49
	CqNi3E17fkHC7GOTz2fIzPwz9mPHX8PxV6Mh5VvGXVrEriYopsGZlTD+9KRRhgZE4YjHJ8ZvooP
	VSeRnV9dyfuKXI63b0lsfAr14jzeA0gAAaT03n30A36RhzZrErNqOS80/UwXkB2Cg1ELi
X-Gm-Gg: Acq92OFPqTY+wT9Cj9U74lQozmcVw3yMGX05ITz9Lopz7gXc+SoNT+p7zq4yvWeQ0Uu
	qJOn/p/Pr8pVdiQYEc6H/TjKC7JA5B0W5w1cSc965Rpb27mWgFU6aNA3l2H5LordI7VooMBBM4E
	6fayuRcYeFEziexxZg/SdBQqBpMhrK+Sps9M56RS7dilGLt0UWZ1SAcQNyfnyHanFOoMMZtq6sg
	94YFd05ZUO6dTZ8a6Mrlt0XSfXOiGbMzjaNClQBxx3Ush0yL+AK6CxcaXiACZvQ3IVG6VATdHLV
	1Mo/qNrBEUnLA1eOiE6S36tM1qbJKt0Kia2+jq5cJ+cCrvrYzZv07fqLaH7v1fxr0kp9D2+18/8
	bSvvW+0Yuko+riNLTDyAp/LGf0IcROsU6jd2vKExXWZoHkBxB5C/DNjjuOTZ8FMQPEKmgrLCvvZ
	hFkh05VpEWa1bjZS5MslHMMAtYYg==
X-Received: by 2002:a17:90b:2747:b0:36b:9c70:3367 with SMTP id 98e67ed59e1d1-36c501e8716mr14130960a91.17.1780383093345;
        Mon, 01 Jun 2026 23:51:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2747:b0:36b:9c70:3367 with SMTP id 98e67ed59e1d1-36c501e8716mr14130931a91.17.1780383092889;
        Mon, 01 Jun 2026 23:51:32 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd9751ea1sm1792408a91.12.2026.06.01.23.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 23:51:32 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 14:51:08 +0800
Subject: [PATCH v2] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-fastrpc-v2-1-67a55e22427b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF19HmoC/z2OSw7CIBRFt9IwFgNYEBy5D9PBKzwsif0ItdE03
 bu0NU5ucpNzPzNJGAMmcilmEnEKKfRdNuJQENtAd0caXPZEMKGY5IJ6SGMcLDX+VCvDvUbhSKa
 HiD68t6ZblX0NCWkdobPNmm9zDOMPjPh85aVxp3fU9m0bxkshJVOsdMqa2qC32jGlwXtTOntiX
 JkSzuAdIllHmpDGPn629xPfyvajQv6PTpxyCmjAOa25keLap3R8vuCxTh6zkGpZli+WSQOZCgE
 AAA==
X-Change-ID: 20260512-fastrpc-9f3b691f8e2d
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780383089; l=1182;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=dAJCJcvTZrg15xJ5E/ljL/FmMqY3NfRmZnPBFAjtMBM=;
 b=37zMi3xFZmk2qu17+LzEp1W80jW0ehZlgMHZ9l0kVyNf73S5OC9px39BJCNjdktyTCGHwJYiD
 wR3nRCgKDRaCLyxEZ6sHuoe46JHJGoPLd178b457v1pCh5QuFzamqBU
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: uZ2qrwdM2yAhCVdQBf1yvuIkjkBif9Tl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2MiBTYWx0ZWRfX9yK3MPHCBh9n
 o0Ozg7YMayVgc6gPHd1lNOJS+Pi6mLQA1nLC5zsZj0qjMA983nN9lfAoUgNYLFgmBKRD2hBDMv0
 AkNU5ARaZoglTGUFS714mZLnXLcUqg2a+UZaJbpE/WnFpJR7e7xmnNLjaqML8sokUNAe+BefDK2
 OlaJ7bpDVIfflFh/m+envwco9bzdMxroqcRzXeGEcZggV6Wu0rZxw1rrpM7hMo6RY2/xB/3H2dc
 08iDwJdb8UFPLBLMlAJekjyZwHUznhgp9sppwI3f47jkMWMom06Mn+e/CCH/tK8sR1NQuoJAEM1
 iSp8icz4nA/Q4A/seumIWlsPX3Iq7nwsQLczIWFMzkKX7U0Gv5xQN9Jl9kPMNb4IYqOVVkP2vBl
 /nNi8xjFSU2CS6QEJjs9BSzByQJTcLPQEGSJvUh9Gm4RSTS/4bSNIaVqFWmXv8yvJwpUgbRLo+z
 5nT35roIfX/OGEqPO4g==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1e7d76 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=PmvgEI0Rx0sAJRWD59EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: uZ2qrwdM2yAhCVdQBf1yvuIkjkBif9Tl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110722-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87400629439
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document compatible string for the FastRPC interface on the Qualcomm Maili
SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
fallback to Kaanapali.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Changes in v2:
- Drop Assisted-by tag; no functional change.
- Link to v1: https://patch.msgid.link/20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 2876fdd7c6e6..afe52296bf1d 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - qcom,glymur-fastrpc
               - qcom,hawi-fastrpc
+              - qcom,maili-fastrpc
           - const: qcom,kaanapali-fastrpc
 
   label:

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260512-fastrpc-9f3b691f8e2d

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>


