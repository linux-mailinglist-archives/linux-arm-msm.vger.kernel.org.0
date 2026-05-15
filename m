Return-Path: <linux-arm-msm+bounces-107803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJZKG+38BmoeqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:01:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF5954DF16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45648303CEC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733F346AF30;
	Fri, 15 May 2026 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUi6NUco";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D13Pe69+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7C846AF3E
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842239; cv=none; b=ThCzpN0GrczV+ePNNEkY6I38++tyUkMmpwXzB3BhvPmq0AaUAiffINJeVHwCuccsc92i+JPgYpFMTbvf5uWWl03T+dY1J6AH74Q88N3HcPXNOP/WCoMmmqUvrbXERHUSb9HHMaDzPZSOW03P9nKP6Tqxhp6e8HIMYhfRLB6VXLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842239; c=relaxed/simple;
	bh=KMyOHu16pY6J1De+EjL/gBkrSz+CmcDSFz4/6Ha9ewU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7bYZDwev1pg3UXCcr7UVWlBSpTJ5nNjfXrdp5Ls40CosyTBxn8jxRleMCqqw+z07QY/ClVGPrRw/LwtMMbKFHATbaeyZbEIhy0SDfCb+wNQooScvg/G5vsv66+M1keF+JEfyNxabR1olkX68/nMeXEcDq7NKNXr1y+zMRzp7C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUi6NUco; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D13Pe69+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5OP3C654862
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o41tmh/VLWIFNzReckCYUr62pFMM8s1kcNK5LrBLNtM=; b=kUi6NUcoo83jJfJ9
	VGg4av0vwR67RaHD4YGqKISYmqQBLkSbaYFGgT2p7t11/qRyFiaPakIPnx5tnDK4
	MRkt0F5xks4ZqW+6G0zIhsl3jbjfBF5137ceVIWCwTmMQVWIpOv5ki78SbIqQugn
	7nW5hANLiTyPfx5PI2JbqXpMcGwdSZHlvtXbzhAzqaVhDV5Ihlb3a7obRCASpd/4
	hSc/ng+UrD42yD0ZFdtFVwtI3uozW5RyJjB+j//vHQ/MU3q/PEdkPD33R10IiBbp
	hLRWE/AToOq+PB50munjSmf9tKPDjmhvJehFs0YE7Shza18b7FUSdypYWx9VedRQ
	q1IhwA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ptycx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:50:37 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-575d7912314so311848e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842236; x=1779447036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o41tmh/VLWIFNzReckCYUr62pFMM8s1kcNK5LrBLNtM=;
        b=D13Pe69+G3dnw7Q1bsqN2HDoaoJ5/lw01ZkrgdrUix+40mQmXiYDDn8AU5sa0fGnKC
         2ac6JsnHdLCrJ0XBo0HwCEcbvLMS+dvpcqvnfHcjWd5z6bIzpLOI2xc5D3Ljj0/HOye6
         MXdLJiRWSX9AT8Vrps7dMrNT9IiR0akrFi8L3t7L7saZYog661sMeUF1Th7ejqxIXhuP
         4AwOIS1+f/nujslMbgaV+4HL97rjIev9iarxlUQOx3DV5qx3pqvqJlUFLnza1AltFY4U
         aXsfd3NMHzslxQ0/yiXo9LRBsNqkAeikCdzSSmQQLm/SmVKpWcuGwMb4+lyHYlgZfQ9m
         9ZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842236; x=1779447036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o41tmh/VLWIFNzReckCYUr62pFMM8s1kcNK5LrBLNtM=;
        b=HkErFAW7Z/o5DbrLYk/pjC6cT2WGkSVD5eg3/UBEypM4qgvlQ+ae/LaFSfK+aCQjuY
         QtKuWwUEwsvSj+Nsf69c+a7RujGzqA4AKvxzGP5Ax6U3SpNLe3nizOBmXRpBlsyLckIv
         OTm3J1E0evd6ygbFupSb678KehP8crr1XbrkZNXY1LnGsMQcmkGimd+B+jmCjE++IFHy
         wu47oH/m0AB8kbuUHxD21LDwNvueaMd1mWMWJcJAgW5er4gPPWyMp4x1jsQkEi6v8Y0P
         sUSJ51DonELbNASuk9Dr2HQQhgXZ5BjWPdzImbI64YKGbUsWjniLIc7NYQZtt5xQlyor
         Og/g==
X-Gm-Message-State: AOJu0Yz8hCy6i2VM8NnzfcQFLeDs6xh669DrU7PTE1HX4LfVRrnodt8b
	IEb/CcirNG9YDY0vjy12T+yrigrzg15kcXl3G3ey4UxB3ylSAJBTU2lwDI0M4roR/IxeSge0VCi
	F1A9uooORiq0kMLIsBJ1jz9almRjU5qvIPQ2oPPWL4Nkcphj/muC/iv4mfffn9ezGi0nR
X-Gm-Gg: Acq92OEGDh3tBQEHGac16IBQici0PxV53ccMlTa1VePA3XcQv8PnTCHhv0iROANhvdE
	Ma48gu0+f8E+0xtNDdYWIptXyko7Y2d3iamPuesFNL8WPRtPEao8UgLRIC4SEtEvRiSUqhAQGed
	qaESrUa5/aorrxo0SI9q5JG9iS90TWousnGkXSLwO0ogahq3Rc2u8MvUfSUhnoflfyYB1XixKzz
	LMzjB7JGJqLUafEL+BJ/4X3tzsRgTWTbotnU3BEGcQNpZ/1LwUECwZXwUc1RF6VYUkYy5t4/rMi
	XbFbOArSJnHb2UostWGt4uKy4a5EpwH1cmjB4omKD8T5w95mlzEqsCTT55MnplFDs4ZoHfODMbf
	XFo6VjG7iCl4XlP8YMJeZZqpyn0lV9Zl7P94MnGDyusQVqTO92NQRAcKRc+f2Cyjnx3vAfut35w
	M42pU=
X-Received: by 2002:ac5:cdf6:0:b0:575:24c1:f67f with SMTP id 71dfb90a1353d-5760bc6cd5emr567247e0c.0.1778842236354;
        Fri, 15 May 2026 03:50:36 -0700 (PDT)
X-Received: by 2002:ac5:cdf6:0:b0:575:24c1:f67f with SMTP id 71dfb90a1353d-5760bc6cd5emr567245e0c.0.1778842235935;
        Fri, 15 May 2026 03:50:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c631e2sm204793366b.28.2026.05.15.03.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:50:35 -0700 (PDT)
Message-ID: <1b741127-18ef-41f8-b645-707083d7a921@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:50:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5210: add watchdog node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -0NHsdDMU8Qq5HwC7lrLGrlD9mnrgoGm
X-Proofpoint-ORIG-GUID: -0NHsdDMU8Qq5HwC7lrLGrlD9mnrgoGm
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06fa7d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jxJJZq3ZtHt7umw_vL8A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfXw6Jq5fjJxN9T
 B1MshaF7lSCahlE+RzqErzh7Gji6x07pN21wLXjLVhQhuTU3Frz/IIsIriEjvsLwXaPSrXZ+RKH
 D9p4OuO/i3PHPCylz4I0nID6RBqVyMmC1R72Zrd1oCkSZ6rtJg8aey5Ukq+UpwU2VW81nmjb+zk
 AwID6DQq56Psvb+Aaf5UM03F8olEiokZTD0RAv9019RRwwbHbVGLH6EXlsATMyaNHrK7xzECueN
 7SOhWWTRZwuhfKza4IIqBJGk2vrQcKafZ0zaUecQOFNZBXqPC86BKTl2XTRYAaoNX40woj3Sfnd
 zA6MGmG1soq7QuuMvjK1Dwp1lvYf23wqwtT8tjdsVJdmi7ZAuEHFMRU2t6CFHrqwyIH0mwoyER0
 ej6Q7tcLg5se/K+JauEvFL0ju1jpVb2A8fyNAy7MxwaMZM5Wdz2hD1VAzbDO7Rbv3OMSOaAlElU
 vLx/mEgfbIKXOg4Mzdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: 3CF5954DF16
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107803-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/11/26 12:56 PM, Kathiravan Thirumoorthy wrote:
> Add the watchdog device node for IPQ5210 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> index 3761eb03ab24..2cdc10529c48 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -236,6 +236,13 @@ v2m2: v2m@2000 {
>  			};
>  		};
>  
> +		watchdog@b017000 {
> +			compatible = "qcom,apss-wdt-ipq5210", "qcom,kpss-wdt";
> +			reg = <0x0 0x0b017000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;

Are you sure about the interrupt no?

Konrad

