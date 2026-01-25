Return-Path: <linux-arm-msm+bounces-90454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHG6IrQhdmndMAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 14:59:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9ED80E3C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 14:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E881301F9A8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 13:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F9B3242AC;
	Sun, 25 Jan 2026 13:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOHcw6mD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHhBqcwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFF8322B81
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769349461; cv=none; b=Mo2xdWIIqe/r0+bI15pLJGpf6NvWHpkYeYGvV/pvUuGLnahTvdLE2g/NZMprTnPoHttl/TeK6nCRawa8cbq8olc+lQfBQfj7CSjMAB8ozmTeeLE2pUzwJYLMdk6RT11iPfdsIrCFnLks0ZnZOcI5pIzdUw0evvuS2jelCFsEKwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769349461; c=relaxed/simple;
	bh=PJiHYLnSEuffYvSKM8ePxKvMNbsPyKyLyejgTYc0tWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aey6/oekzwDkfyu/ezWZHNz1rdT3sdiW9YOW50gwJnWTXQWs488u+fPBbDNoCJUGI6YvXZ0dOvQfCAXRCVIoJbm9x6K+HrNUZqfQIn85IOasKbvR04ZykChlVmAPwj6eDNmymSfRMAw4TgaQgGv92DT3OLRGxkbsIWEuAX6nNxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOHcw6mD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHhBqcwx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PCgEaa3131060
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=; b=LOHcw6mDOXCzJjac
	GuOVrVGB8niATKCfK4D8oKqM73woOJBTNj4ky5Ii9BmYcpXj+w1R+erUjMRhRNox
	RKV2dnbqC69rcvtMKcj1EKOMJ2U08c5mcGvIM/vjr6XfkmM3mFQ3dHJ0UQfLkT2B
	oHxDo/eQnayAKeu6aDaox4lPiUYx0q7Z92x3fl9g5bxgMzoxebX+ZYSMcMe57led
	8HlQZmxwo1IfH+SJq0+6B/MidirFDUmeMHT1JCi5XBaRYXEXbVh7rI3HmoUaQnX9
	gg0U2fDxVKUC0WH7uPWlKALwd73EiQxdeHkPjHEJj+46gHlQkvrMBm70kHVfrv8w
	gMQqwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xt6er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:57:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b315185aso18653785a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 05:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769349457; x=1769954257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=;
        b=iHhBqcwxOFu8wguFG4uWtEWIChXK6Ij1UeIs0G1238VeXcppNiIkdLszlMF0ijXaQu
         boBGs+FKDkJ79bHuJUbJDH2Ua0ZhwG8YEVJ1+/evJLC+7Tft4W1VjVz6hDxmo3fV+GXM
         L9Jux0JKQu/jR/gqTsw8TTojGOm7QYmRUAeRkZVozUNLB4flZMF4dBabccUKNrAa2Z0n
         5Ws0M11TzHDXUYOlNQhOFUi+tYy0kc7ikD4c8MQcC9Q9Wrd+7m1ihghf7LhA6wKOy/+h
         vnctzfRdGtn76CQBVQFg6WbVSzzCb9l6zLsfZnyRGgj+MQi5i0OaK7U2zKxwfl3kzHUw
         tB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769349457; x=1769954257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=;
        b=cSriNK622tIwL/jas7PDw0Ekf5RKVCYIvdEEMRU9CY1isJWMMamtIg0rljVzexGer1
         O8wvCgHK9r9cuv06GMunxzA30vF/ExplLD+XTsaj3xRdierRIyFUZF8QxgjYEPxXXSUq
         JACpNZQHcaia9tHhYyeTkLz8gZ4JJtdGbGsqy3ZNAhVJ2Zr6EH5opoPSsg2OeuFzz6HR
         GnlSJGwZK7aeYY/P2dD1ws+OMlGN9BKfUJeDWwRx4DCXmj/AgGdS3+IQhVXn/9b3NPAd
         4dG6PqzU2mwJ1rPEGqQWQsxTLpQJfMnYb3hzTiJvLB8mqSAUkYC4WT9QxVuk8nvV7hWk
         S56g==
X-Forwarded-Encrypted: i=1; AJvYcCUeRi+3aIjD1bfN3pnzJqqFz6eJebe/Sv8UAAefp2a0MBdUkFRQjGQEhkTSqGnNQtzySZS3FkPol7ycxNX7@vger.kernel.org
X-Gm-Message-State: AOJu0YxkmnMhHYqpnhfytxjbmZp0Yu6MWEAZrqg4RdSa1otj8lzNSq/t
	16CTZ2251NVKIsEd6RGjpFCaJHUcrPNYo5xZCWUoQpOEINn12pSvAbV2Y1fBwidzT36fJ2YD2ML
	a3odS2CK0auDkMBUCkoWXAVphZjdhe8c+prsvsznn9nieNPktQVHwCXqCq4EaaHgifNAX
X-Gm-Gg: AZuq6aJp2NozGLI7uZxRhV6zd8M9EfOOiIl1nujTiofD/Xc/COqdsjPyv5pO58zoTol
	dJiyLXgHhmZySleBruTIsoio2THFO96asjZJzzciiOtR3fHtX5/hSdHMMvyXgGMIz9OPtCC+ZvS
	70suPV2+QxYgeCWTnBbiISARQmB3/Cf5BauQ2J04s717CPX6SF9qnvMfMXP4h3le6thTia0b38f
	jJAKMRgHFQSoOHcoLblwomKObIe6Kc41WhQccpLXs/UiWzC50WIQruIYKlAgUyEKfr8z/zsTJRy
	wf56cNLoYlO8nPDmQKI4cXabbuGarMl1vVsAK3GDwlIvB7bGOQuNM3w/fzNZEKF8DrN4Zyt4EMS
	d6Ysvk0pf7IFWI8hEDbHVD0xXrjqK6mk2lN/X79jZ6LSZhybxaLzvk+KCjQ6YwV8SUyDtHLZ9UE
	uJjScFjnY2JWb4eFdG5ZxNG9Q=
X-Received: by 2002:a05:620a:3186:b0:8b2:f1f3:901e with SMTP id af79cd13be357-8c6f96491cbmr168449185a.65.1769349457424;
        Sun, 25 Jan 2026 05:57:37 -0800 (PST)
X-Received: by 2002:a05:620a:3186:b0:8b2:f1f3:901e with SMTP id af79cd13be357-8c6f96491cbmr168446785a.65.1769349457033;
        Sun, 25 Jan 2026 05:57:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918a3asm2033621e87.52.2026.01.25.05.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:57:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:57:26 +0200
Subject: [PATCH v2 3/7] arm64: dts: qcom: sc8280xp: sort reserved memory
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v2-3-552cdc3ea691@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PJiHYLnSEuffYvSKM8ePxKvMNbsPyKyLyejgTYc0tWs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdiFGaLW99muzxJywHSRU4QL0CInh0ijm6/1tS
 VXMxqQcZC6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYhRgAKCRCLPIo+Aiko
 1QA8CACXF0air13II1RjZNCuq+JSreRpmF0u6az5u/M+Axz5640leSRd7gq7DcPgfqg2SqqyCwj
 SYZX2CJDe3m0XxqN/ZpmGi19MJAed3gMlzhx+ipGN8SmEyktO98E++kfNm6zgzydT8SqGT37yx4
 jdwfrG9wWR35yjioJu9r58vOOi0bJtu7kjmh4ilIQj+vv3OHN5nxrdILnBXKZT+ftZHrtos+cb9
 eip+d1kZNJnC7YITqMSA3MT3+XyksoArIYQbkyBdOuf/Y/PqZEmuQgTz2ERr2qsph2ypbvkmhB0
 jnkKzHDpmfhlGdGM/tBsbiR+OAmsSTQrA4Du2Nokc7eo2m4H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: xfAToUCJp7n3cCQE1ex9g6_jrY_NiqxN
X-Proofpoint-ORIG-GUID: xfAToUCJp7n3cCQE1ex9g6_jrY_NiqxN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExNSBTYWx0ZWRfX/UkS7bDkGS5r
 8U7MelVHVMPIj2XV5zOUDt5+pU32QuwawmgCAVNDjGcbdqsEvhMLRrJnq7x5eP3PTnHQN7Y6FWM
 yWpSNk+fFBkAaT7q4nL4QjcRpx3zlCxiBRsCcctYX9hkskpsmoQT5l2QnZm634mvBRLgCBVF0qr
 5Kskhz9QmpQdrV1r8K1N4jFU/Q5ArtfnGnfjygYXQDVe4N9Zy5/wa48sJLkByQzK3p1zuoWrkym
 oHESYlyw8kL8bcY8h9PjpsCZOW/gaYzZAy8bCdzg/BocLxUoIadq9jJtXX5BLfDXHukerBDvd0W
 rpDT+0cW6xl+YnfZQVSVAiyfZVsk8Y+GjBv4U5PO6NT2ec2SKIlgCmc2R4mNrNu5F71sBqOqKbz
 dl23EzJhmcT5UcMPc7+PmLigze+jNuQUoFRmf/XYriYpeU0XU9FBwdBNAu3swhfo+v1hLpL/GxI
 OT6SRt/wNkqyfR6W4Yw==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=69762151 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dWPP9-k4-ZVWm8qm6WgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90454-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[85b00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,86c00000:email,8a100000:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE9ED80E3C
X-Rspamd-Action: no action

Move memory region reserved for the GPU to its proper place in DT.

Fixes: 6e9612ced0c9 ("arm64: dts: qcom: sc8280xp: create common zap-shader node")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 706eb1309d3f..41c57e7dc433 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -691,11 +691,6 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
-		pil_gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -711,6 +706,11 @@ pil_nsp0_mem: cdsp0-region@8a100000 {
 			no-map;
 		};
 
+		pil_gpu_mem: gpu-mem@8bf00000 {
+			reg = <0 0x8bf00000 0 0x2000>;
+			no-map;
+		};
+
 		pil_nsp1_mem: cdsp1-region@8c600000 {
 			reg = <0 0x8c600000 0 0x1e00000>;
 			no-map;

-- 
2.47.3


