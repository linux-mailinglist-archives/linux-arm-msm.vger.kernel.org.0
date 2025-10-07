Return-Path: <linux-arm-msm+bounces-76130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ADDBBFE42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 03:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08D373A84F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 01:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F001E0B9C;
	Tue,  7 Oct 2025 01:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbRT3MvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ACB1A9FB8
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 01:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759799125; cv=none; b=dXjviErHezMhz8fZx34KFXI2PhoBnl8PLgNG8t5X2fixltt24LdpKlKGX4Zu0xynk5hMa7zDQIfWnwdcuQGVB2NNm+FQyQs+TmqtSKDmRMUH6gEbODMGAsuLAr8L74FjIkt3briFL5DVXhcyboAfOMvPtyt502a9DHQXx1t1Fbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759799125; c=relaxed/simple;
	bh=bN78AEgja7FUP77gENw3DiDXom3H/G8fEsmu33m41jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtatLHC5Ls1W7GOmDGbCicZKzxo1EmRKr9EP9+VJhatafXvU4MHlormJUo71sbYpxVgVQq4UvLK8TriHyx1SEdh12M2oBxFn3Gcxc3DqUf4VapGAYGg9lJ1NRsEuub/LX7BxOBEVXnMPnxvrlnSFXY3aLraxtRgXcf4AyOymxOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NbRT3MvC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FMCJi001364
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 01:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahrNSeb0NQWhBk3m/lb45NZJspf2/oAz6SdApzCbmB4=; b=NbRT3MvCpVXIy1/j
	yBsNPUnV+xpirXET0ZtQucBsmSEZN4tVhOuo63z61mDu4kqH+cS6kuXYd/c8LrhW
	wFIOpeowFn+oAGZS/C5hLi1zSd/ZXVWgcVUEyyY+ZoEcxgluOirk5YVimKmYiotb
	sHyoP65AvirMhuAHnD2DZTXNoKUGRW2cuh0IB2K+2F2SIKnwDYpBb72+wawiOhOr
	qhjdUHKuE5m1pbo0vLNzWdoOubSVjh7UkWp3oa/h9UJobxYRfT0mcXlw/mRcHP8T
	+7oSz/p0ss8iyKem9W6AKcW9aFQYSBshVXvFuTZ0kuhqVOvFNko2x13KhtiZtcVw
	SfoPgA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6whm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 01:05:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27eca7298d9so111542505ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 18:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759799121; x=1760403921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahrNSeb0NQWhBk3m/lb45NZJspf2/oAz6SdApzCbmB4=;
        b=H5gsslGHEbgYyW4KVQe3WDH8P3Qm6hsI6Z++tB9epZXAQ6849LyfhB53oUWO8hw4uF
         sVxzBqsQ43XREjURde3KDFX8G9dD5JUalTVohr9+GX1Q7EV4/uM6sAOHWu2qdKMUzMyb
         WWCaSZX6ln2SspPYfwxFgEuF9ArwQlD1njg/MTXClv5OWoLb7W6HuruW+FC+qLGNTStg
         UriDnevK8IlarlCK4+DYefRoG8Lpf6bXb6yzIoQ5SwLJHr4mBSZXFgNtpWbZXWBQSOHN
         rpxJKB+AzDyjmC1vieGbLSIntHKduUvy2bExLYXixX5A4WQ2N9A9JRz9lv1Ly6i54TKB
         oZjw==
X-Gm-Message-State: AOJu0YwAKApaGriScOUUpPhVLrXXvfyFKwjkKTXofvmoAgcefKVkdovk
	/AZnWtecTjsRJa1TWDZ0xHrkk+XZVwmZjNA0a6PWWVKdIyLwgsnMZu9nNj51btNBTUIju4mtwSU
	uqduldxg3t2hA9sROs1pnYBHBXDsv81/u8yZVn2LB4Ywua1SOx15ubpN4SS6NYKNxnLCy
X-Gm-Gg: ASbGncsWfd6fEtsTyFtAQ3I02CHMPLEUZLBf65NDiehOdZtqPWBKbreihg8zbY+i2gQ
	w6wh8Y7S1kQwV3kT7FZQDt+Zd9xwslYHhxA41XDmAkpaxNS/8wseNUYFolb2/rO6mCdajNU0n7l
	AG5G/epNESB6QE9GsgdUXnfbCNiDB6QbWxqR59OWxVT4AJXKdjJsX5C0ZTs4Yx7H4RC+Z5zzeq8
	o8UMGJwxltpZQE9nBLI26+0HsiEAoC5xb9wjWzbPhAyCww1vX8wV/UZjcVjzccoQrTxAbsalgb0
	GoN4i7Ya4m9xI8S/7JMDKWwZnM44S3yjIzLLqlMM2heDZxfEPtRtu9wKbSqSMSEN+RrEppp7pbK
	uzsAXAGCAQlEB
X-Received: by 2002:a17:903:1b46:b0:26a:23c7:68da with SMTP id d9443c01a7336-28e9a5bf107mr191525495ad.25.1759799121214;
        Mon, 06 Oct 2025 18:05:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK5FlqZZWAVLLYWf7xgsddH7C7vi1Z0PSmlxL52MRXH9QOeZfRWq6du/B1w3IP8YVFcHH7cQ==
X-Received: by 2002:a17:903:1b46:b0:26a:23c7:68da with SMTP id d9443c01a7336-28e9a5bf107mr191524955ad.25.1759799120730;
        Mon, 06 Oct 2025 18:05:20 -0700 (PDT)
Received: from [10.73.54.138] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099af3cf6sm13327205a12.13.2025.10.06.18.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 18:05:20 -0700 (PDT)
Message-ID: <6ed9bd6b-37a3-36a8-a347-85429670837f@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 18:05:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 00/10] Introduce Glymur USB support
To: Krzysztof Kozlowski <krzk@kernel.org>, krzk+dt@kernel.org,
        conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
 <a6690fbc-0b86-4725-99ca-6b4cc477b4ec@kernel.org>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <a6690fbc-0b86-4725-99ca-6b4cc477b4ec@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e46752 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=Zu9LzCyC9gr4H2Ik_2AA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: VfR3SaaUfsNFe205ID2u7kZhM1Qbj7_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfXysPASrqE1XAe
 yxhOQeWZ8O9Ja/pFG0n95hBUhFU1mMyc/NKE5yFpkBftbeaCISjC7TQyT/Yblh/55e50yV5OMFH
 QDDRUN1XELJa8qRaKrg8avCLf+T3t600zAjf0GrK35M0es7cySwSmtww5UV4Ab7iAS1vJqH5Evy
 TZT1aMNqpzboVghEzmwYa0XfDHHarDIsXArus+RiZsWv417T71gA97jQrP7kSCWaair9pJvqoku
 zUL8P+vKXS9GzhW48h9xzc7uBrtJATumRcu59rYwYd2Ie84HDb5RE3AQ0hshup0ziC/RIVXq7gw
 tBl5ZO7mCvVLKT70Fjd1EvjxWSHkUkaThGUj2t/0ePVPau3yiOAmJbWAo8cFnfWKKQdxigJAMKr
 rMjVEE/l0xinTQO3ZL+D4yiLbFuYvg==
X-Proofpoint-ORIG-GUID: VfR3SaaUfsNFe205ID2u7kZhM1Qbj7_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029



On 10/6/2025 6:02 PM, Krzysztof Kozlowski wrote:
> On 07/10/2025 07:19, Wesley Cheng wrote:
>> This series enables the PHY level changes that are required to support
>> the type C based controllers and the multiport controller.  The typeC
>> ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
>> the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
>> it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
>> PHYs for the HSUSB path.
>>
>> -----
>> Changes in v5:
>> - Moved phy-qcom-qmp-usb43-pcs-v8.h into USB specific QMP driver
>> - Fixed DT bindings for clock properties for QMP combo PHY
>>
> 
> Where are lore links? Why aren't you using b4?
> 

Sorry, I'm confused?  Lore links to what exactly?  There aren't any 
dependencies here, in case you mixed up this series with the DT one.

Thanks
Wesley Cheng

