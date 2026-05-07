Return-Path: <linux-arm-msm+bounces-106464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBeyH1Cv/GnlSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:27:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A00014EB02F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D700030243A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 15:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2CA44D6AC;
	Thu,  7 May 2026 15:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pngJchIU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CRTV/mo3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A4F44CF44
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167498; cv=none; b=AX4fAVY2h7whY1+3WsL2jXBnezca7rjEddrGMenWfcCS8He+ppimfiIsgLOWnHdPhZLeSiwwrir6q9OFv/SluR2zQ3Geh8UFsrugpP3il+4kd2Ijk1TgAEr5/uqLz4Z2XpjG8380ryTDGX1ZJUhm/OI4wq+JtNomj3GpTzbs1i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167498; c=relaxed/simple;
	bh=RjAXLDtyeqYajrszhA7+nXfORAO+2o+t2+Lsa/IoOi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3gRXcESnm7PLQT5dMmTM5lGABOCnlQv76zeepjNB05/BHrk4/b9K06s699sFztGu8TpeAeOkxsGGfkJdEQqJhW2/g/ZW6ifm5i/MSGFNE2uo+fukIPsEVwmA0+KfeFdkryFJce6MnKuCjh32CqW1DF13/m5YguRiTK7zVC9qLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pngJchIU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CRTV/mo3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647FDnGq3463998
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 15:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=; b=pngJchIUuTR6hnjQ
	lUECzDHVo3pz1dlhpiqmaq1DuAFQv80gbFnsc430vvYvth4mo1bwdyR6UWKw5WdL
	WOpcq2EHSqx0x7SuRWqWe2LCyY625A/6sKNH2CPBz1+ERlw6lSn9VmVhjg3m2AjE
	9xjqaSAc6WqXXEOq/Srh54PIvF9/IBE1T0VyqUIqyRFa90B/3Dgo/n+591Morvba
	unefJ2L0hLpbQtFvm9AZTpw+nb43cU0FWeITrCo5GCw5BvFhhlt8ia+b3JuFJtgM
	lcihyLA5QdlvrdltBs6JtiQmmkeQ7kGuSsh/wQ29S1Y3j4W5t0tX7JFr9FIvJpJx
	E+BCeQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn2s94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:24:53 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-950bdef305bso1466133241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167492; x=1778772292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=;
        b=CRTV/mo3NE9KvXaj5tBP1qjtfldSrl9mDiZ3TPbOJ6Q+kfXCPSEe9PLb5PjUI7soL0
         WMIimb1Z+nfH79b2MOGlYiQdcRoL1kUHJZhzlVpDSVMhOZ9bqIWg4E78NqjEpJsiRjNu
         R4SRwtrWbwJzcf8wFyPPYTmLxCcUIrYOb9VVQyX+kC370bZzqrmhMpLUODoWL9pevPnj
         riGex3G5Vabf1DqNTwYxRHtLERDXl0F6HazZduX+k5hvi7vdwHwJvIXoMiL+NSJdeXG0
         pAibKaDw5Wrdd/3bd6C4d6IcwVnX+fExVFuWr5guECHzjOzkLQO2rshNnxI2CgZ98Lsl
         yS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167492; x=1778772292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=;
        b=kX8Mdh5y8y+Ks23tSoziiAOJPK1gA08TRk/eRFgbP4RPEjPOPwh9dMqVPWRl6ABuBe
         1HuAc7khbCCpMgeU8afZ87bs2reDT2j6VO3ht9V3TZSJOyIDypMJ+FvUGe9fZmiy4M/6
         9PvvPeF8Q5K3AmL4dQ9caATlv+mz8KvWwQataydze1x7+bRpnQbyxrLCYB+AE6hjvILN
         WaSHDS3M94qzox91J/PwRzXw1HBBmk9+LSEuEtlSOadT6PPdR+C/W6PFkaowsK3hqWSg
         b4OP9OpV4J3Xc4VBqt4LlKa27ODCFvC3AK0IhcXx5XDp05xFK7z0TSUp5HxFNEzuP0nz
         gzHg==
X-Forwarded-Encrypted: i=1; AFNElJ+e8tMQrqdNl4jNQgnnXgYTRL7u+Zp6nQZh8B/3QlemIbhwp/huxozsADF9mMnjHOQwL0exkYE1rnxsNXs9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzri70Un2TEIDtM0SwMx8epl45llyjSGayGssUZEIYvLp2x/xHy
	Xa2lUHqz5F9G/ZpyQzU+T5WVq6b6J9lKy7cM0mt4UdJ2etCWNUq/5+ArIJGCn22h6LuaMcJ8Rfr
	1HyFOki6Dx/srgnNmT8H43RR+RfolW/uYuVIBDjMASBhtp2jeUn/vdBGMCHRiroiSc4Xc
X-Gm-Gg: AeBDieufNlKoyFMpvxCG+X/crZgejOYfcAO8dLnuHJd1bDRb/lP076XpDsNPTKsP28O
	G2UY7eG9JmbhM4ewI6dvqNytYXbUF0+qKqC8YBwZ4a5bw03XY3/JRSctHMldCzm/oSmc0vpoQtj
	zB5kKXkO9Qg4q5AZsXgipkpi1yKjAJ0OVvLZ5Ee2/HRLvgr51SvS1lKBUXpZxcVvj0+yImXiqj5
	JE7yEnMfF1n6OJFEh5f+dpeucqdZS00oASQjQXaKlticAf2ywuYpS6zwLVCH14Ak6cn725AIek0
	8zYxl0ZV7t8V9liBSFHMphTbVFyy9Ii6dITk3wQuBGTjU5gpsjNzrpEw/TFgyMIyE/RUfCept9m
	5pOGYuBYTBQBFwYu3dUcNYkOe7W0HrAs0hWj9r+9osa5KVWwlaeWzBEytxe987tPUVm2KI2GmUG
	PZ5OD3wqnJyFI91KrmDRMOEHrBqOs=
X-Received: by 2002:a05:6122:da3:b0:56f:b0bd:2276 with SMTP id 71dfb90a1353d-575591f7b22mr5439017e0c.0.1778167492608;
        Thu, 07 May 2026 08:24:52 -0700 (PDT)
X-Received: by 2002:a05:6122:da3:b0:56f:b0bd:2276 with SMTP id 71dfb90a1353d-575591f7b22mr5438965e0c.0.1778167492169;
        Thu, 07 May 2026 08:24:52 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:51 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:38 +0200
Subject: [PATCH v2 3/8] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-3-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
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
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX2cX1gvlH/7j2
 qusFMsAXbodzPQOO9Qc9kVBx+yBZ6qPNoB5OSEHmVCj1ufmz7o3CzISKYH9WwpV92pJMsiDJcuY
 UWIT5LI/VEGO9jrknvY96bFwA0DRsnkC8u8eFltdP9gtBltcqEvKyeDa4OG9WOTIsGBUZBgI1At
 WI3CP4NQWtp2FpZjFkYIo7u3cRVvvnMQn3UBnjfyKtKcyjg1TlT6LmAUzsnm6ZaYMEP4t3aXKOn
 sghssRxOz7mkSjOmKB3nNQa43N1BeqE8QjdNyvc+ozGp1VInZElTH8XRQ4m8Ya8riJBpENwAZhC
 5M8K3ZzAqZ4Dl0bPtnndfgCXef5/hGIcWWD0TSYyIghPfO+JjTHhxEWV2wLuNR489Oy5vqie5Vj
 gDI+GCSlHqOpHwKnM52xFHMYhG1kG1KaoFHZf9KpLwA9wee3zN7gDuBes3TdKGCCtf3HT6n1s4E
 vAapsunn+ZRJljaHK0Q==
X-Proofpoint-ORIG-GUID: JaepVSAM4b3sZ1vTJ0t5k_5ujCXrYz_w
X-Proofpoint-GUID: JaepVSAM4b3sZ1vTJ0t5k_5ujCXrYz_w
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fcaec5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154
X-Rspamd-Queue-Id: A00014EB02F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106464-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Action: no action

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1


