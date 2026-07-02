Return-Path: <linux-arm-msm+bounces-115939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Vh0OaNERmrgNAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:59:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E366F651D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:59:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h3sfoino;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G98Ea5vQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115939-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115939-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FD2F302C5CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006FB357CE1;
	Thu,  2 Jul 2026 10:46:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFEE3C09E9
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:46:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989194; cv=none; b=csuEOL4QZVXamH87PBq9g0OlUTv4D/Oatbx+QuWqDPZCn5LPGKNDvPqfS9onKL1bgWQacTSzL7tL57Qd3DqKZrSRCNlYiSr1Sb6UV2alAxHdwhT1QJiplsWt5+F0a9B1aSkv36T6EeYYWxJf7+Ku8O867hY38lh51pmVoa4SiLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989194; c=relaxed/simple;
	bh=is34T+5VZ9KaYEjSCb0JcZdk4sPIyzkgjH8dnFiyzis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KsYVs6qWHxbKiuj3b0UpHmpsifvAn0wNNWB1mlJUQ0afzQNFe9Oan7b4uOtJnR5FzklwpO4ibKOaTu3yIK81eNDzTmAcmgozyqn80qTn060My3GvzYN/NBTaXbhoNz0rLiQwwXgWq2ckSS3gaiN0YAIMr4KWuLChTBmht4/pYPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3sfoino; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G98Ea5vQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KsHQ4117155
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06u0obT0KsD6NADPisjbsieo0SuABc6UWVTociWVLUM=; b=h3sfoinoK0nxFzSb
	DoBM7khU5lQ+Cj+THPgP0Vdcf4tzaBsa5RJP49PMXrV1+k3cNCL6tbA79zZIQoQK
	h6QHyiJ/LFNTxpPzqLWmNy4Z11/mB6h6J6xqypWZ8xPa6ssv8H7wWeFXYi0VAukN
	pNzUuBx6Id1iXH1bZR7T75YeSuRK4M2lDGmTOv2zUdw47oKorZXgExv9yQ2E6S+l
	LBQP4ZuFcFEQ0RI0ZTM+KMp2gBJRz+w1OD0ksrufSA6Puuky3dZc37Z4xMzidfLV
	PBBufFUBuFe1BshiSp+blaHfNRmMYr/28DaC2Q/UQBfCDKjJjdSgy1a5f8wgANOj
	mqWx5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bgag6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:46:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e8004d60eso120605485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989192; x=1783593992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06u0obT0KsD6NADPisjbsieo0SuABc6UWVTociWVLUM=;
        b=G98Ea5vQWXDnmdlYUne63iYgRb3jnQ68U0gQG7ljW4mpKVy/v4YabNrfgqUL+dSWXu
         nXV8Kq1nRdJJxmVBOG3IXK+5QhswEjin4E5/qBi58aAFW7w3J10fvuqnsXvvQAKUFmLP
         PiwButOjV4o62+CvxegaTqmEp2TFG0vyRyzui69MiVdYwbMOCIsxnf1Ks34oZbBbPol/
         FpXKv3t1VIvaanYOZnBY56G+KJwgGMVovfEdutdtF3PmIsxcs7LtX04C8M8iuLX8/dWM
         TP/YVjPVvIRY7zJcwOd+LwLdghcvEWBETlGEJWarvIPGbRjayf3yU8QeMhDqZN5cR/Nm
         AAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989192; x=1783593992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06u0obT0KsD6NADPisjbsieo0SuABc6UWVTociWVLUM=;
        b=mA1zeR4UATavHpuZyyG0ZHyt9nImwiBmXjkFHvhz6NHTaq8GwEQQUQeGtnCLDRRD00
         5dAquFWNUiDiGHQW1y9/itO9B1v9k75bAUPVryOlmShHxkb6TGn9zgeiIqDcIKDoTFRM
         gvv8TNd2WXTflmYcTYDfGF4a8EjIFOlwcK3KuvurXJ6iJ5wqXZzPm9TgOgHLZb61T4zA
         JAqBihp3OoS1HdzxlmstQaJXEQXYlMTeWrU3mrUZbeDLTSysl1XNpD99WA3qhBErkpn6
         UXWFJuoC2beXHnOAzgR1IyEPCdKiRHHkVNg6T6uMhbaaO42Mcns+JDIk9yg2hqZkzJNS
         48bA==
X-Forwarded-Encrypted: i=1; AFNElJ9TLYLTSL3ttb90wbrcN2eYVjKtWfZ/H1k/fjXaMGERqmvSER/5LfnomD18ltYPFPCEUxOxaMG2TkDHCK9n@vger.kernel.org
X-Gm-Message-State: AOJu0YyT86g9rNfwr1lTnCBFlIwDJvEZJ+K/+nhYzaOdGq88V/42OMWA
	Zjlmerlb1IdQRPs8/qe8A2FJWn3KO4LtRx+/VO7RtyTDqBjwrP/S70LZRIGAQ9AZVgAcP/MgS2P
	uZWN/hOr0ziUyQZaubPfKIwUdxch4IHYtTLw0XrQoCmhYI4lwrKo/fpifGfNrpwkRu4Va
X-Gm-Gg: AfdE7ckw1+j5bih9il7xrkbQ0KjNdJxV6e1KiqR8Mfof/0e3AqEniwH/o8T0m7pAavS
	oEbK4j9K8sY/3GvxWDVEGEXvw6p5gOuRAhcFLxSZMLtuU6v1R9JdxaHxN/QCbVEqQEB3apmiE7q
	OLCSdQend4jc41ZB1nlmjqft8Mt2Z9k9WQeTFO4wCDhsUMxswvGeelIOgK0teBlJwrUdd6Jw6hs
	yAcIeLUfIUZm0P9NYPnj0+H2DTQ4lPjDQw9aeFPsdav6oyp/rIKocQHoru8BBy8Sd9BRQUg1HLZ
	iCRuiCgnq/HLmZLNvC4q1WJGASzuhe/rtJm5iU+4lqNVnsW+uINVVPahjfscCURViFdTsuYa8IP
	R5FjIpCigGaQuXh/Ga3E0nMpF7hYgul1xe/Mcc/i0rwEjZPvlSVK67Pr0UXdGGqm91iwe634Gk4
	J+GUBMGh8KfVnjnLsRASZGJH0dKMNi8Te5qpPn0Iwmr42PXOjbHAMbcnfpWP+l+bM=
X-Received: by 2002:a05:620a:29c8:b0:92d:e54e:72da with SMTP id af79cd13be357-92e7aff4b39mr630186085a.22.1782989191781;
        Thu, 02 Jul 2026 03:46:31 -0700 (PDT)
X-Received: by 2002:a05:620a:29c8:b0:92d:e54e:72da with SMTP id af79cd13be357-92e7aff4b39mr630182585a.22.1782989191402;
        Thu, 02 Jul 2026 03:46:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b5ae4959sm109689666b.0.2026.07.02.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:46:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 12:46:13 +0200
Subject: [PATCH v2 1/4] dt-bindings: connector: pcie-m2-e: Add vendor LGA
 connector compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-monza-wireless-v2-1-7b56e2a6a6d4@oss.qualcomm.com>
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
In-Reply-To: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: PQBpEKkk0HNXLoUSs1FoH-bkZ2AURWZV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfX7xbDKvNC5vQX
 8DyKjr8XyTshAJgNN/iwa3sPv7x3RVRU7TEl3Qb8s0Gn24drf7cNvxpyuJQvKcEIls4oCalUIJd
 067LWuRtPciihWfmYAhGK604QjCMD5g=
X-Proofpoint-GUID: PQBpEKkk0HNXLoUSs1FoH-bkZ2AURWZV
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a464188 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfX+S9MLrxOT5GD
 XDrQ9I9bMtv0Te+DGWXzcwmLRuHY+E2Sfw5aSG1w9n0n0fpulKJrUC/saXJooGbDKgFsfZ3KuQt
 U4s2miDkNtZ24Q3/CFYoYizB2eAZra8EPrRpQx7RBmjbi8AeRZKyl7b5Aqk5g/0of4Kfnig1hPl
 oCLyHYHrt9oYhPiTSCjuf+aGSvf5fFiDmhtmcPSVSpo9Lh6WlG+8QQYp/e2OUz6pJYt/5z4uDGs
 nRsmLY6sdPU1oZ2ymax9LvPcHPWaJffQdkWIsTBVLhHxW3s/TcDunbdatq/e1FUBIoHnwE7GWbR
 8JQK4rg654PA4GBbUeScip4438HQzloz6/ajl740HLLqFEYD78SFtA0tl2MZijjU2wALhD86t6J
 l6SgYXdxlWzv7AASiHlHV0VyyooWynkdgCSrHxai/jqpkEoLbeRB9GzjW7JvLrIa3mr+s58iEGi
 tOJ+RGnVsDWF3ZsC60A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115939-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18E366F651D

Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
Key E interface signals but are physically soldered as an LGA package
rather than plugged into a real M.2 Key E connector socket. Such designs
are not actual M.2 Key E connectors, so describe them with a dedicated
vendor-specific compatible while keeping "pcie-m2-e-connector" as a
fallback for the shared signal semantics.

Add "qcom,pcie-m2-1418-lga-connector" for the M.2 LGA 1418 module.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/connector/pcie-m2-e-connector.yaml         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
index f7859aa9b63469cb43919c0b5719c18694c5364d..0282c6ee9272446064a99ec6314a5ceb1721e0c4 100644
--- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
@@ -17,7 +17,12 @@ description:
 
 properties:
   compatible:
-    const: pcie-m2-e-connector
+    oneOf:
+      - const: pcie-m2-e-connector
+      - items:
+          - enum:
+              - qcom,pcie-m2-1418-lga-connector
+          - const: pcie-m2-e-connector
 
   vpcie3v3-supply:
     description: A phandle to the regulator for 3.3v supply.

-- 
2.34.1


