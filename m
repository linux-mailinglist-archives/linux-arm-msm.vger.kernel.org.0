Return-Path: <linux-arm-msm+bounces-59065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21137AC0F7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E5A91BA2D2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 15:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8611928FFD4;
	Thu, 22 May 2025 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPdtHD0t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002EA28FABB
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 15:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926575; cv=none; b=Q3yQ1CMEtgAeII6F0p3WI2QsJsGXDf9bxoEWGzw78zt3zWnP+dNRziS4oAOVsrUgrLTrKu6pu138TEYpMPQNCuxCuZiYERJsjImwrU/n0LvKuYc6cRZQW9MnBOGA21xk12ZoOXpLypO7FbMwlenpt4kXvgWE7GpKU3JOmsbWi08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926575; c=relaxed/simple;
	bh=R8KIDqDwiVqm0817NC0llW2MwMrop540wBKjz8G3Bmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQIqWoqoCv44ev3AydO67BZ1lnu6rZMolmKI5YEeMXEC4E3NgDjSQquQE0b7mT2kBfitF2BdmF112nosZmni49xN0GAV7E5ih/fqbeKT2RuEqLU6/wHTNDW5JRLM3/z7oyyQn8R0jWGA0afQ+J3ACoK946Ybu/fp3jq5PuML1Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPdtHD0t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7sJAY006608
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 15:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4TU7tpZlMQ+Z/J8LghDjXFqurzAXCCyNj4y5yRCbxxA=; b=UPdtHD0t5rzG2PyO
	uEeYfmAhVCCytztDb7YFG43djr21rHuLH/C9324MtN/udM9cjQ4LGYHjU03nP/Wk
	FsRhYS9dLwQ9iG/QZyFyz8qQi535GH9OD+iTbNmL8OPf8HhTzDLSeOZruddMzMSx
	VZobcU01dbMxTRMn8RLpnskm2mNq0ZBM6XZIc6CNUtohE7lWZaAhd4/qzRjTvUEp
	wunHxEe9L9pJpAOVIj/jj5NSGlHPui9Y0n8j99grPRh5RYyuu/gVEI4e5TSgEDgj
	rVvizRGnDurLFSqUKMUnkjHYIiqZfubZb0MMi3at6lQqYKPgkuYI87wnPPB+gD14
	O/20eA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0pvtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 15:09:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54788bdf7so72067285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 08:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926571; x=1748531371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4TU7tpZlMQ+Z/J8LghDjXFqurzAXCCyNj4y5yRCbxxA=;
        b=J+OUYxnYcAJuXuCflhAFyafiH7W8WDQKXtIlDZaE0a2GzrxbO05F+Xt+wkGOrx1myd
         MkKR6+Gf83kGq8HopwtAGewdiHVDTLBtv9Y8xr5IkEP04XWLo+HuKkugfEzu1aBOF0Oe
         K7SP2spCjsDX6QMYdl85RxijOQOrCmuzVktv1OIPfP6BYi4ywLoiXR8dE0LTlgOj1Whd
         Gub3hBp7/EhpdpO4PwUt12crwpatUnLscq1sZn6k40HCw0Nj7RkADPMfY78QNEGm+RFr
         ZaFbNCM3n17GzU8CCsxm/gBGsxHg9c2pPb7/cE5qLEnk0szlNI2+bS5MZp7KnC2UaX1C
         JXkA==
X-Gm-Message-State: AOJu0Yx/9BIB1RbgDWd2jtgAjFow02SagmAFUSbxSAL8wH43JH+szFXT
	Q3v95IxtZF4HR1ZfWcxdOqGsL1jfwyM5Ug38WUkkEOsEA6lV3K2I/cbUKe4qfqGGRWfHYA8xhgC
	JdRzQ7gStOnJLcSS0O7DNQaaj7JNVRXsHPcvSnDPVJXjv1LkV858opQcxRcTJ0hoDPsPv
X-Gm-Gg: ASbGnctMMSKWV78bUbaGhvaW1bK0fmSx0aAYjAtsNPpKwNbBVcH8rzRRI9nBPt9Pa9W
	gIsKTslMDUOYX1Bq5oMQ9alm+z44aBvotBJFiANkwPu75tBbMczrfRyTTOR83GNM687uUBYsXBy
	Ln3JluiryFYAQGJO3/FyNNKAC56QRAv4sTcdBAaxlc4aPbuRIAJWc7+Uc4EpztMXVt7LqdF0yKg
	6EPp7kzYSd2C5zFOcOsaLugtSqSUwIkFbuYuP06FIfa0WNOv/ey5Q2SPosNlU5e3ubuGA9Pbb4W
	JQTV+nKgr+mqjgkierNYJnRFJDB0J+h+2z6n5i5lpZuK5pdkjqka147F+4FzZurMJg==
X-Received: by 2002:a05:620a:268c:b0:7c9:256a:953 with SMTP id af79cd13be357-7cd46731135mr1464769485a.9.1747926571551;
        Thu, 22 May 2025 08:09:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbVvSMIebTkeQbAVUwqeqJX7z9XwZxFk/FRvDNQuJYn/rrDTOUl3Z7yNgTaJEQuswHZtywSQ==
X-Received: by 2002:a05:620a:268c:b0:7c9:256a:953 with SMTP id af79cd13be357-7cd46731135mr1464767985a.9.1747926571210;
        Thu, 22 May 2025 08:09:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60284aeb666sm578997a12.60.2025.05.22.08.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:09:30 -0700 (PDT)
Message-ID: <423565b7-6b11-40bc-accf-902e80314300@oss.qualcomm.com>
Date: Thu, 22 May 2025 17:09:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Song Xue <quic_songxue@quicinc.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
 <7f82b59d-f1c0-44ad-a623-3dfb86c95c7e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7f82b59d-f1c0-44ad-a623-3dfb86c95c7e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dilN1nN2iP4LKOdwNXauyL_KflF8_ohL
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682f3e2c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=yVuqqs4s3M2hehkgkIQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dilN1nN2iP4LKOdwNXauyL_KflF8_ohL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1NCBTYWx0ZWRfX/RPFlJV0bcyj
 2TNjoIw0hHIoWxxkNh2RL4qAv+0rGfJPsZxouWS12DC4PWc6uNGojb+0BkLKEYJGuS6EQlaOq5s
 g8Oi91EeYIM8DarQRjF2M6GKivgzgr9PHfs1MAsqwvv1t6gMYVtvHo6R0aAauiBhmV7PMh/KT1T
 Gt2n+iH4qHniK/JJNt/bfaS5i5hRvjp5/+W14u/+8MqvMYRXDG4+DOPmRC94aPYdV/7BwyJ41Fh
 bAu5Y72AI/y/EqIxNj4N0xGSoRAyHwZ0k+skxSZCmBvfADIjBQCcQ+GjLAt1IjuRAgQ55Eo80JE
 AdQYXwFhF70kki1KqRaxSvJBPbHYUpwyTZDebkfkN3CAfX1FXZCzITNOiuOgyESvAShPEzuy0tk
 qbp9Q37wOAGJGSh1Qqv5F75B2Y3uUw0xj4M8ynwclNHa4oClRk5+AKkgrppNrOwzIsR26csa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220154

On 5/22/25 12:56 PM, Song Xue wrote:
> 
> 
> On 4/22/2025 6:00 AM, Melody Olvera wrote:
>> From: Wesley Cheng <quic_wcheng@quicinc.com>
>>
>> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
>> sequences to bring it out of reset and into an operational state.  This
>> differs to the M31 USB driver, in that the M31 eUSB2 driver will
>> require a connection to an eUSB2 repeater.  This PHY driver will handle
>> the initialization of the associated eUSB2 repeater when required.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
>> ---

[...]

>> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
>> +                    const u32 mask, u32 val)
>> +{
>> +    u32 write_val;
>> +    u32 tmp;
>> +
>> +    tmp = readl_relaxed(base + offset);
>> +    tmp &= ~mask;
>> +    write_val = tmp | val;
>> +
>> +    writel_relaxed(write_val, base + offset);
>> +
>> +    tmp = readl_relaxed(base + offset);
> is it better to use "readl" which can guarantee write visibility?

let's use non-relaxed to save the meaningless discussion from dragging
on, in fight for what is literally a couple nanoseconds each boot

Konrad

