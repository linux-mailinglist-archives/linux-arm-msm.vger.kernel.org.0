Return-Path: <linux-arm-msm+bounces-64915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 493A7B05031
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 06:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76346174AD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 04:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99E2255F24;
	Tue, 15 Jul 2025 04:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1DPvF40"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0027B5FEE6
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 04:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752553103; cv=none; b=GH8PS9aUYa3rps+w3bplkZOkrzPcq+svS/R5aeXC1wRiNL0Pm8iTRiTNfEFmkULrQxq3M1dn1GlzEQdq0v5PLK94S63VolfyalgABy44+n02dmHx5NmQL843ApCP4bx3I0yH38apDkGTp899Ree9VAzYrFqyihcm/KJQ3N3cscg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752553103; c=relaxed/simple;
	bh=dFKWHIQddjxHUPkRV2M3jjcwPHCaNzGHYMUWZuz27pA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SZ5r77+JSQ6d20PkfQJpAFzED/OU8HAsG49h8ftYfG8ib6lLAy00pSYhKk3rjq2JyeaN/AgnrMr9k7j/N/z9NIMDLgDbReBggROxBSCZhi8wlSRHrXS/vE80tDfihJz5Qja9bC/3zDUslPylpptS6RUsnfXOR3JKhfvfBOBWiNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1DPvF40; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGIkUa008651
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 04:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uzm3o8XukJIfDxG+gIGMGpjKkmpbr4jLR61YoqCEI4M=; b=p1DPvF40/MI+Vnm4
	PfsCtjTRYXnwPO1N1Krud9tSW6geE5N2pGlrnKKxq+Ie6oY5Y1+gsLz5HCKoya+L
	jRbkj+WVEgFNU7QPPBxEfvIwKT6vCXNKv8WE30Om8CmV7pTL3dwAXmAm8Ght0EiX
	Tnb4kNytKs+hATELaSSnVDBTbcky7LITH+ptZ1QtPdPtGWflbOAgbFqUGSAZ3+fE
	PGGAWZX0G4cyq1wblm1aVXWN2HpAoItAZRoRv5zZ+T8rA81gv3eqge9Ew7ChwVYo
	Kq456fnOa5wVAd1hsSFD73c49gC2l0g37ZummJivcJ879Z1j3UMhnDBxAFwGma4m
	+5urAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w58yhkmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 04:18:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f6b829cfso36024215ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 21:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752553099; x=1753157899;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzm3o8XukJIfDxG+gIGMGpjKkmpbr4jLR61YoqCEI4M=;
        b=RVK2nRq8Iec/8b42HPLatjaUCGTiQgz5xdevY7ELHlh1dw9InseOYKG/4r8a+EZ6m9
         vVv5qDaFvymb+l3eSwuBHaKoW0Ae2R83ftADT/YHV++h6i8sNv4n+qnnfrlFdcFBVMTA
         HSxBz6d/KakqsJ91xMS8lOevZKEFUCjmJXSkiS8HDBtCT/rqLKZ/iI+e6wDDv9tUOYLj
         vTYef/ufWQrbwXYGh+VupRlEmj0i1S7n5ufV5AFpBN3VEdiA4vOWn7G0npy5APjKH0Qk
         eqbZrNHLzzG618DYAosbCr//GPq7Kzuq3xqxm6v3MVoHhIWwHleO+uNTnIoqcc01iQlC
         hjVA==
X-Gm-Message-State: AOJu0YxRp4qpqLGbqPKmtkNVcVGUpilGVjr+oXDnO7uKbJGtzdw88Gm1
	Zvx4mZvT4NDG9cttI4QhRYJn9E0rHU+hqHweytorJ7wOuRVtv3C32SIj6yyIoTvT3Wr014h6e5W
	wgBGGkKxPCJeuyy6Is1ibkcjz0GnkHzYJ4ypvhL9YCL6r58UrCpnsGY1Bzi/Z3+t80//4tYwhwz
	LG
X-Gm-Gg: ASbGncs9s+3+/6ZeAT/bSQxPDScQ2PYg5Hh4532pwHeeOK8YT0ZAhzKfFQwsAZyjw56
	VrpqWd5Ogh2SSNM+DTpNHCe8BNMwgsl4gvksHXlBiZ9DrVLG1cXxE43HHlyPbTr65u6QOO2bfyR
	n+QFFET5clq4I1pnH4HfvSyNvKS1b1mBAvGg36KMJCfighzqI/CS9/SB4jqD6FDVcQh8KQ0cGIx
	UXiDMYtcN8MVw6FfPasUSPbaler9jsx0l4M34e8gKEacPruW7K1Klt2IKIEhrMrK3QvunHoFnR/
	eIr/CrJD6zfPEiUAHrKvbhR4aLJ9bL5NU7tZpX1ssbp2+lGMmCaFoloDAsmQ/RVGXgfE
X-Received: by 2002:a17:903:2381:b0:235:1171:6d1d with SMTP id d9443c01a7336-23dede2efd2mr201885585ad.9.1752553099145;
        Mon, 14 Jul 2025 21:18:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlSR1JCrm29sPlBvrgSPyyxQnSbvHwk6Kiv95T3q3tvlO3uU7qin2TLupU+hhFPMssDqsfqg==
X-Received: by 2002:a17:903:2381:b0:235:1171:6d1d with SMTP id d9443c01a7336-23dede2efd2mr201885145ad.9.1752553098603;
        Mon, 14 Jul 2025 21:18:18 -0700 (PDT)
Received: from [192.168.1.36] ([116.68.96.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4359b6fsm99909735ad.212.2025.07.14.21.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 21:18:17 -0700 (PDT)
Message-ID: <0d1e5ac2-9bf1-4fe5-b832-2e438e51d7db@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 09:48:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: qcom: Remove extcon functionality from glue
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
 <b3767f6b-9793-47bc-9b09-70fc931ce8f3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b3767f6b-9793-47bc-9b09-70fc931ce8f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAzNiBTYWx0ZWRfX4axoupZZj3Dj
 Nbtu3jmgh8jU1Fi63xNeUqVphOum/CM5j0hn2z1UiHUdmfSmoX26fF3TXbEJxCh+SKWB9DjEwuM
 nwZNWWIEfRf+dQa+eH1OrpooDmhDQYNR1HJrUovHarXvTaK3BnEFhj26hMJCDK4GNjjA2bphPIz
 2jl/v9qZAnq0S0COgK1PN3r3IFY7ESi4P7h0VY0vRrtpJXvfN9H5Hdb6ftPGNAIRF3SRwRcDyUX
 de+HmuO+tS3DO8E7qBY+ZvRw4fEknzZeelIvHeXuMEBW+KtfllZCwymJId06pl5uXKn9AxOcPZq
 JJAoJrUXJco6LaX8XUgM9LhKjV0HF3FDdPphaOvyjbWkOmS0Ruqljb8bd0FwOQyCninAxFDg/rB
 bmsMYDDd022jIL3ctddp1WkhUtz/UxsBKHp/rtsgaqS3mRTqXzhtAutWXUJUHy6YHu5ItqI2
X-Proofpoint-GUID: AmF2yDDUjvHxBo_V2TxlQZJQcn5Fo6yJ
X-Proofpoint-ORIG-GUID: AmF2yDDUjvHxBo_V2TxlQZJQcn5Fo6yJ
X-Authority-Analysis: v=2.4 cv=Or9Pyz/t c=1 sm=1 tr=0 ts=6875d68c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=eHFrewLOQS0FNmfAC0rGFw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=427AQKXnQCN1OQ7kLHEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=842 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150036



On 7/14/2025 8:59 PM, Prashanth K wrote:
> 
> 
> On 7/14/2025 10:17 AM, Krishna Kurapati wrote:
>> Deprecate usage of extcon functionality from the glue driver. Now
>> that the glue driver is a flattened implementation, all existing
>> DTs would eventually move to new bindings. While doing so let them
>> make use of role-switch/ typec frameworks to provide role data
>> rather than using extcon.
>>
>> On upstream, summary of targets/platforms using extcon is as follows:
>>
>> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
>> effect on them.
>>
>> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
>> driver which relies on id/vbus gpios to inform role changes. This can be
>> transitioned to role switch based driver (usb-conn-gpio) while flattening
>> those platforms to move away from extcon and rely on role
>> switching.
>>
>> 3. The one target that uses dwc3 controller and extcon and is not based
>> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
>> This platform uses TI chip to provide extcon. If usb on this platform is
>> being flattneed, then effort should be put in to define a usb-c-connector
>> device in DT and make use of role switch functionality in TUSB320L driver.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> This change was 4rth patch in [1]. It was suggested to make this as the
>> first patch of the series. Since this is independent of role switch
>> patches, sending this out separately. Removed RB Tag of Dmitry since the
>> patch has been changed.
>>
>> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
>>
[...]
> 
> Shouldn't we cleanup the Kconfig also? Anyways it's not critical, so it
> can be handled in a follow-up patch if preferred.
> 
> config USB_DWC3_QCOM
> 		tristate "Qualcomm Platform"
> 		depends on ARCH_QCOM || COMPILE_TEST
> -		depends on EXTCON || !EXTCON
> 		depends on OF
> 

Ignore the above comment, both dwc3-qcom and dwc3-qcom-legacy uses same
config. Sorry for the spam!

