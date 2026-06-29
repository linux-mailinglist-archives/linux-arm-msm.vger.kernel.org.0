Return-Path: <linux-arm-msm+bounces-114853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jjWJF+UVQmqjzwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:51:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B20326D68B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:51:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JPcT5U6Y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AthzSxBd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114853-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114853-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 384D93021B35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630BC3A7593;
	Mon, 29 Jun 2026 06:45:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810303A63FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:45:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715524; cv=none; b=AV48JMLvxcZMZxPQ5PPHKcwdktvAOtyXzbo68CpIrOXaiynt5TS/O68gbchef3o92mAdFrsHLHoqvGyJgRmub/zCmFj65zpZA/koOIE1ukMkTy+xzofwkHJz2hB71y3gHrM+YvLmlgiDEprUyWMlOxK5ssj49vBwMqsUN87UVcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715524; c=relaxed/simple;
	bh=kk1qLiHbm9kGC88siDX2uJHWpbpOShI7URZ6J+nyVZk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tmhjsYab8aby6e7Mn7tLb4Pr7h6q0SWhZ3S+MIY3DD1zsttQ4r51ExFCFgLDqAZelFMfFPXErgeXuQhFF06rkDDyFhwD0JoLb2lCUKSRXbYj3jv5AX1KKqbqSFzk/8xIjbWlTU3coBt7BjEWH6JsQSQ4/62xqmQX/TyD9zqhNRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPcT5U6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AthzSxBd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NOl01766950
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8PdsckrsHW27B6ZB1p1bQm
	yhKvBOYA3Ngl87ZlyvU+8=; b=JPcT5U6YG2SwN6sUZGm8skqWqL/y7rwEVvNqtZ
	d354V9KRm3+fdLFC+6Y9ZNGJHE+t1Q1mqpJGXn9LzXjbFM9BcfJuVUPH20NBgBwJ
	jkMoXyRgV5TLu8vHoTxtetfWJyv557++4sRKOVeDhJ79r0t0FYYzoy6Sbhv8xuF7
	e526fJXJooakrCEV55MIaV1A+nt6Ng68FthhWl/EmcLaqBs4DH4VTmVcdvPNUwZ+
	imh3gAZIe/AXWgDKygiQigk0XhZiwa4mkEIwAb8o2bhJu3y1TXpywkQjfhtxuBFO
	J3D1oWHEBE9f5q/lC7elj37ZD+mT0h64h/n0jv753eXnbIXA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a540m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:45:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ed53abff8so333525eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 23:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715521; x=1783320321; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PdsckrsHW27B6ZB1p1bQmyhKvBOYA3Ngl87ZlyvU+8=;
        b=AthzSxBdyDYUUu5D/Pf8ptDyhYj7X/LweERe1JjxHWGjUHJBp91RaoQwX47pCjjpP8
         n0EqRysUzat2MP0UTDfFMFnAUBxSxuOwlRCYmsJPcZSbduarTZIMRq88jgWswbAg+lyp
         ZCpo5E22ubAeMPOPzWFuGYyiMCC2CDGjn4XtF30gvznwN+MqElyYl2Lovt53wgMe5bqI
         hxUcgQLLNmwcgBFu2evuEvpFPGTXcrxTmRadI2qOXOc/yLHfEK0z66ISFuJcM5Op6YYm
         fG9eZ3uSOicyWkE+8V0+h/9a34ulgN+jnd9PMa5o8zLJYcHciaULbhHslPpFb2cgzjQP
         9k/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715521; x=1783320321;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PdsckrsHW27B6ZB1p1bQmyhKvBOYA3Ngl87ZlyvU+8=;
        b=WTVoDi8nP/ZZbcSTPvaZGHBioJUIVwg8cLYGiWZr5V6jiiX45yphvWDuNG++rrjbMX
         tG7MvEFohwpOJv4lMnUnlXguCI0B/j7EnY46olIZWJV2SprveY3pkPTxI/74jxrl7l1b
         lbeDg8VUojGMknRkTBgPOYbnrqyjjT8ObCXTUgRK9tcoZyLyjpYxtXDdDgb4hWWcC5bb
         NlSySkv0DXvC7djtcWuhAiOQDriugg/TfBcuAusXQMoy4pvyw5mHO/M65CM3817WdgDs
         ou5da2f0m5zzDvoI4OBs/FmgOuQUdnIHvRPhh4coQurpL8q3fSFV0jNwapoCQxvSWRIs
         6P4A==
X-Forwarded-Encrypted: i=1; AHgh+RqpDMb1XH/piTv/eFtHx/vvBVrXOerCMSRZ9XU8mZ1NdD2hTZt8AlQMPyIYacpIP2F81ytSL8uSUF/dWj9J@vger.kernel.org
X-Gm-Message-State: AOJu0YwXhOoU52iTVsYAWEOA9UK+FunTdIGRSAuesFtGI4/3budlXhop
	Y48IZef3vQErrNMiBsO/ieTqjW8MhbEM9cdcJTzOYVhuu4FL1HDf3/x9OqIH1SZlAMl4s6lxglZ
	gJDeR77jCqAN0jqy+LNg55ilLkV7e3rvYsDSF+wWaSq95vhgegB8ssMSSQ+q6A0Ss4JBZ
X-Gm-Gg: AfdE7cnajjIMeFcnWlBVBlVzB5H193AHrwxnYlyU5UoqBRn01nDxvgiE3+2gpjdK2Pm
	jj7doVwgVAIeA9YovMI2ovr28ZnZP77TsRRjPBfz9RWPT98pD4QJZStd0/YDmyUOJPRAC6qA/WY
	3vJ8990SCy6RW3SNfeMh69Tn5TquoLVS4NpiDWtwxv6ogvyGBcuTBmBBCSvrON5iVRYVzkHGfB+
	6HnFbNUS0cFewcccDNywOEuhaizpiLVg3WgKktfCiJb1s9itoYPL7ZsEnWcUnMcyjlwW01xBJLC
	VJEnlZTEa8MBcn4FgR+eGo4YqV2xAk9EOIFDH0HBnPrfFwCOL73Gk/RU8i7/1q/gKXH1oB0c7X1
	YC9f29D163rSr2DVsl5a1ScP+x1g3Q1yJmzwUWBiaEvKsAAvi13BymAPjYxzZmA==
X-Received: by 2002:a05:7300:503:b0:30c:a943:ea14 with SMTP id 5a478bee46e88-30ca943f3d5mr10942264eec.2.1782715521005;
        Sun, 28 Jun 2026 23:45:21 -0700 (PDT)
X-Received: by 2002:a05:7300:503:b0:30c:a943:ea14 with SMTP id 5a478bee46e88-30ca943f3d5mr10942233eec.2.1782715520350;
        Sun, 28 Jun 2026 23:45:20 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52d669sm43580424eec.11.2026.06.28.23.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:45:20 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/3] dt-bindings: crypto: Add Qualcomm Maili crypto
 support
Date: Sun, 28 Jun 2026 23:44:34 -0700
Message-Id: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIUQmoC/3WNwQqDMBBEf0X23EgSMNae+h/FwxqTuqBGs1Yq4
 r83eu9l4MHMmx3YRXIMj2yH6FZiCmMCfcvAdji+naA2MWipjTSyEgNST8LGbVqCKFqjtDe6Qus
 hTaboPH0v3atO3CA70UQcbXdKkuB+1jriJcTtOl3VWf7jX5WQQvqiLFtfGDTqGZjz+YO9DcOQp
 4D6OI4fgChNmsYAAAA=
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715519; l=987;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=kk1qLiHbm9kGC88siDX2uJHWpbpOShI7URZ6J+nyVZk=;
 b=MhAbpbKRo7Zykw6jlz0gqg10926e4hrk6nA1uGswCGHP91EWYV+4HPlWpGir/87RD3v+ZBp2T
 OEXjZkgSya8CoSLiJOwKJjFudKrgaf3MEKZWSJOa4UQ6tS5/Z5iDffN
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX67qCrZHS1d7+
 7r6RUSngNdgfo3bRCDxK0kwEIpgqubyqtQ0RHD0PU8mr3S4Z1xX5J0WtmdNrdPdKOAr26GjIjZl
 QS7xVpdkOyS8/oRTmKkE/FV1slRMXvaoDw59Ark2nErZR2jojlcm5MvHnrw7dwGiDoW8ig7pNvY
 ak0nmuGyY7CiANSAP2osteTvKDnLWHit+Pas6dCYof4lRXx/6efxCLO2jhj9cMhNFmA1DdVdxHp
 1OArIWEp1p++attRnU7a76cnyTDuV1RbBAl5FPdPC81FMNAuYkge/UlteveyaZHnpe5YxnE3Mja
 ITxUsj51revgt1FyYOna4NKhts1ZmgLg9uAbiPhYUkbVqbkGJfMEuASajSIbGovo4SqIHSMFCsf
 ZVE+75W77ckt0+SCZPV228pgDxIQ3iJLJdLNLQOJ/vhyHS8ge6/ESL5vFVcgFJo4Zi/P6PqtSwP
 9xeUzCwD+4Z8vEaAtMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX1jabVtmQx7TE
 0n3hNMRsUkGXUke2jyGOX49apnE3G9lNn3kx+g5ZethvPvbr6O056xn1K65TDgnFQA1qrU6Qywu
 DxvMLH+Sq/Nk5/gDJetcWNeJQiZtu2g=
X-Proofpoint-GUID: Jd2DLpQ4sKiAaEFXkM45DKHfvAJ0yTsT
X-Proofpoint-ORIG-GUID: Jd2DLpQ4sKiAaEFXkM45DKHfvAJ0yTsT
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a421481 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R6wdMziQwWSI7NrRmIEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114853-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B20326D68B7

Add crypto(ICE and TRNG) dt-binding support for Qualcomm upcoming Maili
SoC. Meanwhile fix the power-domain and clk missing on Hawi.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- add power-domain and clk constraint
- add acked-by tag
- Link to v1: https://lore.kernel.org/r/20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com

---
Jingyi Wang (3):
      dt-bindings: crypto: qcom,prng: Document Maili TRNG
      dt-bindings: crypto: qcom,inline-crypto-engine: Document Maili ICE
      dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk on Hawi

 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml          | 3 +++
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml                | 1 +
 2 files changed, 4 insertions(+)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-maili-crypto-5d612f629acf

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


