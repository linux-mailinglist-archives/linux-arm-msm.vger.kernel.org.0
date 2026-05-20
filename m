Return-Path: <linux-arm-msm+bounces-108874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCn4BwgPDmrB5wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 21:44:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27544598ABA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 21:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9505930AB3D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE9C407CF5;
	Wed, 20 May 2026 18:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwrRy62Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFoa83pz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43934407CED
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303004; cv=none; b=saf2JBoy7vx8jRvR9vFd/xVBXgHSBjDjFYg038DUr6U4zM99/gqJ6XgqgpYsmY4iXhTbEvUOMLUC8nlLqXFRoj2AB8mAWk+mX74N1RUh/XGfjkGuiZZEEuJ/mYkAb+bDujFhQ3yMzukBOxta0bmNPpiHZSge1JN7365Is1LHvGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303004; c=relaxed/simple;
	bh=dsX7mPtc6UZO3QTszlsq1hqCn0zQ5ralcn1l10GSUHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qEfbvk2zbDuw3FbYyqmz5a+4aJgC6mfnLKXC/W4nTVf0QT5TusFHiVwBelMTFmuusWd6XnPsNQSPDqNjZPj7Ua2PAA/ezGC2oHQzpFZZCYSdZi/LjxKuTGRm1/plKbzw40YzZxDaEUL479aao/z2bNWisqg5UU6EoUpXGUsKNpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwrRy62Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFoa83pz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KGPDi41178167
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j2EyYli48Wk
	369qyzRCcHfeTorNILU3kKBlz9M6tYnE=; b=HwrRy62Z/uw+fCv6Krt6nJrxVin
	wgq1AkZTLm8XL5rkbsyZPGo083R7HH3PPiQNVOsUYQTKEjmQJCcxPLjF9jRJOqwD
	qI2cFVHn6yUGW1wmJGU6RUBe9DThYqYoltdLinDB1aTe8s787W/IYQ3GFMpNMLQi
	hIo7onKBzBtHkoXlf4kqE6U67B0nI/3m/XD38kybTTOIsW3wYpskgg+iyFhbRaFc
	IthKtw9Clw9CXPvOTJdH9jGXd2VvWeoHvPbGngzTNKAFNHru9EW7FMYFhAa645g0
	Q6a0PCterTN00yCKqvxDhT4M6/tgkgg2UvZmWd6hMe1ZXhsiM1cGOC7D/6w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6t5s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:49:59 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95fdb602477so2326434241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779302999; x=1779907799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2EyYli48Wk369qyzRCcHfeTorNILU3kKBlz9M6tYnE=;
        b=dFoa83pzO6yGdhIOTndAUyx22b8k3QxPQfEcXxp5cbMkUTLzQiEhD5254E0SYFyw6M
         jXgGmvkdylXNmMeyKUT5DQHHFWCC1a7xaF8fw5myff/oTwxB4AhxxzAXd/zlpkZg3xn9
         KtQ2e7m3x1hMiZ0t4SF4Q+zUoQw+/ojsUjNQU9TJs5nQsP//XGlTrtxE43Jh5CyzNLN5
         zIKq4IosYTJRObT81k8MbGQb4vD0dPTu+vL5nnSeJFhqobjwjBMgYcjQ4OqATE9F0Xr+
         kiLodMBUiiF6ZhvDtt2tOUSZq+YYofTP9E2eloh1XgcAA0UmHJ94jhUFcojPHi2R2xpF
         W6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779302999; x=1779907799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j2EyYli48Wk369qyzRCcHfeTorNILU3kKBlz9M6tYnE=;
        b=ZA6mMZYgbL9tjR6GVFOaI67vmPdGIq82g6+OCsm2uXrbyKwZU63c1bdoqGAB5I76zC
         EUAMkp3Sx0ulZAtUJVlvDKBra15tByRImm9+3dDCB/nR+63B01qjmNNySQjf9iAq3MCV
         KoMzpFxnYtHTR+MiVzXrLFb7zewZ+06e2dAicFjfFMWRFqCK0Ude70V7V3LDlXFzYqfF
         8x+J6SVzDuLDJQekvW+BYeW3YQ2L5RWJiCE+l14Yr1/VKmfCPkInVZLhcohQAxOkzt7y
         BnMIB6V0Rp9wZ4HmG00w5aE8hBzywrh0I63uWHg8JCjLgIQWybUujC+bddFtcwvf1a5k
         8Rwg==
X-Forwarded-Encrypted: i=1; AFNElJ/3OiJvOwiH3A25PAa+Pb/mlrlaCi00aTHqRzUpBztc7gmyqD7Ank2CDXBMns6q4NfhJUzOgHg9eldF5vi4@vger.kernel.org
X-Gm-Message-State: AOJu0YzJrx0qSFssGsZ68N4a2OPsMqnVIZG68GXIYiF+RV/85N7fxrE3
	WhuAbpRw6Eq0c8Qre80iOOlC3kRigy5E+nbJu+BeWPZW0eg/W42lc5pfwmUzuzTnm98QDlA6dcL
	EbnQdnBioMZWxZ9xHnEiOCZbGFQZAFOETgi10g1v9qrB3aq6So4GjATFTBOXjhDPB6Q4C
X-Gm-Gg: Acq92OG82rSOaAO2650cUufdwn7hhVa1MIgAlmCzNr0fp/1k18J6TbBHrBISyoJrFCS
	EJuY3Br3xNI0K0waUdaW3mSh8YusjnG1sxjF/KI0xs9XRfGfTr/tmvHkg55ApRRznrgBl8O92Oh
	/2DYbgrtjqyOWAWeAuTMLKZ0BF+CD7qSOqXaMwvAghdpl0kgbEUcT8X8xHL8gzp+LYNydFe2DPd
	S6CiJr6jBZOhRXidfLuyA+iQ4MgHV3Oqq1/itM3xFEtucgPyal0cXnQ2EwnyWLq71/70CsVcUrr
	K8m8DdoFteJwv8LT84xqEN4yBaqGTCJ8gc8nbiKg6VZizCeT1Bz7SZOqXXIN3ecIM9EgU2m3TcR
	7B7N5yg/yq+edtOs4LrPxJxgQjSXwEotl6Kfk
X-Received: by 2002:a05:6102:80a3:b0:634:b86d:d904 with SMTP id ada2fe7eead31-63a3f392905mr14455619137.17.1779302998868;
        Wed, 20 May 2026 11:49:58 -0700 (PDT)
X-Received: by 2002:a05:6102:80a3:b0:634:b86d:d904 with SMTP id ada2fe7eead31-63a3f392905mr14455335137.17.1779302993624;
        Wed, 20 May 2026 11:49:53 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb8d838dsm139584905e9.1.2026.05.20.11.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 11:49:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: interconnect: qcom,x1e80100-rpmh: Revert ABI break
Date: Wed, 20 May 2026 20:49:46 +0200
Message-ID: <20260520184944.182148-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520184944.182148-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260520184944.182148-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2995; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dsX7mPtc6UZO3QTszlsq1hqCn0zQ5ralcn1l10GSUHc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDgJJb7ODGOqqCksFwhqMbUv+gHsyKp0CN8xo4
 cM4YmFWzzqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCag4CSQAKCRDBN2bmhouD
 1zHRD/9tFG8tp3zExu7gvBVBQ7mV+j6qOvEEBvZFiQpNlIqnzzWPE0xzgVxOru29x1pNu1eWbz+
 OY9AnFRcpCJw21kWDdPR4/G/foLng0ZPkTZTZlsMOt0L+GaQGMbEGSCPyBf8vyesLM9nVu4k/Hs
 MCm61wfi8Z/+K2pcr3oCnYvAW/yvQOaU+M8zGISCdIJqhyvSZ2/uaTh0SGSY+WAKVgGWLHvQdT7
 DU7jAip/WorYWD9xh/j3Q4JNxF0iEL4MvG+G83PkUchWP1yKZZYdnVONgFSdeABfIAC1TKqbbH5
 kAfGcbxnzW9N6oqmdVA8u6o5qtVWXWoAD1OTPKHRmqM5S//AwmwPFNF0bqvmL8Br7qA6apPrsBD
 BUCNT1fQfZjfE9oq61tlAwXmEmg6jC9WHoDbmztMvoUNJVbD1RnwXDKzNVeA+DXFuWSMg1VteQ2
 7c6rU1K0ic0ANRMxUkUkVCtTvai4d0np/+Vw62DPr5fTysNnZLQoWRf2Eo0Pn0PwwYuzvnvUeKQ
 ThsuCna3b6nasU4uBk3vCXif2atm3rkyd7rb745tiBM+LHEsyylsNu88Xlri2LiYRlSguxjCr+0
 UFqNFRTWLZSm351LxBaCDZUb3ZOiEbD6e1qI/iwpjfjDCgld3HPBZvoYQkH1H2v5A8/3wpsKsRm /LypivquGLwCQ8Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NiuTPCwbta1ztsFZ4AYTCw9FsPGA_ITj
X-Proofpoint-ORIG-GUID: NiuTPCwbta1ztsFZ4AYTCw9FsPGA_ITj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE4NCBTYWx0ZWRfX2EasQh6ceT5s
 H13K7yZrC0anUEzuaxCc5IR1/l28KkePrBt0/RNDxmO4kJEVUV/ECS6Q31eGS8olKJoNJ1m31pb
 E0Fdujm0aU4Mq+yvIFVlqPqgcKtcBaNWW10zW1ZXfQQ8QMPXOHEJHYL9YaC3PHZ2iued/eceLqr
 VZCUVA+SnMOSG29/5S/9YSWDtEAgmwvJu7Z+mJPp1H18H9t0DZZVu6f4KxbXNgiPiZRZU2YqeWE
 0fVD7lowZSI8OxX1DTk77VhoraQyRBZ6hrcCFe0fXfPugds6BxDWSo2vJCTuMbPe8CczAWsPjK1
 PfqOHpOpmWbw087PkN+Ez87yZuq/nLczMpjlFnWa4fGmVBNT5NaJ17Fx4/7ueMHnrMqFYJnVuPG
 smZD8UfR3SBsyweAJlKsnMpoeC/Rx58VuqPgZxADpM2ZUSaP8Jjx6tbiQ70sEuAnHl7qM/INnNv
 TIdeD/pxCgByThSnqyQ==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0e0257 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Qe6B47XUAAAA:8
 a=EUspDBNiAAAA:8 a=IqiqMeszhnCddq1rSTkA:9 a=o1xkdb1NAhiiM49bd1HK:22
 a=QWPKR-PWjQKaio0naagv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200184
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-108874-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27544598ABA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Revert commit c83cf1b1c6f1 ("dt-bindings: interconnect:
qcom,x1e80100-rpmh: add clocks property to enable QoS") because it
breaks the ABI without justification what was broken and what was not
working.  It claims the clocks are needed for QoS, which might be
correct, but QoS itself is not a mandatory thing for the device to
operate.

Fixes: c83cf1b1c6f1 ("dt-bindings: interconnect: qcom,x1e80100-rpmh: add clocks property to enable QoS")
Closes: https://krzk.eu/#/builders/102/builds/70/steps/23/logs/warnings__3_
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../interconnect/qcom,x1e80100-rpmh.yaml      | 62 -------------------
 1 file changed, 62 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
index 27d9234bc762..0840b0ec6e27 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
@@ -46,10 +46,6 @@ properties:
   reg:
     maxItems: 1
 
-  clocks:
-    minItems: 1
-    maxItems: 6
-
 required:
   - compatible
 
@@ -69,63 +65,6 @@ allOf:
       required:
         - reg
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,x1e80100-aggre1-noc
-    then:
-      properties:
-        clocks:
-          items:
-            - description: aggre UFS PHY AXI clock
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,x1e80100-usb-north-anoc
-    then:
-      properties:
-        clocks:
-          items:
-            - description: aggre USB2 PRIM AXI clock
-            - description: aggre USB3 MP AXI clock
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,x1e80100-usb-south-anoc
-    then:
-      properties:
-        clocks:
-          items:
-            - description: aggre USB3 PRIM AXI clock
-            - description: aggre USB3 SEC AXI clock
-            - description: aggre USB3 TERT AXI clock
-            - description: aggre USB4_0 AXI clock
-            - description: aggre USB4_1 AXI clock
-            - description: aggre USB4_2 AXI clock
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,x1e80100-aggre1-noc
-              - qcom,x1e80100-usb-north-anoc
-              - qcom,x1e80100-usb-south-anoc
-    then:
-      required:
-        - clocks
-    else:
-      properties:
-        clocks: false
-
 unevaluatedProperties: false
 
 examples:
@@ -141,5 +80,4 @@ examples:
       reg = <0x016e0000 0x14400>;
       #interconnect-cells = <2>;
       qcom,bcm-voters = <&apps_bcm_voter>;
-      clocks = <&gcc_aggre_ufs_phy_axi_clk>;
     };
-- 
2.53.0


