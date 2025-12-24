Return-Path: <linux-arm-msm+bounces-86456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D97CDB1FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 03:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6AFD302488F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F30629B216;
	Wed, 24 Dec 2025 02:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqMdG4ks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CN5PY0yH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE5A1DED63
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766541816; cv=none; b=GkjarzqIhUcmzXxEVRCwqBbNFR8ow0CGhabUA3YWqqTD6jfv0Xg1AgqrtvHFS3hFc8ewLv2oHA85/dLTgMjqj9409SwQmyuLbSttE7C/93A09E4RPh/K7FmI1jhjQ03ZovzZuJnnZJ4Ljg1gSepLdkNtpiRR2ux6avqBWoU8K5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766541816; c=relaxed/simple;
	bh=2lgQhrd1omkZIwWvEB/uBBUReUDgxg3t5G+xH/WqZX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sO+pQhJXuv/zjIdk0jtIBiNlCKHA6gXR30kaoFU0LaTCobqENjO0AEuDpskqFUBJCm3a7RCy7yIKoBUdJuccZi1LY85mBRf7TkKaDteEE248OEE4R2nGvlkd8REQ+IhyEfYXMzfQMzptoBJtgYxzBsiqMTaWOdeewMS3SYaDcZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqMdG4ks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CN5PY0yH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNLt3xN700694
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xL3Tpp6pZbai4g7KclDDDOvNkJIOWjTjS3HevNO6yE4=; b=ZqMdG4ksHwpOdOkh
	KRA/fQDqsL18C1pDVwddSYLMKpHmAEKEiJUL2ZeJlu0Sq5VGYY2z88pJYEVXm2LT
	Ufv/zPR9qFeDVgWKH3CbdSBVd9CIC4VefyAEwsW+SYiuwaNkYbI5ADuyBNmJS4bI
	kvpfDAwfFzVjKinCno5S2vTDNnG1JeH7AU/v49WA2uCK93UNFhL6867mPw6t7M9o
	hA1uLiQFdkgCJqzZY45ScDa3BepPvkieHu3J2QnS/giPA4qQ3b/T2OBLLcaHjy38
	6AZFyLRYkgOg2kCAhZK1lAF5U5O6q9TO8/c8sa94XTwXsRhG3P45n+O7DhgxD/Fo
	6P+3xA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jt9fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:03:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0bb1192cbso111628545ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 18:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766541813; x=1767146613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xL3Tpp6pZbai4g7KclDDDOvNkJIOWjTjS3HevNO6yE4=;
        b=CN5PY0yHz4lZ4yUU86KaeBJ34gClxOY8ZWvwNdds3R0VOGdRxdqsQ0GsEMJn/kSLKe
         OSGVGeRoISlsQEpuWc9YcMPZnLkCM+BPpI2B3zJG3uItQEGaDKXBhFgfq4YAtZGn/uBF
         2wjIlMILDYQvVRM9lua2R3SgzRderWAHhiBd/qBJl8gx05MJwXizdZ0HoMsxqtRUowrg
         gJ0xSS7XkoXRVsbsMJKLtghlH4337RHIT8tcHZBJbZ3qFYxjgS3vQkq1qranu4DCzOVd
         qoKIOM3iaYYKvezIxhjGjW6Lu7yBtDHY/Jy1TiI1L/u8HSdU15Zt6ga39n1efPXbCR57
         W2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766541813; x=1767146613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xL3Tpp6pZbai4g7KclDDDOvNkJIOWjTjS3HevNO6yE4=;
        b=hEIqq60wscTrH2bp3/bkb7eKEjSZ/eBFK23gJ0WO/1Dk49uTrToKEGu1fl+tbm8Oen
         akmzkT/7MmtELW82RFOBCDPmlC1l4VbkJ3LDAXoXObyempX9u7jDVFqZOB2dY3nBwrtz
         4Z0MatWwMp2W88KAZK7/V7uXfqZJH0l0pu+sk0i8R/ws3IkVihtHG3OEdIJVfXjalrB1
         llqSi/ATFphpRJsNCNA0XQetCFF6s5t6TakAqpAcJ6hvFS4vw+fiLtQITLTqqkl17FUP
         U0cg7qNL4HwjUj5rdBGkExeaxzH67dIKerK/15ybH/tF652y9KIXPZZ2mzthesuN027C
         JcCg==
X-Forwarded-Encrypted: i=1; AJvYcCU0r7wTqQ3swlPxQAcZAtu2uIciwJg4JJnU+SMFFqA3oOzb1erElcxKgjL3EtfA4xFAUcz75N0T99p/u3Wu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6mqbb3/ZH/b+m3KyjY9ukMuDgv+BJj3ZLC3nh2rTZZeWma6b7
	lsdIsQbjWOb/k/Y4xMPa6fTA2cgZBg/WgfhOLqhmj9N1wMWUTMCEczPUpGNKpP87gxD/dvCvwpM
	F5VHpFcHny4GtzCRey8IbrhBsGjEkUgI8zilqOKFdqZqVlONdeuH+Thb6ez+j4zHhXVWr
X-Gm-Gg: AY/fxX5wt4LIUWv/SbczLMH33YNQqGniJto1AfhlPIzH2raq4DHLx9kCpCpOGtlGjRS
	m6f80Yr4o3y+dsr6DuzxSun/jUDNug4s8zRbS9KnxzdXHviOyYeTFuJtdgDLG0e7vKjLzaEYNQM
	y/bDpKeIUNkdAWJFRxMYICwP8JD0yiE5XBTj5G5Q7ez93YOpeNg4fwZsiLtZwlUPj1eE7XgSlX9
	9rJSDanq2b49ofGC50mK59Su5LIEo1/9DUaEjvobvUR2QGJD9Not/OGgZAemkh/fgX9KnnGSQu/
	ppQ++9VMUTMU32Pe9frAq4S22GC0eBIJTrn1PYEPep8UfAiq5zY0H18+Tl2VUVNcLV03mn7s19u
	xKX3pCiYIwmwRHKXJqa7SR2ZXv8FbobAEeKqgWZmGqT8DM4CSpIDmnDJ2tJG38dI5JqlraCRH4Y
	GyCg==
X-Received: by 2002:a17:902:ec8b:b0:2a2:c1a3:63df with SMTP id d9443c01a7336-2a2f2830da5mr152283155ad.31.1766541812675;
        Tue, 23 Dec 2025 18:03:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTK1C6bMSBRfXGE8NlmYLuVksrS7gLbAJEAkCTMKhKFxyr/NDt/ruFY7Dh/ymmZypbwT94Gw==
X-Received: by 2002:a17:902:ec8b:b0:2a2:c1a3:63df with SMTP id d9443c01a7336-2a2f2830da5mr152282885ad.31.1766541812139;
        Tue, 23 Dec 2025 18:03:32 -0800 (PST)
Received: from [10.133.33.19] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb82sm140523475ad.52.2025.12.23.18.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 18:03:31 -0800 (PST)
Message-ID: <d38a785c-d4fa-4014-b0d5-3ce0fb0448bf@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 10:03:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Initial patch set for PURWA-IOT-EVK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <dmdtwsdwl2bl7mn6j4d4xv76h6bo57van3ni4zt3iapq5bonsp@rxoqan4nahud>
 <d8642ba4-9a6f-4fb2-bd0c-419ead2630d3@oss.qualcomm.com>
 <0593cc2e-0114-404f-929a-0860d60afefb@oss.qualcomm.com>
 <febd6ziruli5qqk3vk5v44agpiorqb65miinsc53xomoqtynih@l4kk4xpmen4i>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <febd6ziruli5qqk3vk5v44agpiorqb65miinsc53xomoqtynih@l4kk4xpmen4i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAxNSBTYWx0ZWRfX3D1pUF7P/hhQ
 NimSzKHn5nUJYux/APkXWQnXlUaiKQYAsZZXsyswPiQRk56VGhD16BxtYiZbj2ZGtQ8k9mX8AzI
 9Nkh24FVm3q7XbcJCxT0asqaoGEjVDu9YM4UIbLpup9ikW/FtlOdve4kb5fZq3bGnyAv/nyz5Yx
 MH79838NAtYhQtwxfyiNtNxtWZNbPNuZkbR2Tm6N5r2knZnAlsYOnPPdMYGk2wvVO/AsuWqNYBH
 tFyJ0zuf7C1gaTr7La6nv0hAeFM9BrXKQwe+S/jkMfP4TzHNi3575zjvAT6+Wo4FbJSsVCMZjVH
 OlG/XOYYvO7BHp4No7br0Po3PH7cOgOnCWOrScj51RDaEHBazb4sCoejfXVu4wG4vJMCJD/vWL2
 7yl2HhjB2cFCA96Es1qD3zG6DPVcRqo+fvtZKFuvdX+y53TQ9b9P+hvBDaBE3tPHfYPz7ZQNDqc
 Yz16xuDlnEwhdjo/6Qg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694b49f5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5dvyyB_Sgsdd-Qve2IUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: NUTFn6pi_L-9Jkd80dfV1JFDIeiYU6GS
X-Proofpoint-ORIG-GUID: NUTFn6pi_L-9Jkd80dfV1JFDIeiYU6GS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240015



On 12/24/2025 3:09 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 23, 2025 at 06:27:05PM +0100, Konrad Dybcio wrote:
>> On 12/23/25 3:12 AM, Yijie Yang wrote:
>>>
>>>
>>> On 12/22/2025 5:18 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Dec 22, 2025 at 02:03:25PM +0800, YijieYang wrote:
>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>
>>>>> Introduce the device tree, DT bindings, and driver modifications required
>>>>> to bring up the PURWA-IOT-EVK evaluation board.
>>>>>
>>>>> Purwa and Hamoa are IoT variants of x1p42100 and x1e80100, both based on
>>>>> the IQ-X SoC series. Consequently, the two common files in this series are
>>>>> prefixed with 'iq-x-iot' to reflect this relationship.
>>>>>
>>>>> PURWA-IOT-EVK shares almost the same hardware design with HAMOA-IOT-EVK,
>>>>> except for differences in the BOM. As a result, most of the DTS can be
>>>>> shared between them.
>>>>>
>>>>> The changes focus on two key hardware components: the PURWA-IOT-SOM and
>>>>> the PURWA-IOT-EVK carrier board.
>>>>>
>>>>> Hardware delta between Hamoa and Purwa:
>>>>> - Display: Purwa’s display uses a different number of clocks, and its
>>>>>     frequency differs from Hamoa.
>>>>> - GPU: Purwa requires a separate firmware compared to Hamoa.
>>>>
>>>> Is it just a separate firmware, or does it use a different _GPU_?
>>>
>>> It uses a different GPU.
>>
>> I think it would be useful to call this paragraph "Hardware delta between
>> Hamoa-IoT-SoM/EVK and Purwa-IoT-whatever - because now Dmitry is asking
>> about differences between Hamoa-the-SoC and Purwa-the-SoC which we
>> expressed in purwa.dtsi
> 
> Nah, I pointed out that the letter is incorrect. It's not just a
> different firmware for the _same_ GPU. It's a different GPU revision.

I’ll update the description here.

> 

-- 
Best Regards,
Yijie


