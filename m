Return-Path: <linux-arm-msm+bounces-112419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LU9wLNpKKWrUTwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:30:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F69668D01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:30:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EPVMcEjc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="J/4HAZjH";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112419-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112419-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 013ED30DB8E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925933AFD08;
	Wed, 10 Jun 2026 11:16:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A833FF8A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:16:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090198; cv=none; b=gq/vY5VkCLsXnX1/zCV6eWAq5DQWNyfnYbjRCjy0KPpV18CHklwar+HoWVsrty05jP10+/qEGw2yJLtVMhSYudN/8GHGSYXPa9ecJAMDoW6jJJfDuJi9fWvay+wqZ9HpSQwQq+pHOMQeIPb1x/tuOTVvM1KDmbhvGw5LQwMiAHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090198; c=relaxed/simple;
	bh=WfvqcHxEIKd+2/Fy6r0OKfxrNsPOIVjM3gS59zdojfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ntvWxC9iWTyF2OdYYbFYLMQ/EPpCpSe+EYN7nsoa2cbH11a9iPj6X7q+b/HS29eMhf+jm3MSwixnno9HTh5+c7hxI3Rj2RJa+bjBhf/hTM6pnfs43/u7929vtxrTHC/oWkIaPvGdtgzhpdVmo26nev+ikO3zza7rnCQgauHOYa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPVMcEjc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/4HAZjH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A8wsXh735614
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9QM0vnhY8+WfpiXtoZ6RW1A9C9R+5BvzpcQBGpBa80=; b=EPVMcEjc2dqGBfgT
	8u0LWDRnnkrkrwPcj5EqHu8EgDLXzW/y8kMuTXjw5ux1X6zyO2M//mW6IOiUdgEQ
	QhGegDi3pNgfEBL6sZEXiWaudwat22htMWeCMZlsJ/OwGNIsV5ZV7frfLiFSB8tv
	OnhKJLc6EWMSTi+T9GHcs/No88rousghQmQeEScTuC6ovY45P6y5tn1jYqR4DvCE
	0IFzsr1UNqckORY/3xV7MgrgpiJf0UCxKmy0TgY4yCW40x16SsMxSVit7SYkHuzC
	VMsSEHszroIxUngkTE4V2kTiEmpd516tYE6FWNh19zFOp8Dk1L2fpJa4XtwT5U4/
	I9n19w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1rhs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:16:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b828c8so8930696a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090187; x=1781694987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9QM0vnhY8+WfpiXtoZ6RW1A9C9R+5BvzpcQBGpBa80=;
        b=J/4HAZjHt5X6UXZeM9LaAv2mvmZeHMerpTC5D/u8g4W3leTCG2v2TOBVvflhlClR/s
         J5nQVN+y0/puIo6rH8DKrdlpZe+Sdgbge7ER3omTrpkIwzFoc8dx3lDG/V/+qi8Q9hav
         BHbLe5ddOf2I11svpvZxJGG7euVEiJV9r8bxyVH3lLBCHH9l0vynMC2jdEo199fHQxVo
         IgtbiP3ZmJ/3gT/tSJcQB8VOoin8QMKV/xd/jN0nmnTp5pGnRVhT/7RnkCf+mPIDvpMP
         ZdMEAOqS58kFi1etj7dfOxYoTnvhjdRs0W4HY91z2UIUNK3t9R7rs5/epfRSR7sQ2XzY
         0fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090187; x=1781694987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O9QM0vnhY8+WfpiXtoZ6RW1A9C9R+5BvzpcQBGpBa80=;
        b=kjCw63mJy7l85QClgGaJR1x/BozpDfGG7InrEqQB59vsrnE2CuNLJzEwYDZ9Gw0BWC
         ZjuQRU/MBMMd4fhgXjEPL37wgZ5oSW2aJ9/g5WNnQr0+ZEyiIOD5poU74eh4Rl0vK6V0
         f9CAcQha3ADnFPx0OAqdKW9CP1Zauug5slJeZF7AsEvtFm3eb1uPwouAJEajrPWBXwxC
         RqaCvJ0LNc6R4zzh9xeTDd2Rb0egcGI0LnzMXnlYsPsJRUSty5mbtJ0LxmJUxaih6aJr
         UxZvQW4n6yxJBWpDGXEVbgZHJFi7U6sgDXBy6F1fh4dMtO7SZjYfyCq6utG1JPWRxHHp
         +vrw==
X-Gm-Message-State: AOJu0Yz4WND9bcTTfiLGRwulGi6wDscYSILk8qRoRE/NtudirjzIW9EJ
	dNiYr/cWD97WRkb4CJYJJ+uIdYwtq/kIiYYRyvFhSAjDmPCnPfT/NAt77AFtwbpJZRsVYWoAikr
	72CoQgpUZZlk6dKbaoziYf3lQhPUBvnsXqt4bAoFjPvFAlMUdpdzDd0UikDD/X55fwXE/TkcXZ/
	+7
X-Gm-Gg: Acq92OHxz8se+2vH91yJK3opuQ83q/bjErOCg+2Y0020199xiYLFbYYjM2idoOeN/oQ
	SCzdZtmBcBD9/0aXx5ZOTQtG6S9QTDmPjjMW8yJF6GzZ+kh7PiLdPrb7Aj+45wHUtzRPrYttFDU
	nq6qCVX7YdbQx5OFr+KU81Y+prp0QRf3MMmfH7B9qr1KzW4un18q9T5xPxiy8AfIPrvdvGsWPaW
	GK8e4109ayq1hYievMmDKVleO+srwV0lR+BXfUJ82BoXJPckPLF5Dq+iTxyIjM2U1ltZ73KvKA/
	6F5HCoGF5xHRQSTFyw1DYV5iAQsGNH9eQcXnNx+ihAcCeJ561DmK7LFf2opN0CmVsDVURneMspu
	qj9ZlkASYqvQvOe7JIHefXlOQd79zmvNeGlFEnZ/gcB9dOmtlzy0EFEdyZSUFGzXcRG9FslwsuD
	uttHJZv12oLkzza7XSE6I0kdGInEQceP96GhCB9pg5Bc/udjmmBJ0Z/tqwVXeX3Q==
X-Received: by 2002:a05:6a20:db0c:b0:3a8:9dd:75d5 with SMTP id adf61e73a8af0-3b4ccf82cc8mr27997146637.24.1781090187424;
        Wed, 10 Jun 2026 04:16:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:db0c:b0:3a8:9dd:75d5 with SMTP id adf61e73a8af0-3b4ccf82cc8mr27997111637.24.1781090186922;
        Wed, 10 Jun 2026 04:16:26 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03498csm23896099a12.1.2026.06.10.04.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:16:26 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:46:08 +0530
Subject: [PATCH v3 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-pcie-phy-v3-1-334011b378d6@oss.qualcomm.com>
References: <20260610-pcie-phy-v3-0-334011b378d6@oss.qualcomm.com>
In-Reply-To: <20260610-pcie-phy-v3-0-334011b378d6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: ctwXTIpsT6ucLqLyLhLDsjEg3QkG62Xj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfX6cPtEngsP3bC
 6+4FHuVWjUBIRydisd2RTEJkwMxD13uEHcIfTgoUBK0S8w1exwL8KKFvlaWketdV/qRi0XsrM99
 4CZFpHSgsXtc/W+M+4m1FrUAW1NG81BrUS/TKYXTSJ9dLUvug0ERPyNX/ffsKBY8uE3OikHBRC2
 LoMWBpEmXuxaJuzUtISirn4zxMJ7ZpViNXjCe0DrPebF41ei766u2w1icudoSuUxd8mJjK+UrwE
 CLAHajkE/aqGEm5hP7ZYhy8GM9hEa2ehFVQJT2y1Fqjssqo6gUYn5Q91NsojKZzWVLXol7if0q3
 U+IMHa7IAsF9IyL2QHnoPIhrFmeOps5sjOPOvZNYRX7hftYJ0zQhZEqCc6mAn5kWLQK/VYaCuJQ
 o6PuNf34HCsSScVo4R71FgaZEPxsrl9qTIkQSz6mSgc3tRIxbPc8N/r5f8/1A7GAt3ggPaesKji
 fePyvrz4qDusrAC/umA==
X-Proofpoint-GUID: ctwXTIpsT6ucLqLyLhLDsjEg3QkG62Xj
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a29478c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EF49ANZLUTmcXe5zpi4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112419-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9F69668D01

Document the PCIe phys on the ipq5210 platform. The 2 lane phy uses the
ipq9574 as fallback. The single lane phy is documented separately.

The ipq5210 has one dual lane and one single lane PCIe phy.

The dual lane phy is similar to the dual lane phy present in ipq9574. Hence
qcom,ipq5210-qmp-gen3x2-pcie-phy is documented with ipq9574's dual lane phy
as fallback compatible.

The single lane phy (qcom,ipq5210-qmp-gen3x1-pcie-phy) is documented as
specific compatible.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..fc155ad5fa6d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,ipq5210-qmp-gen3x1-pcie-phy
           - qcom,ipq6018-qmp-pcie-phy
           - qcom,ipq8074-qmp-gen3-pcie-phy
           - qcom,ipq8074-qmp-pcie-phy
@@ -28,6 +29,7 @@ properties:
           - const: qcom,ipq9574-qmp-gen3x1-pcie-phy
       - items:
           - enum:
+              - qcom,ipq5210-qmp-gen3x2-pcie-phy
               - qcom,ipq5424-qmp-gen3x2-pcie-phy
           - const: qcom,ipq9574-qmp-gen3x2-pcie-phy
 

-- 
2.34.1


