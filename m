Return-Path: <linux-arm-msm+bounces-109095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFO+F6AOD2qoEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:54:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E598F5A674E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E92303052724
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF7B3EA95C;
	Thu, 21 May 2026 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iiytZrnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jred1Qy/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055843D75AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369511; cv=none; b=O73qITRV+HDfnIAVkWJ/XhURPLvgmBarVtJVDZl0rwQ5zTiLB9cYGxHV0kqOQkgGzaoai9g3XcEh14YM6SKCcegh2Tig2WwLcAp/chXs0aIhsRej2PRgN9bl+sZS4Mu4j1baKM56t04dkqVHf/6+976etdRi1Zs1mywlhXlOW14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369511; c=relaxed/simple;
	bh=9DP4WFKs+knnsj8ZwN72mVO6jMAGtfHXV3DJ3PDB7UM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=POBbDRaPK3Ky/IKXCl+lk0RJCVfsHERe+FBhF6ytSw4dygZNjfGhs5Vaql4arofTVGGhThxs0pe44BRQZ6YkdUP8+2o8zYISHE5mRoD+6nvjI4FePMbR4IRCHLth//yHGW9sT1huPTrwuGnS7bsYldDk5Ov38EeVJTk2eGqS7qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iiytZrnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jred1Qy/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A15W3773115
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qft0FFiZAPIrfw/5RUm0iFHVPnU1lPS4nRA9O8uAxwk=; b=iiytZrnVOPfSTJQd
	PDAaog2NriTLs9XGkmIrDfo6YuTislvWrv7S2lzZ0N2kGCoGyDlyE0jjy1wd5dMM
	KDOegblQw1R4jSmTBidtUd6E1tn/4/IrN+72c5/hQJacT7d6OLITCW7t666Q1mby
	Q54RANrcDKSLJ5S4Nh9s+xdEDKbGeBYfO1f8YEShPYR8o16FRDqKoCuNBWzg1rq8
	YekZvsMEt3+Q09ES3sT78g2hbzwgAVfYFeAc+i8pbDVOD02lNSXseN2v0poF+fGD
	hfHbQS/vpFt2F6uf02k0Pq7+/TAXmTqBdGhStViSHykAm2niS3IyOq4KPkObYCrT
	pz00iA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma43bra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:18:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8281d4cef8so2829946a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369508; x=1779974308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qft0FFiZAPIrfw/5RUm0iFHVPnU1lPS4nRA9O8uAxwk=;
        b=Jred1Qy/Tc8FApe3ZHcOwJYrXSsKIe2vIfUAwohskHXE4uyhIf/mPUsr0HhN/Gg/Ro
         fCVPEs/8WJstzaJDQkm0XRw9hcSzDWYJi9Rv6c+EAdUWtM+z9iWUPUtekJcogKnsc49S
         WSQeEldI8r4hGz6NNknvJ0MfGufPmryY+GLRziTf4QAgy2X28dsIdEbXgCdZeOxiR/TA
         LqQ9g1Dm5DWIR9mreJjfKJvjmGip1l7ROfS/FMiqx89tcQFXUfWCdM7j5w0R2iI+hCx6
         hROzXaHnBzOiC/tlNP6KMsBKZfvakubsyCZc4kBxwhSkAb71eTL7bfxSq+D8Q9hTxWvo
         54Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369508; x=1779974308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qft0FFiZAPIrfw/5RUm0iFHVPnU1lPS4nRA9O8uAxwk=;
        b=Cx9FM7gjj2GG2Z9oqhyG2vTnDEo7fZ38wwT9vYB9aXHF/ruZt2fpYjBHxDFN0dcgJ9
         WsL9WzERqb1wLnUDFvo5wCTQhlgbQDcOMIX3Eayc9qVTtSoZ8srHi+9zMv7D3EsuYES+
         94UNGV7G1kCMixS6hXcMBdtDqGayyEYu97wOsWApjX6jpG4QM4ywCi/6nKwgXFljXNSz
         QpFhOItkV2kbf61gZFcpLpdCDHqInHUvexHrZLlEzVWz1g794hyxodhrsWB9zcJSqXp3
         kawdX/v0+lkv3wbntohHIexFAPa3n5+1QBHzXh1RghwiTA5DftIsiGnVweBQT0W0SZ13
         ma3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/cjex7yehd1wDgYQxOxM7B6yg8xa0UZkioNmMCjNGDOySAnnvs8w6gSVozY4ZB7KH545ex5oExHsNH3cnh@vger.kernel.org
X-Gm-Message-State: AOJu0YzwentwMuMsAV9UAL7mEcSQUlfNqivjjlrEdNN+xnCEFi44TBA8
	vlfEOgJUxBlqoMiz2DojqU34sM1cuxKurU15qagU6OaDVDjwe1eA/sX6PEPtufn4MvTo/lrGtA5
	zfV7w5N0Z2YS71v3WabM0Q8MhMwtBD95xbTRwqgdHjrbgsHJAlt9TeZ820c81SJu//fLa
X-Gm-Gg: Acq92OEkoVQNT1iWNn6VDHHj3qIGnwJxZkNyc3W0A6sn49tnDCBLk+byLfbEl7WhFcj
	VGTJtHjH/wWrFMCZuOdk4ItoqItLGJV2k1lQSH2lUHQI+crQKgTpYj/KIp/F5iYBzmpA66OFBg3
	Tk7ilFqyN8hazLfA4le/y5e7DICHKMslJWD2k3nECux0U7G/d3QlFYpSkzhAt/SMZRAFekOgPUZ
	/z6f+XSOzuSpVuND/7OWiNPedKq+rPO3/tssJyn81KjYfdIy8bfW7jpmqmAJUDLokDrbrBM4tzi
	SHuiI4EZVoxJQy1KnyasqNGbTXBs6kP802l3Hz3mrHxItjBxF4zPTj91+5xzz8T0FhmIKVpwEsW
	/TdIJonfRLNKRvfgZ8IMCtWbNUKegzKIeHc3byC42gwR85j8RJ1gv+gA=
X-Received: by 2002:a05:6a20:4307:b0:3a2:d79c:416c with SMTP id adf61e73a8af0-3b30874bfcamr3376064637.32.1779369508318;
        Thu, 21 May 2026 06:18:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:4307:b0:3a2:d79c:416c with SMTP id adf61e73a8af0-3b30874bfcamr3376003637.32.1779369507771;
        Thu, 21 May 2026 06:18:27 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e22f1esm1687731b3a.47.2026.05.21.06.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:18:27 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:47:11 +0530
Subject: [PATCH 4/5] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra_crypto_changse-v1-4-0154cc9cc0de@oss.qualcomm.com>
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
In-Reply-To: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0f0625 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Pn01LGb3GYlZyOwDGgsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: VTs_bCV6g2zfVOC-qq_9ci27jFmSmR1Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMiBTYWx0ZWRfXyy7j747px8A8
 6PahT35/O3JDbzwmmP2vcFv5bcqtnIhew5Zoo6uh56oc5hAk3qsR5mZSd4wqElQ5GY/Txu0W8sf
 cTg9FkVORXNYrtVWup3fdpnQ3jCv5WcZtLReSy2nlq5I9cLB3hS1WNbK3buwnEGR04etkZ5T0SV
 aP1WfvJAX+ygalt/ejGghsBlXE6/iMWaHC00WrYwzCFTXc+Y5iaISHtk/oXYJZ6NDQTKoIVDA0y
 sv89rUWwUm+MqeUp1HE7cmzw3SBLOhC/uzSb2MUhuYvqJiAOgFxKqx0LToI3QF3hWdkEpioa+XG
 zpk85Ox1D4OoAY3oSYdPp7D0JxHKpjQYcR1DbFRfg5i1rA2EBgdsqmNEtEYlTKrFlzVEOFi/YkR
 6L5KXQNyselDtFCD55/AWW4knfLKhZXWUSQri7yTqZ4xdt/cTWWpm4c+3G/xGeUQ8sVCX562wTp
 mciogZ2+MI275HcD87w==
X-Proofpoint-ORIG-GUID: VTs_bCV6g2zfVOC-qq_9ci27jFmSmR1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210132
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109095-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E598F5A674E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Shikra bam dma engine support 7 iommu entries and not 6.
Increase maxItems property for iommus to pass dtbs_check errors.

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


