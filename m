Return-Path: <linux-arm-msm+bounces-43651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB89FE73E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D90421618DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8CC13AA3E;
	Mon, 30 Dec 2024 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkpdyxL8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A032905
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735570087; cv=none; b=BtgWKuxUushFtS62bpQxR0okuIxOKVLyth7MkBJapDqVSosrfXQf8DFFqOXttrGzRDiZWNd0KidCzFeoOUnjHtcFmPwG4lt3+XCG9zcsJxT8exq/ITQ2fPNCXFxYGjd6fVT1ACqq5SsXG8IqqfOhb4KWHtsdF8lipCIRGerMd6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735570087; c=relaxed/simple;
	bh=KjWCVNt+b9S7o3s1KA8w6AF2X1h/VQpygP/lXVopERo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fruc6nzrQ6NfEi2nm4vZSDvf+tZ9vgf8ahM6TIOWiGKrqVCECcuWh8TjkG5mg29Mel+uzloTnIps9KcpICEFKNehq5BAteEsg4w1A6y6/oanKvH+GJ8Mng6A0wx1BRt+8OffhpCTBo0Y2Emy5SpfzSoJSPudziKjeNmOcZnOWNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkpdyxL8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU2jY15026078
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3guYso3Coq0RBvgr3ogOEivDxl1AcdY4CDUyBo/O3M=; b=VkpdyxL8OuULFCJ/
	W0WeSsPXDtCBW2IewX5kXkTjqN+d63vIb+QsUKsCo+QIbLuz2HnXb7n4H9O6WhuJ
	V20FEMIY569IyfhilwKFu4jDdQaHu387K8WExIgODNnH1D4KuChJa0qJsi9MLjHb
	cCycIjsLD3btxa/VysQT9nyd5DzZLEj2AyitLfYLwjlSeWJrSz+9ZCkkmH1odFXM
	bTsRbgRh5d8iKxcRm5bhrLh9PHtlvegacGmoix0TCFyg5Z+q8XJ/LRaHRIgUn565
	cCRHC7W7gI0DjI0CLRPYMoLCAk4dy04qFlp9jR5crdDyqfx3s2/zF0YgC1olq/EE
	MHI0jg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uk121c6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:48:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6ee03d7d9so51430385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 06:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735570083; x=1736174883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3guYso3Coq0RBvgr3ogOEivDxl1AcdY4CDUyBo/O3M=;
        b=rwm138zzbuXvIueB1iiVjTxjGugAmBSolwIsK/HAMmp3YQA65dK004s4cx8AGxS7rI
         0rKavT4kpS3V8k/j1fLck1ybwfuBwfREN9TdvOcc6E2d8HGQVlIZvUuEMQt5TabwMinQ
         VMNqzjNbM3ChWYaOScyBxR/hZthNOTV7mUFrZS1NlioPYnbvWIAlK/dhQhNpaJsz4/6T
         BJ/G1OavLzALsLYt7DZwJsW2+bZqoZdN7lYYOm4PGcHn9lhLdaCw6jsyCP6r4v8AYZkY
         C++ueplV3yZr4RFT8Z58ceVD0twY8VpJIqfe9FSLgDkuDJigGdNunlQwLeQbs2LuxGWc
         UVOw==
X-Forwarded-Encrypted: i=1; AJvYcCVXNBe7UbOBU//uj8EUbdfA4FNrGFmJJ88JfWyZ8dLuh1kSvF+yXoiOng6XlYPWB3EeaAl5DVhky7Y4qeD0@vger.kernel.org
X-Gm-Message-State: AOJu0YzQdGLbbouWJ2+MXmzh/9YsvObYs//O7+wxSS4DSy8Z9ch+E9n2
	cPcGht1RB9Fpkn/LMeo2FR5MjaMuFxuWHwGeYG82oOYDRPibyUGbJvyshZyc95boW6w+F5aLxIZ
	FMSkO4b8+pOxwbRP9Gmhr+lpo1NfvLTn7g+q7i2Iu1lbzjsRG2R0mWf3SAW0KIJhA
X-Gm-Gg: ASbGnctqEvwfGyPOsmcApPU7XSh1N43kChXcP7Y9Tj6Vn8eTzJm1wRk9sXPmh2q7mXp
	vfONH0JR1fRYlvxRDJtz+Xm8wk19GiOA7BQGv3tG/dRT/PBNTS2InR2Wx9nuV+L5WdZgvqvn28A
	Yeix0Lttip2NdCgRNgBX4J9Na1Acvd7ihs+Oj1FG+LWmQB/smBUMfUAyhZ90ayudAD+jVcSlXh2
	qSszGlLGX+lOgurNiBLPv4KROj9Xx6/7f1aHuov6Cpfpiwm3Krf5hCwHpO5oFPw8w5k0+qT97Z4
	QvCAfnNONiDBRZNo4LYoyj+8GFnRphwRBm4=
X-Received: by 2002:a05:620a:4053:b0:7b6:7031:e15e with SMTP id af79cd13be357-7b9ba7eab6cmr2092905385a.16.1735570083739;
        Mon, 30 Dec 2024 06:48:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBDKqMftM4nCBgeB53pdAJZx4SAkQGmWBfeiR7UkWSQ67bAd/6KEwCNArMS45Msy6+U2XZnA==
X-Received: by 2002:a05:620a:4053:b0:7b6:7031:e15e with SMTP id af79cd13be357-7b9ba7eab6cmr2092903785a.16.1735570083354;
        Mon, 30 Dec 2024 06:48:03 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015b53sm1470383566b.163.2024.12.30.06.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 06:48:02 -0800 (PST)
Message-ID: <befd6574-b9f0-4483-a767-684a729cfde0@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 15:48:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, richardcochran@gmail.com,
        geert+renesas@glider.be, angelogioacchino.delregno@collabora.com,
        neil.armstrong@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
References: <20241025035520.1841792-1-quic_mmanikan@quicinc.com>
 <20241025035520.1841792-6-quic_mmanikan@quicinc.com>
 <jhykmuvgltvuqf74evvenbagmftam2gaeoknuq5msxop4mkh65@dya6vvqytfcx>
 <21365836-aa06-4269-885c-591f43e2e5fc@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <21365836-aa06-4269-885c-591f43e2e5fc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9PrylfjKFB63Mbxy2E3CkbrWBukhbclY
X-Proofpoint-GUID: 9PrylfjKFB63Mbxy2E3CkbrWBukhbclY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 mlxlogscore=694
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300128

On 28.10.2024 7:25 AM, Manikanta Mylavarapu wrote:
> 
> 
> On 10/25/2024 11:21 AM, Dmitry Baryshkov wrote:
>> On Fri, Oct 25, 2024 at 09:25:18AM +0530, Manikanta Mylavarapu wrote:
>>> From: Devi Priya <quic_devipriy@quicinc.com>
>>>
>>> Add Networking Sub System Clock Controller(NSSCC) driver for ipq9574 based
>>> devices.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202410101431.tjpSRNTY-lkp@intel.com/
>>
>> These tags are incorrect. Please read the text of the email that you've
>> got.
> 
> Added these tags since the dependent patch [1] was included in v8.
> Please let me know if this should be removed.

These tags are useful when you submit a faulty patch, it gets merged
quickly, and only then the robot reports it. In that situation, you
would be expected to send a fix, including these tags to credit the
robot for catching the issue.

Here, your patches haven't been merged yet, so it's not applicable.

Konrad

