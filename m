Return-Path: <linux-arm-msm+bounces-50942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD77A5BE28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 11:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DEB37A117F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 10:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD2A1F4CAC;
	Tue, 11 Mar 2025 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P7hPtugr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66661DE2BB;
	Tue, 11 Mar 2025 10:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741689910; cv=none; b=tuxVwO809KjhvM8ccaDqoweH2byMFflsgNztUavxltmHdoBFpglmQGD8hA0eNBCJDzpFgmLK6A3RmqaEA4GRvn3iNKT1k2c5/jRfmZArDgPmY2ynnjEzP2WWqB5mkvmNejEwAmBEB6ZQBBH7TqTfauyASLHHrjpLhPAl9VTiI9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741689910; c=relaxed/simple;
	bh=2qtZx71hOP7XTKnjKVCGoxZv4RprBeHFFlw7SOTHDCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UYiuBSefdq202vHzVbMphTxrihmHxupU2jsAZLWYDTa16tcil0kEXjVPZTlDIOyQxexeMsr7ZujXjDioHFdoPw6cR3tfz7g/umSLx7utyptCcasNasXa3ool/oyBuNRwhXgOtclwbNWp0WxdHjOGjWaJgXXXRUMZNmUmaY/GGOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P7hPtugr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BA4P1Z015125;
	Tue, 11 Mar 2025 10:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S2i6mRK0jajy0u0bUB2Z9AQTcwRxDHV/B/HG8iEiju8=; b=P7hPtugr6omYfGnF
	DqAmVqW5Ec8QzF4iWGD/4Og9HQB5DAx/IavD+obS5gb5CdS5ikvpibXWZIF2RUVg
	ezwUl16GdE9am/hNnwpU02HFbxGistvoPJNuov/DqWMw3eZM6cZo+Yv+IUTCH7fh
	K3NO0eaoFqkNAhglRxQZSMooooPlLCQjOZYqZqnscMHrpCpDYANy1uzMm1zHrM0i
	CmBM42HYPXIvxe3u7vfSo871QPqEs2QnTlI9OVAhc8pE97Wefe8ZZJ7cgDtRuATQ
	C+0xq7slbdU6VCbxS3qpzrMXpkrGIt0jaeLMutPVO9UizqYf+9Pi6pJacA5lms1G
	Dlk5uQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ab8m1hhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 10:44:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52BAinNJ018053
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 10:44:49 GMT
Received: from [10.253.38.132] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 03:44:42 -0700
Message-ID: <4c24723a-1773-4034-95fb-47748f6e8982@quicinc.com>
Date: Tue, 11 Mar 2025 18:44:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 04/14] net: ethernet: qualcomm: Initialize PPE
 buffer management for IPQ9574
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-4-453ea18d3271@quicinc.com>
 <a79027ed-012c-4771-982c-b80b55ab0c8a@lunn.ch>
 <c592c262-5928-476f-ac2a-615c44d67277@quicinc.com>
 <33529292-00cd-4a0f-87e4-b8127ca722a4@lunn.ch>
 <cffdd8e8-76bc-4424-8cdb-d48f5010686d@quicinc.com>
 <74f89e1e-c440-42cb-9d8e-be213a3d83a4@lunn.ch>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <74f89e1e-c440-42cb-9d8e-be213a3d83a4@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: txnyqolXEKgHcYx5KUazcWu3fq0FVdnZ
X-Authority-Analysis: v=2.4 cv=K9nYHzWI c=1 sm=1 tr=0 ts=67d01422 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=IKtIH902HmA1w457l2kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: txnyqolXEKgHcYx5KUazcWu3fq0FVdnZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110070



On 3/6/2025 11:29 PM, Andrew Lunn wrote:
>> Thanks for the suggestion. Just to clarify, we preferred
>> u32p_replace_bits() over FIELD_PREP() because the former does
>> a clear-and-set operation against a given mask, where as with
>> FIELD_PREP(), we need to clear the bits first before we use the
>> macro and then set it. Due to this, we preferred using
>> u32_replace_bits() since it made the macro definitions to modify
>> the registers simpler. Given this, would it be acceptable to
>> document u32p_replace_bits() better, as it is already being used
>> by other drivers as well?
> 
> I suggest you submit a patch to those who maintain that file and see
> what they say.
> 
> But maybe also look at how others are using u32p_replace_bits() and
> should it be wrapped up in a macro? FIELD_MOD()? These macros do a lot
> of build time checking that you are not overflowing the type. It would
> be good to have that to catch bugs at build time, rather than years
> later at runtime.
> 
>        Andrew

OK, understand. I will submit the patch by adding the FIELD_MODIFY()
with required build time checking included.

Below is a draft of the macro, please take a look if possible before
it is posted to maintainers. I will update the driver to use this macro
if it can be accepted. Thanks.

/** 
  
  

  * FIELD_MODIFY() - modify a bitfield element 
  
  

  * @_mask: shifted mask defining the field's length and position 
  
  

  * @_reg_p: point to the memory that should be updated 
  
  

  * @_val: value to store in the bitfield 
  
  

  * 
  
  

  * FIELD_MODIFY() modifies the set of bits in @_reg_p specified
  * by @_mask, by replacing them with the bitfield value passed
  * in as @_val. 
  
  
  
  

  */ 
  
  

#define FIELD_MODIFY(_mask, _reg_p, _val)              		      \ 
  
  

         ({                                  			      \ 
  
  

                 __BF_FIELD_CHECK(_mask, *_reg_p, _val, "FIELD_MODIFY: 
"); \ 
  

                 *_reg_p &= ~(_mask);                                  \ 
  
  

                 *_reg_p |= (_val) << __bf_shf(_mask) & (_mask);       \ 
  
  

         })


