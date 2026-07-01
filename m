Return-Path: <linux-arm-msm+bounces-115588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nnH/K1q+RGo30AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:14:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6D56EA8A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:14:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SqprTELz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ukll8x6s;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115588-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115588-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 460783020B96
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 07:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963D93B637F;
	Wed,  1 Jul 2026 07:10:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FA83B5DED
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 07:10:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889814; cv=none; b=lvMZupqZThteSmYzgOU606ZLoz3OPADUMkT4zQAZ/yiTPiViq0o1tga9pEGoXziL8cu107OvLQYW8Q3bLakkPL5PULBqKFWMPft+Se3CtDDSbAPkzwkAixJOUhAWib2nymmBXggN9lhOgnO06CzrMo3Dz/YJ7QEbf3MrfT3tl8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889814; c=relaxed/simple;
	bh=eHRfI/jnXRdP6m6Ahka/c6+daaWAlkqndh2vyxydLiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oXlUGYXhwFUFe9+gybuoUw1dvM9PwiZQIhPfBJjRpTtvAp+cdbL4pcJCiEK/KL9UT3U2oS3ao7P20RK360pQkdN1kyaIdnaQWyWJiykjkyBPyq7sJWa367nUqZvdf29zelWXhugjxzyKIIPyHv/dvx/S8cZejnh1BTpQidPrHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqprTELz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ukll8x6s; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lOOk133217
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 07:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXvDI6k9pNGkQjD+OVVnOpN4tYm4FTTwszfumsQeE7E=; b=SqprTELzAPBXtV1U
	V7TcEle1Sax56U+WGSzNUG1lwnr3BFWFQQndx+2Aut8R7Msbix2ihTWbNICBhJt7
	GIbFHmlj1vKu7CBZMYAZ0O03QKa4damM92AAIxhxbvtH+7eP/pLa1eB3U2zffaiK
	uyKQaZdL8gf8VhvGk1g7idzNoTcXvSr9wuTLIOC+AcV7U8WMw6aq3La2QMl5aWqM
	migZvQl19jzpQB3aJrrw8gp7p/nHAI/FQ/EpuBE7A5n0mjmnyZEmv4d8nBFuRVJX
	V4vPRzYtMn7yAMqCsDnmEW9hIJgDZ4GN+2VfhqUddKHk3Cr5r+Pr6BbLfxfgQLaa
	vMyJHg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy1aa4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 07:10:09 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139fe708181so1039203c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 00:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782889808; x=1783494608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXvDI6k9pNGkQjD+OVVnOpN4tYm4FTTwszfumsQeE7E=;
        b=Ukll8x6sCPow6xFYWhooWRlgZZiGoJe/HMbRXDfwM9imA7MQgvDEybaQWgxPvQboVK
         Wxm3CwsTOJgg1PNgI97CCkNGegE/JURm/ozZX7LyiUMrZVhqVfprsTwsQH1ammpjnaN5
         UqW2R2sXZzaTc70aqFUJ1zNAq+BQ0NcOTeIHNPgiFV18jmqTM/WvbNH4Kpgy6FuInvpg
         oxVHZ/6qfakBcZf4PMcY83oArC8zDT3hM//Ego6apCjNwbPgQ+4rV+xExDKUjUbH/SSi
         V6e3hk1tPiNMVDzLYGzmaYKWe4GQL2JakMCLTHHiJs7CobqaGZFWOJj4pCdm18HC0Hob
         KvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782889808; x=1783494608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXvDI6k9pNGkQjD+OVVnOpN4tYm4FTTwszfumsQeE7E=;
        b=Cxhpu+VHCJyc0Z5C8FtqpxRAEKCq7RaEYMHQfUoHoqS9ce98VYIRO8UJ+hA+4sL1nu
         pttjifBaDqnSU6ZTIMZyariYqBm4RBjD3mZ4oyfKSSBe8n4frenxmaX3z4a7efWpl/dU
         CaaVYDjOfqqFxMyF30S6YbAp79PRWw9NeolAZKgyVnwwCiE9Y07seEqTB7RQMXO9Ket7
         AN3IHzj+ji7dTF0eOUbob3XVBJAGP00kT3ZGjZfGsJKMY03KyrlRBSzLXLF78fRD7iel
         fYsXDAZ6tt8bDMWON2hzTdsffNr+bN0Smx25DTCib9N+07F2pD6Y/bl7RctOwxPh8LMi
         AeMw==
X-Gm-Message-State: AOJu0Yyf9jYoJukxEt7dw3w46Tx/pjC0D1BZmtw3/hPH7e0Qj7Jp9M3x
	IrWKmjMmMD2HYxLg7iCyMH0syMVfWp2lPyeIFO1vJdH1I4ehynNna8wb6zlJ4dB2bx/0zFqS/t/
	7tEvpQbOVzOz8AO25GE0IpeKtYPv3PPRR7zA/ozQU9Ueheiu23xTeUY7/ulrJ4bry3Ubn
X-Gm-Gg: AfdE7cnpgjKaW5KWFMFkbmySIDgJKLFDNK2Dj64Z4FxkJ1cs3ZIM3KJvx4BHJlw9KMJ
	oA8WvXORL4WdFPyfrw3QPHwUf/BlvPRvDxUMOBqOQKRyI69uAPJWwL3R9stJ6jttTJefgFBv2Nf
	NTWaRZJwNDmWo6n2pZ9iYvpwpGuZkuoiPclNSWyc2KEEqElA1hlO2UIaYyDzhJN/mdBvm5po9W2
	5eOZLEdOan0JvhC0oaTw2W1rA5HCTpXBNrOmxjDzmjdC6KVHZxJTvXCMLsT7iFwNg/OPNIy9kWO
	AvYwUmb7MxNkO75rooruhNg4ZuTa1hIAVi3L4SJc0VBvSbgzsMT/UcOVWzq7m4eS5O8b9p5ZkzN
	OP7zXTOB7/3dqC4jtEjQli6PzeEQ2yNJvNr2g2L0KUT1fy/JCwUETNwOgRKwZJEg3/7V04NKQmA
	asPWZtANxfZ0uRkuRJ6mxBZ5Napo+JdOTMWwErlWRz
X-Received: by 2002:a05:7022:e998:b0:13b:3132:6e99 with SMTP id a92af1059eb24-13b36d7eed8mr533054c88.20.1782889808296;
        Wed, 01 Jul 2026 00:10:08 -0700 (PDT)
X-Received: by 2002:a05:7022:e998:b0:13b:3132:6e99 with SMTP id a92af1059eb24-13b36d7eed8mr533032c88.20.1782889807730;
        Wed, 01 Jul 2026 00:10:07 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab2dc1fsm14426709c88.6.2026.07.01.00.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:10:07 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 12:39:42 +0530
Subject: [PATCH v2 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-apss-clk-v2-2-776d054ab8c3@oss.qualcomm.com>
References: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
In-Reply-To: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: RGEkviAlOhDsaibueq5xyQGBL9-Xr6XT
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44bd51 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=94KMMKG3cFIHHFi95eYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfX5Koh3Grk+uz4
 1z+aAtTX9M6MRPwI1GBSNq7RDB218qSfHa7VLz8OkhDfST6I8hwocUHl5gUGv77SBMAgCgbNNc5
 crnZQdK5hRFp4eWjwsY4NdWrCwc1SQ7QZo13z+dLWG2I1FWqlYPADIa9bfC1QjqEu9+M+MIWtlj
 zwAheU71XNXPpsqR8rufmzixcSWr8j8wsXhVuHrnyEcf+eLkIY75H6T8nug8O7+VFOPs+mVFET9
 OquoZgUA8BCN664l0tUHfBvTf3M3Shs6nPusDcH2cVh0flqlvSfMQ96NvKFAs8SICQsLfVUis7r
 j5kyQayhujyC3gdEbS8gfc3uL5feOlX5FExp+jZbSuvxNKvwsphJP5olIxE0sssylIZAz85rhxI
 GkRgNAllWCBy+mW5EWw9WuIiKytlvke3Fa9vEuh6BFdbzh/FDkrAn0QYzBG8EbTABejS8vLEvUP
 XJLL2uu/a38j55NO3Ww==
X-Proofpoint-ORIG-GUID: RGEkviAlOhDsaibueq5xyQGBL9-Xr6XT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfX1P4byxVDQZ4M
 LCGCjvVkYZXl7qRTyUarG1pnGe7lK7YWlI2ie9w7NKVwHpK6x7GFrESmYFI+KIN9kbLIym9mwgu
 QEDqwyMsZ3qEY6JsR5y7nd1yOGukPxI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115588-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD6D56EA8A5

The Application Processor Subsystem on the IPQ5210 platform sources
its clock from the Huayra PLL. Add the configuration data necessary
to set it up.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/clk/qcom/apss-ipq-pll.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
index 3a8987fe7008..569ac76c75dc 100644
--- a/drivers/clk/qcom/apss-ipq-pll.c
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -79,6 +79,18 @@ static const struct alpha_pll_config ipq5018_pll_config = {
 	.test_ctl_hi_val = 0x00400003,
 };
 
+static const struct alpha_pll_config ipq5210_pll_config = {
+	.l = 0x22,
+	.config_ctl_val = 0x4001075b,
+	.config_ctl_hi_val = 0x6,
+	.early_output_mask = BIT(3),
+	.aux2_output_mask = BIT(2),
+	.aux_output_mask = BIT(1),
+	.main_output_mask = BIT(0),
+	.test_ctl_val = 0x0,
+	.test_ctl_hi_val = 0x400003,
+};
+
 /* 1.080 GHz configuration */
 static const struct alpha_pll_config ipq5332_pll_config = {
 	.l = 0x2d,
@@ -140,6 +152,12 @@ static const struct apss_pll_data ipq5018_pll_data = {
 	.pll_config = &ipq5018_pll_config,
 };
 
+static struct apss_pll_data ipq5210_pll_data = {
+	.pll_type = CLK_ALPHA_PLL_TYPE_HUAYRA,
+	.pll = &ipq_pll_huayra,
+	.pll_config = &ipq5210_pll_config,
+};
+
 static const struct apss_pll_data ipq5332_pll_data = {
 	.pll_type = CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
 	.pll = &ipq_pll_stromer_plus,
@@ -207,6 +225,7 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
 
 static const struct of_device_id apss_ipq_pll_match_table[] = {
 	{ .compatible = "qcom,ipq5018-a53pll", .data = &ipq5018_pll_data },
+	{ .compatible = "qcom,ipq5210-a53pll", .data = &ipq5210_pll_data },
 	{ .compatible = "qcom,ipq5332-a53pll", .data = &ipq5332_pll_data },
 	{ .compatible = "qcom,ipq6018-a53pll", .data = &ipq6018_pll_data },
 	{ .compatible = "qcom,ipq8074-a53pll", .data = &ipq8074_pll_data },

-- 
2.34.1


