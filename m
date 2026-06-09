Return-Path: <linux-arm-msm+bounces-112034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lpfzEqDHJ2oc2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:58:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E213165D732
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:58:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SqtE24s7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ty8fvoxX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112034-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112034-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5BF330FF463
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714F63EDAC6;
	Tue,  9 Jun 2026 07:53:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98AA3EB81D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 07:53:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991600; cv=none; b=hmb4DC6q29bqWMnLaQBGABOQPSGPewiZ1lEB9W+ObwFhigrYMlrmOSOinG3eg+WnjmmF0v7fF/uxSfe20fFFoRCCXS6cwg03lpkeaNYyxGJ+xO4f/UUecmTuCvqfI0RdEkg+gLxiScQHlSn6EmPODvVhkDmqp7in25i9z5QXndk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991600; c=relaxed/simple;
	bh=X0Ai0achBf+ZwxyXQCLBkT4mksbIzc1fznSydl00GqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sta/E73V/NLAk929787WuY0LTbusopprVD1QPK//k+hWBEqlmiPRqZghjik23Y7vblY5eBtRCy7ToMTAPnFxHdo1X3S0QwAnQ8m3aFzbBdgheSFh1I9MPCyXxyXYEcspPHZGXGtzibW4Up0LxdY292HhAB9Iz6b+5gYLpmQGXnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqtE24s7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ty8fvoxX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wc941064860
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 07:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=; b=SqtE24s7100dyZVA
	kTClwnOzW+aY/y+IrQvA5ZuVMmk1ZOt1sngQs7WnSevZ3aqCRg5Cihoa/loxIg+u
	t3Ru/iPPVx61+14JjwffwlWZ+cKt5bOzhddi9aByGOfrSA0sc0Ie9aB3VDpvhKaF
	AiDEm4eplPJ+c0qRUnpRGz7DnmIl7lhYgv1Z7+QcMGgR0aJIlUINw7yrp+76RSlN
	4zeRYaz0U+6sWsAMDijaGiT5YVm8P30VNOGvyfJN6I+uHpugUFRyJSsROI6vKP6h
	qWd4kKHfEXmpsaq18yY1I0kyTytX5hjNTIlTvzqqQhk/0DASXo4/pgwokj0YDOKn
	7WZBDQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m4q71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:53:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178fc89b2aso88017071cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 00:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991596; x=1781596396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=Ty8fvoxX3z9+aGVH7nrS5wdzT/sN4UXtzTsyATMGtOik0OSqGOAJibNhzJwWtdqUWK
         HL1FHKzInEaiIJzbjLJICVCb2x9BiPUmINBFHma/p+XfbLH54XUbC5sJP7K3FJxafVNq
         VNA7jU7jsxRcyiKAeuSVCwuBWcU5ONC+fuGN62nf67r4XHhjkXQ4Ty64K97X0Tjraic9
         NGTNjfnaAhTwAw2bbbD5Ph0e7H1VvEHkDKiTen6IXXP8GHekK3XbVX7m3qK1VMfLBPXq
         YKuvIsBq96gHmC2hqDxym83+E8A1qJ3MvyYE0w5kOVj0BleecEszd5XsN624lmJTbSQ+
         YZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991596; x=1781596396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=T7Nc8ZUWvYWkJmHXAz3N/ihuHz1ff1DdfnYndveSr+m1NNCdNt1/i0TU796OoWLRJF
         ToyAmtOKv/iiH0SPZJuJd9iBGmz0TU9yyh9sj8IXnKku2yTZ9O7nLaJZWFFDhWGAw1hN
         ZB+VCJeFHgxc7TaORUoT/W0XoCIWEuM5OD3wdYAY4gxqIT1umolQTKf7tbc0OiIC/qfB
         D5qkpciTrkB9xSYOB1507rV5hZk/TJstNJ3jBwdGn6uEYzQbm9LnBT0NNTfx4yCKm/us
         VGjjdoj9DGFZUddeKuvnzuYecR2ssO+3Fo+XB2cDUYsMMjvAdr+SvwdM0gY1/AIHAaA6
         R/9A==
X-Forwarded-Encrypted: i=1; AFNElJ8YaRcBHzuVJ/6UOzOa0GAoNMxp5yhIHc7FXWnPH4XTwC+wEqC6qDs3iuRkPAsQv58A815TD2jfjAwuIzE/@vger.kernel.org
X-Gm-Message-State: AOJu0YzVIHgIaB6WyHtmc7N1GoXGqu7Wv54dUNpYwfpGzhPIxJ6nCXds
	W+10W/k/P8Agu9fzh+1kXfboWjs0o5b3Go/6oXE6cj8BWa2ivfTrXDbx+QIc00CooKbwd2TlLSp
	juc4PccA+RUlxkCv5h25MtKNKZx5yKnjU9Vd6g5sLWi9AdQStqoSdCgKqNcTHcuIpMd3V
X-Gm-Gg: Acq92OGjITboUSTkA6sKmPlf7bX/SOMOfTCv5u0HNrU0xrDrMloLZ8JtWm1kIQeD+iJ
	JTyDItV1uo9/kVNHgK478xthjuWPygu1Ncdt2SqJlKnniK9l1z92ghhTrLwuGvBd08IrCTYGkho
	K5s3vjQ++ks98uir9u8d7DvJzknbgyiKcSN97qWODHAq40lulpU5bb+k5jipBW+vElxzlTbg7iL
	pFfkjaXPDkTF7dEts+I8b/00Z0HCnN1sMW1+xb9RFgU0mjdy0+jeL0xODWqJL3S3X0M5Kl98AfS
	7GvJDbhHmVVJWT1WJtPjQDkx9H6sCKEGhtlNwCWlvkxOKpjjWvZ//zkqBSmlouE6ykZXZtjoGug
	f6nwCGW+k+NHp0FzZ3t6mvtRcMGi2Uw6ouvswbh70okeJSnDc4ISeC0yERVrIq/ADnrCKqFQV+L
	5x0VROIYCoOtYmnvlDIeQMfUvOwzqtrQFeI+isweZI3grxUi6JWXuim2kZmRBYm1lx6pOdAVdeL
	7hnS4hdHQD/
X-Received: by 2002:ac8:5852:0:b0:517:599d:ce19 with SMTP id d75a77b69052e-51795cb7901mr276093801cf.48.1780991596120;
        Tue, 09 Jun 2026 00:53:16 -0700 (PDT)
X-Received: by 2002:ac8:5852:0:b0:517:599d:ce19 with SMTP id d75a77b69052e-51795cb7901mr276093471cf.48.1780991595695;
        Tue, 09 Jun 2026 00:53:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:26 +0200
Subject: [PATCH v4 1/8] dt-bindings: mmc: Document support for nvmem-layout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-1-45712e6b22c6@oss.qualcomm.com>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
In-Reply-To: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3MyBTYWx0ZWRfX3Y8ZOf4QWgrs
 PXlQUG7ec0FTQprsptnI8LaU/VEeAvweRF/l8MJQ8hTmqrvJiGB68YD4xjSaZEQ53SmtqXdjMPU
 ViEL24yY2pluTF8X2p/XqsrG7cnREK77SZSIIrnZPnnZwSnX3YI07lgUjWbqrdjneS4I+OePDCD
 Tkcj4391m8hseT2ApuR8UKy82jhAAHvposymvSMMZvR7sctqwD9YmQWleyJotfGw/MReW8mVIQh
 N5ztYhHnZOlPGdC4VJeg1BKho2rvRylreHS5ynARSR+p7kqozTAG97MopDxw/i5nbyLOLA/JslN
 5GklMQwTmbvyfxBreacVspqGfR4t7LHXcOO7/dxGyQVUztPYC8S+c7NwAwnas83tnVOxISZmNxD
 DkmcPcn4KVd2N8vZ103Us+EvD/pEvyzxhQWmOZR8xkC8Y9k1N8PB6D6PaEA4Fhcb9QuXxUrDuwn
 22GgKxGo7nAtPfiWMEA==
X-Proofpoint-ORIG-GUID: B_YcsjgSc2eoG9sI7h-jwNEut5EvdHjJ
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a27c66e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9i5gzfhGLSn5NVSMExYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: B_YcsjgSc2eoG9sI7h-jwNEut5EvdHjJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112034-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E213165D732

Add support for an nvmem-layout subnode under an eMMC hardware
partition. This allows the partition to be exposed as an NVMEM
provider and its internal layout to be described. For example,
an eMMC boot partition can be used to store device-specific
information such as a WiFi MAC address.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-card.yaml          | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..ca907ad73095925b234b119948f94ae81e698c86 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
@@ -40,6 +40,9 @@ patternProperties:
         contains:
           const: fixed-partitions
 
+      nvmem-layout:
+        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
+
 required:
   - compatible
   - reg
@@ -86,6 +89,32 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                compatible = "fixed-partitions";
+
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    mac-addr@4400 {
+                        compatible = "mac-base";
+                        reg = <0x4400 0x6>;
+                        #nvmem-cell-cells = <1>;
+                    };
+
+                    bd-addr@5400 {
+                        compatible = "mac-base";
+                        reg = <0x5400 0x6>;
+                        #nvmem-cell-cells = <1>;
+                    };
+                };
+            };
         };
     };
 

-- 
2.34.1


