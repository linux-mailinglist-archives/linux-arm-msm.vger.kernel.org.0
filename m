Return-Path: <linux-arm-msm+bounces-82095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C57AC641F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3683F4EC2BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7388831B800;
	Mon, 17 Nov 2025 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYPf9e42";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O31QMZCu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739952D0C60
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383074; cv=none; b=iEgbWqIW2wgDdb/Phy5BVZs8CTM/tDRWBWe06y/imTYyPjtmC0KLAylNn/HrvRzru43BEdoxVpFCugK8H+lNSccKl7InzJoHXIw7VYMfBAYif4Vhz6L+a9G+peFvuSvsR2zAc1C5DBFI/aMl7WddxgmeBYw2mYhtiDMVXMowgWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383074; c=relaxed/simple;
	bh=/5ah1QK2cJKdVp1XH2QjKgHNWqaUxV893AhuHah12E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9K8MPfPV52Qf1rjxTbYMGfilEM7EFwEN1cmZB59qkGzGJMV6giLg7vnXC8qMrf8eA3maHFibGlUrFEuV+lq4yQWQ6mUDe046koblptLAM49265MOir9BI+oQHEPvHtlDnFklUPL4Bi+fMEeREBFtRRdYJ91Odsj2MsOlIl1viU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYPf9e42; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O31QMZCu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHBvqGU3040301
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJWzE6wvjXG1AV+aIp3wOyeFKxb3rhX/85KvL6y03Cc=; b=CYPf9e42rZzlJawP
	Qp3kqvy3qfQCc+Y52D4WM/zhh09glkeF391ACL2AWapNefwrEKk7UoMK+kJoMbbH
	0LvIIzRmE/gRC7zjE6MaZXehjtZoGiHfMcsUR0glCU+a5P4KnaDgl8yCqpKrxgSG
	TnVr//U6O9hqW1UDSci5nuEjSUrwDkuCNm3/UQZB5UUUGOFt5QN2RjqbYnka90SB
	qh9XDSGra90dJgFwkqwfaoHwPgJY8eKYrg6/vIsxrAiQh2q/XegShtb5qvLngh8k
	b/pk47dF2H0Wc3Y6fv7ssio96UPIw5bt8zEPPhhDBlE1846Q7bYSyj+mdRbH9zae
	vPKI/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh04qdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:37:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed9122dce9so4517891cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763383071; x=1763987871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJWzE6wvjXG1AV+aIp3wOyeFKxb3rhX/85KvL6y03Cc=;
        b=O31QMZCuc3MTmsapB7esqEdGdvzIy1g/2o3g/q71MfdxWkKku4apWX3lwNT0S19mQO
         aOMeynaFwt7l9WigPN1RDeQcml9+uYCJNSSSyG9Z+vEpu959alkC17za+M5ptHLFJ+Tj
         8Oq5voXxCAMbh7kX0CDqsmsZ5Pu772qZrrV4bFg2926pDmhq9SMIz2oJvu6kdC8ZWoWL
         nqsAwlDwAo7KYP0d6XNuj34thiqYEt93R/5z1qne96s7p0LIo/e/nMhT4XcIiyQjO2vQ
         R5PP3ourCqPZM86Fw8mZOSenGgPg9quUcIW+lBJ+Kkw8HPE9G8GO3VY6yahUwrz/qlvI
         OmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383071; x=1763987871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJWzE6wvjXG1AV+aIp3wOyeFKxb3rhX/85KvL6y03Cc=;
        b=aTmwh3qEADVi3hYWecVvHF/EtaxDeMDeOcTOYhMds81DC/vWiv2XNOzgW0/Qth/WsU
         WEQF1RyoksXR2cXUCOXotc+yNCQfq4wZpmDORwna6Od+dYY8Z4pfsCBJCXWSps7Y2YI5
         c+sf6Xw00QrMsVKc+zUZ5PTQJHdih1/8Zw5VrMR35vk5Q1WNnjc72jM0xgJ/lx+95mu4
         qoI88P5vmMLFFlK6pp0N7RzmuFFkE4A3w8t1uISvU/3FG6gacYp+lah0m/8lDQy/2LrC
         OJyQK2tl+enBetj5eOyh+WRb9P1Z6kn6LdhxcZm7cCfPTtp7rG5hD6gEyr+Dz4KNLFfW
         3vsg==
X-Forwarded-Encrypted: i=1; AJvYcCXcjcrrSFz/P6v1iEVcr+26C9+9w6izRDRAJDx+eR3ZcgVv5deeB9ka5d0gGpd2JqRCETrTUt3ODl8dNFv9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2a/AN3EXzX8HXRF6vPWZwDEdLij/CqoleeflX7zP8FLOv/fD9
	RRZdVzEAVAIce4v4TNo1g0VhjugalcweN00L+kS37Nsbf8Mf7g9aD+OVU782oFU8kNyQwfKO91/
	CBeeYNIJX3RUXG7aGNrRJAguciP7tW6NIL8SxvvFSXOP2GZYTxChPc9t8yKvBxFGaYdSu
X-Gm-Gg: ASbGncv4zccTQd9jui829Wf+c+7+gX9vO3WaELvHeeMF27l06xJXh1rCY/7kkDUICLK
	1ucx9SI6O7I5y3Z1mdAGlzsfz1Gh+f7wykKKNR+sZHFK+F26JV7ZJ++7HPge/fH1SsiCkxYnKOS
	ExwqUUWUITf7s21b974HgsNlplyDjCUNUejvSY2oFtV+uUJM+xxkH3tecUYslBNEPcS42njJwne
	y8TMAzMYNtQaRbtX+7HUa+k//ZUUl0LUnUZ0Z6R1PICyLLu1tFfzb8RSeiOnRvK8hMUjIO3hvjJ
	adjKBTYYjPMqJgdIOT4FaZu/NWEYYBq5pikrlJLL/NasctNWYpUL+SpejFPHLqH8phfQkDGci5+
	EVjh6TgFNYi8UIBaLPehZAzFVyGnB4CNAPG2Q4CcHgztuVA6kYL65GvdX
X-Received: by 2002:ac8:58d1:0:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee1f0cc6acmr31605231cf.0.1763383070650;
        Mon, 17 Nov 2025 04:37:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwighRspdkvDuEfxmwg2BdMrC4mdWFT0VtYsAmtd8r1HDT/ZXvRXlEbF7IXcyxlyFAchnefQ==
X-Received: by 2002:ac8:58d1:0:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee1f0cc6acmr31604651cf.0.1763383069999;
        Mon, 17 Nov 2025 04:37:49 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa80cb6sm1076756166b.7.2025.11.17.04.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:37:48 -0800 (PST)
Message-ID: <4b73f64a-1e28-4f25-80d2-3d59575b9da2@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:37:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
        Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
 <20251114064541.446276-4-quic_vikramsa@quicinc.com>
 <a5ae933d-c5d1-4094-b4a1-de52060e0786@oss.qualcomm.com>
 <22350774-20da-42ff-a6c2-02fab121f4b5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <22350774-20da-42ff-a6c2-02fab121f4b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=691b171f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7e9gifwXs9hXINWudeUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: hJLuN3KRmey7iMDJbl6CJ1HydkbrvqLT
X-Proofpoint-ORIG-GUID: hJLuN3KRmey7iMDJbl6CJ1HydkbrvqLT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwNyBTYWx0ZWRfXw6AwO4xmV8/U
 SelMcmafltZ9sH788oxQ6n/6uSGDOD6Zb7833MCC9W52wC7HaLGFz8fMSm+p/yXxpwwlhlKLUsQ
 +4SQuDbbTkiTafXix/97+xQMdIq4MqqggWo8HBx0WJNTwpYwVS4ZCFRC5wRH6BlFcOTQWNpP89W
 RzO6HDHZxE0jrv1Op43GuCyBNlw7sE8yOMw+P+9XtK1BPq6gT6CldetytVXAU35vwkLQhml+oDX
 uZ0MQ1GydEyi1L65j8zwMr5ByxZb8w85qxSQlFVWZ33JcGqXF+K4kWnKBaCrdbodBkHnVTh0gOz
 DkQZeQWAMGGq8CuXGazTR2vRGuyz7zygifzzmoDkwRgoRGb7SLp0kmokSliKidIzbuU4z9Qc5+e
 v4dbjOwNhb2rRpgB2GaDeytU4dW1QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170107

On 11/15/25 6:53 AM, Nihal Kumar Gupta wrote:
> 
> 
> On 15-11-2025 03:49, Konrad Dybcio wrote:
>>> +&{/} {
>>> +	vreg_cam1_2p8: vreg-cam1-2p8 {
>> Where does this regulator lie physically? Is its presence dependent
>> on the connection of the sensor, is it part of the EVK carrier board,
>> or perhaps something else?
> vreg_cam1_2p8 is a fixed 2.8 V regulator located on the EVK carrier board. 
> It supplies the camera sensor’s AVDD rail and is enabled via GPIO 74, which is controlled by the TLMM block. 

Please keep this definition in the EVK board then. It would let one
reuse it for another consumer

> 
>>
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "vreg_cam1_2p8";
>>> +		startup-delay-us = <10000>;
>>> +		enable-active-high;
>>> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
>> property-n
>> property-names
>>
>> please
>>
> ACK
> 
>> [...]
>>
>>> +&tlmm {
>>> +	/*
>>> +	 * gpio67, gpio68, gpio69 provide MCLK0, MCLK1, MCLK2 for
>>> +	 * CAM0, CAM1 and CAM2 respectively via the "cam_mclk" function.
>>> +	 * So, here it's MCLK1 pin for instance.
>>> +	 */
>> I don't really see the value in these comments..
>>
>> Vladimir requested you to move the 'description' (meaning the node
>> describing the hardware, not a comment explaining the function of the
>> DT hunk in natural language) to monaco.dtsi too
> I’ve added descriptions to indicate which pins enable which camera MCLK/Regulators. If these aren’t considered useful, I can remove them.

Please do

> Should I need to add hardware descriptions for all GPIOs (gpio67–69 for MCLK and gpio73–75 for regulator enable), even if they are unused?

You're going to need them when you add support for other sensors, so I see
no reason why you'd not want to do it right away

> I have referenced qcs6490-rb3gen2-vision-mezzanine.dtso for the MCLK pin hardware description (cam1_default).
> All TLMM GPIOs mentioned above are muxed pins. As Bryan suggested in v4, these should go into the mezzanine-specific dtso. Do I need to extend this in monaco.dtsi as well?

These mux settings apply to any and all users of the mclk function, there
is nothing specific to this single mezzanine about it

Konrad

