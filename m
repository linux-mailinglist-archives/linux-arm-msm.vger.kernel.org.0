Return-Path: <linux-arm-msm+bounces-116770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id biiWNvarS2o2YQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:21:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4813371131D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:21:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I5IQXplB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="g/pYXUAT";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116770-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116770-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 950043437ECB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47994229D1;
	Mon,  6 Jul 2026 11:32:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD9841DEC5
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:32:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337560; cv=none; b=p2urWqE/ITd+dcktsipYunLc4wXBgO3Ae8uD/ADDY9MEvq5Z4l2xXRoUZHU8RX9JELXHnVrXfn4/uvBY//0OxIj31dG2U8ftefa9QRvKZrMG8iUcNs7RqF4jGAkzh+y0RQCbryYk70bnxYfmZQxHd3ZnGl9XXKTX51GaT0GWpeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337560; c=relaxed/simple;
	bh=cAJA12cau20p7KLPFzYEIrSS6Dvfi3o2tA5fDVTUt8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4B17xYdLIEhW4SxKAUsFSuyK8ax4gP1WPzvJqkOAli2jW11OGY4KY1l7ritCdEwWEcVCAncXilPQBxiimbh/7yKuz6KBVhrzEhEFTDPVl0vJm1mtTxSP2TfbtE5uMOmST+cXfbZtnxvyhx9n9SJirw+o0h88chIT61wtJvecDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I5IQXplB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/pYXUAT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxPGu369534
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9s3aaO7TdbWU8wQVqIVUSSkTdkTZOTjFslg4CjFXd8=; b=I5IQXplBqJ+g4WvD
	3xBaHm3WYz+gjMJuVflFBf3Uzhhp+ZP7N5HgyS1J8+0beIOs8KN4pP/AaDIlz7p7
	mx0achNEF+v/zf50Yaf17n2/2+Z9b2+3JHAyYcNxs9csB7mAp+9rFlzK2CBtVR2U
	7IEtkJI2ScOmzzlPRkwE/IKZMBQw4sc+HwtTwrdpGkUeVmfljLNKRW7LXveV5kAq
	FYdToZ8QU5vLEDlb7T6fxUjklZCWI9DA3ao3k5dfnVZT9li0tv1KTSRaEJGKtS46
	d5uMH1x7JlgukHG4pOemzmVdwnVcCoYwC2Angzh5Kn4JycmuSrkGWRLA+w+CWOyk
	OG3OyQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h98ts5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:32:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847e32ef4caso4621697b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783337557; x=1783942357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9s3aaO7TdbWU8wQVqIVUSSkTdkTZOTjFslg4CjFXd8=;
        b=g/pYXUATlZKda2OR3Pl2/Lxwshw5IlQu3Z22BL54jyQ69fP2mlhqjHv0p6ChJlbB7m
         oVXZ3jWP9R4CMWptcWZG1VXPlQx0Y16J6SHUZq1E+S2xsHeGoOFbAAK7lo4+imIonaIv
         89i4wsU63tjgQJwUFLH/JTAYc+BFfVYsHfqZffroFZqQkMlRwdo6bytiJEGZ0fQXvdWD
         0DOxwIcGisWhoCfqPw1DUjYKyIho29fkYHeTWxpyOR1WcEwEYzn9mIJRYw13XBV1s6c5
         WEKEnbQOfJFKWXddWh4I/mehYgFGGsJyK+rnHvp3K2TbjDbIAXKQJMaG2BVD4gyrzMje
         hBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783337557; x=1783942357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q9s3aaO7TdbWU8wQVqIVUSSkTdkTZOTjFslg4CjFXd8=;
        b=OtxKSeWKSaMECeq5+OCAaCyWBmaSoHJc5QJDMglw3zlRWmQKzUx3NCLdnoyyr8HSkr
         Y0A72Cdy35kftsDm7KuSUJEU15LK39vONEiDhK5b/JLq83ZuOR8ynenoMVM+o5n0yHm5
         lmd05i4q8NbhuGg/E0hEoepsC3CI8K9IXSbLUNzvnFkChrmi/OUgtQVbC5ZRrJeLkMIz
         a+xz1zlCOaX4LEyS8+7H2rYQiaNR0GEe9q2W6/0pPVP6n74e9lKtBRh1ISaoFZr529AZ
         A+sdHKvNU1nMCChKfJ6rbBN7tbcRSkVnON0E9nOr7IzpfdIo4LbTywH4W/eOCZXyLNNE
         KfBA==
X-Forwarded-Encrypted: i=1; AHgh+Ro26n0RnUo0RoKms7XQadmfU5NdtAXIbLGxVqUhAJGAQOG/Yku9tClQLnKH+R/XkHZq+759VDOFFfdPdo9/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqf9Kj4mPgixG7fWeP0MxqlW2zmZjZu0KHOMlbwRRqEdKt0dnd
	9Da/rXi7VHmvYFIVthWVZ39sdKq/W8vfcXsDQVgCL0+n6PbZxf2+XYUzkinyQI6UG4ArK4eVpem
	Y4qvr87MpxtS2JVLaSEbJgMxNQzyp/M3EIgdjtu/eRnxQhyylAt8ZQwXHBB6NkRP3j3Ou
X-Gm-Gg: AfdE7cnLKtv4hKvBJpnBrEwW11uKrphrB473i9qjx0/35bZZhozPQY8nxi7PmXGEtnP
	RyDGoaWuaifKwjJmpyVoSe7sMzt6XJnzBoGlwaVPgFXom7Hm2ZCjA1Chh07wFDTcSiZm32hM/+/
	NY+I4Q8qADaqS3NC1BeNuZE3ndUW282pDKd31wFCTVkpk6ehzYSBAtW0lEsCmB89KxHumh0iPcQ
	z/BUAL79jNyQOcUuX8XZrd5BD+kdUzePSUKFYJ8Q/jeHAMIlyBp+xASPau49nUTU3YbrmX1dami
	q6Qlc7klpz65zTQujWXahjlfP+gl6hpuZRsq5Ul12nDIbwd5SZ7MdC7CY5fZIyEhslDEji0JOyk
	gftKnMFNcwviSCZ/U2kR3FVw7vrHj73Hw2518TrwJ8weY
X-Received: by 2002:a05:6a00:1493:b0:847:80f5:c616 with SMTP id d2e1a72fcca58-84826bb45eamr152692b3a.10.1783337557255;
        Mon, 06 Jul 2026 04:32:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:1493:b0:847:80f5:c616 with SMTP id d2e1a72fcca58-84826bb45eamr152613b3a.10.1783337556043;
        Mon, 06 Jul 2026 04:32:36 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbdc8dsm3576621b3a.55.2026.07.06.04.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:32:35 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:01:33 +0530
Subject: [PATCH v3 5/6] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to 7
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-b4-shikra_crypto_changse-v3-5-23b4c2054227@oss.qualcomm.com>
References: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
In-Reply-To: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: IqGvZdJ9tnisMZWvsaWfK0a85pXNGyA9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfXyU0ADLr61eA4
 b7CY3MaOH4g4xRzhcUggA4yTUK9jHVA7lIaXSCoVMbg1B+2waz8FjH0A6mPxebznNijmnp24a7+
 GQestQhXbANDXmxSO1Tavniv45EynjA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX+jaQTN37bHKG
 eBXN1Yny/m3Wmm2abWwYxZLJHCeVNa+ovk0euQ2qz+7O/MOBKNDlcaCeJZ0oguFJjbCUuEMG3QR
 TA+Jp4Hi3/6Je9yvrGWowX8woeygfuIhioRQNf5KXijWunO28Rh6zw6/LzNGrsd/9jhxR4nzCmG
 RhQIFNbNXRRBKWUsxqW3HEBzkrcfmfJbAP/5I9O/qcdgzvQy/DTHEViRcJxJCiFIDPQqUSUUwFs
 2xwcy46A03s94ljl2jwTSUhTyTGoMes3j67IiC1r8uDDsDGbEmVm38h9Q+/PTh3CHo8IJ8eYqGL
 PRhdPmWLiNXfe+MHqK3O5NKSS4gNTxsD+y6+StcB7lpFyletXQa1TyjmEpwUkC5helIYz7/Ip2p
 /ulX4V/RLUGjQkNHYTxEWNRsAFp9tqasrgZ1Ypx5rMLBdMeMLD224engGxwsg/ni7q+3H/O9f4M
 j9D6P8oLGAqXNFjt7YQ==
X-Proofpoint-GUID: IqGvZdJ9tnisMZWvsaWfK0a85pXNGyA9
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4b9256 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=56hBLZIh0n9IShKQQEcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116770-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4813371131D

Qualcomm Shikra platform describes the BAM DMA node with 7 iommus
entries. The current schema limit to 6, so update the binding to allow
up to 7 entries.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 0923fb189ada..e72adc172af1 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -48,7 +48,7 @@ properties:
 
   iommus:
     minItems: 1
-    maxItems: 6
+    maxItems: 7
 
   num-channels:
     $ref: /schemas/types.yaml#/definitions/uint32

-- 
2.34.1


