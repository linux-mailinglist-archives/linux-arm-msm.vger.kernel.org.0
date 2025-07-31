Return-Path: <linux-arm-msm+bounces-67243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6DBB16F70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 12:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FA78621335
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 10:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A982264C7;
	Thu, 31 Jul 2025 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzxX0n9V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535BC1FC7CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 10:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753957558; cv=none; b=WTfJx6AD4O1jtn47tOK74wCHVBsHhuzmjyJkn2kdVURIigE+0/BIeBIeCusKRrqbrMKoFHKSu7ExJcqPNDkz6hpphX8uC7ii9Xij+X1GtmQkob2ywT8jGngKueWLahwxZPlkPktMEMSOpe82VXBltcYJDyX8i2HWqdGQgGhN5Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753957558; c=relaxed/simple;
	bh=pOesqc3nlck8rVFgKqK9ggTjpcYdy+Gbb1ulQcN/kpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHO8RpqIIlzipM0J+S4FXfgmt0ACsVE/0IsTSoOIVKA6PKh/eaeRc6lETMXkxF2wvcMzlh0H3AVI0Ml59oCUXVPYLRdqtL8NjfmMyExiYmyfdyqfDi/HTg0dUMXWSXzHc8LLVJXMwFftlBlM4HP5zh53wCntWbGJ0yigfIiQ3uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzxX0n9V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V9fH5N002255
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 10:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n81MtA2X1Y1YyhrlPlq4hNnzgx9bpd8NuR1dYQdg2w4=; b=UzxX0n9VpMqAv/sn
	DpQk+9hh32Id5CMtjQHZVMIj8CloLbAB5X9GBYOdZ7dqXcgnxx/aig/HglLZDdli
	WBWJ3XhxTcwjLHSA5hbTbu1f8ugrdVe7zHufvUPyIc3+kdh2QDEJvdP9C1newZ0u
	+UZO1FlWPSL6nv3kLFkCfe47JpBQQnyQ3ieolsAf8KdJ+ZtLTvbcZuXBhB5SKyW1
	5C8colKztf58qZHq9Y/wsWf0be+JXGKkRmsx5P6nhKG2PIAckx144noYkkUwZjzK
	BpNLEf382+fudtZuWyaPSEqghckUJebm27d8mJhgc8XrD8E4bfgBqJ0sBh3sL6nC
	Z/YIcA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q867jhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 10:25:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235eefe6a8fso2126925ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 03:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753957555; x=1754562355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n81MtA2X1Y1YyhrlPlq4hNnzgx9bpd8NuR1dYQdg2w4=;
        b=W02/llKjVQA1Dy7D/w8ut5rE/BR5+p5fWWl/hgxTSBPJdsEN11WfnbxeFNi9Jlfgth
         8oZelOquuuYB85s80A8WpQUz/TO+2PC3LaRLIirEzGShJIgkGUy69+MktEKAmheI1htL
         FFGXW30ICZZ6lV0EBNEZoHIW+nc9E2R7CRKaqzRxVLe7b1H1spZEOgCIi99VAesRPMLE
         j/qmjMQ+XTp5aBbOi4PxStXMwZ6ZsTeB348xogdQ72a+pN6d75CZquRB1AGWY3kwX12i
         5iJkHfTlBhk4LL4Z+bALYzxv0raSINsjC25FwxKTYD2r7Jf4WUgainqBlxDnKwTQZAxq
         cJBg==
X-Forwarded-Encrypted: i=1; AJvYcCWkbj0UlF+kMLvxSoK/+vHlszu+WvM9lIRxhkDGfMXUyyaUE1My/0R02/hzwAsNp/z+0c1j68Ee9ddGUwBM@vger.kernel.org
X-Gm-Message-State: AOJu0YwlforXmYA/FBGWFOm/nuM00tTb/feLCRm2C0DKVf4oj0hu5onl
	NFla7K+7nAw5wpC5T5HjkZtIp7Ez3hOZhEKBfVE2m/s/lPzQSFKzjM+PjsgZsqGJr4Vj92kEYDM
	a1/NQvfSU0yrxQ+HAu1XXnxnZhT8/qj4rmTRF1e2VIq1xsizf3iqRlDxZzW02YGxOnq7e
X-Gm-Gg: ASbGncvfO5jIoF5BmoDNDknzTBLK0G1afQe4hnfRp1oPuwryw1pgFAmSsMm+mAESHrw
	+JQ3GeDXJOD9RPeANtdmgHhe6bUxdRcxqJ0Rg9C/rNl41jURws2UjzRsq6CkFcF1Mb0SS3DyL3L
	Pul4deq/8N1Oz4XC6njZZCCjJFvaj0jYhcINn5SDmIwub5U3HrfR7j53QZLIFEUsIOasiACGxKK
	o574g1+QP3uRyrKyCRlUH00Jkk7x59B6eX/vHeJ13HIU3j+NsnSp3aRFmdPlIL6/pCcE+Q+LGEY
	d2rWRZLjv6g4bBa23qNob14hh+6v7sFyTwJxiyh+OFIu9Vtyrmk2v9T7TnH+vWm9nKI=
X-Received: by 2002:a17:902:d50a:b0:234:8a4a:adad with SMTP id d9443c01a7336-24096b17831mr94319475ad.26.1753957555596;
        Thu, 31 Jul 2025 03:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEM5m9qng+CoWEOBFNqS5T93w6/fczPEEuuvGdp/UVzwiAltE668w8GzzZdGOMC3LU4BzfyQ==
X-Received: by 2002:a17:902:d50a:b0:234:8a4a:adad with SMTP id d9443c01a7336-24096b17831mr94319105ad.26.1753957555017;
        Thu, 31 Jul 2025 03:25:55 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a917sm14198885ad.116.2025.07.31.03.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 03:25:54 -0700 (PDT)
Message-ID: <e490ce65-4f09-418d-83f5-fa0755b36aec@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 15:55:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add support for Clock controllers for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250730-axiomatic-colorful-gharial-1e6060@kuoka>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250730-axiomatic-colorful-gharial-1e6060@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA2OSBTYWx0ZWRfX9JQRwRG3T0Lt
 8o6dsYtAr90slNpfW4ViNYpl+8gcKQtHqTLDsVnrz9i8s6aygAmlavf++6blhSATf9X4Rwbd0eU
 KuoPf+3ieUTqpONWf+QY1rzVpDXTU5UjhqCrkxuikPOO7hs9qvWxAznctoZCsTQtmza0PtNaNao
 koWdQbUgieKrWuUI9uQb5peTDam7kGewRCkb3M1fWFw8kqTB9kPKpT1RhYZvNbFTaZJMKRVXN06
 Ixp5Y1Jy7KqidJghXlHh2vzFEY6xsavxsxJXtP6zqLC+iSUvzuWleQJqiE6AY6WGes1+C87VzS8
 9VPznRon4wZOPLmhPJpNPKtAvtrLnVt8WOcqtGw2ylXgkbnLMXUFXeEzJbS/q00Mh0AgtNtj1Xn
 ZatPZvdMzpzO8RlR7+LjWZOHYUtapgMvDwRMkdSl4zat39xw2GGlNgYJ46o5sJbLbQVWN+He
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688b44b4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=1-OmqgVFb38NX0Eqym4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: M-8Xme4CBR6g0j8YOKM-GGhWDt8rhALy
X-Proofpoint-GUID: M-8Xme4CBR6g0j8YOKM-GGhWDt8rhALy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310069



On 7/30/2025 12:45 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 29, 2025 at 11:12:34AM +0530, Taniya Das wrote:
>> Add support for Global clock controller(GCC), TCSR and the RPMH clock
>> controller for the Qualcomm Glymur SoC.
>>
>> Changes in v3:
>> - Update the commit message for all the dt-bindings [Krzysztof]
>> - Update the commit message as required.
>> - Link to v2: https://lore.kernel.org/r/20250723-glymur-gcc-tcsrcc-rpmhcc-v2-0-7ea02c120c77@oss.qualcomm.com
>>
https://lore.kernel.org/lkml/20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com/

>> Changes in v2:
>> - Drop second/last, redundant "bindings" in TCSR and also align the
>>   filename [Krzysztof]
>> - Update the year to the copyright [Krzysztof]
>> - Align to the new Kconfig name CLK_GLYMUR_GCC/TCSR [Abel, Bjorn]
>> - Use qcom_cc_probe() for tcsrcc [Dmitry]
>> - Add RB tag from [Dmitry] to patch #5
>> - Link to v-1: https://lore.kernel.org/r/20250714-glymur-gcc-tcsrcc-rpmhcc-v1-0-7617eb7e44d8@oss.qualcomm.com

Not sure why these are broken
v1:
https://lore.kernel.org/lkml/20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com/

> 
> None of the links work.
> 
> Best regards,
> Krzysztof
> 

-- 
Thanks,
Taniya Das


