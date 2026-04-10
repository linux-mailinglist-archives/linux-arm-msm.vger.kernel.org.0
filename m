Return-Path: <linux-arm-msm+bounces-102613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOisARO32GnnhAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:38:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC2D3D432D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD712301CD81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018253ACF07;
	Fri, 10 Apr 2026 08:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNnmzlkB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MspDM5Bg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9DC3ACF1D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810315; cv=none; b=Z6dnYDAYOOsh29lQimBoXU+jAIgHbe6CKzqCbezRaBrz/fVE7RS9IGYpXyW17AGE2RtcIrP3M8cYLWE45fdRjmClrIN8XVdLSzWd372Ny3PWx7PseYEavHxzGCI2HEp9ydziVkYsqm73Qtm002+s9N8gBhYLCjwDdioLcPLA2Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810315; c=relaxed/simple;
	bh=pcK0cy4d1QLHKuoWlb4imXsxURLwhcTmKyJq3/4B8m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgjywEwAWwW110H3/8QZe1cm4odMnToeaa1yUQpeUanZl5xke2V0eT+aItKDuxB75Ce/1W1yHMaW+fMaOw1sIE/acKNcX+7L5P/JtRo6wPGu/wwMAHu4RO3mc3K+jtmI9VtjOp/QOcWnWVLFXl8BoUicaHkLjtYW283Kv32dlwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNnmzlkB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MspDM5Bg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oWgL4148785
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyF6cs0TT9c7KJt5G+su0PloFsHOpnqMxU6VEDcmB7E=; b=dNnmzlkBDk/e7TbV
	d0mw7EEVXK67gANahGZyJNiObTHgT45/7fgyMHdrRjPKQrPCnThFaDmpeORjuP9r
	9i8NWnVZny5Rb1wf3Dyi5DIOAeBVwatqVrGdONwr4eZ4Mw+tsXQtvWf/J2RiGavY
	1yHXHFOMruU0QaYhomRB6tbHIhK4TrfvE0n8mulEtisqVLSnq/LcNcrQPIVBLZsT
	bmCA2N0DtHKmXW/7uIue2XyqVtAd5jS3AaKSjq1f7yr0wmYNTyLX5uMVMkn++caK
	qVh8xzCYKCpZ0kRY8wjN0VO4L3qnpMNHx3BYD6M6l6U3rK9MtTJK6iyLV0BAE0bm
	rrbI7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudggjc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:38:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d6061bd722so2223585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775810313; x=1776415113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cyF6cs0TT9c7KJt5G+su0PloFsHOpnqMxU6VEDcmB7E=;
        b=MspDM5BgDKkSLBUi+QE842FMjdreDqqTv+hLVKz5KCcXpf66dcOsjJlONvNv5Nuy3P
         CPPcpq/f/iPDZmG6Zu94WLSOlQx+yR7wnWzuEiwKIb/xsIIFmeTbK4pbBEGMvSX/cnCo
         mQzQGX4Yhnfrq2aAuYX5uq1vvEaqeUzIZ1cJjybuoLuj0tdZul2H63++Rzfb+H2qmwj0
         hC3GEDb2Q2ur8A10Fiqg0i1T2LNz+zQm1mIT4zdwv8VHR0Q1cBnuHnPwdKRjt4Z0xefF
         QQvxa70U0OpVaCuSVkgY1Trj3nXwlK6rHONQnyvUXDDp2/Y5h842zU4msREdn17h929+
         t1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810313; x=1776415113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyF6cs0TT9c7KJt5G+su0PloFsHOpnqMxU6VEDcmB7E=;
        b=VSZ63gi3NX7JMTzJ6ESVRlzAJu2P//qFcWWYMoDdyuE4Wnw+qJErhPUECIaNwOLvfE
         aLLlLOrI28pSVVuVALmWumeNH+BQc98f0+zJI06Js+O5/EUDKa2JVryrIPqamMQil/Az
         lRLpTeh6ZZHRjKopox/QU680e8Z9aZZEemh4W83sEcnzOMnkTsAa8I//YvZ1c8nFR3Mp
         xS9gaV3iOqH9Uq2M6qNxPCF4/4hWX+QQgsYFXwRxh7MYDiVID/AsFpz/sBCn4UCFJ//b
         KzgTKHLhYrMI/FHXpBE3IeFc6srBUdDLDbDKICnWrQY+/806PHIWnoKTTEA19VRg7Why
         edSA==
X-Forwarded-Encrypted: i=1; AJvYcCXtfW3wicVhI0vgb/ZYsiRFN/pPpClSBYHqtCHStjNQy1ED61jJHN0wbQcUB74SAo2MVCP+I5fNruLIaGlS@vger.kernel.org
X-Gm-Message-State: AOJu0YxPYhzEkEf3HlTDKSA5UILBhJcaVs9UpFhq91snBtSods/Bts/T
	2zjGljey0ZD7PFTaSl7FbbSFYLeDGkOWiZfIK9Ec/6byang6Rf6EPaMYD8pSAdS0HRVZqSCnUd9
	xFGp4kg3uD7r6UX3C+RRSSWRcg+oQEJUxN0B7yXaQ1cz6xds6L8+VSRR+wZlD+T3Ks1cr
X-Gm-Gg: AeBDietCvAQDCuIoT5F5BJ+17+GplLEYj0SVYTZ8MDU/hJh/Pjs+MrrZCjPR8GKIDjy
	Ix3ktqqhjw+0h1KKDVsVvt9QEAOOpImxumTj3Pi/kwF2nuj+MngZ7LPX1clYhwMS+zVEeCHGO7c
	a63++5u8i4qD+ljOl1jpRHUv4rG0NCMT5j60mqAKo7b89Zr5x/PFwrE1Nh/vWF4zspXPMnBM/An
	tzNK1+YNB8gXnfQ29PWblKECstIWgQK9lZ9TUna39rZzBFnTsgIpiWfnafm6BF/VGSGnY8tYp36
	3HkoNYuhArS3bZG0JHBPUqPF4hZFOr1dyASNx9cKpluzEOegtGl4Zx37LA4UwgZmwgZF1XCuEnJ
	PLf2y/4f2vhF/h711yl0VZ+rQY2i5e11gPdxkTQ33NBecmBESqoCYkwxSYtAgtujzFBHPXemXD6
	kSzYX8ST1s
X-Received: by 2002:a05:620a:2586:b0:8cf:c218:739b with SMTP id af79cd13be357-8ddcd6fda32mr272172785a.18.1775810312781;
        Fri, 10 Apr 2026 01:38:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:8cf:c218:739b with SMTP id af79cd13be357-8ddcd6fda32mr272170785a.18.1775810312268;
        Fri, 10 Apr 2026 01:38:32 -0700 (PDT)
Received: from [10.111.174.66] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8de94216e90sm3026185a.1.2026.04.10.01.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:38:31 -0700 (PDT)
Message-ID: <c9cea1d2-a51f-4c38-8ae9-db868b86a928@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 16:38:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: purwa-iot-evk: Add camss node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
 <20260410-purwa_camss-v1-4-eedcf6d9d8ee@oss.qualcomm.com>
 <765e4740-cf13-4d4e-ab69-c1abe1c39d34@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <765e4740-cf13-4d4e-ab69-c1abe1c39d34@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QRDDosa4f8q0nGaVCOJGOJ-QEKj66fjg
X-Proofpoint-GUID: QRDDosa4f8q0nGaVCOJGOJ-QEKj66fjg
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d8b709 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HSoUWuXAm51uA-1-LAMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA3OSBTYWx0ZWRfX9NhluDXaYJsr
 w9jXn+sV3qig9HrTbab+acXqv+qtwjZEeZd9YFC1lxwASo/WiyS4VoiOnqtYJ3djMsFKBpkPcG3
 DRz/6q7/bAH+EKOlghYK10CuFlEB4wYOjUaTiwgRidCla7irIM4nXU0Apdr42CYK6W8M4ibHnqB
 AClmvj79CK+WIY7dndzELYkze1Zmc4Byl0+6H9BItxl42MwU6wuMeV5Lt4l1udTPT7wCetUssfm
 meG9n50ViQEIWnAQjZ0X2RJoj+jVcbwgZvh8RqPyTGRbXtzcTD9FNeKJfWXUY8ypxxgmiVwCRwj
 23749gNjBseprVX8dbTyHKejWX6OZR8+WSQucROw7UD20ev+MSdABh4TlumSVcxAR3fzTw2LLMW
 /ylfWUgReT5KGeUDZQSVINZL4dWb6OEhrd2MID8mkgOBHBlQqWmqpZG1H3QsApjBriFsEhY28QT
 pvxlkREpKpf3XLJtUig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102613-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5AC2D3D432D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On 4/10/2026 4:16 PM, Bryan O'Donoghue wrote:
> On 10/04/2026 05:25, Wenmeng Liu wrote:
>> nable camss node for purwa iot evk board camss tpg support.
>>
>> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/ 
>> boot/dts/qcom/purwa-iot-evk.dts
>> index 
>> ad503beec1d3d8c671d3564942a74c484de762d0..eef03f1eb2a950c06294159be3f97169fb487265 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> @@ -734,6 +734,10 @@ retimer_ss2_con_sbu_out: endpoint {
>>       };
>>   };
>> +&camss {
>> +    status = "okay";
>> +};
> 
> Hmm.
> 
> I don't agree with this. Enabling the CAMSS node with just the TPG is of 
> very low value to an end-user and doesn't "prove out" the CSIPHY, TPG 
> and RDI path - which is the minimum entry point in upstream right now.
> 
> I don't support less than a sensor at minimum.
> 
> You guys must have a sensor you've used with this board ?
>

Yes we have, but both not upstreamed sensor, we currently have no plans 
for sensor upstream, perhaps this work will be carried out later.

And ack comments on the previous patch.

Thanks,
Wenmeng


