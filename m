Return-Path: <linux-arm-msm+bounces-59781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBB2AC7979
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 09:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD69C4A68A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 07:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A183E2571AA;
	Thu, 29 May 2025 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XStj0sft"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ADA2571A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 07:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748502882; cv=none; b=o5CimlVH6IX+qkKpEN5yAHcBOTswlXqg7x6y4WrMZLWKj56D/J5f8+L6GqsIhz630n17F2BGUnWYKiNBny3GzUHf6vbV9d8WUUvJGxZQSXGQz0WpxKbMUl7Ga/H9BmlZmarUS4vmSa4KoElICVlrkzIowJUOL3B6JBdbnitvWIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748502882; c=relaxed/simple;
	bh=07UXbYCn7cRZ5NxV/3AidW5vV7Ee9BWX17yIvYRrP0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4TteYkFZW30BqkZKquqvwJtnNgIC2R5cXndcxzvLy2EN+vgULhK2yfy83FjWQpTXnNAmV77TxCp8wf7XH50xstmQsjC7ubDF9tJ+r5ljm4RkDNRy6eq95kPGHHcOjVQWwTj73/bqtLp8+O7tE8zI2/J3uThl10qdOWVndci8Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XStj0sft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T6WoHP023876
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 07:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jVa35T4wQfLgVUHuSEEbWi7ckEE/l+jqbxBz8uhNkac=; b=XStj0sftasNbddO2
	bDBUY6bfwxC47/yRNwbYDQkUY7QkHyw7AZ8Wfw5rz/m/vsfdEV1nuMC/iW0gcQhl
	aScEitpwW3ybCvYyrbb27R7DuNT2JkMCtWbADMGyuWTSHcEk4MVFqe46wSIETJ05
	S+kmazugXM6VRKZBGXQ7QxNYcqI2JPhdEQMEmKkykiyf4OHTgPQ7wRuLYPNtp+Vt
	gMiwOTaiQOnczya7j+jMNjHdy7ekHTMD8J1479bjj8gD3KxvfX+E1xtItnJd1RMK
	XYw9m1IcKjTNfMkPyOjvFi2FtxxWthuOxr/04RsZSHRflQysp0/Zk2G3+Y9BDqet
	7jRcGg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjvw3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 07:14:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-231d13ac4d4so9346805ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 00:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748502879; x=1749107679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVa35T4wQfLgVUHuSEEbWi7ckEE/l+jqbxBz8uhNkac=;
        b=QJ35xlqeUQw0inRN7/ZcmV2Szc7Rtbao1Egf/7jKp+AqPuaV7TT1cVlgZPT2wUApM5
         nhM0sNZHpBVmWA7XNbNy+kbXqaBv9Lksh5nQIwomY06SNIUbnYrg4xmvbuBin8GkECx+
         sh1G8/QwSOItY43JECtxSzgeH+9hOL6EReGORAiP5JcPdI4mt4gkDXRMppNIe68uUlUF
         URL6pyU3Qnsjfu1XENj7ds0WtCy9qkWoGe9dsNKnvUD6PLaR5LvDmK/TfFLTmUcaEOfz
         GEE3kv/EMJ8R/+eKUaI/rTfAMwu5sNgj/O08dt2yApfF0D9yPZi3awapFmb1XUt0qdi9
         sXcg==
X-Forwarded-Encrypted: i=1; AJvYcCUpdhvJaeGq60DS/IpldgQ2VKUULPZhEUlx927K8DrqJUKSNTS65efWO79tmw84q5hxxUmWqEi4nJzKEucw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw05vxuVUrvm6b62btaKruA5GMstAjmPkEUm68bB8wO8SJql653
	jqm6zqXItIEWzYYrMAtnzZ3rJq+vWF9diGCj8rQfOIM/59OFEKM+JUdlvzV4q2nZM6o0Qs8wLXb
	Y/05dOk9HOxF89rddIZMPEPswM5eaxMcXdVJ4sh+186819rmibuPkyDCKA9D/2tB/iDGt
X-Gm-Gg: ASbGnct0+hzbA15BuqukR6lOPUrxxCt2LVIkncl+Dgrk/wNYeXA9FCT5Phcd+UqiU2B
	jxORn+Qvjf3osp4P2jq116i46/LF0/qLt38DbnQNb5DOk1QtFgeYko3bBGraiD6JBDqMnbRZzdZ
	AITSanI2yVqxC651aJvHeVtGjwsffPYfdTlI4eDlZ+zG88g/Oolya79NT8YUTgGRdFEgwhzmvFa
	qph+wNcQzT1Q/RytAIvXhDKXGMj7jRDoDEub+gNbeYni2erJGokRVXpcn2H/2S6kGrPm+ZpHnxz
	I4qLlu40c9BrzCk/t1KYrXPCTH4vqNbNuH9mNNQFTA7ZeK/dAbbA92MOt7QWIJKsbcV3RzAfmuN
	e
X-Received: by 2002:a17:903:3c2b:b0:22e:3c2:d477 with SMTP id d9443c01a7336-23414f9127dmr335319255ad.25.1748502878838;
        Thu, 29 May 2025 00:14:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEueHsRRqEM+24t4WlwUoH2u9RMoXV+6e02OQb8YFrStUMU8UnD6bIOHM3t/Mu6fcD1Hx2keg==
X-Received: by 2002:a17:903:3c2b:b0:22e:3c2:d477 with SMTP id d9443c01a7336-23414f9127dmr335318965ad.25.1748502878502;
        Thu, 29 May 2025 00:14:38 -0700 (PDT)
Received: from [10.133.33.104] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf4730sm6464155ad.168.2025.05.29.00.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 00:14:37 -0700 (PDT)
Message-ID: <025c297a-de13-49ee-81ea-2290df0f6843@oss.qualcomm.com>
Date: Thu, 29 May 2025 15:14:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] power: supply: qcom-battmgr: Add charge control
 support
To: me@kuruczgy.com, Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com
References: <20250523-qcom_battmgr_update-v1-0-2bb6d4e0a56e@oss.qualcomm.com>
 <20250523-qcom_battmgr_update-v1-5-2bb6d4e0a56e@oss.qualcomm.com>
 <db0e40b6-22f3-46aa-b35d-7a8729370ddf@kuruczgy.com>
 <1b1c4617-0e5b-40c8-9a66-d243b48c0977@oss.qualcomm.com>
 <a6ed79b329492648a496353db1462e7a7a09597b@kuruczgy.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <a6ed79b329492648a496353db1462e7a7a09597b@kuruczgy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6838095f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=hOspveqpAAAA:8 a=ukq9x2Ni-G2YEArqOW4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=3Os_Ld9iau9Fc9k96hWO:22
X-Proofpoint-ORIG-GUID: FvGun6YIPGkZhU7anbrXjwxvkfbmn49h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA3MCBTYWx0ZWRfXzR8kusCA8/kF
 qCtg9+qseNmsZQOgonQgLteIFn9gYLnql3PeTkHlhOyS1livEU/UY7t/hSnGo3aZJ5Seg+hXrPm
 SH75MAwf0JWjsUYK5Ohdkia6/p8jb3K8rvK212qNd5id2cI2zGWqT8CXGDzjpJWd/A9BTmZrxJ3
 4NRojQWTNlNZDGttXe2rGMwv8ybCkZQJpESiJv5kyUi396ZCCeRbATdFDTAJWGrprVW3Btku8Tw
 IJp6uPxxuiLpyna9zrE9qwT5MRDAKex9sCebMlQdqiihF0IE/G0gjuzQHXmI5ZM8i4MlPvJPlto
 dqkhovJqVEb9URkTh7DyWEW8p031kMT4CP3BcBmWEewRmRi6VPgodWx80i167uy2AK8Hr54EITb
 44R3aGuw7njfxnQosjTdPsl8amHVkWzfjtDNItDBQ90Ht+dGAdd7YNgv6RWvPQPqTMXEds7m
X-Proofpoint-GUID: FvGun6YIPGkZhU7anbrXjwxvkfbmn49h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_03,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505290070


On 5/28/2025 12:42 AM, me@kuruczgy.com wrote:
>> No, sc8280xp and x1e80100 don't support it. So I didn't add the support for them.
> Hm... From what I heard charge limiting works on some X1E laptops, e.g. the ThinkPad T14s on Windows using Lenovo Vantage.
>
> Do you happen to know how that works? Is that some vendor specific solution? Or does it depend on the version of the battery management firmware? (AFAIK this is part of the adsp firmware?)
>
> Thanks,
> György

Thank you for the information. I confirmed with our battery management 
firmware team that the X1E80100 platform does support charge control 
using the same scheme, opcode, and request and response data messages.

I will add charge control support for X1E80100 in V2.


Thanks

Fenglin


