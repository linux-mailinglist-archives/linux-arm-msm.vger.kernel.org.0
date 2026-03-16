Return-Path: <linux-arm-msm+bounces-97919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN4OKJ/jt2mzWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:03:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A1A29870B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C92F83001845
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190E2270575;
	Mon, 16 Mar 2026 11:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvbbAm3C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jljJdOFE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0002265CC2
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659033; cv=none; b=SoSC7BnpeCMsT0MU2gIqskvaZlKFEa1bHjb1VOQEWqK7iANN6oWQcvZiu7a42gBZlpQYuVUdzVSaFGQEFSnAhGQSmM6UgfE/NN3VtQEkfU1L/tLjPKL3TrBtvfUOJCfB7HJhYYAZTcWMcsIiYdKwWLfr6QPgFCMkms06Sh6AMys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659033; c=relaxed/simple;
	bh=ONDlb32qfrMTx81xQ6xuub1GdI9oAvu0FzssNJPtv6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgTIRtQmZvTs05ebiLZJ+I5d79N8UUM2ACuRQBpTKVjbu8tRsq2l5VzOdIGUvErMkYCYTjbFUtKbHMyl0cSeAyYsy7F/aCTGYnVAY7uz4RruR2fUgp4Y9WpXDXk6NKaXhae/T/KGCo8XLbbkQWU2cY8lKnE23ocjYFikdRkXlig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvbbAm3C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jljJdOFE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G7n2ZU041968
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKvEpj8o9w79DY7CvTp53X7PaYtXe6EY1qdauKk/1vg=; b=lvbbAm3CdT+5AmBd
	RTS7RJ9LUCLAYXQdoAdIf5ZB1ZO0uUlR0UsTZtkFj51lNUCF18cPBuBlTotvvIpj
	+oLtAu0sgaMoljjQ2XRpDhuiYQ43zHRqFdUB/alEUxb3Tbpuo7Do8O+9Nmzww2bo
	1ZQNHfkBpgspHitB/5p0APX8ZDE5tqR6FrKwmkAXGer0TqgpjEN01TDLe9cHLOfn
	tB3HP0KsujpGmu82FcOnI856l6aMvE7a4m7Mq5jvUyKvECfk8roSmAe9RK9fPtsd
	D7hWnhZjxFMvGdbT/Gpvy/SPi/PZXztVJ5h2aXTpGzc/FHjKcR+V7ihEJUyBb12J
	x0YUvQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt80pk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:03:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b04911610fso20032845ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773659030; x=1774263830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKvEpj8o9w79DY7CvTp53X7PaYtXe6EY1qdauKk/1vg=;
        b=jljJdOFEughrrj+oXp47fBxgtPPHDbWBEWoYpFm5gR7P88rcqnqjUZ9oiYPf3J56fZ
         k3zu1aGEHqRsZo96I2HV/mCXNil3p9Tej4B/Z72L7ywMHq/G3SO+CZ/4FM8073Ypv2+p
         j7hRSDFGkL7k1PDrJkDm+P4C1PgL6UYvtW+OPnYVAC0JQwkhRUYHF0xPL1K8gSVk+M56
         fwTsWQlYHzKncKierX6dSKYdASngTPUglifZV+4t7c2I41qiwd3m9Z3pNwA2wtdFRgey
         Emf37BSdGDdHjZFXcmQEouGhfXVnuZ9o3jIy8gxSHxSGVsvvw0wGkfOy2CHf+6Zg1nZ1
         X5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659030; x=1774263830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKvEpj8o9w79DY7CvTp53X7PaYtXe6EY1qdauKk/1vg=;
        b=TYwIcNVIeTxACMu6YV6cpNbnV1nqmOvjSFVGEGTg8I9jkRcSPzUfzSR2RXpgqzJDiJ
         UR8uS/jNGRP558Nu2yJhO4pJGEhW+PKTWDqIWfD8EiSKARifX1CpLvhPRi41KJKf+pE/
         BQjLPJWuqCo+F/lurYfg3YQ+uZe06lMedQYVZpH/LoUAeYKZcqifDTe5SoJM5jvC4XUv
         2NGq7G3IY4+edKGrpO8pGDFOxzXk3PS0Wh24ivvjeoEdDTJwdivz6i05u4V173uWLOuN
         2je2JQY339bs1Y5PZ5BB/0VPuwq+wy/+2qEJ4aVvmQi/gGU57lNZjkTcavulo9+C59jc
         DByw==
X-Forwarded-Encrypted: i=1; AJvYcCX4tU0fadoTuHSAcBHS+dJZkMiC2OeS8Db2nIXedvdWcP7LmXARG20ns5yF4qcXDER+BHmMaj1rvyGleNje@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0PrPxWnxePr/0AFWlOZZvUo5KO49KgvhHc7XQX458AYSC2fA
	q80WuXMHMuAtf5OYAWST0vSgr6VOuO8/UIJ7654q2Ac4hWVHgr+4JSBoisLAYxAVXunwXKZIKV1
	Sjz9azpIkw2aK+UZvoBfRtvujv5+994WYik/K03/9i6t7/q0+qCBk5av283VGjdUADxvX
X-Gm-Gg: ATEYQzz22+Dci1wNsYEHAR2fjTsAISie13zNXZ3RnIsM8AHwE6UIp57up0/mGiyOLLY
	uAP5psSPJ62jxKayp50HA8wI1gG2K8NlPLSwL8pNEbVPCcuOBIK91qFS8Ivd0I8mDjrwNn9jmLb
	tOVn9TUmeSFNT5np1so77rHrq4kTgJt0jzZ1nLqNzarUl3ShP68r/mNL0PlfO/NTq3TI49HFD0r
	rYMx5R712TcWw7Gdgz2cKd30gcW+bcifbJNh6vMqR0uxdWkwfC4hIsRfavW9H0FmR6ChT/wazDO
	6O5Nem7SrzovCPIUZwuHoL7ow2Fisq9h4ul5BvmzdV5Rs42/R4AeQwapbMSQ1IoaTyjL3awogT9
	P55cYoMV02PFfjnMW6V3Y8OBx4SpTBC4dJsX5m9D7ZxXQfYZjX3b0
X-Received: by 2002:a17:903:41c5:b0:2ae:a95e:fe58 with SMTP id d9443c01a7336-2aeca959d3bmr130518845ad.8.1773659029757;
        Mon, 16 Mar 2026 04:03:49 -0700 (PDT)
X-Received: by 2002:a17:903:41c5:b0:2ae:a95e:fe58 with SMTP id d9443c01a7336-2aeca959d3bmr130518455ad.8.1773659029227;
        Mon, 16 Mar 2026 04:03:49 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0537b6567sm40971865ad.58.2026.03.16.04.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:03:48 -0700 (PDT)
Message-ID: <5299d711-63db-4d51-888f-c9062b2c7fb6@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:33:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: Add support for GXCLK for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kN1J3niM71D2zv5KyFco8XPn50bqhxVn
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b7e396 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=m_WPT2mbnHjVYyRV6GoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: kN1J3niM71D2zv5KyFco8XPn50bqhxVn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4NCBTYWx0ZWRfXzrY8U5DYV82y
 TlD523UTygp5c8iJIJBgBckwYd74eNcE2E4vNct/5MQU6jgw1CSg78onr/m9glqsPH3dlpYzvAw
 t56bs91+xFmRvbJ7EiBgV3EuHJZenHRT8pwRh2xtxWBuskOWbFpx+BRWG0bO7UME/EMAkiMYIO5
 IiVSiHOapgrL4FutvhKrJy2iakU2CipDfsBXwli07OP03ZYlFOcsueLsEEtpWaTA0AY8GCeMrO0
 MCf8G2WurleQOvPyC/k+ubByqCHXdsnyj6Xhi1gHOeDqMEsHSvJ7YfGL0z/z7hmrdo1QOMq3fTm
 mZbWJPGKmmoFJIqtAcg2lxfwQRRavYg0qTp0gkYNibqq+W8BFUnuSODCbiyCyQr7/aM5KI7fQui
 P9dzMakJLZUSQeiHP9FiZVr0rGl/IsYn3yqvalh8mAv3UpF48rc2oHZQyYRYPFwzA2bBF1rCqZj
 D3h4LjBm/5efLgJz98w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97919-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,fairphone.com:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3A1A29870B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/6/2026 7:18 PM, Luca Weiss wrote:
> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
> clocks for the GPU subsystem on GX power domain. The GX clock controller
> driver manages only the GX GDSC and the rest of the resources of the
> controller are managed by the firmware.
> 
> We can use the existing kaanapali driver for Milos as well since the
> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
> configuration.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/Makefile             | 2 +-
>  drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 90ea21c3b7cf..155830140d26 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -182,7 +182,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
>  obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
>  obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
>  obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
> -obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
> +obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
>  obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
>  obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
>  obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
> index 3ee512f34967..d3899420d6f2 100644
> --- a/drivers/clk/qcom/gxclkctl-kaanapali.c
> +++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
> @@ -54,6 +54,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
>  static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
>  	{ .compatible = "qcom,glymur-gxclkctl" },
>  	{ .compatible = "qcom,kaanapali-gxclkctl" },
> +	{ .compatible = "qcom,milos-gxclkctl" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
> 

Reviewed-By: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh



