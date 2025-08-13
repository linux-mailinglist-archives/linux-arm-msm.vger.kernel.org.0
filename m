Return-Path: <linux-arm-msm+bounces-69062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC17B255D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 23:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F23BE5A1C18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 21:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648F32F0691;
	Wed, 13 Aug 2025 21:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCJShcCJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB002D1931
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 21:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121648; cv=none; b=itTJHL6iUBXrrj0BTYapnFVJTmL9FquM8/LY+LRt6qcIQZnLTGEME4rcon9myAF2cIYxLrZ6jTQGYWAMvGflm6iK60axUxjYM5H8Pommo+5WIBMxselo+8o4RCSo4sYWjzUs+/xjA7Ld59SxamcwnjrOEcBgRN5sySxRvDKLX58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121648; c=relaxed/simple;
	bh=3WEil0ehY5vXWc5kCGbGh1iNwldSAw0zKkcaT1ugWPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IHH5fFQ4mvSIPVln80jzegkUOveWqRDB4uhGN5MaN68F0v3hLBurJP1VbpFdo1Bwq6p0Ry0HYZiqdLbqSJYHAhqU78+Zo5vGi6aczVYL/T5Sxbrh3eMx+9mJcpYhQ/NnwGDL0rtNk3i/QM7hq2PWa0x++qI9rxIDdDu3cxUVzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCJShcCJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DKixTI002790
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 21:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PoxP7tG7pCID580yMt9K2LXcQBndbjiv/lE6hcV18C4=; b=LCJShcCJqrQ7J/v4
	GUKejkcaQxV4s9YPZgV8B6+bo/RivOwQyJyJEdjsoQF0qnCkgT7sy1D6zqHnV1vO
	s48+BESFy59JftqMeDl8n2SDCymjYh5aSnCrr1TbCWVG7Kb8IsVjxSZcByDlSHAN
	8IrmNbu000mwJy7GjCPp4kET5WaJXICZmjJntGnTE0eEMzog/jpTZ5T/46QLADsE
	i+pm0N50cbRTQcgWZjzDqVKjtbuQQq4wnqRI9wswOhQOehQ0zOZXm+n7HzJlHfhZ
	1MBWBsL0LP9EGj1Y6HMPq1rsJoFE8RUKzy8jCWnsHUV/YTgwCMYi2dS0hOqO/jCB
	TFDVQQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv5bh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 21:47:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458067fdeso2196005ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 14:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755121644; x=1755726444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PoxP7tG7pCID580yMt9K2LXcQBndbjiv/lE6hcV18C4=;
        b=La8ODUOxEl2NPBLgg+AcVWpmByVpYEIBD8piiqNlKlYJyntFFd6dI5/Fv5UptkZTAw
         94QOUZXKhPql/ST+4oukfk1sXjAApDdQL7yFDNX8NpgOPgkx0ISHicSl12pj8gR9KbZ3
         F7aeWgEu2j4goVRVJl/zgnX0NvmHm3bx8Xig87URiURR4/pBzs1rAxazGjYRhQS2CsD4
         IajfEJ2DChdUFarFb0d3zfNSIlQXKmY+aZ7gg7zSze0KUEmKTcjuFqR5lliUywIJCE64
         IE64vyGuvBK8ipU2tatd5dzyEvr4xzC2oLwjXw/PSfeuM2+oSHWWMC0O95i/1E5I7fvF
         7Fsw==
X-Forwarded-Encrypted: i=1; AJvYcCXYH2eIKB2PsykpFczS1VkYnCI+lcjXTiOtttTy91czgbn3nGkszzEF8pyUYhKtBPNEzJhrwOJ43VhxM7TN@vger.kernel.org
X-Gm-Message-State: AOJu0YxkmMwJnu3bXFdW0W/qKO07wuaZadMJyeSRQ0SRPIpZ/9YsE813
	kWpYaQC5yARSuNUlxqSBMof8eb0xaQ6/I4adC3r8FDOneYK5tcOzPuFCJHEY3VU46QNirEMZsZu
	P38VjzkW7WaIk1lTGJKcvcTU0GBOwPR/qGCLpvwU8OXe6dRWaKIHe/W2RDSBHO4/s/pc=
X-Gm-Gg: ASbGncvpT7CRywZ7d2z6L2AqScVP6N0BLpaouB9S3u/bN1f2WuM8KDNnOQSlPQhfT7H
	iW08QeurOFUxNMhd11VnAYVTu8kZqmjL1+DAd5N5yJ5mCoF7vJCHE3BdPTqB7LnQtvbLFrHTG93
	RkdIzBsUwQIXqsr3zUbK4G0fODljfxhvxKfKrXMp2QkDAKuB5yNG4uqghFhlp0RhbOq4Cpvl1Oc
	dimX2OUXoCIiS+mZS4jRbqVWuITXxJt6bECVyIKbN67RZyW2ab5ELXwh6/2yDvqheKYHLXIW/WR
	xv+mx21lZB8JyqambKNdcInmrTF+oOCzhWgiVGk/i106YDBwjtwF4grBupMyIxZCTUnYp4A3QOP
	7EcOzoQJ/O4pIfRoZMiRjQeZH0ibEKZDlbskwsg==
X-Received: by 2002:a17:902:d482:b0:242:9bc4:f1c8 with SMTP id d9443c01a7336-244586e1b69mr7940555ad.55.1755121644279;
        Wed, 13 Aug 2025 14:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgjyhLi16jIYpZ8EHZqnYQaA0dKD8mdlmwaED7WOs0d7tmfiyJiuh/7q2M1HKFCS2ese9Jpw==
X-Received: by 2002:a17:902:d482:b0:242:9bc4:f1c8 with SMTP id d9443c01a7336-244586e1b69mr7940215ad.55.1755121643848;
        Wed, 13 Aug 2025 14:47:23 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323257aa89esm1010760a91.23.2025.08.13.14.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:47:23 -0700 (PDT)
Message-ID: <0af9ac59-9b91-4a0b-92fb-b44e0e008431@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 07:47:14 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
 <f10f1602-972a-491f-9c11-95e5e7bd80f8@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <f10f1602-972a-491f-9c11-95e5e7bd80f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689d07ed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=dTt1GwfqUVNo7j6m3doA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0YJ5g2zALneMtEOKHAtJjvAVVbHL_B4G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXy+MjiWVlw79S
 Apy7id6VkK/GmgBACerF4CL8bfCHLEvdIN1pwnsbKxAEH+Iwzw5QNW7Uvxby0kqSaD4COoWqBa1
 f2O+v8hXi6/4a1fkqQqAQCGUpeTQshNPiJ2AhPCjb6uPBYfWG0Ly//JhBCldQlA79AKCvCmKhK2
 yzluJgnxsr5Jvlnx3+YSK0tR2lle/KQWJuR+GiZeFyF0osGxwNl2tEGMX4F2qKwH0ROgxjaHemA
 r1V7pESqhsfTvxeNCCSa8o65hFz31Yu7T6r+2Z7FIGg7hlY0Jo/JzD9LPM5s2rkb6+OOg1hgKIz
 CmfQbPeIKgTizDCOYxOsilLopSv7Snp6qC94YdMOCfj0DAQhjQEwbSOJtnpWBHopVvhRkXrDmuO
 9TYZUcvl
X-Proofpoint-GUID: 0YJ5g2zALneMtEOKHAtJjvAVVbHL_B4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025



On 8/13/2025 8:06 PM, Konrad Dybcio wrote:
> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>> Anyone with access to contiguous physical memory should be able to
>> share memory with QTEE using shm_bridge.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
> 
> Hm, I thought the idea for the tzmem allocator was to abstract
> these operations to prevent users from shooting themselves in
> the foot, and this seems to be circumventing that..
> 

Yes and no. The TEE subsystem has its own memory management code, and
the qcomtee backed driver will utilize it. In other words, qcomtee will
manage its own memory, and tzmem will only be used for drivers that
communicate with QTEE without involving the TEE subsystem.

This aligns with future extensions for FFA memory sharing.

Regards,
Amir

> Konrad


