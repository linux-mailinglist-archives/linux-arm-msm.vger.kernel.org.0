Return-Path: <linux-arm-msm+bounces-91371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIEXKK4KfmkrVAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 14:59:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88649C21DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 14:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 563253003816
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 13:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730E6355809;
	Sat, 31 Jan 2026 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkUh0Lll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+u0H192"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86033542C3
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 13:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769867939; cv=none; b=A5MSGx4TYLKL6RbbIS5Xfv78dhKGXpp4lygKUvvBCRdmmELQnHicTJk0dHTQ6oxUcWKW5PxXW1HkfRLBXgPMz3hxWwBFijQ3l7brmhL2P2RNrBwrZsr+H7lwXdObRdjYXwb31iyRmJUzOty1vu05gdB9wxaOWzHTbTG60FhDXdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769867939; c=relaxed/simple;
	bh=6t4bZjQEwVJSE4KMbGmyYY9zqlqufbdXRAFAjFYMPJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFxyUEiosZalIKKqFaLszAMSe+7Ub8MwKYGlL8nSXZKCEekeLUn4+g04DfBSN3pnAWkQ6vLWZmB9vXaqQvc0yk6fT7pfnPBQsgoXtWOLEosGp/k4cNixTnZTYz16g/C7zvqvac3O5nfyxiiqv2XIfEsO7MJ7Pys+McW9Vif5mmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkUh0Lll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+u0H192; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60VBP2SI2348871
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 13:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MWJF3hIMhRNf4dgGFUhsIdW2b9aOdxhV9FbfIMi59s=; b=dkUh0LllWhbe1/bK
	Hz/XOf9Z6MjfeUxv8BOTISaR6Zc1gRSry9gZGf7Hvepgz86emXoas5oqMlpkdPH1
	OWO/CawfVkHRbh7X3TLHcMtVSefCSLbB61IEWKt8Gzb/T055fiddsHSG8kWYkuFI
	WNZctDU5iVobUHd3i2eaIipjH8P3UVPZWD13FkbESd7HO+Xnf8NDRT77dOqFZ+0R
	vyc9YL7GYK401LZSeTxzgzKUqAHVGKpr6LHFkEbWOY5ef0uorK52oayGYXRUU0wE
	jozADcZBXd9q9RFYb5DpW06wiZmAiQ/hWHoc8SPJ43J4YUbYkRHg0BhTngvzXGAZ
	RKSA/Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard0vck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 13:58:56 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5f535184cc5so2980828137.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 05:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769867936; x=1770472736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MWJF3hIMhRNf4dgGFUhsIdW2b9aOdxhV9FbfIMi59s=;
        b=W+u0H1922rZCq6kioAEVO0lH305jnMLLNLSIKc3ZEtOaP9q2CKiFggUZNWTPWr+jX9
         pKN4UVvwfAdLkTOBEnYVSlwqhtlSFfSVxtJr1lcK2XcDVrHmhRfrUJ7J83jRi3nTcf0u
         J/dqJCkxxqCLoC/fthTRltrQfIoPZJ/GEaRdJXROIxmRTTb4YMAAn8fr8xnDCuXmMgrW
         a5LHP5DLOJ1X6F5GVIFNiOQ3BwlXdCEo5B2Z/+XmnntcHkGTJ0cAhJVxR7rMRou3hGho
         tq5H7iExLeZ0RwXi4bhL9YMmDWG+mT6OlSnLYSLc4hqZFeHqKXroSFWUj0xptpexEgJ9
         weaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769867936; x=1770472736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MWJF3hIMhRNf4dgGFUhsIdW2b9aOdxhV9FbfIMi59s=;
        b=YqEWH/QKAIwK/Dv8uzvGMnuLLY8RZdMY7+qK7AP5dQXAQmuE8CrEsaYCnppU5LeuBv
         O1hCB/wxIN1J0pjaeADSkX7K6HbzKFYJ38FSyPbjmCw2VrGIxYKeBnf5Am+ONwjclOnS
         DwIYAAlW9rrV35DUsdaIZL8+9BWPiHGc9Re5Tgf9AgVswF7jIgwR1Z+MO+0QgbrggmIp
         aak5AUAcf4MXDC8Sk954XfWFllwFfHv1i50JRft99Eh8uuAC7W6zcVkqBCEFkle1p1CF
         EE4yhyW+d2waIr+vRzU/0B61V0d46/nQyFtwx/gEVYFNDERhM6sa4tM48uoKu9BjvMoX
         mUyA==
X-Forwarded-Encrypted: i=1; AJvYcCVxOFMEJEHFRRwqy1XcrjbbF5rD4/oQQHpDFqgms20AoHjja8BO6M6BoYzpgI0HmAAj/5g1JVnGzgpk1JVa@vger.kernel.org
X-Gm-Message-State: AOJu0YyIG687+mfDuxa1QGOvzwrY8d6LBpm8IGVDMXjQsCBvb3yALgpg
	LpzAxRRzJGqzY5ZQ8pMGt+pnQsH7AdFGTRLpWdaTe/sN4+Pt4c7xrbtFxY8I8OKepCaysdNRQT2
	U8iHLb3JHiQ+uA2moq6jIqjd+yN7TJ1iaZm26E7j9paQzdIBejeHEEd8FskkzglHPiJlE
X-Gm-Gg: AZuq6aK06RmmLg9qvx4iF7dgubvq0DBcPt47Gi2gHgYz7gp5JwwBNxWnilfv9DX+lmT
	PG/GcAanZyP1lu7ml44LTNZPwUpIvNTrUOFai9k86Txw4e9vpKi8+hRvTdu6pptsjgSB8QjVyfA
	jusR4yi+K1LGAUFm56tkyHmjxBA/PT3oUEvvqt7Dg5yYIZicUR2stIqBQ9DKlJAZv0+XbnfgwaQ
	faHiDC2ZTAVX2HG9oVfVu7kLu1kxMzi0McbaUWVBnb6TB4BbIPY7Yt49cz9wgX+RUkkg9yVOFGl
	r/WmEfv+EZomxccW/61iRF3Ad+q2/x/JIJogVe852NsG7NaCxKY23S6IPOGYVXAGWOp0yGctQuM
	kUXDuEeRAfHEqqgIku8nI+oidmb62P07LfMQIRxS+DhzT5uSJ/dMIIFdlcx0C8cTRtY+7cFuh1g
	Y1piw19dqBr8uE5UI2ikzI3wc=
X-Received: by 2002:a05:6102:818d:10b0:5f8:e3fa:7836 with SMTP id ada2fe7eead31-5f8e3fa78bamr1067981137.4.1769867936160;
        Sat, 31 Jan 2026 05:58:56 -0800 (PST)
X-Received: by 2002:a05:6102:818d:10b0:5f8:e3fa:7836 with SMTP id ada2fe7eead31-5f8e3fa78bamr1067958137.4.1769867935506;
        Sat, 31 Jan 2026 05:58:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2dddsm2373021e87.61.2026.01.31.05.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 05:58:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 15:58:51 +0200
Subject: [PATCH v4 2/5] media: dt-bindings: qcom,sc7280-venus: drop non-PAS
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-venus-iris-flip-switch-v4-2-e10b886771e1@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1928;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6t4bZjQEwVJSE4KMbGmyYY9zqlqufbdXRAFAjFYMPJU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfgqbcVA1ev3MV4WwMthF/JD6g8Kc8bEllo5ce
 9Dc2/TjqY6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX4KmwAKCRCLPIo+Aiko
 1X0YB/4maQADkgrkybnDGwAGkpgTmtklhpP64b52AMjKvtbi4e+wh0d8SHqpE9EwbvfAQzC4wkl
 Tkce48W6RR/H2YvDyx919pqGgZpnjqkn7sGDpEPWzk2vZUQQ+VXzeYiyprJA5AMrZ6o2Km+7MKR
 XUL0Yp7GQufRsz+qLOPH1GswFf6FCJ3Pp65ZtzFNZ/1KpYMdRK7DinCEa8U5bJZj1YC+iqsD5Jb
 U/rWVr5ySRXJT3JRbS+HrfAgMSFstzpDqPa5QuIjyBRXudpsEPvZVZnw9zqRCXIu55HrMIWCFwE
 V/ILn897U5bKtfTxDkATOsQfUm15F71es5BvvVjG2Uxuoiu2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDExNyBTYWx0ZWRfXw7qzv+Be3D27
 UgHENYEz1Vuhp/fKOAHMrTfxvrm47UVohuU7INgXWDIDOSJluPpLDFhJsNPYWO7NrfT0fnkBotd
 0wgx/KPBqtuVkX/+3OZuFyd07OlOA6ACIIFVrmhasURo97sxmVCFBaTkZ46Yw9a8opstnPSEKof
 yF1IeT416uYcJhTkId56lZXCWsw2pbYvCkCe6gje20E2NePUllywCM4dHtQQ9pW0E7N0UZL4Vnz
 jritL6G4PXj9MrKoLUIlDxtq22itbfUVF7hD98TrI3Kkrd4aKgpetEyK3RaHmAXfFPR2p5YY+Dv
 HiyKwWvkA5uEPwg1XwKRaekc8610zSbDkTMkp03j7v347Qp26zvIfquX+X3OUSsejY9E2oMIOtA
 VUATHrnFOHYEPP8KvHVolZUqgF/KVluMcK7qZnf3CQ0Rdt0uctKyT6FD4WZRza3ccBXJWaM3xSa
 IhgPewMaIcpAoLXIOoA==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=697e0aa0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zCM7-lDapuS4FQW10A4A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: BqjLjd5mH-4oaly2hRV-fokVZey0k0lL
X-Proofpoint-GUID: BqjLjd5mH-4oaly2hRV-fokVZey0k0lL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91371-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88649C21DF
X-Rspamd-Action: no action

The only users of the non-PAS setup on SC7280 platform are the ChromeOS
devices, which were cancelled before reaching end users. Iris, the
alternative driver for the same hardware, does not support non-PAS
setup. It is expected that in future both Venus and Iris devices will
use different ABI for non-PAS (EL2) setup.

In order to declare only the future-proof hardware description drop
support for non-PAS setup from the SC7280 Venus schema (breaking almost
non-existing SC7280 ChromeOS devices).

The dropped iommus entry reflects the extra stream, which should not be
treated in the same way as the main one (which doesn't match the usage
described by the iommus definition).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index 413c5b4ee650..9725fcb761dc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -43,8 +43,7 @@ properties:
       - const: vcodec_bus
 
   iommus:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
   interconnects:
     maxItems: 2
@@ -120,12 +119,7 @@ examples:
                         <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
         interconnect-names = "cpu-cfg", "video-mem";
 
-        iommus = <&apps_smmu 0x2180 0x20>,
-                 <&apps_smmu 0x2184 0x20>;
+        iommus = <&apps_smmu 0x2180 0x20>;
 
         memory-region = <&video_mem>;
-
-        video-firmware {
-            iommus = <&apps_smmu 0x21a2 0x0>;
-        };
     };

-- 
2.47.3


