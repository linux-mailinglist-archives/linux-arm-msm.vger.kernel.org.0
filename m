Return-Path: <linux-arm-msm+bounces-41774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 547969EEE16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F0901636DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F8A222D70;
	Thu, 12 Dec 2024 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSf2LJFP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD5C215764
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018477; cv=none; b=uULnJUEemQilP5qwQlTJnEab0As8N7/bd4jrqg8eZs8/vqwLmVDzFYIAUE29hop0x3q34b86x9n26/oVkFa8yh7gscgrA0TmSQkMrUimDQ19eb0PgAZCvwHSa4ZM1uYdZoSWzTsMpIkCwACuEztr61eUw2ib2Kj4nzPZEJk9Ye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018477; c=relaxed/simple;
	bh=JRUrY4w4rGls/uJtVfSS19+b5gWlwP+rEoxccPnxBto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1f2KSfRNaPbQnEBGo54MA3FI3faTuViCMdhmq7kfUs7pQwP79yud2jYc047AnrLkLGsogQ4o7QkWH5ZLyrXIe3daBmAbJrxuICyLFZH4cuhKkkqXwgOOYTT6Wz/G7tf21A6k3oTwtb5hXU9Nc200pnSxYK5vUw4fz8VtPYboOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSf2LJFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCDEiE1000539
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8eLOXkCeC0DlQZVU51a+KZOt4UMu9djdUd60zKv59H8=; b=PSf2LJFPyGwGPl91
	Yn+u/JqMOWQDfjTj0tW1z1xXBA0Y7dPxpR+t9SKZu7MI14w3rI1WohqnImIZ1sAV
	ul3Iziqstscrkd30PH6Ob/1cvX8wSi8503vDlHlz2h4K+cIOerGkqXH0+HXAaCK1
	vlkEJ2IXkz3xYBJFKb71SSFxTOs1sGQN08a1mmZYn9IzT8lpy6VrI2E1/m0gDUBM
	xZAYZxl2RTESRj9ndv7zbozC9E4Kpjz3BZfZb27aIUp84MJr/CNApWYYVzyjbcpl
	Nk9viNrip8qmNYi7ZlxMPPink6Xs7d8b8kc7WBd61ud9c4DXAYSnGgNM31Xah4ST
	2pdkeQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes1yfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:47:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4679d6f9587so1404051cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 07:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018473; x=1734623273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8eLOXkCeC0DlQZVU51a+KZOt4UMu9djdUd60zKv59H8=;
        b=LWD8xtKdwPziSmDToxGZJqIrfC/7powZPlgS+lPADIuKi4sUiPMkRGROpXADNWDbZA
         pIlzUQyzCCjhbg+nRj9hcApjKGkz8szDfKxGpWvUTyFjY8P+IsbFo6Su7MmwtoBEEaK2
         Bxo5OfMeaFWbhAKengd1d8OsvADNPNkbBrNPweufayLkcATGJQ/U9JldncsIAbm7jtLE
         sQuNUgDYV3I+XmpVgBh44x2GuzdZpu7jz6+QPKZ6Spgt0E9Dm3S44r7Tep6fMLA/bcD8
         3QhmbVVGN+daCy3IKS7w2VWSNlLzE0iKL084c2OHAH/Uj8JSmCHSizAVOWrJ1jQkjdrS
         BgiA==
X-Forwarded-Encrypted: i=1; AJvYcCW8+kqlS6cqB+w2wypV5RzfPdNNF7c3sz7ZPgXmnzIXtei+vlnfi+dS1NYyCdc41mNmARF16By1rSWb3leT@vger.kernel.org
X-Gm-Message-State: AOJu0YwsX4RS9LitteuFEcJp0D7Sd+2/BWs2t7S9BZGQpq0vXIXz+FiU
	XCQ42goUXLdyIJtJQql3Jw756SeC3rgkiEajkyj51ewI2GIZddbEhxORmMMiJ+vbfJEj+nbUNCn
	G+4atCDYlFVgu0d/D8YXwwQ73Ug3oxqpoLXt/Sqs6s9xAcBwgruTTWrs5f20HFnCk
X-Gm-Gg: ASbGnctdTzHqGBq98l3aNLrtEXjGKhn5BH0l/gjgC0BL/CqON/YdCub7iNIKBo4Ao71
	/eUAnWfeNePNUkF3SEnJWgz9Wy8eD6h2Ztb0WaQJofHJE2jo84QP3fI+TqaM8ls5TcWwxspXGhl
	Q0nZG7AHcvuL0RjfIGOMjigDNO9b+QCUR/Qubq0ePT8AzTbjZ86jZu6XJRASJL957wabWiIstvJ
	/ZUvclCIft33xu0Fm4WH0zRr8LM3NgJ6BHQIs/PzuOGUvSq7HewCo/7c3lHnOPhEclZGItMXybx
	mKvVChmNEdpaffBMy9ysvxmsuDBNmKchg56TRA==
X-Received: by 2002:a05:622a:a:b0:464:9faf:664b with SMTP id d75a77b69052e-467a14cfd41mr3889251cf.2.1734018473253;
        Thu, 12 Dec 2024 07:47:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXwZ9ATJawzq2/gDuuZrX3rouLOdXBu6sOMLvS2WbAH7jQqNN/imbNCFi/63dfoNHWb1jKmg==
X-Received: by 2002:a05:622a:a:b0:464:9faf:664b with SMTP id d75a77b69052e-467a14cfd41mr3888991cf.2.1734018472938;
        Thu, 12 Dec 2024 07:47:52 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a25cdcsm10493167a12.9.2024.12.12.07.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:47:52 -0800 (PST)
Message-ID: <bac71d27-c96a-45f1-b3ed-85f917ec81b9@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 16:47:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] arm64: dts: qcom: x1e*: Fix USB QMP PHY supplies
To: Johan Hovold <johan@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Xilin Wu <wuxilin123@gmail.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
 <Z1g_nFhYXrBxHtrb@hovoldconsulting.com> <86ttbbsm69.wl-maz@kernel.org>
 <Z1hgW-_pqqCpIwH0@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z1hgW-_pqqCpIwH0@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J28vM-U9jw074JAkZZOtbBS_-fRb6IO5
X-Proofpoint-ORIG-GUID: J28vM-U9jw074JAkZZOtbBS_-fRb6IO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=966 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120114

On 10.12.2024 4:38 PM, Johan Hovold wrote:
> On Tue, Dec 10, 2024 at 01:27:26PM +0000, Marc Zyngier wrote:
>> On Tue, 10 Dec 2024 13:18:20 +0000,
>> Johan Hovold <johan@kernel.org> wrote:
>>>
>>> On Tue, Dec 10, 2024 at 10:07:31AM +0100, Stephan Gerhold wrote:
>>>> On the X1E80100 CRD, &vreg_l3e_1p2 only powers &usb_mp_qmpphy0/1
>>>> (i.e. USBSS_3 and USBSS_4). The QMP PHYs for USB_0, USB_1 and USB_2
>>>> are actually powered by &vreg_l2j_1p2.
>>>>
>>>> Since most X1E device trees just mirror the power supplies from the
>>>> x1e80100-crd device tree, this series fixes up all the X1E boards with
>>>> the same change.
>>>
>>> Nice find! I've confirmed that this matches both the CRD and T14s
>>> schematics.
>>
>> Can someone with access to the schematics confirm that the devkit
>> indeed has the same supplies?
> 
> Sibi, can you confirm our assumption that these definitions were copied
> from the CRD devicetree and need to be fixed like this also for the
> devkit?

I can confirm the fix applies to devkit too.

Konrad

