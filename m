Return-Path: <linux-arm-msm+bounces-79198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E3AC15303
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 055FA4E02D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 14:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6313533031F;
	Tue, 28 Oct 2025 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEZ6x4AC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ECD32A3E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761662257; cv=none; b=VpArpyBKl3dnz69J/+SmxVq/UA5SWBYHDrsp3eglop2Yvt1UGdtcI5efYqi1rUzkrUYPH1RqkPTEhN8V+PW0NGDra/n+bgiWNh96FCjuoycgAygC7y13QgHxQI+afWLnY929m3xbK3YdMO1PX3P/MGytjuM/OCwfKqc13H7k8WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761662257; c=relaxed/simple;
	bh=RlL+HspI/qKibOJ3Hm/qcxkCvXtTeg2FxvrSbq8tYKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5UfBqUehOKMlaCjAAsP7luQ5C3YGbWQTJi0/LCvtQQjgl4YZtkbrhNu8oRrzzoXDuelO+pgV1AvS26ugzCovrjCPqeMtIH1jNIVWuqQhWtp0fbKjpzmgi/VZr87AxByCEz9ARal6TuAwGSA6qZJQMEslbIXtmPyCirfnNEjVXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iEZ6x4AC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SB2ZH1573590
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/rG46MMpKrRauqQ4haAq1ic3vjVmepSj7Kf1llU8TV0=; b=iEZ6x4ACCNTX+Qkj
	LerpyqWm+QvfYlmVDBKgpnJDIAN9SAAPvC6nnlidxd4A/LXOz9oamk7c9WDnMz53
	pMrkrmCbGR7BMvqM3IwGzBnuhdH45LbhRKbcxnjSngBeyiYvPp9NjfMooASqatrY
	67JQx4dRHhPjclbvNIf8D6irwmMy+XWF0uQqq9KrmjTKqXn4V4ZaEjgUHly8W/5m
	C+6a+Kd+OPrpYvvk1iOEs+XhH1S34j4R+ziwFdzl1Lgd8W8Q6hdW0Mzj0zAacRO4
	/7uOvxwOwqDshWAUdJuJUFUGMMj3yEzjTOifVthdunqgzhMuvEWAJSJXD8c63PU0
	bnPi0A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pge9rns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:37:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27c62320f16so60179445ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 07:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761662254; x=1762267054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rG46MMpKrRauqQ4haAq1ic3vjVmepSj7Kf1llU8TV0=;
        b=itZ9ub+ANnfS6GxPoDlnEIXsqJyEvqrElScXUGHEcKhHceQI3ytu7hEgfdw+k7275x
         SFRz3XEfDBNkUjITT7RhaCjf6XNEaL0TOnp251AqIavk5A3pDxiFMoCKE4mUa1L0YK8O
         GyabAHhAPv1TRcY5kRgYEHqRiLHqKibQAGnbFlM0nrkCv2UF3jBNfDPQiChFsjnWKFG7
         dgvluMnwRgNYM+CRCIumDnjWd7FmC9E68U2wGj1nCdsLrZglGRpZiEd6nYedVw/nfDiy
         qUtw2X4rcpUkwQgj28jmUOuUUqJ2MPhBeu1eMBEpttD3Jekkv1frvf97miEyITl21ua5
         9fyw==
X-Forwarded-Encrypted: i=1; AJvYcCXR5/HK8Phcal/uaDd4l577cnFXPeo9m76/4Rx7pWHH1cHiDW6HzDqijGYMUZ37OwtIjqOO1KJrmjHkh5JN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9DtuaZavKYmI0YLVQRNAy3ZbAMwE9Qr806HmKMjmdPivoJtMw
	AQYrQ/qX1XHzvReqq2nPh6TsxLRyFTCAeeI7uqlCCoBAGCjY2jb5U0I98b3T7SOhzJKV3eSXYhD
	ZfNahE2EbnEgrU4F5W/uoiy5vwX0q0j41Lg4K6+N96RznI3h/izIVQKnNA5DzZPIU5OcS
X-Gm-Gg: ASbGncuLFDibhZZNmyF1YwhEqiTOSfr3b6OKlOJQOlKf9SdBd3cbQ1iQSOt+dOvsdnX
	TABrjzpa76CDFcxYCGH2reKiItcsroXRVLPetr09+DVNJfMBWeNz33IjsrS7K5Jy1CmuzLautUl
	dKSubI3m08wpv6n8LJwerBkaVK6GaaSKZqC4H7NDQ53VUlW4VLiTIBW+lmzg9P//oIJgwWWOimx
	5WcUP33lG0inchWJ53gRO+vTyC6SKsdMCkIJry3xAOs1//S51TbPcHGANlvppWZ7h01oXuFB926
	sfMGCg+5nv3hzq0yhSvMYRUC1/Pccb5GMNn9QvY68vS13cYsQSBU9Nkd7EpiRdvPH73idRNNX5i
	8uySkfLpvXUVtvvxQpyEZWnTnsk3NoQ==
X-Received: by 2002:a17:902:cec8:b0:269:aba0:f0a7 with SMTP id d9443c01a7336-294cb37b846mr42602945ad.2.1761662254233;
        Tue, 28 Oct 2025 07:37:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNEIHDBFZq7QwFF8HDQMJV1KmXTeW/+0baTbAylgg4BeWPJ1O+kRI2qc8L1PgzmAvM7ihU7w==
X-Received: by 2002:a17:902:cec8:b0:269:aba0:f0a7 with SMTP id d9443c01a7336-294cb37b846mr42602425ad.2.1761662253506;
        Tue, 28 Oct 2025 07:37:33 -0700 (PDT)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42f34sm117630335ad.106.2025.10.28.07.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 07:37:33 -0700 (PDT)
Message-ID: <3524e5c8-3848-4554-91cb-f2e034378013@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 07:37:30 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: qcom: camss: Add Kaanapali support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
 <22f63af8-281d-4783-b770-36cb1feb4732@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <22f63af8-281d-4783-b770-36cb1feb4732@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uoR779PzPycw29G4P6um9GJObQnBtHFZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEyMyBTYWx0ZWRfX6UZJ3X9qDDlL
 KnjFPvrGg2m385neBX9hmIffEadzujrNJzv2VSmfjrD52z7R0NG771rXarlZ0knDwDY+iGH0SYy
 7wZK5qSeVOjzeTYcRIhUdRK4LLxXQ87Az2DUrsP6nhaIPu88NgjyC4RtnxpQbuWOWSujGXP3GOM
 +GRXHG3c1PNfBckTp9iz+Sqp9JF1Lri/hZUZ4lsnHTlSusUC907dw/X/0X0wc//bTOnd1nQ28Qd
 adICma29RhUlKJe82dE8kiAGEMPChmuV92M0YzmnNTamEelVECvllcaedAKpwHDf++TWeQ4GikW
 RAhyZrS5/sHM9sOEY9CSnQGNbP69ukLa+OAJiWCn9eDlAUp55JA2b8V9Im1vDG280mxODa4Bdmv
 EmKennZIH5eKNKSEssM0OUFT7A57jw==
X-Proofpoint-GUID: uoR779PzPycw29G4P6um9GJObQnBtHFZ
X-Authority-Analysis: v=2.4 cv=fLU0HJae c=1 sm=1 tr=0 ts=6900d52f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7mIJVjpd1DSiGoLQp9AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280123


On 10/28/2025 2:34 AM, Bryan O'Donoghue wrote:
> On 23/10/2025 10:14, Hangxiang Ma wrote:
>> - 3 x VFE, 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 6 x CSI PHY
>>
>> This series has been tested using the following commands with a
>> downstream driver for S5KJN5 sensor.
>
> A few comments here:
>
> Publish the code ! Its actually in your interests to do so.
Hi Bryan, if you were talking about the sensor driver, sure, we will 
evaluate it. Hope it wouldn't block this series though. Thanks.
>
>>
>> - media-ctl --reset
>> - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
>> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F /dev/video0
>
> Good to see, it would be nice if you guys could also start running the 
> RDI path through libcamera - softisp soon gpuisp and start showing 
> some realworld results.
>
> Not a requirement to merge this series but, a strong suggestion for 
> your own verification purposes.
>
> ---
> bod
Sure, we will start doing that. In fact, we tried and faced some 
dependency issues. Will reach out offline. Thanks.
>
>
>

