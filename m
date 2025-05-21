Return-Path: <linux-arm-msm+bounces-58937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CACE6ABF8AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 17:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD1188C7A48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0139B228CAD;
	Wed, 21 May 2025 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpZJc3Nk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403B91E25F8
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839171; cv=none; b=UaDQT+UEnd+QIjRpzPFekAO+M3LdxypP7xDkxysJ9lnDDu88Z3oKICptBcOGujtJYD+/IYNdkQlYCdOyvUzfZpUYp9Zr5EoK/+dhh9Tudk73GeCTU/Jvl0HtjTJQBD8P8jwr0Bmj1AvQITYoYAoUVax6Y74ds7l1O0FdNEFgq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839171; c=relaxed/simple;
	bh=aNzroqIxURgqE3w48N8JYf0Tg2XM1K6UlHLDOl3M1i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GIDMOk1NuxPF/qLF9vYvsg0qUboLZkZhWmElFgX38a+Yh9CxESFSLjA9swtW6FoZK2NfsAwCmEmZgO/rGLgzoFl/bZiWuDLFfbRzcf+UQRKuLYj+jiayio1U3Pzoo2GYvlpYqNo5/0867xEbJ94f6F57JKQ1GpKaM9vC4Be0/uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpZJc3Nk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XSOB016644
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 14:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4Zvv4Lve36XriRiQpKqbCb+vrtuRWZbxGxM5SWigA4=; b=XpZJc3NkPQt8OtDT
	GLE+y7ZeRuA01WtsNGl6DONfKQuKvfC4im+3olz3RgzjKmCzFR/EOvQknYo0VMML
	S3KNpxtOaXqX4IfdUUlqBuaily69GBZT2haLwjm0FRxUdSl2okPbsm7QcYv3DIdG
	8rdLQdI8mUfq3VwYpJ40Ly+FcJqRX8cJr1SzMiV5a+15Gb7tX2SV1IoHnB5yRvmt
	HpZt+ZT+NMhq/Dmhw8PtqDKIbGdiuHaGu+v6HklTUocnJEcqsH10XRN/WTPj4Ztr
	df+dA+ORoGr9wW43cROAHBia/duLMc27GItA66o5/8wpbXIJit08qlA0MCf3tfUZ
	JYQNEA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9uaw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 14:52:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8cb4b1861so67434456d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 07:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839168; x=1748443968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u4Zvv4Lve36XriRiQpKqbCb+vrtuRWZbxGxM5SWigA4=;
        b=d0q53zfS6yAeik5Cq0SuN38QLGrDciOhgFSuim7Vhm5QGq7fY2E0GeQPgq9a1ZeII5
         rqstdnjnilFV2HBPiV5jMhQJyXbj7SGMw0Xd29zNTY0lDxTVxAFWtKOcooQFHha2OX5/
         fV98GG9Sr+0ArBv8ywWy73j3z3nzsLbiVlvM6f1aZ4RKmRQ7RhA59Lj7SUuzS2H5Ek8y
         1rkGmbgxCoRN9sZNvn94NB1DjZn5BIp5kjPwbWhjrm5H9xTINDOvg3uFHD2N5tZEix12
         ebUObqD1fSbTV9oAcmombR4cVe5npVNr4zUa1UKP+oOrWnbh1Tk0NJsmJ5yA7c91XE1K
         ZZuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS680QHUYTPrzC8phmQYqYA37tlOVocyCWqEDtG7TV8F56AqvgfmXa4YCFM6h4v2MyODziz0ZA7D1Nxe91@vger.kernel.org
X-Gm-Message-State: AOJu0YzDRA/HI5RE7Mi/LDid4nklpYc9JES3FeoX5lRYXW6i6+NzTUNn
	1QAgBg0xGuQMKLEvDj9jkQu6ITd3vA526+uOHm51oGSAuKhzS5RqpEiG09bpaZ9rtIzLGlBg8Bt
	/yHP0GM9jLSHtr9ErToogyO9wO1SM+uooGADhRzCJ96/1QHAyZQhK6TPybWmxETrE+nzS
X-Gm-Gg: ASbGncvE9/mW2VySCWL7vnvN7d+FvbVw090tTiAQZn1QCEOXMnKsj2NzaiHka6XGhpc
	hRSmxOektyPyijD1k6NYCKOQDTO/aHX2si8rn6pPig0XQJhUelHJYwdOJpD3q6pWlzL/wA8KprH
	NXfDxauwiFBqXBKUh4FxfrzwqIP5aRsC2vPpbZzbTzWirulNyoQ0D1KyOzIlYRJ1bo3YVruiVDU
	vNugWN9gy8iz6UDleuFRHRe93ON7d72Yzg5SyPRvb4zFGU8Y7Xp5BhNc+ZG7OfVQHz+wEWHqJSK
	Dx1lM4jZXaNmDL3+zR/BJo12E5Su9eda8nneGoe5rt88FNilIYN1o6Vs7W5dC695CYvyKD+ZKGo
	0sD0Unn8LAClUXbG9kOJ455eARbvYXes+ppkU5STgcpyFXEic/zgZGe99NSd87zN8
X-Received: by 2002:a05:6214:1ccf:b0:6f8:b011:cbac with SMTP id 6a1803df08f44-6f8b08ceae1mr337215426d6.35.1747839168064;
        Wed, 21 May 2025 07:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY5yP0CLnTt//gohFf5UwR7ErzPhdBiAag+ixC0szgLaww/eW1j4yyAr2W8/zdejzufNwJ2g==
X-Received: by 2002:a05:6214:1ccf:b0:6f8:b011:cbac with SMTP id 6a1803df08f44-6f8b08ceae1mr337215096d6.35.1747839167522;
        Wed, 21 May 2025 07:52:47 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c7:69ba:b852:d3f4:8957:5a1e? (2001-14bb-c7-69ba-b852-d3f4-8957-5a1e.rev.dnainternet.fi. [2001:14bb:c7:69ba:b852:d3f4:8957:5a1e])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084dc67bsm27690351fa.59.2025.05.21.07.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 07:52:46 -0700 (PDT)
Message-ID: <045c2ba8-3ac5-4773-ac7b-a6d8625891c8@oss.qualcomm.com>
Date: Wed, 21 May 2025 17:52:45 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Mark FastRPC context banks as
 dma-coherent
To: Xilin Wu <sophon@radxa.com>
Cc: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250416-sc7280-fastrpc-dma-v1-1-60ca91116b1e@radxa.com>
 <tqddtxx25bi6xb5jilpbgfccn7qz4qkonmstfbpz36rl3pnrwt@u4lv2tn46e5z>
 <DAC123579553F487+1871efee-51e7-4049-8a15-9cf8bd286f03@radxa.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <DAC123579553F487+1871efee-51e7-4049-8a15-9cf8bd286f03@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682de8c1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=ksxQWNrZAAAA:8
 a=mSK3FFS5vNSzVinocfkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: Z0WxQvzDcGwAkEElfOSKN-nKt7bz1G0y
X-Proofpoint-GUID: Z0WxQvzDcGwAkEElfOSKN-nKt7bz1G0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE0NSBTYWx0ZWRfXyvJt6aLM7nW4
 6CDuNohUKFncplFf09r5ZhgqGGdl05CSU0P3U0bvHz0O959K16Ud60YS7cyI70NNGpVMF7Iy5UT
 OjWiCwM8+57+VqVuOtuZhVBxhEbdg2IUskkYSLYlUHZdm5iVI/p9TRzGuM00U0VAyWskiMKmyHa
 Aw+0thYwXJgTdat5+xf7SHj3mIqSomMreOJMGbFTMXCGqygGqQXJm9O8YLOHK52TedHlpDSkTHL
 xQpUCrjg7JClvr5GM/Cg59iqysRdIJY+RX5xUoKGJSQDKYlFEwrRKDzUmNeVNHrc7eV3EF20ohp
 2xtKWowHxGHKSEHWeEnw5ghIVY+VqWwiB5rqwgsb1tLKJfHq5ArzJBH2vNGYNBVr0r/sWdsjbpJ
 z3lt4IApLDwzsAsEFRDUlHqp15AY7Y4ZrkZF2Z/yMIX5qKiZeoY5XuU74JJj9IvGaO02gSQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=621 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210145

On 21/05/2025 17:08, Xilin Wu wrote:
> On 2025/5/21 05:34:08, Dmitry Baryshkov wrote:
>> On Wed, Apr 16, 2025 at 06:54:18PM +0800, Xilin Wu wrote:
>>> The FastRPC context banks are DMA-coherent on sc7280 platform. Mark them
>>> as such.
>>>
>>> This allows LLM inferencing on the CDSP using Qualcomm AI Engine Direct
>>> SDK on the qcs6490 platform.
>>>
>>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
>>>   1 file changed, 15 insertions(+)
>>
>> Are context banks coherent on FP5? On Herobrine? Or Nothing Phone?
>>
> 
> Hi,
> 
> This was tested on an upcoming SBC (Radxa Dragon Q6A) with the Qualcomm 
> Linux cdsp firmware. There would be an error in the LLM demo app without 
> this patch.
> 
> I'm honestly not sure about the devices that you mentioned, since I 
> don't have any other sc7280 devices to test.

You have enabled dma-coherency for the several families of devices using 
SC7280, QCM/QCS6490 and SM7350. Some of them might have older firmware, 
etc. We had this issue with SDM845 / RB3 boards.

Bjorn, do we need to revert this patch? See corresponding discussion at 
https://lore.kernel.org/linux-arm-msm/70ffec25-17c9-4424-9d0b-da6560f7160d@quicinc.com

-- 
With best wishes
Dmitry

