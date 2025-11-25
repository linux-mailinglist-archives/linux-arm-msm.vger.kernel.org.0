Return-Path: <linux-arm-msm+bounces-83307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0957FC8686A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 19:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8128B3529C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 18:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097D332C33D;
	Tue, 25 Nov 2025 18:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ProPvPpa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kWPKFG25"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9177329E5E
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764094532; cv=none; b=jB4MVQFJ8v/za5zi8qWMz702gu7JaUZD1/Qa1MtdiDCqX6OnHdqfN9YHywMXT+8bWapdyJeC8US5/sS7HR8cBiwup1A5/npMb3D2umpLpwNHN0dcrr8FVukzeeT6bABZLAgH6WmoNwdn3HA4sVuule+aW7CPoy1EBibjNkFbC78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764094532; c=relaxed/simple;
	bh=adL0brzEfHiUDOgSClbzSgN+S+C5yrOK/kt2Gkly5a4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RzBGXHTsniJ1i5LUVzR+J9MCLnHou4F2m9NPsl8iFMSMeVBxe7KKEEToQxpdLp1SsOgQuydsvhRx7cnDQu5QW37tL8hJxNsAYN8hrOYHJwzmyJHI7ukmaBbb8LSV21eSf3m0g/sdazMOQUMRdLnDoh6dlo206KM7v87GzIsX1/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ProPvPpa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kWPKFG25; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APHAjDU3890412
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QCVNgVSZvK898U+RAZdgnyXYg6KMBc4DJz/0by4LG2A=; b=ProPvPpa0UFwiKp9
	LmR58VqrZiNGXvuxA4RKI66ZQLf2P/Ovlj9I5nAfNuNpNQmKFoqwMOB1K6yLH+Q5
	xIyktulfa04KsW2cm5awkS00iFIe7Z+rMMevjiIn3xDshD67ZaBrdUKVPbfRh6D6
	8ThbKH7vf0fIZ2KkN83SyYYKlLUAKYf4Sq5TMNhJyMOOlqbOSOOFLtejFGAAHgZH
	JWOwZ2x6ejdMmEybZPOOXRxYN1++kyuDMweyeYZi0XGZxoHebq6im84YEZgFAEJ3
	s3RmQbdpHpTk2YIm9haa3lfsHWwuwaWmhsrcGMKep/ihGrLF/pRdZqcipTY7x/Kq
	wdeEPg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme860a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:15:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b895b520a2so5536471b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764094529; x=1764699329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QCVNgVSZvK898U+RAZdgnyXYg6KMBc4DJz/0by4LG2A=;
        b=kWPKFG253qE+RLa/3MSgl5alqCg4rWin9WBXNBqbNEtOPvscuj6e+HDGKNDMPaLORj
         DG/qvPXqUv+CnWv+pnRwCzAo7PgQ929AqASBsltTCA6ZHUv6366gwwndZHJHoaKVzjKr
         w9/ysdCG6GXkinounnGaL+EyqB8AFBiVbPjDVEr+iLYTMsXuIs0egeizLh8BJtSpZjzu
         tHkV7uopzL2DChY6U1mf/dIOXmfbK0k/v9qjiWCw6i745mJ+ug0iDsPcWICat/wSjHi1
         U3YSKSWSOk0oTczcR/b5+ehIVciSTZ41PYPQltYBnRbl7dfD8oN3ffRQtKU/KWX6qjkl
         ipVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764094529; x=1764699329;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QCVNgVSZvK898U+RAZdgnyXYg6KMBc4DJz/0by4LG2A=;
        b=e8kTcxw8GUWPNJFF0s0aTU4M1mqg6B7CvbhVO2Hj9VHbiGzPb13NQ0Kvf5Ce2Wx7rw
         99UTyUwcr1Ro0FC0eEePwmTvEYR/fz7Jr0tykq3AKyzMopp3nLclJJwf86yLUxVovzsO
         CESS9XPVMXZnJLOD3zi72wx6bCtdWb1uWV44vEZph8A9jWRGaWveUUO2Lo1Q0KbbNBxR
         OytGLu9Gofx18FEiS7MBwaQ5cqGX3brYIqQe84OL1woqEJEi/QQaP4WCUBZNDpLnTF0g
         Z5+rbDz7XVzcu/kmqGvj4VPIA9SPtMgyq4y0xb8a3+Cv56QZXeKtGsuus/nbTJKeZ47q
         hSiA==
X-Forwarded-Encrypted: i=1; AJvYcCV/8Xl8/XvTfTDXV9sIm4E6I2dNtK977GbwcujbKtDsaXlPX82g4bFPJBbNCTu8r506k1pzyFsGSVVPXNd2@vger.kernel.org
X-Gm-Message-State: AOJu0YybFhzcqtvnrrobG7mXuzrRyVmwvyhs+hqwq8PZHFXFD4QLwhjO
	Iraxpl+g2eg3ZKW0pUxeCeeU7QBlv74DqRLdLzWAc6uNy9hgbuLdLEqmfw0LhHPl2Y5mXAWfbOX
	b32YtaQ/mT34Jr15ALPZcnlz5iaWSRzqhfEJJT+UPh0jZoRToImF1drz35DmoLvG3XpVc
X-Gm-Gg: ASbGnctDyzrW20cWCeADXOipRet/HaUVupTtiF6B+oIiiHT6Rlc3vFBKl3qL8AIt5cu
	plOJjR1IVE5tReU/pnQF9wabojFqYPC1+em7Plxw1lIAX4xrnKm5lby0tKMfJVja83bzslEHWKq
	f9LVxqZ5o3P64hYE0jQXwo/teaUh6lnDK5OnoaVPKrXfIa1pxMEjZzqgO1oFojyMuPSpl5KmPs3
	UqDLmRpUazeCPN5RZXczVk/xV73XE3ZkVleSwve1pMj/yXXRm0VSOCdjqv7pPAdrg7nF6GTjgIn
	cQFraJaywh9l5yttfD2ju+u7mP+OIq97rYnYLIPOxYr4biUGWwW5cNsWj1S+mRelo9RoCX8/Gc8
	Bei+Xk7vSh1QqmGQUBQJ5Bs/aMZ/sfiggDq4=
X-Received: by 2002:a05:6a00:1a90:b0:7b6:ebcb:51eb with SMTP id d2e1a72fcca58-7ca8926f306mr5081780b3a.17.1764094528575;
        Tue, 25 Nov 2025 10:15:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiGr1NUNzY1dRCn+j1SJJ6jMoIjkS1W/N8vxtuDpCjiy0AJp7MgCX3VC8K2eHEIyN7rSFGUA==
X-Received: by 2002:a05:6a00:1a90:b0:7b6:ebcb:51eb with SMTP id d2e1a72fcca58-7ca8926f306mr5081718b3a.17.1764094527901;
        Tue, 25 Nov 2025 10:15:27 -0800 (PST)
Received: from [192.168.0.195] ([49.204.29.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed37ab1csm18759653b3a.17.2025.11.25.10.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 10:15:27 -0800 (PST)
Message-ID: <a1ab1656-d140-457d-8b25-f2c65c4770a7@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:45:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
From: Taniya Das <taniya.das@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-1-89a594985a46@oss.qualcomm.com>
 <gxjidpjoc6h2rvuqpv2wjynumj6qfk6ktznte6igem5g4gt4ai@ukflachqlg3i>
 <ab4bd349-9f63-4a2f-b643-414510adf8f9@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ab4bd349-9f63-4a2f-b643-414510adf8f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=6925f241 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=kQyaedCKNfhe0S+2KTiflQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=05IzIxfkHTFPt01LOXsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE1MiBTYWx0ZWRfX7hYRiTHQrzwm
 6H2BgahB+IBLL4FAzwJaj7gzC8Fxf0XjRhZ5iLgBcMIs9Xi3YFJYk3GZhbIUcQdEcqBx7I2hTdD
 14HiXYHnXbNCTCKCKZhMobtoV9RYl9t6KK8XUwy3IWxgXC7xahOPsaU7HL2JqqG/o4DiV3J97PF
 dY1/7IhBSToSfr1PIBfNpfLVdkvOp6cHtTmcg/CaJheRkijBG1alVwGmtvaErCtmMnxXKlFhlqa
 N37/xp6YAYTWBJMs8/+OxeGUoGDYiUXelc65QidgqvVjy2FlmF5Z5kMox0CV1o0dPREZYKDSd95
 ZkpZsSaPjjWK+APTwIvhDLpvmgLC+QCORf0P7exZLirVDGU4aR/XBqUydQzzC8rPaAXntHPmzrn
 WfsnPzh8W3DCvQyUPnxaCCq20WdiyA==
X-Proofpoint-GUID: MJvnIP9Caftz9LmRBiYkEI2i1Eyj2RNB
X-Proofpoint-ORIG-GUID: MJvnIP9Caftz9LmRBiYkEI2i1Eyj2RNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250152



On 11/22/2025 3:30 PM, Taniya Das wrote:
> 
> 
> On 11/22/2025 2:10 AM, Dmitry Baryshkov wrote:
>> On Fri, Nov 21, 2025 at 11:26:27PM +0530, Taniya Das wrote:
>>> Add the RPMH clocks present in Kaanapali SoC.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>>  drivers/clk/qcom/clk-rpmh.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 41 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>>> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..c3d923a829f16f5a73ea148aca231a0d61d3396d 100644
>>> --- a/drivers/clk/qcom/clk-rpmh.c
>>> +++ b/drivers/clk/qcom/clk-rpmh.c
>>> @@ -395,6 +395,18 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
>>>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
>>>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
>>>  
>>> +DEFINE_CLK_RPMH_VRM(clk1, _a1_e0, "C1A_E0", 1);
>>> +DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
>>
>> This got better, but not enough. Why do we have now clk[12]_a1_e0, but
>> clk[3458]_a, describing the same kind of resources?
> 
> I am going to fix those as Dmitry.
> 

Dmitry, I have fixed this on Glymur to ensure to use "div" and "e0"
https://lore.kernel.org/lkml/20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com/T/#u

>>> +
>>> +DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
>>> +DEFINE_CLK_RPMH_VRM(clk4, _a2_e0, "C4A_E0", 2);
>>> +DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
>>> +DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
>>> +DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
>>> +DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
>>> +
>>> +DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
>>> +
>>>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
>>>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>>>  DEFINE_CLK_RPMH_BCM(ipa, "IP0");
>>
> 

-- 
Thanks,
Taniya Das


