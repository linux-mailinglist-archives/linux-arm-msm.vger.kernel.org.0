Return-Path: <linux-arm-msm+bounces-55472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F4FA9B512
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 19:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BE457B71D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 17:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED1819C540;
	Thu, 24 Apr 2025 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AA9O/wDP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCD628A1DF
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 17:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514792; cv=none; b=tfy+3MjfCpLmAcQKxYkfw2rKFSpVRS1QANm83BkYgCY45W9Mtzhw+pSZCFzD5to8Ijt+8pVTEqrzOOGTHxHLEsOHRf8mwtZLkHeN3oTQTKW9ulYb6l1KIM8g9nIHoNcooFkdfzOcRju/0BpvlgEXDDTkQV3ro4kG9QzIk9z4kLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514792; c=relaxed/simple;
	bh=JQE3mBdHEHFMQzAYutq8p3AN1+1LsUeaQd7+qm3qC5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c5fCwv3822L7yI7ixxJjLOxceFgbaAwy1oS1maW/9yBogGsKrlD6Otflvc5D6ZJswOWpltU5euFw1oTFtXdtkfwbUnvaWb1xPlX+dg86Gdw3HwBPeP94EMd7jEitu/NOF1tQTyK7SLeanmRuzxKrtbWh5U+oMs/yOoWnJsJz9jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AA9O/wDP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3FMk018488
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 17:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQE3mBdHEHFMQzAYutq8p3AN1+1LsUeaQd7+qm3qC5g=; b=AA9O/wDPa+nYPvVI
	R4eEslFYfvLM1An7w3T8bZ2pTX0nBASwy5MwVVj/ZIIKaap1xf9/E/v72dJuPRTR
	Sp9cJAALFzkQOOkV5rK+7fibzQU6Y8qid9x22TpViRoVywQHtGWu8lhfBkZ8xTl0
	1ya2vrJ2FnWNnATs4a3fwLtbXL0GBCedyd4Ot6orEGPQzIa510z8ktjSywE1imU2
	NObbwy9H/BQT41Y6TvVdPX3kM8ATat3sSEFEdj1TqBb0OUmixgnEsAyCDqwLvP88
	zRq3wBSX26DpJkxJAGdaxxqTlWQeeOI0lgyFGa0qKu/NiIvxqH6bL7o/Vu89YopT
	pS35bw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3pb1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 17:13:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736cd36189bso1664547b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745514788; x=1746119588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQE3mBdHEHFMQzAYutq8p3AN1+1LsUeaQd7+qm3qC5g=;
        b=EebBH8r/xp9jTBHgW5vo1vXyG3sVFDYjuT//kMRUyVRIRURkmxETNavJz/2yucxgr3
         u7dXYJZpxPrT1jOdQ6PtTG8ZdIftQy2Pu9J8jX438bxJsetsxKPKTDLY0LHP8EL05RJj
         E801wyjaqqfxJX2o2px/5ZxBq4dtAostqzwPqKj9W4xq8j8x96JFfqP6GYME7Z3eXTQY
         UzNDSDc+nW7yNchHFzmreoSUdFAQgFL0oa8w9r4zj1H3S+hGSDtQB6N6bQToRW3IFaDj
         qYeb8DH43Nyq/QTVxhGyrpZzNKJDRHyu5JXVfB47zhN/TDAizGTFWMKPyl+gIxp0ew0A
         BjkA==
X-Gm-Message-State: AOJu0YxsYnPGtDnecCQNqeUrVaCUnW0E+Le7t8hzi39wihrh9o9mmkqv
	FxrN5Iu/dMwlftfFJjJZ7H4AF7dj4cepU9HG4t0sGM1fmXqs9f2ab/SZjxGaqsQ/OyoUSZ7CX8v
	jPcria/gXyiS+mEklUIytvHw8GRa6BajgnExXnknf8CeqjN5ZOY1isq+qLHiN/Wey
X-Gm-Gg: ASbGncvpZme4tkuMpBbxKBCHr98Ps9iUV9EOBYhzjsxss52jrn0xf2fkGb4hCzmumXi
	BKyR1NbCWtGhsgAAkAdK24IBomIQwsG86FJD+g2+iLJfu6CpogjGSU74Jrs1ByqitghaW7v0ow4
	cda+sc4gG3CSXh+4/bAi+piY3NbUxoLMWnKSYCBgtKBnXp+a+GIditYvc7W9HW/iMxhJKsGLgxD
	fy00/UBhkZME8OplqlBlQnUnMzrAFrtzUfibpUGFaytP6mgrutjucZhWgKuwI/BPm+IQj7m7Sj+
	xEhE86MCgkNE8eGcSs5fQDIdqzVPJq56fwD91yoyyGUkRuZJ0LllFbNbbMHW9Y7MO/g=
X-Received: by 2002:a05:6a21:6814:b0:204:4573:d856 with SMTP id adf61e73a8af0-2045658d414mr151665637.4.1745514787717;
        Thu, 24 Apr 2025 10:13:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBh6UbSZ7iBiPgDos14/2qpkdyV9G45BXz0sSqA0pmze/jGYg7FVG3UwSnpX6n3qo0KD+Oxg==
X-Received: by 2002:a05:6a21:6814:b0:204:4573:d856 with SMTP id adf61e73a8af0-2045658d414mr151627637.4.1745514787332;
        Thu, 24 Apr 2025 10:13:07 -0700 (PDT)
Received: from [10.71.109.146] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fadec8c0sm1502146a12.68.2025.04.24.10.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 10:13:06 -0700 (PDT)
Message-ID: <575d63e7-f390-46ef-8687-30112849b442@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 10:13:05 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] arm64: defconfig: Add M31 eUSB2 PHY config
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-10-25c79ed01d02@oss.qualcomm.com>
 <2d01bcd6-80e1-4c15-ab23-b5ea5b90f2b1@kernel.org>
Content-Language: en-US
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
In-Reply-To: <2d01bcd6-80e1-4c15-ab23-b5ea5b90f2b1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hR23xDSKrRgjToF4MilC8YY1KHwby1PJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDExOCBTYWx0ZWRfX1RUxPnGjhioi 14faGhMDt2RpBPSsO37Y5o1M01yopYjuXelsSDYy0VzHrIXKrDpFc7AaL5pqfSMEggAefQ2+peD 7a+BWGMH1UV3OgnAio4qPYsoasZH+hrhTHjEqFxU6f6Ae1qaEan9LFt3kQuVGASlqt0ha7XWWCn
 1/8eCVnkXWsP9xvgbyGpkxkH2QbtrRcGz22m+gIwZW89Fga7poAfWZFCpvLEK7xIvVBPw4k6JGL TkoBOnmLBgj88HXgAqpoQ21DBr5W/VzPMoBw1IV6/03b5CgP1DcWS42oftafFZ1m7yM7YX/BlHa PW+5eObriv9B4cd/HU8Ttbm6r6D5Wd7yshVrozaKd2Fh3i8euhUcdGSvONsbY3W4DWHr7QLBGj7
 9F+nOa7gUoc/zsLmLLxpZAYX7RUuI24d+UCTIf6gaVgUY8kEvx43cQmdaBNCQ0a2MDSc2h2O
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a7125 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=SMseXh0oWhwDNy9TrckA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: hR23xDSKrRgjToF4MilC8YY1KHwby1PJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=770 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240118



On 4/24/2025 6:16 AM, Krzysztof Kozlowski wrote:
> On 22/04/2025 00:00, Melody Olvera wrote:
>> The SM8750 SoCs use an eUSB2 PHY driver different from the
> Qualcomm SM8750
>
> That's a defconfig for all vendors.

And...? Apologies, I understand what is actionable about this comment.
Please be clear what you want done about this.

>
>> already existing M31 USB driver because it requires a connection
>> to an eUSB2 repeater. Thus, for USB to probe and work properly on
>> SM8750, enable the additional driver.
> Commit msg should mention which board uses it.

Sure thing.

Thanks,
Melody

