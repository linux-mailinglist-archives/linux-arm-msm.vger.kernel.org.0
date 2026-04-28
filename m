Return-Path: <linux-arm-msm+bounces-105017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEeXLZrD8GnMYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:26:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 644E3486EA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2370930278BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A490E45BD71;
	Tue, 28 Apr 2026 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pV6jaFMt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnTC8ue9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD40450909
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386208; cv=none; b=uUl0tEj5DIGxz/DV+esCZIAlRY6J6m3l44qvQosdIMCCefWZY2kwgtq7KfTM0QIbgjFIHIa4Rq0z7yvG/bvF40XQ9taD2q2sbm/9/I0qP4SzpmGr/55v3yHazrwYFCKf/XYDOvdlfw39+CI+XAYQLegkCiPruVpw7HkEUeBGUSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386208; c=relaxed/simple;
	bh=cAnljmIAnY0RgmqbpHx3i/y6lGT992IHdJ79dMHjCc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MueLG3n24FYgKKz9Nr3wvUjkZxB2kZ3KuO9JIFu9Ozi91sfzhmejSbd/vGEh5xLqdUM8Fd7UKmBXx3BORuEJH/3zXycHw9WDDUSjWKY9bg4vRn57KhGUi/3nxGs3rp+0Dd+ThYDEqC8C//G4rFXC0THN1U/bJFuJtReGHsfoLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pV6jaFMt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnTC8ue9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S995Bb662935
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0EtjVuK8tfVE6lW6LjScpaxrDNQ+sqkyAA5l5tfy/xI=; b=pV6jaFMtwD5NMekP
	nZgGZJa9bXjPxtiaCr3uI+//DV6UjSWPh0Ypf0f3UhJ+BlPYQ4HFT0U5Quh/yDYr
	V/aKdxN5iEj9NS95plMyA8u1V2vutmcvrpa7BL2JKvTXhw7ARLp9Sm0X7Pe94vJR
	U3SAm4VnBGjaBrBuPp9P/phSMyJS/yrNsJqcKGHH2BVOyBc1mdHkMG+Y3jCJJKmi
	I+LGPClg/nEkiiTtCBcacVkYHsOG0zuLfH07Q3u3OB5BaC406zg2RxOEZ1uam+ta
	siRy78avZU1ZRgTIOGLWuaPy+Yfu9ffQ3Ec131pVTWxFPLP9IPqwsyCIRBiPqUeT
	92h/FQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n4bp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:23 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56ef11518d3so20082229e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386203; x=1777991003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EtjVuK8tfVE6lW6LjScpaxrDNQ+sqkyAA5l5tfy/xI=;
        b=AnTC8ue9hT0r6hTBiEKhc4aQnaHQqa106TIND4E5d4v0ZlJFzDX/AUsgSnRTDd289T
         m1fDS3OKBvkRIDlkYSE8O/4OaptigXVkemqvFh3HQBftLFh3+vTkMr057LDEOpDNyCGz
         ahdOw4DhV+BoX2OZf6w+TVf1nK8hJ8TG1gKTRQ+yQB4697/ShXBycBXz6vJy3oAvjRmO
         Vb9KDA4+//nGL8FD+72ePty2IJwIe8tVGNb3TFC49/WlJRdrw3aD/G/QogMgc33ZEtbc
         ZoBClIZRdKB74mN2TxeoGKJ8BQcFzBWeFLuCyytzdiovjAHdIe2a/i21h/0Ppzs8G08j
         KB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386203; x=1777991003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0EtjVuK8tfVE6lW6LjScpaxrDNQ+sqkyAA5l5tfy/xI=;
        b=seJKvYEb29ofU3B+WvzwqqW7NmNzTy1BDK8wr/rtC1oAWGs+4WkoEUaLfnbJSYnMvX
         1H1wcbbbC0+WPW+KmXwm2U6Kdykmd7L3gZTs83kW0nyZpy3gsmJfEnOfYXZjU/djLHgL
         Qd3fWqNYBmq6rBLwCxhFW6fCwVXLxeI5rtV1sqOjvmjdG9DhGdAHLvnZ3X6v+OkdmJyc
         5FhWA+39Rn9rN3Q+tXAl1+xt5gODKg09SY6eH0ZGcRpR5CshVcCHmfNCv9UH+Y6uMiG0
         uJhZmoahH+poj0Tjsiw0cm7SumjeyIS3Obb1sZlJ5pyUbo6ucJhcMs70cpJCohrwdiG1
         FBCw==
X-Forwarded-Encrypted: i=1; AFNElJ+L3PZldr+L7NHin7XrKSC4QgytXBxdmfEYF2APrTbicCDkZsnrwJ1FWdb8SacsvSVizxhmQNr/yFVZ0YLU@vger.kernel.org
X-Gm-Message-State: AOJu0YzNiCTfz8AWNPyd7MYCX0oZ++MQap7S7xXmmRe3wh+wOlsWx1L7
	CkYO6mC6qQC8A8jvmrbFPoEE4+AWdq908/Z1w4tM472gYTxXfvG7kr2FV/GJbB8unz/gQj5cGQj
	WUwiuBpM7qmlrtZc8SAXfG/foFxI88qf1rRpq2jCYPGzyyl32IqsauLJNHmZMgtvG7u96
X-Gm-Gg: AeBDietikMhI6WvvGsFwjP5/eLvpTHG1LjK5QpRNolQskk4unUJCPmk53WgCyflfEwW
	4mhpz/F7I38QY4pYO5EtunKZEC9Hjm6sP+fpOTiD4KpfcTwAHB7a7AjIJDmt7jF1G66POtJXlf4
	Pwybpx5atYm6qpmIhYJIxh4up8QlN1YYl9wMznFjDNhPYqLV/Jx+plQI3xn//FYpLnlekzlpx+p
	RDBQLoTViOqc1+Fl+0DDIJ1Yd5BilyqvVhB3UAjiQQfPOOMgXhdURzsk4DFis+XAHJ60+n2DXM8
	gVTjC08qfa84/TvgsC74K8WNMkZh5CVKyl034gGgp+4B3zsVZMPLJCq+jUUbPD2Q94YKQY/7KYu
	syENH7UIIhOD7cBQsdkQCrw1su7s2eMK9c572xsk4FfVhneg8a4qeqm+USAZj+4gngIQY0Uk38T
	xhXw7LJxcjw27DpM2DqyYVH7xWrcU=
X-Received: by 2002:a05:6122:3781:b0:56b:5893:d042 with SMTP id 71dfb90a1353d-573a56a12ecmr1637581e0c.12.1777386202692;
        Tue, 28 Apr 2026 07:23:22 -0700 (PDT)
X-Received: by 2002:a05:6122:3781:b0:56b:5893:d042 with SMTP id 71dfb90a1353d-573a56a12ecmr1637518e0c.12.1777386202261;
        Tue, 28 Apr 2026 07:23:22 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:09 +0200
Subject: [PATCH 4/9] dt-bindings: net: wireless: qcom,ath10k: Add NVMEM MAC
 address cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-4-6ad23e75190a@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX5560HSCuWZUI
 5DPemwA7tWh5Cc2GhO3q82LekYFSx2alJK6/HKoL3PvtERXR322Xlxv+lnccF3yixrB4LDnxEck
 3FuCP9AOi1GDe0QNOggL2oQprX8flpiDG05P+K9C1FJcfiwVGpCkjXitpU/Icvo4aOYao3e6GVv
 YdO7gdV7CnM0ey2Rr6pkAu6uhT4C1sYhKAvgSqiFNRS3ZrmpJ/jNybRmVaKDs5h3kWQnGalhQ/C
 BscSe7qqsqr0ELNVZ+xZH3+vnX3xQU/eU8UOANve+C3Fkg2oy/f32IV9tBdYfi2LUOdJVvrDs6k
 PMhWleSVLgEDVY6vhou12FRNm3xdR9jIHUi1DqbNg2yDqSJ0cDtjBndS8aAYSZ4p4zF3lBMa6Zw
 4f60N6siDvZwlfDcys4YD4PPmPcdQot5dr4AA8FjYQmHQEDKz2I56jOXZdDXNjFZiZMFjV8Px3G
 etnCd98A3irnLc5upTQ==
X-Proofpoint-GUID: 9Tqvn5L1ndOBPI0QfNDi9rNTO8gQ8E0h
X-Proofpoint-ORIG-GUID: 9Tqvn5L1ndOBPI0QfNDi9rNTO8gQ8E0h
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69f0c2db cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280136
X-Rspamd-Queue-Id: 644E3486EA5
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
	TAGGED_FROM(0.00)[bounces-105017-lists,linux-arm-msm=lfdr.de];
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

Add support for an NVMEM cell provider with the standard "mac-address"
cell name. This allows the ath10k device to retrieve its MAC address
from non-volatile storage such as an EEPROM or an eMMC partition.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c21d66c7cd558ab792524be9afec8b79272d1c87..7155d8b15cc145c3a7d703db0c9c3e056a54c07e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,16 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte MAC address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    items:
+      - const: mac-address
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1


