Return-Path: <linux-arm-msm+bounces-76010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE93BBD5CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 10:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B81B73B43C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 08:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86A9261B71;
	Mon,  6 Oct 2025 08:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7uz1c01"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B73425A35D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739810; cv=none; b=tGp7E1kljgNEOVfVw00Cuv+5jsp9eCPGuK9HOOUemUKy3Nwy6Z+i/rpFKV6bwP2b5yJfZ/fm/mYKN7pUUL7IkOsvlIEDfCva1TYh46kYE6XKZjcIImACf/rJh5vroKYqCVRjK3On00Ve1c7696A72M8Nfm/XJG7k1yqNMUwibYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739810; c=relaxed/simple;
	bh=3xJ7Z8oCc7s7mq9s3oXcMYfek0obhqDRgFqn5utKAjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NoZ7F+2ZXP/zthzdR9QqfEA/IPmBZrqlwCQIsEtLknCo0u3cZ/jLmv5KYGnB5zyJkQ7lpfHyF+6O19MdqK4xVwxWHUgT326Muw9OlQ555POhu3SL2Zu+ix5FCR33ovoaMeG9bjT27i5/BlzHLaEyOScClGwG/I8BaB3hmo9RVhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7uz1c01; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595Nrl4t008637
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 08:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8346oKcNdc8O5mk8XD1GS+ABgJlZ0Nmd9Pq2hDG+C9c=; b=n7uz1c01dD2fH1S1
	n7QQoxOfLUV2LDSHj+OsVEEc4xzrT1Z3I51Zi2sX7NvvfS0C+pFqv7lX3ZWlvTYw
	x9/KoaKsv+o5C7OyNNODNzW2uzBCWYhiS2jGtvn9Y7K3BWnn3PUn3y/79QB+KDxN
	Kh1cMI37rtCU0SQebLkv0FihWCnhTxEor1re2o0rkNUR5gl0mLb2WGFm3n5ims8I
	XBH36nuFqrOk2wYnG5h7mdsgmXCIbIpbIpQ5yBkO27oRdh7PaDcKA1ZCMpvTk6JI
	WLgjYy6hE9qBwSCasgFFL3O9rNKzV+WOhCVYD5BauemCZg606+E1d31xxfAxFBGe
	bYLESw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7k5sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 08:36:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-819d2492a75so221696185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 01:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759739807; x=1760344607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8346oKcNdc8O5mk8XD1GS+ABgJlZ0Nmd9Pq2hDG+C9c=;
        b=f2qKMMhKY5dJL5OZ81e0h6I2nbkh84D7+SKh0kSn101blICb9FyYT+bfoIooSYrrxy
         8cUIAlYwAFbeI7F5iqqe3SHAH2RwbnX0cF0nJEwfsJ5JhcdIFxfzSGaOabZKEXxM6N8y
         EcbZzPEabMUnoocemyv2BoIxz6Nrpi3utFFwIY7dVMqqYCEgtDFM8mu7pQUbqJ7mUz51
         qLinZf0AqlULDQ4I4pAR3/75SxC/BwwN8HSgOOo5oufcLREI+dlseVCqw9XVQ9KgmNGF
         QkX7KBZWOWkZjd3rmxmR4DCvPZDdt5jMhKoFXR3w1OEhC4utOZj0Ctk+UKPH6QhUp21R
         qoAg==
X-Forwarded-Encrypted: i=1; AJvYcCUcRz24hSxSRdjIUkJce42Dpqj5b77U/jhn13irEqUF2ln4AwrIjIDAtn6lhc5oqw+z+pnZwpuuZTT7qX5j@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6R/twFuYQf5eOS5+bRZ0YxNfmxMemFiTVtN/9CO8n53M2+yR9
	i8whVgg1Yl17/SnOqCFjNR3Xwn9iKDu014jvYa3TlRvlTiCuKBCr1LsVBmdZ4gh/8WYJfDehkFK
	VASrgYMmKlWmqeLdor/8cmmczXa0wUSZt5boiH1WNtT4lUWgp5A4tRnw/QFe6UB/Sk5DF
X-Gm-Gg: ASbGnctgLKM1/u9Y19XV0vAmU1lYCRya/yDXf4ikTpFONX8vh8NXmYEZ2rGvV3M3Qk/
	1cP9UbLuLLZKZAwYfdng/tv6l1KGrQdxwtr6LDizl3JaoY+NBf1tIjhZAaQCGb6r4Fv6NSVcIvk
	8at+omvuR6t6NfY6SsB+Tj+82yJH+Ugxrqoc6M0Sg+Ix5UY1IrDvR71xLZdkFKwjXiW1PyWhiPz
	w7GlZhay9odIQt9JiXJ9UVBKPo86MEygJFHugE3qQBQYQBdYEhShMBtGueumd9ess1MXb8mRkGZ
	pUuaLcNPvn0JUwMiYxraldcT/Q3x+6hgSbezKnblepa59o3Ndab9WCUmOSmElary5C0em/N+O1N
	izSe4aqa5H71xGPZguFhk+Hg7Izw=
X-Received: by 2002:a05:620a:45ac:b0:815:9dcd:986b with SMTP id af79cd13be357-87a346d149amr1024824385a.6.1759739806838;
        Mon, 06 Oct 2025 01:36:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPrqe0FEK5A2rK0WqG2bUVqVAbMyKAAgMNM0yWU0D/lPD6AGWyTfFRy3QhqVeiDkZA8LrxUg==
X-Received: by 2002:a05:620a:45ac:b0:815:9dcd:986b with SMTP id af79cd13be357-87a346d149amr1024821985a.6.1759739806366;
        Mon, 06 Oct 2025 01:36:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b2basm1094364466b.51.2025.10.06.01.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 01:36:45 -0700 (PDT)
Message-ID: <c7639504-e605-4dcc-90c6-4993ada0e271@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:36:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-10-b14cf9e9a928@postmarketos.org>
 <38c70e06-f7bf-4ca6-8fe9-2a4012017cff@oss.qualcomm.com>
 <64a732cdc3fe9381e2f716be9e965fbc905c1416@postmarketos.org>
 <sarhhzxs77gthpap3vsxidvut2bihtmtyjecjbo7dgvglwfd6s@yt2w4on4f5zw>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <sarhhzxs77gthpap3vsxidvut2bihtmtyjecjbo7dgvglwfd6s@yt2w4on4f5zw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX6mUekZc+yM57
 8LE8GhvLpuCJITACrKVNy02TAlB3GbgdmqNOXFViIFxRk/RXxG8GJe5vnrumsmgGmOqR3l5SpPb
 IyvljbIGXaDT6TviFzGj57npmHNyhDEZ9DVTTzZq0n3dr61MrgP5pzDR3MOCNRMEoXfb8OLKXFF
 BQaFoD1G+ydqPNmxKQ53qju1tQN+42ARJwVnHdwAaBwdY3AOFqdQu89B9i+0sRna8Pd+H/f4fOT
 +lW4fD9DX8HApcDt84nmjyaJgn6MKLVgm7WeMTshCNBTAuKGvy3BsaUwAsHSZrFfbT3eOt2VNtJ
 m4wunY/WVBHGhrI/LuaBjXK8DoFf4XFAUsvAOvMVUKbOJgiihdpjd0FHaN3wWshKoCmxNh6deYF
 8OCF/um7/BUKD+L/x+juLB1N0CF21w==
X-Proofpoint-ORIG-GUID: Ab6eYhCGP5hMSvbZLAN3IvxDcV8YV3b8
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e37fa0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=ruIub6WMR363QC8emKcA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Ab6eYhCGP5hMSvbZLAN3IvxDcV8YV3b8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

On 10/3/25 11:55 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 02, 2025 at 04:55:44AM +0000, Paul Sajna wrote:
>> October 1, 2025 at 9:09 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
>>
>>
>>>
>>> On 9/29/25 7:05 AM, Paul Sajna wrote:
>>>
>>>>
>>> This patch will allow any values between 4.6 V and 6.0 V to
>>> be set on your phone, with the kernel defaulting to 4.6 V at
>>> boot and staying there until (if?) any driver requests that to
>>> change.
>>>
>>> Your panel probably expects a *very* specific pair of voltages
>>> and any deviation may cause unpredictable consequences, including
>>> magic smoke if you happen to go over a certain limit.
>>>
>>> You should most likely hardcode that specific expected voltage here
>>
>> These are the values used in downstream android dts 
>> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/efa8458f79dffeb380d43b38b9403407f87d9f05/arch/arm64/boot/dts/qcom/pmi8998.dtsi#L484-L485
> 
> Downstream frequently further constraints the regulators. Could you
> please check the boards's dts file and the drivers (SDE)?

Or you can read back the values at runtime.. presumably even
/sys/kernel/debug/regulator/foo should have the up-to-date info

Konrad

