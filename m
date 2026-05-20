Return-Path: <linux-arm-msm+bounces-108668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDGoGcCFDWo8ygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:58:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D380058B368
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B11830DFAD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5893D3002;
	Wed, 20 May 2026 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fncSJCqJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TmYlkwfr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001183CBE6F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270718; cv=none; b=hBb270KozfYA2bQWbkDUooqoNCmRdMu0gNqWDLA83qEZqfz+Z/LC270o1cgHY8lIHlvVKoK6uAD4z5OclWNelBHH5O5QNlHl1jy5zbbxZNcyx6Vi950raPHUa8EEFtjlIU+p4nrXiU4aWwGtJoZl0ggLX5ZI3+BEsBAFIvnm2yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270718; c=relaxed/simple;
	bh=nUQUz2ZwrwV7hyjdRkTWtYe+1x7qlMef9vc1soOUgjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMtS8YMYFuW3yiLqynb40oZ/kSDZmd1Aw0PTCsvJlOJ+W1O3Gw91U97cnXzqPRpheKTfOBrqPGP/2dAwrjtlBJg/luZvjS1jUZDjYUbm5Yj+VrADcuPm6YqgPb5EYQ08DNUXSSAhCvCS4c6M8Xknd2I0Lw1F2JkO4Q/J7VVI/tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fncSJCqJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TmYlkwfr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K8uiH84115323
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyJEuae2MVU9lq8QGGE+EQXImrpko0AP1JD7+dZ7iEo=; b=fncSJCqJSC0M/6Ut
	5bGXeIrghQEcI8yD9x7Z2DF2pJJp9kzeGwTcne6D+sa6wsG3wYcxI6vlDJxJQGZo
	5hIT0vU1/YhyG1N72BxOunisr6h4VjA5axqYxavlYhdOROkGVDN6JBDWKhp8iYgi
	Th4+aVoANyvM2q/6NNAtRKRZkj7/JkCLt30ktM0bWnoP6UPevbGY/G5+CYu9rkJ/
	zen6TLeh89HwyrLNNN4arfjjQpGtUnOEERidhm89f4Vnw76uTn+RKTxtfHBHjCS1
	WvN6yJZgPg/C1L6s3yB6z8HB6DwI5lvLZ8aDk0hRCMnuVLd9sq4Szlp6FcZqqMl9
	SNUX3Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0g7hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:51:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90f5edb7516so101752185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779270713; x=1779875513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cyJEuae2MVU9lq8QGGE+EQXImrpko0AP1JD7+dZ7iEo=;
        b=TmYlkwfrSW9OMeLvdLceyVW52rEE+bMGETaLjd3Awnc5xWzEcKdlBOhYQqLhI6vE/3
         +NZ81ab2KmFbEaJNtWcQ5CzNOIneWMy/TgS7Q1F29QWfU4khY7pztUBYRreH9kYizA7/
         PVleCIkoBbdmD8Reaob+8fyriKCg8Z9eRqrhgtWZNiWCBFln9GJl5uwtvkhiAFIcyILn
         x3AgQ/VWqiZqD9q5kq+/z6BMxapWKdH4ouO5gm8IUxxlTcXzbbCxcEmtK9ovRAxbXoT6
         8Bh5jw3o3KEHG9h35v8HQJzB2SBYg8xN8CTc0pcy5xVF3yj1M/2s9/jgL/LS+jNxT9Dy
         68Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779270713; x=1779875513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyJEuae2MVU9lq8QGGE+EQXImrpko0AP1JD7+dZ7iEo=;
        b=NxZW9ChVQQ8MTYzVHDLigiNln/SGbPsXGXpQDTBreNUKJR2h6HD0TfilHScYo2dFaK
         7Q45OHuIQbpqgEVrKHDxOE/QmafXlKU5Lh6OA2wlRuWiYsCaMN2yu1OUwdWUDPpKVO6/
         o6HkJZA9VO+GhVNijSmpcKa9AnLNN0hlJ2VhAakR7qX4+arqscl25Luw+YkllPCPRpAH
         //0JzBr+IpmnBBZd/S44/nvrEl/ATC7z4NCV7G4gN67MGWOVF62xH1iVYJdUkDRu1IME
         ER6Z23Gw01ga9gr/p6CRdD+K+kC+T5P+FubngdFvyQ84BOXeNOC55+9v0mFWHS3KsW6w
         /TJQ==
X-Gm-Message-State: AOJu0YzYPsmGDzhjMpEvFBShkFGKwvoUUJsQSTyaYmdQFnjXutzXrqGz
	lbW1yP+fBF2m1xE/CSck95nWA5vFoVr57qbrYyqLRc1ID/ykUAq+yGgrUPZR5d2pcWl0ekiGXig
	gB7r8K5zOApJXEnAPhHdbPLt2LpVvdgGjqSfLLQ6ciyHpR6dsvvc7r41wztwiWZdkdRmu
X-Gm-Gg: Acq92OGC/TZp7Yp6XHwF3wUaFw/7v00sABb7Ym7RN6rH+Jv+YkpDC+bBpmo3iuNonJH
	dNSHetuJ5f0V/qjGh+sxkrhEf6HwzF0sSh+Umc4uEGhqTvKJar5f0WTHx3KF0LdvC7OCv9gKywM
	0rfHHdqLnrV8R5rhYsCyKO9fkYGFCz097PbYMu/NSdcgnAY8+VNAEvZaNeDVUO1xTvWcFzSEM1K
	4S4T/Oof4Sg3WMv9hVgPsIqdJ1GCr9ILEP2lVZFl+Gq8j041nYpA9q5wGy4xTkXthLxpNmLew6P
	reS67h7Cj6/HaHyb1Kaqu1l8GBz5FDAIKICCgfMA+iL4i19vXsOtMi7WKsRNntxV/eErlS4k+cN
	2+1weodj0Rl/OEIm5c+ASqOUjnWvzCTqyj2NfTSVW+16Bd/xJk/+eI948swoytu3JTEWIAlQJ+Y
	Cxb5Zh2IyRpFODQA==
X-Received: by 2002:a05:620a:29cd:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-911d0d53498mr2156045285a.5.1779270713412;
        Wed, 20 May 2026 02:51:53 -0700 (PDT)
X-Received: by 2002:a05:620a:29cd:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-911d0d53498mr2156043685a.5.1779270712993;
        Wed, 20 May 2026 02:51:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311670a00sm7493755a12.20.2026.05.20.02.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 02:51:52 -0700 (PDT)
Message-ID: <7b47ca4e-dc20-4155-881a-b1849cc000c7@oss.qualcomm.com>
Date: Wed, 20 May 2026 11:51:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
 <20260520-add_pm4125-vbus-reg-v1-2-f6d15d7dbbe8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-add_pm4125-vbus-reg-v1-2-f6d15d7dbbe8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U5QFtYFz3Dy2YTAWt8D783WgUi4kMCFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NCBTYWx0ZWRfXydaiSS+7G5gh
 lXBgV45lPirmCeaZpJDH4MWG5sEVe6O7YkjG54nDtmRsjLGWLI4AvxHPjcDA8BliNVfcF75F/XO
 Z6uSw/3ZhDMIVHz4PQqGntjg2o4qQKuPY6tUDncD410NCfF7IRitLfNiTjmeemAAnariVKGt/9N
 YWIgFnhJHff5Hb4r7JfHUQT/oqxMalpWvJ5YeAPFDEqc582DE3onjCufD/35OplGkLTTA8V2mfl
 WmUAht2JnQJ5BNHnkGqhJEJuJmHG2lR1fStabJ3TuAQdszKeV6ECbyCoHJpTLp5mM0fLt0a72s4
 4iVFFkd/2aiWC5zbESeBjcnaY/ClsyFb3dWa2JH/sZiBhNUzy7XJWOHs9xacx8uHvu3yaY/Z7JW
 E8Egufi0C7inCjRJT12WIBPbJ5Sx+Fgs2HSAj0cth7RU/ydXPaFJEXov1i0+T493fZsyxHk7MyG
 1xRFkYYD3O/a/JRwHiA==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0d8439 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IoUS9DNabq0DWTRCKIYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: U5QFtYFz3Dy2YTAWt8D783WgUi4kMCFG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200094
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108668-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D380058B368
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 11:07 AM, Rakesh Kota wrote:
> The PM4125 PMIC uses a different register layout for USB VBUS control
> compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> a current-limit selector.
> 
> Introduce per-compatible regulator descriptor data to accommodate these
> differences. This keeps the existing PM8150B current-limit logic intact
> while adding a dedicated voltage-selector path for PM4125.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom_usb_vbus-regulator.c | 102 ++++++++++++++++++++++++----
>  1 file changed, 88 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
> index cd94ed67621fee9f6d7a0327054db0ebab6cc7ee..3d425452a0b35b35c4b454f84eb28e87cc8ba4f8 100644
> --- a/drivers/regulator/qcom_usb_vbus-regulator.c
> +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
> @@ -20,10 +20,35 @@
>  #define OTG_CFG				0x53
>  #define OTG_EN_SRC_CFG			BIT(1)
>  
> +#define PM4125_CMD_OTG			0x50

This register is named differently

> +#define PM4125_VBOOST_CFG		0x52
> +#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
> +#define PM4125_OTG_CFG			0x56

And so is this one


> +#define PM4125_OTG_EN_SRC_CFG          BIT(0)
> +
> +struct qcom_usb_vbus_reg_data {
> +	u16 cmd_otg;
> +	u16 otg_cfg;
> +	u8  otg_en_src_cfg;
> +	u16 csel_reg;
> +	u8 csel_mask;
> +	const unsigned int *curr_table;
> +	unsigned int n_current_limits;
> +	u16 vsel_reg;
> +	u8 vsel_mask;
> +	const unsigned int *volt_table;
> +	unsigned int n_voltages;
> +	const struct regulator_ops *ops;
> +};

And because they're so different, keeping them in a single driver starts to
look a little odd

> +
>  static const unsigned int curr_table[] = {
>  	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
>  };

And I think there's current-limiting on this PMIC too, except in a differnt
peripheral (@1300)

Konrad

