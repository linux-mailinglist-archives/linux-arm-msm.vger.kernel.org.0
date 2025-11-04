Return-Path: <linux-arm-msm+bounces-80301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3B3C3116B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 13:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F7DC4E844D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 12:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693112EC54B;
	Tue,  4 Nov 2025 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYplMoCe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtSiet9q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89CD2DBF48
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762260865; cv=none; b=aiGn97bVxzXX4FSTBxvv53sN1i4pFyxtusLBNIikfVeyrT/yv0S/+ra2JdiWkHl2UWNzpOh178as5PW9G8lHg6fMjoS2EmE04JtHSr5pupgcbAKxYZ6MvZtEzvHTVLFz955azMNOMWKrdQmmU+9G3f22DI4eD13kGHqBYHmCP4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762260865; c=relaxed/simple;
	bh=41LD9HFDKqJ12cp5GkMWyqtawGPQsTFhNagLQBs6VzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZbHIyh9Q574Mr8rPXx2AS0NyEphhCm1gnoU1VUZAwdWNZEV/+ueQLPgxFx8yRbkLkhbeDn7XBNU9WvGdVhjxv3iZpl3LXhDJDC9v+GwqiOn1InBhdokGlrVaRq07lAnq4jAGvZZ+bwbjY0g41sYTb/qsv19+2tJuqFQ2b38WUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bYplMoCe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtSiet9q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Cg3JT2173207
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 12:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rEo2tbdcNqznwgRyt5JQUX43AUUKO8HAkqP13xq8tkM=; b=bYplMoCe01iaUrnL
	DYuPT9RTqvBygrhXPg38ugTjkoVDk1gOFxjLNtfdwJfWUhAjdOGcnucOqQOUlN3r
	mV/n+AjHvTvmOe+HumdFPfa+mAw0NLwrZ5FLer/pEi2+Kk8+1VwdSQ/Mv47IQLCz
	RaerM3SW3ZQm4MN17R/MjO/O5yj7AjWDF9SO76rgyEZ//ipIGgKCNPiuyqfktWi5
	td6SO3a5rCgmnsmIkV5oZeAPpgum98ilNn2IrXMA7lk2mBzC1UJobE4U/dCEEMnb
	HV7Co0LwFL1PwctoBIA4iwp0A8oC+S27VMUKUPlrqLMHkS+HM2zTyPvlZzEaS34S
	+s0QlA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70f1jxdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 12:54:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8804372387fso14435666d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 04:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762260862; x=1762865662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rEo2tbdcNqznwgRyt5JQUX43AUUKO8HAkqP13xq8tkM=;
        b=UtSiet9qraXl999hBvwO76I8n6nq5Y6ple/4JkfkzUi2tUyVK+StatmFnD+0vWMUmb
         ZeD4It6qSNNAZq4lMVlyaySL8/ctye/x+ow9kSHJuC7y6tpk9zA/m5gQ8lILwXop/jHO
         2N33tftXOSt7EkYRkzX56LpxjDxRYDIcYlv/rNswWgr4XLjDs2n1qBhCi8IPRsi0DUrq
         Phe4qbo7JnsqY/zC9VGd9kzww7Xp9TNbrsvXd1KKgnHkJNGYUrCmzObM48XmVXXhsOwm
         0wzxuq3CYVcpvSS6DGwG8S/jZolhIvSivdP1XMJqvSP1HhZiNXk/b9KP45tGqFz50K+T
         OJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762260862; x=1762865662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEo2tbdcNqznwgRyt5JQUX43AUUKO8HAkqP13xq8tkM=;
        b=ZqNQSUaABvfFx3Cvx2syr5yhxwWLefftSkhS+pUrlB3FTk1PH2ajNUOTsZVWuNyNa+
         2zhrsoCw6jEZHoV+5UE9JTnH45QPGhEdCJa/o6afGOcEYAZh+mVn8KJ+f97JOEMiulOg
         mgszc6x0PrV1F2gGkIsgtsvCDR2jTPSLzeZ2A+eBIMOMSSg6F0FtPfSjIYLHkPlaDTGn
         GE33x1mCyNP3x5WRv4w6Mgm16IYPEnrsyKQ7OO9nrSr177YyPj3QKk0y6YAlIC2GauRx
         hD8R+oG/k6ElKsoYafon2tK4lP1Zvl1KU6rZYoJiKgyFjJxXpr5wThLFuUTR5ymCVpiM
         d65A==
X-Gm-Message-State: AOJu0YwZxGyNWExtAThftUUMu9mmfNWXb0nse1b8KRLCs9rlRZKqivVD
	n6bv0Q/Pt4RVUWBv3UcK4YvNCrem7qpmIi54bclG3eMVYKAiO4dtOB0JZqQWfyseplnZJODnYtR
	8qEtOSPwILCctVR9pn/sprFi4PsnF/wX3UIEuj1ZV2NyuCfMz37hx6GsWsoVBCzMTZ1PM
X-Gm-Gg: ASbGncv1+eRoY+Vgdt3dyQinuk2klokXrzPjWnTvQnAxo+St6lBhn8VeElXbUcW7Yl4
	IlxVIW6U2a0ypVKXTgg4ezMItV9OC7wtMEtgUES+xB+gQRb3DW8ODUguin9wc/NJ8+S/FIsLvk7
	ePWOZL8mU5A3q30CSr8U92t6ZYNvtGFWT1tcnWrx41E7XYuG2qROAm7aFUXeNiM8lI6orEfcSOh
	B+SLSN7n9urxteOfrStJ1rmQGJz6nUYbBga0TnWAuLZOzfhIzx7gsjeDvIKgEeetAWfA7AxVK6z
	EW5/9/n54y0x4wX+uGBFan6DH8yZ6jbB5GtAEjXcKHKt/5X6JRio/tKLTaofAH2fJALSsvSZSEc
	Fbl2sizsvMwR6iYwci8rBTn6Rx988bgqHjU8zV8fjCEQ2IPJYk3oHBbTA
X-Received: by 2002:a05:622a:2cb:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4ed30db06fbmr139569091cf.5.1762260862106;
        Tue, 04 Nov 2025 04:54:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK0IbjPUvHe3l3ozGTecxSQwsr6r+/J1IxFgsa8xYns7z0AuB79NiObo9bKa9x+fbBgHArrw==
X-Received: by 2002:a05:622a:2cb:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4ed30db06fbmr139568721cf.5.1762260861475;
        Tue, 04 Nov 2025 04:54:21 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fe38a4esm201555966b.62.2025.11.04.04.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:54:20 -0800 (PST)
Message-ID: <7f8aa7b5-40b6-456d-8b33-0cd505a6bc3c@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 13:54:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] arm64: dts: qcom: Introduce Kaanapali SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-2-3fdbc4b9e1b1@oss.qualcomm.com>
 <36fcea98-06a6-4ca7-a378-77b44b196a9d@oss.qualcomm.com>
 <7fc6ab09-44c9-434c-ab19-764c74b1176b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7fc6ab09-44c9-434c-ab19-764c74b1176b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JLQ2csKb c=1 sm=1 tr=0 ts=6909f77e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iCe_EFKcJ4jOResAbxEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEwNyBTYWx0ZWRfXxsLjd+qLKHyO
 9Uryeug37KoFqHYMszlR8zZ9vfGVWYMl2S2Y6NZ08tQ8p0D704hWgplTPUkrexI3Rtub+tq/br9
 3oWCXwKd9wPg/m+gSgT5R9xZ+BR2MK0fZWYECMKi1gj9FL2HElzs+uoRoQVKjjkQoFupMCIkIJt
 7TXdpX0eX55kU96wfNNcuLbjlxcbld5ECAdhHk9C7mVSTkKrFHPVhQFlA+I1eqdep+bEkNrpwu1
 C0Zsk0M1iSLCHNxwmw6djQPqfwlsOSxkHUJIGMvNH2cMZql6vNGwsc8Yz+u1GnPLSo+rjn96CO1
 AsCcuuDph9BTknF8w8HB5EtaCbS2ILuLXHmaWxAqN4wfm4MVNp4UUXdHZSZxiy4xKEX8g3Aevgh
 TfYgYa1JiERRgsts2GYcc60fw5sXRg==
X-Proofpoint-ORIG-GUID: uemnQmTAD7gDqN3Vvur2opNwY7WqXRzV
X-Proofpoint-GUID: uemnQmTAD7gDqN3Vvur2opNwY7WqXRzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040107

On 11/4/25 10:04 AM, Jingyi Wang wrote:
> 
> 
> On 10/14/2025 7:46 PM, Akhil P Oommen wrote:
>>
>>
>> On 9/25/2025 5:47 AM, Jingyi Wang wrote:
>>> Kaanapali is Snapdragon SoC from Qualcomm.
>>>
> <...>
>>> +
>>> +    reserved-memory {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +        ranges;
>>> +
>>
>> This is missing a bunch of reserved regions which causes device crash when you stress memory allocation.
>>
>> -Akhil.
>>
> 
> Hi Akhil,
> 
> We will not add all the reserved-memory in dts, other regions are designed to
> be added in bootloader.

If what Akhil says is true and Linux is crashing, something must be
wrong..

Konrad

