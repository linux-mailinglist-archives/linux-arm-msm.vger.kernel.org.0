Return-Path: <linux-arm-msm+bounces-78877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06629C0D494
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2AEC3A5298
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 11:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762F72F616B;
	Mon, 27 Oct 2025 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDTsJKTw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724802FE07B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565614; cv=none; b=uNCJpNI64yhl90mll7tzqWWQhkEmQpzBeO6ehW7g43+KS3j5eue5NxcyZCO72Wbcy7dIJs13rpv81x684MVmpOsbKWefdd7IIXzr9RnY+prL04m+LFdeYe5ycH6o2EMpOEUyoqyuqv4RxjzE13U2R45sGBSrdCidedIY9xA10zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565614; c=relaxed/simple;
	bh=sLSDLFIycjwi5DUJiwWXROI9mVj8Cx9y+PjBFCqILz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q3h+Bu0lrSPcfrG8tq5LgcqcY5lxrsZywCVTSOJwsQeOgWUz29/uOeC86Hu+D45d4/8Z9m0kqO+cx5JgT2TfhzLJi7dgb5jghilHXd59E6gjDnQblqMughaLBWS1QXYqsSoBGWsz+GqBWR/CAYUCGtz/23IgKYG+DHq3/u3IeFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDTsJKTw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R84eUn2232087
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y7FbXOdWgkLEaT/XePs73VoA0pwHdHNIszOesKkyl1U=; b=pDTsJKTw80qZEM4p
	msAQKifurwKK/WOXlgyv38815ZJUFoANG8Cc8zqw/J+YarWrJfnTp3vA/wlE+A0p
	vxFIIzrevW1+Q3N8+INrtIbl3oGmhjApl7fnxMqiLXtignZxraQMijGnn1xBmgRd
	K+5HiITBbY/e91hsmmExAvMDyRJ0GoFjf9oi95UO4YthG2NkFYr5DK44uAe9QiEo
	bjjXeAdbSqWXc6KFaeY0eCPSGTa9JfgX++5gWB7GDZWKbAgpbPAQ3Bb45YiqPhMC
	kIw2mhqLE5ilRvWgLO15oscsRYYkcYCFyRForsqBfTwpGtws0tUVM0TA4J5nESaj
	DaP4Dw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wn8mgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:46:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87ff7511178so407156d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 04:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565609; x=1762170409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7FbXOdWgkLEaT/XePs73VoA0pwHdHNIszOesKkyl1U=;
        b=NSZMEjMEaUcdX33AVDndoEmBRPTYTF/43rexMkx6xhzSlnBFSTRATctb25g8qwXiru
         tXDeilg7ki/Sp3UZM3LHKUqBZSpV396NjQoi38keiJorbCIv3kK/4TKElls/oV2SlDjP
         cR6YnuQblgDpHAxNH809PyHbn6ma8IABB9vKnlE7+/IRIW7D7MHcCZqtVYzMbqrcGKYe
         MIYE9w3ZgyMPyERTrM3jPlO9eWdHplh1dhwCtvc3lm96vv70e7lA+YQntANwOiaINnQv
         OdYfHVgUYap4SGx6DlSjyu2odEb5dP/qwutrxVmhU4f700yaLFaOHhZGvNkxsgDlkaP8
         yuSA==
X-Gm-Message-State: AOJu0YwK4rjFlS1vJ0i5lQp6kQUl2vDQGQyDzQpMOT5k2NDlpcskjObE
	l74E3Z5YOP4vysME60M+KKcjtMp7vcViAMk/YBSFxjg908tZF+zurGyPYJewW1tHniiRCDSwbMX
	ARratbWQk6n+bbrrNnw+dpIv5XIpD0MONBWrI7no5lJfYt99O7u3ox+ulIlDOExQENi3t
X-Gm-Gg: ASbGncv+yGyrJtIC17dbiWMWlypN/OciDLMi1cOSP7eNsEoz8M5aZZu1gUp1wy3sIXl
	seGVsHR7GSSQrNViMvkfsngrNiZH6sGqYgXzQ4Vl3x6tpSyKoXCVW/1An3fUhohfqaRUg67XOEd
	HSRUsiuhNGThjRYW5CuvndTLegPMbVQyLnpnzR4n7ArDRk+uJzRoERGcnXWLH5amXvtGekhLuVd
	BQ18Jdm5HsTOskDsvBzgOakONJAe4HLnY8us0QHI5qFFWhL1BIIb9sz7r6XfrvZ9eIYqbhaj0wy
	KgOnu8u0jTC5rYb3G4GIe3h/MHGs+PB4IWBaWORFlG2oJOaA/2+ci/FACqNSZo/Pf1sdSGdI8yu
	55FFRWEo/F9bes5Bd8MmCQxpTmj3v2mphP5pgiJC7T/F5OuYQC6gqM08c
X-Received: by 2002:ad4:5b87:0:b0:801:2595:d05d with SMTP id 6a1803df08f44-87de7138a5dmr193035536d6.3.1761565608838;
        Mon, 27 Oct 2025 04:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcow6r/0jMtGxR59KvnFS4Y/c0woofpjI9qJZXXjOHBNMXUDWc9LAIdY1pVDEfhj9Vve0PMw==
X-Received: by 2002:ad4:5b87:0:b0:801:2595:d05d with SMTP id 6a1803df08f44-87de7138a5dmr193035246d6.3.1761565608298;
        Mon, 27 Oct 2025 04:46:48 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8ceeaffasm671391966b.45.2025.10.27.04.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:46:47 -0700 (PDT)
Message-ID: <22ad48ac-e054-4f2f-a5a5-8047266ff4cc@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:46:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Modify USB controller nodes for USB on X1E80100
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20251014022121.1850871-1-krishna.kurapati@oss.qualcomm.com>
 <d0c18094-7234-450d-bd9c-e9f545de31e2@packett.cool>
 <81367b57-f60c-48a6-8a59-7e160c312686@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <81367b57-f60c-48a6-8a59-7e160c312686@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=68ff5bab cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pqnWh8UqMPAkMZ0kC3QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: KOdX3lgn5wt7Ni86v05WRLRMSN7EhkvJ
X-Proofpoint-ORIG-GUID: KOdX3lgn5wt7Ni86v05WRLRMSN7EhkvJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExMCBTYWx0ZWRfXxRjuDbN9bwIC
 Ph++bT9odS1uHlvzUNhfrEaBr+vv7hK/MLgsDCZdA0hKEgYXHYXkc0D4lLHMBZFD4TS/hgtgPi+
 WNZy2znu/ARx5WSwvG2kb6TIxZoid56ohCGuJyofqdWIx4/2qkJJDP9edbBgDWNSxGozXNLRuDv
 A30kmJVPxRYbYY2q/0dkzMYwaGf8VuEVxnimUYDTPnxm/7UCd2YmyeJh/CuORA1Xwd4K2nFug+1
 lIa0zp/+cy76It3Tjq6bQZ+66mYJqUjHYimUIAXMRsvSh8T+a0VziW9GKIO07EOwLrrFyP3Zt/D
 MhEYzfKFtCjbkZdZwaEzOUZRriBUTo1qY/fJ0AEHBObMAFaqhxS10j/FMhkrTFIe1OFQ9V+3Lrh
 1LzsMyGjfDTm7B4uZSvPDqkYEnElsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270110

On 10/19/25 1:35 PM, Krishna Kurapati PSSNV wrote:
> 
> 
> On 10/14/2025 2:30 PM, Val Packett wrote:
>> Hi,
>>
>> On 10/13/25 11:21 PM, Krishna Kurapati wrote:
>>> This series aims to flatten usb dt nodes and use latest bindings.
>>> While at it, fix a compile time warning on the HS only controller node.
>>>
>>> Tests done:
>>> 1. On CRD, verified host mode operation of the 3 exposed Type-C ports
>>> and enumeration of the Goodix fingerprint sensor on the multiport
>>> usb controller.
>>>
>>> 2. Modified the dr_mode to otg for the first 3 controllers and
>>> verified role switching and device mode operation on the 3 exposed
>>> Type-C ports.
>>>
>>> HS only controller was not tested on any platform.
>>
>> have you tested suspend-resume?
>>
>> The flattened dwc driver seems to break it for me on Latitude 7455, upon trying to resume the screen never comes back up and the system just reboots from zero in a couple seconds instead.
>>
>> I've looked at the code and I couldn't find the cause so far, but it is fine with the legacy driver and not fine with this one :(
>>
> 
> Hi Val,
> 
>  Thanks for reporting this. I did test runtime suspend resume on all 3 typec ports as mentioned. But I didn't check system suspend case.
> 
>  I will try to reproduce the issue, fix it and then resend the patches.

I can repro on the CRD..

It's the USB3_0 host that causes the issue

Removing the clk_bulk_disable_unprepare() call in dwc3_qcom_suspend()
helps..

Konrad

