Return-Path: <linux-arm-msm+bounces-78374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4224ABFD57E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 18:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D0ED58077B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C0827A10D;
	Wed, 22 Oct 2025 16:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8X+xgSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D772D5928
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150491; cv=none; b=pypTBjLHaOMqN/IlVL6kPC+YO7hC7TEzQeRhECBAq6KnrZsmrTQ+SyorSaNQSSFs++X+kI6rrhgQQLBJqdW3sSmSPYIxfpe91n0IZZqEMXF7mMtrJT2HMySR+cd5tyVzd6+ymqOvu5uu+rqSzORM9VGaFDY0NzrvyreBVWRPIdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150491; c=relaxed/simple;
	bh=WWU63ihYCfAl9MtLHYpFyzwsaRfUEpjSEkWeZqiCjOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0qX7toqruOaMz9DzCwfM02uwnIwCQvWEcCKU9oORv3Pa7FXSSC1KHVNoLvWIt0LTnPJdDkFkO5GGDldmBZ6CVjDKG3ozkRm1Qnit65fZaBBefUD7UI/WVYdewOlswm+/dQ7NvDTKNT/SyiYJW5cSPiRVhXG851uxnsm9Z9ECHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8X+xgSg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M8qWjs004127
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hPWRZgsQCGIi/ZyFzVsRxR5WGv5cAzvzCcNnPr9T3GU=; b=N8X+xgSgRykoWsU/
	uq8Z+9wmOUBuwlSxyd94FUWgMmKb/YGCedJvHFjDWpSaXkYa1e611dynipQB5YUd
	GY/KV5EhmMHjdtJrBvXUPDrUvVY+a8k7XN41sRujN+XBFgx+ycl8lRQW4Mvqxt7U
	yahlD8XouBL40tc0E1ubgPC8Va+gnJA6BB2SEN4hW4M7OmNjxjwbDr/bR82krGgM
	wHFm2UnNsFoxnjB0ypkJeE7mvEvWTXuHJLCOEbrW2aEm4CJu1CIHm9LqRfh+D/WT
	z1cQZOxYD1jMiwActPkpRL8TyhhCW3KkCl58gkz270mLFGqf7+u6wJk3nkbTVTPH
	rDJwFA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsaxnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:28:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6ce7f76617so993545a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761150488; x=1761755288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPWRZgsQCGIi/ZyFzVsRxR5WGv5cAzvzCcNnPr9T3GU=;
        b=ZCr49/3ASxSmw9ijkwlE/+OOaIxW/rA0jlGchvYOY9UjgeLwwhvFhvdp0db8DcPNPv
         Zl+pwcyGL0GfwRf+IR3aDlglOh3rAnd24qyQhPkUNdPSQKw7i/3Rnl19dmf0gTxPQ5aV
         +HRFYCybuD/NN+N9bzEpBqeeQ/ZRKTFSjWG3tjpLBPLdXRwJJVn82A0qEdL9yU4tmFN9
         PYDHwkzo9wzCfB3E70Uu3c0vohqiKVjVQDXFe/Y+n3oINn/4b3len6xy6nVN9+X333pq
         uALeP2mX3AMOdsjObmd8Ae9t1J4YZoOeUUa3f+210vmGJPO/hDdlBUbChWeDdG7+cloF
         b/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5/TV1nN77BVvprwfnAI6WiA6hs/YP7/6wYTBkehpqjw5L+l0qPhdWv3twQMoVuXV9jIyjuyLphf9z5OWQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzEl3k4U9S6jDH257Vx/L9bQh2MwoF639eqS3LatPv4j4G7BT4Y
	AppeSCeX5cOOI25rTZEUF71ka2L4Rspyux7PJUcFN3oGGNMeI8WPH8jLcvQ9pgXD6sTwP/eBCeT
	d7LWZRrI9rvJ3ps8doDakB2tSnhlC9EXCddZ/KYXVE2PMe7UVTusSTsvayJ02X45Bp9QI
X-Gm-Gg: ASbGncuX1w9nuY/Ae+c15ezw11CVINcHONDzVnr9w5wFNlCSHfdIUdJrXHbfDZi46GR
	Zv9u9DTUWaP9vGZ6g3bQijZcY/oA8547RN6Q3pkA2kR5vHppir6d9opLOHJPkvddH95itzbzUF3
	/5YWumN85O+HwV1CMNYlbxdmITd7tI/E8Sng+n3+ROW4+0VFmKB3q6w9GiRO9KyRWHXvuQQTKkT
	5mqHVceY94RDYDIvqUHX10ziQwcEo1N3U94EwAHD3USCZIIwBUMrh0WBFezFuzd9Kb1B+3jsgQf
	m6/PXC51SsqyZTA9BWO2J8d4klCiZ5/YipdcTyw45Sc8LoxJTS1J2iHmkMNlOvRg8wKHfFzkAbA
	nObAdcXv+HAn3MV2bKL+lEzSYlaaUI9GSJxeVMW/7LxAdo5wvUuYM
X-Received: by 2002:a17:90b:3848:b0:32e:e18a:368c with SMTP id 98e67ed59e1d1-33bcf84e18emr28608308a91.7.1761150488033;
        Wed, 22 Oct 2025 09:28:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ9pZV+drnSPSOTW4FSOUHLGTx6mQsPIYki/6EQ52FOOurt3jDk95FYht3zLzrueSRAuQ/mA==
X-Received: by 2002:a17:90b:3848:b0:32e:e18a:368c with SMTP id 98e67ed59e1d1-33bcf84e18emr28608283a91.7.1761150487643;
        Wed, 22 Oct 2025 09:28:07 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e222d8652sm2999932a91.0.2025.10.22.09.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:28:07 -0700 (PDT)
Message-ID: <0514142e-b3a7-4d44-8ef3-31b3ce1ebc4a@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 10:28:05 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Support the new READ_DATA implementation
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Carl Vanderlip <quic_carlv@quicinc.com>
References: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
 <77abcd1d-ce69-42c8-9608-4a9557613d21@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <77abcd1d-ce69-42c8-9608-4a9557613d21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX+bUd7paxmNiu
 1Tn+7gk1oL9kTg7KZpSXZgjEo0LlhLHdHz9/KqNbcTDTUdtMVEtmuDcrMdH5aoycP1lhratyjqA
 9j5HYTuPmJkUo+f2IttXTR8+JSLg9V0IManY7FQbH8Lp/mYFpWvyKpySWAJVfzDRrhPXwk3xf/S
 f7YxeCCluK4bJ0NnVH3Nv6PNxx26l+1IlPZJPtDrK2GevzuaG4IYi8QXar2OhEm2Q0OHY5rG8GD
 D2ZiMccATk8G3cr3FtPseyGOHSoaNT/kLbuW8YHgx3FwdEQ734e7Cwk1vKC6XUiHyE52Udi9SC4
 mtE4Q+qSPljT4y4sTv5XixKTDAPJTGsB6DwRVX3nYNmzrKXglCsQ0t9b5P9oJ+F7WnMHGZ89ZPk
 eptn6h99zxeoJJ8jk8gT8LJOxhJqbg==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f90619 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hYh2W50GH4enn7eNEKEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: YT0zrNs-d0QJBSHNe_vLb-bfFOGCMdr_
X-Proofpoint-ORIG-GUID: YT0zrNs-d0QJBSHNe_vLb-bfFOGCMdr_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

On 10/22/2025 10:03 AM, Konrad Dybcio wrote:
> On 10/8/25 12:40 AM, Youssef Samir wrote:
>> From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>>
>> AIC200 uses the newer "XBL" firmware implementation which changes the
>> expectations of how READ_DATA is performed. Larger data requests are
>> supported via streaming the data over the transport instead of requiring
>> a single transport transfer for everything.
> 
> tldr just like reading/writing images in 'raw_mode' up until now?

I'm not sure I understand what you are asking here.

AIC100 is the "old" SBL architecture. When the "current" XBL 
architecture came about, quite a bit of the components were rewritten. 
It seems like a different interpretation of the Sahara spec was taken 
for the XBL implementation.

In both cases, the boot component that is driving the Sahara component 
in FW will want segment X of the elf for the next step of processing.

In SBL, the Sahara component would have a specific MTU and break up the 
request (segment X of the elf) into MTU sized read requests for the 
host. The MTU is negotiated with the transport (MHI). The Sahara 
component expects the entire read request to be satisfied in a single 
return from the transport - anything less is an error.

In XBL, the Sahara component would make a single read request to the 
host for the entire request from the boot component (segment X of the 
elf), and expects the underlying transport to shove up data until the 
entire read request is satisfied (Sahara will sit in a loop until it 
gets all of the data).

There is a bit of oddity because the Sahara spec says that the host can 
indicate an error by sending a packet that is anything other than the 
requested read size, but "packet" is not defined. The SBL interpretation 
is that a "packet" is the transport packet - aka the MHI transfer.  The 
XBL interpretation is that the packet is a "Sahara packet" which is 
decoupled from the transport.

In the end, we have two different Sahara implementations in FW with 
different expectations, and both need to be supported.

-Jeff

