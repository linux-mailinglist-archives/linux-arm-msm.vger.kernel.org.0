Return-Path: <linux-arm-msm+bounces-91969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGLRH5YIhWmj7gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 22:16:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D5F785C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 22:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 201F4303C4D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 21:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D9E32AAC0;
	Thu,  5 Feb 2026 21:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hRn/Ii0y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OD3F9wLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAC3302146
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 21:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770326110; cv=none; b=D5YFeZKv6N9p8+2Z64LzMFi3g055Ch1GqUeu408WvCQ7tx8I7XMm6K6F6O5wfaMXJRIVAAwk4lnhl6oTslOyAyACkzH2o0hNpo2mOXPQb9+x/dOX03vHjYQxx8uGLNMT4LahJftarqHeS2d4GKBjFlA6BAYaU4csMeCnUX3M8hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770326110; c=relaxed/simple;
	bh=2Dg8ed+l2fmonlP8HCtFZuEqCKKmhJBMQWgtRTvwncw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NB1I6vw1ylvQSW8/HTT6XRE3dqLANNp3rs0O+z1m0xuNywuPWvG/fymXpnuIxEtc6BiqJRXnnS7748nbKOTX/0GUIpFCiF7X5k7NOVQzl93SNKr2u3kgEWa77Xzne0S75qqkyS4nlT94o/s+bsfkrXNEesb08kTeA2JIyGk2yLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRn/Ii0y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OD3F9wLH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615Fri3j872496
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 21:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDmgphLqKDz+aCA0C3K10kZKr4JjCYwn8FOIZOuhSbA=; b=hRn/Ii0yS8qmpRoV
	egfx15iSApijIhmD8YghFD2LZWVtZ5hw2YnpsIx16eb4Ulio5hdoCnGJAEqhH9ti
	5CR5jMOvpkoWnhKJE/r6+9gDbjIuqF78G+Nf7Lohkz7oH7Yri7oFggqEO3MVsIGa
	SAyajS7r/EW2eYK+p2zRauhBbnd84W5vJPJ2mqkTXNP33HpsXvXe4UBZGNHUhyMT
	JxKt4W47ieiwTyOumsitxW45UFhnyhdgjjtc/zdsR0cycz7HMC/Kz3VzUewlGDo8
	kjkAT3cqDz2IvN36nIutuByeeOgL2i6FmjHl87rTuiCk8GRkuBcehVWkjPOHKNII
	6j9sTw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4x8bh135-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 21:15:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-352ec74a925so2694942a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 13:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770326109; x=1770930909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDmgphLqKDz+aCA0C3K10kZKr4JjCYwn8FOIZOuhSbA=;
        b=OD3F9wLHB39Yh/7tyPVzhjqKnYJIi5Hqlcac6FdDQjsVDJJ3JEz/gDfrzm660qGZJI
         C3AIEz9flKWTALtwxNMWdjHlWxSZRB1Ent/QTwHjxoFsKJb8AXe5Bt1iVSxhKmz2E/AT
         cPrVEDHoB8WstIQDucXwHWNTN1dBK60PrsGnOftt8k7B4GCfkha4yJ7SgtYSNwdHhL8f
         RT/RCDWSHOoI+Zau0fMK9qSVR7l87n9Kx5Ed9fkubivLikZeAWiUlRiHGOUy3ehRb/5n
         jVkzjK/Nl5qqpduuuw12zElnQxn11Ta2kGs6nEGG6wjuWMzQ+Lp7cZOpfzecbzyeI2Ot
         4UAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770326109; x=1770930909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FDmgphLqKDz+aCA0C3K10kZKr4JjCYwn8FOIZOuhSbA=;
        b=ewedO7aQ47KPtwMXjL/EJuSj1xkKbo8qmJZ+K5SU1mMWdqNVlziwfwlb0e81xxxcpd
         hFoESb2YMSe1aToCRDaxjbR3DStiZ4FWsb0uLk1lbDBIukp5rXIJD4U+7jqnC5Fk8gTK
         P9rPaYAOzISROXBOjhy8BoWWkCqYsrZ2UCJr8+c3cJTp0k2EEY5MXfI7KRJPr53AjpEE
         Abko2VZdXyI1/+daTfXUDeHaOJIKU7Fgtq7fEdRIZNeh4+yfCDTQJaJBWFXKRHk1AEy5
         Ja5DhFBk4p7G8ckidHdUdV0Xo7cmmzyw22atVNLjEh5QITr1dTAweTpFi5T7v6+C6brL
         EbXw==
X-Forwarded-Encrypted: i=1; AJvYcCXqqUeRjyS9e8GkF224png1hk5Gcp0zKUTaRfn3Jn1WOYeXne8WQ3y3CBx+2VIBx2S3fEsDSuEXetuGvMCl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2kCkJK0qcn0PpBk1bWcttFWHl8FP3p9cWb6Dui2i6QcKhkW1p
	XyBlx1EgjbaRmBwRZZT7cuJGDYpP7BryrBKpyhiz/fTvhVjA1AH0qEFDkNOGDMGfubbB/HrK+Bm
	MQNU8qhWFGekb8tgxWw9mlTQae/TYeONzC9g91OddyK432OCwIGnEJz4rZeCCKn3Iqe2L
X-Gm-Gg: AZuq6aI35ICD2HGuLyL/8r/I4JmEnmIduZisnMa3x86ZnT4xykSmoU6AtMRhUvmOi05
	1EDcQIYBL/v+31TZEZvUc5tfwstiL2AoM48dNCeTKFd4k6/UOgtx3cBN4LWglRtLdIo8txuwoYp
	m5nUolM5H7X7W512BMRscvCw6OfAXRQivl2Gf6lYNKas0hCSD2tY0Ifa1hgvcZCnrC7msRXBxO/
	amdcCnQ39QiN8cSjqNDVjN/05t7cBEzxUZ+4r+WC2f8nWNZ+E7TIXZp8MBpS42QapW+yNxowSjq
	lyjCuAWibr4l+g3ILrLlISfCoyXbjwuBv0YGvoxb3r42UsYU61HlasPg4lpiu4GtNM71S35yvBV
	l0p3uUUuqTdWgUvZoea/HrQV47MmphQcJfjaYatQFGGEg
X-Received: by 2002:a17:90b:58cb:b0:34e:5aa2:cf61 with SMTP id 98e67ed59e1d1-354b3e45d72mr286022a91.28.1770326109382;
        Thu, 05 Feb 2026 13:15:09 -0800 (PST)
X-Received: by 2002:a17:90b:58cb:b0:34e:5aa2:cf61 with SMTP id 98e67ed59e1d1-354b3e45d72mr286001a91.28.1770326108830;
        Thu, 05 Feb 2026 13:15:08 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b4575897sm74536a91.3.2026.02.05.13.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:15:08 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Fri, 06 Feb 2026 02:44:07 +0530
Subject: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770326090; l=977;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=2Dg8ed+l2fmonlP8HCtFZuEqCKKmhJBMQWgtRTvwncw=;
 b=eVTd7L6UzVkZt3QOi9VsdU4Bj4EbhfLWQOktFIOWibXnFfQXpuSeMYKk3jCaHvrN9Jt4Pn3aW
 OJUEFoTPJTGBw5+Qm6T+ECwEwX4o/T0med+iF0f9irQ9oqMbjF2o36G
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=GaoaXAXL c=1 sm=1 tr=0 ts=6985085d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VIFL18pQI9H-5eiSq9kA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: nCI3k_HA_pSyhFmaorQGEZYtyVCDyzDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDE2MSBTYWx0ZWRfXw+keD1JHkm/Z
 W2Ac+9GAqp52uo8GHTNOosTjnOB601uLfuowVR+80D31xNSsMSycLDbKUbCfD/L49ndBXnhNGDM
 ouCNNC2oeGr7evxFNBXWSYtyXIMTkqwwJkp6NyXIrVwQSnBMx+iL3oJ/QITblBH7h73kx27I8gl
 hGyUnK3RsxMWkwC4QGrJmY0/aK1dpXlE8VW7qgf/pBYxyeZOvv7/SsgbQxZIEi/BRUU4kkPYmFK
 5AcDoTVNddf0jg9q3u50qPNf+5oxsNvfQkLBNBMj6QRnCeQXuvPzt4VRQ4mfkGxyVlR7CNfFUSb
 esYf0gTMLH/xeeXaGZcgWOT31YCxiCrGdaN1SZbSHb4PIaYWiYGFPWVJ0mxzXp/rSwBExQ7sYOs
 ++hPoNrXI0zLF9E9i+fXtt/bk85d8Kw76hyWa3i599YmH/eU5gfJeAu/EhGjg8xi1IymXxwm7f9
 jeWl5DTiHxfmp70/ndg==
X-Proofpoint-GUID: nCI3k_HA_pSyhFmaorQGEZYtyVCDyzDm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91969-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,pm7250b_sid1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 037D5F785C
X-Rspamd-Action: no action

Enable Qualcomm BCL hardware devicetree binding configuration
for pm7250b.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 0761e6b5fd8d..69ad76831cde 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		bcl@1d00 {
+			compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
+			reg = <0x1d00>;
+			interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "bcl-max-min",
+					  "bcl-critical";
+			overcurrent-thresholds-milliamp = <5500 6000>;
+		};
 	};
 
 	pmic@PM7250B_SID1 {

-- 
2.43.0


