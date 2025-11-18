Return-Path: <linux-arm-msm+bounces-82393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28366C6BC13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 22:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 15BA74E37F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 21:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC4D2FC862;
	Tue, 18 Nov 2025 21:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ee+v8QXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bLwYohh8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEE42BFC73
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 21:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763502362; cv=none; b=h/VFH4MPJHEf5o2xqsfgPTwf7Al9KBUoCQz0Wk6pL+V4CrkGdaTam+n0nBRlCEETGVXMYPZHxjhe8NYFLs4UP4aP19f6k6w/eynbhhwmU08QK5c12J2DoFoK58Wrq1gntxSNPl5gO02In5R+lwKWHfo+i0fQRsFnhVdBE68A9zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763502362; c=relaxed/simple;
	bh=ls2Rw5xBdwyriW57f6EvboxT3meR68baJB60XNRB7gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJxByg4+/ZtS3iV72rXPfdsLBjMqwQ3joDY4AJ+z02jd5tifjzCnC2q27XyM401bqQpbhAMIOatLjPhZOWnsGTcr/0LQ85Wli0kOr8JhObtF/dmM+Zw7D8GTj5RSlI0A7nXnY6trBsYP0QtMaVIQwBTc1dBzIwAIpUYSV3k3K4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ee+v8QXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLwYohh8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIEQZLj2343506
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 21:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5iVPsaYlCb1RMVTHNymKIOQrhn6hE3lW1sYoQpRwNE=; b=Ee+v8QXtyh261DVW
	FZgce6h4fGZUj6T42xbyTWbTp8Ako7hkPkv1+PdUu+N3ZHDaIFH6UM0uageX/X7A
	xioCuVzt5xZBDelLrANoSJTw8KbhJwe5MBmQFUCTWAXVUaaHyyDR2+Wi+UkJXlao
	tnVy6dODUFjclRg0XqXLZ11uE20g425yIPlDxolzSgTsoBnNOcaOKeni8AgEo/gU
	g+4g5h0BMa5CmSCh+JwiUhG9ZEmudNq9hKWeEe5WTKPlr3TXqFSh0M/DcPQohGhz
	x4RukSvRdEpGp0RVYHFMwMGV+2oxoHPWKrkkBA3qrR45Q3NAiMeTyUrdcLJyHZF1
	V8asmg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrn2ky6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 21:45:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b55735710f0so10782216a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763502358; x=1764107158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5iVPsaYlCb1RMVTHNymKIOQrhn6hE3lW1sYoQpRwNE=;
        b=bLwYohh8aPLz6E7Kapck5HLWzUXByjpwwwDbTaS21Vu4DJgUKuQ2bQ9ly+KMMVLsLM
         /seNJG87QI8Fh3UMChHMW+/NU+2lRU83RBf90SfrTIGEAVlPAIrJdPKkjhc1jwlPxQTT
         ukMsrNBv4DTqVhKHZFRW8A5kDdpfk7ZFxr2aVUvmZxq3S6T0Cid7GnaF0/EDDGaHR8IR
         zSzE2Hqvo8n1Toce3ZnpZPxOKCHIpNnVGgQruay1W11V9B6xHzOP1pd8KNK/pwAAvu/i
         f75p2WygSbB0HTtwbZL4oXt+XMAi3frbIdWMPv83s0QDu/JCHDz6e9UwSYb76oVwdBl2
         KUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763502358; x=1764107158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5iVPsaYlCb1RMVTHNymKIOQrhn6hE3lW1sYoQpRwNE=;
        b=l8MksWyFs655hBrGTM5Xm0awXRJC0nMh+iIicPp7vj+Fzh5oB3a+AlgczsUG6/VUQL
         Y2nYgVEyOckXbfbvnxdy0qfbuyWxboKeerFsPz0jhO1QiMTG1sKD2EVhDZWoT48dt5Q5
         tZoMgiAKyFV51wsKEXqT2OOoMj4w3ZD/0E8iOPGJaQ0lDvY4CpDyjJgrX8LkBO0CUh3D
         5fqrxRUP4sjYL0R2oy5JBDMqPugXF1YX7r/FiNdHvYnzVx21prIRzY//cdXxKIqcCvRZ
         x0SDuKxsY8WOBBacIrRE8qBMwp/7y2i9Z/z9YuQJTmPRhBRuir6l6AcxDfdJy0QR8WA7
         klAw==
X-Gm-Message-State: AOJu0Yxccj1lF0qMxhcgJKzHYiq2O59TnaIPFmjtQD1JM2hlXsfktnRi
	JtMccAgtK66Lupt2KBemJY2qZHsoWj3z6DjtlXw4d8CpT6wC/EdViy7EO284IgVMF3HpZ63ZoJY
	0tNROSaewAvr42emvOqcOkjpauCWnz6dzv/Hmss1mOQm5iYBVSJupc2YXlV/IcwQJK594
X-Gm-Gg: ASbGncsLz6qq4DCl+nRxANZRnGExQiHiWc1BLAkYqwRjWpi7nNHOP186SG4SuSI13x8
	5+zSHiGwe4d+GL9vWAYkJBaNyhjuECNBlUSfeRfnF5ccKtnc1HQvZ1V1+0Fcui4VHjWZi1HXqnF
	Zqx6peJ3HGayKqGOmm94ird2JSDr0bjbVhk2WB5phyiopWjOGG0Mg5ada3KkVOwoSyNfK4jdhWV
	44RwZXT3mI+hXfa/P3UIY2FEtxsBmztgCULHtVvibXy1Je00J3lPvPVBD9f9N98VjL/PBN3aiBe
	gRLA7/D3sQhXAtftbOqdsMxb4omSWhSo8JHghc45T3DZzfruvtBej8ksbggPP0/Jc07FOWAEDtJ
	iLt2o3GpNxoAxiFEztGJqjh9EXRe2lt0GnMxee7nV
X-Received: by 2002:a05:701b:260c:b0:11b:9386:8266 with SMTP id a92af1059eb24-11b9386850bmr3847565c88.43.1763502358472;
        Tue, 18 Nov 2025 13:45:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELTILBUpxHvNoH+O531dN5+wyeYypui6nPCf/ktkz+dWVwvrt1daR3IOAvqgTlEK5x1GA+Rw==
X-Received: by 2002:a05:701b:260c:b0:11b:9386:8266 with SMTP id a92af1059eb24-11b9386850bmr3847539c88.43.1763502357930;
        Tue, 18 Nov 2025 13:45:57 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b86afe12esm53561915c88.6.2025.11.18.13.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 13:45:57 -0800 (PST)
Message-ID: <1f320bc6-ba7b-476a-b9fa-b5333f66530f@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:45:53 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
 <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0ItPTkO7C9J6e1jglPGV_4btW4cCe-NS
X-Proofpoint-ORIG-GUID: 0ItPTkO7C9J6e1jglPGV_4btW4cCe-NS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE3NiBTYWx0ZWRfX/awX7wmFmGeD
 qtGDsJwsxuuPAEk0y+GO4fGOv6Ca+qiqVSPCe3zRqgxhmLQ6b/otp1pZK4dn04ZHS8kK+m8Mv23
 tjuS/nvFfibKguxHVF78XoNyTIq52bek6MsR/k1J6MhGwUfpxQ9dNMj39ixjO/GeASqW2PusV4A
 sVDJe4s97rIlDwwR9y+ZgFqV9CuF+JIoqImbLX//c5HB2A0+3hw971ec042N9VK/aBYP+5bLJIq
 mVzZkmmcDsQQ+wdgOMiG7Mpl3HgSvqIvd3HdViOs1DPLslHkIdf7N+X5QwGWAShuA/fwG5Nhfc1
 M/gj1n0buRxtUqpDbQKV/Xe6ON74Injew0k0DcutEJYbIWzYTPAjfMEKvI6y23KNIXoQvS7VeHV
 V2kPJh6/hXKCh0nYM7AhOorsGMxYpw==
X-Authority-Analysis: v=2.4 cv=L+kQguT8 c=1 sm=1 tr=0 ts=691ce917 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Im06aVK_WBUVNnXpTS0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180176


On 11/18/2025 10:44 AM, Konrad Dybcio wrote:
> On 11/18/25 7:25 PM, Vijay Kumar Tumati wrote:
>> On 11/18/2025 7:00 AM, Bryan O'Donoghue wrote:
>>> On 14/11/2025 03:29, Hangxiang Ma wrote:
>>>> +                  <0x0 0x0900e000 0x0 0x1000>,
>>> Why aren't you starting @ 0x0900e000 ? seems to be omitting some of the registers in the ICP block. Should start at +0xd000 not +0xe000 ?
>>>
>>>> +                  <0x0 0x0902e000 0x0 0x1000>,
>>> Same here.
>> Hi Bryan, HLOS does not have access to those registers. They are configured by the Hyp.
> If that's hyp, please add them. We already have platforms without
> Gunyah. Remember, bindings are defined once and for good and I wouldn't
> call it impossible that someone would want to run that configuration on
> Kaanapali some day
>
> Konrad

Sure, if that's the standard. But even on systems without Gunyah (say, 
KVM/PKVM), these will not be configured from HLOS in the regular flow. 
It will be done from TZ.

Thanks,

Vijay.


