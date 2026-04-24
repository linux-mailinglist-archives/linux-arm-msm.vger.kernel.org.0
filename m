Return-Path: <linux-arm-msm+bounces-104429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHUkNotI62mWKgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:40:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6922145D3DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D23F30074C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027FC366046;
	Fri, 24 Apr 2026 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z08zytSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JaEzAbhy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE0838F931
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026987; cv=none; b=Hi1VSxkUD2jYqWXz36igT1EyB48C1GEuDSQSlf09LmcQ/uPZttgxzBypnNUUfaFr04Sqnet7GJT0Tkb4IWfWUS0KJSWR2ILcaoxjVKcGp9LOStFsMhUQ6s5ELphmMuOhu15rHHLPW5rZ4xTMtO68hzchFxnCVn3UmeD4AqvsGjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026987; c=relaxed/simple;
	bh=wGDpoSZqYJqDTEnEAQVJ/qK42MGtGFYK8KANTOjBUSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jo2ZKpTj8QG7KiT7C4SHHLFPYoynXVfqv/BIwmGIT/Fs9gta0elTQFFZhFeeFoGlzJ4nufY1OhyYzkBze7OI9W9iHF7rJZN2LFBN+1oeYEG44mhS7U46JzKMOIpNQ6KeXO7j78YZv4IQT5Mqmpync+EHuCLv8mYkeHVxvE+4JII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z08zytSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JaEzAbhy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7ZCq64167719
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y2wYoIFnM6RKKrEDd4VO/GKMY6ecMXwYhgCl7ffDFpA=; b=Z08zytSjetp1mI5L
	7txLAiyAZqP54Be1bpuL4UezQW8cL+/jgrY47vRBtDH1RVNao9M77ZrUDfLGPNSX
	5ihyEzqJ0R8325ziJT4/icJ1639Y0s0bfiRExLBSWJ+5rB92sJY9PluosMyR7v4i
	o++UEJgbIagLqzyuLFCdzqbfv2tMtIiPyG2AkVOTM1uWYDkajjke9Rb676qqFnqi
	6Vu7VEYsdmnjWe9ZAF9HgTMzNVAA1M9LapbZ3Z3w1t36V/XkzpY4iIQhFZUJej5a
	k6E/+i+FZ7SwrggO2ogAwPZjzZd0yANxwX5B3eZ2oWwDtw+CsgX/t7C4S2vKhaIo
	LYlnGQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n0te8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:36:24 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c8d7d4a79so5701075c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026984; x=1777631784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2wYoIFnM6RKKrEDd4VO/GKMY6ecMXwYhgCl7ffDFpA=;
        b=JaEzAbhy5JDGCen0kUBxrcezXxtXf8t2KuIVOPlzGSuuO+tYgk3u9HcxzfKi+b1Lsx
         HGNDMEyT3puliMR00n5S3MY1pICLM7jUy0nwasP75d/5R1hmsWabPWrhjksmgrZp5jQC
         hLF6vFwQm/hxWkCEJdxQepNYXEzkgPrWuX3K5dZbw+OGroh3UHpECSql1P54G4E8uSNK
         pia9k+5Y1zBS8XhKNxMsnudH3w7Ff1QY2eVh8Vk0D6rzB7Q4hRNEmYIs8wlm0hDBcaaC
         hsADwSmdQ7nyN4VQg053TDvkhc2wex4G+yanPsNrxlXXW4xlcGxnZcvxaJTGtQUbW1Yy
         ml1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026984; x=1777631784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y2wYoIFnM6RKKrEDd4VO/GKMY6ecMXwYhgCl7ffDFpA=;
        b=PjdDxPfnwTyrvuVcHpm7R84QsfoQJRO6RiK3DHJ//CgfCfDFInOH7KoUbBa5myUezu
         D3YZ9VANKc99riYPitrQwuo5jcMuFVhbACQH46/0uvQmRYlkIX3M5cXX9iGj/wyFy6Tl
         4qz6vTfp9d8t1ZXws1fUKHJwRTJYw7foebvOvxkgxX9LkcN/ya8Au09XYBVIWa7j329U
         2io/j8MwkQHdlSE2V1r3Am8JFYtmquIxIwUcZxrxBID9RERw6Rr3DcNp3G4amG5v3QQE
         tr8U7H72QrgCclxKE+8v1Iv32e45Km0gp+UCH1giT6OwkYuszhvc8tf7l3TI6Ap1Ug1/
         ucIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nPi8yEgshwSHNdMkl1QVK9JzK027RUKENG9qiGmVRpn/I7GmNwGms9jOzmLAP1lvrdZVjaoxqL/H+9w1K@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0od6iuyvsK001BAszq7fcmEMI/yBPD5IRJA9UNMT75kpbmck
	VHbxF93rXa26fbJBjzeB6R3S6qReC3F27TamjZgkW98Uq+PtfaTUV5UVxOLYMNGxMcmNe3mYIre
	tKUDWTN2r+4BqW+gN6G85ZGfn8Ivj2qb0spAvkcpfec+OWZGpDnWA10w4AupaXv740uI3B8BRuO
	8a
X-Gm-Gg: AeBDiesd6gJv9SSpPPll05KKK6rxp4gWP4amPu94nzeGTZtsR4MO7A0v1UQJ1gQ2JhV
	i2H4z9AjQx6O5t3QAQ5NwQeDPT/Peyh5abAEDtxdhGaNVhnqZhtnHohUyZZmy9BVQ1OSAAiFpVZ
	mGsdsYUuoPDTt2pB5XIGKxU9ehnDjH2zKSN/I7MD3iuTTfJ0aUUlnAHXYEDa3cWpkfOswSI8BLC
	hGx0fq5JS7L1LR7ghJ791qthnGtnBCXmRsmkFR8oKEfwhbglmACgBkFmyg8eE2EfWEo7R3ReTp3
	DcS+u6Ziyz4Uu3pyItBF2GGIJ8nTzroEXQS4avdeZjDOvZIdgaUOhEFQBtZp/V6+f04T4EEkIvl
	T0gqEHaOAc+bqvQ54dcalDjL2k69kU1Puog0vUl5o2pDLIwAhOuouTbmNtt4dkGX1T0nA6lBH05
	rcpVARVQ==
X-Received: by 2002:a05:7022:6882:b0:11b:923d:7753 with SMTP id a92af1059eb24-12c73f6d69dmr15463294c88.3.1777026983625;
        Fri, 24 Apr 2026 03:36:23 -0700 (PDT)
X-Received: by 2002:a05:7022:6882:b0:11b:923d:7753 with SMTP id a92af1059eb24-12c73f6d69dmr15463284c88.3.1777026983097;
        Fri, 24 Apr 2026 03:36:23 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm9187846c88.15.2026.04.24.03.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:36:22 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 03:36:13 -0700
Subject: [PATCH v5 1/2] dt-bindings: sram: document glymur as compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-glymur-imem-v5-1-18ede63cf063@oss.qualcomm.com>
References: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
In-Reply-To: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777026981; l=833;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=wGDpoSZqYJqDTEnEAQVJ/qK42MGtGFYK8KANTOjBUSs=;
 b=OS9+gMHu2OM0QAW5DD2ThGSJqyhsU0z5lYbM2EGK6qFnU5VPJoi0iiJOlhAT44iiU25snLRE/
 3ONRLoMr5UtABBQSqTqvBKyoullriWbhOWKgsRg2subZbVbotgNMd+3
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: 6OdUKF__34JGXPlWH-UdAqMhpAs_8ghE
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb47a8 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vpq1ZMNoxu35JrZUYIwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 6OdUKF__34JGXPlWH-UdAqMhpAs_8ghE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwMCBTYWx0ZWRfX/zmlPIf+M/mM
 1tz0fAyZt97SBoEtYcieMzS6Ls7rZzvE9INVieWPfGm2WZgPMkzK2RG4tx5Bd7tr7ZIQIZZKimZ
 HDHNG43Dtv4cGqmVIMVnEZ8YoYX6W2QIUzTljesvqzfFIFul7egKcryE2D4SKW/55+fEDpJFTfP
 vQKOJ9fh3h1aKT3U5nX4EEfSGpmewRRflpVifgGwEK6iDykPk9P8z+VWoi/q8YPpfgtk2Q713K6
 jollJwCJpl2EpfewfDX4KPWOslrXHzvu77/BPT8UYq73ypi1dmhr3ZijJ0mhxnuJrCZECUb4nl5
 nENTbyICVSR3JvbllwSyvvPk6Tg0RjC7EBj6dNu6s3FZP5BAM9Hgj9tT9QHnMQsbKYWpvb75RSa
 xOeVMfQu2X9FCXeJ/DtXgMVnRt/EBq9Kr/tgXDN4ZBI2P+FPbFbEwnJEE0n6IN82k18guSTX18w
 5HJIhO7clmsYR9adyRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240100
X-Rspamd-Queue-Id: 6922145D3DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104429-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

Add compatible for Qualcomm's glymur IMEM, a block of sram which
can fall back to mmio-sram.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 8985f89170be..0f7ce2f458b9 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -34,6 +34,7 @@ properties:
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
+        - qcom,glymur-imem
         - qcom,hawi-imem
         - qcom,kaanapali-imem
         - qcom,milos-imem

-- 
2.43.0


