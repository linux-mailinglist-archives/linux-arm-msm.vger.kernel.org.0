Return-Path: <linux-arm-msm+bounces-106289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG3jNK1I/GmBNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:09:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B604E484F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D8FD3064120
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4561833B967;
	Thu,  7 May 2026 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMpSvVg9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PoEfYBir"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48C333554F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141275; cv=none; b=ddtm26icE/6dW93sAVVwk3ligMftlHZW5SqOzubnNLSFMAlaiFcqr3XO0KmQUk0mMGLneYWb9UDO80W6vR2Ip7M1q1HcawIFGcBE76l7/n3b/70GQL70Y4heGaWYxTH8MwtZlGyDHCZ25/qQQyWOSXaZ6KiakOkTNrXPEkDYHBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141275; c=relaxed/simple;
	bh=WyCkyrNEjuVZW5BQJoIub2BHuGPo1VrjGxO6oiBvNrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EJNH1Qkcnygt3vyQUcaUbD4nacUaFdhcOqaA+E0aQcvFOujD4wYTP+8M4kR7j/8fnLaWsfWZ//E8fCXrmYhXwbf45bjzatW6dmYx+QIciZh6JoHIuHQyaD4rV9Ay3tU8z4+NCWl67aOuSlnUSM7Ldk8e/H5N7jrKYC2e0TtQ54A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMpSvVg9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoEfYBir; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473edJT026622
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 08:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y93/3WloE/R
	GkUE+4XCHfC/034RFCm1JXmGZaFIjsYc=; b=BMpSvVg9yEeIOkm8BDfvPL+HQCp
	84YjtP5JPRwfHPdxS1wjb1ylr+j3fNrbvGdoVup/YJX8ylZVyqRcL9jbO7gNj6PF
	ZPHSbt/07JIw/115rnjPyNhdAZymU7XTuN/5kYrodaO54EsbT/PazZzMD0cdRqxv
	Zwn+Pgji//RMQVS0C70+/TWF6o8bioPF7fDi5+YBYaPtLmPjkpP/gnO+QiSAFndB
	GxIBZYZDEsPdgTJLnIPE8obsc1yIRooZHtVKHva8l/tlNjnCdl52amHZbBsw2SMd
	Rr9T2sIWvRpnXzDARfXZTs2bNRaRg2lE/KKXh1bP5H8WQUE02BB6x9yL+wQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t0vgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:07:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3650a4eb60dso634270a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778141272; x=1778746072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y93/3WloE/RGkUE+4XCHfC/034RFCm1JXmGZaFIjsYc=;
        b=PoEfYBirDyJTzra1EMzLMN8ARY7PHQzyN55p2W82UOfNzGjbqQarP0uD+etl789XER
         pOcbTTUUGu8IAssyZ+D1I6KGDsapfh+5avX3wi33o0PpoVZYSfSJ/1JxHrfV2CKEjv+C
         +/pmqJDeeuPpXESwkFVimcEEHHqTrBjThbo5TQwH1Olunzt9Sl5ZrO8mxWzHFMcGzAK1
         ZoleguR9uP/WA26zGGLWKJdkaeTD1Qu6TvND518PAWXDtw3WnHzmFJZD7hm/Z3rOlncO
         c6GgbK+I9A1MgasQnpSw4Rb6Q7DFvj7BDmn5UQqyX/q+4XEuDv1E9q9VX0EdW4sOA2HI
         MUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141272; x=1778746072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y93/3WloE/RGkUE+4XCHfC/034RFCm1JXmGZaFIjsYc=;
        b=Grbf/6pqvHfcAXi6P9BExTXdYwBXu25E2NQvMD28cqepgFsZlNahbQwnDo+cwl1Z6v
         cOupDaUxbyb8qYLNjyRssPAJvv4RJrDn2JQShn1HFodKR5ZOzKlU8eWZpS8LvlUVCTcR
         kSQYW6tgAOp8Bwb80k5BKMZTKJzX1uQJl2brCBCvIX0gh56D+uR8al+hB0hyh5e85xqc
         hoB65pRN7xjfBCd2eIn9xsFzMxmekXUGh/IobtC8FI5sHCXKpWCn1SMHn89sc3o/Zyhw
         2HuASHaMxjtOIbx5xAHkQnANAPImZS04kXAxdX6jDFPg1jD+UnDttBeUkvKch3hXDvML
         1rNQ==
X-Gm-Message-State: AOJu0YybLW7U3zzdyCUgDRhz13Qpy2XgdN/7thsONlbsm1gDLN+AYR3Z
	zpyKZP2H5gUCYHJoEMZIFSjfwJwwBny3aIDoaWxsFwlHh00OSseNIhDvxRUu/LIWXsQmLhkcrzF
	WvJlcdj7CxKAc4Ny9Quq5Mtm3Ykm7g/JmkPe/tYjnZFTPuH8H8dzOfZ1XXn/TWbQ3M88N
X-Gm-Gg: AeBDieujb5fExWYhRb9P3L5lCHVd0EnwBRjbrIM3ykG+y+VhIMHO58SpQp3D+NOTsIY
	Jo+kC08xT/UeZMLme+cOEGfKofiFgHI6cXddrP2uKpTpnGTF20l+xFlA2uqJyCOi3IX1yQjrDWE
	HjYSaK1r5i21AhVar4JC2RegeviDl77gGVBQXp8/lifejh1S602iuVEHrmWQzmspAn+Dgd3yicf
	UysonuaBxXRTMa6hjFwPBivUxUk1uwwALqjXC3K99Yz0AAMmtA8OtbEBJ8JU80ufbD2Sze9Jn/Q
	teRpq83oAbRFCtg5jWDxsvquu0TuKEEdyxO3PxSwbqJc0kQoMfTAra6KhSA2xgGkPhEUhqDVOX5
	8iclA8P/q5y9jeN3lGX7yRu7IQ/SxsTG2DyyXIuBdbxkwnUp2yMhwOv6GNrU=
X-Received: by 2002:a17:90b:3c8f:b0:35d:9c43:57fe with SMTP id 98e67ed59e1d1-365abe8aff8mr6759056a91.13.1778141271987;
        Thu, 07 May 2026 01:07:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8f:b0:35d:9c43:57fe with SMTP id 98e67ed59e1d1-365abe8aff8mr6759031a91.13.1778141271434;
        Thu, 07 May 2026 01:07:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b0560fa8sm1986094a91.1.2026.05.07.01.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:07:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/4] arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
Date: Thu,  7 May 2026 13:37:20 +0530
Message-ID: <20260507080727.3227367-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc4858 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=f3Xkfw6nQM5srWygVXEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: X4jHqDzdyAVnaPBDAbYutqFxoz9hrcmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OSBTYWx0ZWRfX2Gmfj4lFupom
 DFhBUgtUIG75AIW1f+ezJG+dKA9tRIPKBgpqTB8cC66OrXO5tBqQGRC4rDqkieu2meSqLl0MgOl
 VGaLURMvShL2L5vvKGanbbs9LPm2ofZRRptZxhEsyi2lAr+JIC55qdaqT5691ceO2TIUg/ltFCP
 sDRvRitsg2gTa6fFcpCTWjD8C44WPh9Bsurrpx9j8brOhRTai6GYujuvPPmFqkkhpgRXvqAVeHV
 rwz+suYE7DxDjTLEWARjmtPKZR6UpErRnxXIi71X73sJ2OGYQbKhGCriOh5SgQrlpO1j89yCo3s
 gpMWaz19GidzwsJhFJILHvH7tQH1pjckS0GPvlS/oZyeWFph8TZl2kIlRBoDvMRP9bxKaUcS4zP
 j2RetsW3+wfrNe0AjfGOVDeTlwHu20wcqpQyBu92AymOgbpIcdb2/EcZF8ttEKk81mbrItrw1UO
 y7hXQfWLDqPFLfirUAw==
X-Proofpoint-GUID: X4jHqDzdyAVnaPBDAbYutqFxoz9hrcmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070079
X-Rspamd-Queue-Id: 53B604E484F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106289-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Wire up the minidump destination word in the kaanapali always-on SRAM
to the SCM node. It is used for destination place for collection of
minidump whether it is via USB to the host PC or to on device
storage.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..06d6da6877f9 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -224,6 +224,8 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
+			sram-names = "minidump";
 		};
 
 		scmi: scmi {
@@ -5294,6 +5296,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-config@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-sram@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0


