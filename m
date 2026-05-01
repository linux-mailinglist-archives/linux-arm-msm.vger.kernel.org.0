Return-Path: <linux-arm-msm+bounces-105546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHOQMKvr9GkhFwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 20:06:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3364AEB55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 20:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5022430151CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 18:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1985A26ACC;
	Fri,  1 May 2026 18:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Av2I9h1O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Es3E1sNi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EE6265CD9
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 18:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777658767; cv=none; b=nfWsg6hO1+RewKoigUEKZrOhzdWGH9Eqb3qojErTgvYgnahz1s3y4ZJmlyOYkZyNy4bXou+NClaSVUQyevPwAhgd455XYQqT+i2JPKg7oFwPHPcmb5/zyYuf3KABMHDFkOSRAtuAamK+ULBwYOuhT6IF6HJdSollsYtl2sR9Lp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777658767; c=relaxed/simple;
	bh=IqJpqOcqeGDRmUnMnSq7T6iNQMa6mErewLZJHnE83z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lyOZMWm9aZt58sAjRcZG19dc4YZKWYzqda5mpBlGIAgkTaxjYqFL9/sR465O7JdAWyNKAfpd9xl6wJsrepOkCuz06a/zX71SzpkqPpYeQTFKUGbWgjX4b5ezauPA7EqABXvi5T8i7GJ8jy1zdOhoaqjCA7YC4c7grVjNRQS+nWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Av2I9h1O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Es3E1sNi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLTul176257
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 18:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ytfNsSNY3xQkbXYwbjLggA
	SDjxHz7IDUGwPrlDCTJD8=; b=Av2I9h1OtzvvWLH6mRrAGSLDvxjTTJ2N669AEA
	n1ZdsCZJD1G4A+UD17LvFuGjPrNyLRc/PtoKeSG9mI3emjRLgh1/FrhRBmYZc5ku
	p6LirQmqvZTm3RdPjktyBsLHnNXsOf6s47TYNJJ3eyx98a3dn1+Y53tgoDrAM/s6
	VLV9Wda7XMry7XoByL4PTwqEtYiuDhuAM+asObkZmzTZWE7VxFXK1QNPXb1k8BxE
	S6iKpUsfYx2QVjGKZ421h1ZuRqJg6b7dho4hBFFejG7vfljh317dNlW9e3owAaBQ
	L7yn0aAijxcOTdYruzvrQGvQj6iRqMOiOGZDydBHx92Pjs0Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dve0g33cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 18:06:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2d83e7461so41204045ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777658764; x=1778263564; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ytfNsSNY3xQkbXYwbjLggASDjxHz7IDUGwPrlDCTJD8=;
        b=Es3E1sNiWFnf3udtePOTX6oDo/aeP7Ral++sqnf/xV1LNbo/fOGimyd+ttBrQs0MV6
         yRx5zM8hQLVsvpEkComL0y0NehLsD5vPK+CDnOxhRwyrn4cASnpQnN6bnCxQzWFv32B1
         NIOwVFIFgK+5Dyo/dqhtY8VZK0++YtMYBlQuZPU3qwTtCCBoCzmPPfnvfud+Ufy6GKOT
         ZkNgPAAaUcKxoKOPjIR/W4bWL874f1l+XJ+tvWRK3EotmKzzBrSb2femKqnTi95ples+
         qYIHNDd+DDGe6wnoHRI9ru9PTQjwDqo9JJgq3WPztbt5oCr91TvAQWCycNhurFKfQQBV
         A7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777658764; x=1778263564;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytfNsSNY3xQkbXYwbjLggASDjxHz7IDUGwPrlDCTJD8=;
        b=Zl9HW7OHmKe3rMJw3GUeT8DV+JykIG1BeeMRlUJUvZe/iEtc+Wya/F0awBCWtOkt2P
         B8YUfMAoXJTYHOMopr9836hGf8TFg0Zc7ao/9niSdviNlaVs5Wu10kyX/+Qps3t+AwrE
         N9X1b107B5qvfTeFRKSPhUYIVKk7SouBasOtZFMyhNTE19PqgqdAhaPLjHCc+agoYs5e
         OBEpTD7qQGpLZ6OkrLU8lwboIA7U+cAz8NUuuvMfI9Aun+G5fpdr2/sIDspnwkedHiGJ
         ygxbt0/CSgAhCKXX0bdPYXaCmS1TsBGkWxOt+XjGrPGBXnEJam+ij3johvV1mWSAnbT+
         DlIA==
X-Gm-Message-State: AOJu0Yyl9Mz4O8+E6iRn63dAJku2qnieSBNLuYUwUQrwkZJEC0indX7S
	H2CSg9s92Z/nR9YuUeAmhfLtIdFWQTL1DgNZKNnLJXy4MwFCNhYVlZG51GHIEy/EGFvO029C6UG
	1FzF0a6Z3/DzXISJ7eSxzlraOytidqLqzGorwe3JvxmkRZaldjjGzyvOorF5r9+tXXJEV
X-Gm-Gg: AeBDiet62DI6xSsOljiCKIxPCXfdpIcJVwYuLwnmpUZ3QluQNk2K7HDNg92Iy1EvBAL
	4YvrE6EzSfNGtgpeRbsx8c0WmWl/NXGbn2Rz/al889S5GzTf9HhoyjRUxvFL8K9borArNPe/I+1
	sxyUpfePMNoxd/24i0Q5RcpHVcfCAFjebEdFrte9MSEXdS1O5KHc17TU1gkwbuzB4K6YfbhuCQZ
	I1DD2aXE4iakcqqFeVJdtJTjnKERzQb7YKA1nPRR3dkL0dnoch9kKcu4joaNGO2uTjmEcwWgKcF
	Hzyv2hYO28HceU5+liZ6Ja+f5Tq/J9gxf9fdRH6gs9Mz34ycyduARlemxpsRzD2tP49UHvop4qi
	3uM489zXK5Tf+dh84wDNHlV/4iY/1IHCgflzzWy+qpwNsrE4=
X-Received: by 2002:a17:903:178b:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2b9f253256cmr2500445ad.4.1777658763938;
        Fri, 01 May 2026 11:06:03 -0700 (PDT)
X-Received: by 2002:a17:903:178b:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2b9f253256cmr2500135ad.4.1777658763408;
        Fri, 01 May 2026 11:06:03 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae4fd16sm34804905ad.69.2026.05.01.11.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:06:03 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 01 May 2026 23:35:49 +0530
Subject: [PATCH] dt-bindings: watchdog: qcom-wdt: Document Shikra watchdog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-shikra-wdog-binding-v1-1-fd8c14bc2d20@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHzr9GkC/x3MQQqAIBBA0avErBvQpJKuEi0sRxsCDYUKwrsnL
 d/i/xcyJaYMU/NCooszx1Ah2wa23QRPyLYaOtENohcS885HMnjb6HHlYDl4VEqPym7OaOmglmc
 ix89/nZdSPrJVO3RlAAAA
X-Change-ID: 20260501-shikra-wdog-binding-33873dcfa81f
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777658759; l=1019;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IqJpqOcqeGDRmUnMnSq7T6iNQMa6mErewLZJHnE83z0=;
 b=rx06YHRgOOLbElY15UCGfPTvLsZqgFYqCVfvPklf2GXdyQx84vl39FVw4v5tygvaZv/aaoi/o
 vdK1l7JiaQUDT1+FzgZyXANUs6rrCL7weSRT23Pz6T58OirSoFC7iIE
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69f4eb8d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DX6wD1BsUSLyRYCk61sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: xgS8kN5HPixTURUQY64D2ZSLydORuiyd
X-Proofpoint-ORIG-GUID: xgS8kN5HPixTURUQY64D2ZSLydORuiyd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE3OCBTYWx0ZWRfXyVYZ2kLRDPaH
 D90PDiVNhsajMBSz6WNMhQ/YelwFbH1WPOzYVkYRlAI4/3UBsEjef1XwhDNe/Ug8h5TzWyLInci
 j8CRx7I2FO21Tl9qF4z6Rh2boGEzaAk8fJ9+IqxFqyEVmuiEmRIJUsD8xnQV5e7TxlP/rPJvQSX
 kbFjs6c4F+/HX3z82bhlEuUtUDIDT7Zi1jR55OaWR0UnfMa8rMkVzvyUHQxMW6JBbS+W2RRF97h
 +NGZBLFBZwEI/85GqNnawDC9oQCEaT0180TDRy/SvcK6HCBP9cvk/bH8sfg962HC2hu6TC3pm4b
 v5NkDPl5TZM7WOVBnqlHOkDaR6Bhr3zoTzWssTd4H1j+pTD0hL7ddRzD79c4BhViQ25ADrvSHU3
 c0BwmjuVZlR/3E5erNHgOUG1b4b39hTInjD7X/J5Dv44JPjbnkF6asXdaW+UX8A7DkzNb5UNzzw
 4LcaFoXiWs0pul69AFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010178
X-Rspamd-Queue-Id: 5E3364AEB55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105546-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Add devicetree binding for watchdog present on Qualcomm's Shikra SoC

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..69ab3bf5db90 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -40,6 +40,7 @@ properties:
               - qcom,apss-wdt-sdm845
               - qcom,apss-wdt-sdx55
               - qcom,apss-wdt-sdx65
+              - qcom,apss-wdt-shikra
               - qcom,apss-wdt-sm6115
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260501-shikra-wdog-binding-33873dcfa81f

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


