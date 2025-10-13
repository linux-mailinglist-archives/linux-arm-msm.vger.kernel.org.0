Return-Path: <linux-arm-msm+bounces-76908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8652BBD11A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 03:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DFC2D3471D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 01:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAF426B742;
	Mon, 13 Oct 2025 01:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oeZsKP7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D142566
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760319323; cv=none; b=aeoiyG1LiM8YD6BltRD/WsfuBNtWHtqGJ3d318rpcA80f0xYnV3mOXnRmovP7Bdi3WpWtMYmtvqXdwUDTVU+ZH+e7S7UMN/Rzp2jVEcifjpDgHh5WWrhmxL5MMSwr2tRg9GaKzXQkZYaPK0YTGqtH4tMtNnJn2+W1+PgxSQqIok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760319323; c=relaxed/simple;
	bh=TLIifmYXZsoUZDQIMzAr9TVJTrPPzSLPCVver0Z+1XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNBukKm2MsY945qcw3USsNB4u3D2Ux58Ry9APBgFLUDBMG8oCfAKCZVmzv0G9P3tXu9NNGA3Qfj8NmL0t165RzldLxECkocBa5bB+89DQr2C2STuQXGcCKRDzL5/3rCEb+DBWfC9goQAHn9l7HPJeTb7X9OMtcYSIkcURpFwfhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oeZsKP7a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CNAjiJ025625
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvRZtGa1EAqu/s2cU1tyWSgB4EnX39XSZObMDz+e5Ig=; b=oeZsKP7aV7qBxP6N
	7BXiJMdcvYgsw5degXI71w8R1X2FFb/0EDYMkCjMXjUNwxhgQH0/Q8tcxBmjJc2n
	BDyiXpmtHZucJpK+ysWtMN9q1PRWseYCuwyYBj9ZfXWpmz9a8vb5B4OwQpqw6JrV
	YbLYQAE/UNvfw/9h5S5s9rimPRBaJMO3p51X6hXmYyFEeiL3xw1IHwpQ1Cv0TxSQ
	RRdlKaIRA1AIcz5lzvZHXZY63YmaLZnpan0NG7QNjC6Skuuwjq6lNMFTrEnFeZ18
	RfXvAaQEuj8u9T23Qtew2FaKEAyfksNmviKFjqrCyYbh26qJX8gatk+YlnU1aNMp
	jM9fBQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bttr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:35:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-780f9cc532bso6078999b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 18:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760319315; x=1760924115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvRZtGa1EAqu/s2cU1tyWSgB4EnX39XSZObMDz+e5Ig=;
        b=Md623+kJld6X4vQJ7eqQtC6MwyBmfoZKkw7qcGgprQfVAVVYdIHW41XjW3jflVwMXH
         tuqjYGxwjTYhXWNft4HIiRe+eK5igrVtLFl3oIXfVTTXK8Q4zh/+E3pzlBRkQ2DMR2/k
         1giIZZjEeQug0wPMQUFimxyGDbNTvebVRv9hIAJdvtM9N9/evjCVrgbiiKo2ul67a/0f
         patVdm/6VEi8xefiBcg0l8H7gR0ccBqzovQFzDgIP8UGne6VWtEpPgBn9u2H5JwQHYRE
         Qef2+X/40p1XHCjehdW7xUGJXe2RZAXKttmtimmxFjyrGR5KOoiIN7sv0+95eJfuJsb1
         zZNQ==
X-Gm-Message-State: AOJu0YyzB3ku4XLpcfLcyU/HFiDctBzE5k6xo4dSScUJZf4ycyd0mhFs
	FhltYRnCf7A/vP2X6sa8W9BRuvCH0pAJl+DuKtDctKuV7N+Z4pTCchUteU4LtHS/a3hIGxoLpbC
	jIqZRSHRn8gvF7JDaz/pZqH6wK2SSW6ifd/oDOmw5dEGS5lOySIsCLdbnW2BOPTpgM9lt
X-Gm-Gg: ASbGncvjHd3rc+1E8u+d1Fb+BvJOsYG1WZTFKgfhmvVXTc3pJ9ZkXF6wi9eP2wnqUTt
	6XyP3vdlt4d2n3F3rA9ziuAErwwof/Dq90fRoaNx7bkNmNLSk1DKeaFdXJXwzMPQwOkelACYKhV
	nMU8ijqlIecJBwVoqGGM8PzTfxmxIIQLsG2xxTdKb4wVgga/y5zun7v77B3OUfPRXtsZoq9nUwz
	Qy8Y4NGL6eF114paXrdTehq7FrwWuI6h1Hv592o+IbqbU85w4ctT2flYT1gc22iOZ0ftW3R+b7T
	W/A0xySnMLBRSvAXln0b6j0oCydO79flWjcD/B7qCuA5I+fXqekVijLW270oYDHTMYuR7UzB0xM
	Y
X-Received: by 2002:a05:6a00:3998:b0:770:4753:b984 with SMTP id d2e1a72fcca58-793998483b7mr24733203b3a.16.1760319315177;
        Sun, 12 Oct 2025 18:35:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH9hfoH8Q4uLbRfuw74qI/5V0wKxXaXaZlksargHLpNt/wRLK8+zJYUZKvoOuGl9lpjVTwsA==
X-Received: by 2002:a05:6a00:3998:b0:770:4753:b984 with SMTP id d2e1a72fcca58-793998483b7mr24733171b3a.16.1760319314749;
        Sun, 12 Oct 2025 18:35:14 -0700 (PDT)
Received: from [192.168.1.3] ([122.164.228.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9932edsm9522670b3a.73.2025.10.12.18.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Oct 2025 18:35:14 -0700 (PDT)
Message-ID: <f1b5caae-8544-4027-9669-7c92a33f7c61@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 07:05:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Fix bindings for
 X1E80100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20251013011357.732151-1-krishna.kurapati@oss.qualcomm.com>
 <b9befe47-b0c8-4536-83c0-311dd16f2e83@kernel.org>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <b9befe47-b0c8-4536-83c0-311dd16f2e83@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IFqbMFdvgEy4iD1edjc_Cc5VOkeTo7Li
X-Proofpoint-ORIG-GUID: IFqbMFdvgEy4iD1edjc_Cc5VOkeTo7Li
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ec5759 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=8YinarrYfdS0Dhyguhy4yQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=snNKEbK5PTu-mnxKcGYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX0POyIo3miKJE
 7yOl0JDGxKYnirGSPI2nf/3RBV/HQH4/DBeRobJ+G/jie9n/J/cK+bIG2DomuZth8GimiynmMgV
 AS2+GTUqmO1R2oEozequtbC9j4kZs5AJ5X05RBQrSG6jnPHztyHaQEJy0dWpR7AatI+mZc+ieyv
 j0Lt2d4um9UZFvkA2+lhljC0VGcACbGxYN5Vww3lfOjyf5cwJseFyVi0yLZgCBHTaiXgwwzRiOr
 r6Lb3N6Iem1YFseU27478hhC07YLCzwqzo/EgxrZdUYjJ7I6BBqUi3wQh0dpuAeIZoaohPgS+So
 /W3iQ3nuXcCywJtq+R/rqHJeIxEsQKEuTHJhlMBUjKgEneX3e3Up8uksi7lliJIwKlaMhRxkmco
 fraci6DHOGn/J6YKpZeh5e0enBJmhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022



On 10/13/2025 6:49 AM, Krzysztof Kozlowski wrote:
> On 13/10/2025 03:13, Krishna Kurapati wrote:
>> Add the missing multiport controller binding to target list.
>>
>> Fix minItems for interrupt-names to avoid the following error on High
>> Speed controller:
>>
>> usb@a200000: interrupt-names: ['dwc_usb3', 'pwr_event',
>> 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
> 
> Don't wrap error messages.
> 
>>
> 
> Missing Fixes tag.
> 
> 

Thanks for the review Krzysztof. Will update and send v2.

Regards,
Krishna,

