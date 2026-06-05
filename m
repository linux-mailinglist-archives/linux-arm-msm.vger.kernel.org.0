Return-Path: <linux-arm-msm+bounces-111397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CWrcHxezImpecQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:29:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 46092647B96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:29:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EybmU2C0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BXbdQsY4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111397-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111397-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB36430336F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 11:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0ADA4D8D91;
	Fri,  5 Jun 2026 11:27:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941644D2EFC
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 11:27:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658850; cv=none; b=M7XrNoZzAXy1x7ysvAnsv2ib6WupUBqT9dp7+8/5zO6pFvPCN2jSkEsHmG3PQUdri1yyYMMUHpkOr9Ik47ECImG906m/2ztStOgS8DoXWo6gRs8+bEDk5l25HwKQZROxgXnQL7jJ9qmiEUxL7qkCRncfb5oC2vAOqKIrHVqDNNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658850; c=relaxed/simple;
	bh=7QF2sd1dxzDy5WXHWssA3GsnrCrMRA21EOVrCNzbx1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uT2ysVcNPebSHICvE1CpIHbt9tpLFldoBmG02vw8hVxv9C4hNDECNpsIDU6KrZfn/zjJYcKjHg7U0QEpViIIFbwnbr7S4oAbhVO49Yyp9zjbMX1olwtTzAK6XTRVkI+MOHCxnPtsSP9f8KwegXybSv9UY1buWOMP88AFZE0aoRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EybmU2C0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXbdQsY4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65584sTw021667
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 11:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XlHpvqwAR1oBTiwVwp9Tn/6s6+5b8j3Ln50HfuAAoDU=; b=EybmU2C0xN++N+65
	RhttXDpaocBUPxKkJWIkH/s6h0PLnp2pal8rOY4JWfxRSPfVks2dIeIeqm6+lBay
	tcRf+r7rKGNPfLO/Jksi7d4iYAbt8vEU+PrlpSi9CtZPXhCjQ68idSiYytPmZkVY
	HvZHFEKD0Zwm6v4MlpjOiwfAskaOOuTfQwfoM96pbl0/ikIccN/oWivyd5vq5Wgg
	V1RauvQKUiFueXBdbvDp4eanG54FEYCRKSLMZVcc/Nvo/m1UFeOR0FUhHdYLwzxq
	D+Av6hiSmLrp7fnw8fpnTM0j3FZE59fptHxS8QcBKMPo+rF8xTEwFdKc4dQNJLjl
	rwk/gw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ektmf8s57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 11:27:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842308adb3bso2460041b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 04:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658846; x=1781263646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlHpvqwAR1oBTiwVwp9Tn/6s6+5b8j3Ln50HfuAAoDU=;
        b=BXbdQsY4rT3DBCKUyjHz2w0NNybFZYtqZnIV/J8o55rjp6UkDw94BLshBKIz6Yvxae
         erdxAW5IP0/+DUV7dF8a1Zilrwe59+H7dnmlN+ht2smeVCNaThYnedsdDDbxI2sQ+0I9
         CCZQV1ADarux4zQzy7IKU5BCBWwvNaFtbshFXZp3KzgVo2ZBjZYIMMeO3eUERBEGCUfj
         L9qxkTa1T+CMnRj/vVEhBDqqU2q2updTfs5AmNwuljBkv2sNoYPtnhT6GlDBcO1layD3
         E2A+7qcU4z6AYjz1+I8CN5sUJNWMXAIdOpom1xsv7cRuWuAG/JWTJJK3p/XwM1ia+Exi
         wjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658846; x=1781263646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XlHpvqwAR1oBTiwVwp9Tn/6s6+5b8j3Ln50HfuAAoDU=;
        b=Z6RT/4pzIw/M3xziGWogAURJC0VOMqpvcpQ2A3HI6QycHBqpMUgL+Bt7z/EM0815zs
         yxYdS4uqfLfKrKqFvbEt4fUMp+rLNGxf+rwUAphj+rFYW7E2m3dQBmV1kzNVbs48ee/c
         PgZW46dId+1I6EXgItLdOdE2Vx0FOvsSETjIp0Mj67QXDs7Mi6KclDIhQ+Duc/5BEGpR
         7y9/ZK8CBnylNiWyd/RAy7m288rFxfKsCgQODJAymllEMP6NBkhJi8xs2ot3oXSAkXBN
         b0D5XjXeMmwL9EYC9MdYc1ogS1MxzzUSo/0kBRa55zT8hbM8gy3KfBq6EL8NUvuPdCxN
         EtDA==
X-Forwarded-Encrypted: i=1; AFNElJ9pJa1Zvnz8xisPm4twUSvuXa7m1Lhyw1dXVUXCkdqe/6hmVPrvSuQVjndT+y9gH3memt+46lLyLsy+V2jW@vger.kernel.org
X-Gm-Message-State: AOJu0YxSwtQtTUH+fu4+Ox5h8BGxDrECNCasYeOWQjlsGEo6ZpEX0qvx
	Fh2EybtMKO1O3Kh0Pg5ej3TKM0Ml+bFMBpw0HT3Qdyw1R+Kq9S43X1oGf6SrePQ6TBMrD8jssJz
	nUzXo78+yaBfqBS6ut3HnFbcUZvmV8Gn1Fvel2tBv1rfvZkZyc8v5AxwQcRMqf6AuFmiD
X-Gm-Gg: Acq92OEr7fKV9dGQvcsCS9UtDxCfo5Hr2BuQKxKwRjjZy58rwwgnFFkCbvoF7DgA/VT
	+7+YHpD/Kakwiyw6dm1MQpl/VUDbtCFCgTa643NrKQxuE4tG2coOPXC2qa2ltDpdsBZh2yXhVQB
	XtnMcM5RQ6Z8KHRxPT6zo/qaEEuoXnqnycESSTaxVkbcRVV6fWLmIsvySOUaAyAzuLk13DJtbPi
	0IOd0/i5kEIrvYbfP4afvy97r0OMPLMz9dDx8ln6zucoR+aXDqunvHO4eKrejBNOFHLvSgnrw7K
	YW55tewolN0W1jhlcxtcFP0/r/BWVJgAWLAVf/4CLqe5RBNesGBLyHumYCuScTduIt1Ec3PknHs
	x7Fu0g1kSGL9c5zvHpIYrcjQ+6df3WqRSSk23vOblG+6RAs9eYXMf5XR9jefAJwA=
X-Received: by 2002:a05:6a00:1302:b0:82c:9897:70e6 with SMTP id d2e1a72fcca58-842b0f9c4abmr3047403b3a.34.1780658846259;
        Fri, 05 Jun 2026 04:27:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:1302:b0:82c:9897:70e6 with SMTP id d2e1a72fcca58-842b0f9c4abmr3047365b3a.34.1780658845654;
        Fri, 05 Jun 2026 04:27:25 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm10626246b3a.49.2026.06.05.04.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:27:25 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 16:56:32 +0530
Subject: [PATCH 3/4] clk: qcom: Add Audio Core clock controller support on
 Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-audiocorecc-v1-3-7ee6b5f2d928@oss.qualcomm.com>
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: uZF8WFniv_E2KZKO6tu8KC02V9kFU7pP
X-Authority-Analysis: v=2.4 cv=GolyPE1C c=1 sm=1 tr=0 ts=6a22b29f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=F_syqbkkfc-CeLG8pkkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: uZF8WFniv_E2KZKO6tu8KC02V9kFU7pP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMSBTYWx0ZWRfXyILHoWbCfAZa
 IqzKNfyId8xua0Wcl33OSc2FEMFJSRsGm6pvQWZXG0TE9zYOw75BprHd3uFjgi0hR7/hLLsNVqT
 GNXUCOBPAOS/2CQOWscgRiPnV67OWsBqdeecbwuNBW+vN9nN1AwLcue1PLScl9VqxEqBSMj46Cw
 sMq2CpKfLKP8Emgy1gHP2LdrWURxG/9bzy9pmFdKlNsDKdplZgvQM841E/nCM4yL8B2GOU1Grts
 VCGl1+h5wnkuGPvBr+oHcYv02qdBJMvkzMVXGRiMeYzF/0MTnA31YzYEn3msy61ToJZs8S8Q9UL
 e15vFIDQDoq3ghDGcGAPfQBsXB1mpkRnFkfFjajynlwkX7utoKAu6Egmq45glAhhxu3WkUqzeUf
 kA9lP0n7w8G+5BNEHf01/bWxFD8wtZSb52tIzSd/7407Uk3yVUfdeLHHYYA31bBgmo4bilzyY+C
 fAfyJEwfdXLB3+sKUNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111397-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46092647B96

Add support for Audio Core Clock Controller (AUDIOCORECC) on Qualcomm
Shikra SoC. The  AUDIOCORECC clocks and resets support differs based on
Audio subsystem enablement. In the CQM variant, both clocks and resets
are required as Audio is on APPS, while in the CQS variant only reset
control is required since Audio is handled on Modem. Handle these
requirements using variant specific compatibles.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig              |  10 +
 drivers/clk/qcom/Makefile             |   1 +
 drivers/clk/qcom/audiocorecc-shikra.c | 813 ++++++++++++++++++++++++++++++++++
 3 files changed, 824 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 72e172ee0e6eaeccf709c0110e1d24fb555d894d..08e10feeaffa9a05daed5a2c5db8cb9f5eff76f3 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -155,6 +155,16 @@ config CLK_NORD_GCC
 	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
 	  of GCC, SE_GCC, NE_GCC and NW_GCC.
 
+config CLK_SHIKRA_AUDIOCORECC
+	tristate "Shikra Audio Core Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_SHIKRA_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the Audio Core clock controller on Qualcomm Shikra devices.
+	  Say Y if you want to use AudioCoreCC clocks required to support audio
+	  devices and it's functionality.
+
 config CLK_SHIKRA_GCC
 	tristate "Shikra Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 910add09b3b2fe64bb21a18f4e1e445a702e283b..c03cd721bb8d2736d1bb5e6249dfc27e3af7cb48 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
+obj-$(CONFIG_CLK_SHIKRA_AUDIOCORECC) += audiocorecc-shikra.o
 obj-$(CONFIG_CLK_SHIKRA_GCC) += gcc-shikra.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
diff --git a/drivers/clk/qcom/audiocorecc-shikra.c b/drivers/clk/qcom/audiocorecc-shikra.c
new file mode 100644
index 0000000000000000000000000000000000000000..a6756076e6421b35b424060f2f8e881403e65813
--- /dev/null
+++ b/drivers/clk/qcom/audiocorecc-shikra.c
@@ -0,0 +1,813 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+	DT_AUD_REF_CLK_SRC,
+};
+
+enum {
+	P_AUD_REF_CLK_SRC,
+	P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX,
+	P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2,
+	P_BI_TCXO,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco spark_vco[] = {
+	{ 500000000, 1000000000, 2 },
+};
+
+/* 614.4 MHz Configuration */
+static const struct alpha_pll_config audio_core_cc_dig_pll_config = {
+	.l = 0x20,
+	.alpha = 0x0,
+	.vco_val = BIT(21),
+	.post_div_val = 0x28100,
+	.post_div_mask = GENMASK(17, 8),
+	.vco_mask = GENMASK(21, 20),
+	.main_output_mask = BIT(0),
+	.aux_output_mask = BIT(1),
+	.aux2_output_mask = BIT(2),
+	.config_ctl_val = 0x4001055b,
+	.test_ctl_hi_val = 0x1,
+	.test_ctl_hi_mask = 0x1,
+};
+
+static struct clk_alpha_pll audio_core_cc_dig_pll = {
+	.offset = 0x0,
+	.config = &audio_core_cc_dig_pll_config,
+	.vco_table = spark_vco,
+	.num_vco = ARRAY_SIZE(spark_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_dig_pll",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_ops,
+		},
+	},
+};
+
+static struct clk_fixed_factor audio_core_cc_dig_pll_out_aux = {
+	.mult = 1,
+	.div = 5,
+	.hw.init = &(struct clk_init_data) {
+		.name = "audio_core_cc_dig_pll_out_aux",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &audio_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_fixed_factor audio_core_cc_dig_pll_out_aux2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data) {
+		.name = "audio_core_cc_dig_pll_out_aux2",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &audio_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static const struct parent_map audio_core_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_AUD_REF_CLK_SRC, 1 },
+	{ P_SLEEP_CLK, 2 },
+	{ P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 4 },
+	{ P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 6 },
+};
+
+static const struct clk_parent_data audio_core_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_AUD_REF_CLK_SRC },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &audio_core_cc_dig_pll_out_aux.hw },
+	{ .hw = &audio_core_cc_dig_pll_out_aux2.hw },
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_aif_if0_clk_src[] = {
+	F(240000, P_BI_TCXO, 10, 1, 8),
+	F(256000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 32),
+	F(512000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 16),
+	F(768000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 16),
+	F(1024000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 8),
+	F(1536000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 8),
+	F(2048000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 4),
+	F(3072000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 4),
+	F(4096000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 2),
+	F(6144000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 2),
+	F(8192000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 0, 0),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(12288000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if0_clk_src = {
+	.cmd_rcgr = 0x104c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if0_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if1_clk_src = {
+	.cmd_rcgr = 0x10b0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if1_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if2_clk_src = {
+	.cmd_rcgr = 0x1114,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if2_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_aif_if3_clk_src[] = {
+	F(240000, P_BI_TCXO, 10, 1, 8),
+	F(256000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 32),
+	F(512000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 16),
+	F(768000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 16),
+	F(1024000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 8),
+	F(1536000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 8),
+	F(2048000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 4),
+	F(3072000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 4),
+	F(4096000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 2),
+	F(6144000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 2),
+	F(8192000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 0, 0),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(12288000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 5, 0, 0),
+	F(49152000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if3_clk_src = {
+	.cmd_rcgr = 0x1178,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if3_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_aud_dma_clk_src[] = {
+	F(102400000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 3, 0, 0),
+	F(153600000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 2, 0, 0),
+	F(307200000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_aud_dma_clk_src = {
+	.cmd_rcgr = 0x1028,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aud_dma_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aud_dma_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_bus_clk_src[] = {
+	F(38400000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 8, 0, 0),
+	F(76800000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_bus_clk_src = {
+	.cmd_rcgr = 0x1008,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_bus_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_bus_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_ext_mclka_clk_src = {
+	.cmd_rcgr = 0x123c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_ext_mclka_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_ext_mclkb_clk_src = {
+	.cmd_rcgr = 0x125c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_ext_mclkb_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_lpaif_pcmoe_clk_src[] = {
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(15360000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 8, 0, 0),
+	F(30720000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 4, 0, 0),
+	F(61440000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_lpaif_pcmoe_clk_src = {
+	.cmd_rcgr = 0x12ac,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_lpaif_pcmoe_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_lpaif_pcmoe_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_tx_mclk_rcg_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_tx_mclk_rcg_clk_src = {
+	.cmd_rcgr = 0x127c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_tx_mclk_rcg_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_tx_mclk_rcg_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div audio_core_cc_cdiv_tx_mclk_div_clk_src = {
+	.reg = 0x129c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_cdiv_tx_mclk_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&audio_core_cc_tx_mclk_rcg_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if0_ebit_clk = {
+	.halt_reg = 0x1068,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if0_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if0_ibit_clk = {
+	.halt_reg = 0x1064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if0_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if1_ebit_clk = {
+	.halt_reg = 0x10cc,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if1_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if1_ibit_clk = {
+	.halt_reg = 0x10c8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if1_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if2_ebit_clk = {
+	.halt_reg = 0x1130,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1130,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if2_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if2_ibit_clk = {
+	.halt_reg = 0x112c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x112c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if2_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if3_ebit_clk = {
+	.halt_reg = 0x1194,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1194,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if3_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if3_ibit_clk = {
+	.halt_reg = 0x1190,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1190,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if3_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aud_dma_clk = {
+	.halt_reg = 0x1040,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1040,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aud_dma_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aud_dma_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aud_dma_mem_clk = {
+	.halt_reg = 0x1044,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1044,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aud_dma_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aud_dma_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_bus_clk = {
+	.halt_reg = 0x1020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_bus_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_bus_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_ext_mclka_out_clk = {
+	.halt_reg = 0x1254,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1254,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_ext_mclka_out_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_ext_mclka_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_ext_mclkb_out_clk = {
+	.halt_reg = 0x1274,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1274,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_ext_mclkb_out_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_ext_mclkb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_im_sleep_clk = {
+	.halt_reg = 0x12cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_im_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_lpaif_pcmoe_clk = {
+	.halt_reg = 0x12c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_lpaif_pcmoe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_lpaif_pcmoe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_rx_mclk_2x_clk = {
+	.halt_reg = 0x1298,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1298,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_rx_mclk_2x_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_tx_mclk_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_rx_mclk_clk = {
+	.halt_reg = 0x12a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_rx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_cdiv_tx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_sampling_clk = {
+	.halt_reg = 0x1000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_sampling_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_tx_mclk_2x_clk = {
+	.halt_reg = 0x1294,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1294,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_tx_mclk_2x_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_tx_mclk_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_tx_mclk_clk = {
+	.halt_reg = 0x12a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_tx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_cdiv_tx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_hw *audio_core_cc_shikra_hws[] = {
+	[AUDIO_CORE_CC_DIG_PLL_OUT_AUX] = &audio_core_cc_dig_pll_out_aux.hw,
+	[AUDIO_CORE_CC_DIG_PLL_OUT_AUX2] = &audio_core_cc_dig_pll_out_aux2.hw,
+};
+
+static struct clk_regmap *audio_core_cc_shikra_clocks[] = {
+	[AUDIO_CORE_CC_AIF_IF0_CLK_SRC] = &audio_core_cc_aif_if0_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF0_EBIT_CLK] = &audio_core_cc_aif_if0_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF0_IBIT_CLK] = &audio_core_cc_aif_if0_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF1_CLK_SRC] = &audio_core_cc_aif_if1_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF1_EBIT_CLK] = &audio_core_cc_aif_if1_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF1_IBIT_CLK] = &audio_core_cc_aif_if1_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF2_CLK_SRC] = &audio_core_cc_aif_if2_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF2_EBIT_CLK] = &audio_core_cc_aif_if2_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF2_IBIT_CLK] = &audio_core_cc_aif_if2_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF3_CLK_SRC] = &audio_core_cc_aif_if3_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF3_EBIT_CLK] = &audio_core_cc_aif_if3_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF3_IBIT_CLK] = &audio_core_cc_aif_if3_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AUD_DMA_CLK] = &audio_core_cc_aud_dma_clk.clkr,
+	[AUDIO_CORE_CC_AUD_DMA_CLK_SRC] = &audio_core_cc_aud_dma_clk_src.clkr,
+	[AUDIO_CORE_CC_AUD_DMA_MEM_CLK] = &audio_core_cc_aud_dma_mem_clk.clkr,
+	[AUDIO_CORE_CC_BUS_CLK] = &audio_core_cc_bus_clk.clkr,
+	[AUDIO_CORE_CC_BUS_CLK_SRC] = &audio_core_cc_bus_clk_src.clkr,
+	[AUDIO_CORE_CC_CDIV_TX_MCLK_DIV_CLK_SRC] = &audio_core_cc_cdiv_tx_mclk_div_clk_src.clkr,
+	[AUDIO_CORE_CC_DIG_PLL] = &audio_core_cc_dig_pll.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKA_CLK_SRC] = &audio_core_cc_ext_mclka_clk_src.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK] = &audio_core_cc_ext_mclka_out_clk.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKB_CLK_SRC] = &audio_core_cc_ext_mclkb_clk_src.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK] = &audio_core_cc_ext_mclkb_out_clk.clkr,
+	[AUDIO_CORE_CC_IM_SLEEP_CLK] = &audio_core_cc_im_sleep_clk.clkr,
+	[AUDIO_CORE_CC_LPAIF_PCMOE_CLK] = &audio_core_cc_lpaif_pcmoe_clk.clkr,
+	[AUDIO_CORE_CC_LPAIF_PCMOE_CLK_SRC] = &audio_core_cc_lpaif_pcmoe_clk_src.clkr,
+	[AUDIO_CORE_CC_RX_MCLK_2X_CLK] = &audio_core_cc_rx_mclk_2x_clk.clkr,
+	[AUDIO_CORE_CC_RX_MCLK_CLK] = &audio_core_cc_rx_mclk_clk.clkr,
+	[AUDIO_CORE_CC_SAMPLING_CLK] = &audio_core_cc_sampling_clk.clkr,
+	[AUDIO_CORE_CC_TX_MCLK_2X_CLK] = &audio_core_cc_tx_mclk_2x_clk.clkr,
+	[AUDIO_CORE_CC_TX_MCLK_CLK] = &audio_core_cc_tx_mclk_clk.clkr,
+	[AUDIO_CORE_CC_TX_MCLK_RCG_CLK_SRC] = &audio_core_cc_tx_mclk_rcg_clk_src.clkr,
+};
+
+static struct clk_alpha_pll *audio_core_cc_shikra_plls[] = {
+	&audio_core_cc_dig_pll,
+};
+
+static const struct regmap_config audio_core_cc_shikra_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x305c,
+	.fast_io = true,
+};
+
+static const struct qcom_reset_map audio_core_cc_shikra_resets[] = {
+	[AUDIO_CORE_CSR_RX_SWR_CGCR] = { 0x1c },
+	[AUDIO_CORE_CSR_TX_SWR_CGCR] = { 0x30 },
+};
+
+static const struct regmap_config audio_core_cc_shikra_reset_regmap_config = {
+	.name = "audio_core_cc_shikra_reset",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0x34,
+};
+
+static const struct qcom_cc_driver_data audio_core_cc_shikra_driver_data = {
+	.alpha_plls = audio_core_cc_shikra_plls,
+	.num_alpha_plls = ARRAY_SIZE(audio_core_cc_shikra_plls),
+};
+
+static const struct qcom_cc_desc audio_core_cc_shikra_reset_desc = {
+	.config = &audio_core_cc_shikra_reset_regmap_config,
+	.resets = audio_core_cc_shikra_resets,
+	.num_resets = ARRAY_SIZE(audio_core_cc_shikra_resets),
+};
+
+static const struct qcom_cc_desc audio_core_cc_shikra_desc = {
+	.config = &audio_core_cc_shikra_regmap_config,
+	.clk_hws = audio_core_cc_shikra_hws,
+	.num_clk_hws = ARRAY_SIZE(audio_core_cc_shikra_hws),
+	.clks = audio_core_cc_shikra_clocks,
+	.num_clks = ARRAY_SIZE(audio_core_cc_shikra_clocks),
+	.driver_data = &audio_core_cc_shikra_driver_data,
+};
+
+static const struct of_device_id audio_core_cc_shikra_match_table[] = {
+	{ .compatible = "qcom,shikra-cqm-audiocorecc" },
+	{ .compatible = "qcom,shikra-cqs-audiocorecc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, audio_core_cc_shikra_match_table);
+
+static int audio_core_cc_shikra_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = qcom_cc_probe_by_index(pdev, 1, &audio_core_cc_shikra_reset_desc);
+	if (ret)
+		return ret;
+
+	if (device_is_compatible(&pdev->dev, "qcom,shikra-cqs-audiocorecc"))
+		return 0;
+
+	return qcom_cc_probe(pdev, &audio_core_cc_shikra_desc);
+}
+
+static struct platform_driver audio_core_cc_shikra_driver = {
+	.probe = audio_core_cc_shikra_probe,
+	.driver = {
+		.name = "audiocorecc-shikra",
+		.of_match_table = audio_core_cc_shikra_match_table,
+	},
+};
+
+module_platform_driver(audio_core_cc_shikra_driver);
+
+MODULE_DESCRIPTION("QTI AUDIOCORECC Shikra Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


