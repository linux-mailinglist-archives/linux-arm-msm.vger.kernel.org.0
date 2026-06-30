Return-Path: <linux-arm-msm+bounces-115300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0RQOF1VsQ2raYAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:12:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A799E6E100A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:12:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aVnsTLTN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cg3aa4P0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115300-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115300-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BC0D3051D01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A2222F01;
	Tue, 30 Jun 2026 07:10:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AB43D6CCA
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:10:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803445; cv=none; b=QszNEfgNQSuErbki6I+eLUhSuFEQGjVv7Zf5gAYscosG2fqruScvJTqyteXN8LiGMrWymDGEMe8wbJZXfjEz1He8ypvzeU5pHHyN/xdzoKytvxUsB7JwFWBeKYnkOBpV/XjtznHfyYFetkHHGt2qiI8fOkPihVb+qofYBE4MHjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803445; c=relaxed/simple;
	bh=xbqD0Naz0L0Azlb4k8qH0Z+ErTFix8IoS6j4Nl1cyDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixqv7twCc6MbHrW6jozxKLfrq5ezNMmxK8t6cL71v1cnag244SDltmefvKDKvpttmRdOtf/2EoEcrOQwLLxL5jkqZa6c5Uo6+DCAjYLGF5faXXP/M8Puaany4Ca094/opIs7Np1rvpC9XtM8rAq+vH22eTeiCBWnQHLZdquSEiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVnsTLTN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cg3aa4P0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CLIE1087221
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vngmKRQr4Wk
	6smvdnu45klUl6Y50rCzQ0BqvywV+SqQ=; b=aVnsTLTNIe5hmC4xtVeCI8Z9+7b
	qY6mgWiVnkcyojjaQqqJmF1jxlsZWoBR+990JneOvb0Q7v+w0zUyl0bpqhBOKF9B
	OR9e64WAcdjg+g7qtw9Qh8JrXv7/Tc30ft+IetF1I1eOT2tCXjF5vxtmUJK5uqyd
	uz1XzAwRtvYPqJlaoGg69XDacdjp5R9eNXVPkk/eLzoLFqzT+uLFUjE4nWi4GIMt
	AUTWqLxxWKLV2AlIFI6RLaF6zrZVof5RGk46eID51dd9yB77RkR7MXwL5e6ep2M6
	c/Rn8l9vqbFNYl/cWn/dYm9gSji6lg1O3JgymmlAgxqM0PRkKeV2SkxGEuQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qhaccb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:10:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so18950161cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 00:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782803443; x=1783408243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vngmKRQr4Wk6smvdnu45klUl6Y50rCzQ0BqvywV+SqQ=;
        b=cg3aa4P0OQ35Od3FIXhhyhyeD88CicVv1h8Bi+gANaTdOibiJeQjWdoUsnyqpNjsLV
         oysR53cNqMVbNGJZSAeYaojRcdGdnCQNq758oTkA0/ioHlJpYON4cXDN20GRw30cgulA
         XuO+Osv7TYGjmiDnOkmUFEQaUJYOcx77ihhptulgO0kQP0tTHjWHB9nwQitI9hbAJ//9
         su2PjesJwupxZCJ7GgjBWGsNGXe2lUucCdkfHMj+782HHig21jiCPJ8OXKQt/bImruc4
         oZ/xh/cKvunYAR9U8xYgNkQFHj0hjR13OBU6REzY2wCGoq4WiOKscfNe5U+VjSbqEefs
         oCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803443; x=1783408243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vngmKRQr4Wk6smvdnu45klUl6Y50rCzQ0BqvywV+SqQ=;
        b=bg8doPALauouRTT4qC9v0g0yvFZteoaRfLXepkMMmymJk3rN0zWD/S9XRP/515y0k7
         UGN7boNMFFa/MQDsH/iTnDx1KegdsfvKsx/zNZ5QVk9U6qQwq2GcVWu2H23DpJ/R8F2W
         kG9WcdUCjsbVK+tqIPNOgwuEKb4P8iFf39B690LcLg1jSzXU4slpqSFR8PHGrE1QD/Vu
         8X88MfUcvX0poQi2L/gdP+Edc9mo9rpiUNMPEfGNYDOf3vqejQMKQluvDoIwXOTVJUo/
         9dOMcFXxngdbJd9HG9J1dTVTlfaOKJRPRQDNCZCLlVzBsdrcu0BoLD2rtBOiymEtT8nK
         2ARw==
X-Gm-Message-State: AOJu0YxrEMfJUCYv8jkkSUe+DosF125ppCDHo/vDdng4KMknDFdkqfUq
	GE4ChwJuVQWyh1zIARWy0+Kir7zywflDMXTt0tuFL2mIDEkQqDGhX89UykkIud8sCkoC1SjXTF4
	I581OqksuMRXsqhFpmQVM6/xZq0XVt6jOZJ4j5JWoH7O8bwUBIIhJebMyPNxTrwsDpizj
X-Gm-Gg: AfdE7ckTVFvSbxjlo7Xs9EuLACiNrE43nirHMfhqgL30sg07dr2HG1yCPmsMK4nEmpZ
	LUX9jz/kF9laegqqwV8vuPWl/5aB69MpNFd1Omrqd3EsK9Hn42BuxfDg5+/UoKRNKUuqw4svBGa
	6uc/mgLMJDeF3+3vyA8USZ9IIYZ96TR8cjRM5G9GZc3B2sDvkROe1jNzAL9fpYa9h58R8NvKTqY
	zx34/XQVccnIpyoeTKu1WlZZE1l4dZqxWFFLh5uomTkykX9d0epCJU3UTT/XYfjBJMmy0/6+gjn
	3uUNCbhJ6uWnIHQEIpdJN/rgXax0yUD8abxQfSm3qh0Q4JmsG8UEKQus2TiqEIim3Q5LU1CXKDE
	xZ70OSxTf1JuAnmfFMuuRc9MlswhilWhmicra+s5eehQufXnnFTkRqRSf3ZpBZmujEnCTtw==
X-Received: by 2002:ac8:7f4b:0:b0:517:307:4f1f with SMTP id d75a77b69052e-51c1086314amr32942651cf.44.1782803442990;
        Tue, 30 Jun 2026 00:10:42 -0700 (PDT)
X-Received: by 2002:ac8:7f4b:0:b0:517:307:4f1f with SMTP id d75a77b69052e-51c1086314amr32942351cf.44.1782803442523;
        Tue, 30 Jun 2026 00:10:42 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f19f770c41sm17471956d6.0.2026.06.30.00.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:10:42 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Document HAMOA-IOT-COME board
Date: Tue, 30 Jun 2026 15:10:11 +0800
Message-ID: <20260630071022.3256-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HZSKJOhsVLvfWwzJNvI6z1EwleDG5rIg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MCBTYWx0ZWRfX9iUW6re3q3b9
 Gb54RNWGR6grj30Gy7N/yIWAe4q7HjEtMQm0/IJDVmyj6IbTtvlVa028+Cuj2iTbOcKT3Ksumva
 1Yla0uktGfTjVU6xS0piSh/80EU8Q98pPm+baaXI1vGFYUqvDQbTlEU247aXkVDC5vl3DPVOzlS
 BPszFVUkmlhfRRr+9wzOHCksJPF2nFMFcDXg+FYusc2WBjJcWL+NIBPlU/rYIXh+uFRlzCW9w3n
 BsEgXvHbQjIWRap3SAn6lHJx5yQmEUbSrdkFJ0Q2yaHxrw/4QtU0u8JjC0Rhk1c2q9RH6UWq0P8
 Lz6hdYUEzRTBXP+MzHOqyUa4L+blE6dRXa+DjLKW1Mg6cQgkprV3YITPPJt6pXNBWB2XuWuUPKN
 homW3EsfVAHM3a2ZzYZ6xsBBCLr18/uC2UIV4/zGET3ZLTT9GlWtj5s1OJti6YoD60lLyKWvm5u
 B+eOmo0Vt8DFDxxD3gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MCBTYWx0ZWRfXwp4h1MpM5A4G
 vW7QPBeoNHohFevE4U2JgIe1YzUK10mG7HA3pcelKp4di8ROFARKcMbsnYhUj0YGZTG+Nz26z0i
 FJku846JjqH6y4U+NWcDlgGegFubrl8=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a436bf3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yCt0HePyoOPDUj6clFAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: HZSKJOhsVLvfWwzJNvI6z1EwleDG5rIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:yuanjie.yang@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115300-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A799E6E100A

Document the device tree binding for the HAMOA-IOT-COME board, which uses
the Qualcomm X1E80100 SoC.

The system consists of a SoM mounted on a carrier board. The HAMOA-IOT-COME
SoM integrates the core system, including a SiP that contains the SoC and
related components.

Hierarchy:

    Carrier Board
        -> SoM
            -> SiP
                -> SoC

The SiP on the HAMOA-IOT-COME SoM is equivalent to the HAMOA-IOT-EVK SoM.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..a487b9e8dfb9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1172,6 +1172,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,hamoa-iot-come
               - qcom,hamoa-iot-evk
           - const: qcom,hamoa-iot-som
           - const: qcom,x1e80100
-- 
2.43.0


