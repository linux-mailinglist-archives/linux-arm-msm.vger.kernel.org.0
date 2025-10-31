Return-Path: <linux-arm-msm+bounces-79827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C7EC23F55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CEC214F205D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 08:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8059A329382;
	Fri, 31 Oct 2025 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSKXpXsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bh6dcn88"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E131A049
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901067; cv=none; b=BitIxGgmbxrYNDAY/SrpPY1a0ki8Bv90guLxPc1Zboo3dqHmc5zUdop5rWU2RGdvUoltYqsxkFnl0S2WmYMQsmOiUSpdqGhAB/EACiFe7mh85RvSX0HTs5tkXGFoK1QnnoKycCGJFPTOztaKOebTQXJzQpyvmH7LwwtQomHudRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901067; c=relaxed/simple;
	bh=bNGqZbxihhh8ZM8J02vzVpuZCERlaf9gZph121pkYCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kd8tqXX1iOvL2PzkCsQYtcH1nrp37+3e641ETphyQst32UlrCghuIlpzw1QgFZVJX+eyz7AsUwlEBeXM2n4LsIOcSZExdNBXAgk6rOWuY0C9Hkoz6X0v3hM0IEP2mO7izck+R74OL8CQSeirdU6ulJ1IZX8gVQ9wLsWELhK5WN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSKXpXsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bh6dcn88; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V6Ogn13117240
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 08:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaJvVZVi/qoSvZutu9WPcFmfGA+T6c27YzRimaE4g3U=; b=HSKXpXsb3hH4isTT
	6HsA+BHXCHrjxphZBPCR03tzGijypWyyLvhhlZGGBwr6i6btTCqwPhXIxhJTMvZQ
	+5AcXSbxffuC7k9GVLuIXPItLRSdMDzTvQ6wIqKwu9/OxM0Ude82Jj5MHrJwkaRB
	uuRUkZDWV8tzrSn+cY999s3eElh33gEZJKPByCtGOOcS7k1AneM84Yu3xnraAfHN
	2P/Lmr933C0YE2MOrDYMUwC234O75EcxwoMXTgQ8yXm6Nr7pNo7sy7XDNAwwh+km
	tS/+QFA826miIf5KEoySo4CPXbgf5kRl3TcZkQrTooxQ9wNb/aY7jX0IohJr8UwG
	YbhNKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45frkgt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 08:57:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eced2a52ceso6543941cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 01:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761901064; x=1762505864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GaJvVZVi/qoSvZutu9WPcFmfGA+T6c27YzRimaE4g3U=;
        b=Bh6dcn88AU6v8GrMJYGwiurBe4sHq5NTfKXEx+PVIX/4MOVsUielnHoKVOGeF+tTx9
         Dln09Wdc6T/QqtId3hLKNO7kdb9UzrKdQMbmXnoFrASc58NysLUKJjrnQFWlqb1TD+hZ
         m9H4tiH6LpuP/ZlprO1a4JAY+NcCiN4+JSCm1tvWhJNXaomLjUakHqGDA7T5YTe6G8MZ
         ScuEuUVQMhnoxDwXJ+Hafpi7M5mfHbJNAp0Avsdx6ZtVqvY0mMuszle+N5nWJrnZdCHQ
         KBC+WPE7awyod11vm5kZIUUyNY4lqIP73T8fFQ+spLL1ee0pWlzRkrfdnCrDjjWkykWV
         fugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761901064; x=1762505864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GaJvVZVi/qoSvZutu9WPcFmfGA+T6c27YzRimaE4g3U=;
        b=uBXgCO71QdjW0pGaIADpTAS2skyBHZNmb95/vZk+Ti4RkWG2raBrBr8NjyXxChbvNs
         CE8w6bNiMQH3NMXYGB2lHiFwWfm7yhY49cpTqm5oNyi1lm/QTMvrjKZGlfyws5qKoqKB
         pc9CRuQ4/SFkEN/mYuSngSWtZLUuXPUEwKq//AHGxGABJGT3DNMagGtMRJAamniHyk8v
         sBTr1psPoXfTrp14nyEm67l98jTck2cGUnt3W+kiZ/L20fLMNu5piNG4rZEYpn5sS4pT
         dJeFpmgPuPqtY0RbkOIuN07Ig6N5bmSouVU9ZwwpMLAvLHfqtWnGMFbgaWtFtg6unNiV
         lblw==
X-Gm-Message-State: AOJu0Yw5Ctl+r0/YBAbbLzkCByELhlrL+iKqvab4a+dQ7PtBcQ3I2JFH
	8LbIZiyvwcVmIcGN/B0YWVxFg5jj9M5Q8DQ8Av9jdaweEWWJ/m6DFnwh5U5GDQ8RFhGbIppu0/l
	qOiw5JVxcpu4n3KubiP4Tj3ZnAGl2hqTKny5+B5kARECGqYJbdtP0gzhLTuRxuBYUOsgB
X-Gm-Gg: ASbGnctGBlXyRTOAJjWwBazNikg2Zuo2XRh3iolfwaS7dK20o7qrH06xs4qD9vOzry4
	MMV/KDO00fQ7kFB6nsISVNqC9q6cIGlq8UqQ1NR5LJJnPaGRkuIC6gNNhFlWLU5higFumw0N4Aw
	Rn9OpsIuKiNSWLXvWQQ9pvRgEBtutqZ3ewzfBGT5GEWqXj2IhchJjiVCZTtUK17AO3X5Tj1e2Mv
	FY/D+66g7XWTmYGh7EP0WfMrBy1M+cYWPNjhsgUt33MnOAOYt+FGq0rpVKYECWP2SW9q+9nsKHb
	dKapzqjjHy42oJcZkwqFdI9/HOLbJXpiJ5pyvuB64FRkS6yCeJ9myYsBOguKfLjGOV+7ibPRwYr
	xTuoFpZCuqmj1ThbfIiT18FcNo0agI+isMWgRRHdaoBT7Yl6vS09fYSLl
X-Received: by 2002:a05:622a:ce:b0:4ed:2f2b:aadb with SMTP id d75a77b69052e-4ed3100954dmr19658621cf.12.1761901063963;
        Fri, 31 Oct 2025 01:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl9blk7ijqkr5rpwUUW4nIIZVw2skP8seOcSCI7SDxhd4gKnkwI+5IUk8YhqUmXBl3g0Ixsw==
X-Received: by 2002:a05:622a:ce:b0:4ed:2f2b:aadb with SMTP id d75a77b69052e-4ed3100954dmr19658491cf.12.1761901063525;
        Fri, 31 Oct 2025 01:57:43 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70779762e9sm123101366b.7.2025.10.31.01.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:57:43 -0700 (PDT)
Message-ID: <600ec6ce-4411-4d65-b483-c571502b7455@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 09:57:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: rename x1p42100 to purwa
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
 <20251030-rename-dts-2-v1-3-80c0b81c4d77@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251030-rename-dts-2-v1-3-80c0b81c4d77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KupAGGWN c=1 sm=1 tr=0 ts=69047a08 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QDRpGmHLnzjZVnEgbfQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ogvVue7x0i1ZzzRWkNShU6raDmMtOkFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4MSBTYWx0ZWRfXznndVpeEzUBy
 gLHA0CWinla6H017aT6a1ftJaMg4MCdG020Bs+FBHMQXaTEPoRHWWeDPj1LqJvm0aDW1Yikt9hm
 ifoZjdbtQlfW9vSqiNmIyhpQj4T7rqNFxSzcwnX0fePs1KrTPWAQWGx2awmxC4+e8gs2iCJX/vd
 QQywVzuSAa4AY29zeoGCv092SutbrbD4hGo7K6fyNQ8HGGZZWsLhedynWPrXQfItxbLHGTwuck5
 N64LAEJBG93tJX6lBxBnmKfmE2S9/Fce5RtUQx9AfL2nqO9r/v8G8jgCLAxdNpcemAgFymGN7WJ
 Yh599IrKehv4F7SMZ3ASQEcgiNmD3LmJnJG1ie45g/Fa3S9Puw8O2R2ZhwPUqbWkpMKi3XFWbBb
 hiNjgiCrzj16W+3MVXDQSs+ATQ6bTQ==
X-Proofpoint-GUID: ogvVue7x0i1ZzzRWkNShU6raDmMtOkFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310081

On 10/30/25 7:20 PM, Dmitry Baryshkov wrote:
> Follow the example of other platforms and rename X1P42100 to purwa.dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

