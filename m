Return-Path: <linux-arm-msm+bounces-84381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E159CA3DBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 14:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 389DC30087B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 13:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98EE3343D85;
	Thu,  4 Dec 2025 13:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="daWQPVHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UeJ0peyG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B709A343D80
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 13:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764855281; cv=none; b=f8Uet2uy0GD2M9W/AppRisl3zdP9o7Y9QNh6lDetX4og43IIa9UYuU1KUZ1SGxy/xFdTNGogwuN+C1k+JhRxsqmt1GIouIkxD55JLhmlGq34bhqGzWhWNRRC2rlrW14a1GrCkJOTOktWgUpBMoKt1rcZInuuDYcUkyVbV8oURdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764855281; c=relaxed/simple;
	bh=Q2jvwnjGApk/ez8BkscDTm8TnqH3uXBkQS0E7jDf1M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRUz/rjzm6Svua8VBOqeX3VfBMLhF004XhP06LWFowP+gtMyr9KAaSOc3HlioJPgNbMzw3umppuo08XxB5f4IDApbR4KUtbNDKoqCszEGx0cv2xaTpgDSVgXGqOVlHmi/ub/gT7FwAcXRZyQa9W579JOr9bniflQ6mGGmXH4JCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=daWQPVHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UeJ0peyG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AEuHj1159643
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 13:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xCCJoAcemcOQIYIqAm5SIGE/QGpHdFGfYCUD4a1Bnug=; b=daWQPVHGlda3mdX4
	iJ3dbT3v4eiAjQprBJCyOzHNQTNxOKFqaeHxj03O0OwqWmTruXQ07GFako8NyqZ5
	5omjtjwWgXKfAnlpf2ks+3EGXCE+Tk2Q7r1JzI0NMo/xiXbT9RzkQoRTa7Bdapk/
	gQPbhuWeuTu+QCvrLkeehGTqYf7LmcsRUA/rlDByKsWijov9X5FCfjMS9ZD2gPMB
	enWqcHK7bUaijDr1cwNUCPWMuBj1STJNLRm5adwsDVPkMcwaVNuRQ7UaOXa+/S50
	7gllFjbxutBtooU3NWjZM+KxNPE3rxvrTJkoL2RLW2csxsNlVZT3hNVKbsvtLqxy
	6e7gQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atu3h2wvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 13:34:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b29f90f9fdso22903185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 05:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764855275; x=1765460075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCCJoAcemcOQIYIqAm5SIGE/QGpHdFGfYCUD4a1Bnug=;
        b=UeJ0peyG+W5eMnnyeQgguMlai7EPnNmqXwjfNjGD6kYB4MJDoXnoWUyZ3L0AAoEo3b
         YLuCsKL8zyBG1rcIUT2fcThv9XXoHupT2CD1Zf9FN5TS7+FJGGQyb889HpLYk4dW+dQN
         tXEbxwuYRNJPfgNPHUZlP3IyHj4Q798J1xLV6WTn1oVno/gA8pYVeZpqXhyLyG0Rafg5
         mmTMKaiJP08tfxMVv5DLJtKc0APIXTr+XODeF/JIIaWUDDV5NjHhKhRqKpcFrRC+wIf+
         7SkoaV5+LhnFlzVbhRjdffTte6k/2KXuwoMgy+EMX7z1gjrTNgHeQz0hKWiyNuBoJej7
         AiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764855275; x=1765460075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCCJoAcemcOQIYIqAm5SIGE/QGpHdFGfYCUD4a1Bnug=;
        b=E8KGeYZNpk8/cQM9Sa5/0Elj/Oq/vY1F6T+YbmUgVTaHm7BRIzTqoC8JoGnY4rXBdO
         InHMy7fv2PjgJ5B6qLLNEa7dHP95TIkoxDyRK56gcqloy0W1VlS+9GhmRSTfVmlPfcXt
         E9m3SHz87roFqMU/9K7x8D0/32/IUwj0b0TCSeCw5EwJ1dxsny4MMZP3VCGlGs1mCy1S
         DUzI5QGXCL00IZFe0ML2D5pXXt4Wx0k5SJEZqc0WuInfPKa0Rxxh5zc7XG+yX0ZVR5T1
         8aii8qS7ugQg6K9Y1Hw9hQfkRmMdsiF7tLP/j8iV13EKkxAMXPOl//1vtavwvoNhLC7w
         9VLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeHgyPQh7GBJV1NXD73C5YYCBmItv7WrwtnAGip1JOZd6mJM6tdGHIDIN+wl1ZEgDHzq7eBhbL5NIqtpUJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8WkmXqJLh1TBL4lhiXb4FhKFokHzbuvOM/CBTdVMJK1sSDidT
	yhiihpNkb7MDboGGYgfS95iUv7CRSX8V8KLQqbN4Wgxg2nyeVn6Va/jnoa2EvBRDHFxy3dgYpla
	h8rMeawYn+c6oiQfZucD8OJC6HuqnvNrBTBO8Ao3sN85n7niOMdm6peBj8NFjf9eaOamz
X-Gm-Gg: ASbGncuwYo2ex30eEPTIv23O9lspDhRA5v4V6dQl6uwFun8bgjyPNGPPoNOwVR7EKYs
	JgWnRSpw0n0rSsF9IPHQnlmCavkfnq+mea3JpmlKxUfHjDHOtS8NeeMl3i0LwwuqCTQI7prGCjg
	cLGih6bcinui46Lgb24palPEJAeQg8pQ2UMRC1FD3/HapWmuMVZJwUbglKkfFaJP4k3femCgmmx
	6dPEG+YPk4pm1X2zh3+0ugBvZu/6t8AaOvOoyYR7sMkT8uw2xWgg+Vy6lN06X1tGt8+Kijx18sU
	4Ifo3E1lL66jg/aTgl1bJPofuZXAlSSJU+0D0RwuRg77ojD/z25Kx20yTjiI09diNuqYh4Om2OV
	BdWoBtIlxUvmbn7401mXTPxRQrECW2SYcPGgCxFD68ZxPwC6LQkId7ts9cNCmX+CF1Q==
X-Received: by 2002:a05:620a:4688:b0:8b2:dbf7:5193 with SMTP id af79cd13be357-8b5f9507b99mr567901085a.8.1764855274658;
        Thu, 04 Dec 2025 05:34:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWjMuRv8TnQVdBKFwGRc+UzlpNCLY6fm6IIDqIWP3X/6LSuHl/kT+6n0xNsqpZSClOaJAU0g==
X-Received: by 2002:a05:620a:4688:b0:8b2:dbf7:5193 with SMTP id af79cd13be357-8b5f9507b99mr567896485a.8.1764855274118;
        Thu, 04 Dec 2025 05:34:34 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4975c56sm127125466b.33.2025.12.04.05.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 05:34:33 -0800 (PST)
Message-ID: <bc89b3ac-242f-4890-9996-060c4a0f2b67@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:34:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add vibrator
 support
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com>
 <20251204-aw86938-driver-v1-3-ebd71868df3a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-aw86938-driver-v1-3-ebd71868df3a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExMCBTYWx0ZWRfX7pwtNUQZWnQc
 o0chDhcuLxueIfhIpXh1eaeos5KGQ1KcIv0g/UzmunLZoFag4alLPRWHMohY2T1Meav0pn+r5Uk
 gZ8754jQLQ2f2sErpNhM4eszEaHKDd1xyOPO71skCzmBWxoZ6IFs1Epsgqs1/OLfilebRjFd+FJ
 XcwAErWcZPaouSIgTcgATED1ZTmcK4c+5GHV7l8+uwqMzX8fCCp/xJ0/nSQ/34q18OZCjyMUxoA
 IGGE/PCVY4gOsDjRchyNP+5Dh2aJPA5ZtxzFDsIKLjlj4oyThJ0d0QQ9zLXf9ny+is/Nk4XT/R4
 AnokqADQ48XEM5NVfUcO1fDyatd8KU96Jq+Otpqn8NJbR5csLJ4OJLYh/i4Vr6ZG1GzRjLFMhfQ
 PFTmIh4ZhR37UHykBkwlUSZ0GnqczA==
X-Proofpoint-GUID: 8WHY8_PHclLxjdMPvxiW0udDJ5IT1FVz
X-Authority-Analysis: v=2.4 cv=KJxXzVFo c=1 sm=1 tr=0 ts=69318deb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=nkaG5teaT87xZXm8SjwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 8WHY8_PHclLxjdMPvxiW0udDJ5IT1FVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040110

On 12/4/25 1:29 PM, Griffin Kroah-Hartman wrote:
> Add the required node for haptic playback (Awinic AW86938)
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 17 +++++++++++++++++

The DTS is unfortunately still not merged :/

Please arrange with Luca and either squash this into the resubmission
(depending on how the driver changes go for the vibrator) or resend it
afterwards

>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index 0a758fb7f4d413a84cdae695c38616fc6075db67..8c43bc9c1d8312f22ad0aeed84b23d52910e0ca6 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -717,6 +717,16 @@ vreg_l7p: ldo7 {
>  
>  	/* VL53L3 ToF @ 0x29 */
>  	/* AW86938FCR vibrator @ 0x5a */

You can remove this comment now

The remainder of the patch lgtm

Konrad

