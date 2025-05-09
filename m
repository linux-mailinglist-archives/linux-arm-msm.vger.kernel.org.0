Return-Path: <linux-arm-msm+bounces-57435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2EBAB13C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 14:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 093641C27E62
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 12:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E688128F52A;
	Fri,  9 May 2025 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhWVPitU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357FC29116A
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794755; cv=none; b=ZDtK8DZo5x3+bRhqvSH8GEATbTHlMaykI6CtEwxV42efgz8im0k7R9hTDZU9dEuoX+Awe3DjngSh5f+sMxll3N9QMQY3U8AqXJZDLEFJOUx5Dma9yOzFM58LI8+G5Y6DZhC7HNfsBOF6FTaxVmj8Mh+Ta3E05sICwaCe1xj1Pa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794755; c=relaxed/simple;
	bh=GHvUROcQdkdkWDU1lkpfy6WFUoPAavG+aosHcF65eV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jELlja8bjtFZTlibmZzumvJ7eJLNSdq+eo0qzGbpaQrKpCawPHmqL8EKassoblGmk43o7RIt+dz8CLxjma0jQRiJkiKM5nf2QiEYzQem85HsRVZgAD8U7HPN287UGlI1Beav3iuOgB5vJ0URzEdX8YkaJk/YdSR2q8i5m23RAQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhWVPitU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BrwJP008543
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 12:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWQynAaZdyP1BwCe0FmFpLhAGkNvtkQ5JL4l2VsgwRk=; b=UhWVPitUSRA7HncY
	sy/jnNE7ycinfKCQQaQ6408d/qaG0KYj9QsEr7ca75/hdwxTRkkX2Tfd7vqMhGxU
	YNgVocrPrcmv/hMTI3ptSOhqVGqCwQy3lkiDg0/sDj9UZif/OV+PK0W3lASVW0gf
	btSA35yhKCsrlO8fJeOWUQW1t0DnDVzUCreCF42Tp/ypRUNC/601WU0N9qyZ15tk
	2JtNgtX+LVE+9pXOyd88VYNqNoN4yn6HDT9NDBWck36H3yQERaoRmFLISQ/FFrti
	RfxaozIlBC3ZwsFfXsXj0eWHt1W5n6S52GnDROUnSzRWXCHdoNEnY7rQWshQMk26
	aKcU0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5cp1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 12:45:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so54507485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 05:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794752; x=1747399552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWQynAaZdyP1BwCe0FmFpLhAGkNvtkQ5JL4l2VsgwRk=;
        b=LGUXUVD7Ns+wamiVgXlRhvp+VQUwAHk/mEPpveUEpZ0EiHdBjpg1dOuPhnFWaFb2AB
         a74P3SpIsLRgzylHFDC+pzUSvH8JykyhewltT8LCmyCYhzjBG1EMPSIUb1pfMw3wo9dV
         MovlcqbMhObL5tL5F6pn6teF5Eqxo6x7jv4Y19Gse56cFdqohhA1To/dvcRnUNT7ZYM2
         /Esb5bcSF/zNnY/WayNbZD5jqvE9kiBK4e9cwF079yljSk1SidH2nOhlFyv7k2Kri4aZ
         bBHn90e8AXX4z6PTrPZjvwdbc/grXpqIrE5JOpEezvcD21BgNADZMdYqa+OWUyBTQ7ys
         Bb3w==
X-Forwarded-Encrypted: i=1; AJvYcCXcIdMd2Wbnr+MapNI1qgW58QVqV96g9GbsflBI5JmAf6TxEKZR2pL8MtsffJOv5OowoIaDoEksihRFFJYJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxC1DRSkzBIPTsvgz4c0EemSVyi0Up2vTQL1jGj5jNciKYD6mlq
	vMPD+QXs08MsaF/O4XiCWKdq4ZSlAo7xJAdP2HClUS8OFr1yJeAvb58rmBTrgzqgxxDO+Nvpu+Z
	AlbugqhFj592bf1jLY5BwlvHDaJquA8o+ZuCKLw8GVfeR4DT1fr+jULxnhbT0WEWx
X-Gm-Gg: ASbGnctPKdzzKyS4ywIuK6tQwXVCwFrKSh9GpgWiPkbmTz2gMyUb3I0RRhP8FpLNSmH
	2XJpet08PBGNUJ39bCH2JHXj81q/wKBk3kmiZvpcvBehTTSG6+W4qdv8ZafGuMrnNStu0Niun2t
	nrtz6/HeeK3uWBKmpX9TxH8ZNf5auiBJM6XQ9AlzI8rTn7uIeBzJg+4Uiy5fxL805cHQfIa0+dQ
	/3oujj8Eu0JPePvGGovSes5fzlLdgjjpuK5eRtuGyLvOSFyJ/YJPHRAyXQL5mZvBiHiMEGY/FFt
	1Mjwfenmz/WHjcj4GrzEwHMRGwHiTVx5NeGZq/KVCmYCDyd9lE2xomYK/baEAOB5y20=
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cd01284a67mr201895085a.10.1746794752019;
        Fri, 09 May 2025 05:45:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/01j/klFD9hnBlTgtkHmbIC4d1TarpECZjk82ft0PbRbQixnKSn2HYkL9AbA+mBnoAh6gVw==
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cd01284a67mr201892785a.10.1746794751615;
        Fri, 09 May 2025 05:45:51 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd525sm145972066b.144.2025.05.09.05.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:45:51 -0700 (PDT)
Message-ID: <c4921bf8-5eb5-458e-8afa-eeb86d5b5f34@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:45:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 10/14] drm/msm/a6xx: Stop tracking macrotile_mode
 (again)
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-10-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7EFK7dzR=hm-J58jz77pMxn2SoJVrfQvV0RHiESi1mkzA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7EFK7dzR=hm-J58jz77pMxn2SoJVrfQvV0RHiESi1mkzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681df900 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dD46bHw1nIv95-N93oQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: vpI8WTXRScUmjokWHoXaSv3H9oD-xT_6
X-Proofpoint-ORIG-GUID: vpI8WTXRScUmjokWHoXaSv3H9oD-xT_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyNCBTYWx0ZWRfX4wCp8IWyfa67
 e+g0rQu05498CuCkEWHjjTaqYlfu1uR8KfZoq5prjgDQNAH9fvxlrCTnwIlvenQqpoHSrWo+WAa
 qmLjELnH47L2iMhh1opvY2cK23NBQt2v+slk9AdnUpQqLiDXidA6lziqRI+J0QmMKNuXYYqUW3n
 o5XdMvrtLH7EL3hBr0Ujv1LrddqrzRW/4d7XgqZRAS53Z6q+YU3IWNycRjYm5qiv8OhISxMatjo
 pM2bI2Y+QWuFG/u7z1K2ARs0WX8FNeRx//FUf5HnjW135g3ulkfdE3glHd097MGobY92mNow8d7
 KSeRwTcAHU5Mnkef4tyoyjISVwlj8ivEP5VtwYEjIrVdTT0B0gaVqdqLDhpEgO/QudnbNXUNiOW
 WKGJ8X6jgHt0Q5sWuNM/P1JTQrSYLlzEA9F/HfoFrO5CI17MV30SSIOKt5db+PGtCdDnLeTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=998
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090124

On 5/8/25 8:33 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> SC8180X (A680) and SA8775P (A663) require a write to that register,
>> while other SKUs are fine with the default value. Don't overwrite it
>> needlessly, requiring the developer to read the value back from
>> hardware just to put it in the driver again, introducing much more room
>> for error.
> 
> I'm not sure I understand that last sentence. The original reason I
> always wrote it was that for host image copy we need to know the value
> of macrotile_mode, so again the value exposed to userspace must match
> what's set in the HW. We can't read the value from the HW and send it
> to userspace, because userspace queries this when creating the
> physical device during device enumeration and we really don't want to
> spuriously turn on the device then. That means the safest thing is to
> always program it, guaranteeing that it always matches. Otherwise we
> just have to hope that the default value matches what we expect it to
> be.
> 
> I know you're copying this from kgsl, but kgsl doesn't expose the
> macrotile_mode to userspace. I expect that HIC was added afterwards
> and only works via hacks there (if it's even supported at all on the
> relevant SoCs).

Alright, I think I'll include it in the common UBWC config (even though
it only concerns the GPU), as IIUC it may differ between platforms
implementing the same GPU SKU

Konrad

