Return-Path: <linux-arm-msm+bounces-112585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kuPaLilDKmqClQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:10:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0826966E684
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:10:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i84v6avV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Oy4iFglj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112585-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112585-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7DDE3009B35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5608836E489;
	Thu, 11 Jun 2026 04:59:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E85536F917
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153980; cv=none; b=DroZCIqsoSsIYs83z5l+YBjEvrjKIs/PEQW5tB6mdQotJwJsakFdYsqjYKbgMJfnCHTCbleKtBXteczRzdXJdyqCndACRtksxoOKOLH1q2dpUs2byK2nRYh8kzTWN8FuywRp6tChNw2dx7oXcj7OHfGM6xKI9WDmQeM4cFB4LrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153980; c=relaxed/simple;
	bh=tXKQIHOcQOcv5dfQ4xmeHI9CPhMtp2fTEYmIOeOL4Ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IRBPFxuswxzLPBC+gxC66nkSj8JV/p+j9lrMJvOrsAdrB7UOkfwiETTxRXMtRVRVof4jtbnTclmalMkjDWSvLZeeZD1PSkfZ6f0s7jBIMh1anwTy+vWUTpbtSh/t1QwhcJ7OKsejH0V19JM/VvKODLP4scXv2FOy9FBuWvab044=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i84v6avV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oy4iFglj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NrfZ3233551
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ij76c9jqjldbAgxsdOIP1tQ8uMrj0btVvmuzEdPMK9M=; b=i84v6avVaEfMdH47
	LmGsKa7FN/IyHCR6HgmpIufou9YYkh1XMVsOSfWBTSP0VVlOa6mlIJI/B8n+aQ/r
	kt8/iwBo0D+Oe8oQYOcGhZlBO6JtyiJKUo+BIC7W4QK5BLZPFZxBUGEXn1FJG0PS
	kwOdnATE7TrEtl2aKh5FmEc4njb7S1cf2ZaeaqqozFGyb0hpZCJ6112bdVzBYXyX
	kcs97iIpwuhthawOVzaTWjEvg5xB/i7Os7A4sLuSOSKmyYKCc9+v+Ktvwbo8EphS
	Q1u3a9B33yjXnyf1hFtaALMg4h1s+zPoxQOSb9qkC8le4PRMHrX/FcMbR2WAhWKa
	AtBKzA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6shq0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf3636d6c0so79367085ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153966; x=1781758766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ij76c9jqjldbAgxsdOIP1tQ8uMrj0btVvmuzEdPMK9M=;
        b=Oy4iFgljk1JltogebzN1H9+D++VN2Pi0asHV/Amgn7XBvAjrO+xdICQAu6uZo+9bMu
         fqytccFP+L0lcC0wXzY1ZaW+uArj/HtuihwiL5TShgv4iVlqei/guxy8hfwV0hrW/b8i
         hz4GZdyHP6//LsPfHy6LKLjB2Le1oPrl2Uxdr784SIVCtq0haz5xlooztTpVcpCbeQk0
         bkmU7SIr2RIpGaxpjGy3zdwjMQFV+e3KpKBfRdgHS89jbUBJsRo2EqQxtQEspyHgx5p/
         Z9pqTxwqPryORqIYjcfikOvkk5MwdbHfdzTw8d4jWBP25rd+/Uu4YDuNfyk1tHP6oLmw
         HGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153966; x=1781758766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ij76c9jqjldbAgxsdOIP1tQ8uMrj0btVvmuzEdPMK9M=;
        b=sqvyOjpR1f6SvFNfvYTarMv537ckKA7RcUFpgd5VliJlow8C/n3ql+HW08vrFDyO0F
         BgLaIjID8j2Ztfum2UkzwbpD/W7V6nBrLx3qCnIiahSP9yNm9GzAKc33pVUAEAO+SJhW
         JujgoBt2j4oAQSzOSOptvvV/IzlxmYaQrOsBpCp9W6iI0dRAwBLbPQfRFhKvEY3572la
         l4RnRBGcJir/nvo7KwOUJVDuyNurAZb5leCCLqn6sinAheeB5I/t8uN1wcPbS3+vPiDN
         nNovB9amVRWsrqynZhxYtze/MOkVb8Ru4GL5p5RjINP00DaOjj622JpSQL6FazYbrQTd
         ArYA==
X-Gm-Message-State: AOJu0YzrGdNHr7Ca/e9QMucYmFaab1Tj/WfYZuYByIj7GkNXmcaAPx2Z
	YR8E88wud0h7d1Wh0Pl6Ngb9GYV03U7+lFv1jh7FfAXOCCYy376Pp0H5WhwPBgGwEhayFpZdgj7
	rwaCJ9U2Phf3xCq8EH8ltVqu/+N8c9S4Qq1RIc6hfF0E5AZtpqr8onOtUg4Sgyh8jGD5mPuHO3Y
	H2
X-Gm-Gg: Acq92OEq8hwY57LFBZWGH1x8KD9eXDMGn0ruBbUGuECyfO5sBRN809YgQYb9PesDpqL
	Zmd/m/s3mUgDy0BiTgeGmCx5os9OwVIZyyOtZtBoNzbvJ1ipH2mewu6FT3qaPi7xmc3OXtyOAdF
	409lbEhF3BSsLkZtCwSYniBJR7lBPgfohDJgKtmr3t3mKV32npGWGmTFEJvCW91vqvHdtwBpgrN
	mppDT45N06bsjIQQXHPYKJPO1vIvH+3oxxaSaqze9rpDzLJ8+/izwCRjj4+7RwctJcLzc0tKq7l
	HtRfLyqSrQopjol4LUK2PFSEpAFOrXBJI8hUoEZPYZRtTIbaTwgYE4pzpc2WX3Xi7y9AG67RW7e
	Yg3xMPPs17i2qphwDrtV4Hno0BLlsxX8UEcXpGihkZ9hBOg9OGlMwpUVJWjt9I57HMYA=
X-Received: by 2002:a17:903:1b66:b0:2c1:20fe:9d5a with SMTP id d9443c01a7336-2c2f373312amr13646535ad.35.1781153966206;
        Wed, 10 Jun 2026 21:59:26 -0700 (PDT)
X-Received: by 2002:a17:903:1b66:b0:2c1:20fe:9d5a with SMTP id d9443c01a7336-2c2f373312amr13646085ad.35.1781153965760;
        Wed, 10 Jun 2026 21:59:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:44 +0530
Subject: [PATCH v2 08/37] arm64: dts: qcom: sm8450: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-8-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1321;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=tXKQIHOcQOcv5dfQ4xmeHI9CPhMtp2fTEYmIOeOL4Ps=;
 b=WSu/OaebYjbYRIL9y+CfZqSN1nIrfVUAkKlPtXO4P7RmicIkXOGVMzvv7ilb3AqG39WFsk+hO
 s8UuHk/5qv6BqJGZmrUn8oHTYl9svEbesYh8hHpYoxYlDtbSwR55vU1
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: Ixy0D5xnma0wex0vRk1yuYmz5gUYfwZC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX3IIoj3zIigG7
 Z5+mUuLMatXRW2HQCYH2/Q+nG31YHPuPqhA+8zgSTgutIwQpjF/6Gslo/5AprbR+CT/7qfZ/Sov
 DOoxEq487/KNj7Whgx6w6MAmxWpl+/k=
X-Proofpoint-ORIG-GUID: Ixy0D5xnma0wex0vRk1yuYmz5gUYfwZC
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a40af cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX42DE0noBIB+l
 uBEWWJRk2XhpSitw/vv95I1eLnyo2k6A5+9TvfDPaIMjZIlzMf4VyLhprwVp0yVA8LAct5/DR3x
 C9rcKNP8uhU6LU/c6UGxSPL+a3Up/yMC/78Ueo72paN5XDF7kvf7BVFwKqeP1nkygMQonkWBwBi
 90FtaizditGOJXAPgYuPoDzBJZnkH6UQLbKev62ynnuTsDoDSuy9KmXxhuhXfpEcY5zfWRRWGFg
 X1mCVXHuXdnY8T77P3fnCUxSTFv6rBEEZ+LpI3MOxr9FXRZEc2TgIVIM6lnxtwFu231YIqArFf8
 Yu0wfN1EC2DEqBXxXs8RrBicD/GEaMP+2oDdK5Qe4g2zwHMDrHyNr9OptSNnNOD+Cplv7hb1um1
 A1c0Zss9Gvlksg1yT2s4wGcPm/TJw04CkM/JoiGCfO2GmZxL9VghDiwbRdLXSH5IO1Ik6SSHUdy
 99uMXoXOwpzqNwpQqhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112585-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0826966E684

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 03bf30b53f28..acb36aaaf20b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2035,7 +2035,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2200,7 +2200,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1


