Return-Path: <linux-arm-msm+bounces-105151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKT/OYvJ8Wn+kQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:04:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD184917DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFE2630078F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B290339EF22;
	Wed, 29 Apr 2026 09:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhMfS0EL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eb+/cDVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25FC3B6BF1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453405; cv=none; b=hWp638EMG7MTHhiXRzsZQqGZHLJq7LU2a3LgObl8TjobSF5XC2u6qRjXSuzGghzWMqDcXwHG+IAApHTsU3VfXqCKfXGVbJSdZ6S4C5QLpS4jtJY6pmaq5JKtzo/qWYKtBuatxrxa5McTbYSZxY7vqN4K6chEcYlcz4W/dun6c4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453405; c=relaxed/simple;
	bh=/4o97OPtER8l7x0S6Lw3CZV78+td0Tb7950CqS2QpjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUpo53exlECt7Np3f7ImNBk+Yd6swVt9DEaz6yMip+fSjvKWiYYa+wk17kcW0vJT8JKk6TLLxSONzCMKjJBC25FevCbs/ofaajZH3ECMQj5Rs1QJlpHZY4Ylo9z3BbOFxeKxQQ6j/UAYqzpLLQOgH3DfF/mDrWBG0qhRtWbb3qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhMfS0EL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eb+/cDVb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qIhM1729747
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j60wI/7DJPDXs0dSNvS8ZkxMZOvpfZ+OZ+03Vj5+YPA=; b=IhMfS0ELdpvtPraQ
	H57I2K5mSNI/IJuWA1/r3p7anS6FEcknLRrf35mKOs2h/JHWOlziFHCtr+gJxiBk
	S3isj3DUE0unpQpmwJw6ypjLpLKr9v7eDdKqSmVnib4HhHu3JR3XCp9SJgpz+c7u
	bTKC0bx8u35D7rt70KN5oxxk0LYCQknwettvUPE/R5GyZO/Ya2d1+I5/hXPJ8GRo
	CYebPBRQkCQahV49lHvcmRg6YThnHyPK2ytMGMUTwlTGAADEqNvXyUD55pRvejsk
	0sR4rkX2DbbtZMnk7nacUoZWmY7YUJUGPllc9UR1v421wPgvdTB13wLt/wA0jnZC
	RKNd6w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5kr81q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:03:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca5b32b89so35411776d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453402; x=1778058202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j60wI/7DJPDXs0dSNvS8ZkxMZOvpfZ+OZ+03Vj5+YPA=;
        b=eb+/cDVbf9WXw6R9lG9niGNdOTgG4AElv/dql+TyMqJI9cK+B3BdURVjmNlGVfKpdF
         4vq41R1E9PdCtnq2Ve1UXjPgDlr3Ju9tXUGCWY6BIbFy6Z6wdLUu/oQ13ruIqvs+vhIM
         xqiAijSSyTCWSTxoVaM2uskou7/RJpCvmUqaxKycv0R9+iQVGEgOrLY61zpT0wL1uTPs
         r06+AXGX+dV4Ct+4R3raIMVE3mBckFEP/Q8QGyNx6ebaH9GgocR7wIPv27IsBF7ooI/D
         x6/sSTC4rNoPejWqhr6GFSqk4T1HZqnr8MCD4L1jQgYetzJgGh89eji/VDtu+wqOCHNh
         jtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453402; x=1778058202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j60wI/7DJPDXs0dSNvS8ZkxMZOvpfZ+OZ+03Vj5+YPA=;
        b=CRoxSQA3N6iXU7h0yYsA8Exscen05/4/WRqwW6IhlwvjQjdkczuwcCZC+6S4Cihqvz
         3iV7TDUckPqzC/nlOENmVe8YCb2RrY/nbNV3q6n4JXhTqxwoNU9T5W3QJa6cOwbmvhgc
         6wkYRQH6z9y8jI4cWTy0hb4B07P4LgsQft/lgLzG8n81AnS5IHoIdvZWqOuy6WNVAeM4
         vX0wQNDe65t9x/fXBn+/ZdRfovoP3928DQZFwjKFAh/odSBVAZntWgWX2tHa7Uf8x0KC
         W90+n4MKk25GGIvufmDKKT1nvKx+q6VQOYakKZc4RaD8i4EGCQzpVDMWDHUGc19tmrW7
         npuw==
X-Gm-Message-State: AOJu0YyoEE6baVhbf6Jz6zbItLPEa9pU8TrrXsmAQMVN6QyUDeMx4FD2
	4jg1npJSJQwyRylJWNYn1TWowsqsOm5tjPTu6KqRFH1/Ja8lwWrAP/FvraLpTAuomzZrqDM58gK
	byOkE6gAa05YzxfQl/f8aQ++eHBsBGbV25wmKI3VWucAMQ2zVHx6BcW0Md4HESaw6hZ0ftCqg9p
	A8
X-Gm-Gg: AeBDietFiFoUC6dNpi+HZ8w64qUS2Be7RGtFlAjVXkD2KJc6DJ50KawjXZNe1GnXsrG
	vYNj7Nik08+CaMMF/qJLbuvdSbKknXJhqnaNq5+92XIkzgSR6sBNVgZ3owdztb3h7sHtItMaMQP
	hDKp1rAj8Gj+Gsx8auEvbN2GZ6rj5lEuamkYWqrSrB/qzQljXIrmi3xqfu1KWPKbxrrKSLGotOw
	tsxLxmmyL+BhOB0CTFlc4iUpVXJlI49Z0P2WJ8yQDNkXnBYigHLOKIVDfHa7Kdqui6BpDCX5sBC
	N0gWYo4ZodmEgXpc83uqOWT8IuQhjFVN2FWNW6jgWY6sf/IItzyKOW8K1HHEX3/YrvosQNAkoau
	U3nLdJt9/2mFx6sO4ZuKLDKMRB4+lNL2F+9HG8Q/W7q9kJzSpyPkawu1oTjZaQYMYVNc01hYZJx
	GEuhsxjAwH2Md/Ng==
X-Received: by 2002:a05:620a:3186:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-8f7b50c55f6mr676044185a.5.1777453401903;
        Wed, 29 Apr 2026 02:03:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-8f7b50c55f6mr676040085a.5.1777453401336;
        Wed, 29 Apr 2026 02:03:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b22154d0dsm459716a12.14.2026.04.29.02.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:03:20 -0700 (PDT)
Message-ID: <527a434e-5ac6-4a79-91e7-bf8bac4adb84@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:03:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: qcom: Restrict drivers per ARM/ARM64
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-2-69ba540b3fe9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-2-69ba540b3fe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MCBTYWx0ZWRfXyS7nQ5NNpWpn
 Qbk0uKsSaWL1+ukV21gxhS6xDrTlGhbwk1H7qST4YPTfvS/hlO+0q1T0FV4nOu7w8Bor/z9+wka
 wd7s4AOs0wa1nlLfbTVhtyUClETg0dF6oLMFg9Myk3/ijWHqjASp969MxKcysVbn7VsBZLfwviL
 ffAolUuas0AwnUYD2lX9jrZ2VC0Qc7NEfVYnoeZ9QmcU4LPq0BOwSqgwrLphDyQI5FeN4Pc2occ
 8L2l4k/BTCS3G8f2nJXGaP6BOU9IsOiYs/nQ7SJZ9iuXJmLo0Z/e8V1VDIE5piwvWPCjlAsCFg2
 lh3HlWVO8UZxv35bmrC8QBRJi/qG3o03NUnh0bbjjPbJheK1gurIhB3L5dcBcz9zIeU+hPKnOcv
 Yye4Sk44XXc8jkwMjHi6LoZRv0rEcDTk01Hpu15cu1sNrOjCJtqMOcbNfUBzihtIviMwGpMKUAH
 5cXsKl1KF4vycOFGsAQ==
X-Proofpoint-GUID: PS7xDl08b5oz_di3WWyxA06GhIRTNPc7
X-Proofpoint-ORIG-GUID: PS7xDl08b5oz_di3WWyxA06GhIRTNPc7
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f1c95a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1FqbTYD1fgV-DNYpyMEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290090
X-Rspamd-Queue-Id: DAD184917DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-105151-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/29/26 10:56 AM, Krzysztof Kozlowski wrote:
> There is no point to allow selecting core SoC drivers for Qualcomm ARMv7
> SoCs when building ARM64 kernel, and vice versa.
> 
> This makes kernel configuration more difficult as many do not remember
> the Qualcomm SoCs model names/numbers and their properties like
> architecture.  No features should be lost because:
> 1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
> 2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

>  drivers/soc/qcom/Kconfig | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 62ce1c67d684..9a050ba1dbcb 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -19,6 +19,7 @@ config QCOM_AOSS_QMP
>  	tristate "Qualcomm AOSS Driver"
>  	depends on MAILBOX
>  	depends on COMMON_CLK && PM
> +	depends on ARM64 || COMPILE_TEST

SDX65

>  	select PM_GENERIC_DOMAINS
>  	help
>  	  This driver provides the means of communicating with and controlling
> @@ -37,6 +38,7 @@ config QCOM_COMMAND_DB
>  
>  config QCOM_GENI_SE
>  	tristate "QCOM GENI Serial Engine Driver"
> +	depends on ARM64 || COMPILE_TEST

OK

>  	help
>  	  This driver is used to manage Generic Interface (GENI) firmware based
>  	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
> @@ -45,6 +47,7 @@ config QCOM_GENI_SE
>  
>  config QCOM_GSBI
>  	tristate "QCOM General Serial Bus Interface"
> +	depends on ARM || COMPILE_TEST

OK

>  	select MFD_SYSCON
>  	help
>  	  Say y here to enable GSBI support.  The GSBI provides control
> @@ -53,6 +56,7 @@ config QCOM_GSBI
>  
>  config QCOM_LLCC
>  	tristate "Qualcomm Technologies, Inc. LLCC driver"
> +	depends on ARM64 || COMPILE_TEST

SDX65

>  	select REGMAP_MMIO
>  	help
>  	  Qualcomm Technologies, Inc. platform specific
> @@ -108,6 +112,7 @@ config QCOM_PMIC_GLINK
>  	depends on DRM
>  	depends on NET
>  	depends on OF
> +	depends on ARM64 || COMPILE_TEST

Probably OK?

>  	select AUXILIARY_BUS
>  	select QCOM_PDR_HELPERS
>  	select DRM_AUX_HPD_BRIDGE
> @@ -242,6 +247,7 @@ config QCOM_APR
>  	tristate "Qualcomm APR/GPR Bus (Asynchronous/Generic Packet Router)"
>  	depends on RPMSG
>  	depends on NET
> +	depends on ARM64 || COMPILE_TEST

This I think goes back to <2012 SoCs

>  	select QCOM_PDR_HELPERS
>  	help
>  	  Enable APR IPC protocol support between
> @@ -251,6 +257,7 @@ config QCOM_APR
>  
>  config QCOM_ICC_BWMON
>  	tristate "QCOM Interconnect Bandwidth Monitor driver"
> +	depends on ARM64 || COMPILE_TEST

This is OK currently, some arm32 targets have an older (unsupported today)
BWMON, I don't know if they would be using the same driver or not

>  	select PM_OPP
>  	select REGMAP_MMIO
>  	help
> @@ -265,6 +272,7 @@ config QCOM_ICC_BWMON
>  
>  config QCOM_PBS
>  	tristate "PBS trigger support for Qualcomm Technologies, Inc. PMICS"
> +	depends on ARM64 || COMPILE_TEST

MSM8909+PM660 exists and makes use of that

Konrad

