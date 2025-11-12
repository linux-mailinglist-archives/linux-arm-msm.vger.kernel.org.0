Return-Path: <linux-arm-msm+bounces-81415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2646EC52816
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B2DF4E86F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 13:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAF83385AA;
	Wed, 12 Nov 2025 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lz5OZLmM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f6MNNvkX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E44303CB0
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762954252; cv=none; b=BErRkFmsq6ANYk4DhCjxZ/37LpfuDoRE6QHPRAIA8S0Gsa9Zt1VPScJzLq4iO7u+qHPlO1SXOW3EWfU/uVivqqiIfgBJzEo9jUbkvlhV6aY5n2Su2SV2oJuUzt+Al6bQo2xPmmoVpnbije3XKZO9pIBoySl5q3w/Kl+B02Z6eKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762954252; c=relaxed/simple;
	bh=IIaToPY544Y8Q7YQpEj1QuODNq6/ZHEM7RPkMgIfZ4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0PPFkaD4E//usB6DVNg82v5/wIPY9vyE83/OVJDMCgAXIX9ImmXw5MriDh1R17ZnMU5iG+gWjs9z64degXetKbekvnPGpmHAIdt4hzwhgL+sB76kY7do3KE8NHZSxRSMXVuYS0V8bZKY8Q+a69+0mSdD/Gxx4Swxs1U5AkhnsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lz5OZLmM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f6MNNvkX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9gj4m1109249
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 13:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/44QdJJTWaS4EuRU1XRPP8XiijRIj+e+dHbhb/7shXs=; b=lz5OZLmMV1RFUQD1
	tn5+ePuIcsL9+rSPx+6F9/izlW5kAJh1o5PZ32boZxDLGElC5bRIWpfq8YGdMY26
	qW27VyRlXZoBM05p3F1XRryJ3hfpuQVWqO0Zhx+w2a5qZe/8oQ/Op8ePau9gI4RW
	qOZU3FABmz0Ol9AbThLfhi1U6iWNj2I1Orwyo/lkMwRtYsBh0aB1XHIghZrF1np5
	ABYfIbXg3sSJCmyhZ1ljN3r31gNeMfPCGGfOCZe1Hha5pRb44LK6fBJOuh7ZmYGh
	JXC1k+/JOX2PeaYJa6rnJ+G/+kR51aMuJHgON7WnYs0FywwvhSmKnCFnShXj6Jvz
	Fj/eHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqum0kux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 13:30:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaeb11630so2024341cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 05:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762954249; x=1763559049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/44QdJJTWaS4EuRU1XRPP8XiijRIj+e+dHbhb/7shXs=;
        b=f6MNNvkXb2Oqy1F1adOUtejeGlqfg795YmkW+GtrNfDq8Habrs5QCP2EbOHU+Ahg0I
         E3JezIx/Gi31H0pZE6cksxATaGd6DtAeGc7GVQ34y3guqqrpBr6X/qnolEQSKEpazRvJ
         u4NQREIjqr2dMwU3xYj7ppNUzRBY//CUG9BVJTah2qIUyQ2uEfEQ5aA9CuLr+LZaDIh4
         gx9eLSee1B29lobuF4OMFI2Hu43+TceX288v6PHbgQJcriiIzxtC+PldM1HaF661cLVY
         YllfH93G3BSx1EOldmPY2YCO9+nQO8N5Xmz6u9S5w0Hfbt1oPUlhn1V6LRCtxdAMT//S
         /ZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762954249; x=1763559049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/44QdJJTWaS4EuRU1XRPP8XiijRIj+e+dHbhb/7shXs=;
        b=kAATPuUAjUgLkMaKRbHvSiEMf+EY7D7PF3p/4gQZku7AG8udHDBccJo7Ce2jdJQhTI
         JbZaAXOFvSc6FD9I7PNirgQkLI3x4Zza23HSYJTUITmtAoRlamP4eNZJezQeaM0uLkwV
         HuJ3ojFeCa6mAiFTUD43HMcGbGgHNV++RWZ8++dlxxFUIgP/YRAR7Mov/PRJGMtYdNj2
         4XwjaKKGVbk4N6Sn3vGzn0VVdba3wxP9hg5Js8SfxDhXy2azLv7rb1xFgrOwcVQsQpNM
         qCHvONe8xHaZxQ5/nE6P+PuuSlb6oeyvYUuG0nt7cspJcrWXuJrO6Lgrh1UB4ZzMSh4A
         nXkg==
X-Gm-Message-State: AOJu0YyWNs0SKEDUPt1KYqGodKE+cMUxIsRnFSp+rb11gMhCJimiLI3k
	17oORWMoiUIHoucoqvPLrc5+zdq6YZHLLgSaDxB3tRvlLmS3XrPAROF5mnp8QUEpq5LSlO447dh
	mfzYCGZ92DBzyl/RnJdv35Qe2s7LY2Q96LWJljg00SpBReRzUYCRwVDozNUaohcYhUDlO
X-Gm-Gg: ASbGncuN5LovCaY7EdYDDQfqviC0d/92KE4OYcMjSfkPF6bVl4GjEbq6ahUpcoiGOjF
	WPpEF111x8ld2F8Iys78Nza0IvC6cCX7cdIc961mQbQ0EDCBMPDGuhPcWDta3bP4svtfTWDm9rP
	jpm48WAj2eHGPldKQqxB3JcJA9iAMRW+VsL/6zNoY0ia64WWNcjImWQXpA85dQodqO+BoS0pCHB
	5ZeGRlFT4IZf4wy3CaRfmlYwyEgMG5b9lR6//TWSEKjwHDvuo4FwGl3FU569SGQWHtOiOm+P/OC
	OYgBOiBmp/nYOjRH5R9JtnUCXnR1zymZFPEUmrX3NTlrm0OjonSRnM/zBcRt6g8rW0E1DUdV29j
	2WTAnaxuhAPJXq+z01O4ejiEu6fQhjxhPWpG4xaqxLSp7yWpKmsjt9CHG
X-Received: by 2002:ac8:5994:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4eddbd46144mr23816391cf.7.1762954247360;
        Wed, 12 Nov 2025 05:30:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaCidicKlTBr1TM5P7offIP77B3anNOfsqqxDoaGf9E+pOaF90XYSEHFgNiRXwNrPGyMdkEQ==
X-Received: by 2002:ac8:5994:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4eddbd46144mr23815711cf.7.1762954246478;
        Wed, 12 Nov 2025 05:30:46 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eb6sm15752222a12.14.2025.11.12.05.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 05:30:45 -0800 (PST)
Message-ID: <622d407b-d04f-463d-bcbb-3543933d5fa1@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 14:30:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
To: Shuai Zhang <quic_shuaz@quicinc.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com
References: <20251112074638.1592864-1-quic_shuaz@quicinc.com>
 <0df692e3-7e39-4a7e-916a-c385015a2821@oss.qualcomm.com>
 <093749fb-5eee-4a1c-a29e-8232e0c9dd6d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <093749fb-5eee-4a1c-a29e-8232e0c9dd6d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEwOSBTYWx0ZWRfX69g+LzKidKn7
 neefx6r9qp68KO/nUPHloV9a9MJIew6xkQHqfy86YTLL4Y3pLNy0aUC7dj/tsMgWF327aPBE5t0
 YmtGcR/qjSpbA5CJjNwv/3UZJjgsB9SNf0/rH5bkWVcn745GvRjjI3JeMgrWJsChkcnf6s6gum+
 JF4sdBCDHL62ckPIXlC3FZKpU0BdWIwz+ku/Ge/PEKRIfG6SROyI3e7LjA1ttPInMasAGqhacOo
 jRxJZ8ZPl+tUlgkuKXdIZhAAXUrfNdM1+GDtUitzrZzxppr+cx0qLw7ZbVvjjkTnUbTT75+zPmI
 +YhtdJtYVHW4Kadeu+luWi2vQke1RooWzNnSTdhmlN4LAJ2fmPFM1+jB7FuDFtA6BH66bLC7r4B
 ay5iruwsNllroNRwB49/Ibgabgo0zg==
X-Proofpoint-GUID: XHbAapkp1OFMwTdhK4hKl3QYfOvkgqQW
X-Proofpoint-ORIG-GUID: XHbAapkp1OFMwTdhK4hKl3QYfOvkgqQW
X-Authority-Analysis: v=2.4 cv=KeTfcAYD c=1 sm=1 tr=0 ts=69148c09 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=BUb7FIXMvheu7h8L-Y4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120109

On 11/12/25 12:29 PM, Shuai Zhang wrote:
> Hi Konrad
> 
> Thank you for your review.
> On 11/12/2025 5:53 PM, Konrad Dybcio wrote:
>> On 11/12/25 8:46 AM, Shuai Zhang wrote:
>>> For WCN6855: download wcnhpbtfwxx.tlv and wcnhpnvxx.xxx;
>>> if they do not exist, download hpbtfwxx.tlv and hpnvxx.xxx instead.
>>>
>>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>>> ---
>>
>> Would these files be fundamentally any different, or is it a workaround
>> for someone else being creative with filenames?
>>
> 
> The prefix “wcn” corresponds to the WCN685x chip, while entries without
> the “wcn” prefix correspond to the QCA2066 chip. There are some feature
> differences between the two. 
> 
> However, due to historical reasons, the WCN685x chip has been using firmware
> without the “wcn” prefix. We are now correcting the mapping between the chip
> and its corresponding firmware.
> 
> If it is necessary to add a comment to explain this, I will submit a new patch.

Yes, most definitely. Please add this both in the commit message and
a comment in the code

Konrad

