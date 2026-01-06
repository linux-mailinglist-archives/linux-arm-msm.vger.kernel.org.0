Return-Path: <linux-arm-msm+bounces-87606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F7BCF67E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 03:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D20DE301AD3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB23F231A41;
	Tue,  6 Jan 2026 02:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4Bj5AYK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDiejOeI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8F713FEE
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 02:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767667181; cv=none; b=FkGIXRHl6opvz/dXmgIQ7zO2cbJ2cXl/M4FVwcjXH2UW8Ue49FvnQFoGj6yNfxjqHtuKCNJPF+/ZzQblJ4ClFBuA1jZvM/gCd2C8kwN3mz9r1Ftm2MZVD166ckka/At1djpHYgVtknWhcsNw/WUaSMpl41R0hzapERTBQC0WHsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767667181; c=relaxed/simple;
	bh=hTB4fD+SnIRjCI5Os57oYczxRZilJ5YBn87gFUYBfBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKq4cerTMhgVyaLvTecF0Bzp02D6+Gl2KnV9XhI1u9l0DlCCLck4zcEwYHbqgchvUWDrTDMOApf3oscRimc7iAFLoTnnvWtS0tIYXdMjknE+Tar7YtYC9Z4xUlDwl5V5nF3JDxrtgyp3njLNHXFGvOIvCms/16b8RYw+1smRzhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4Bj5AYK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDiejOeI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6062BXfT2765596
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 02:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NltUFZ8Kvfxzp9EkpX/p5NI2dH6GPKLbj/KuIpRee+Y=; b=A4Bj5AYK1qll9esB
	coqnsbQlsA/anrdwLe2zXCUoA+85ai2ibTvfNj+OBaA28KiYtwj0znh+68Aay//4
	svbqGF8flAdn69Seq9GLmQGWdzqAH5Bw+7j7qO7aIpcuOf8aJ35uxUt4Z+ejCcsN
	Ru36Ciew1/rYthDOcxqG8JMo7JINKXtWugeulDmblssfg5PxDapCT1UpuMSSKpql
	rAuv0fQYVWKehVw8RIG6npmDB0DcQeJ2TIZDTq4XvblajchImm4YdH1qQmWAammQ
	5mlrGkYUgJ9hH7RTXot4rdR/Ws3lHsfrB7N/2eJANHwFCA91gudmuZ8aemDVuepE
	8ruryw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgscy8292-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:39:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bc240cdb249so443279a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 18:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767667179; x=1768271979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NltUFZ8Kvfxzp9EkpX/p5NI2dH6GPKLbj/KuIpRee+Y=;
        b=BDiejOeIkJ40hNdczx3USrlzVGEJQELsFPwLyaW8Y5nQSyxp2PlsB0NiVvIvqvUzV+
         HiXmnQnnqIG2QQUP2oHI8i+cuQ0mRBQTYijD1q61glRLo79t+fW3LVL1lUXoRGwkXdJm
         N6pc3ObrLoSS37iH0FCNLBvZyg4Mh4g+djlZWw1lNbEgab8Hbrjleo26bAAy4L1wvE97
         5K09NSzF0NpYPUl5vRiqUj5ANLJY0HhSM4hmvMHBMGoNR5MUuVnIuX4fYGfxAFVrL5EV
         ICwc1HUcdsdyvEN2oPyL1Ll75qJTDofbtxbreG/5Eroa9iIkLKRhgdHQ6lPUcW7LptXi
         Z0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767667179; x=1768271979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NltUFZ8Kvfxzp9EkpX/p5NI2dH6GPKLbj/KuIpRee+Y=;
        b=XihAQferMstNyxxw/BVY2TYccTR04Xvah12RVgQx41XtIUemjxljzYlqseu17xKM8N
         PHlGaeYYHg1T0DVAnIhyrdJIUuoqGvA3MPY507TTSvteJPviZVVq8fY5agARhtGN+duu
         gWYNm66n6H8TVHXAGOfU166T1mROVfOEhaKxPpQhzxTh9OBBfY+PCZZC2U2qKgTcqnrq
         CQSPQCwh5Pj5A8pBX/rGPaNdAYCcKSI+oyBXTJDFgwYwU6iFy5Xh5gzlIImND1EAYXuQ
         7ud/p2R2SXdkmFSa982AhlTfAcB5irKOLPN6e9+ujAvvNinVwwHA55cM/77mvN5+/4bU
         w5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWk3zD7+BZ86NzO8PaehCZlnZT/VPCHNVUhH8LC+GH+WTbKYqCqtjuNRNVhwGjmRXc/KdJbnP34yx4zlcPL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz+fyAatlhDQ9lrrwbGSjU8Pg2xsPuDFSxzI+q+EvhY4QhbaPs
	qHAzY5j6zeLTGuQrh5j5xMrnrr+5qry+uJwp1lzn/aWzYa/fjQQJ8YArQKNizFND4O9F3/Zm5Pm
	0IjyL5bEwuBkjT7R8hZRmlRvaDTzettuYR63l/5WDaT/ikAcNSUa3g4hzxS3x2zN4SXwx
X-Gm-Gg: AY/fxX41L3LbcqUCgTvqeOhIYK+sDDh9MNtL3TtJxgZuMSRidQB0IsP+YP9cgc5IAIf
	HPWJ0+uFYx9STea2tMJGItOUZyOwi7KAbE5k618pFx2MzAeklRrKdDMlcUZjAQI9R4MYJgZBu6O
	nwBXgHxmdFD1kx5p9sVT9I+oMKuB5mLz04H+OtzJxvWh8DQeNZkw3doMPF1COvas2GREnjPc8+o
	3Y6TQ9JLAeNehxRC2vpOly5nGCGGu3Hc276bG2bE38SJANyQ8sM3tympfPR6NhJSWaDy5w0tr2b
	kH2exYQqH1gtXdzPt90M8ObnestrNOLN6P9PAbN8E8afkaJ1eYFZ3NXKisgc48kAOkxR7ufwCn5
	GAm/8D87LOw4U0hfC4QauW+k/Bis3UBdDDey623Hyshk40wXXO3YWOLwXwk4silSi
X-Received: by 2002:a05:7301:5406:b0:2b0:4c33:8e41 with SMTP id 5a478bee46e88-2b16f8eca3bmr1037911eec.20.1767667178966;
        Mon, 05 Jan 2026 18:39:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRrLoWTYikJbsEVNnT3PE01iHJxcTTp0zsKYplfnuw1rCWOjWPctDK6C9AhO3OUWsROb8zng==
X-Received: by 2002:a05:7301:5406:b0:2b0:4c33:8e41 with SMTP id 5a478bee46e88-2b16f8eca3bmr1037893eec.20.1767667178473;
        Mon, 05 Jan 2026 18:39:38 -0800 (PST)
Received: from [10.110.93.66] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b2256sm1234417eec.25.2026.01.05.18.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 18:39:38 -0800 (PST)
Message-ID: <9745b711-4c12-4219-92e2-425a954a67ee@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:39:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/1] Bluetooth: btqca: move WCN7850 WA
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20260106020738.466321-1-shuai.zhang@oss.qualcomm.com>
 <tfdeucc7opjtjuo723hskens3te3eg5ohm7db6tbhompbtgkkq@vsqgz5qtmbr2>
 <6d29459c-2cd8-44ed-b64f-6947cf620960@oss.qualcomm.com>
 <CAO9ioeVCRF1ADsrXeHzP7hKoudvMQ1f6cZPDx5jt_8C7SLmYZQ@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVCRF1ADsrXeHzP7hKoudvMQ1f6cZPDx5jt_8C7SLmYZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _unfriOeOOEx0htFk2YdKY5UQp0_aBip
X-Authority-Analysis: v=2.4 cv=fOw0HJae c=1 sm=1 tr=0 ts=695c75eb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NnUceZfHqhrCt5kD85oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: _unfriOeOOEx0htFk2YdKY5UQp0_aBip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyMSBTYWx0ZWRfX+/fvfbPRxnMV
 PCP/61tf9Vc6T5RisF21hAtc9pnybWP9zB9tAO6qkD63S5S9m/LLU08J1r796ANahsWVCVKemuZ
 RvaIzH38qHxy8DX6aA3NVAZjc+gUecBQ5xFBTwz8/QV3bw68lW3Jf82aBusznYWPxJkNTQgYIky
 eXs8tAyixXLJ2pD4RkRcWmglVISn77Gqcll3Ydn6doTSrvBxLwl/iEbcdwmQbs1IRDmzk4sMHoK
 UHZgcld7foSk6Zgn0doPbFRfVe/rMEbSmfjlRNYyxv6BZTExjimZ6SXta5atxRGMT/VBgMvugPm
 LUBMFQ9A+Gchg187k9R3o54MgUydorIEnfe6ry2kEuSftfwNGhZMQ0AHMdyT0FNejnslo7fHTP1
 K+iLzhxoe0I6o5RW06VGpGXDN6WaP27JE9+u67LhqB4VwGH4KcIz7VZzk7iuu/WPMYrMVvbGBuF
 iH/qiMkK5Gg47QyEL+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060021


On 1/6/2026 10:32 AM, Dmitry Baryshkov wrote:
> On Tue, 6 Jan 2026 at 04:21, Shuai Zhang <shuai.zhang@oss.qualcomm.com> wrote:
>> Hi Dmitry
>>
>> On 1/6/2026 10:16 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jan 06, 2026 at 10:07:37AM +0800, Shuai Zhang wrote:
>>>> Move WCN7850 workaround to the caller
>>> Why have you lost the second patch?
>>
>> I thought the second one had already been reviewed, so I didn’t need to
>> submit it.
>>
>> Do I need to submit a new version that includes both patches?
> How else would it be merged if it is not submitted in the latest
> version of the series?
> Have you read Documentation/process/ ? Especially submitting-patches.rst?


I will update the version, and I will carefully read the documentation 
again.

Thank you.


>

