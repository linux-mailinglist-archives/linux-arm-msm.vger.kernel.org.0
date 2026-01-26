Return-Path: <linux-arm-msm+bounces-90576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKLENQJ/d2m9hgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 15:49:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BEB89B89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 15:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E2B1303D2F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B2227B358;
	Mon, 26 Jan 2026 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOuiefEh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePKKzfd+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBFC24BBF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438693; cv=none; b=HUW7l/D/91cxL9HfXZfAaSC2WcyHtbI6b08ne0ZELVLiDue5G+DY/qc/Tgc+NewHQAzBebui1aj7ytcVtPkZjbArpYfho5JzCdPvPu7xukfLvE0Oc5uuHl7R1HwOp/4bQqnlIppkTuD4gb4rJZPrk3C3wjEpXgNtXZCOY32BhBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438693; c=relaxed/simple;
	bh=GP7PmySZu/+TZ+vSZUM4nmTzVvZnKwy0kC00wxVH4BU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=baBdHtyUxqy7/DE4Z1M3Yk4zwMvgIarxXtl3KMtqP+a8ubQWYCy2lVLr9FidN6ZtV85CGp4wjFdxCZv1duIx3pFJI4I6s5ao7Hm2mNv1w7V9avzDc2C70JSjNaxRTlcGSwMuniAxKS52e5P0fB6h8y0g7o4DfrAe0CtZUk2qgEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOuiefEh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePKKzfd+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q9TN2V1307847
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 14:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ApTr57Y0vLLo1N1yQrHIjnvTHUoSt+xQRfNJVnUPykM=; b=DOuiefEhfL8uj7wz
	8Z3bwdWYhRF3YqHWN8XG9U6OeauL0vpZlTz8Im9pjNWxBCE7R/CGHa/vgOlmH6wb
	Qrpb4Ne8X50xPZggW52zpLvUpHfFvLUYl7KYfdAs+geRYyDgn88gfqcW7vR+MRut
	/Z2/QEKHNqZxb0LcMmdPfK0ZjcyFPOiJK9v1gKA/PECBzFf6HcCOAyeKKHkXUNMJ
	bUs0TAo5VN1vmkVlMkEM7V9cqR/0GAIGPWvZjMxvdJVAZBcHq1DRTnm5yBZNLRdu
	kaRZY//+AaxrBT/5xARL5m3rlxc8ZLK3bkFNHLE92eE5uX8ye26HS4zg3tFfMFQm
	r1nAkQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3hctet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 14:44:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f77be4f283so10506081cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 06:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769438691; x=1770043491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ApTr57Y0vLLo1N1yQrHIjnvTHUoSt+xQRfNJVnUPykM=;
        b=ePKKzfd+Tq9OsGTpY9svTSSbBc60HVGnklokQD7MDZxQv1O6TCLWMRbeURWCQgK2YI
         kzLAxI5dR0t5VyMTn8ygNOR4pa7IKkkm5e1FoXJCYOelOsDZw7dhZIkENEKuCaVLLyEY
         I4taV7XU7AQR3r4wZX5JNo+9pyDytFwMnptPs+5/Uzvln6+UuYDoLhzNzCAh4a5k2lR0
         uAfMDnpdlms7BdIGAUJ64Wy8mKj9AXWvIsUUs+7uZPqn+PIrJhdNfvlRWXnZychhSBeH
         nuCZ+7x/xhWt2Y7dWSZPpRBWYAHu6sBAcXUSN6phVe/5lJDFpBqWoOvS/KXRLZ0+SJId
         9dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769438691; x=1770043491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApTr57Y0vLLo1N1yQrHIjnvTHUoSt+xQRfNJVnUPykM=;
        b=ACb5cxmWjF+2cikYCaJfevCFUpIrY3z9VhH6FG/DUdeNqiOkly2yuH2zuGE6FC+rzd
         K8xNt+/phBu0nPCEMxZMPbKJafq64I7sfdqBvV+uAgrB0a5gJblleiM6YmcP/oTqi8+y
         DVX/0MKaCpw5WvLS2Hc/MGCt1wyfsBnkdiaRJFzr500uQ6GkxREWkCWhWl+hy8cJ4IVg
         7YD4oDjn6KAzUNCbSFVfqV+/6RI+8Yu1za90sjtuN8AJprFwD5sl3pjx4/K91FdeniO4
         PeDVZKdVnJ/eGw3axSh1xLsgZQ+hJgYjps6czWg7c4JGjWqYuag8dCj6P630M9wrE1mu
         By1w==
X-Forwarded-Encrypted: i=1; AJvYcCW5+M6+JMpi3Lm243pNUcsRFHc2m/q6PJsRFh9WV4vnFMLLK/PirEatKENygpEpH7sHtWHuQtDl+FDn4tcR@vger.kernel.org
X-Gm-Message-State: AOJu0YyPyM4VbxiDRM8UvUp278oPtVpTVB3fi8QVL7ueeKcpNS+WMW8t
	q/MwDiLTWCch4ldSjZcVXcv+ArzPaMZyM1v+LIGTghRrnkviXGyNqCq7+JGyyiQrZ+1ENLL2Sch
	zMNwSXkzXGz2VEJxwJYBljiPUCtvuvj+z6fDDF/stuQFu6ssVLE+0SmMUJTOlWT2KOD38
X-Gm-Gg: AZuq6aK52J440zkpT0i+4JfdBmUqBda9/iPo90LpghpyeK10eQFI20vxzsKCp7scrrT
	TaOPPKHte+O8mH9y1lh+2vEgHp8rE9IBdYmlSgfTPoE7mQCJsOw8BivDILmKSAa/nbbtuhEZowG
	RCpBoDK7HZIPx9tizAEOrESTigP2j2ZU5R1kU/X903nZ37Ri3LaVOuzQx+u1TwsfXuVInZONhKE
	Uka1IBYDwpLWnGaaFA9dcoyVVPweIDSzuTIraZy58TUPCZQRuXH3Lt4qTzDD9bzCyV0APv9iaoV
	FRCRNTT6UwprOD7dIMDdrLxSh3X1+iZuYwHIu2mlY7buZlTO1opDTt9Yg/uakLuMAhes35Y4SjD
	GsTxhy/3erjHrOpyCH2OeaaQzpXsF81ZlllufV3seWqvFnfrmTMDNTUp5UoS95TetQZw=
X-Received: by 2002:ac8:5814:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-50314b66890mr46542611cf.2.1769438690112;
        Mon, 26 Jan 2026 06:44:50 -0800 (PST)
X-Received: by 2002:ac8:5814:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-50314b66890mr46542211cf.2.1769438689603;
        Mon, 26 Jan 2026 06:44:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b948670sm5141354a12.25.2026.01.26.06.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 06:44:48 -0800 (PST)
Message-ID: <cb08a156-d905-419f-88f1-77bd136c823f@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:44:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
 <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
 <wh4qsgwl6drye2d227mv22pxz57cikp6ogabklo6fvlzljqafp@sgps7d52yp2d>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <wh4qsgwl6drye2d227mv22pxz57cikp6ogabklo6fvlzljqafp@sgps7d52yp2d>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEyNiBTYWx0ZWRfX0fdMNM/JuvUF
 PaCqkbPhqENTHKeFWaH8xagG7IvdkQOS/6B5xtmIU1wQgoUYD/enUkxFq7M/GDXBOGqM4R7iWX1
 ExyYcTfnAIwL0ospOHd5nGEQcDwzy3sO5o7P1oQPtVProSasmViRSEq8jH9rJQKiF6YjZ9NZKDB
 ea4LWQ8DxGQh0TVvlB/TayZ24+az5iChoN6+SscnvxIrzokd26qETcr+O7DLtxxj7idon9wRY0s
 N69yH0h9gKBqQgN5kS5H/ZQIdKjUwqscLfS8kwzj1UJhhlI9zGpOLp8xJH/zYvuyYyHnPKYUULo
 vk3+T3LFxgPq/+saBE5rHlLc5dWNlDckHOORr3lz1uJGb3gpQvMnjYmlf9JqJQM/wNmJ5xpr34m
 R6GiStFG8EQncFFd8lomgScsJ/tORACBlTY93K1tci7lm7NSp7RxV1FxU57WDKkExWHZVs6Zloq
 o0YUiINhZUV69VbiTEQ==
X-Proofpoint-ORIG-GUID: _5g-ia8C4DHwKjnms3Yz6bjtL5Q5We-F
X-Proofpoint-GUID: _5g-ia8C4DHwKjnms3Yz6bjtL5Q5We-F
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=69777de3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qn_fkN7zqQ4dxzFuYcEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90576-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fa2000:email,fa1000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fd3000:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48BEB89B89
X-Rspamd-Action: no action

On 1/26/26 3:31 PM, Abel Vesa wrote:
> On 26-01-13 14:13:32, Konrad Dybcio wrote:
>> On 1/13/26 1:33 PM, Abel Vesa wrote:
>>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>
>>> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
>>> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
>>> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
>>> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
>>>
>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>>  
>>> +		usb_mp_hsphy0: phy@fa1000 {
>>> +			compatible = "qcom,glymur-m31-eusb2-phy",
>>> +				     "qcom,sm8750-m31-eusb2-phy";
>>> +
>>> +			reg = <0 0x00fa1000 0 0x29c>;
>>> +			#phy-cells = <0>;
>>> +
>>> +			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
>>> +			clock-names = "ref";
>>> +
>>> +			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
>>> +
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		usb_mp_hsphy1: phy@fa2000  {
>>> +			compatible = "qcom,glymur-m31-eusb2-phy",
>>> +				     "qcom,sm8750-m31-eusb2-phy";
>>> +
>>> +			reg = <0 0x00fa2000 0 0x29c>;
>>> +			#phy-cells = <0>;
>>> +
>>> +			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
>>> +			clock-names = "ref";
>>> +
>>> +			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
>>> +
>>> +			status = "disabled";
>>> +		};
>>
>>
>> [...]
>>
>>> +		usb1_ss0_hsphy: phy@fd3000 {
>>
>> Let's not repeat the mess introduced in hamoa..
>>
>> Perhaps let's fall back to usb_0 etc.?
> 
> Sure. So then:
> 
> USB SS[0-2]              -> usb_[0-2]
> USB MP                   -> usb_mp
> USB 2.0 (USB20S in docs) -> ?

usb_hs

Konrad

