Return-Path: <linux-arm-msm+bounces-91993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBjFIR+xhWkRFAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:15:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1299DFBE61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F36E3013685
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 09:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199FA3570C4;
	Fri,  6 Feb 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EksFQ9S2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I7RIXDIg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9603563DE
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 09:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369073; cv=none; b=Skgpz7cCsnNS2/Nxqdmw762WCmi3x8vuBhxLzoC52CW1jeYkubTQwZqWqg+X2WmvvOYqZSAioNmbwHJTwJlmkY3L7vQA5zNF1nfyNfMEEz36Hw5DQLc4F1naWCNVk+L0kh39Sxz+Fi8pttGarNNYnTFyjxHQhvE//mMFNyCzAx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369073; c=relaxed/simple;
	bh=TIVw9CNpR7eKwcCcEB9OVbsac8JnxA9iryTKgfDv9a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YTx8SMhiF+gl2AFlU+wikS/q5atgevWT4reH52LLuUEdRdBa1pkIW+YSNxUZwuXxbyJs0OPLYO6IFnA01u3ZXeyj1vJMMU7TX8RVTX1J3jk/1YpzCkvhuJ0y3ef7io/J9B4MOrrSAMN+iLwy1WLpaMmaBdIRO80jY+cGzw30IBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EksFQ9S2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I7RIXDIg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168YpWq2314047
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 09:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jvowj2AQnypvzkVEw1N9fZa3NmLiIaFVVSqGmxoEdTE=; b=EksFQ9S2658cCfaw
	L9i2AMXNFeGKeTEiGC8SkeuR5P8Dky2lWSiVj25Ni4b52DN9g1H3S/C2JUtvyiXX
	HzNC1KCLygWIVrKyxUdynpi1bIGkeUtE0omtaXjTXPurFlEhjGCTbksObszvp+Kt
	J/8z+Z6bMPHLVMLDXF4JAaakTvYxbJsz2oZiMkLtdS5vSgDOw/akDR6IG2dE7Sya
	g4zPmxnS0jARjOJw39SQ70RxRsWOTKtOt6COH3HIQKJksuGodzFs6QfXy4l4lSaD
	9XyTFvOuHwiyx3ldJE0eYSdqtcWDeU8ORBwTywQ3PXy8XozF4f+oeI20eiWXyVIH
	8ChUSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c52mrj740-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:11:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a182d4e1so40532885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 01:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770369071; x=1770973871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvowj2AQnypvzkVEw1N9fZa3NmLiIaFVVSqGmxoEdTE=;
        b=I7RIXDIgjBd05vvqzguvtll1IwegUmuAG/6Xqqukg+1trYtGcjLuvlHihUDpmM7llH
         1H3IUK6PVHTbEeHFwboSDbKl782ME3vFfWlM39hk4ySyIbHcJIJuJWS5HULMwEKz7sC+
         PmQcect2REoPiG8oeRAyWtqhM50OzFiqAAyG76/d7CRC7+BtTVi1lKhlG7S11E48tpYu
         y2f8osCDGkapeqln1UoFZT1NJMhDdygv/CXk3ZgMBcyBBYaRzMAx9ABUq0emq9i8Wlmg
         Y8ZKn+Lwe6CvRv47yA+TAQQxS46lX6iLwqYd0Yk5wUgsM8rTuXtsCyXapSEIrwGstKp7
         yvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770369071; x=1770973871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvowj2AQnypvzkVEw1N9fZa3NmLiIaFVVSqGmxoEdTE=;
        b=AWEG84tWxedf4rj/ppTXfVD25uUinFK1n2btDW15+5WtsrGK1QPqnrX7oJHNwy+k91
         zwwXCa1xW873uqjsdm6UZL6rWhLN/FUck6jA9j4OClQS1yqJQi5qcba8BxtAg/D6/IN+
         RwTJ8OvASFP9LTQuIDL+LJgeUvE1QTq3e3UfsdeSRThzA2JHM4FYRLfax3otW9bhaO7R
         wfVY4nEjYqvC+Adzp+NAxAHUK1Z6sNOQSWzYahcxvwThiAVX/8Av9Y1CJ4hEXm/fNyuT
         IDlk0zqZBRwHTHYrzb1ZTdypgcmBP82nB0QOl32SPaLLQ4/N1P/25nkCjhn/Y88NYWeR
         Rs/w==
X-Forwarded-Encrypted: i=1; AJvYcCW+bTBv0T3DZMiDU5r4mVCKWMmUdBjlN9h7K8i0xMOAn83Vlq64zXxywdNM5Cllmzmkg6oicJFi/SaZnGvF@vger.kernel.org
X-Gm-Message-State: AOJu0YxYcRsPg+4cJbbRCrGACybtWs7mRDmif6b73+u9slyAjUxBuSj0
	m7Ktf+yLRMAP2mb7EotcRHmObL/HvvuRIccGxXPTT61OhUz/ac0aFe62UX39Re9S6XT1ZiojUg6
	CIsuyWXGmtX4n4IN5Tpdjn8n5LTdRa9b1kvppGr2cUfSp17XJBmnjtkes/lfhrvVNrLGW
X-Gm-Gg: AZuq6aJsWZi6mxI9crL3aeLj83JVhsKmvAeIT9auxX6s20YTOl8cZg1hHNT2qU9xKdX
	6Mgf3HcQQ13URnk4+5lOt+ISaElioXQPDntRjSe8Pgv21zsP++2YsvKVU9sSgxcMaPRwewKM5Y7
	cLGPGZ6aiCKtuDtSz0+5NcFR6cPMxLpZvbRzYsVWa3LFcXzki5k1O8snjn8svNZiL0OVBkRSKC9
	BVXBUlSP70NaIwVCuiaihv4q8INm7gFbwLbJo7Vtd3C80li5PFaaRZBSUczCNUn0Zg85MfZj6qM
	aYX0znCY/lVjfSSyRNmmG0fIdM3nwbPtQ4DPu9OwCrEscb8jsEOsxlMn5qhcihkR2hLfTEjL+lT
	hzpAN74E5R223L6wVPpiymTDGbZb4mt4ssRgtO2ojswtPOqNAjcT8M9moqqWzPLGE6w0=
X-Received: by 2002:a05:620a:14c:b0:8c0:c999:df5a with SMTP id af79cd13be357-8caf067dda9mr143077985a.6.1770369070978;
        Fri, 06 Feb 2026 01:11:10 -0800 (PST)
X-Received: by 2002:a05:620a:14c:b0:8c0:c999:df5a with SMTP id af79cd13be357-8caf067dda9mr143076085a.6.1770369070535;
        Fri, 06 Feb 2026 01:11:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda74a515sm65081666b.2.2026.02.06.01.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:11:09 -0800 (PST)
Message-ID: <98ad13d8-82d0-4def-917d-b99cf455c5f1@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 10:11:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2MCBTYWx0ZWRfX5NwlXIiMs4dr
 /sEsiQbOUvFM/tudoznobCBDtnllkmM0amwKwNP5sGyHXxMS2Ckukil4vHKgbtoPGL4pYPKDq7Q
 +MHBg+OKGYraqK9knT+ktWr2vcxgFSbJ1VOJcSF89JNyYJTwezc4V1vfI36AFA458z9OFFY1Set
 d0xrpxUocCB2B7tVwSZ7fMw7zi50BfgqFx9z89map64QqKJ7b6zpFIrXON5Ch1+0HYwvxgb4xie
 Elqh+pM4uaAyAVDpFDqm7Vjhzr9HDKOntKzoVeNEbCxhNW6kl29HQrXDYTp3b7Lx5zuQGb4J/gM
 YwBN1Njlo/oxrqq9eOmk+1OVfRWJYtNP5ncKCViEWdVXGb3kTaQd61NevK+JFqeB3ON1DACfOAO
 2C+U8vNMjXfLX/VqRryVvDkflUYUfggfYFXAm48S6vpBsBYveA0oG8PfJbaCG3lA2jzg4DJwqgk
 RMkGPrt4DerhlQ+oVVA==
X-Proofpoint-GUID: 5MjRTf4jnIAEtNun5_p2yAdYJmFxvZ2F
X-Authority-Analysis: v=2.4 cv=e4kLiKp/ c=1 sm=1 tr=0 ts=6985b030 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=XTV_dTSmcC2b72LbCk0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5MjRTf4jnIAEtNun5_p2yAdYJmFxvZ2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060060
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91993-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,1d00:email,c000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1299DFBE61
X-Rspamd-Action: no action

On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Enable Qualcomm BCL hardware devicetree binding configuration
> for pm7250b.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> index 0761e6b5fd8d..69ad76831cde 100644
> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		bcl@1d00 {
> +			compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
> +			reg = <0x1d00>;
> +			interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "bcl-max-min",
> +					  "bcl-critical";

We should strip the "bcl-" prefix, since these interrupts happen
to be under the bcl device

> +			overcurrent-thresholds-milliamp = <5500 6000>;

Is that something that we expect to change between boards, or is
that an electrical characteristic of the PM7250B?

Konrad

