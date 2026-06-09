Return-Path: <linux-arm-msm+bounces-112036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jf1SMjLIJ2pi2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:00:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA6465D7CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:00:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mFktGxKu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d754NhLA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112036-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112036-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 873173124BA5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737F33EFFB9;
	Tue,  9 Jun 2026 07:53:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5A13EF0D3
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 07:53:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991606; cv=none; b=TNuEDVwEpBSFPvFePi6jM/HKChiXq5EU7pKAxyUKFsuaq+pPlqQkZaK0Qd7ybbfbga51d+IxTqXWgcc/q5l/Oo46Ifao1PxRVQN760FspOqfNHS3C7Robvs/jIY/MbxXwfIUrDqu7oLZ4SjnZUfQ5b0862DMTxYRyEB25wKn8RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991606; c=relaxed/simple;
	bh=xh4ucig5hPRkaGw1GggCAwEU1pqdfnGTPbj3vUFpt5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mm/xI/531hiVB8QSQCvudIGg0WhIq8bThTl6RhrAFiU1jANjGUFyrnANfxzAGCH5kFe7xcxSixsb+sy5G0J9+k2VFmqk5fNoSoU3Snz2DqhNQI9Qr8dFmmuEjN+/4icop8Ad+q/mcdLdagffCl0F2kyq3DVDFyvLq2YKnmVfXIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFktGxKu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d754NhLA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rO1f1517656
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 07:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=mFktGxKub3OBWZqq
	WmvRXRbzTgMecOXVAW0uD4F7zuze8xHExVrgprxqAAD7nDnk/8EbCmQf42UKmaVv
	EY4ZBOIPvyl9sX5iMKvzypi8hRZZKJKBb7fv/MiUGCAi0cmCcarSKpmQIUEtxmh5
	QgowqOHnsq/aP6sjmDd4q8r5Q2PJBXf3axT24MnJAfg/UJzurNToZi+fo+L8qwaa
	iWg4gFPSZg+4uQ5Y2r3nngrJ8whTX9lqDc0KFnMn8p/0mUWMs/OL0HLKL+LtqVaB
	ZC+xgpButnyvMGf7bvxTB9NZZljIe7A3dgHWBaIxrPwBMljD6kczacpfglUutKMm
	PmVrag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr81ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:53:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177b8def69so111631661cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 00:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991602; x=1781596402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=d754NhLAH6Coen+vdM1OAy7+lPYQu109KuvI/pbA2nIo5eTP3iULRZ9DNBLNBmpTUZ
         i7bxTrn6x2lyDr8ATCUrkOXgHY8dSKjj8Ro+WO+Kif1P5C0lL6cra6qWV42T+rSb9zNN
         KCX8NKJJItYGHv0JNJ/UutmS+3PI9fg13uGZrkg5wlLoVe3vY97SI5uJBpQeD6L7DOUj
         fIW16S2qummtws3qdV4hjl3mLDpBWpZlsKXaLMN/rz24HrJLm1N2ui1Mmx34eUVcNyx2
         XvQkUFrwiLLakg9CykM4lk1R8XYJeiXNX90+YeiqnbOSG6wRhVxJmUo9b3UE6OBBWl2U
         r6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991602; x=1781596402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=ioSLhY9+xQO3zgTw0EobpZ1Ocq7CULu5cms6wZ3hGPxnON1SUuMBIntkzsQX+slhno
         WWoWHyr7LSG1EYwSHUbrs6zh8XRcQhbKhRJeRuASCHvJMTCyeyaFQEqEqmjfDsO8WDvV
         4DX871RZW5VEKMSdk0HdA0ObYHLcEb2k6i/w1HvCkVrLu0l5Cu3Vz9l7oodrEKUY1YK5
         wtnN2tgXDpf1/4lkFDCttCTBHhoEktxD4VKAhU5/dte4XjCEUUVhxlGsachFIgfNwQMq
         nb8mSiNbF0J6SBgraAIU11dQ4aVZ06R3fIVPfs9B3at/6eYSyXvwgIp9Y5WCMbmOufim
         Puug==
X-Forwarded-Encrypted: i=1; AFNElJ8jCSebEp/ZIPtt+Shr/PE6peyo2ZzKvMVWWE4W7kNfBktbcDTgj0VOl9+LedKm/Z4uVGlH1Zy4XGTpt8dN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw48w22wHvtiUCRSSBL4IYcJteMXjYCSy+guhYLeiz9gdVA9ZyL
	8LTqLg87Ioioc681WMChQrYyaEB+ymrcTqTy1n7vJxXz3Be+fY5NWW2DRoVnW787HIYdC6gESxX
	J3wsgHVkiDs+nM4KxMjzLb7LK0Nvts7DNIIDrDW9NJgjy0H86NqARlwBDqhj1ENZNtjHi
X-Gm-Gg: Acq92OHaqoSg24VM9bfwGdxx6zyy0hBcWvNIJQWG9x+1UKb3ROldJiesdIE5IloYcsA
	FGBgjmOwzBw1w3BChx2b6rt/wF10rqDHqzez7Ry4MfYDVxKeFD0IYD+dGCvVyyi8M4Bq6DtvUmg
	a2KPX4q2HISGiBmtmZ57OrjZFy35bE2InjXjntXkdXjZS/FkXFTLMoFVBV2Q1VtLyELCpIwDsV9
	6Vd7GdEGMBv5Hv017tUvvIQPGYpgNl29uhfbtFFCil59C3wJn1eqwVNMWfHThixKjwlx6Pe6I5W
	h8TGfB6VxSYMnK1s34ihNZ6qSU9Wy481jG0W5RvPCXF9N5QjCh3CHcbeVlifaO0lg0iGwSnNTRn
	iw2s1fK0Nsw5mye5JPhzpNIj/0JdJcnEfhyJLbFwN/aCnYBvb0zpqjxgrilqfO6h0ZZMYSwWh6n
	aSz/vC+yRIn0CliFZquBSUhRr6h2bjuyWMQIih5qllA4mLaAj2cmIgxM0/Zd08ie/rRzynONVMx
	CPVvx72YkdU
X-Received: by 2002:ac8:5c83:0:b0:50e:6313:6e13 with SMTP id d75a77b69052e-51795a829femr267703781cf.5.1780991601769;
        Tue, 09 Jun 2026 00:53:21 -0700 (PDT)
X-Received: by 2002:ac8:5c83:0:b0:50e:6313:6e13 with SMTP id d75a77b69052e-51795a829femr267703571cf.5.1780991601346;
        Tue, 09 Jun 2026 00:53:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:28 +0200
Subject: [PATCH v4 3/8] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-3-45712e6b22c6@oss.qualcomm.com>
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
X-Proofpoint-GUID: f8UHMJD90vYDgdbkKAicCZgnABmBTPP-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NCBTYWx0ZWRfXyZWhF4nroe3l
 OF/W3qE54IBTD/kpVtUVt1RbD/AdfGN+BXm4v00/Dy/RQU5S2AgAnhSclWouUaLntzMVKR9YpoO
 sKqKNtGv/HU6sMae2Oxjyg5p4Fc5SP/QxM1zfxb/IQDrYapgsEzpaYF2AnjcaC1Q3FSna3w39B/
 qv32TaOwwaSBzgh6IwP3+EEIZVu76Z1G1jwzgOrTEoXxBd+cfvFmTdLvLfBG2Xl/dtkTTG2vg+1
 1IhEbAX1lJQOLYgl4WpfDYkxVRY2axvn43Hwn95rX8z0p05je7E/RsFBZibf87xP6AkGGooBgDO
 P5UGPqGI8PONMnY/wCz0On8G9SNQYN8nhcKJnMY/qE66t3STyHHUnDx9w8TGTMTzfGq7MQVNXit
 LOPrOqUPHN+dRrm3EEpR7RmpBZSw5yZVKBYa1YpHI7ORlDYjIbocJb9yx32eebZ6r8Zvjacq8if
 In3QlHGrw1wrpOSxw6g==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27c672 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: f8UHMJD90vYDgdbkKAicCZgnABmBTPP-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.c.6.3.0.1.0.0.e.4.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112036-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EA6465D7CC

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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


