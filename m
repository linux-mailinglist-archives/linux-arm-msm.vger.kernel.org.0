Return-Path: <linux-arm-msm+bounces-106569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DSgHxJs/Wm+dwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 06:52:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 304114F1BC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 06:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD08A300ED81
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 04:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A9A33263B;
	Fri,  8 May 2026 04:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFJWA3Up";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFnq/31o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6BD21254B
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 04:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778215940; cv=none; b=I9RQnIbzVfXlgMtQ2zwMAahOj2gXRLFfkvp5IdaUmNVG90/54kFgSuJlvwU+obqNFwMyTIxa8KI//ptSl3aiVs5MSEZzcMHplM/5B1L0NNr56DIP4pW0AzUrmzw45ZQu/B1y51mO0e3gia6/5jN3YR7sqhdw/F/tcdNvWogVYM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778215940; c=relaxed/simple;
	bh=Qt2kstaKGrB1yY49mZjobtR/4AMzw9aIfR3UkFARmBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShrOAxV/tL/lPjsC4EKJ7SWMH6/wSL1TBp2K8O+8l8RGR6kJSpsRI7umhxdLzRBleNL5tJV3RDaGq1cO7NIrwVYqPpY5AmoEfuMR3b3GekXdfRP+AZxkYYgLGaX5Y+MZlqSI01ThL+/g4gv5J5RLzYl4WY9KclQIjBpWO5yQf/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFJWA3Up; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFnq/31o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647LZMxK4069381
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 04:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=; b=eFJWA3UpOLFMPxJ4
	Ir8qOLBkORFa/zuVlFVa3FbokTkmRKb5qv1IlGANc5z93pBG5snwJH/a7hr24Wlh
	6E1obx3RrPmkbSDhejKuGrga01HV80AtCtFhCAGv+Phu+L0hkjuOlOANNce8oWqR
	rWbRlb0YZ7c5AeRqRe9INLOyrKActikLz8xGVofebTjXrOJkWQFcCQ3Dj+LMH+0v
	kNK/pSF5bOWBygHVAF7uK3gD7H7Pl9eo9I2+WZESaZYrmf9fqisKdl2s6+lY46OG
	7DDItYB85CB8yeah9sW3+66wJ+vZs+kCbzZKlMA2X9hIRq3sQ83anYQv4E+h+oU7
	0ufEZA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp1746-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:52:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so916485a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 21:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778215938; x=1778820738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=hFnq/31ocPVInswoBBoHTBT1/6107Tdb5+9T9vcX1eUlM/nolJcNBBENRysg1jWXwG
         mZyi1bfz8LEEUZGDQxWLQumasR2MUR70Xp7soHZ90lXNCAjSgDVYBLDrPIlPMP0yjBsQ
         HiTXb0Z4qj+eUQmnPmjfybyZXS2FCuOtvk3gZ5MWf8JSoa/ZWgPNNdkiEOt/I5Fu0Kwv
         kVQQ2+PX2sIReylV7WPScRU2XVDWoTYOVOBalzIhg6hGR9y1kHPoldLhWD8TFpQNPbwJ
         L/5+cUyTKSjK4z8XlFOvXj77CTZC7gh6+w03NKitscnYj/QKhQunpzUYqvqJUtx1rhQk
         AW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778215938; x=1778820738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=DMwTw8zIaP6Zo/h+izH3WM6/H2q5hnmoq/yCVg0XHpDoS7LeMYjXogfh7sBBMGivZX
         Bj5frhkSdAP3VLl4j8gTDMipcyd7CvQu8xInN1CX9RxA+aryHXgYTwS/Hf9hO43qjKFF
         SEdeNQ6xHHoSnSf/93n0fd9W8ybnWZXErpxXvxgR3gPPorx1oocc7JQDQb676mQzIWkE
         8oO+PSGXTobdLjypXIhm2TSpFMmvuXrvkg1g7JuCCgxVmAY3HCKjPjljXwZ/4e2DS6vc
         2wuN1H+Z1UfVGvxhaHiQ258x3N8CyoKkW8tH7TckwG/ikY0Bh1Ol+uq/xBwEDa2ns1RD
         E8rA==
X-Forwarded-Encrypted: i=1; AFNElJ+JDgrJULZiK1QX1M58RPCQDDGzby0IBgYugCGJt4nL2JVQ5wik6aWvSn2Z5nU3CUzLX83FcZzfN4tm8ffN@vger.kernel.org
X-Gm-Message-State: AOJu0YxnF4fBjIlwI0oTfcv5Oz5sVmDCzehrjELzkpKJgUqNZrS7wxJH
	5IJLSM/QBBZmbfT5kT1pQnKM2RpQr8iTv1JqquWlszOm5Lfc45RtiecoTe3FE2lR1jHZdTGrIHj
	htOVcSEaUIudx577HPfVN/cYDrMTpaGPEtYZZbZIM1y6f0aTGnvzSdHLX9v2oKef9zsd+
X-Gm-Gg: Acq92OEKbQl0kJAHwCwWWvMC0rwL1a1fg3dls0US6IAZ4GjzeAMQ0T4es1630eRqupb
	qDmptVjcIexahYDJhSzZ/cKw2YaeKWVYRTtRNd9D8ezM7lUzUWu32qGTXpKO1+q47fbCZMr4+7F
	CNqAqZjKAW3JeK9Xq0HOJ+Y04BahGcKZhoFR43Ey4MoCLRWNDLPnad0aDu0/Pjmjrixe/E29zmg
	U7DvXKxExObA2vhQOTE41FC9pTopSrh729CUOGlrV/g1Lwr0/+Ccw3WnerdP4fyfHonCccQzGaH
	npF14j2IDCegSu9RA+koGOLuc89V+EsF7wVVEz0KQz53WOvhP4l98cxcJTwn7d8fGQZsMZSlFvp
	vRHdsB4i5lzq0PdiN85iLFr/I/YjNrjsOZ2c/TFeqtu+Td4gaaKTm
X-Received: by 2002:a17:90a:d004:b0:35b:e4f8:7cc5 with SMTP id 98e67ed59e1d1-365acb88347mr11126696a91.25.1778215938262;
        Thu, 07 May 2026 21:52:18 -0700 (PDT)
X-Received: by 2002:a17:90a:d004:b0:35b:e4f8:7cc5 with SMTP id 98e67ed59e1d1-365acb88347mr11126674a91.25.1778215937779;
        Thu, 07 May 2026 21:52:17 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36645bb9c02sm556076a91.1.2026.05.07.21.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 21:52:17 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 08 May 2026 10:21:50 +0530
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra
 SoC RPMCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra-gcc-rpmcc-clks-v2-1-83238ba24060@oss.qualcomm.com>
References: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
In-Reply-To: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA0NSBTYWx0ZWRfX0fGFwDjPlQ9G
 fg3x8XuB8YFJJwTAZJjT6TzA9TeTzGs4c9GVTrkP11LALCGz9tA86ec/iG+vOpeH1F/zYjBKKkJ
 mCnCfme+Y53WUqDjJgiEeB7RQtwDgpejreJ5CpTpcUK3H+oJAKkpQ8PAia1Hwi84sGF7TTB9c4h
 qt1FUh/tPy6n8XLqS05ReDuLY0ueUQmQM5w4wfCH7VJGTms/Y1AhPqUKIv7OeAxgybB6l9QM8ac
 SpmLhkb07n9aTuF9rGDCAYvcxHyI4MclGkgMv5MP+SMRg/I/A7ItLLRef96ref4CHoQemp5m8zu
 d9mXfiLtDtIVJUgFdK5FJM3qlVnIwBrpkrE+SDAH6BtLPJcJN0/UGLAVtoaOE0cxpbgTf0hoL2J
 zFxjqGmo3mwvEx/MBMAtQiGOzQWA34EQPZTT5AAtQCK1D3pZan8LLY/oRXkmGo4BxXK1OllVw2Q
 ZPd4OYiQnrbRSfFuNdw==
X-Proofpoint-ORIG-GUID: o1pcvOdoSlNCx1eJpnKIEVwLMGpqJDNF
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fd6c02 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5MG6tTDo7b5tcJehnegA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: o1pcvOdoSlNCx1eJpnKIEVwLMGpqJDNF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080045
X-Rspamd-Queue-Id: 304114F1BC7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106569-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add bindings documentation for RPM clock controller on Qualcomm Shikra SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..b8aea98b00bc22c4ab6da1e6235ad676f200b44e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -46,6 +46,7 @@ properties:
           - qcom,rpmcc-qcs404
           - qcom,rpmcc-sdm429
           - qcom,rpmcc-sdm660
+          - qcom,rpmcc-shikra
           - qcom,rpmcc-sm6115
           - qcom,rpmcc-sm6125
           - qcom,rpmcc-sm6375
@@ -126,6 +127,7 @@ allOf:
               - qcom,rpmcc-qcs404
               - qcom,rpmcc-sdm429
               - qcom,rpmcc-sdm660
+              - qcom,rpmcc-shikra
               - qcom,rpmcc-sm6115
               - qcom,rpmcc-sm6125
 

-- 
2.34.1


