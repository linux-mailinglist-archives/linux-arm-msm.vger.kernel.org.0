Return-Path: <linux-arm-msm+bounces-116769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bYcTFwesS2o6YQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:22:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA484711328
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:22:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bNRM9b93;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BgsHo8vU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116769-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116769-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 261C03415771
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412E3442100;
	Mon,  6 Jul 2026 11:32:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54A141D4E7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:32:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337553; cv=none; b=By3JOVV6tPZKzHVoKvGJGQcbW4iUni5CZRukRp8OvoTuMOK/2cXMuUkNadFelbW6+zEZURfnUrzbnTlT3SqPSkUhwaJNzyyu1kpqo+b/MmLX+9bYxmhQS8Ru+R3yDa73ksh9tCr3Pq2Kh+/OJ1RqcaJ+OZvDDR18G+DStdj/Rtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337553; c=relaxed/simple;
	bh=zjzyQGqtQEvToFUvVoo7pZ24KQzxayJOTmTLKhS4AOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bv860PxCa2JV//gp+X8EAYt5egMS/Qg1KZgY0HCIJxscTQjqG2iBLcRpOg7RNyZHGX7N+8fheHZuRZUIDK1nThGzbKeEzrmvheMRwRTjKvs6X0a3dQnPQ4LpCadOD2o7IOilECBnYby7x2ROt5MI1Pi2Mymg6imZfx/4KkluPgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNRM9b93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BgsHo8vU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax9sB391062
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7SkMYn1pW8LZr6abBIJ2z33PKYxNNOhX0ZIHoUiS7dk=; b=bNRM9b93C2KoANL5
	Fk6+1X7sDHXqIMPZliAznbS4iL327Fmj4JPnVK1roSk874A8RUVwRab+OugbudZJ
	dHZzZUEPKGlfSrT8+RPR4FaRF/+DNoShXcYrekfr73fqrAAwdwv4oymsMU5wUa6N
	iKNnDbofO1GGfC5EVRDrsYBELG7UmIcxgspDndwkgVJcM1w8ELleBZm965P6DpMk
	ViBEGiUV3Ho11W3dAi1WLENHYrzd9pcpvPptYFaHmSnImTygKH6F4oa4F1M6jNyT
	HKejU7bWF3H58ajYFJ+EL9xS2RNcAIbF1RwG8DqgzukjM9NybTFiLf6jBwzgTi24
	PSq2KA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrggk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:32:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8479c6c6cbeso2688813b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783337551; x=1783942351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SkMYn1pW8LZr6abBIJ2z33PKYxNNOhX0ZIHoUiS7dk=;
        b=BgsHo8vUJTjtwlowhC2zqO10pAmxq0btNYDrRwdJ+/hK93kTZ+hoNczaXm4+FF3QAv
         I0iUOVKe3k+GhSB2hrJvDnhdCXyRcxfpKKhUbGXDdh1En9kuqUgHL0AJoEJYTz4Qjc8Z
         YgfuMaqxy53SyCVGP2wTkbMV0M4nQ9qy+VtcTfJH/ugrm7isQiziEI61Saci4kUxD++Y
         yw0q4Dely9vNGXL7E2OFeRveCmCtHH4oqwgE9nj5eDRcCbGfwVyz//NOlBBNDkNjIPCg
         EhEE1HuBYB0sHu069ZoiQSgXOkzQcuupyLs6r5osk9NLICSiw5H7/F4XoKvK4AYg6swj
         HOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783337551; x=1783942351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7SkMYn1pW8LZr6abBIJ2z33PKYxNNOhX0ZIHoUiS7dk=;
        b=D7cv3rNCFVsEq1+Na8NIkK0Q7cyCScJc0//0NEsEys9hqOCi35gRw1leirmJaeK3ot
         yNLkjgxUeh7kWwGfT1i5Zwhffe6ej4Xba98PrJDDhTK8QO4AaJ+xr2BRCCG/a+o9SD4m
         F8+JCXmNcVy2uD2v+l9fwt7ApOQmXhUQoSpJXIW9eF8Jn0cPTxW/CztBgosqz69r+dwE
         enlupkIg1gK88IHaVuOP3F5V41a7t+gWNip6DLL9AP5uz0Z+AiWI+TVTGt9TCX+KHh3C
         il8sowvtxvu0EVtpSaXQX2KDgrSnNfCOVS12GGDz92w6dqs3ftGboUaRXe+ezsQO8Vfv
         gXtA==
X-Forwarded-Encrypted: i=1; AHgh+RqDElX9L5Jaqw6sikiQ4bmDG2PwUfMci19tU7aTcb7a+8Lv/KG1wpnZXYAaC1YO67lERmWMluX65y8fo2Q1@vger.kernel.org
X-Gm-Message-State: AOJu0YzkKSnS1zzypRBVB5obXctMYCfwlCE8TeEWB+qh+sa+ePUalNIv
	511yeHw4KotQuwxDtqijPUaAxERb1GVZMzdAH9v4kmA7J9ZhtnZwlm4Psb0p+Dyhi1qM+Y5irAO
	CGCiiCa72HFwE7MuU9ZooY9vu9zDRPxELwAuruwymzeYHQ3q9t4/0sAq2A+GguoRmpHyV
X-Gm-Gg: AfdE7clWjhtlc96zwcfoDAQe78DIww8SAqSWhxmOiNLGr7NyBfCEMCiIWq/iar9vpqF
	d9Y3N0NbQMkeu+SLTeL/oigTgVdp5j5GoAR9i5ebMo6ZP3XCfDNWNY7YFryu0MBxa8M83UT+5+4
	CIG7nOwMHlJJtPeLe1xWXFeyBj4nmDxlWbJuhOT5v5iVpmRY1r/EmLhV3VS/tCzn969pjIQ2egs
	Heeinz8zKLYM052g5XG0mhI/MIEfhVIpcG8yutoTHJMRgDBbOKhSQuJoru7tOlaf6rkWRcsMyCc
	WBM/35gd4nPJq9d4Q92tJqzZdu3VR7CGVgrHu80D4XBd1oh8VjXhzr+6Xtqmh5GFrRVvhzVQSAw
	/l4GGZyrDw1hY0DP87kWwL3g1bVjzTlU4NWG5ilL3B2/4
X-Received: by 2002:a05:6a00:e8a:b0:846:bc81:3e29 with SMTP id d2e1a72fcca58-84826c1eaf5mr136603b3a.2.1783337550703;
        Mon, 06 Jul 2026 04:32:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:e8a:b0:846:bc81:3e29 with SMTP id d2e1a72fcca58-84826c1eaf5mr136575b3a.2.1783337550254;
        Mon, 06 Jul 2026 04:32:30 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbdc8dsm3576621b3a.55.2026.07.06.04.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:32:29 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:01:32 +0530
Subject: [PATCH v3 4/6] dt-bindings: crypto: qcom-qce: Document the Shikra
 crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-b4-shikra_crypto_changse-v3-4-23b4c2054227@oss.qualcomm.com>
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
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: yM_oXTXHn8AAS-KwKahiCGwRin0QBbbh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX43aTtHMcABRK
 /S+W9GnajZjRck1YfnuaAP9d3VdZYtNNbukSWqdesZNza4z2X2j1IoD8CPW+WW4n0W4SLbUXiOC
 cvpXLY6LIja6mJdncPkk1Rn8dZ19rdf9BWtJFmO7ayM1WyYOlDJFv8tvxhMM4eF/fOHkW39T5zm
 Jo2put9SXTo4+mdJRtos3xhXpJTlTNrAc8HS5H/9wCeiroTVpuu4KFHIkVJ58HaRBqz1GnRSetr
 va9bOhAbLFfQGkJJOiUK2nxLdI6sdspNNd5iLsgFt3PvGcDcPzFmqNdP3YlrBldyQJH8xLoa4/g
 42vqaBwSTRO6vw/MTJb2l8MjCE4ZBT4bhzfUkrxLR2HxTHnfYZi9TkO0HaX5xiJtzvUxpyhFJ3c
 SONMXnsaO3hbsrFNTwmb6YcFmCJVHW1Zkekn+yuzNkBg36s6VWmYJYgM63BBbJWjOs0dY8dXjz7
 hkPzNJ+suL9EyNAX2Dw==
X-Proofpoint-ORIG-GUID: yM_oXTXHn8AAS-KwKahiCGwRin0QBbbh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX6R/uhxydaX8V
 +kPwVNFGoXOXKcDWFO5j52T2sNGw4mzJuGvxQCoG8yvC4+UK3JfyId2LV61Lc/sxlR8tRbtHWoQ
 elPm8TzzmoVXs1TTwaziJH4remMaXI0=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b924f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mnL63iHeaYg7R5sIRJMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060116
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
	TAGGED_FROM(0.00)[bounces-116769-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: EA484711328

Document the crypto engine on the Qualcomm Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 08febd66c22b..5a653757ee75 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -54,6 +54,7 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
+              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce

-- 
2.34.1


