Return-Path: <linux-arm-msm+bounces-96981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPbKGspnsWnsugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:02:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5866F2640E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B8633019809
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702092BF3E2;
	Wed, 11 Mar 2026 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksKYSHzQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0o1Q270"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BCB2773D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234112; cv=none; b=BE624tySPQVcNKyLQOvhkEH4JEKzfuWFny1Zyk1+O1h8ri06anOUyjtHyNcy/qIIvGAN4gu2HClv0ebKd/syAfUoEd4eINQIPhu757v4XZL5HLrsF7tib1KeuLxFd6sU5dvvBn+/7fuzDO6YTpzp79PK4Y5UiajDmF9Dnl3sSSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234112; c=relaxed/simple;
	bh=w3DdBqnwYzlppHJlA0FKUqhcUqEniEi+aCNpmhpnk/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5GKggacgbE39BA544wGWF8yF+JWd6CsQqW6TGw8Zo0Bz0tDZl6UQJ3YxAXiJkxSu4AND52MnEJLf0I9nMhJlrU7uXpfCQzzTyoBEtsZTEmEpw5+NRglbMUWwXJ0Vym9t9En1fTAidc4VDecaAuR2eK9AA2+vhMqNRDp7AgAoQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ksKYSHzQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0o1Q270; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B82Yqx1265798
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WXcLvHbkZw0uXVaZr0o1vWk4BkeOU64L8yo+XGnvNBE=; b=ksKYSHzQ3430mJLW
	24gLPMOMJuhdnhQqN+ZLprglRvOIqbSetPAYh0jznUcwwoNm6LTMYPn2mEH4rBMl
	sjUg3vdeElCRgRXiTHmWq7Lj/5NfST7wTETyr34xKIUGMvg8w4tJbu7LFqV2uq+A
	yyOi52tFqO9Nr+e/6z8f2p/AgU7Ff2GkbR+XGOhe6PJlrkD9+P0ZGjei9ytJkuqw
	yZYaKF0aPTXObYlKAHtamWRSMSy4t6pVqS8KsVTP6vcMi5+rTY+arLLBCGY2JOTY
	RcJ6fMGSW4NJ2iNot9v2hfWhcUWrltaoiaSjXupPNzk05IADSXbBwrVN9XmgkRW+
	fBEgdg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfm2hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:01:49 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-417490c9e7aso3288696fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773234109; x=1773838909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXcLvHbkZw0uXVaZr0o1vWk4BkeOU64L8yo+XGnvNBE=;
        b=j0o1Q2700h4oPiWau3EMEmaK/R7vHSM6QHTqZG4HP4bqTy9hfHjinCumz2d52PankF
         h1QiNko5DQKI3ksohFmv11VGrh48xTM9BtmCc1t4ljSVtPANrfPIFqUDLlqi/yex0TV4
         /czBhEAMoRAmWbs8plRQzKw8c3ZLwR1lV4z4ZIjs6n/6boIFBapEyF0Fdvr8LQtYpZcr
         seXm0jBrNZ+pDh2pM4r3pKGr04LdDUSWrpLYxxQhWGMw5sOLyWl+6BtkajfNUeyqbMcO
         gL0YKAr8Ci1QXm75wttiHJkwox6tTR/m3kYcH04MvG9VtUCdnVnlSo0NHQx/IbTGjaKp
         8lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234109; x=1773838909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXcLvHbkZw0uXVaZr0o1vWk4BkeOU64L8yo+XGnvNBE=;
        b=KKYTGGUgFvSuZ+OFReVN0LQ5x8d/FPygI0oSqnuln/6MpCdNlupa1v+alYgwjGOSTf
         MDszg5pTuFarWQbyZczFxDejJkyw9NsuSgpF2T6pzdvwKQtTXl0n8Jlmvjg4gaeCducQ
         9BvT1L46JtlWzJ/rfQrP5vFKXTmV20ffyAjPY7fzIEOCQTipo9OY7d7g/7kI5LHTMpnZ
         P+u1pyfePkZycaGw/u7b5nni4QiQcncFju3qS1zpvU5cSkinwERLixIDrjZhsKOblaXR
         v0FF3WhMP04TfAUL6pfO5c+sBjFFGolXtV3SkidDu0t5AW0wJiFpxCr0aXi2H3352WOt
         e4jg==
X-Gm-Message-State: AOJu0YyhG3EMAKkoBDY5BOFO8B6JxnMYlQ1p0ip6zoKaxzOwAZekGEec
	+U/IULNxUX6YB7fMOQlCERKhDAs00qRYrYJYukXRL6LxL0dwUElVW22V7XLWpn5xrijlbK5c0ST
	+4s+vfNO4oQmKAZnrq6s40oxq+CxeHkHYr7msgxXOgawEG57Ut36vpLc14+cZqUGb7T0zYZGqpA
	Ud
X-Gm-Gg: ATEYQzxIHStLhVbHeIWszjGWp/VDPX3HmoH3/LBH0Y1z0hK5J35vAY98RpqEfroHbTH
	tcu6OBsbcTzy7cN9HlY18m5dojeSjjw99FOM7vyXruZQajQxlpskt8ivKJJPU5GWW43uG/hs0pb
	ydWuYFBqBNitHCJ67sDQ1epK9sai7yat6Xl0Peo4FwwgJeY0aMCr5gKtteLWcloTczwRSFmycHX
	mXDS35Ll6eYQpoQM05jXwNxNm+HJ9SousryLNbGYVnP0XVDMLwyJ5xhBCx/NNV99PpOE0e7O5rT
	XnCdL56XfVcdYVjabR37C6ylOs6uxdrSRNwG+SlZDtgVKMgXp4qZCNCtPh+fe0X+4g94/u90k8b
	359a64A24goRQL1GCLNdePLf5aMXSDcJxJfWz/9qKI8GNOHwCsq/auwy1tZTLfKqoBHir+ruYjp
	Wwf8M=
X-Received: by 2002:a05:6870:a199:b0:408:a779:41a7 with SMTP id 586e51a60fabf-4177c9fd737mr1130452fac.7.1773234108101;
        Wed, 11 Mar 2026 06:01:48 -0700 (PDT)
X-Received: by 2002:a05:6870:a199:b0:408:a779:41a7 with SMTP id 586e51a60fabf-4177c9fd737mr1130324fac.7.1773234105957;
        Wed, 11 Mar 2026 06:01:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6631532db0dsm524054a12.32.2026.03.11.06.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:01:44 -0700 (PDT)
Message-ID: <5304144a-0907-4b7e-8c65-d0d37e74e9f8@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:01:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] usb: typec: qcom: Add support for shared USBIN
 VBUS detection
To: Alexander Koskovich <AKoskovich@pm.me>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
 <20260308-qcom-typec-shared-vbus-v1-2-7d574b91052a@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260308-qcom-typec-shared-vbus-v1-2-7d574b91052a@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J5Hm0Yu5I2hI-gpm56zhDq6lnIDtKQGK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExMCBTYWx0ZWRfX99L1CwtwNu/5
 tSM8uAzmQTAeux/GxuoVKfmJqJW83KqKMf7QPmXRtmonTUICKcLIz/B+H33ck3NjR9rhvPL3HtE
 PkSbRc5RnFBQlwfSfYXNLLUwOsv5he4GELMlplYG4M624XOfEYaOaln+d/h7SGsGpq9sm09zzpd
 ey5RSdujSjypG7wxittgAQlYI1ord97EOyy0945KGbTeV0j69BKXn/I6ZOJ83gHdy95UKlQLrrn
 JzJlugnTkj0epH8SswfmR2s2onnXGFaSNQERbp8CHgzcxBte1FP4xDzLQ+yiQW4fc5cqoc0RaE1
 FtQEvL2Q+WJ8soHZiYx+TDDbp5HwfmXJTdygbn9whJzGd6M9gwzzWQvcAwXcNZ7OaiRD504AtPM
 uOnJvKIj4xM2+2VuhUYp/0rLlCnVot8lAGIUUz//akW8R38vnbBE0bwYRbibkjGRBUdv/HX9Oyh
 GaCzYXinRxHAGv4iq/w==
X-Proofpoint-ORIG-GUID: J5Hm0Yu5I2hI-gpm56zhDq6lnIDtKQGK
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b167bd cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=A_zI2UM3U9TYkvnQF4QA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110110
X-Rspamd-Queue-Id: 5866F2640E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,pm.me:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96981-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 12:20 AM, Alexander Koskovich wrote:
> On devices with multiple USB-C ports whose VBUS lines are wired to a
> single shared USBIN input on the PM8150B PMIC (e.g. ASUS ROG Phone 3), the
> Type-C port controller cannot distinguish which port is providing VBUS.
> 
> In practice this shows up as being unable to use the affected Type-C port
> while the other port is connected to a device providing VBUS such as a PC
> or charger.
> 
> Add support for an optional vbus-detect-gpios property that allows the
> Type-C port controller to read VBUS state from a per-port GPIO instead of
> the shared USBIN input. When present, the driver also bypasses VSAFE0V
> checks and switches DRP toggling to TRY_SRC to avoid false source
> detection caused by VBUS present on USBIN from another port.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

[...]

> +	if (pmic_typec_port->vbus_detect_gpio) {
> +		vbus = gpiod_get_value_cansleep(pmic_typec_port->vbus_detect_gpio);
> +		return vbus;

"return gpiod_..."

[...]

> +	/*
> +	 * On devices with multiple USB-C ports sharing USBIN, bypass
> +	 * VSAFE0V so SRC attachment can complete despite VBUS being
> +	 * present on USBIN from another port.
> +	 */
> +	if (pmic_typec_port->vbus_detect_gpio) {
> +		ret = regmap_update_bits(pmic_typec_port->regmap,
> +					 pmic_typec_port->base + TYPEC_EXIT_STATE_CFG_REG,
> +					 BYPASS_VSAFE0V_DURING_ROLE_SWAP,
> +					 BYPASS_VSAFE0V_DURING_ROLE_SWAP);

regmap_set_bits()



> +		if (ret)
> +			goto done;
> +	}
> +
>  	pmic_typec_port->tcpm_port = tcpm_port;
>  
>  	for (i = 0; i < pmic_typec_port->nr_irqs; i++)
> @@ -724,6 +760,12 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  	if (IS_ERR(pmic_typec_port->vdd_vbus))
>  		return PTR_ERR(pmic_typec_port->vdd_vbus);
>  
> +	pmic_typec_port->vbus_detect_gpio = devm_gpiod_get_optional(dev, "vbus-detect",
> +								 GPIOD_IN);

I thought the intent here was to have 2 GPIOs, one per port - could
you please shed some light on this?

Konrad

