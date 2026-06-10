Return-Path: <linux-arm-msm+bounces-112454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 85l8A5dcKWrDVgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:46:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56602669671
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:46:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=myxuQVSo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hIksXlts;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112454-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112454-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5C4232D63E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45773AFAF9;
	Wed, 10 Jun 2026 12:41:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643A63E317D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:40:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095260; cv=none; b=qQwGkRYSakqM3r4H1EtuRJ+inWfL1SSo8Vq758VT5APBgEdOg3QacmV6qdQRRM1TLoyaU6zAnrgS0mOuCyeJryq/oiRqRUSi7+Bbsr0wTsMbTNnzVyMlH20dgFnJvajgwrRZt+3cf2InTjT6gsQK08XtOnV1dxWq0LS3ym+sVb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095260; c=relaxed/simple;
	bh=aPWVfAnpsa1PzlO+27ezh/vSR+IwDjLwuVaE82fElVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MdnJN0sUHkHX1FlXEsUhuGyn1LDPA/xTm/ebzbD8/iF349jjOd4xgWgvKF9Kr1EUgyPqjGLfw/gksXQPn0hsXLSHKWn4MFAOWG+6z+U75OqCcNS9fXm6iRIRabhFGO0N5e8qW65RlfNeBS8NsMux2Hq+34ltnZDTh4ytZW/qHno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myxuQVSo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIksXlts; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCBja1472544
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+VGykQtzN2390G8YWsdFS4aw1NuPSxIeYSe
	zbVc/54w=; b=myxuQVSoFBqe9PqeFUhG4uUZcrOcuWZHt6n0iIXBECzKQIBwXTf
	SuUeVSCJLRvjwJItwfkn1oS2hNJGx+esp/ArJYsgqE7GI4BaNHh3IpCHMuqJ4WZs
	jEBvLxwwLkLqYbYU7YPeC/zWY3KKNyRTyXEGp6OE8B3E6OjDoTjWysiOaMWcbG9w
	sZdn9udtCCHL+WYOq9Ck+yHGrnIIvXu+l2xj5A9ThKssfJr+Xc5Zit5/UNVSxrLN
	27t2unWtKE7kLyyhTJNCz0HMLQ8qfRZtTkD+xklykjekVpcwBe61YbtomxckUfMV
	JoW5XePHfTOfroLTd8wUTc4btNsk4ckogJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd9unv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:40:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517c65c019bso59332401cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781095257; x=1781700057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+VGykQtzN2390G8YWsdFS4aw1NuPSxIeYSezbVc/54w=;
        b=hIksXlts4muFcUz3sUl2Rw9yW0zCc08e9l+Kcx/qllmEwXw7UqUeCMDZ6dqq3i1doJ
         cC2wGrrHVJ5YxdPFxOz85b/MBpUXGLxlOsBPFI/BWvNkkTcr8LQBqmr9tYx+tRHiWAN8
         rsMyffNAEKya4+S1/crSKpHebQbOIt0JVUyTdh64qKRhWjJPMMyFFPKOW4DgkjXD5U1V
         1T9PS+WTfL51XvOCl3lLwnf2EKvn5tsusGYKEHlY4+v6ijduSLpXAA728XjtDp94Brif
         SzlcMLV4Wq7HesDA9/uiheq8gzosfGC9EUpN3++Ga9kWfwhSyPV4bqbS73lBSDxaoAMD
         N9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781095257; x=1781700057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VGykQtzN2390G8YWsdFS4aw1NuPSxIeYSezbVc/54w=;
        b=h6dA2redd3mw8KF3vSWAAHSIrSCoa1F36Ihy2PZQ0CzAm8sI8wrLQqciVMbjT1rnre
         Aqotxd28xn7bId5Py6qXN+s6dJ6y7EnRd66fdKZ+IqhRLO/hdONmjCbiITAS6WYTrL25
         18lbETCgKFaDQ3WlZvsoi1S+dMM17tXHOqIWWwbfMKNoQ5oUSSiEf+xzv4FHYdp8OxBe
         hL6E07zh4kidhXCOytFXue1nzhtKWL+4n+rwPzcFZbyKy9aBLDif5Fn9eHwGZbFShaRy
         g49EUvzFLtZ6xhYUHIV9kWtfzNlHdXrCxx6DH3s7GfPoUPyyXQGAbmmPpBwY/Xle3wen
         pRfw==
X-Forwarded-Encrypted: i=1; AFNElJ/l/Uy1lmahUia3L5hUJrikutaoQpKMIWq90BTR2qUvj0lKFG7DJj1cSpAyTpkILT/liyb5sKY1DTNzEEjS@vger.kernel.org
X-Gm-Message-State: AOJu0YwMuF0EM3SEv/aXsMVZbpawAfoPRfjza4KhLV9lCt5kwtkEhnEP
	L20G9SYIfO/HWxgAgBMq+S22Spq/ook1cFXQ+sufOua7JKaso5efN3i7gpJsdlfOQKfa9e1K3ZF
	0VGGxWQu+S/1H174180E2UOHhTyLpvaGF4GgO/6kHaQ0+dFeyqbiUO430SlCOgVLQmTpl
X-Gm-Gg: Acq92OEiT+2FckFu6mH0/LEZ9ZeUfYhVR3jArDq9pzAbYBBfOiyb51elXrzARBuFchb
	SpbTVWAGdA8D0rvBTvP92VCmayLahtcc6pZw00cFdosMx4/npjh7/KwxZvXd2N219SDJhryaiJs
	J14qO8hOwBXN/+HUczwfs5ChfCLL0RwPUvAoJqmbi3NwchHjDhr2pWLPK91IUpoQnw+uv8rTWol
	b8WKsZL5yFT+px7C0cMMZ7NQXDdedMfedjCir6iVoJc2sDQeXpS1P8KOKlmKajkJ7Is1cEaJuko
	YfMgvGhiT0muc2IZghayRIDQ36Gzs8yaG8lEQ5rAAnyuOZZKUU4zVTKzwL2INyGz17ncGRHc6TU
	NLsPtWIZgyGBO7EEmeMrS0xeGA+nYA9BnCSHrt/w7O4SKV2SY
X-Received: by 2002:a05:622a:17cc:b0:517:5e32:f3bf with SMTP id d75a77b69052e-51795b9e179mr371949051cf.20.1781095256734;
        Wed, 10 Jun 2026 05:40:56 -0700 (PDT)
X-Received: by 2002:a05:622a:17cc:b0:517:5e32:f3bf with SMTP id d75a77b69052e-51795b9e179mr371948311cf.20.1781095256104;
        Wed, 10 Jun 2026 05:40:56 -0700 (PDT)
Received: from quoll ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc472f13sm27731015e9.0.2026.06.10.05.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:40:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm PMK7750
Date: Wed, 10 Jun 2026 14:40:49 +0200
Message-ID: <20260610124048.253162-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=aPWVfAnpsa1PzlO+27ezh/vSR+IwDjLwuVaE82fElVc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKVtQmvY4RYXSxcYcCWaPp6RJs4PdEHTLYnk0p
 cXz8gUkuUGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCailbUAAKCRDBN2bmhouD
 101FD/9HTHvUOAP3X+3zXSTgPAopPiKuc3qZ5vogOYJiDG7swdGcMLhnB2alvLjVR//aYlPhQ63
 DrtxkinXKX+PQFl3U1TZWcADWIUKw8iNspLELzOv2S0k4KmKsAxyTuDNMdnM4d8Jt5E7pCMrwWm
 0FwckD+sluG+8HnfWsJWttc8LC3lKad34hugxMMaRgMoEICUX+I6qYod8mqEDHgumRdvlGIs0if
 kDohtPnGw30b7mpyx1uQofK340+WQ0I+/OqHFuZg/zg7GCw582/mNzlZCzNDKg7vBW0BMpHJg4W
 dnbvp33YfVHYnQC/Iyzi6bThp6b/vFle+MJ8J2cTn4dh/2NXK16mpt67RHMugCtpUyYkM1UZf3o
 5+8UTA9w+RajpvcYfv0M5EuXWsM9Q7NhMA8biXUl5HFc2yCEFKw9/l9ftoEuqaf6FejeYbCSe8F
 AWqSkl8wydipkWoWy46X/FpzlpE0EOy1uPadSeOTrkgijl7mU63AB8Nj6nf6ic2nONWD7P50nQa
 fEE+knNf2KQPsLPTDXEqL6QVBcELs0tIaxaghvhcv4pSWJZ+ueQvwCEX8ySEy1tagAxizE3CzwO
 5EY8cLvesZINbo3+GcUn63PnJtd+X8fmDBV14ZYj9Br4JayZHkddi/hczy4B7lcf/WQemhA6M3E 2Cbl5qH3p3N0E3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a295b59 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jHtBG9Y8VJBRIzbNs_wA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: kLgHf0WKW5fptPV_q6lGAfU-miA8sHRn
X-Proofpoint-ORIG-GUID: kLgHf0WKW5fptPV_q6lGAfU-miA8sHRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMSBTYWx0ZWRfX66XjvD5dGPBw
 qBSMDDz4XmJhh3A4FAp1szIbhOaURLnaeVNTk8xlKGvow6Y+ibOC41iDsSRmh8CoQyx7qcPSmy9
 SxitZA2SrED2H+rWly1XLir6s8z6FAX54lq1QVpP/CeYC1e0nH44rayQyvBtgAtYm7fhvl13QWr
 yALArPAmgGWh/9+tSCaJPevwrkmX6/Rw/IMeL9q4UVolIiHTl8XHgzwqGj76vaGP6/FyjZCoc5O
 s/5cLxk0ESSNKGne0H2edzH2MgHZjPaZ34KHm+RHGwWOWp8TcWov1oIU2HzWgMNNtDJYAPzYSLi
 Pxk/Jy3OjtaM9ztqx9m3WDqYz7UQYoZDdRVnsMUGg8e2FviB4c3ywqHRYpaPmsb2qDfLpC1Ky/m
 Pn22wNsMcb5Hu/hOQmPtZeg4IBDEPOPSe1yj2hUGU/CVwuef/anvi4fDKKH4QUMrVblWL3NIEMP
 kCgUlzmVVkDKPUjE6Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112454-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56602669671

Document Qualcomm PMK7750 used with Eliza SoC.  PMIC is almost the same
as (and compatible with) PMK8550.

Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 386c31e9c52b..cd4593512f81 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -71,6 +71,7 @@ properties:
           - qcom,pmih0108-gpio
           - qcom,pmiv0104-gpio
           - qcom,pmk8350-gpio
+          - qcom,pmk7750-gpio
           - qcom,pmk8550-gpio
           - qcom,pmk8850-gpio
           - qcom,pmm8155au-gpio
@@ -173,6 +174,7 @@ allOf:
               - qcom,pm8018-gpio
               - qcom,pm8019-gpio
               - qcom,pm8550vs-gpio
+              - qcom,pmk7750-gpio
               - qcom,pmk8550-gpio
     then:
       properties:
@@ -501,6 +503,7 @@ $defs:
                  - gpio1-gpio10 for pmi8994
                  - gpio1-gpio18 for pmih0108
                  - gpio1-gpio4 for pmk8350
+                 - gpio1-gpio6 for pmk7750
                  - gpio1-gpio6 for pmk8550
                  - gpio1-gpio8 for pmk8850
                  - gpio1-gpio10 for pmm8155au
-- 
2.53.0


