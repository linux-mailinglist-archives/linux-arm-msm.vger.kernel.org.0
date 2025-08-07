Return-Path: <linux-arm-msm+bounces-68049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 703A8B1DC8F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 19:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33C343AA172
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 17:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1740B273807;
	Thu,  7 Aug 2025 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecyrRxmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652E813E02D
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754588603; cv=none; b=k/Y9+IBxOYYNZE+I1QZWEDtnwB0k0m7wyfrYm+Dghnl5J8hrN8ZGE6ppFWUPB+GH2K9PmTdATIpcL1xk2hVDMMja2LJgeiaZwhSHxZ6vHmrcw7qdzODiiPdzZH3+ASK16yTU4DpOXLy6Fm8/gOY+3+oo8l7VMksZL+cSGax5v/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754588603; c=relaxed/simple;
	bh=dpMfUqMkPEZFzkDx+RIwLWt/VjBtoiMcVkHsHrUhtfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pbv59Svq3bMmdRgvvKjw5R1k3QIf5TyiaKfWpQ110F+AKm/ZYtN/FNSEAd40qzMiUVhj2+g3hIgzfasfx/yulS0EdKKDQd3sYtOUJFEDCQVc/KIAPwzcD2fvC8okuNJDCkih+wmybaM/bDfnozMO7iMY6dS1q9ULeMi6JA/I7AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecyrRxmU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577ECrRH015910
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 17:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Od/ZKluRoSM/BcGXTLmoioXy7cALgrxeTgJ4Ai4K8w=; b=ecyrRxmUU6zl246I
	xFMYsIP5eTH0gyle1zY2TSg4SMK7L8ER11a4Hf0d+T98Mq8mKSPk1Gi3P4tCcfF2
	ta/mnuwX/6ZqozRGC+H+qgj1oUxaTe7+nSXBXOaRRtJzHw1GZj8w/8ZSDJMMb4E0
	LRmJFUp99QFWF/WGNA27dGNxG5ylYquypAi/9bukp5XneZcn2l31+dm5XM3TkT//
	7fYK3tq2MHI9ePNFswCvpIWXxvBLSjUN6h7k1sUZ2lEHL5P9ALpeAiFWtsQH0yPa
	RcmpezzArzg+ahXFC1PlcSLW9rxawZFeOisOErFmiThOBFBFq9SOJPkFqCXsAPC/
	+mz9Hw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1f3ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 17:43:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af23fa7c0cso2812751cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 10:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754588599; x=1755193399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Od/ZKluRoSM/BcGXTLmoioXy7cALgrxeTgJ4Ai4K8w=;
        b=rVYz2Z4LXjEPdtsxXharI07RQHkaMJ14bBzN0kPYSPxhjPLvnYhDN+J7tnGj0l8vdP
         239jflXAV0K8w6tv7Lp24f2aDFPYnQeUVWwfy5du2IkMbvPOjaPsgiEBNFy5V81MN8Ek
         TgophBZEFYB+0R48wTrike7Kid+s4HgVgpTtJU6J6NfvVyIvOLD2dBJjTBlmBNrPaXrU
         HUs8CEMlHJ4ORziLkH4RzkfR3tCHvSazS/WBguJraUj6jc/MUzSIJbdw3txx9ht86TGE
         FMGzJ9eK7ygX9v8H5N+Cy70BaJ3xKmSzRntLVmid3uDH0U/QZs7/YbeuTotd0pA8ayvE
         z86Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMSJJfl5M2q/LjIpCB06YpjVVWY3Jk1XGVMYweGki7AUyVUM+U8JFucENANlxQRzoGTwV2iWFnK+BaDTSf@vger.kernel.org
X-Gm-Message-State: AOJu0YxwLTLp0V7Dfi1Vbj34ADSdEgknFumOZuMeacX+B2uuY/IwCr7p
	ftW0shjIu2NiBGfenIUGwcUS5QbGl4JD4v2y3mv+CVDwaTw7R408CU55vKe8NXXGZeh5elaUPoW
	/sYgSgssVmu8auI9fUZ4jtw62ktGVrDpITtR+zvmJ7G9OdcxRrvFIo4pLMRNiMjcYyL1e
X-Gm-Gg: ASbGncuAw7/BEgMlR6gUTTEgNEMcdzL7zQxBd3wK7n9LPfz22oYhPYnbEr8NgigV17d
	1FHPnS/voJp+tq+Qj1z9xVYOJ2Rd5cUZRBTjdR6O83H8VtiJnRx03JVvuRorMPvp1TkNWFM4MFM
	x/GlRALDKUPLaLxUF8jux5T9Q2G4/OV8d0qAobwHrYeh95q7X63uKksVfr+pRFFgMMeebMnl1Mx
	1Di1Idsesg1fLPh0pbL++O3L61Br3Gvk77fXav03aXceWiaPWE1LBcH6xmtZLx0hTGhXIFnu9d8
	vA9N2lp6JMBL/AwOoLCNkmCZdiw4jTIMyzqXpzZJD7SVI4Y7FIn3CKDKE+Dwk+zRGRz3+2N3TNL
	ZJOWrMAT1HndqOVEfjw==
X-Received: by 2002:a05:622a:312:b0:4ab:63f8:ef30 with SMTP id d75a77b69052e-4b0aed0af18mr1366071cf.3.1754588599011;
        Thu, 07 Aug 2025 10:43:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHLFzrAlG05kU0lQgJu60RCziGvOVzGLUIw/jn+UFlM1u+n2p8sqqoxnN8rbCSwb2mMlHI1Q==
X-Received: by 2002:a05:622a:312:b0:4ab:63f8:ef30 with SMTP id d75a77b69052e-4b0aed0af18mr1365771cf.3.1754588598476;
        Thu, 07 Aug 2025 10:43:18 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af99604e648sm347662666b.6.2025.08.07.10.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 10:43:17 -0700 (PDT)
Message-ID: <8c7f8cfc-2090-449e-b6ec-688a0021bac4@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 19:43:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
To: Mark Brown <broonie@kernel.org>, Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, conor+dt@kernel.org,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-5-quic_nitirawa@quicinc.com>
 <f368b6da-1aa3-4b8e-9106-3c29d4ab5c5e@oss.qualcomm.com>
 <fe2bc07c-8fe9-47fd-bcd7-c2f0ebbd596f@sirena.org.uk>
 <aed1de56-fafe-4ccc-b542-69400b574def@oss.qualcomm.com>
 <acf89420-743b-4178-ac05-d4ca492bfee3@sirena.org.uk>
 <599b8a4b-324a-4543-ba27-0451f05c3dfd@quicinc.com>
 <3aa82f65-4812-4bf0-9323-96f40824a004@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3aa82f65-4812-4bf0-9323-96f40824a004@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX1w1AN66tIo39
 MaTvInr6rk3wtFIOLJBsuIxyKSUs2HiLRgr0c9DegwvraaEvTpuPq9vvhUJJ5SGiMn4Uz1iV6iM
 A/tcHrNOfYCsS2EUco/qy0m2CZ7ZuLSr26AEQrwojXlpceWj+Vof1maJOX0eJLxRSZRlEfl1Kt7
 6RH7hWDSHFKIKHQppDWvYM+bYtFLTa3EeSXkA7YAuHAEXmRXK246IRCKNiW4iCgKhsEsuqIuXR+
 VmZTQeHWUtPme3Ojq4GED9KNozf5t++h4xi+7OvmUyWJlQ/+iN0c0U4YGaP9XmArF6ER7wyJZXR
 ZKL+WsTrIBfL4fX7zeP48L3vI06j8XQPI8umn0fF18ceOfElskxQrQrtZFG5myRdDlzrJJifFvM
 A3w06M0D
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=6894e5b8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=lkdlCDLHdhMUbxeqZWYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HJZ2fiv3E1T24ERCC-pZcPNgbUFMOlxz
X-Proofpoint-GUID: HJZ2fiv3E1T24ERCC-pZcPNgbUFMOlxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/7/25 7:26 PM, Mark Brown wrote:
> On Thu, Aug 07, 2025 at 09:12:53PM +0530, Nitin Rawat wrote:
>> On 8/7/2025 7:14 PM, Mark Brown wrote:
> 
>>>> The intended use is to set the load requirement and then only en/disable
>>>> the consumer, so that the current load is updated in core (like in the
>>>> kerneldoc of _regulator_handle_consumer_enable())
> 
>>>> My question was about moving the custom parsing of
>>>> $supplyname-max-micromap introduced in this patch into the regulator
>>>> core, as this seems like a rather common problem.
> 
>>> Wait, is this supposed to be some new property that you want to
>>> standardise?  I didn't see a proposal for that, it's not something that
>>> currently exists - the only standard properties that currently exist are
>>> for the regulator as a whole.
> 
>> The UFS QMP PHY driver is not the first client to use regulator_set_load or
>> alternatively set load requirements and invoke enable/disable or
>> alternatively
> 
> The issue isn't using regulator_set_load(), that's perfectly fine and
> expected.  The issue is either reading the value to use from the
> constraint information (which is just buggy) or adding a generic
> property for this (which I'm not convinced is a good idea, I'd expect a
> large propoprtion of drivers should just know what their requirements
> are and that a generic property would just get abused).
> 
>> These drivers also define corresponding binding properties, as seen in the
>> UFS instances documented here:
> 
>> UFS Common DT Binding ((link - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/ufs/ufs-common.yaml?h=next-20250807)
> 
> Note that that's specifying OPPs which is different...

The microamp properties are in the top-level, not under OPP if
that's what you meant

Or are you perhaps suggesting that any device requiring explicit
current requirement settings, should do so through an OPP table
(perhaps a degenerated one with just a single entry detailling
the single requirement most of the time)?

>> There was a previous effort to introduce similar properties
>> (vdda-phy-max-microamp and vdda-pll-max-microamp) in the device tree
>> bindings.
>> Link - (link- https://patchwork.kernel.org/project/linux-arm-msm/patch/20220418205509.1102109-3-bhupesh.sharma@linaro.org/#24820481)
> 
> That patch also fails to supply any rationale for making this board
> specific or generally putting them in the DT, AFAICT it's one of these
> things just pulled out of the vendor tree without really thinking about
> it.  The changelog just says the properties are in downstream DTs.
> 
>> Currently, the regulator framework does support automatic aggregation of
>> load requests from multiple client drivers. Therefore, it is reasonable and
>> necessary for each client to individually communicate its expected runtime
>> load to the regulator framework to put the regulators in current
>> operation mode.
> 
> That doesn't mean that it's a good idea to put that information in the
> DT, nor if it is sensible to put in DT does it mean that it's a good
> idea to define a generic property that applies to all regulator
> consumers which is what I now think Konrad is proposing.

Yeah, that's what I had in mind

I was never able to get a reliable source for those numbers myselfe
either.. At least some of them are prooooobably? chosen based on the
used regulator type, to ensure it's always in HPM..

That said, our drivers cover a wide variety of hardware, built on a
wide variety of process nodes, with different configurations, etc.,
so it's either polluting the DT, or polluting the driver with
per-compatible hardcoded data (and additional compatibles because
fallbacks wouldn't work most of the time)

Konrad 

