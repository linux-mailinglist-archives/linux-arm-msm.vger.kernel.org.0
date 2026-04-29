Return-Path: <linux-arm-msm+bounces-105233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG4xCz4U8mljnwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:22:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AED964959E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAD383021B36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54563148D2;
	Wed, 29 Apr 2026 14:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLmtZVB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZivmOOOS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766FD2C028F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472167; cv=none; b=Kwe1Cl8tCGt2mEol7++jLhg+JWhA2CKJNKrZDMFxW7HcUDM6i01eltabqxpPf5wX7CaJ454+5p5yk9qvpGGrsunUBKtnuaTT8O54gnVrFR0ykwy1iCZPPMBq5rfjVGdmwmuUuypFKYgaFmET5Q2dcZ11Xh0HEiQpdpy9CuKwJRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472167; c=relaxed/simple;
	bh=p1psAY240TWjrNT/9/A2dEWv0oKUcybspgY7ZKfLuuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxi5WXT0RSyEBe1/uCsu328mRrRXEY/CDfXuQOmn0yWpLjlGynn4Kgt+AFG/uNRtdmJN7BLo5UTXdtBBqObr058uEIyxCmG5jlCJ2/kLYYZ4juFLL+2AMN6h9o1+pAXPfjCKw49BZpJmvroc0c73tXUR4zusH4wfniTm9dEeT7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLmtZVB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZivmOOOS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCLxPM2485195
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMmu6Z1AbggkXe6d/8V5ix+QevuBAB+OmmG2XjWhkEc=; b=lLmtZVB+ljGYLIap
	DzB9ITB3OjLrgvcLtIZ2KJF8hMFWYGod1IzWcVKu6JmZHXouJBcNCNfqYtL6r8vN
	OlEgvocC7HV8nwTctrOFuwk0Q3JKfcKnetMvIO6nrM+u7QGT8eDgooBM+OyC56mO
	JBDcXDXChsxCp7utqjXhHCli9VUCUHEGsAKr3g68MnUFxMG5TJmZg3AKiPLJGajd
	3DaPm6pd3+i/JDb7HWhSxcVXGmuW0rF61uqnxT7vXJpz2dKNWxVYbQXaIkMwD8k7
	MSpRxot9k4IouIUeR9NyM6N5bi153EtNwiG07juGc8mfCZxGnhkFiqMMW9sB9IKa
	YPT8CA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx90d2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:16:05 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-64956932a51so17680388d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777472165; x=1778076965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMmu6Z1AbggkXe6d/8V5ix+QevuBAB+OmmG2XjWhkEc=;
        b=ZivmOOOSvFGIqvMXa88L6CPsebBjKmZ8Be323Z/RXayiuQIIGH0DaYqsATcZq6tYIp
         Dq4k3BpILOeJSqdt4s+dY3fLrWzC49WvhGoQvRM7oDlaqbzR2DSjyhMS4XlKI4ZAByUd
         uWQNW+c20KiyWt/Kd6OFj4UZ2D926fgNsVzBe7QW4uwKJOx0mT5dXJkaocZu4ll2PIxx
         WVnmVs9kKI6v3axE9TnpcoaJzS18rLUjz4Ig2Ki6WW3+zw/PzZrwRaLHHvGshFGwmIWg
         ZNr92PFWKOzOIvFO2fGuDZdbFU4OGQ9xQC4+/FaLxLnwfXqJsGTWo0tm9FJ1ZGvtdRrR
         VuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472165; x=1778076965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kMmu6Z1AbggkXe6d/8V5ix+QevuBAB+OmmG2XjWhkEc=;
        b=ebFOJKjFdLOfnyeex+B1v9OpVV9l/+M/C0UfD7o7w+o6HA8IHjWwdQYuP7zIa5Uy8B
         vsVm+XTmISx0VxaFT9UjT7hL5eKQdZjeba9ohU5Z3JEvMZKpHTlPpxwG43jd3J7gsJj1
         gSG3ta8KCWl4TPwfJN9z5BuOuDkRgAVZTMr/FVZWPnMJ0XOtXH+T7xVO1sIROxF2lFUy
         anJBA2w23a9/OQqRWM9NUXhphfUNuOq7kLNnLcvRm2az4PEQXaO/UMraxwn+QOxXOQGr
         UipAHSFFXWYaDdncjM9EqHpcf5fYomSchl8EeeD2G56Fo6Z9djt4XrLULFhGYXkyb1f8
         vWdw==
X-Forwarded-Encrypted: i=1; AFNElJ8Lqsy1u+9ReEEL4iu7WrTVohzwX/NHz2ARblaTt5ly03K1BDl8tNnEYJtbpT5CPykS8UZlpEv1SUS/utD6@vger.kernel.org
X-Gm-Message-State: AOJu0YwgewnJ+ckbV9PR18/ugI89uYZ3g8af098X0z3pbHXu+0cGdGUl
	rQ4bFT29DkWww2jaZvW1NO4RYuB5z4kZHuvXgltGiFeK6Yft+6AJdqwvGNZcd6G/u/2ibAZ3LI4
	vgE+3MtVzymbOs0bRlig5vkfWLhR2W4HQgL+yOR1RsQoY2cAqxQu48sOSnKgaZdq+umUi
X-Gm-Gg: AeBDiet8DOaUnoaZDGB4TOsPhSKNeYeGT7uLuEs5KsoVepyINpSpN1spCInLJU+jJYc
	E0AHcDdwt7llEtZl3z0Z61CoQ/KQTbap45Yp87165RshrtnvZl1tIkkoKYdbbV19svmqLTLh0iw
	CbIG4uJef0bwgP3DXKffGNh7xk1FWNl7SJYVHZt0DznOazXQDMSMe+t27KcSZm3xLpasOXEaOTc
	4TodlpSclcM0BtLoonnBMGMSpJJAyhiGY7Luk1pHDqAmxLCJdiSVjInGQBvzTcktiCRT5pd77AP
	nFfUEZxiQ5x03PPn83zythaGuavsOqopsq7vMLyln7JKr2eObLdVjkOxFmbyfjhM0glp0Z6pztk
	k3HwfHoy37/sT8/5buq9TaLZ7RQyTXoghJHMY1PRQJy+J1TDNIWmuEmZ4R0Apo5Q=
X-Received: by 2002:a05:690e:438b:b0:651:c6e0:6bdb with SMTP id 956f58d0204a3-65bfb5f9cddmr3360820d50.18.1777472164397;
        Wed, 29 Apr 2026 07:16:04 -0700 (PDT)
X-Received: by 2002:a05:690e:438b:b0:651:c6e0:6bdb with SMTP id 956f58d0204a3-65bfb5f9cddmr3360759d50.18.1777472163749;
        Wed, 29 Apr 2026 07:16:03 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff2c2eccsm1379533d50.0.2026.04.29.07.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:16:03 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 19:44:59 +0530
Subject: [PATCH v2 4/4] arm64: defconfig: Enable CAMCC driver on Qualcomm
 Glymur SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-glymur_camcc-v2-4-0c3fd1977869@oss.qualcomm.com>
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
In-Reply-To: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0NSBTYWx0ZWRfX1wUgCpLKXyae
 FO79Lcyct0SB6rmYvRmTmmvQrOrvi5y8b5ypxJqF+OpI8yZaZc+E5n21BvLbHpxyHhvs1GvenAw
 1WsqLgS3jL5EnUXnwim+i86zZv2LSVVswohbhYaBKaEB4gExcNzduUMNxssIMmzeSntiUxJNYin
 mpGMoF/ZOlN4WmqDEhjVQfKDtGKexmRzHOSakZcyJU8EvbZYTH/OehmCDgOr9ytUq/kd3heSE0f
 3/oYvrkU4WcNClsKZpWGUBkAzcW3HbkzCs5n931BPNLYQOWfQDVz5pGisToImVV66Bf41HgQx3k
 FnszQHXFyj1Wt44O4wQhrMW67HtC49v24MIug/oo8uy1lXHUcEsCnoJv5QafRhOdpzknzq9qAdz
 UrW1805jLaIaHig7YDGJoKkA3FskIGDdSJiNyvwaMCD7LglPoa07pRL9drzCp+R2bVMagcb0c+u
 9ndhO3cufsPN6u57Zyw==
X-Proofpoint-ORIG-GUID: ZincaIqp56w8ec0HVKlecd5ZyWBFD2lN
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f212a5 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2tOI7iOMnFxh-ToW9usA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-GUID: ZincaIqp56w8ec0HVKlecd5ZyWBFD2lN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290145
X-Rspamd-Queue-Id: AED964959E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105233-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Enable camera clock controller driver for camera functionality on
Qualcomm Glymur-CRD and similar other platforms with Glymur SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e44e83bc57812aaed21bff1b12d36ae4a373ce11..f5aa905a6feb48e7d65dbf076f778bcea54aef02 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1478,6 +1478,7 @@ CONFIG_COMMON_CLK_QCOM=y
 CONFIG_CLK_ELIZA_DISPCC=m
 CONFIG_CLK_ELIZA_GCC=y
 CONFIG_CLK_ELIZA_TCSRCC=m
+CONFIG_CLK_GLYMUR_CAMCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.34.1


