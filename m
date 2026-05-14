Return-Path: <linux-arm-msm+bounces-107693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAGFMPQwBmrhfwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 22:30:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66F546B95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 22:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68C4C3022F62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 20:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECA233F5B2;
	Thu, 14 May 2026 20:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SlGE6xjA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4LJDzvP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6D03BF698
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 20:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778790630; cv=none; b=fCEgn4SPiIjkNm/FWpovlhPtzDG0ZtSXyC3BXnVi7wLIK9PlFUz229xUC7OKm0x1orkBUmFkVGcy8BF1si9+gxQpLDpO2W0Oct8MfkOPYCH/C4kUIcNuokAUfkeTIslBxrfqAWUs8DosGNOmawtme+UL82gOSUd+EylqFXXzBQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778790630; c=relaxed/simple;
	bh=RvUqiWlt1Ergu4NMH0uwjjsce6vuybjCzM+VDSmAESU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkXUdY8Fe8PDS0GcNSP4F5lC9ZbuOOEw5se/AHPm8FVPSE5AJQV6aOXMrtNjkjbR7L0yYJCPp2Ax6RCO12/Pdpjs4ANycVvqVFCtIGMPbDuFUShGklkUpY3ONcMMsx7b4CP8nyQw47e7aHZGgpA6dfMhNbUmRhBgNe+OwhaCgeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SlGE6xjA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4LJDzvP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpPdB1847948
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 20:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhsrID1K825RqNqJYg3J6AtzbVLQFOaNS/VEzGY3CqI=; b=SlGE6xjATffQwsgQ
	9ch/9EftiCTdDcVvw1ld3h7vG4h1vZCc583h1/qFE7iwM8UoLohzOcppQXhXunq1
	RoK7gDYlTDS8iI/n0JyC/Tm6X77EQwIF/eME4JRzzgBXfRNwG/9vuXrdiM6wBXJ+
	XCqjYiplFTZcUBxrbbBFBWwb940kjHSYMLMeA2Y5HtCqvGd60TIaA1JlvLcrg63H
	a8+8mTvKQ/Dl9QauYgLu/YV1UwfANxuIPeM1GZVoYPQMBpBSnPl0JiNii4mvpf6v
	M6WjqVlsK/jLNpGCay0VZEnbInFerO1qUDC5zSvR8uzoEhwaErc7B7rX+2fygt92
	94Q3XQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t09tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 20:30:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c823549b1fcso11398130a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778790627; x=1779395427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhsrID1K825RqNqJYg3J6AtzbVLQFOaNS/VEzGY3CqI=;
        b=Y4LJDzvPsBOhtBf43zlkTg/fkkre9Lvgz2IwTQrMBv4Z/S74bl/krWtdEvCF8HojhB
         amxfBe3c7jT28HExJp5vndYYUsV+iZMnTabzXumy3tuGkTl9X7YfLxsgHUWBleGN3Ftn
         hObvO+za4BMxv9kK8JCpFcHy7E99uSTmwSjk8INK5EIzQz4O33zLg6gzgxREWklkquTx
         YNMZvqtQGBXfatKul0LVO2NaDZ0NH8goAOht7lP/7cHFLs9rxNGdGzCwifdr8KhcqKOw
         oPk15KWOTqCBPqdhTZMQUqAxVGZ4pLNqThmOmS2P0/Cezv6WvH4AcxNxtl4+2gZWg9bi
         eKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778790627; x=1779395427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhsrID1K825RqNqJYg3J6AtzbVLQFOaNS/VEzGY3CqI=;
        b=JmyaCX6w1cGyEdW0SVXtBq3s6SvsWECh/I+VhkyMjojsO3GuHKoUSz7qcGR5BRPAB+
         A1HL/t/AYlem5ktSTN8RetyMtyY/uJRbioEIkSOJSnfvM2Huk4V6faGRoYdWw8wIC0Yu
         bYfNIT8afX/MZIKigeWFmmppc3Apg6JOqQ6VXIg7qvMd2ZzusRzkqnLXSybttoPpCF9R
         r2EvaagsDEu/U5W/cSShbaGQRz+J6H8d/BopOxKAI0SKJs6lLlvw01WqCdihhbeUI5JO
         imBcbgqO6/K9K0T30RCa+XS1V/LLSOoDufrpa/5F5v+jPGG6UZH8NHO5woDoL57pNlbX
         wbzg==
X-Gm-Message-State: AOJu0Yxu/2bsCbqVSYjODIMtbGqIRx7HAO74in+SWhgGx8RxMEKx8tTS
	ciI4eqIWLCGIjX6a7SMr/dD0JVPImcrbqj692M/ThDy98gLjzkOLZldwrC8F/n7xilt8GF0q7sA
	vS74azxF2Bl/q36KS2oI+EIMxeEVAW4rhrtG1wiLyk+HKBUd4+VFpbTViF5roU8DL/dXHgIrAA6
	BE
X-Gm-Gg: Acq92OG0i7TXopJ2fsa+Uo+QnQYB2U/P+1M4fT2RUO0WljTMhYw/a5Z03ND3jnXflx5
	meD3eIXXqv30fhMoKy55CGI86qjXAvElsQMroo5H44Nd0aGmQKAtmmX+BGBJlEMDbjvTqUS63rM
	HYUAMmzrgHZkrNVVo+WHri9gVtp3GcmMzSCN6McCJZAbW19TLKekNOPeKIfhrC9EhR6d2bVMn59
	sdF+cpTtLHGYX9n9450/hPyzdun/R76MHA4CVjqhpNIF9qfTX9MrxlVfl0m91Hmor3IKkMOYHVq
	OTy2iBt+kIXpGyf97dBHsCYt5ctdt0cMmjggIIsPP9mj9t9qg/Yiac7VsNkYilcXgKWeWlwhgnI
	eJNFU0nfhYsIqsjSDinWQJhsgOESdjJJm8tuOmk2MXjeFnxWbEZ2icpY=
X-Received: by 2002:a05:6a00:3387:b0:83e:2eb5:b196 with SMTP id d2e1a72fcca58-83f33c344b8mr1153373b3a.26.1778790626818;
        Thu, 14 May 2026 13:30:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:3387:b0:83e:2eb5:b196 with SMTP id d2e1a72fcca58-83f33c344b8mr1153333b3a.26.1778790626335;
        Thu, 14 May 2026 13:30:26 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm3666952b3a.1.2026.05.14.13.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 13:30:25 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 15 May 2026 02:00:08 +0530
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Shikra ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-shikra_ice_ufs-v1-1-b1b6ced70559@oss.qualcomm.com>
References: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a0630e3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=twW8G0p2hbz0t8568-wA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDIwMiBTYWx0ZWRfX2OFWcp1gBiQj
 IuxVfdPKw4RB1tI02QkNe7wWQ4x7jiDVLHyWxDpUfv6VRp0oPcwI2Do/KY1mzGgxgDn9MqvWTdd
 EUlWoBIeLsJHfUUC7uZdZ9pXjGU9XuYTg2k4lnXNHijABkKoK7izU1AQoRRqmwiDvsNaev8sbp+
 E8ZxS6qxJW0iknfPh3cqUfaOTn+1oh0KLRXD47DEf2T4jt2hdh2qnFBEG8GpwEfG0CAiFKOb7fE
 L9LZHUwY53OFom96mn2ds/kmNHQK86jp0ABnLi9uz7bgXo+y/7wbKVZTmH47EYLvxZf/8Otm3Fl
 azcU/BcTfKSKXx/MBrjhkjmPi7hdKA0TXONge97wxW+KQo1JmgUldZhyjAM0VxJU/7PRRoB3l/9
 1cqTI1mbwchaub/96ETt/ArP1UoWIAbq7Fq5WLeuVYLvDdAhsNl7Tp57mMx473CZuQsd94Zr8lq
 UiE+36lPgxw7/9tNodg==
X-Proofpoint-ORIG-GUID: OMoVOsK_Cy1_9kCeMf2MeKeUvzN3K5Hw
X-Proofpoint-GUID: OMoVOsK_Cy1_9kCeMf2MeKeUvzN3K5Hw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_05,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605140202
X-Rspamd-Queue-Id: 3B66F546B95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107693-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the Inline Crypto Engine (ICE) on the Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ccb6b8dd8e11..c0b083da78bf 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -20,6 +20,7 @@ properties:
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
+          - qcom,shikra-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine

-- 
2.34.1


