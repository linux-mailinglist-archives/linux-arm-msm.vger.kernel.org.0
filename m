Return-Path: <linux-arm-msm+bounces-105019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPZ9JcrD8GloYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:27:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1C0486EFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B26A73044A85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791C8466B5B;
	Tue, 28 Apr 2026 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtAn6knq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhiMwWGK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA97544E051
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386213; cv=none; b=mzQHnDQPdFyg3x1+nnnznDwd5zjTISWYfv6zSofPd+rnopz1IowAO/uw+wsLBDE3CgUmDz0qFtU8lu2Ctp2+bp3DrNP0YO1NOUnN1os/bgBbVKpn8OlQMcIdUFhtxcCzmZrx5DT0dJ/msAB+fctkPAEg8/bOl6PuljjtrG1KYts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386213; c=relaxed/simple;
	bh=8aNLvyuCs0cA/dQVyyMYQTpbdYd3gLaJzFwxfD7t/3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZgH9hJCip3ccslovPpDt9Yx7prdXgeMUvMxSEmbTm8dcl0evJV1/ONjZy6Rh/ec+tp9wk8Hb6Xt+KBmRYXmNspG/9d/01nQp7LEl7K4SbFYknBTyeWtQ2uZCh3CU125ZVnr2gpdNgt2AQsT8Ij3HcH1hzoahRnAbfxVo6byKoGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtAn6knq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhiMwWGK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9LfWb663125
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jm6l6UTLyr0NGskSQ/0c9LsflcrnDGa1NCLAOOsHjZM=; b=DtAn6knqeUmwx9Kt
	yl5DkawW+RQTgBprHQ4phVtcWPE7jBsnsjJgw/ee0YFczkz+EmS6GxaLa9qefrjy
	285x9ymwBvfViyaLyksWqIX8SLt243kvbWvUMVwKepOIXt/q/qaJ9msPNOIZ6r1v
	tUjKo1nOMMERMOKRjwq7/qWcfvsbLG4Upaacz7THphct2lW2FasJqtwVaLUNj3v6
	7k127p/VB1RiM0iltEkZUuyAKIAExZi2r7wUx48Nbv2PHdyeRxglifKabRP+lQif
	bnhT4R13shiAIqp2BYCpbPUNEvt7SFXSCSwyE7K2rxi3OJcPKm3bv/v3T13HXrIt
	JkSH4Q==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n4bq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:28 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7de44ba64e7so7409503a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386207; x=1777991007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jm6l6UTLyr0NGskSQ/0c9LsflcrnDGa1NCLAOOsHjZM=;
        b=BhiMwWGKSC1alLhVU2T2QFBceIihX5bW/wNaAehaBlGFj5wqyA0+Ik3C5lSW/KkdJH
         5M9EWVj5RjWkbe9+ijA1Y2li3E0sRERTWb0WNVf4EChKXLqoqoykaWqoOeObs/w5DJ/C
         evI66CNGwDhewDv78D8ZG+Yt6HhnYyVL/K3kMXpLFLqeFaRNkSk9v+7FZfTBRnLJOabn
         uGgcXVDTnuevrsv2LwhyhVqAMHBuqbqED7ocUIt397U+tFIWrlgch/2sYY+iIZuCsCCE
         mGSudBuRVPhFtkLLVk10nkr7yk/Waekd3Cuu74V6JcWALp6K16TprLLAWaGiQXTsxOTJ
         wOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386207; x=1777991007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jm6l6UTLyr0NGskSQ/0c9LsflcrnDGa1NCLAOOsHjZM=;
        b=L3hn3IImRGKrmCODoYPcO749o70sY8Dm827nPU/mkgNmqj0K2YwxdTCHhB+OTxEuRa
         uJRG4HLz94yIQVOET2tHAez2quTXkc8HJM+kxetdAa/ank1U7FrtJsE0ZKpnusk+VWA/
         KX4URJIker7a/nI1ynO8pXtD/5Y25Ql9fWELKIH7XFchDnIRtrkabnE0SOLJHi1MpRng
         iLUaSzPx2ZjAj1xhgxJf4kDrIybLHAQf05WkLpoCrGyKumxZjzsMWdQWRG4sPfd/PnmX
         e5LDnRPJUfEmSJHNVZ38zYY68SncNrXlxWVc/GRU/FaRparLrF32T74ducLAsAsyGGmv
         igrg==
X-Forwarded-Encrypted: i=1; AFNElJ8jedpA3lY+nzoNaUNC4wvBSxmGg+F1aRxZVtrmifE+uoWRgOtFCBEO+PqPply7DtgCjr5Z2BGLJpmgzD4Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwPSFTRawrpVAU1wt0O7EmgIEfQu6D7Qusw8XG15c3IW97wJ9Cs
	k35GgxVlnwSDkBS4GnWEEbgc9m3+6/7bOpr2sVNLwCIynM0ocTrlOg1XT6rlTrpuAvjiLmRedg2
	nAofUaA37Z27TSqiVCqGzt3woNGMqjl0q8rMr79m8VPbk1P9Kb2A/MgWalsn6SadxBfCp
X-Gm-Gg: AeBDievMTDtA8eWUR4WMnAWo5dcsPDxfO/Ht8p22LAXhDH32/owuCbhyS26a0u5VGuG
	hcIAvJWXxx6RSNVHEuRk+hffd/fOakQZe/KRzyj3RRdt/Apgp9CxqXnLCou8GC5lvuRF82gpw09
	y9nb6K6/KjXk00C2CDscFOPisEAXJ2OnfH53eogKS0cJcIsZLYfGVN06yed6gMsB1YDPVT7QmT9
	0lGV1ikVGY+9JFWmQ6VLwQIxYX3yg+kanFblm+X7Ek+kobuAU7fIuXtc8aQscvjI0PYRhNOrLWE
	utvoJMzi0MmhytDW5Lnd7NL2zT8vAY6ywoIG7EuRiy7ImHcvN6te8UCC9PleHs+0s9GWQzqxnMT
	joTegJdx9tgvxAKUdvc1a7R61ijU3Dq0uK0aIp7ydW73PE2Kbi7HfRRXxjFO87ub2KVJ08NCtNv
	zCN4i8fsFjAimJPWbtMa5WuG2Ox9M=
X-Received: by 2002:a05:6820:2d0c:b0:694:a362:e3ba with SMTP id 006d021491bc7-6965cb93af6mr1550307eaf.48.1777386207617;
        Tue, 28 Apr 2026 07:23:27 -0700 (PDT)
X-Received: by 2002:a05:6820:2d0c:b0:694:a362:e3ba with SMTP id 006d021491bc7-6965cb93af6mr1550261eaf.48.1777386206866;
        Tue, 28 Apr 2026 07:23:26 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:26 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:11 +0200
Subject: [PATCH 6/9] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-6-6ad23e75190a@oss.qualcomm.com>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX12LgN5CQ7Hfi
 yWWkZ175G6QbcyqsXwxENU5zxaTbJx1eVsUSqTC9h0Cpn2nHQJC0W+xCwc5L6LPC3q1Qfh0Ovqu
 uuzrQerxV7BHXhTGAbZdTqhHxbaFKlwrch9Ulm07rEGxXNPEGYJ8casZfnsyIGmhgQXRmn6lNH3
 fdnh65myGOP2M8HkOJkQ1WWDe7RVO4nAwr+kIWqv1tH/iJzzmnKYuqONBoHn6dzkYnh9c6WawZ4
 r76YaHOoOyVZRFixQDakIsce+yu2h2iZstE+8ybu2kCVoAAIjMIBecZwbYokiV6gqsPErZTb+Ci
 CUTGFgWPw8sELH0b7peMXF7QFjurlJg7+8QzeIGr0d3EEkTyLonZXUJ/0AJOHy7+G74W7vtvAZe
 XsEKCUqFIvuD+CMoVqQ9fRD1wmvou07X2Tsgi6jXxG1Kyx5bPo/Hk7cXBZ0WwRS8n3tHp563c5x
 z520w0sLqVrfADiB0bA==
X-Proofpoint-GUID: -p82dStMp4f5YE2aLbrr3Xtz9bim6BA4
X-Proofpoint-ORIG-GUID: -p82dStMp4f5YE2aLbrr3Xtz9bim6BA4
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69f0c2e0 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280136
X-Rspamd-Queue-Id: 4B1C0486EFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105019-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/net/bluetooth/qcom,bluetooth-common.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..ecb3de65506f7f0f1fc1d0b9bbd316163b7c26e8 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,14 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    items:
+      - const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1


