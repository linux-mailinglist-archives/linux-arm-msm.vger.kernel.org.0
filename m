Return-Path: <linux-arm-msm+bounces-109713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCzKEBksFWpITQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:14:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC38A5D0C3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B33513015CB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5497030BBB8;
	Tue, 26 May 2026 05:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgA8UMmf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fTs1Cy/+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB1939AD33
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779772410; cv=none; b=iLq5qw2fb8NpaN/2MidVEtPS9s44cDkFYekUfbAv4zH324Bm0qblnBRhEkHR+PH788e9VfBdbuqOiIumZPkLDeR+PdeUbWsCCsym9rOxoxjlomYjUS+NC7Lx6akWTw8KaVF85ezNzDLKcQ3SM8C7pBo7W2xs6+vZFmh/whrF+JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779772410; c=relaxed/simple;
	bh=XZdAZaAtQcyYAGB3DQOfoExEp6vD9CjO1J15n1KZgCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzqxpI4Ay90kEWaBAToWhbri5DVX07GfV/cUNbc7PlPz2ihMDpm4qBuLSUBhFEfPXqj2kqt2zLvUb+q5XGsoGiZTLH7NWovY60BJ6qufXI2cXIfC7Q0DO3wDknJnEhP4hespp+fvGRDQQWFpgq0tWHmfq5PjlvbH3OAmMA2Byik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgA8UMmf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTs1Cy/+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PJHOjM2146247
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hKpCmYx1/VB
	9NuoIJY/HWjKO8WwtobMzOCh7XtUICjM=; b=LgA8UMmfL9/sv0VCOAl/QrYWTaG
	zq3N26UZ1anXfl+EObetK+QX6a17omhYFCUbfoeOx6IemhdT6ddIBclB83M8N/hX
	pwRrl48PJU+yUs9/AFp53Ru1mKwYkp/T5MDLmU+MydSpj/rwwzGgN9Et5n++ulFZ
	R9XxYCweYy4gLvkmKSdeJEtjhqe+JTHMdLymFZqKr7Wl68NVbyxnLT2wFAXZkOcM
	NZ5JNJjo2Ig9sBwkIG9lZnz4aieAjdsTgh38F6apbU9o1eN82OzUxOFjYffaDcon
	SK1rv1NsGryo447B1HqvzpcZSf6zGryXvZCdEgIiPxVLr6nLOysYsx7Q/9w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv2y6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:13:28 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13312be8a31so1640354c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 22:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779772407; x=1780377207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKpCmYx1/VB9NuoIJY/HWjKO8WwtobMzOCh7XtUICjM=;
        b=fTs1Cy/+fO/f8zbhMxVweDd6g4X5/Dg9stQfX8JNLgCM3xSY49P0PKHxARzPbtftEg
         oTMOGzlb1Jii50pLYmuzz342tDLW3wKpdhkMu3nns8UPUe5jI3a9eqC5g9BFLvwfs35O
         cORBoTuzCMwK8M5ofXScKHNX+sjVdBh1jRiP46e3ntaNMAELiEal4P6KAXQmwgfVIL+k
         F/k0Sl861thIVMBKWN3ure/dJOlrrjXiIyitlxkOkiaE72VbbJBzd6W6F6QzncHoF45M
         AwHomWTi0X0TDk39AFTCz/ZH/NbqKX3Ln2pKo7dh1drDXqqlxb3pIol2LAH8Kmkl3MRy
         lUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779772407; x=1780377207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hKpCmYx1/VB9NuoIJY/HWjKO8WwtobMzOCh7XtUICjM=;
        b=kFMC7agSKmA4gplSe3FUOmHZwWvM2Wit/yeDoFEysCAUBWxhKz+PtxwUVP7/uy+Apk
         RSaiyUXURvNjOe+xTcGcntIk1G9UZwV0sTJ34YUolCFeogAwosyRxtJmBtO+QpGEZKyE
         A1KNluM4R6pTHOHLYfIYr3wu34c0JyDzWE0R1L7UBoA0ozSlZIIcDwRLmWklrm/EDraL
         mLt9iXsKYfNE3/cgBXCPBqs+xKbyvZwEUNan1XR15UwdN922rQxknEViUJIrNrPRAv7v
         zVImnktF+U7f6ZYyCYqWERQAMaV0M9h8+A6I9dL4sdCVzONTkoAX6skviSIaKILtcCA0
         BLmA==
X-Forwarded-Encrypted: i=1; AFNElJ/eyzg0f5HEznpWugZ7UovrDlhiRvBMk2TfIx6ymZ823ep9Xuu1fwYB9oTACg1Tn52yPQwhqlHxhSF6uKVK@vger.kernel.org
X-Gm-Message-State: AOJu0YzU1egqdh7vrsWwduD66E/3Ec6c419WgeZrZmdbl20ZOnCrwanN
	XmqWHTVTKAvPk+8Hjc6m23TC+JCFxi1GpLJA6QUPlfLS2Of6exuA1S8uz2WuDCsV565kBrjtQ1/
	mYgdmuGvy63zXiCuVQ1wTE+oTsbTbbmJEEJpvh9nq0o4Ce0Gv0w32LTjWirBRUhUsUxz9
X-Gm-Gg: Acq92OFl6EvwPxuUKPtRrIdamXwnQnvnHuOqKi2cCuEuWl7Rwv9xPQOhtlOLQHIITmV
	wpiKtsekU6AkKOnTjQ8XyqzBOZnQqlTr5xN7Hby8/6k1kxiFYyEdd5SY9Vld3Qy8i+bISN4qgWV
	J6xXkWA3p/vRupNiX1KlSikBxPTu1FjjfNvYMu3GFuz9mv0riCtZGMM7g5tlmOnnc5r+yx7GtKl
	7lyJnyso3cxrDvb7S3lgGtUXLcom9P78NxtG5b0LXbSk9W5C/keYRP7llwV71dLHL/BvH4eC3sk
	1u/iflK0OkuMrOrxOXRYXsbMACr5fM4OeHlJKw0htBq0+Ik6DOJkDI9730PzGJ0kRaD6IswVlii
	D9mm4gQ65LN5fMugWXbUQN2ZcYm3t+vIdkWDWyuM5wRhciilbkqW2MaGhutxSC9IQ/e2E2Y32ry
	l6efTeCA==
X-Received: by 2002:a05:701b:2914:b0:136:8957:a669 with SMTP id a92af1059eb24-1368957abf3mr2628233c88.0.1779772407469;
        Mon, 25 May 2026 22:13:27 -0700 (PDT)
X-Received: by 2002:a05:701b:2914:b0:136:8957:a669 with SMTP id a92af1059eb24-1368957abf3mr2628227c88.0.1779772406843;
        Mon, 25 May 2026 22:13:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-136b3706ad6sm5423053c88.13.2026.05.25.22.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:13:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 RESEND 1/5] dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
Date: Tue, 26 May 2026 13:12:56 +0800
Message-ID: <20260526051300.1669201-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0MiBTYWx0ZWRfX4egsCRbQXPYO
 aN0B7H4dt1OiDmfcSzZEO1GSB0ZHXhPzMw13l7pxjOaHEcd31496ZAT+ZprUf0iTKyddPzLnHbw
 ri94ZFNkVDf/i0j+awrZTT8p/BaIwcLTmDFqqA3KrZ6PCOjiIBD805inXFasOGEysaljLq0bCbA
 cv+LqyB/L87UE4VVs2s/Q/gw1faiivXn33DXRabNLwJyaXx8cTnO0grFK5k3jvSUweEeTPjtScE
 7dflFghoYWxqu7g9yjAyjh6y+gWTt9r8dnvpQDZAC8Dp4ZZaqnYnw+cAzRvJoL/pFXPhePdMPGy
 RZOqL6nqJ80DWJUrp2NMBFJAgwzisgxxZ2rh+dNOngh2viyQ5w4fjkVAnbxDs/VQqPix6ZEw1sS
 xFYWDDHYDfBlvLBDN+52BNn3Yq1+zSLEWdSLB7sPRiNPzDSV4NAXXi0v8WbjVDt8fha17XCosmz
 GGWyYWytScT5gyLoB0A==
X-Proofpoint-GUID: 1y3oP_Rs1VklHVz-MX68iCQXWV68aZK2
X-Proofpoint-ORIG-GUID: 1y3oP_Rs1VklHVz-MX68iCQXWV68aZK2
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a152bf8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=qu0NaVmkdm94GxaCK5wA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260042
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109713-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC38A5D0C3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ccb6b8dd8e11..c497528826a4 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,eliza-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
+          - qcom,nord-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
@@ -62,6 +63,7 @@ allOf:
             enum:
               - qcom,eliza-inline-crypto-engine
               - qcom,milos-inline-crypto-engine
+              - qcom,nord-inline-crypto-engine
 
     then:
       required:
-- 
2.43.0


