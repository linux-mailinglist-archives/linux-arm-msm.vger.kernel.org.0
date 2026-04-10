Return-Path: <linux-arm-msm+bounces-102727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNN+BtdH2WmGoAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:56:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A33193DBB37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8646730BABF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CEF3E51E5;
	Fri, 10 Apr 2026 18:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZaepC3e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKzIlLC5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0436A3E556D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846578; cv=none; b=R1A7d+pXbt/gb30JrM27RZ/Ddg0j0CNR6f0dUoHQB69jcnlVjBfP6S8VDNb3n/NnhDzXeX0EKIhk4sfDThUY31PLEEdvu31aMkphjthxdX1wMsujz1nPgNxZxIu6N38ZggcznYUjk3WW/ZmwyzzJb052Rk69+3z7q+Zdf1SRYW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846578; c=relaxed/simple;
	bh=n7jSBNZ5ug0mTS67M+/wUobdD+HV5PHfSedYmprMGa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFQlzO6GsSjjMiVV1WhXH3eKkxpg3x1YYwCAKPmmN95u48aBnHUdumZ3pHeCiV5425NOpDOARmHMvdooa5EZcB+ApuLkz4pn56wos0M/zoc7ntCZfXIli8Xtm1LjKC/+vV8OWlYj4y73npXvr6nhjSvphNQ53knwgmpNIGSmT0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZaepC3e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKzIlLC5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB1UBM1322660
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XOYFutHdZbo
	YMmrl95d+ZAoYIxfqQwvZc4Sdoino6Iw=; b=cZaepC3eiX8EZjpa3cLCS51TyUk
	VO0bCDrNsSsSMOW498JOKbXmF1e0IiMSN0CLxvofzY6t6sb9eb1pe9xQAd5F8qux
	vKiB2GGJeLlv6nHi7Oz7gOOIA5uWiDVFT+dsrB6VpwPMSV8stgj1Kc4gpDdhuCzi
	q0LbsYJdAl6DxyVwj2Hcqsn1wLsOoc2qwl5kjrXEudwUEYxmVsRRyVvirL2DhUT3
	0G7VvZvHSLSnsVSCn+iQ5u0a2yYfynxAHzGF0UXUQxUnnzLO+8kb6wRunuRarGca
	fW8N+t+RchGZ11cowW1lKxDV7TweLG2K0CtPXQ70j6sUvud1wem6YIoKjBQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyyh9df0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c675116f1so2671879b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846575; x=1776451375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOYFutHdZboYMmrl95d+ZAoYIxfqQwvZc4Sdoino6Iw=;
        b=SKzIlLC5kL/5RZooqfxpkcaLshAytKBOkaK/i13RIBwOvX18Wi06R1spSd50sKyZH9
         YfWSz5HN7kbY8Tez4xqKdbJHA5cL1R7kHMjaJQKYi9ITavtWtSSIgimIidg/oZ4Be1kN
         6n5ag8cYN37b6LWlHTXL2641Ssb9KCppHEGVIJ3Koxzy/J2Nei9Nsrq3pEigoiijGnmh
         8+yV70M6VbJW/afQ9hO+gufoQsjn2Ww/CacbMuBlZTIUasBR2q04ddcdS+29rgDLFuEP
         z0XBx4RvNdr3CPbW4Rjy9/Cca5T1r3JmCgQM9SDsJxmlN0K8OPgG2IyYUatssZd4p5Dh
         3fRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846575; x=1776451375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XOYFutHdZboYMmrl95d+ZAoYIxfqQwvZc4Sdoino6Iw=;
        b=CYJaLad05yK+0stNcv8+CcpwdEh94ZLSlSnPiyJTsOMtr8DbdKcHh6TYAv/N2kVZUS
         BBsuwZmZeHwI954suPnczN2AOydQH/9ZARIkRYVOu6S+RXpHqOeiRRD/peGp7Kg6BTbE
         lm05rNCdcC+BkxR0UtKiQon40SYM4LPWzYCfbvylBM8HuDvawqLJRnsZMPErpfUrrkLV
         UFGGcrPyO2qJFHvpx40etn9m5uTzgeXKXqarT9dibtX2eDO9htpb7qvnimwuDKO1B3Iz
         pm4lEg2tTJ5s7Ej7OHWfTy55m0A6iKMDsagg+Ks8nf6uSmKl+UA8gvW5ihiTznouXbkQ
         MJdA==
X-Forwarded-Encrypted: i=1; AJvYcCXHrQh1EymtVERIrjbqER5bZVJz3sT4/lWx79oe8iLRQqlGpfIcYkG+pEz/6RaEMwCoRVxomqy2S4N24gBa@vger.kernel.org
X-Gm-Message-State: AOJu0YzEcDuDeGCZHbxl7MUYhEg0vE1DgK9pNuu20M3Rn9vMCZ64qBjB
	e7ccjesQWiJqsH3p3/x1cik5h9Sd/pAQRvsC3S4w6aFMzHrb+Ml4nnJN0ooqtJE52DeJIgSXwh4
	Nhm7pZHHz15QEn1yuyZR7l082Ebtv5SV7JF5WkgydternEL1cCzfuR6oODMaKByngayoS
X-Gm-Gg: AeBDievLUd+LjE7rYDow3/XNld5KcKw3ZWMZtd8ABfyrd+HHVOmgFir/tR7+8XbrdNf
	+nJexVLgxEytzT3BKL8W3kBhaVTn94SYp4AkBezwMqZgJhEV511yPEvKgcSw6A0m5tdkkMg20rj
	42lL3sS0JVqVCVEiTlswluM3qXY8Lk2gRAqVqA5FLGqvmGf2SRbwK6lFPROeZJ6Xlvk72wDQVAJ
	9are4bFREqdV80BhtKO450phr22suRHgX6DZAGv87DV113PXZz1eh9h4al6I/Ed+Mn5vWnqXRst
	thiB8VcDENXsKF2m5DnatC+QEUpn2DIvYSBZgvTqmDUXrBawtF90a7yJV6F1xiOJJi0aSSzNYBq
	Jc1/TY34BovgRLGcLjQ/Wjfyg02PIWIOGCJZ4AzQ7q6iTCAbn
X-Received: by 2002:a05:6a00:4403:b0:82c:6f07:2dc4 with SMTP id d2e1a72fcca58-82f0c288e00mr4648323b3a.21.1775846575040;
        Fri, 10 Apr 2026 11:42:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:4403:b0:82c:6f07:2dc4 with SMTP id d2e1a72fcca58-82f0c288e00mr4648299b3a.21.1775846574526;
        Fri, 10 Apr 2026 11:42:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 13/35] arm64: dts: qcom: sc8280xp: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:50 +0530
Message-ID: <20260410184124.1068210-14-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX95S6318QYy7o
 wop71sL9v5Ni9VycYdejptYT74cMdsAfNThBvFfyU1U/kGtqKrwdbTP7um1l8J22plAogchla0O
 8DOKcivJCIg9HwhY9HbL/zDGqUgTQ/Hnb68Q0rQAczWYOx+3b7BsvDEkXiCswT8X7zW4sIDOXw8
 0aPEUt7IhPTkYfEEd+GS82DJOa26weJRcgcZswoNoUtfZHFby9o9cF3TjQriiP7hV2kDrj8uBb2
 WWvPLLUUaym0SXuIz4DA3YmhrZBPWXxEqPwfcZdPb1abTD32diWS3CjRcjObtMKbidG34RFwCw9
 7FcjxXd52egubHm0W1AW8p30qxDGENPpwtW2lGdF8KngTIMyDlLyX0s1jR6DUproK62yg26ikgT
 iPUr6lbsYdfJpc4vS/X2rrvZiQEF6lf1ZU2lUZOYFxWC322gEtfv7/K6rfya5khQRNbwq8+K84z
 L06qq1C2JkJjCMx4J0Q==
X-Proofpoint-GUID: 6xGRBiUus6l7tCtqBB93101DDLwhMSiV
X-Proofpoint-ORIG-GUID: 6xGRBiUus6l7tCtqBB93101DDLwhMSiV
X-Authority-Analysis: v=2.4 cv=Wv8b99fv c=1 sm=1 tr=0 ts=69d944b0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yBSeMOW9QinR9qUfw4YA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102727-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,b220000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,af00000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A33193DBB37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 706eb1309d3f..2c6e48495d20 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5095,7 +5095,7 @@ dispcc0: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc8280xp-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
 			qcom,pdc-ranges = <0 480 40>,
 					  <40 140 14>,
 					  <54 263 1>,
-- 
2.53.0


