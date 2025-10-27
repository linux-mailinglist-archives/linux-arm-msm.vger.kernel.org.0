Return-Path: <linux-arm-msm+bounces-78909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 361C4C0DF9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88B931891AA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA1B285CB2;
	Mon, 27 Oct 2025 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AsJIKiYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F8E296BB6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571235; cv=none; b=ZElanqryGCswN/+FG+rTF7ABf8j/JstXnDDBwPJa9+mPtB+p0m5MhbbSDL8DfxZuRIsqwjfvfpkBvYCux+C5Mr2D8lyzKPYyrb5hhnqULsggy3K71mZTi3zw+GwqvNp5Q4OmDSl9m8gCgij14hZVCEZK2tDg9rdIyw0tJhrplAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571235; c=relaxed/simple;
	bh=HBEaI4YkpxM0ymZUHGuwzJMLz0hxOEJOQRaeskAgUJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTIw9rp/1UHaF1nO/sEe8CzLB/Aor5Yr7Dp1CZEV7HKMlrmHdY7bsw789/aKXXWxpBd9Dz1xEwz86b15tAfchjy8B+Y0Hm/T1UPDErL2Gm4Qer2Tx1idN/SLc31oTD50dOLOgN7SnJQl3lUMXqEwRFHW1OPqXZgkcdAvcbNepxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AsJIKiYD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8HTsL860371
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kSYlZ3f9vesYlsVsHAw5CyHtqlY6CNOY4YSlAreQ86A=; b=AsJIKiYDX7kcD3co
	6PZLgnIqmYG/LL/pHgMcBHT11BIh91Z7LYbNNQVvHu1xWRSw9gAunsQTONhVfDwI
	ITR3u+nNFYJQFCLvkVCrb6paN8FYonx2DUFv1g1Czkct8v0KAiO8XONyMF7fnsbz
	bgM59tHq1ZtXmxOjyBs3HZtPCLMOQVtASfBQpiLu0/cXQvd82j97EleYA1WIkqOh
	YEH2ZAgVbLmTReh+l2cfNS6e+V98JwfuPaYXrMPluj3X+l7XbY+3jfWLI5qq8LEY
	fS7a8JfwR/0Ap/7UuEI/O97HALdCarFl/ym+Vd8dUHAzbHbrI64IzCIQNIxGGg2Y
	/aFgKg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0ps14mjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:20:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c262c72b5so14724826d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571232; x=1762176032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kSYlZ3f9vesYlsVsHAw5CyHtqlY6CNOY4YSlAreQ86A=;
        b=N1j0nTZ7uzA6KxD5FnpOSjsxL8eJz1Mv2iRh5iZXgLOceMOTNkEAFGQFzuxolBv4Hc
         YivCGh93xMU02+s4UZxkZORaGd53NTDRYvPW7dOZdapTBeKwAuN+8mups46fuSIBd+/m
         HgoyzPj7X19PS/nDAi1EDzcoXXpyOvuUFKGcYwiohgjRzDzSrgSBuSZmZuXsibaR1Txo
         I+n2Cm13ALWk5JNbCGM87AxqT/giT5zg9K5pzrWEFP9RQeJY10VWjXMXFg5N6d+F+xg1
         qekExMCT03ocsseoIWS7I3v6VLbc2TWc7F5Q4StSl1Slzj6g09RYd4o4ZIKZr+Azh7Lv
         HGDw==
X-Forwarded-Encrypted: i=1; AJvYcCVTWHRz5J3yqT3JaohWbhWKk2d1FeV16Rf74eJNckz6jCOWwaIO2ekhzfx8TYg7MPjEEI4/FALJsU2ZQ9h6@vger.kernel.org
X-Gm-Message-State: AOJu0YwRl9Dpdb4nza9NLGKR6sF5MKGvuQR6wwTm8hlx4TR2q+uVD/2F
	EYcyyKHpAuKBMK0M+tp5nynLctvpwh0QD45HVox/biE2/U/qGC5f/m/60LnZPS+X8wpp8t4RTuQ
	8iRzd82Uy234HoHPE3ZB1zQKH2mh2s/cQsC/z+Fq0wp+YAg3PkWchEvc9wSOgIJ3sicpq
X-Gm-Gg: ASbGncvmE1+8syjCs628wim8Am69js4lmdeDjsk0Qr83e453N3Uvg5gfRr2+b//NFmS
	lDHNKyPasMx+Ojif/OoTGsABTU4p5ZUKCgxMEYvx7NFLpyA8l7VVmMWKsF1YLuFA3B4R+Fdodg+
	mljoQqAFBL9/lVqWo32C724MamCLMC3BREoihyOWNqd2icXt3JKoiSLp8p5btdRxeSFofOO939G
	TR4iVFXfUL0TYZyK1wnJwnQLpjg95rrIV/KhauX4CIR0KGEXaeAc/f1al7Z+xsr6xoJmVvcQfQF
	q3tRpHszVfLH0ls8e9K18QdK9ONftL4qcnt5122RkbWaf5JaqCsiFSNwrcIimfizQXmSGvFyZNz
	MdNWW8g91DvVp/OCd47sgjyqgu4ns7ZUrxUb5P1ptGjnt0iRaP3alj6E6
X-Received: by 2002:a05:622a:5c8:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4ea1177c842mr202134731cf.8.1761571232020;
        Mon, 27 Oct 2025 06:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdz/wQ0BK9pQjwusme3Hz0+MCw4EcI0EDUElKxUQ9hHLgGZIHDtysKRoKXFj8XSgwXP6Dm/A==
X-Received: by 2002:a05:622a:5c8:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4ea1177c842mr202133331cf.8.1761571229943;
        Mon, 27 Oct 2025 06:20:29 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef95d5bsm6279668a12.16.2025.10.27.06.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 06:20:29 -0700 (PDT)
Message-ID: <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:20:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ju78bc4C c=1 sm=1 tr=0 ts=68ff71a1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NCk8XzW7qX7BC1ZPH1kA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Lhj94ELsrUTHogcY6nFt9AkNDPu6boN2
X-Proofpoint-GUID: Lhj94ELsrUTHogcY6nFt9AkNDPu6boN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNCBTYWx0ZWRfXyCcn+/57nNJO
 szOW9ZhfGP1MQka3a8Y8+e2BBkL9Dbmd9gLc0gllsZ7y4rxgNhByavOepFqHfYmr8Y+bzUo4vpE
 gqpxunG5aS+ThhWARLxR41esrKsLH9q+Ia9zVrifJihLhSQQ7WpVpQmNKdQIPIOgb5aNJqF0Obg
 bNy/W4UC7kXZ0efQ0TSfplvWqodVMDt4ghILp6hSY7pEvT49DS8pehq06f3IjAJX5QqPmmj6xJ7
 VE6SIDnTiIbKF4fmJVZU+sLu/eWkPqebn5ZtXedu+jO+p+T5faMZdFJ7qye+m1K0SQ6cXYBaecf
 2CzK5Y21bWiSsrH+D1tFyJSeHfcztfrHNEUI00Z22LJo8boULm4Rz8fZgmJC6l3yF/0BvmA98ww
 BeEBVXF8zF0L5AmzrVtiO2woqMF+1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270124

On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
>> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
>>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>>
>>>>> Add DSI PHY support for the Kaanapali platform.
>>>>>
>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>> ---
>>>
>>> [...]
>>>
>>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
>>>>
>>>> These two addresses are very strange. Would you care to explain? Other
>>>> than that there is no difference from SM8750 entry.
>>>
>>> They're correct.
>>> Although they correspond to DSI_0 and DSI_2..
>>>
>>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
>>> new features. Please provide some more context and how that impacts
>>> the hw description.
>>
>> Thanks for your reminder.
>>
>> Correct here:
>> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
>>
>> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
>> just some register address change.
> 
> Addition of DSI2 is a meaningful change, which needs to be handled both
> in the core and in the DSI / DSI PHY drivers.

DSI2 was introduced in 8750 already, but it was done without any
fanfare..

I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
and an output to DSI0_PHY (same thing on kaanapali - meaning this
patch is potentially wrong and should ref DSI1_PHY instead?)

Konrad

