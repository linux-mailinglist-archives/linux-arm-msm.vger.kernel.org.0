Return-Path: <linux-arm-msm+bounces-86165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FACCCD53EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52DC2300A367
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E228287E;
	Mon, 22 Dec 2025 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okPfP1sF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WnyhTMLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3422DC782
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394519; cv=none; b=ZlZpyEYiOhJ9/E9yqNc8Xap1WozVsAKHTm702S8xDhPWuicvHJy/JbarLSF8fvtZE5N++D/uVyj6YUfUGWSNjwN9N4ebAIZLvQAMr0JuyKZWzavk1LDgxfhrWxUoXmUwD01opzoht4cbrF+uoQnxYpyrTpSbLMN35XQSGwrt/QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394519; c=relaxed/simple;
	bh=wqfHKF6dniolNGCUkXSyAbZM018zG3vBScGSPocyyWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvA/Utr0TJFWPOegyXUTl2pgzM1FHudtoCfuokLJYr8jv/+KTDYCSEYOrNLcLfRV5TsXIcE81HFY3bcj0w2gBFZs7n9e7VmViMKHa3DPV/pHSvRJ1dz8NEz5sibtftLAUWOY7dxj32PmBm4UGIaESjl8wJPMO3G7zfEYYtnPUD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okPfP1sF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WnyhTMLf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7XZwE3761844
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMF7/7ba2tMpgWwab2kQ9bTMRzziaxOCdiu3Y60sfW8=; b=okPfP1sF0b4HyjRa
	3BH/WDOLCqJAVqhjsI5Z7mz65JSFkSfCf4qUjOSSY3FMs1oLCI/ULMV8EkQcdKMU
	uKPgRUeFjA3a2KgQMNjfJJ86WbL+d4NYyBgEFgJ+1XtEDA67Z+QexqufdsCGkrXt
	xhPpfmMxAzzpBnK/TF7giM/5DI5XT3koK7HvJ3ePUIyfqf9M3faHRhhn/O0UPEUl
	FD/wYwyQ0jDDcjGBg4kctq1XW74lJhjSlW1QGzkA9fCYL6odpfrKtV2WMHaJ7rar
	DKEwH3AlfccgCWbi/diOTE7IAnEEnXSgzVxvJYv3FDbGEADzLVCydo5URGVs20xh
	MkQPKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux4e18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:08:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34a9bb41009so5839039a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766394516; x=1766999316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NMF7/7ba2tMpgWwab2kQ9bTMRzziaxOCdiu3Y60sfW8=;
        b=WnyhTMLfMsResRnj7xQ1MaXY1+YQXLGytdTlEBLhzY00c/Qw82lIA4s1ZugPrT/LMN
         cakxXuzD92lW0slPx3Bs8LcPtRRWxeZ3hdCo5EAHb6E0moIUOvGO+XuzT3jKfyiCfEWR
         yNiQSRg4BcssaT/BGiFmw+O1bwCPkgDhgki64P5pPYcyBIdPAtVbu3QHYOIxmquyOggT
         BP92epa6gMSVucTli57QYhlaOS17OoZpLnrERb8DRxCfMQZamoHDpBZ3ZLqv9s/cDcmh
         cYRNycCZxU5w9OLmqwONFdWlXcWIWWkcUGW2Q2IVUr9zmcRqS1EHq6XdB2C0Y+BkmjEX
         vRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766394516; x=1766999316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMF7/7ba2tMpgWwab2kQ9bTMRzziaxOCdiu3Y60sfW8=;
        b=wWH5YnodEWnR2NrahskE3qgNTvZp/IKY4pU/1uz+lbUccWQIrMv4TzPAZoZ9UG0ZS8
         8B9atnNhhMKHvFBz/OAJFXH2xbNoDruMBEqfP3kHPGbnHpyTSjimH9o16dnaCQtvGxdV
         5MN29j/3KIWJ8+cWOC+0lOqLAuMVkYWiHRalThDXvkQk7rYmPKqquNC+AzsrKy44enuV
         t68u+5k074IFCKkmCLO5Sgg3Lz+ZlnevBk5Ub5Kfu7i43rXWemnLGWfIahBKlDOLrH+j
         XdDGSWybEZGo7QpVfRABd5cnJFLy1tsYIfTuzBGLyMuNgWYGIu1snPzIy7VHPcVQKXNF
         JFbg==
X-Forwarded-Encrypted: i=1; AJvYcCX8llI2c1GvntFzGiy0X1lNzeZNUIvzSu84b2LOFZsW2guLbjB/tXgEk587mzSeos8M0qUOqGBLtPyCGCYa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1/D1rrSXbjAefs74IB8eaGB5FWurNufGUdWSPC6pd5m3668Vq
	RcdFjfAMi13djTu040hFC+ERp7fp/TabJcWxfbw5vaSt7U9fBCWkzqAUVbKdGdUzXuVN1P4Emg9
	BYQ0l42FzqZ3kGhbhMalyEZkJAGfWBjPyQBKO7eAOh7PGTUwVO+8x6AGorK2qn8lUWb9N
X-Gm-Gg: AY/fxX5bDVBvNC/qeFdMvnlYJqKtX1EXkwyTSEC6UIe7EwjmEfFExtMle+XNxMFeIxL
	oV/tkGCo9Nvch6ZJEEhzYSTntd7bjh5S7l5evKUjOO95XE2ijWmOXBJAoX77Dh/pSQz3nyIn/kV
	xYdHSp/0MFtt63dnsUr5PArBW4G0hy3v8WTgRn3/dWgbyba38BR5ItcC6j1hThUakmRUBBGLmNA
	roYqrhajNJmLukE8gekxhpfo5rky/yHpf7bXzs/yVNIbTmXTEpuJKrqZv2428VSyFNdIG0LDxRM
	UEJ+IO6In0QeRjs8iMmioLvbGNgSfoWwCaTlcjFsjLdQHp8cjMVyuRG9KJJwrruX1tmVNRBxYRI
	pa0rbqd1ryoKS+aRqh+EkNZCYgug23EcccnuBs33Ogg==
X-Received: by 2002:a05:6a20:e290:b0:364:13c3:3dd0 with SMTP id adf61e73a8af0-376a8eb6c35mr10547145637.36.1766394515785;
        Mon, 22 Dec 2025 01:08:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl6B6o/j2hlUuO96VKa8xLDI3u56QgD3CAMpPMvZyXFrZI8ZfnFJrUAexsmLszQmxJCGIrWg==
X-Received: by 2002:a05:6a20:e290:b0:364:13c3:3dd0 with SMTP id adf61e73a8af0-376a8eb6c35mr10547120637.36.1766394515234;
        Mon, 22 Dec 2025 01:08:35 -0800 (PST)
Received: from [10.204.86.173] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm8650695a12.36.2025.12.22.01.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:08:34 -0800 (PST)
Message-ID: <b3d2c54d-f2ea-420a-b7f3-b9e60a96a841@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 14:38:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
To: Rob Herring <robh@kernel.org>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
References: <20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com>
 <20251211100933.1285093-2-kumari.pallavi@oss.qualcomm.com>
 <20251211154139.GA1424272-robh@kernel.org>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <20251211154139.GA1424272-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hYEC4EnrdcWyAMD355iJSMk3_SLO6pFu
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=69490a94 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Gr6j673y5SSln3Ut_ogA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: hYEC4EnrdcWyAMD355iJSMk3_SLO6pFu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MiBTYWx0ZWRfX9V3oVODZX0nA
 BHh48EKXUXuqvBBP61QEY3DJQNmn7M7mmdMn+/TvL2bW9jBl9tEJRvzFpblKLjMgJc/HgrKqoVT
 cjrclGRUJWSDtXRTJYgU0+3b5FXU7DDUV4Cs4uUMHC5dbN9W3403SXwhv4L1SjX3CPNnO6MRoue
 RkR7bk8lsOr7zT6RnZBoiuMCHhcbwu27IqX+G2Ai5TD/LERmw/38ZtEG62i5KpNo+5v1P9Ni7Lz
 R15rS3PtVD+8fVbRj32IFvRmin5UXuNsup32qTJTkRow6AlRTbLGw+/dLRjqQYAwZwTRlOlsQL8
 gJ/OnmMTUVXXhbNthy+hbr8zfePuBKOvYPMGey0+J5bNtxgrquBWuiadRzWvpToKHHf30O6HlM1
 bTQgkG3gr+VKHxiuMJHR1X30jfTuBGyjNNb8Cc4B9928DPiJ3BP1j7uCX2NM7AKU/+q6cLdekON
 9KwXT5IQDfJTRpl0Hjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220082



On 12/11/2025 9:11 PM, Rob Herring wrote:
> On Thu, Dec 11, 2025 at 03:39:30PM +0530, Kumari Pallavi wrote:
>> Kaanapali introduces changes in DSP IOVA layout and CDSP DMA addressing
>> that differ from previous SoCs. The SID field moves within the physical
>> address, and CDSP now supports a wider DMA range, requiring updated
>> sid_pos and DMA mask handling in the driver.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> index 3f6199fc9ae6..142309e2c656 100644
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -18,7 +18,12 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,fastrpc
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,kaanapali-fastrpc
>> +          - const: qcom,fastrpc
> 
> Does the driver work at all on this platform without the changes in this
> series? If not, then it is not compatible with "qcom,fastrpc" as you
> say here.
> 

Thanks for the clarification
No, it doesn't work on kaanapali without this patch series
I have updated the bindings accordingly to allow
either "qcom,kaanapali-fastrpc" for Kaanapali or "qcom,fastrpc"
for older platforms

properties:
   compatible:
     enum:
       - qcom,kaanapali-fastrpc
       - qcom,fastrpc

Regards,
Pallavi

> Rob


