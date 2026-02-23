Return-Path: <linux-arm-msm+bounces-93708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAFnOilqnGlnGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:54:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8EF178468
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99CE5304A2EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77C4266B67;
	Mon, 23 Feb 2026 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2mOeZF3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="feuBfZIj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1639023E229
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858469; cv=none; b=QVLHY4t6+LZ89ogBU2m022sZdxdP/BE4na1AqGJ/Mju2zSil1rE/fY0+Y2sQrN5VXaR5tbhVEFaHdMexQapRiXGWDpJcg7ayDtB4MK3UQ+U8Co8APSKWEzi8zScIRDkFWeY4S71PXypPDU8Coxcuh2t4xnxT00UXmqpEMb5mbwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858469; c=relaxed/simple;
	bh=sEwBzOjB/f3NJuvDrRco6fASZt+0RTmwK2O3Ddw8o0c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a7Ae9Q0OnQ+n7CKIfjEMFIU0Vjj0v9ks6v/932aFewO8ZOCgYJ+/JymSpvHc9WR67+4ei576fgwMbSlqxanA5visWi3kkZ78FGOcU/+Cf/WJa5hmnqGeNoO9bqR7Bt7Gdmw6mp33t5RkHSodgeubP6qe+KIUdqz3mJGKgCUh4x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2mOeZF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feuBfZIj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYSoS3409213
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OHwCBrW3SxqQ6Y5IVCUjyp
	2AG+qjNnTeVNIU+Z6tI2Y=; b=f2mOeZF3ZOLWvkYO1xaEsGEMoQfjCs51pKnt64
	UMko0L5gTJ4UPtnPrJ6aVDABygw4jAl5cqjPU/emLCD4lidbiw+dgd6juxhPDk9v
	RXvTwhQSY56lQoqMCah43pURrqsHk3OpnZmYBy35VFQIcAMlKKTpZu1hS8qQ9nA5
	ztMs56qCLzAQHst4eqog+GHnWscZIIg//T+MiICUYUMw1Kc08ZBOzrL/5X9CCTLr
	3iCdL9NogXPDSR2gywj3CW2STMJwnEV2bxUwVQ2FwFVLZ0821xxNJ0fAajRgxiBc
	sqQJw3uXhI7TSxF0UoKrx3YnBs1g+b97xLRAaPvToxKL6IGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8trpqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c881d0c617so4107169185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771858466; x=1772463266; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OHwCBrW3SxqQ6Y5IVCUjyp2AG+qjNnTeVNIU+Z6tI2Y=;
        b=feuBfZIj31a2deMFZAhV6txYGczI7zUCJK1yYlw47EAeIn9Lx1+wUzNdX7C+34hCfq
         1vm/fgN+8d/9BdkoEDbMoMGKPWjFa8z0p/aanXzVOxaxSmGf2+3Z9CuSVPriJ0pqkNix
         QoL54JsvKmCUTM6he8a68uEK84Ro9LMFGPaizpTXH/8Tcg/uV/8CeY03X2rTzYj0HHT/
         /y56VVQoLNeUpfWIMxANO3EFa6B4TkO2hnPes5HRs5xoIJBLyOSwqasIn8Iwyh9bqDNa
         Eg8M8Yajhdc/UVHqmcmCsRj3HQAi6j3T0NCIr8Zoc6PkTBKpXd3w0UXPbyzJ2l3PlcNZ
         okyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771858466; x=1772463266;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHwCBrW3SxqQ6Y5IVCUjyp2AG+qjNnTeVNIU+Z6tI2Y=;
        b=gMQpZTK98WRy0dygQ9K9glD9od3/lGFeoHVptvYQJr9wKPNxCZMU3yZ9mmH7HGJVoH
         HGdrMW7MYaOVWFObMP3wtXXPDAN67OVN7rIcottm8EM0g2iE1Jh/CWskoYIi1RVzE0uR
         N+E/AsbzjxGA5HWlFCNfwRpYu5OZxs2Wx4JfIN0t2C4Nyj9YOApkBfy+GKYMXmTGgfX7
         ncEDlk39dVDSvrJ8oake2xANVZsh5Dgjbvv89VhFlbRrGkZyIejk8YTE/D8XzdcBHXJF
         MtwJzzcRsAgzVNz8HidkDX67BJYXWwW1V1XlgqAheQY0SexfqD9RCDu5e5yqoAbTHmzE
         41Kg==
X-Gm-Message-State: AOJu0YzE9fg9tIhECDhzLFUjuVUO1FeXd2zPZ5OvovUJ6FdDppASsAlt
	QofzYJimRJx1kZfZV6PE8cgOzUqrzxjhtVZGdcci1Z/3YNrEem/9lS3x9994d/GBl+NGVQaWLXN
	b/Tem/s5fsJfsksRKJM9Q7NiP4P4JIibPxqqGvNpBVSKgWXUy730fc5iqy5Jy0xIWEpUy
X-Gm-Gg: AZuq6aIXeowX8SJQqxGNMxLMkJa0GmACVQYO7iG9WdWCUlSOaiGkkzHRQb0Mrwuf+oo
	afjPwq2ouSPyoWQpSlgfpRuhvNUhO6n3qoz5SCKYjmu4LvN7D1j7IGtKR0CJwfFsHfCD//QarH0
	JUTa/O++yObsLM3rRmN0u9xg+0RJ1cC1fHG+cE0AUvqyQY8o/FlXHatuAc/zFguCU2T8/glymAX
	VisGdBy9qQDPxmQBpj/6m3z+PjnPGNSemmfia7k9ld86m0PYXgX8ih3H0Y/Zy9pPE+DtkktDpMm
	S8ViKlMq45e2mm308eUcqrziUeDfDyuIpxvsi5kHeEJHtkHSgAaCewG+yRwzfzW/cMGZGQyJ+Yq
	O30NAtJuFBy/4nDnsU1AgvcmrJ7L4kO/1qAR+QADs5yNuAg==
X-Received: by 2002:a05:620a:4587:b0:8c6:d64b:be43 with SMTP id af79cd13be357-8cb8c9d1dc0mr1126671085a.6.1771858466405;
        Mon, 23 Feb 2026 06:54:26 -0800 (PST)
X-Received: by 2002:a05:620a:4587:b0:8c6:d64b:be43 with SMTP id af79cd13be357-8cb8c9d1dc0mr1126666985a.6.1771858465974;
        Mon, 23 Feb 2026 06:54:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b88esm1646629e87.8.2026.02.23.06.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:54:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: Drop redundant non-controllable
 supplies
Date: Mon, 23 Feb 2026 15:54:16 +0100
Message-Id: <20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABhqnGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNj3cLk/FzdlJJi3eLSgoIcoFZdo2RLi5QkyyTL5KRUJaC+gqLUtMw
 KsJnRsbW1APUB5wFjAAAA
X-Change-ID: 20260223-qcom-dts-supplies-2c98db9b9cbe
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1445;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sEwBzOjB/f3NJuvDrRco6fASZt+0RTmwK2O3Ddw8o0c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnGob1k6vnfw8PWm4j+8E78WWMnOgoVljt+Mpg
 ACYjFufuomJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZxqGwAKCRDBN2bmhouD
 18H/D/9LXprexSOC9umxDNnbaFwI2NcgUqK7WWvknsivSdhzveLqd2xWf6xiPX213peXj4oQzVg
 f+QONtuThRGL1ArXaMXJXbjyDRScRpLTGsfi68Ud/ndV+cONqZk35WEy05cXRnQ50kaUJyZ8N7a
 W/5g5/3MJ9xicWwmZfnRDwi9zQliT7m552W3W9o22qvMnc3LTvb6JMfJANZVoRxbHVHhfa5mjyP
 NQU3d3ao8eYuLlKieiT5EIsqxX++cxb9PTFncPNHyzyPy7zxexc/u9BKPx/PcKbWyXrEEwyWuhN
 HZWfu+13kVoCI2eHW2mzC2m/jJFkyklLbewjq9AE9FLGwxUe1bzV6mQDjQ+uW4zyBqNiACG9qpk
 XI+Y77xIoCmWQ5rZaiD8ddgcY6uZYF6NAA429hAu5lHCnjCb48AQjpvpqZCtD2pMTkMkmQ9foAZ
 znf5fQ5LkeYZIq5GTSYrnM3o3527b82t+418sk6lASf4ysLbxdHAYqvMLB+HIhJCa8QLAk711by
 MEXChtMimMcLhZlY83ZdaQJ94DVQBbkRqkatdyIAVruXlf1taXmWQGVWn6FgnChtToFnFFuf8v8
 Rr4cO2mWcimv8Lwb1/HdkIpt+TRN96Rz50PyLDN8+JAmMtcHHWzTXwZ0AhLWp5YXylCaGcTNOre
 TcD4w3w07fjCAbA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699c6a23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-3cLnZj8YNrZoULhp2sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: iqh1wELGlsprf_OXRAK2GdZxmWo82gsa
X-Proofpoint-GUID: iqh1wELGlsprf_OXRAK2GdZxmWo82gsa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyNyBTYWx0ZWRfXzFVXxEUvKS+H
 0BOvYCg+gnC6G8p9WJ7cAURyp1CYHvzMD9Qa01Ku+PhE02Z7fPGy0F4vkbkwaIRXhcTIJwFVfcU
 X8ybQVmpzgUCQmaNDELjwAH88CDrIxUTG8aCkCZZ3v3S1UY1cZ/zb0ZVMcP5qO+K4u4wJtemfJ5
 NdshBRt+kcdsTYL1UZvA92ikJM5qxQRmfIv2E934qMCLgvHDRH4ESTgVqSA3GGbXzwlKnezK7cn
 Tu7S0NsXcYYegdZ2DP+Eqfzgig8zlsWRo4zPWqTW9TGCxOxsB78eWAyxmTDRzWy01KLAAlDWXkB
 dEIn1oN5gVln9JYSDsExQCqM4RxZrAokMEMi0/vYmC+dwa3e7f3wMufO/UninMyHXuPO3n85QRj
 ZHo2xMv5f9oDS/ARGfBRbBGQ8DS1eFKsEwUbImYXiGA3MLzYA9vxKeY59ymsTETS8EfCgT+6lsr
 FBy8JH13UAyC7O5n6YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93708-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A8EF178468
X-Rspamd-Action: no action

Drop completely redundant non-controllable chain of "regulator-fixed"
supplies, which serve no purpose except growing DTS and kernel boot
time.  They represent no added value and because of being completely
transparent for any users of DTS (except the bloat), they should not be
represented in DTS, just like we do not represent every transistor
there.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: dts: qcom: lemans-ride: Drop redundant non-controllable supplies
      arm64: dts: qcom: qcs615-ride: Drop redundant non-controllable supplies
      arm64: dts: qcom: qrb2210-rb1: Drop redundant non-controllable supplies
      arm64: dts: qcom: qrb4210-rb2: Drop redundant non-controllable supplies
      arm64: dts: qcom: qrb5165-rb5: Drop redundant non-controllable supplies

 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 26 --------------
 arch/arm64/boot/dts/qcom/qcs615-ride.dts         | 26 --------------
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts         | 45 ------------------------
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts         | 45 ------------------------
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts         | 39 ++------------------
 5 files changed, 2 insertions(+), 179 deletions(-)
---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260223-qcom-dts-supplies-2c98db9b9cbe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


