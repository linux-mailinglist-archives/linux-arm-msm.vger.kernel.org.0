Return-Path: <linux-arm-msm+bounces-59510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3AFAC4C7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82870189D17A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 10:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52ED256C76;
	Tue, 27 May 2025 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Otw7rrQu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6550A19D07A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748343313; cv=none; b=Xj6upIKOGEXh9cTKH3BkzNHpHU4ZNtXA1O42f0LytA4R+EBnntL01m4R4prXfx25UwaR7b6Bx0Q6DeDstDtRxXTd7I7YpCpq3bdug5MbYwxB6B69yci9SGnNws81XKHJvwAYfkreN2Zzbu+xlUMkuB5Zhni7PbXl8BwOg9jeUHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748343313; c=relaxed/simple;
	bh=O0CKMs1r875V1oP4qm65pFEA4G9zLyPyriURw406bEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UIcqYvRPvaNPgXwBFbSeaJ0erXtDk6YxaCraFuOG+h3AWn95IphGa9O/OaQ6EgZEFNUgqbhb1ICEejJbvL6htfg6lfpcsrHjguc6qyUCWwmxZ1s0380Slvqe7UnKzvPosBkYU1Op/o8y7tXCtFB6QdeNeinzUgZniapzdK/rM/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Otw7rrQu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAZRvE022962
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0QaN0jDgPB/5r3SY7bQD6QOdm26/CK5MylAtZs3M0Wg=; b=Otw7rrQu9o3Bd9nY
	gqO8p+fVniWgwLC6FBk5cDzZ4kUoQn/DCksFoErmbw2QWh++0rtmWf7o3RLWYbON
	H/WwCT6n1luUYXqetqtpkY3fPG8T4o4otAA4gvnY5Ou7mzAl7eE6WUgLp0mKbYHi
	cvVlQALrNXSiss0hbpwCRH6ZEJ87s8NeH9uqXr8IHbLqxhSnRVh/Pa6rlBBPnZu9
	iWE++XbHf5tYnWkfxqixFIVwUZ/qGS7CAETBBzabGGdE4xWMD0c43N6WLSZi0Ta/
	sFXwAeI7NkthQsX6rzcq24cwXa4msauUXZzXWEltHR5vHMn22QLlO4igclXTB7i1
	mN7FRQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcu1pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:55:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6faa4e69621so4350836d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 03:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748343310; x=1748948110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0QaN0jDgPB/5r3SY7bQD6QOdm26/CK5MylAtZs3M0Wg=;
        b=XzQp1HmzAwOVEharGLNG3jQrGfKlTgCdvR4Wl+JM5inH9QAASs+lHfwwgd5o9W4MEp
         bkyqLe353FMRPIyrEfYfkrJeQ080HAo28HzaT9Dp0CeSBYE0vPA2NtQNJ6QIMM1KZPPp
         lQfSTRvagJVxCWVR7nNPScUi9SUMCJcRJQ0xqF8NXLXbt3NJvlQyjc946WGp7pDkU6PY
         quXyQNo7jJbh5opCBU2uUpxdz0PEXvoLvw1PSJ0zpMbVm6cEbDkhBt51drWebZJtOL3/
         VA13etE9OlJccaOxCbUkcAZ2aIerUSDSuhoQ7Xd4o9sMMY0rrO1d2+QXawxmNglJUF7R
         a4AA==
X-Forwarded-Encrypted: i=1; AJvYcCVvBKl34Xu56DA2vEp03rLzxo/6GaIBCemDE8mHDbwqZAJvijwKGL4/XSWBQQG9ihWYS4QQthhxWOH2BEsx@vger.kernel.org
X-Gm-Message-State: AOJu0YysbQxuAosXtFxKn3kYefGHOTvCi6dvgSFuMrNazmiJFxRoovzN
	dZDIJpw6EXHq2rYlgp6Zp5OUo2t0Pxj6w7f92DLKNHpYEBllAgkjIhX9HzGL4iVl+OI2MR7Ivri
	tXwKvP2cBPDzNHoqA5tZqV1cC+dI9Dwk2lOHfQwvB+1TONxeeKNBcNByR9Y4n/01GF7Ta
X-Gm-Gg: ASbGnctqMuMbbjNax0N15s53pDqoxrLiDX1g8tvScGEzXfsXLG7bGCh972fXnritUqw
	xIVr8EhP62gAeo3blH1Ui8W3E6B07uu6bwgqTj4D5LcZn1Et0knyf48kckbrsTTmGLpnecNlIzy
	YY6Zg+8OLUnIPGwbY5ATThBely2QMxIdMgRjOQxxhHOHNCJ+nzqu7/i0Q+xBvrC2KC1+CN2xUiV
	Ss10ITwaR8pXylu12sTEmtBwJrRy+PHAM6x2+vzDdmgom1u1cyvYPd6/blwB3e+bkZ61qNTrDvv
	DDTqiJYcsnkd85BEkJgMQyjDv+P5mayNRTAOmZq+Dqk/B3QGcsnVduEe/aL6/WWQrw==
X-Received: by 2002:a05:6214:2482:b0:6f8:b4aa:2a52 with SMTP id 6a1803df08f44-6fa9d270dd0mr67671346d6.4.1748343310298;
        Tue, 27 May 2025 03:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTJV7hGI3ZkwSkprGN+pDgA9B/aLbKDp2MQye2teLhkvThg0W2kSQO/Ud2VQBEXioadf+3JQ==
X-Received: by 2002:a05:6214:2482:b0:6f8:b4aa:2a52 with SMTP id 6a1803df08f44-6fa9d270dd0mr67671096d6.4.1748343309770;
        Tue, 27 May 2025 03:55:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602cd35e2fcsm5162433a12.73.2025.05.27.03.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:55:09 -0700 (PDT)
Message-ID: <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jzYjn2ljOwNKkVczd_ylGCkKoLZDP8sb
X-Proofpoint-GUID: jzYjn2ljOwNKkVczd_ylGCkKoLZDP8sb
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=68359a0f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=vupSWsNl5j4Ukh8iwq0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MCBTYWx0ZWRfX5GCqHmneahlh
 tISzYxIgiVoi+3R5Dc3APoBdZaKmRxnoKbBgnT3+Nyek8a1WAMYDVROWuuxtHut9mbVPp+wFf4U
 jvLLn0gSa4cfeZ3wRg5fg8OAophT3nA8sFlQ6Kphc5fOXJSyl/7rnkC6OlY8iREvJk/34uRj1pB
 YD9pcqDh5RT1dsneTzrkHGzQ+lFKig6lUcAz1wZn1syQsWxNI6VWZxxFxxn8ynczU7HkmUDPyna
 As43FYIVzlHXFymfkzKx+XmdFxYr3ctlttsa3B5LOvNMpz/zweLNvkk2qup8oI6CkLM37mSRDhF
 tIeOiw2GNm1tNQfSRMQJEaQxg/C0waBOkxHsInr5HzSoXqvznfbPm9DTUZalyVSPkiiSs8wliQM
 23DJ5bRCzIkJzXnu/oo7lAb7JWDWIqPHmzDt8GHC9FcQlSHIMYJnGHhQjNToPAHd9HDta293
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=894 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270090

On 5/26/25 5:28 PM, Rob Clark wrote:
> On Mon, May 26, 2025 at 1:36 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote:
>>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>

[...]

>> Yes, please. Don't set okay status for the GPU until it gets enabled.
> 
> Drive-by: Shouldn't the dtb describe the hw and not the state of the
> linux kernel's support for the hw?  Ie. if bad things happen if we
> describe hw which is missing driver support, shouldn't we fix that in
> the driver.
> 
> (In the case of the GPU there is the slight wrinkle that we don't have
> a gpu-id yet so there is no compatible in the dtb yet.)

My two cents are that it's okay to enable it, at least in this case..

Konrad

