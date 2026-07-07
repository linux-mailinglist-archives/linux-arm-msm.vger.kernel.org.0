Return-Path: <linux-arm-msm+bounces-117228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X4N+GqLITGrhpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:36:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 038BB719DDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:36:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ixyW/EiS";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ANORwev+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117228-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117228-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D3453136FD3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EC3395276;
	Tue,  7 Jul 2026 09:22:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA6B3AB5DE
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:22:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416152; cv=none; b=lgN5GWU1mcJh78/dhPmDlTIt5qrUuveIzYRQ29DBXh5DS7M/CXSp/ZmdfrS6cC73ypeUmkFVlfM58TkJZuLFYYH2YS8g5AkodPwhFKggrbISuLt0CA7hxZGgnhy9iY+mCxWQqI4eYhz2b+XGZkB9arUGdGqo3ChGecOF7VF0h0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416152; c=relaxed/simple;
	bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VFUH1XnA013u09dyNw043L5Ny01o2pk8LZIj6ZuYaHNumiQRC7FWGu9VBg4wc4DppCJ3AzLFEaO1rdz3/HV64ubaXfQpCujI3ZAHpeat6FzepShklC7VHA32SB7QjqTOR9moI6dNDXYldHXx2CLsheJ3k2bPaB2TGGd0k+iIvKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ixyW/EiS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANORwev+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E8wV3209957
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=; b=ixyW/EiSRuMCSA6q
	+cn67X0vU3wGCVUGjYpZYAIFuIvxDoVEuCM1qW8118j6h5eUQapVTCxRRP2wAzHO
	94mwq4FjHQYNwWRe6zjEGjw9pnKCeHZ5ZgMPp01n99UYoQLG6TFrvCLGmbjsSWuK
	A/gJP8ay8Jk/q2t8orxlfj5Q8wACcMRwLK1K9Y4Mvv4JMAUNTCA/b+KbfF93qaZp
	2p6ICnP7cr6CLYBMtMiG7BWO8L/cxtrYSPZd/8xIqgn8YI5wjj0EIKE8iXTVVxen
	/asc5GRrkYtP3aqlsOwas/KznugeR4jYH+lq66IGNo58+bFOqGqnrWgwS0PPiuRo
	vDFfzw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj8ngk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:22:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84770f89b99so6476281b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416148; x=1784020948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=ANORwev+sxuviHg66vSl24Oq33xtR+QUIO2KXPmN+Fx6kEHmDxQOuArpiYd895b1rI
         mcPXtk2yhuDtzdEVLZrsN8dBXlEzP7is/SxQY5+PN2HPbcTtdpPCGSGqGaTuij5dmIrx
         MAUwqKPr6QDlQidDe1w3A/TlF/r8mBVa/+WjDlH/HyV9fC45nDJdFVFjdCa9T2nTT6ux
         jEJOdUsHZX/kE1ieLIqfI51o5Zlsopbfu6HRcldtnomQo+tzIr8tOQ9D3lZGwZBtHq1h
         slHR1B/w50RJbtSDoqrBKN+aipeqRgiPNheyqkCTuyfm8FCoGg64VrgcCVoWz1tccXRA
         zV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416148; x=1784020948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=fFOFf4OhjwuhCTxJGRxYTw3R6wOwGwRbyAqXAFRJfxZsw5tGItlA8edjaNha6DMj4d
         pUG3Au21ZSn+IWoIOF0Bau9RbFztDfzXPCBH1raUWsTzNfNU2xwHwQocjJp43BKKbM69
         z1aS+ptVmysw2Q8e8a4pzgfj/401xgHqKO5DaDM0WphiEvHbggmH13dCfiNxCYTFHWsz
         B51+CABoMAhQZoaAUdbviXIG64FkTozGKp/jcOjzbdaF6l0EaWE4ayMviGEawDYXmumw
         UOwusk+sonKCp5Gf9wQ26taR5l4J8kuzWAfIbqWn/ihSIiIYcmET6fXq4OpQEt+VQkT0
         RjJw==
X-Gm-Message-State: AOJu0YzmSsJGCi/WsMbeVKa6v64222r4NmUkMHgbuNk1yd44AfWP5yTi
	rMTspVN+gX/kjktvQbnXSNT12YHRaltzw+2+kPqtj79vDkQghTyhY+RWlMN9K9iqkoRFxLyKorU
	LGFCO5G1uEmkjONL0mYOSxYD7uKQ2Iy3Xw6iQJvjRZ/CblK8a9whrFLAWJwpU3NKpqvJS
X-Gm-Gg: AfdE7cnN0zQ/oF/aqqJSuhgHdlr/NRCX57kF5e404Z/fSfwlnFCuUyowh781++MMKRr
	8Rh7DcZyOKwWisEQY8dgu8QUwi2aYi/MKewQ1ifaFCUNiO/oeDy4VwnOCm8sF4v+iJvsQHwKm+4
	tQvC5CVJ6js5h2/153WbX1CxwuHbpa/GXDBMPdK9047140MY0lz9Q82YDE4BaurNUDQlnVVLHfP
	+Smv+w5NcjhRLYlVI4oJPB9o+1Y2YJEzmyL0xSKVTY0B6JWhrEzF/O17Nc+B3omfTmq3RWcMbjS
	4LbB6//gFkIi6L9/S1YMgwJbimYY9WqWd6ZNvSQhhwV+2VaYAAZz7NpiV1Q9boq89dGDq6mD8VE
	tTxP/51RThVcvs9XDznNGQEoBKRSVayK/Sb4u7m4=
X-Received: by 2002:a05:6a21:9d4c:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3c08edc8ef0mr5833451637.15.1783416147797;
        Tue, 07 Jul 2026 02:22:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d4c:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3c08edc8ef0mr5833401637.15.1783416147345;
        Tue, 07 Jul 2026 02:22:27 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm658864a12.12.2026.07.07.02.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:22:27 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:51:38 +0530
Subject: [PATCH v4 6/7] Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup
 parent for now"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hamoa_pdc_v3-v4-6-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783416112; l=1077;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
 b=racUsM0LIceTFRNEm1u4GJmzYjWAZ2Sm9iJh/DltpBAnUwEWTWgPpq+geLk3bwaFxiPvT3FJl
 UTpnTfsXW1bD/bgSG2pw8vi08cP/G+f3Yl9e+LwcG+BBnTUnszr/b1P
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4cc554 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=TyWXDXqlpdzf1xDbr6AA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: bUNaWusEMPsW2q1r2mpLfhUIM43UtTAB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX77lF1nmZE/yx
 uydonvF+R7ktolRWwYzEuk6mTRlV7kvsoJBbARF0QktVMBOY/VXYNPxM5pu48bsuTqVr3SmDpKv
 zPAuLaQDc05AWH0pe1g/CtyWPkOvHpcKYkSCOJEB81Gemv6lhSLFHXTEWZs1v3KqxihyjwE0E/N
 yPhYxUmIVs7zuY1LDVkmsh68S2sXzc/booJWwvC9w2SOUlyg19bmii9gPGvbd/pARg4pXCtQ/rn
 i5Jt9y7lM8gf7p7nNAtOd6phZWyVKA51+GWoL8Tr1OwgffBM0ByogfsjDLU+PCrCoFC55iKwUmp
 lrks89OhGTGVYQq3VSX92ELjVsKLH75bA2newgPkOw9cpIZoNVGx97VJ/hyhRUNuoPftiWiXuU3
 kfPv0w5Re0aomSqPIpcTCN0Ob/aE2quxVOEcXxQ5tFxi8Mpg7HMNb0GCRjAnnLf/m2v9g+tnzE8
 di5k/hJxHuFMb08cweQ==
X-Proofpoint-ORIG-GUID: bUNaWusEMPsW2q1r2mpLfhUIM43UtTAB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX2V04r390r63x
 sSo7sbBgGcp/t6S7WR0B8Zwzw2YTkBWuodEaLX4GbQGsnH8TBZ9hMz9TF79KUlRFa0j7Ug2mz7g
 aKlTGBBO7tz5MS6/s+aFEc2vPIcubyk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117228-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 038BB719DDA

This reverts commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC
wakeup parent for now").

PDC interrupts no more break GPIOs PDC irqchip is updated to work for
pass through or secondary mode. Update nwakeirq_map to reflect the GPIO
to PDC irq map size.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-x1e80100.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index 8d2b8246170b..e4c0abcd95b9 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -1836,9 +1836,7 @@ static const struct msm_pinctrl_soc_data x1e80100_pinctrl = {
 	.ngroups = ARRAY_SIZE(x1e80100_groups),
 	.ngpios = 239,
 	.wakeirq_map = x1e80100_pdc_map,
-	/* TODO: Enabling PDC currently breaks GPIO interrupts */
-	.nwakeirq_map = 0,
-	/* .nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map), */
+	.nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map),
 	.egpio_func = 9,
 };
 

-- 
2.43.0


