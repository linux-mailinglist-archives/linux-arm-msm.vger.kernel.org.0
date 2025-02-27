Return-Path: <linux-arm-msm+bounces-49605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A98EA473FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 475301886A67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685951D63CD;
	Thu, 27 Feb 2025 04:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AR5b7VId"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF5C1C5F19
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740629512; cv=none; b=lEFe6SZQBmK8dKhb2GY1cAjE1xg4i+wOswbfOvPhXHrPN6SBBeQvrnNqcwLNOCtTPzg9HRAfo2xokIUPPH9T/VWtIvvrH17HjRHgn0I6qUEDGT0BtUqwPthP0cxNnGKzkMNns1AOQVZaNzDjkzaPm8Q/GNZbVbGWLvW7qk3iFaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740629512; c=relaxed/simple;
	bh=5vRVGr82CGiZh2Cbzj7pVxhSTU8sAZM5XF2eIwvjp+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WyXt2u4sUDGyEgeS3GVHmWAxOzvIj6euTY2FnASgKeeLO86z2iy9sSa3xDtOZVpA+MKoVrpFdBEXXp2s1PtXmLiHDne6xWN6ZhXZjwkKGP7xYTWYU+UrNeUw7skX4Mu866qId97P5z3caynKQeaheXcGbDaRuXQjohtMg6OJg9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AR5b7VId; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QK5GmW021575
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSAQvsYR3iMFmPabg5DWf8ziRODUsEKRzX7L+bsEUbE=; b=AR5b7VIdGtyIxdIO
	XDWqh9b7PfITf0ErrUajHIGBZdCP8V2Bbqolk9ju1NQwt7g4ZTzmqnbsuAXl7Bbs
	v8Ozs3ZToV2PMga0T3uFFJsr+uDDzEty6BG1Hzn34uS0zui/Ag2uLlvOxAxmBFzt
	BOdrvPeSW0ypR1FW5Wr9nNWq4VNe0IE0t52zPZRnjmWe+RQZok2nKwTq+Z/LEsSr
	JEWNroukeRz2iL6CycYLUJ9omVapte/XPS8c8OMcMg+m4YV9hxq1gdnwpsHlffnc
	hKbGNF7kr8KD0DZVe8bPD3DcbwGC8TJ+azLWLF93f/Nfw7eMcbU+UmgXRLCKzyEF
	BVvOMg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prkm7qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:11:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fe86c01f5cso1217024a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740629509; x=1741234309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSAQvsYR3iMFmPabg5DWf8ziRODUsEKRzX7L+bsEUbE=;
        b=OrIr5eh8Bt2rvCWSsTvYdOIiNyO6Nh7SFYrNWCZiXz1itjmJR8USBWFf2T8cY4gPqD
         oapjNaKAww9pX3BoRLl7UbLczyotHq0zPcy1w2MltwmUESRsA0T3uwLMMzpJCTfX09fO
         /M3p3PxXTWuNBIMbreBRk0JoXzhB2wX6wPLfMAPVDXuhXt10UJcQOHjBObU3I7cOXWls
         q4yiXMXr8/4J9YJebB9vdTJNbLn2f7JpoSlz46qnBamEAeBzVaU47G5d8o67ScukIjyu
         C9X/AI3WEsacwr1QY279qIDrUTAZE9tbpUAyCm4GAQgRy2qxCTG/vPyBiZCjEgVB5oIo
         F5aw==
X-Forwarded-Encrypted: i=1; AJvYcCWn5U0vt2fblwJuyFQre9aN+HXfQCVM1B5C1ivNhKG53cFcaUgq/wVbP5/VMkF5Pxgk+MDpQ6rajFn2ukqK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+qRpfODTosKmzdMZFrcv179BBHWNbCMrdL7Uyf2il604g3ALa
	UlyPA21i1Oa1Rob9IXOTPRmVFVyrkxKORtCpxXZWJf/yvNWYjy/hp7oHP7oX7Oe8cF60yNacjHz
	jPSQeiGCwSkr0ggyp9bqrAlWHiChEitIo3Z1qZB16bOVVnF3+sUk+ZUQd2A7FYhK5
X-Gm-Gg: ASbGncstzZff4s2HOab81qtamMamJJgMI/K/ouk+Rc5Dmp4BdAaxR0foVR4CDpDi9m/
	02MoD1WdYk8umK4GpZ/hBDQFNzyrIRdPIcp1+x0fI75tEEC9LqnNXhTl+ysOr8lpeCrEOWXWUyJ
	AhekocyWy4RIUPBmNLwI8va84HHA4sQSCDIEY1wBgOAA8SwCHC/EJnRN8EaeeTmtwV810/XnXKp
	v0wNA6jL7Slk4fb6DrvlRBX6OSKHuH3tJjJxR1zrZrVbDaIbkGZJnU/iMyZ05+4Dw5R+ainVMV9
	UkFrr6aBwKXu9FOJ/czbi9w9Nh6B4FrQKjGhY9DxsVsK
X-Received: by 2002:a05:6a21:32a8:b0:1ee:c598:7a90 with SMTP id adf61e73a8af0-1f0fc99bf90mr16869055637.39.1740629508898;
        Wed, 26 Feb 2025 20:11:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRIX3IkvZiOUdHKEbb1/zqOV6uSSXIJDZqwMP6rxtAvZaceoDHFXvQadYXggDDykHwRSrVbA==
X-Received: by 2002:a05:6a21:32a8:b0:1ee:c598:7a90 with SMTP id adf61e73a8af0-1f0fc99bf90mr16869027637.39.1740629508534;
        Wed, 26 Feb 2025 20:11:48 -0800 (PST)
Received: from [10.92.199.34] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb65sm458168b3a.149.2025.02.26.20.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 20:11:48 -0800 (PST)
Message-ID: <0dffeb3b-63b3-266e-d1e9-b8adda7cc0ec@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 09:41:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 00/10] PCI: Enable Power and configure the TC956x PCIe
 switch
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, dmitry.baryshkov@linaro.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250227035737.q7qlexdcieubbphx@thinkpad>
 <20250227035924.p43tpbtjmqszdww6@thinkpad>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250227035924.p43tpbtjmqszdww6@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9juwefZ3_5Vvlfdm4He74r4YvE-YGRSF
X-Proofpoint-ORIG-GUID: 9juwefZ3_5Vvlfdm4He74r4YvE-YGRSF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=832 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270029



On 2/27/2025 9:29 AM, Manivannan Sadhasivam wrote:
> On Thu, Feb 27, 2025 at 09:27:47AM +0530, Manivannan Sadhasivam wrote:
>> On Tue, Feb 25, 2025 at 03:03:57PM +0530, Krishna Chaitanya Chundru wrote:
>>> TC956x is the PCIe switch which has one upstream and three downstream
>>> ports. To one of the downstream ports ethernet MAC is connected as endpoint
>>> device. Other two downstream ports are supposed to connect to external
>>> device. One Host can connect to TC956x by upstream port.
>>>
>>> TC956x switch power is controlled by the GPIO's. After powering on
>>> the switch will immediately participate in the link training. if the
>>> host is also ready by that time PCIe link will established.
>>>
>>> The TC956x needs to configured certain parameters like de-emphasis,
>>> disable unused port etc before link is established.
>>>
>>> As the controller starts link training before the probe of pwrctl driver,
>>> the PCIe link may come up as soon as we power on the switch. Due to this
>>> configuring the switch itself through i2c will not have any effect as
>>> this configuration needs to done before link training. To avoid this
>>> introduce two functions in pci_ops to start_link() & stop_link() which
>>> will disable the link training if the PCIe link is not up yet.
>>>
>>> Enable global IRQ for PCIe controller so that recan can happen when
>>> link was up through global IRQ.
>>>   
>>
>> Move these patches to a separate series.
>>
> 
> Or you can just drop them. I have a series that adds global IRQ to most of the
> SoCs and sc7280 is one of them.
> 
> - Mani
fine for me, I will drop.

- Krishna Chaitanya.
> 

