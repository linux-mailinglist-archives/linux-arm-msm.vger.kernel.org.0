Return-Path: <linux-arm-msm+bounces-89617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA510D3A61E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A433307B42A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B966D3590DB;
	Mon, 19 Jan 2026 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBIm9wop";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAa9Sf4g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5000E3590CC
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820617; cv=none; b=pLMFpSdLmvmgEzKIZz/+dc2WTP16r1CDsHnUphg3HKtQ4LfVXBCwRdKfbsW02rHVLLMvBQ425n6jb64v8wLvDSKeNGzokBUUNbSlwK4+mtm48zgTdezlNTtPKiKUiK5vCzoi+PSHztlsZnYwyRUmUkwma7uaaRAyx6XDpTl3BtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820617; c=relaxed/simple;
	bh=61z7HloXRVVNareKqRQu/iQvZVMMOYnC+9spZ9btQkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dm9Nd+7+M/9pc7UlYzmFdRJDbxYQVTmSBhnujjjTvcZNScV/6cl8k81q70FEMfn2s4uwHhZeoRphDfDyuF45q8V90xja2sHtJUyzs+XahzPQP4Oyqu6B7tH5wwVyDrjjZIeE58frqMapVC5MIm1rokzrqcyxVwMmEcbGHf1U3Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBIm9wop; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAa9Sf4g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91HAc1561982
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	et6edJh9zuI1BaWn68FuCu3UWa6q0YUiShjlHyYlGw0=; b=HBIm9wopkKtx3Ldr
	WTEcqy8WTaKP+g4QG8GCdPB19xCI/KBf/Ej/EEqrwpC07PhIf+AwduDxaJ/p5yiC
	aVjC/aYVWgScCfz9hle8PNnRyrT99MLMRTHzk5/pkEr+HD2R8W/vt7HhjqoyQFF7
	R9BZmLFrKC+hPj01Hyf3STBA8g7L3Su2TX764UU1FJBQVDb1cN8el78WzFOtwLOu
	PQhydG8B1iiVKuJ6+7g5YPTQTqYTKCiGNCmBOKJRljon54cT9PDhiDDsHojtlSYJ
	X9+d9xLf6S8jjMtM7KemcPBBPQWtLzkytFWdKHIArz+5AZHq3agqmUzzLR5F27KV
	4wsaDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36dctcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:03:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52c921886so543061085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 03:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768820614; x=1769425414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=et6edJh9zuI1BaWn68FuCu3UWa6q0YUiShjlHyYlGw0=;
        b=gAa9Sf4gtZzpa03ZM2/uZtCkdB8s6Xyd6EJE6INqfEuIgma9DPG24uJ08hg9MpzKyv
         SwfbhzLwEoT7FDYjO1J/TW55NGf1+Sbp4AaqTpxu+SdJwfURJr6isbcAU6d3G6Rq3Z4B
         P1D9XhmesZu7ThF/5GHY4GhH6M0cLf+tQr8rO6u+kEd87ftE2BWa6+cNIAS5sAQG0YwO
         jgRCobzCWVNGgjz/cXi8vIcDTbbiQ2cJyFvLNG6KJm5ImD9FEp3s+9ehI1QCmkon6owP
         0qB99rnuBjwdL6IolF9Xim0Svvsqz1iFv3eZBVOhaN3II18oArPUxBjAzk+fc/pl4Cpu
         0w0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768820614; x=1769425414;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=et6edJh9zuI1BaWn68FuCu3UWa6q0YUiShjlHyYlGw0=;
        b=eDr4YZpfLr676TwGI45ORj4TuqKuqpK4wEqQWNzRoyKyEiUFgzk3QuSQ9Cfk+o1IMe
         qhEQFvJs+TFjoTcGSaJi/vKculLiQ7TDfzVuiiZ11vrRWcHEe20QKSJqaXmKjFoYLYkG
         UGj4nNZef/XIDDL23aTXscAhJdZa4ZWte/+R0swJV2rHSOOWPjaUmp/CwaCwi2S1STEv
         Zmjnm6j1hqEfVZE4lYYOAoyqo7yvZxKi1x/4wgamhJ5pQNO9xYxSXQ2ZtsCf8m8mLCD1
         aoTWjusqDkfeKsnrFTJD+nfoWrTNUMKSevJkfsux7GG6VhBtQUbVz25gX6SrnCpfz91r
         +Btg==
X-Forwarded-Encrypted: i=1; AJvYcCUG6L9c93u02EqMLM6ld5qKRKTpDDm2q86kfRMJSgdbkVIXtkpPFWxGFVrWwTX5XEj3C5ziMUxAgZIBjcQq@vger.kernel.org
X-Gm-Message-State: AOJu0YyOLeIYsCrP7F5Cdmo0LRCfNI0iWRvrk+QgNUikZWWM0wXCrMvs
	RwlyohtRj35aUOfU/FMSWhirtjaNgZMJbH7xPnl24tRZ813Ljgf19ForgM84HaS3RuID0I7B0mR
	zR8Gc1Y4nSKTn/hct62ZLr/MCkFaTMIbFhwAoLBRSDgNGXl2LBTmPwio6OBCJlSgePZ5a
X-Gm-Gg: AY/fxX4l/TjoWdoKM++y8TI2dHxi1eoDp9W1o7QM63iYnJdeAB+6OevritH/Bea+cL8
	9gqjPgUWvcEW57SwcPXGcTuu6sm3IWEYPRCiYXJDr8ZcgqaNtm6fCopVAT81NJwvONB2koNMVJZ
	d9qVOYIS/mRaubmw4Ok6lhTeq0R+sP+Upz88HbO9tl4ydCTyLQ2ah9fWVjpiM6f4sb3rSR8lJ/v
	BCMkXs29CUacqrQuntqeMQe4C+aWIpq8iSX9t6yRi541qaUx4pxSkaaFRDifOSYGOVU9BpcDy+t
	vKEfkYcDSmPz4d4FeQS6wSsdbg7D/q43C7R0b9fSkmss4DbzSEqZX5Vvn/aRZ6GlosqF1xaXoCR
	FSOgzjfixuevHWRxb76AKamGJasRB6huhJOsRhQ==
X-Received: by 2002:a05:620a:1a95:b0:8b2:f9ac:a885 with SMTP id af79cd13be357-8c6a67bcf44mr1442351885a.71.1768820614321;
        Mon, 19 Jan 2026 03:03:34 -0800 (PST)
X-Received: by 2002:a05:620a:1a95:b0:8b2:f9ac:a885 with SMTP id af79cd13be357-8c6a67bcf44mr1442348385a.71.1768820613870;
        Mon, 19 Jan 2026 03:03:33 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992211dsm22504353f8f.7.2026.01.19.03.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 03:03:31 -0800 (PST)
Message-ID: <f41a692f-c3a4-4948-8179-4628542f90f6@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 12:03:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: qcom: Add SoC ID for CQ7790S
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260119095907.172080-4-krzysztof.kozlowski@oss.qualcomm.com>
 <e4761a54-a172-4dfa-9223-0013913bea08@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <e4761a54-a172-4dfa-9223-0013913bea08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5MSBTYWx0ZWRfX1zzt7jpdMCc5
 nfl+If7djWvdsT3wsfKvZw8bgKQb7eN/2blLlkUADmHzpqisqRuUqARohyNQrtBeh/vUjKfV2jW
 ICGSAdko1nIM7PI9NeZuMA1HXlhOlcxnYhuTveoJ/UGFLsPtrlHImmfSb4+GZ2PxME08JEmcile
 Wv5J3IzlMQ1slyFsYEkIM67NQzev7HHuWm1ck0NM6LCdJY3Uj2f6uHjyPge9uwLIG1YoFinXvyD
 /bGtJLNBDbCy6cPWTin0kOzCVH3qSKGhv3dR5RwmzVgVSopL1jFau5obT1fD2RFaYc+LlLpzV4+
 z7m3WOxZv7dyrvvdB7JzcG49bG87S4n7kv42IoY24dKNC2P++dNTIAGqbIq+5M2w1WGY2fcElHI
 X6UcY/+gO2TR666J71SzmZ+5gM6WIz1x4TTUULc3UWH3QWujn2xsugksL6C+xhHcBrFeZZ1dSQb
 GB6Z8gYBTXDEA1EBenA==
X-Proofpoint-GUID: TZWc_rBJ-jzRj6Yac-grHRE6IhHcgo5j
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696e0f87 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=eXfKIkvq2ioIsB1HJSAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: TZWc_rBJ-jzRj6Yac-grHRE6IhHcgo5j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190091

On 19/01/2026 11:50, Konrad Dybcio wrote:
> On 1/19/26 10:59 AM, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> This is early and first/initial posting for upstreaming Eliza SoC, e.g.
>> CQ7790S IoT variant. AFAIK, there is also CQ7790M variant with different
>> ID, but I do not have such hardware, thus only "S" goes here.
> 
> If you're sure about this marketing name being assigned to a specific
> SMEM ID, those *never* change after they're assigned, so it's fine if
> you just add it to the list

I don't know if I ever going to work on the M (modem) variant, so do you
want to document it just for completeness?

Best regards,
Krzysztof

