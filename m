Return-Path: <linux-arm-msm+bounces-113711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id woREHWm1M2pJFQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:07:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A7869EB7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:07:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Og7fUaN9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eDC8m88u;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113711-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113711-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC8EB302B383
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244743BB9E0;
	Thu, 18 Jun 2026 09:07:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90E23BB9F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:07:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773641; cv=none; b=mJ01yi3rPIa4pmAsWvlJmkAX6S7ZKbP5KJJVkZDUIaj67sLdNzIUCugh8GBnWfHIFUDplZkYskbNYpwlbIaNFojkuzckzy5x1Bn/Z9dWRgTano+Wjr6CHjNsB9Lz2KjIhjKu/hgRyYm6HcvcvnmDRqefjUhpeLUdfHee2UaYz/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773641; c=relaxed/simple;
	bh=+TieoSW0TmXJj9IhSw1FzzGMD4+YbgkEWimJ3NK1Jc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fqXzNg8jra6ukMFHkkGHZmhdVqCFHXHWsLgvT6E6tvffecO8RRt0hhX/D36eaybLBUwtNqlsOHbD9cbK+2jsEJbdekowTwM9r8rwj0QoNYjJvv5bzTTjpR8+2ic4kwPGTf78XeTx7qZIrTxtHEm8E1BIqMYsAApVSevjb00yI6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Og7fUaN9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDC8m88u; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FagF1011278
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	me/ZeZGBFrRxMjpUXscm+km+tQIrTlS4RdikSDJkC3s=; b=Og7fUaN9QfFLOryp
	MQaH47TqY2dvKQjEmN7ZR7oxYbc7eJoV70OFmevJYSiwqZqXIC9Y4hNQ+8NmKYil
	qUJFyaL2XdeL92/oI2f1kSoiIkoljBqNH87l89ddP8//J/K6pVfmlZEAKfL+2zGj
	wNb8Zz3mKFx0/f+RFtn5/AY7XN7ZY6f8mRcHGTk2JjeD2iT4jsct2TuB1o+qj8W1
	bQsV2UEiVyjBhYq93vbwihapa8+mFBjhLYRAIpKzuJYmOY0zaH2Ggd7rTQI5/F6w
	iQlEQA7wAiF3fJDKnO7UMiTATVOH4oksyk/5TPUcYzh/csyNcOmd3lXM3V2k1MJ8
	z3QBdA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1rtthqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:07:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37ca2bf8e39so788161a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781773636; x=1782378436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=me/ZeZGBFrRxMjpUXscm+km+tQIrTlS4RdikSDJkC3s=;
        b=eDC8m88u+0GFivRyO7zsDp7HXesjkPLuhdlO6XNEIuJVd30DDj9LkWMuJ0Oop3gKFe
         Us0SGlIuJMbcuzZVt+nSfAqzR0KAYDUla3jgk85WrVdO5zZHcZmMwQz4G/nTXzkeXeaC
         jHeQWmd+ohtF8D0wkr01NShB1ZIkdRh8bkGi+5cSfddNzMN6uMN8yQqooEri8Su+J9Gi
         GKMT7PNDQFNquLHZ8UTvJWcxTBmJWcsWLRiqHjXoxtfzHSTKsa0fpRC6AICO+GazsQW3
         UyaQeONwFQWOmyaMrZJPyb4RgCr6o9wl3cttdxlZWATUYP0quGLel8+Df7PAU4+WC6Mr
         H/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773636; x=1782378436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=me/ZeZGBFrRxMjpUXscm+km+tQIrTlS4RdikSDJkC3s=;
        b=YHNU5Ul7Wjek+ck3doIDTG/WxKu/q+o6lgWcKRUfO455F6tWBBUwMqMbJTxrs2CYl2
         ulaiuae4CGit/MjOfkmCIFugVWc5tKC+RE+/4DAQV5w2l8eowz7oBrfPhIz/xll5g/p7
         g5JpZrKQJyq+SWKO7kpx+qS2HOzMqrfudCsAzroysRLQc5jQ6g+Bop4pmIQMGB0gsEAc
         yffiqYJU78rgrFeB3fU4AQ4UHxmOtkE8Jcsa0567tt2z4+/BeuKShsLPZVGVb1qGfl0Z
         xu0c/fJDvWExkCo6EdBHfv8t8Agg8BB0Urg7RJaUKVk7ql10+8Mjn8Y7PizcEDIdswhJ
         cgpw==
X-Gm-Message-State: AOJu0YykiCTwytpR8UbzHab4yH8Z2SD2y/pCeMMy5BhWzdWwUTNsdSgG
	wKB/PbF5k7jEDgBi/vCaMSDVvTw8T/o8OlTfO1YzdQhEiNiTMUYweYvE8RxlcxL2Ezuib8TeUUp
	lxaWU+En76byxlKe2CqqIixVoHSwyrmZqHHQQtw4GenT0ZKXyrHSpzI4od/iWedTpGCM9
X-Gm-Gg: AfdE7clyfkKzs1b7gkuvTDDsiOCo2YXtbusG3bahdgYGqw6MIzuPu/MpYiN6DJfLT62
	pftzkviH5Uk6qNKpk5EU1dz/Q7C9c6QZlYBTmd4q+XfWWzjWX/uZwgxjDe0Cgtt1CsorsvYcDnH
	dK+YSnKpvGwk4SQBHDhCyHZT/tt66zEGBuC/vCEaiTDne/tgYk4TUFjayevdDaM7Sj5uFUuXXIF
	nEmfVCavR0zPN111JnztdekP9NhoZSC0SHpb8U8i2XH+kiwhiVnTDS6fGr41BIwCU/GsPAU7a9b
	SCn61W7Gx8O1e340jt6+1r8Lad8Z52z0c5rnArMBbBITNswqfDtjbCtz36veU0mB1e1iunskkww
	W14Daa9SYnKiOos/Ea18pvPlYFBoA4v4fOMeOpvZeLlhq
X-Received: by 2002:a17:90b:394e:b0:37c:ad9b:680b with SMTP id 98e67ed59e1d1-37ce459e168mr2757696a91.20.1781773635596;
        Thu, 18 Jun 2026 02:07:15 -0700 (PDT)
X-Received: by 2002:a17:90b:394e:b0:37c:ad9b:680b with SMTP id 98e67ed59e1d1-37ce459e168mr2757655a91.20.1781773635039;
        Thu, 18 Jun 2026 02:07:15 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac794sm192112835ad.46.2026.06.18.02.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 02:07:14 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:36:42 +0530
Subject: [PATCH v4 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-enable-spi-on-sa8255p-v4-4-f5b5067e7e1e@oss.qualcomm.com>
References: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
In-Reply-To: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781773609; l=4812;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=+TieoSW0TmXJj9IhSw1FzzGMD4+YbgkEWimJ3NK1Jc0=;
 b=nG4G7e3ICdOdmKE5Wjh8NgCoMuR57zxjGN07GNne5Qzbm+45NWikiB5HAqxwzXhOWSvOl2HAO
 n9O/LZxxrNpClK2uHTpcVWc1f6T/1AAO2uAe57CfNW5YOkUVEEj0VsG
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=MNpQXsZl c=1 sm=1 tr=0 ts=6a33b544 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=L4oeRUVQnX-q_C5JrjwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX4kqbbdMF0cye
 M/Z8dMWPuuY55mYuIBnNmWSpw512fs1bJUlu2xFhKr64iy+dP8zZV1k84z1URDK6uN92iGvoIDG
 YziH61E/aU6urq5XSoIUS9+lD61B1NE+/v2cQ4wOv9OrxmiJF0AvD5+UTLuo/jzH1H5bEWadKhw
 G+Ih3OYHdXbtYqspa8IO2mJOezAwKeaGTOV9Mp2Mv63GJkH9SlJQTv0f3JrByLCr5vV2Ln6Kwgv
 YVb4bnZSdM5nSK4aTSgryVNqRCQOo7qEoSySDaAtO1yLAuCRrTvT9VvZ8LdYkSYkcQzU9oJE9pP
 jhodDsDtxTZiVe7a2OyHTeGHpUJgxcZvUIEWq/balTpOb/eLEBjx9dZX7/FDcCyNTUQqkDAlCzq
 mZgXTOZkTCgh/ADxYFkjJPKixrgCfo9jfukVKOSfrpeJ7U2fD7xnWuYDwlAtwZbeDLCGEHivEXH
 MBxofP/csYeRVWEFetw==
X-Proofpoint-ORIG-GUID: vJCLu7JV0Upo5ugjygLXdYoInkyEs_v6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX1FKOfHG7NYRN
 RB+W4pmoMz3iDgwx65bGbWJujQ6xjqSHgLLppzKcgJfKmFvQb4mXt2y2oEJ46Dd+7oRUHqBH39T
 QjkpMnM6KMrHcCSNg5MgRFQ1E9Njq4M=
X-Proofpoint-GUID: vJCLu7JV0Upo5ugjygLXdYoInkyEs_v6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113711-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43A7869EB7F

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages SPI frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate.

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v3->v4
- Added return check for dev_data.
---
 drivers/spi/spi-geni-qcom.c | 49 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 025165c4b952..88ac0833351c 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -78,6 +78,13 @@
 #define GSI_CPHA		BIT(4)
 #define GSI_CPOL		BIT(5)
 
+struct geni_spi_desc {
+	int (*resources_init)(struct geni_se *se);
+	int (*set_rate)(struct geni_se *se, unsigned long clk_freq);
+	int (*power_on)(struct geni_se *se);
+	int (*power_off)(struct geni_se *se);
+};
+
 struct spi_geni_master {
 	struct geni_se se;
 	struct device *dev;
@@ -105,6 +112,7 @@ struct spi_geni_master {
 	struct dma_chan *tx;
 	struct dma_chan *rx;
 	int cur_xfer_mode;
+	const struct geni_spi_desc *dev_data;
 };
 
 static void spi_slv_setup(struct spi_geni_master *mas)
@@ -305,11 +313,12 @@ static void spi_setup_word_len(struct spi_geni_master *mas, u16 mode,
 	writel(word_len, se->base + SE_SPI_WORD_LEN);
 }
 
-static int geni_spi_set_clock_and_bw(struct spi_geni_master *mas,
-					unsigned long clk_hz)
+static int geni_spi_set_clock_and_bw(struct geni_se *se,
+				     unsigned long clk_hz)
 {
+	struct spi_controller *spi = dev_get_drvdata(se->dev);
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	u32 clk_sel, m_clk_cfg, idx, div;
-	struct geni_se *se = &mas->se;
 	int ret;
 
 	if (clk_hz == mas->cur_speed_hz)
@@ -825,7 +834,7 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 	}
 
 	/* Speed and bits per word can be overridden per transfer */
-	ret = geni_spi_set_clock_and_bw(mas, xfer->speed_hz);
+	ret = mas->dev_data->set_rate(&mas->se, xfer->speed_hz);
 	if (ret)
 		return ret;
 
@@ -1075,7 +1084,11 @@ static int spi_geni_probe(struct platform_device *pdev)
 	mas->se.wrapper = dev_get_drvdata(dev->parent);
 	mas->se.base = base;
 
-	ret = geni_se_resources_init(&mas->se);
+	mas->dev_data = device_get_match_data(&pdev->dev);
+	if (!mas->dev_data)
+		return -EINVAL;
+
+	ret = mas->dev_data->resources_init(&mas->se);
 	if (ret)
 		return ret;
 
@@ -1131,7 +1144,8 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 
-	return geni_se_resources_deactivate(&mas->se);
+	return mas->dev_data->power_off ?
+	       mas->dev_data->power_off(&mas->se) : 0;
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
@@ -1140,9 +1154,11 @@ static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	int ret;
 
-	ret = geni_se_resources_activate(&mas->se);
-	if (ret)
-		return ret;
+	if (mas->dev_data->power_on) {
+		ret = mas->dev_data->power_on(&mas->se);
+		if (ret)
+			return ret;
+	}
 
 	if (mas->se.has_opp)
 		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
@@ -1188,8 +1204,21 @@ static const struct dev_pm_ops spi_geni_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(spi_geni_suspend, spi_geni_resume)
 };
 
+static const struct geni_spi_desc geni_spi = {
+	.resources_init = geni_se_resources_init,
+	.set_rate = geni_spi_set_clock_and_bw,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
+
+static const struct geni_spi_desc sa8255p_geni_spi = {
+	.resources_init = geni_se_domain_attach,
+	.set_rate = geni_se_set_perf_opp,
+};
+
 static const struct of_device_id spi_geni_dt_match[] = {
-	{ .compatible = "qcom,geni-spi" },
+	{ .compatible = "qcom,geni-spi", .data = &geni_spi },
+	{ .compatible = "qcom,sa8255p-geni-spi", .data = &sa8255p_geni_spi },
 	{}
 };
 MODULE_DEVICE_TABLE(of, spi_geni_dt_match);

-- 
2.34.1


