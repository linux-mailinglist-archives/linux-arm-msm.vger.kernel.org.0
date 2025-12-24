Return-Path: <linux-arm-msm+bounces-86455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 643F4CDB1F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 03:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6467A300AFE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61795299947;
	Wed, 24 Dec 2025 02:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6zxDfae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBHvCplj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8CE296BD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766541777; cv=none; b=fl1AZjPmFcjeOZy9cSTa3Xx93+7qMuda+PKrO4KNQ92DMyeTk/s5dyDyr12od1YxPsUnoaZtotBoKqhOg9V+fa7ILzIbjL1IwcF/szBcJ/4/QRvXMZ/h0ca7wJmciaB+u+cwoDQb4b8aNwcDG4y9PMfDfEWTMRC85JDA7eAu6xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766541777; c=relaxed/simple;
	bh=s3RbOY+KJfp8gDMFFB/gXpA9Hr0lNFGtRYCB7dT0Eck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DVBJe1iSZTHVwjhME3XHXtY+ij3RmYC+f1Jvtv5KfncOv8SxUy8ShxP77QgkWU0bvTi79mJyS0j9QIJLnowC42Ry4DA/RelPunse0Ty3W3T/Z1Hir74UaBFRHXkFu5YHpNg5GMd7/sZ2kQklfohYz4WAace4HmuwY4f9UQ7qnOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6zxDfae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBHvCplj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNHrsfT678470
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7XMApf4M356H0/EMimSA2hX4YxArcmlpFCZhs7pdos=; b=Y6zxDfaeSoSUqkj3
	27ycm67l6qfZykQvJD1HBtgGc+TELLbegUjA+4FnVFbiPUqZVjDCs4gM2CPCbHBQ
	9+/H3BYRzGXhzQYUU5q3mGNFx5PimRerJ5Og29OQPb2LQNDwaETG6sMpmIbdKHk1
	qeW5/T470qi3bJoQtjJ1Q/v6rznsXRbf6ZZlBODgJ6pZ3U9yOpaigp4UOsvq5sfE
	GU/XJjG19FKgxNg32MhRAhN7yK6mlggJUOqqol+VzXseGN7IbCRUOaCwiSxp5LjM
	nV2Fr5jc4a1w+wwj+aRLBA0MA8BD/L4HC7sXEB2DTytcNe2w535Wz+oGPtdKwF/5
	DGbz4w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq154n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:02:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so10312547b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 18:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766541774; x=1767146574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7XMApf4M356H0/EMimSA2hX4YxArcmlpFCZhs7pdos=;
        b=HBHvCpljyHwF7Ch/qv8e/zfSqthNVdOfBjhXBIsuyu53bjRyB5Vi9ztFtry3qzXmhT
         MDwbi2mxlJdZJjbtjDzsJpdziaeGdd/vDCOai/9/HC/930vU/YwT/IH10yTDvyUNXKjs
         bR+hFC/uw+6/SsiAjyh/bA/008KX2vzx3BTr7arZxwWVwxK9+PK95wz69NqhP57h1lWj
         6glLzhQ+V4PcG7raF0ZwNZbSWQgEquukLeILgd0IjQzYZ+kftSX3ainbx3fOj5HQXG1P
         bgKSDliiIo9yRlrtdQT66DLrQuGq8S/lbO+73hh2FWamYPF8HPxgfzRmKGA7Xw7Obnwy
         CLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766541774; x=1767146574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7XMApf4M356H0/EMimSA2hX4YxArcmlpFCZhs7pdos=;
        b=P9ms9R9D1xziYfkulQYA4ugZqGjY/1F8Fj7d49X4VLyr+GBiIAucCPs7B7pDnW7CCV
         rS4mlimgxObkozQaPnrAhW3nH6cqlER973HDaIGPR1MzRhpRLuzSQFMx3dcH3J1AXHtG
         R57BAzskXDC36Hjbws3zVuow+pCvrDs+L+fsbsOQanvR/DFOLUQ0cCMxlowj4ytAhTZ9
         yeIxcN7AZX3qtYAD9ixEuAyFcCEaj4P6MJsaH/F1sssIRl/73gkuwmNvhqmeBOU67eVB
         HUqlvTp9pcPhqEFV0q/WptUtZ33UbxJPi2n+d+jYjjbljJxqE+HL8Voh9fW1UeqSXpDN
         WyJA==
X-Forwarded-Encrypted: i=1; AJvYcCVxZ5fh5lHOjbS9RQS+Cl7hg6ce6RFbTm4w7Y+5WLugAMUBtU2i4qdW/Z7jmbpSUeX0nwhOjlsWqCnSFoM7@vger.kernel.org
X-Gm-Message-State: AOJu0YyjTD5T/+j7qKAWt/gVkE2NYPJ6US6vbykh65Ycn7O5nt+E4rWS
	v10dAj0jc0ZpcYwKdUc2VtQK7XK7qMA8Qlw5qfEnpBH1DM9tDAI5rgEwjcdeye6/Zy87HUwb4p8
	BPBRlIOaGBkGvuBmJo/ySlDzBk/kJwvWRIevWP7qenZBMUVYeGpWnonuSIZGvGH0MPer2
X-Gm-Gg: AY/fxX6/vJk5h7U+i8mwpUSOUntv8dC+rcLicwljT4JHBWCdod3FydmPqEUV8JpKP3N
	KDB7rxGQXbc46QYi/nLw4jzQjZAgElqwjgYVAwtIWeCoMD1szuWYmAqoIeiYdumObSDItQDGbQ9
	18KS0KEELNKXI8TJHkn/wYPQnZKfqVnOtA3w7f26+5Pq75Q2XzsJTDTU5pD0PX8rN5gnYfewncw
	lVZ05wef/ZEBZWdWGk3UnSmuda7tLh6KOd48bW8pRdf8z3eYKgfeIm1/SZ9ivaVvM8K165lY19t
	9Lb5/DR+0571Q02v/fhzJwttco7eenx4NGPRDrEJoQkS59fBRMI/H6sqal37kCy1sju19RZVQIL
	slFpkojMEYIADlGDtxC3Ltb1otM7zyIHO+EhOBKx3aG1GEqEGcS8iwSfaigjuP+XnwXUG/RXREf
	25cg==
X-Received: by 2002:a05:6a00:368f:b0:7f7:1fcf:689c with SMTP id d2e1a72fcca58-7ff657a12aemr13269428b3a.9.1766541774415;
        Tue, 23 Dec 2025 18:02:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwEfzFSH6knE5z3W4/0nmzVkPJDeqguLCnwd3faqIjKWRoWdccjf3i7D6d0TQHs6CZJXhCSg==
X-Received: by 2002:a05:6a00:368f:b0:7f7:1fcf:689c with SMTP id d2e1a72fcca58-7ff657a12aemr13269390b3a.9.1766541773839;
        Tue, 23 Dec 2025 18:02:53 -0800 (PST)
Received: from [10.133.33.19] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f3d7sm15071184b3a.51.2025.12.23.18.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 18:02:53 -0800 (PST)
Message-ID: <d15c68bf-1a34-4024-b508-dc3f2676cdea@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 10:02:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Initial patch set for PURWA-IOT-EVK
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <dmdtwsdwl2bl7mn6j4d4xv76h6bo57van3ni4zt3iapq5bonsp@rxoqan4nahud>
 <d8642ba4-9a6f-4fb2-bd0c-419ead2630d3@oss.qualcomm.com>
 <0593cc2e-0114-404f-929a-0860d60afefb@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <0593cc2e-0114-404f-929a-0860d60afefb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4hefda6YZfZYKYb0PwAK83GQjNQz209D
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694b49cf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OLCPRHAsNVESI9y_fZsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 4hefda6YZfZYKYb0PwAK83GQjNQz209D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAxNSBTYWx0ZWRfXzXB61TCFyGbr
 ntX4TkTBlgJQ5v7ek39xEFc22NNick0CwG16F8T3HkWwJUFxBJ87XFr7EeJbrTJOIPRmVvAqOHI
 PIfc/ujYDxZ1opinKyNkm7M+ktn9G8pa6D1yFYZgRX0fU4pltTDJGQ6YRth48aHGyjb1L18I9LQ
 FuUy/kYb97BDfl53Ukdgtq6nSQEu3M/ff1kTSdTS+zrNM1nCMnPqfGyqDP7EL7NlDhWaUZ9zdu1
 C7y8d7jV7ovfqXdBmVPg3w7WXQaQ7Z/Ab0ispgiipYN8ZWB1MLDX+Gn/TEjF8s2Ke0NhoZOz2KC
 wdyz1SMaT1cH9+06mJ24g+dOR1B26sPvqThh/TbLO8eOBSHIokyIdHfMXTNt9DRHg0HGs/den7L
 No5XUBI+NHNgm1tH9pLO6I73gmxgvqBmsp8Oe53nsKsC+ZaR3k5+3iPyXqyz3XNiC/IjOQsp61D
 fi49pEa6MGg+qyMai4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240015



On 12/24/2025 1:27 AM, Konrad Dybcio wrote:
> On 12/23/25 3:12 AM, Yijie Yang wrote:
>>
>>
>> On 12/22/2025 5:18 PM, Dmitry Baryshkov wrote:
>>> On Mon, Dec 22, 2025 at 02:03:25PM +0800, YijieYang wrote:
>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>
>>>> Introduce the device tree, DT bindings, and driver modifications required
>>>> to bring up the PURWA-IOT-EVK evaluation board.
>>>>
>>>> Purwa and Hamoa are IoT variants of x1p42100 and x1e80100, both based on
>>>> the IQ-X SoC series. Consequently, the two common files in this series are
>>>> prefixed with 'iq-x-iot' to reflect this relationship.
>>>>
>>>> PURWA-IOT-EVK shares almost the same hardware design with HAMOA-IOT-EVK,
>>>> except for differences in the BOM. As a result, most of the DTS can be
>>>> shared between them.
>>>>
>>>> The changes focus on two key hardware components: the PURWA-IOT-SOM and
>>>> the PURWA-IOT-EVK carrier board.
>>>>
>>>> Hardware delta between Hamoa and Purwa:
>>>> - Display: Purwa’s display uses a different number of clocks, and its
>>>>     frequency differs from Hamoa.
>>>> - GPU: Purwa requires a separate firmware compared to Hamoa.
>>>
>>> Is it just a separate firmware, or does it use a different _GPU_?
>>
>> It uses a different GPU.
> 
> I think it would be useful to call this paragraph "Hardware delta between
> Hamoa-IoT-SoM/EVK and Purwa-IoT-whatever - because now Dmitry is asking
> about differences between Hamoa-the-SoC and Purwa-the-SoC which we
> expressed in purwa.dtsi

I want to provide readers with a comprehensive comparison of the two 
boards, Hamoa-IoT-EVK and Purwa-IoT-EVK, covering all differences in 
both the SOM and the carrier board.

> 
> Konrad
> 
>>
>>>
>>>> - USB0: Purwa uses a PS8833 retimer, while Hamoa uses an FSUSB42 as the
>>>>     SBU switch.
>>>>
>>>
>>

-- 
Best Regards,
Yijie


