Return-Path: <linux-arm-msm+bounces-44591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC85A07865
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8FFF188A0FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DA2217678;
	Thu,  9 Jan 2025 14:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6uhk/2n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CFD218AB0
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 14:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431267; cv=none; b=Ywus2bzq8yQV0rdLpu1HhgXlQu+JI/YEvIxXBUiWNeo18t31KbBsPXDmb1WgzbgGlhr0PbkYwEN88oyufrAwGlotS4HS5lWPY0T9hQyR/x+7LJx68NfJhcQIc23hVgfe7kLRqQW7s4/1STFrF/gYh28he9wDfpgJ/lavJ2R0Npk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431267; c=relaxed/simple;
	bh=l6UVbc2uzhXYmH//MjgqMqjwhjTVWCpZK1j72rME31E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+pDCtEEwzVcpMVUwBgQnKGVK3P/zIFulZ5ZMA2arxYGl3PGtAzN0F8/HOlpjsH0u/b+oZjNzuXYIkZJXirvmE82xZfWhszidUQk8rc+MXe3jyRotU2j/IqJBiI+ozNTsG7PRkB4wwijeQm+Gf61UoZQI+LGu8tsuorXC5BW7ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6uhk/2n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094gaWv018052
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jan 2025 14:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vAxFdHMOHrEq4Dia5Np/ZJA+SYjAGYZ0Ly50wtKULDU=; b=D6uhk/2nToZpK9a+
	3GUDG9YiPdBA65AI/n2LLKztbnM8u8i4RpQDUklt74uJLsoiGn6FsgadtSC5RgpI
	stULl9crZkykf1DdMHWCWf/GSIyFyQYRScNrX7ARhyG41prJ8dRmBLpIPpPkLxZM
	K7+JfN1zqZQSZ0+i57J8J5P4cGUF5L9+uWpE7UQAY+PjQhUa4PaZQ5aKAah0ZRM2
	HVQnBaXnaQibSolYo1uzJ3pA3V9z5ZUnowCc5AVWPRbVz3rXpPfWPvVuCrdOOgDg
	IyKo+W17qc0BE/gkT/VLRQIj2tuzxwx6uh1sjfF/nu1KoOP6jii22WW5pqxwXjPE
	Y7qCCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4427nws8bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 14:01:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467975f1b53so2288751cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 06:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431264; x=1737036064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vAxFdHMOHrEq4Dia5Np/ZJA+SYjAGYZ0Ly50wtKULDU=;
        b=XTAfRUzclHwbiDxnaCfFl3vuzDrjZKOEyOsBxAueDunNDWR6W/AyX+I3A31kCFJxsb
         5K2HSp8a901HJy1ORryOCJr8rzhi6Ei0lrO3DCxQrtrSlJqvyGVcDE9ckDsrJgMTDpxm
         GDmEJHs9tfh2DZNvXyz7Htc5gN9+hayHVlDwSEPb52imnIscJbi0KcpI8RovyXuoqKmm
         hLXjvPfXz/cZXbGEa32uZIqqYN41i7WcAYhxSqlCfv48lUsCl7HkHppOPp316cYbIYvZ
         GADTfO6qQfLqiH4Cd4RsT7w59eF/+kZZYgHfH1pQqoQgmAF0fWCRDEunMGmqeVnvGbTc
         +D9A==
X-Forwarded-Encrypted: i=1; AJvYcCVyxVA99agmZEERAUJNbUG+kfi3OpjZGeNlGLH3e1YktIProUPdPJQsPc14a3lei7tGyhbiRtV1vdEndQnR@vger.kernel.org
X-Gm-Message-State: AOJu0YyanH5YSCa/Y0m0KSz4qDUTjZbZQBL3hUresubSQMWc0JGXaGB4
	Dq5K6gYwJHBOsc+YtVLTb+Hdh5z23vB3XOYrMHyqjo9RHNmfRR4GpeVnIQKkfMa7jMLNMbX9C5v
	/9aLVMcit9cRnU2Xl3dlupt+/n/h0rpiWhQl4r2sQSIR30DuUhf/TYeg6KeQ45kJG
X-Gm-Gg: ASbGncvGm6tobiz1zp13bWtJBpGiRpXtW/NXSBFsBIhp1fXBabrfLjUu61cLERfvZS8
	7J+yn7AetRAvqh/SAZ4HshRfiq7kKowCvZCATS6GZvSxcbh/CGhrQEuQWHpBay8abidE2sUm3Vy
	J0weqAN8RE1cFJcs+hjgW4miGuysVfIAX72+7sO7Ob5nJcsRReooDFk7hx22NerSeJ5HXim3TjY
	4+D5nfqefmZzaArc8eVLQupwFJ7L/nNarDvDu/XwUBtBCd4BOb0CeKgVuDAXwW2bWAqY20bpmg/
	6X75QkrxjUMs3u3PZzotfk+nM4qrYjoP4dM=
X-Received: by 2002:a05:622a:1a0b:b0:467:652a:afa3 with SMTP id d75a77b69052e-46c7108fd9dmr45576811cf.15.1736431263728;
        Thu, 09 Jan 2025 06:01:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgopU64NJY6fiRcx4PTa3yR2N4z5ec8OjnHcKRFh/0XFwlz1n0lwhiZHAN9Y+7kKmN/ICYow==
X-Received: by 2002:a05:622a:1a0b:b0:467:652a:afa3 with SMTP id d75a77b69052e-46c7108fd9dmr45576621cf.15.1736431263300;
        Thu, 09 Jan 2025 06:01:03 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905f067sm76216966b.14.2025.01.09.06.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 06:01:02 -0800 (PST)
Message-ID: <80486250-2172-4911-93bc-47e2944ad681@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 15:01:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/2] soc: qcom: rmtfs: allow building the module
 with COMPILE_TEST=y
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20241202094903.18388-1-brgl@bgdev.pl>
 <3b99b4c0-5880-4ee8-bbec-d07673d9ce11@oldschoolsolutions.biz>
 <CAMRc=MdtbgSuwjv_h7+VVr5U2frc24NYmpifPQJ0O0iQt_sWKg@mail.gmail.com>
 <411d3601-be05-44f7-8e6d-614a0a387fc7@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <411d3601-be05-44f7-8e6d-614a0a387fc7@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OOK2bAg8IBL6celztjDGsJl5Th7bMz7a
X-Proofpoint-GUID: OOK2bAg8IBL6celztjDGsJl5Th7bMz7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090112

On 9.01.2025 2:27 PM, Jens Glathe wrote:
> On 09.01.25 12:13, Bartosz Golaszewski wrote:
>> Well, that's weird. Are you 100% sure this commit is the culprit? I
>> have no idea how this could happen, it's just a Kconfig tweak.
> 
> That's what I thought, too. I merged qcom/for-next into my branch for
> testing and adventure, compared / merged my dt's that were in both, and
> then this showed up on the HP X14. On the Snapdragon Dev Kit all 5 eUSB2
> repeaters work regardless with the same build. The chip in question is
> the SMB2360, a PMIC which also contains the eUSB2 repeater.
> 
> jglathe@sdbox2:~/src/linux_ms_dev_kit$ git bisect log
> git bisect start
> # status: waiting for both good and bad commits
> # bad: [a9059ebc60d5b845a95b25650eb24c1df5ed2132] arm64: dts: qcom:
> x1e80100: Fix usb_2 controller interrupts
> git bisect bad a9059ebc60d5b845a95b25650eb24c1df5ed2132
> # status: waiting for good commit(s), bad commit known
> # good: [2bab385991536a07d6f4c0970fa665f9626db059] Ubuntu: rebase to
> v6.13-rc6
> git bisect good 2bab385991536a07d6f4c0970fa665f9626db059
> # good: [2cc57105ca61b9fb3744adbf83bbc8b2c0c0d055] johan_defconfig: add
> custom config
> git bisect good 2cc57105ca61b9fb3744adbf83bbc8b2c0c0d055
> # good: [260e63d4eece13d5f908646b8b9e5af44a40d012] arm64: dts: qcom:
> msm8996-xiaomi-gemini: Fix LP5562 LED1 reg property
> git bisect good 260e63d4eece13d5f908646b8b9e5af44a40d012
> # good: [033bf6bd4e245be05553ed1ec774dd78c77922ec] arm64: dts: qcom:
> sar2130p: correct sleep clock frequency
> git bisect good 033bf6bd4e245be05553ed1ec774dd78c77922ec
> # good: [76f8b9a9e0d9fdafa6103ea789865dd6897f3bd6] dt-bindings: clock:
> qcom-rpmhcc: Add RPMHCC bindings for QCS615
> git bisect good 76f8b9a9e0d9fdafa6103ea789865dd6897f3bd6
> # good: [22507018ce51df4f63a5ad468608426bcd799e2b] clk: qcom:
> gcc-mdm9607: Fix cmd_rcgr offset for blsp1_uart6 rcg
> git bisect good 22507018ce51df4f63a5ad468608426bcd799e2b
> # good: [8db2b9a883cbb85a189ad74c3fb3264cc54134b8] soc: qcom:
> pmic_glink_altmode: simplify locking with guard()
> git bisect good 8db2b9a883cbb85a189ad74c3fb3264cc54134b8
> # bad: [17f8cef45b6a390dd2216d28290c21a92c3e3ae1] Ubuntu: Update changelog
> git bisect bad 17f8cef45b6a390dd2216d28290c21a92c3e3ae1
> # bad: [1c51ac09700c1722329672f6254dca78fbc32101] soc: qcom: rmtfs:
> constify rmtfs_class
> git bisect bad 1c51ac09700c1722329672f6254dca78fbc32101
> # bad: [d6c656205ae9eb32dce89df95faabe898029e668] soc: qcom: rmtfs:
> allow building the module with COMPILE_TEST=y
> git bisect bad d6c656205ae9eb32dce89df95faabe898029e668
> # first bad commit: [d6c656205ae9eb32dce89df95faabe898029e668] soc:
> qcom: rmtfs: allow building the module with COMPILE_TEST=y
> 
> I have put the tag up on github [1]. It _is_ odd.

I think I've seen this issue before. I'd bet it's just timing.

Konrad

