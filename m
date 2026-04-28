Return-Path: <linux-arm-msm+bounces-105022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKgqECnE8GloYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:28:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF903486F71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26C4A30517EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B589F472762;
	Tue, 28 Apr 2026 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPGoa7ID";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+YOnSvu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2C346AEC5
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386222; cv=none; b=ANni+RhDVvPA9kbOXd+74donqCAwYGPhfng69GY4uIvWVwMinLa9PoyYLWwnDiTNLAsXdgnc67xfkKYVjAr6iUiDTkxjqvf6UZm65eSQtc07T4CVfpELWycZPL/VzLM9MLTcAhwmNd0rou4N6rft07nefPIK9BpI3qTxpbf9ETo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386222; c=relaxed/simple;
	bh=n11bfCJoefHvmThlP8x1PiTVeFVsEIhjZBpXIg5IZ38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q2mdny+YqyyB93asXwHg0DqT6mr/LkKzPVdl8/Tqax3qOg85GkQ0+vYAtbK5oz1NX1HKu29NZsYx8LU/1s4cmdDtQiusPJPUnr5Tf9BwW2zGyrX1w+m+MqWwZxJglcENR4+hezMddA8eql1yr00wSMRb72W16ExwWFRjoAWSmTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPGoa7ID; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+YOnSvu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SD0MnJ1746795
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+OP4W0xAiPDjd5bYE2eMNSeXnhE/RBCJAZjyE4cLE8=; b=iPGoa7IDfNVUwgax
	iQmx3Hn13dlYxiKhW6NWQgJkVCcfVhWY3w1NXgiUS/AO4kbXtAzsbJqfdPE5LbOD
	aMaZdelub8/Unp8pb+HXCzEQBsR8xginxDxZ9BlF6F2PJ0wLwDzUrqo+sdtDjJgg
	8FcBPFGCgBaJlXLIhj9Wis1DcxlQZz6GYLY/WXYtai2KxqkaTJ3x+/fi70R8b0wg
	68KmHm/howOh5nqx9HVMUGO44qYYBxUDt6ASdrC9UxNoI8W+c8giWCAV02VWXESm
	vxIU4fZTShIm+pLIAwBfOkXCqylEyi+86em422/0qZen+6+ECfncdGkpPZGVtiQ0
	f5FCwA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryd9jhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:35 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56eeff9a2e3so19652508e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386214; x=1777991014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+OP4W0xAiPDjd5bYE2eMNSeXnhE/RBCJAZjyE4cLE8=;
        b=W+YOnSvuSQQpqtDg7DbjYnpyTX1XJVYJf6A1bb+Ip4Lzf5TlttRBrXCT4cBfSlMzOh
         cqG8G2vRw7pI0cO5nxGwVAugaz7WvHhgx34NffLiauzyhVyyuq0Gs3/wFAWMFbNyeCvJ
         EwK+CAaAVer0/gZIm/mIR+MkRTmANRol8euvzcHeH+6GIGkuoKGVNqu/ULHxraIbgilW
         R+z4KLmgQM+9MrC7tnYGQ8P7txKvDzpsBg0m2gK7114Nc3Jf/qxwsbAZV2+tFICOmop3
         Y130KMSTgBPrv4LAPeWeO74xW8AEcgiOTieW+bcmucWcNvxwWmtY7hZ3hfAfJf1wbGjc
         ZsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386214; x=1777991014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w+OP4W0xAiPDjd5bYE2eMNSeXnhE/RBCJAZjyE4cLE8=;
        b=HOy/xm4JbD4YYItj0RowmCPhk3GmQxv3j/3KObYHQLed+STndaqh0uZnNgbB54Zl3g
         Lekr//5lL0DdKBplQhcjEJxVYh7TeCzZgV8IKUQuA0RiQf1zacmTHTYWNyVMUBDZYEn0
         zrk6OBnexpFs3tvwU8nS60oI6w9OTpaeoEPgPDXzs2HsbRhvjA34QlD7vhwCXHN7Jbju
         QL7ELQ6pbOw9KyzEAhiwtS3ztGJLnZIX3kTuoXiApaIqFlev2PlBxOAdL3jSl41OiR1w
         4tonm8OFUSQr3Tk4s+jlJMu2CR5vZoGhjhtRLQ8wqwbaic5tnDOfAB56RxVkbqJLfHWc
         lmZQ==
X-Forwarded-Encrypted: i=1; AFNElJ88PMtzLVTm5ou+wvAH3uP1wuLtqUmbzIH7IRHQpQnD6NRVEvRHyUavtY4TmJGjHdOCj5gx+eE5p/nlqx+H@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0vBUj11nbHhmr/6vRSHG6IeQ8BmiVE2Jw4OiJw81Pq7u9Qby3
	LqVd5oMpN613YqOuxtoJZKMrta+RngmkUPIEsfzAJF03A1OkplgxRpxMbJWLy5+iKVnN3K1w5EM
	EyI/jFHeC/w5IsBpDHSpFw9zAhBfg+SLDajAMBBL18jeIDVPdTJxJ7fvhm7J70bEGSlsRv4PPHi
	q/kTw=
X-Gm-Gg: AeBDietTU09EQO3tsp2iBDJUomViHU1Yugg6e563Tcf5CAn+4euiWVDFjX+3AuwvsD0
	1uUsf4QyC/Y2VTOZfRkWcKA8sX5OrmF1KK8ZGrwob55ZTzL4lu0RlZFSj87ykPehjh5eFfX5AMp
	XyWg/MclcHRa9wsx5/+ikeLa38Hj8DU5Hiw0ZVAApuX9OA/ES07aua4ut0gvqtn/SB1vjEMCrrr
	7Vr0OGUjnqYdE5PADwvnhFWmXZMM3C8567tAvd7+x1E/2UOKRXNsdjqzV6u344OnY7wb5RnDZ40
	kXSWgm5RU9LD+/rTorOthH3H8RJvv2taLnvwVv5dOJzQl0A/hgPCMAHvaNfvuyTl4Ayxn6cSb3E
	WUlQBCRF3CaI30lNxYOsh+K6sz9L2cSvdJvxqYpX4mjqHHhyMMwhTiYjGSo4zCYjTnYpZYUmss4
	yC1MvZBFVkSp82jHXua2i/C/a4pHQ=
X-Received: by 2002:a05:6122:4201:b0:56c:860b:c34e with SMTP id 71dfb90a1353d-573a55b83fcmr1687239e0c.8.1777386214191;
        Tue, 28 Apr 2026 07:23:34 -0700 (PDT)
X-Received: by 2002:a05:6122:4201:b0:56c:860b:c34e with SMTP id 71dfb90a1353d-573a55b83fcmr1687200e0c.8.1777386213784;
        Tue, 28 Apr 2026 07:23:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:14 +0200
Subject: [PATCH 9/9] arm64: dts: qcom: arduino-imola: Get Bluetooth BD
 address from NVMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-9-6ad23e75190a@oss.qualcomm.com>
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
X-Proofpoint-GUID: PvtdN0rELxnDRF0u_WVR3zYHSAmUkaOw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX0yMdMu7GOMRn
 7e4Qhq9H/afTA01Ek25o1GsyfYIe0hgTU1rtLF22x74KRcyPG2uLgALdHSg37WffteDfe9wAKad
 HeroJ4O/9Xmo6/nfponwE5QcG6YP1mYpcCAurPBNuaP1rpBw2QXFI0UnzkQGhm9LmPptMVAsxhi
 TOh9UEc3kTRRgsJM2PVzw22eMNfpESujh5xmfLcIkce3Cr72D6NiVQgT4buBDIMZJ2k3ed5Z9Xv
 2onKdDrINdyLLuguQ4TZitvFaF0evIofPJ63sZsr/R8HvKgeSNEltooiS2oA4dQKqfC5ciWhXWI
 1OC7+A19i+IibSesX0MURg3v3p1aCGTW4YWERCYy9jmhJrF6LvJczrsLnAQAG33kCIwAFGgbS2j
 TuJJ23HsSSDJ9GgOrGm5JgtMuh4oXBQp441pkW9A/HUFvaWdtk1Q0Po8tfQlzJEQ9hO9JrX8be7
 4gkPnwfoeJYGJfIjNzg==
X-Proofpoint-ORIG-GUID: PvtdN0rELxnDRF0u_WVR3zYHSAmUkaOw
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f0c2e7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=w5cLSrw8bnM9wMX07V0A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280136
X-Rspamd-Queue-Id: CF903486F71
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
	TAGGED_FROM(0.00)[bounces-105022-lists,linux-arm-msm=lfdr.de];
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

On Arduino Uno-Q, the Bluetooth Device address is stored in the eMMC
boot1 partition. Point to the appropriate NVMEM cell to retrieve it.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index 35a30cd6f47d6d2e018f6841a05fe929fec15738..109fa76e05625461935e321e15dbfe6c7d452e78 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -536,6 +536,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 

-- 
2.34.1


