Return-Path: <linux-arm-msm+bounces-90276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCKfJXPecmmNqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 03:35:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6DA6FAF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 03:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 402113009438
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 02:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676D22D8398;
	Fri, 23 Jan 2026 02:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NoFjCCue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjIW0Q+6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C232F547F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 02:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769135436; cv=none; b=IY81k401BxXAueXBY8WO/0OXtVom7SWMzh5SABwjNbCC6N9TlvAnUWVZ+axG5wPt0QLAUfOjaqnW29aPldVQEyqaA/SIhl8T6CA00hInFj39YRerUsHRJGA6B0lhPi/bOxWebk8gTCA48gZa2+2TEpKai8BMzIHP52DhO0QwINc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769135436; c=relaxed/simple;
	bh=TB1IK3oxKC4Pvn5NMkqqLOWwLoygWYshus/E1Z/h6SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTyOoATYuDUt13XhvqXU0X0tTgKr+bh6Pf/mhF5hHuDVQVx9s9SdG9RAslIHIsT1wV6GsCpdfOXyAEhpkZuxrHdX8mgKv6ZRPOLijS+9I6Rpj+w89UtJH8LDJxHMtEUBF8lRQhY56ve7nQ/+06aC5/RC4X7tBjNiof/XJt0LjD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoFjCCue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjIW0Q+6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK7jOu3126957
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 02:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6aeWGzMxBIh6hKBnzi2b6uZexZzjIgGrfHofmca0u00=; b=NoFjCCueJEZgaVON
	oTYHY1xKusFZTAAGOfDvHh1T89z90P/vVKRwm2GTje2RPIicO6FGSUsoIMCnlfx5
	2RcDG+k7xgfdpNu0S5ePAd5svYiLbkI86pytAD2+HRqMzJ3LGhOKexJ0rhJlVx26
	+EtJMyIvPBjizO1lA9tUvy6rstRp3YhKMPSc4IA94nYfPOAv/h/wayDMUUtO74hl
	d7mRiYJrRskOFtB1LsItq1Qt5qB+UQcQFjg/jknO6j5MTvq0hJBEj0iykgWJIQV+
	htRWlDjT/vqQG0q9TjA8RS6vNB3qy9mDqypOOVH5cv/p0t9QtBtpXm1E+qan6+n+
	uKT6qw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buthdry32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 02:30:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50146d98660so43268221cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 18:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769135414; x=1769740214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6aeWGzMxBIh6hKBnzi2b6uZexZzjIgGrfHofmca0u00=;
        b=kjIW0Q+6iIHqSj7jc6XzMpshl1ugnnQtAWeeJUhZEetQNR//snqeSLI5nOTTIEhi1/
         0qx00kLUDt00aMNJPgLO9QU1MYQRjNu66JDb7SDCr1AdW2hQMcR0Fch0HOX040Url76m
         /ciX7wb1YxbyD/qc4A/M/flwInlq1k7G1gx+ANVnxFCqN9OQe2mV3GPDTF8udbS3L6Kw
         6TPSr0dpCj7L99cK04iKdvwBHN375KrHbivXgKihLEqtatUBx/TlAWKAZ3PUqtupt2Pp
         pT90B/zF5q8jtQh+H5FkTgKhZA6otHmPEyZXXvn4/Kg/PCMM3z5ORaXGSSOSKlKkebd6
         Qbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769135414; x=1769740214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aeWGzMxBIh6hKBnzi2b6uZexZzjIgGrfHofmca0u00=;
        b=trwvMbdOEkqtGcLP52WuzTD7D9I8dyMyWflYPI6GFgn5G4nclurspXyAcJglf6aZ+h
         y4XZg4jO9rLBM2MObB8zqdUOiKaSJT35nAVWeKAUPRyjRK8BBte8G766kV/50pqPdc0c
         ytgY/u2twLLFo/buuZcwfd+IBIp4ma5N9h0ph4VvsTqgJhkLfmEJcrP5vLCtX74BAuTR
         zLdljt70oSg7yHrAqzOQyXEI/cOAK/rGtIawtKE4/vJxjWjzVMx6vmGrS0wvk5gzH+Zd
         Jz5pM5pX5XHZSPYRb73iaH+EdSCz7W4jC+WH3ENfVt8C41bzag7h8gq3Bwj2r2KL4UUs
         jEEA==
X-Forwarded-Encrypted: i=1; AJvYcCWK/deURTmop3115HyQcexJ3ccJnPFLNk/Hec8RuDg/qKiJrxZ4aCa3HF3IeGTT0fQXxnKUcbeGwiLK+Ahs@vger.kernel.org
X-Gm-Message-State: AOJu0YzYFfdsdAZUyQXotQ4lKGz7VIEOX2aOewaClKK8RyvVJ7d24MIO
	u8nvGIVO7CUU7ULhWrMnStct7/Ri4ZfOr0LwIz7OlnHgigfxeAeOU5Q2aKNYKfmzUsNd5hUzIVX
	z8P18vCG5/z6Dd5YHEHfSk1S0kbk2f57JxL99+2RW7467XQMcT1aPdCvzfg5xzwG7BDdF
X-Gm-Gg: AZuq6aLcQ4gBSY2SNdusIHuRKYo/zyHHg95QsO7PMFM80ijyerjcJUUqdR5xGqwlrKd
	cU5/VdLMu7yHEPcft3qk+qxjk3R8CpR0JOu5aO7aa1BV45vO+9zRJf997JicK9I7sFGHktgg7RJ
	29pPHUBzOlfW+afc96VM2fenK2XU5GCLhyRsrqifr2ir039nSXD0DxKz8v6c2MgMOIFoLMJuVHC
	1W6wxNnTyHlpsiabTrQtuuLBvHF0+vYm2UGODZDGqE/F76VdzKc3cG6MskiSd1UtcaXXS5l/TNE
	DwaJBQQc5y/+yFVW9mJGx7UWSvpc3V3ZlTv62LeQjzNkqBcM234MDRjg/G18A+CqeXlICbz2A3u
	fFmt+xLXLmgwF48UY7AxLlLfID6PLyJC6oVtSFrx/zQKcoF866XamK8JoqdMd9HoSTucd4ASNwA
	==
X-Received: by 2002:a05:622a:10f:b0:501:4236:5474 with SMTP id d75a77b69052e-502f77653ebmr23040741cf.28.1769135413666;
        Thu, 22 Jan 2026 18:30:13 -0800 (PST)
X-Received: by 2002:a05:622a:10f:b0:501:4236:5474 with SMTP id d75a77b69052e-502f77653ebmr23040251cf.28.1769135413099;
        Thu, 22 Jan 2026 18:30:13 -0800 (PST)
Received: from [10.111.171.243] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502f7ed650bsm7054291cf.11.2026.01.22.18.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 18:30:12 -0800 (PST)
Message-ID: <e0e6f248-3d82-4b0c-9ee2-4a655b7bbbfd@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 10:30:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
 <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAxNCBTYWx0ZWRfX9QWERcTjHoAS
 hCxTAyeE1r2FVyaAhC4c9auNaZKrKIvD9adi9lPhmwiF4d9FfSK+L+WXDbETDUe8UmAmPgo4BhC
 ByyOUcjlmRdvup6SvOeRpSTmpUHbhNQst1iudka193pbn8NxcaeFOXktT4muV6nJdUxdMbyYnIU
 wDRd629uzRuCyxJoGzHTUurPSyxoBa8ojeyT3gxPxPUJGnEiXHRFwJ5kpVvkJNqyxUSK/g8uFuj
 qUGH8ISOSxgqCGLRYtO8D+LLaBGPQamN0pxPivNdWzHKdbbknEj8N90VNFsOr/87kaBpwSdqvoM
 jb566VbOlm9S4Ga2hoh0I0WVPdFvW2WwVOpV7foKnikRO+dtWldVvp8aca7G+AkjISIqLUNaEqx
 CznhHKcuJOpOSASR2En4qA1e6XX7wZLt7YGEBOvnYZCq1NnZ5AAQsvKJ7aa6iKRXQL0hBXgo/rj
 M8gvCk70LihOTsHk7Dg==
X-Proofpoint-ORIG-GUID: _MygBppxbnd9mzbadFlMgbkdaJba2Fzs
X-Authority-Analysis: v=2.4 cv=XauEDY55 c=1 sm=1 tr=0 ts=6972dd36 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=yKNFHEXJphivSBQIcCoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _MygBppxbnd9mzbadFlMgbkdaJba2Fzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230014
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
	TAGGED_FROM(0.00)[bounces-90276-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,1a:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D6DA6FAF2
X-Rspamd-Action: no action

Hi Konrad,

On 1/22/2026 9:44 PM, Konrad Dybcio wrote:
> On 1/22/26 11:48 AM, Wenmeng Liu wrote:
>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>
>> The Talos EVK board does not include a camera sensor
>> by default, this DTSO has enabled the Arducam 12.3MP
>> IMX577 Mini Camera Module on the CSI-1 interface.
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&cci_i2c1 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	camera@1a {
>> +		compatible = "sony,imx577";
>> +		reg = <0x1a>;
>> +
>> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
> 
> Let's define the pin settings for the reset pin too, otherwise lgtm

The reset pin on the Talos EVK board is different from the default. Do 
you recommend that I define the reset pin's pinctrl in the Talos EVK 
board's DTS?

Thanks,
Wenmeng



