Return-Path: <linux-arm-msm+bounces-109093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOd9EVULD2omEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:40:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9F65A6148
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2967C32EA798
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D173E5A32;
	Thu, 21 May 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OTioy4hU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnSiL2ql"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F193E5A0B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369500; cv=none; b=aIXjjp1dRZYy3LOZUG9kWVaaNCeAeb3MFw0lvQLfbhwnoMcBOuRjUU5x9acqNdulzOKbmLig70bvfRrYjt/cCuxHMzkC4K4tk4RoLcGGo75dyyoBrhBh9nI92EcChL2kMGDAiWlcckgOwmq6cNWBmVarTj7A2FylkSNWN1ep9c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369500; c=relaxed/simple;
	bh=0YDjfixzRUzNZsXvICDQpY5Ug8aZ7Cv4WOB9kd2NRTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLkhNMaKfgLb7EOv9uR4khnM/X7CouIksVmFoY3CXnadfJQsiEkNGEPLORnmTi3P+jsl9cWhkomstadFEvP0F/fAYn9Mq/blMTIIZaN5FLjJGxxjp4L1mqVuQ5APv6H5TwIQqkLwd+SIQLSAkLkiiciDFATtQTXaVUMVKG9Rseo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTioy4hU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnSiL2ql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMJ23556011
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvGF2bXqo6ZRSC7J2AyuJceqO+H/uXluc3B9TCf2lc8=; b=OTioy4hU61nC3c2Y
	Jc1lRg25MruHGX8ACM7Z9ujNfmiiRV7sDVNLVf5XXI381R9k1JZF1UObosQXLHMY
	eBoMz8RnEf+xedIriOqpTk/ANRDEYb9HTC7zniX2aR04PSq0gtZFEfIllBk31eOz
	aeD0vR+U0kNUN/s5E4gBi90q/Ou+fQ1mYEJrgkTIKCkBQ/iJd8rPugDUw/x4l8aF
	K3O+DBf89WSD177ZB8T3CciPYJlek1jGwvNmRgQil3yUEhUTltdJw1s9Ffj+WYHc
	3tAH35bFVYYvAgD3TY/MxUufGMptJDxkiubvgZwII8SxCStvM/lbIYkTsVwZZLUD
	t1ghIg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6mnmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:18:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82bd90afbbso3177897a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369497; x=1779974297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvGF2bXqo6ZRSC7J2AyuJceqO+H/uXluc3B9TCf2lc8=;
        b=jnSiL2ql1BrUVQDLnLUErK5ZlLPi9XhlH7Kydv4lbZsUHhb/G3jf0+K8iNjGhCAAM2
         dLwZsi5gjFRw/BlyxZCt3I9YXSfYaiCe6/neNU/oCsAJNhrfMEqr88tBvHDrELQ8/HUR
         tFPTD1N2NcWW1eMWdK7WEOlVrbqh9S5VpItRsTwx10GxriUtzfH/51VvBJ4T/8WPzv5w
         4uUw0K8xuVBLZP/+cKmj7jSqocURP0NHnYSz+Ql7Iz2UlIYvGBR2vCWVLA7glc2ZNYdp
         +q+mEQQY9m/kSUFZpnHQ5o3Xxlu319xEagbbDZwhek/AoaGh13WfjFgPZ18ILf/2tmgN
         kaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369497; x=1779974297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LvGF2bXqo6ZRSC7J2AyuJceqO+H/uXluc3B9TCf2lc8=;
        b=P5FXU52KdilcnrnI7grUw14uFThJEC6WMjxgwliK4UhoBdWeASWpL5o7q2ODPcrev3
         OKbjXekAxc68Dn4NC5RZ6Z1z6gaYc4NyTrlfJtNzv9NH0tNNsgB4LZ21/FM1Sr1NMMUW
         g/yNHjeg/mxL2obVFDp2u7rQl/6zQJWf/oMewLEbziSV7z2Ki3KFfPjBUqehxnBWs+iP
         g+Mh+EzuMXQ/fF/ZY3QN8QttJGwXajAKPlOSPxodZHpSLi/j/pLa82cD30iBputilWIo
         MM/709C2kMQnmxmrusVxsMWGtKL8fFoiCTB91oMfQwU18inVbKPKxNMSFSmfRZUxpSzk
         n5dg==
X-Forwarded-Encrypted: i=1; AFNElJ+JIs2U5IekLWeGTjcmxc9ItPzxH2GbRPk2T4VZBq0IIYo58XrcK4uGcqzwdOpgBQkqugPfXWdqHQRl6f/h@vger.kernel.org
X-Gm-Message-State: AOJu0YwXhIpETZy7Z0Rc0bakp08BAEa3lr1yOShhhZ89XAp19P7d/dQI
	c2GgI04+tJkTGWEmp02cGGdVju9S4MsoHl1Kw9/2mJAxhbhA9KmfXtBUZ167FjPq4MR4HBEDsWo
	Yw+Q+bhH18I/kPr/mhj9KcEbUNUiURoihPlVPvwxTPoTsOln2mZec1uMjiA2xU5LmxhTg
X-Gm-Gg: Acq92OELqHn6drBySDQJalI95QtcpNABoaqSv9QQ1ePMSssdV6SF1Aus9jxsYrouYhS
	GvQ67mIAFUS2exF4Ry4hnfMc6iQ2L+5ez7Ci870+Mi4kSVfytxojYQetXbJP4W9dwXozIjKQI2/
	eR+T2Y9Uub5t2zaNYD1qjjZn7XPDtPNm/YM002k8VLBpt+yvoUDUl37wM5/X+YYFMIXM2EfLgcy
	SoYYSYUrt6xQfTSW0a214IaWD71K6D4yjzF419DxakRhvWzA65luNr+bCAB3S4liSh+6XdyP9Mh
	qWJoAm0uQGYLr2w4BZShLVFLEUHyHrCbb5ljSRTXl6jzRBK8VhHz5WuzOnylvPo78RugBUWCoTG
	ORJzgeIQ3/3hosCj5QtKFzvt+wEPPwEvVuCIpq5vHk68aDfFtuGk+cNx+KB4tCcqtOQ==
X-Received: by 2002:a05:6a00:1306:b0:838:127d:a16e with SMTP id d2e1a72fcca58-8414acda8acmr3150910b3a.17.1779369497117;
        Thu, 21 May 2026 06:18:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1306:b0:838:127d:a16e with SMTP id d2e1a72fcca58-8414acda8acmr3150875b3a.17.1779369496635;
        Thu, 21 May 2026 06:18:16 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e22f1esm1687731b3a.47.2026.05.21.06.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:18:16 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:47:09 +0530
Subject: [PATCH 2/5] dt-bindings: crypto: qcom,prng: Document Shikra TRNG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra_crypto_changse-v1-2-0154cc9cc0de@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0f0619 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mVMjwrqIa5QPTF8STQQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: qcUYjQI41NiQXBu24JIpfhkCGfdaVW8G
X-Proofpoint-GUID: qcUYjQI41NiQXBu24JIpfhkCGfdaVW8G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMiBTYWx0ZWRfX5zfmKmMGXMVL
 8G9sKNUWdo2ljWY6Y260y06+89vtD7UrRqtuPH9OMDuyn2wJGWbvpPWEs/+4Eq7rKtucNkqD6N8
 4ailwjxE/OsBLdml01ZRO6zJJ0n2Gr3YJHugZMIGFDNcV1XYPcQfWIBsQTrQtqCdektkd06quYx
 LklOUzlZuXYXInSE47pqXm1FLRV2Z6e0ypiYs2aWy9qLL1lqNbgE/ZW26b0tPGIBtb58LmycoQY
 bYrHzNV3eyag9FX7RFCdd4dNvQEJZFGKQsEhDLPVPQzh6uefL7cyAWg8o0si8cFNK7vKFTGPHtm
 /V+BOR6pZNA5KY3vLzOOdZOFi967TUuswJcS+SXyu/bRs8E9GEAIrTWmfGNquTQQYmOErEehNj3
 re2MJ8p14j17lzHQ0JNgpaGQ7hqj9H0OuS83NWwoS0Xha1eJrvD2xlan+OCwBVZYdiN0JlWNYcR
 nbC9ubWkEBJwQfOoFvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210132
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109093-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: DA9F65A6148
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document shikra compatible for the True Random Number Generator.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index d054cc114707..3698525d3857 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
+              - qcom,shikra-trng
               - qcom,sm8450-trng
               - qcom,sm8550-trng
               - qcom,sm8650-trng

-- 
2.34.1


