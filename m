Return-Path: <linux-arm-msm+bounces-92696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCoBDG3FjWnT6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:19:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F9712D5EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63D6930360BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E612C3570CC;
	Thu, 12 Feb 2026 12:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRYW+YBs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="be5MhbXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D3734C9B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770898793; cv=none; b=hrdESpy2HvVS4VWQJuakFWGgyFseuV6ttfHZHtCzVaD8LeD9nK6Z5EJAEMq8b4ybswOZbn1Y9IOtftBYwlNaolc6pnFJccaX4NT1iWMacvW6eOrQ7R4s8KFFQIR+IJi3aEJUJNfhlGQkkqkNNjzrHSxRghNpoGsnfGRC9P3CbW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770898793; c=relaxed/simple;
	bh=i8Ap4gNaIvASiyxPL+SFE3APyLc0S47qcf+WsC4Pams=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D2F3YMiK8Q21NEKJEa1lmiJK5oRQ3TF2Ea/S+PSWbIRbDNIZOsZuuOrzR94M9lUnrhqK9Tw4X9dcAEvuX+e+/ASAc8p8VkHTNraHM0XBLPV3Tvxdw7zgHqXIjVyLvCnmMfH0QOetMdyDy6WyuT7y1PWuc0WsAaHGdb9Z1jSL6p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRYW+YBs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=be5MhbXD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAGJf94112117
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jw/nZzUumpqk5yDdyOxVMx+emg0ZSP7UYCz1Br0e5C4=; b=WRYW+YBs5cjUXQ0g
	d30Dhc6K/kI/yai9sVLzHArrhdWNLNbooEwTk6xC43gst9Wl1BG1bdLPx1v59L3V
	Rg1e32pJi/16fic6M8Sp0u1bkJMVu7cF+HQgkFmLRwjOJkaoqsS+zpba5jeumOZ4
	UnRwB9PthhnD6BTyg9JAGQdruF/O9ea7uiFjSn6J1TYBty+HiWQcUIp4vR9jhQ63
	mUv4CBSCaqLDY7QZYCzVSXScQ2C4mdvxzQdc13f0bGxOmLV8bNOnGtUFUP9lTT0M
	/CdsUfO07guXqu10nlZNnrfhwCFHWt0OlpjWS+2NT/+/j4CUp1F90fXkNA0ijBN1
	Oz74Gw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9cya8c27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:19:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3978cdb2so9094085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 04:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770898791; x=1771503591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jw/nZzUumpqk5yDdyOxVMx+emg0ZSP7UYCz1Br0e5C4=;
        b=be5MhbXDP9zIVh1lj9FHvjiBsunqSHd/5xsJr1/ZVcNyn1lBUMggf+AljO4eyE7bNO
         aa6HPOpj+HMCJhUyxeCIpcata0IzpKRF7t75xidhZDOcF8iTh/IjAWrcRn3ZYNIV8RKx
         O5Ol6pNLJE3/dQSuTje9/+ZRr5VMubeVkQTGYarjmKWvBMEQgFZMNhIDdx/RmWHOuyqk
         znPOoFTFvhOs1hqBC843DkISg4zFQ8efqeN2qEy1ci1PV4lxa9BB6FJMHrzBGzh3PvKg
         xUbTAqigl9IFrzmiNrnHi/tnbExtHxq81kmEWekrb5zcXcdX2bCrAU8ixPP2cHr7JrYv
         UWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770898791; x=1771503591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jw/nZzUumpqk5yDdyOxVMx+emg0ZSP7UYCz1Br0e5C4=;
        b=wgKJ+/RSlZnWofXBQ9orZok7ZYuCUSSP0qkzEof526Si7SJvVfkES4MOxwb389ErBz
         lcghO22P1ljdV67S0BpBQLvYE3DcBkBAqApTl9MQYqcg3gDRilwsr6klzZn14PH8GKmc
         SYURugyquT7O73Fw1czxBhXfZbCuIb/sYdDWMoIYza9QENiffxb1aABD5Ip+biEPnSMi
         CaxHJ+kbO6+cSk+xBK4bD90wirLS1EMRIC+yy9h8+A4IZZuk0IdXNpUXocSi5TGQqM/I
         aMe9vcz72JKphzc5Neq5DS4DxiCzlprk3plXL69zeYRfCTT+Gx0ApAoLIyypwZi8ifun
         4XkA==
X-Gm-Message-State: AOJu0Yy4jSkCu61eAwkZUKZfI0j9I70SCurX+all1rtr/te9Q0RTU5YN
	QyRI+xqt8dwmvP9f0LA6OiRuhegAZgL86eBdUDsv5MZNhZkgo3qLW5dFkSn11Q1U8nW8ELNKgGi
	Mdo/8qPhfnMKEuzEz64vlzPIYlS0GWqzYafm9GSH+7lVUkEmuwt2pcq+m7LRe7rsXyBOB
X-Gm-Gg: AZuq6aJxdAyaWAiouLm11aI3IKP7ugj8dnjKbGxjL0zrgALCK4TCQGTML4CiHRwIAmY
	jOJ7xfYROMr9QAuSG99gPiBaxOaTmFTOigBit9HsQsNgg62I/aQ8ZLEi/0l5wbcCO8HSq8anUjL
	1Sj5OAfN4rAU2scjbzG0ob4g7kX+0PdAWcpH8B+JgU+FvyTOLMNBzjCh9Lvm60MZuzrZ1S1O2J2
	t8XsZxn4qarjxXK/+CzSGyfbGWgtBOAWi1HuKT3WbVrYeifrJ4qsWRuVGgsbafCx7i8+bBlANRT
	qzeGiCMhhlNkVGlvieJRi/TK8gSbg6jBtpCQT8NmheD5ynp47VUAZ84R+zO4fuy3urXpzarzaBz
	SalPdtu9gZPV0x3N1kBRbmOAM1HEYEvD4onl2c6j2CJA/DuC27PDJz2Fh8TE9BPK9+VSJNMLRR7
	O2Kpk=
X-Received: by 2002:a05:620a:448b:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cb33115b5amr237596185a.6.1770898791102;
        Thu, 12 Feb 2026 04:19:51 -0800 (PST)
X-Received: by 2002:a05:620a:448b:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cb33115b5amr237593685a.6.1770898790490;
        Thu, 12 Feb 2026 04:19:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65ba5a45a60sm223582a12.11.2026.02.12.04.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 04:19:49 -0800 (PST)
Message-ID: <5f62d384-cd53-4e35-87c3-67b45241b90f@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 13:19:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Enable PCIe1
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260212-qcm6490-idp-v1-1-80a45bd46ac5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260212-qcm6490-idp-v1-1-80a45bd46ac5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cFE1vvWsd3-ZE3V720PUaJG7pJlDinc5
X-Authority-Analysis: v=2.4 cv=OrBCCi/t c=1 sm=1 tr=0 ts=698dc567 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6A5WHeg6HuGfttMquBMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: cFE1vvWsd3-ZE3V720PUaJG7pJlDinc5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA5MiBTYWx0ZWRfX+++80dREQNDR
 irKymyn+xpU6QzQEio87wwWW7NT3jfytXLCzPNM7FNZhbihNZhOIeKoTTU707pqFpB9iwfIfMW1
 Ro5Znmlw2TEb2Qm1wB9BZGcnbCzCFVbjG129fKpONnHajyCFxCUSAAg9L9bG1kWZiqFc4ZBtY1k
 EWX9u8cF3/mvpdWTPk0RgUImBrdZq+pX9cqi7dYfqfFHF2XdIbVMni874LuJE2l7p+nEdAYGI3I
 qIgM8pMvYJWi7sw6wcTjVaNyq7DGrmFF0pdHkWU/RS5fWnyjeZVwi4yx3V8nGFDP/URhglYpkce
 TocRCoKAXgX3t8VVKixAM0vIi4q6q7dOjLjjodXN0YQt0GnUlzD5ymoMU89jgEIHiAcG9epxPet
 iOZZAGnOrARTglOFGhg+WDJdywh20prDQapriwVKl0wDWDyc/hX3Q5hV5ZG2q2BTIHbV0xxVoII
 K+rc2zxlcQlSHhKmbNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92696-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97F9712D5EE
X-Rspamd-Action: no action

On 2/12/26 1:06 PM, Sushrut Shree Trivedi wrote:
> Remove PCIe1 clocks from protected-list and enable PCIe1 controller
> and its corresponding PHY nodes on qcm6490-idp platform.
> 
> PCIe1 is used to connect NVMe based SSD's on this platform.

Is that a M.2 slot? What key (B/M etc.)?

[...]

>  &pm7250b_gpios {
>  	lcd_disp_bias_en: lcd-disp-bias-en-state {
>  		pins = "gpio2";
> @@ -920,6 +931,22 @@ &tlmm {
>  	gpio-reserved-ranges = <32 2>, /* ADSP */
>  			       <48 4>; /* NFC */
>  
> +	pcie1_reset_n: pcie1-reset-n-state {
> +		pins = "gpio2";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-low;

You're asserting the active state of a pin permanently this way, unless
the driver takes over, please drop this line

> +		bias-disable;
> +		};

Wrong indentation

> +
> +	pcie1_wake_n: pcie1-wake-n-state {
> +		pins = "gpio3";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +

Double \n

>  	sd_cd: sd-cd-state {
>  		pins = "gpio91";
>  		function = "gpio";
> 
> ---
> base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
> change-id: 20260212-qcm6490-idp-24f7b6a1812d
> 
> Best regards,

