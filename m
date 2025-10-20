Return-Path: <linux-arm-msm+bounces-78029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3517ABF1E34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD9DB3AEFB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBA0212F98;
	Mon, 20 Oct 2025 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrYSO5+O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CEE1DF270
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760971207; cv=none; b=BTJ5OLTEgUqUObgd75R8uWJD3VA5JW4k8KR9gGirTVqLlBQZMA1qQ1j/X5y5jKfDtabRwevpPD8qMPV8HcgeQycpfQrfUPW9OtX3lP45+zDReNcAcK7Htz8M4fIARB8EitQxRtgK5GjbpTGmPupxadpFekcCXA9QRsatCvFDAHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760971207; c=relaxed/simple;
	bh=IKm0z6iO1hIaheLCdQScebPMc2ctCaCdPFDDsMKTMK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZrfozfhd2Ri/JuGryYdzq5HtjZDKqxEBQHbDwcTZVBIibpc0bJFKXERswfyqdUTelFRijg85eMiMVssBmRMfcfS0YBAN0BNLSgfl/MicVjB6tSNV45Izv2vNJm4cjKWK9Q7XUKNmRDB9Sqinuu81/muz11PVePDWVgjC/ovx+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrYSO5+O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KCVU0R004849
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Zu6f+vYXQ3o69XdqhkZydYNTKJw9PQzWWyZv/yxYgk=; b=NrYSO5+OddTicNM8
	NDpvdGDeS882JLzuYd/rX6sgk55YMSvvn56Hxviyl3Jm2/YRmW9YX+0nM5mNsV+s
	+VEczKS4S8mGLpvqaUvleE8IJhTy1Be+Fv1VMG0qQF+imN4ovukzGtTKb2oJZy3T
	At2uaEAHaB2C8XtWm6m7PXiIlhZIRbV8DnDZF+1y2Rkz6ruZoiFejuUScODgMmZM
	zyd1e0cWMd4Fiq9ImuTB5kUf43/vBbcSyJLI1qFSEuSxOo7BIy5hjmvp7rfz6VUJ
	8wRU4R/+ChGz1ao9nqiaIUGmnY34hTXnF9eRIgJ3vG0mYQgYLJMn7ofdxR0LMddv
	69ydGA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27hw3vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:40:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-826b30ed087so13683926d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760971202; x=1761576002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Zu6f+vYXQ3o69XdqhkZydYNTKJw9PQzWWyZv/yxYgk=;
        b=Fb7hhQmbBQ6XNTIg4BZfPQg1BZJdNhuxA+KVwBWSmpVoZcI8x6ss57dQxMMN8Qqoab
         SHAK3AjddITBuG3V6TnqvMdejNFk8BfCee4IJChAGzEqxrSGQQ1Qn9kNIGR3+0lpXupG
         pCheniUnNavjkYYwU+Ys6f0wsz/TcO7774pUfSo7NY83e840ZNZDKSxetUUMo5zigW5c
         xb2sKSUv9VPlGpyb1TiG38QPIVx9zBDniAOR3DIPfx46xVexy0V/67hyvms9Fq6RaBxo
         nmrTeVIdSS8zUZn/hXjlsngXn5Z80LPM0EBLK/enwCRHlSiZPrRuMDmOSMuQdrKSsoDE
         KMow==
X-Forwarded-Encrypted: i=1; AJvYcCWbBp32+cs1PcUo3eR13u0t9/XlzLztmrH2VzpeWp57VqCg+4/CSuHk14vBbNONlj2P4wpv2RddQCBn+854@vger.kernel.org
X-Gm-Message-State: AOJu0YwgPtDl1uvCC6yczBJyqrajw7lNSXK5ndA9gu4Bd6TLdfAy8W4V
	cFdorSMSIVY7uA02uIaE/Xp8cFCpnhScMGpTiiVsdOzUibccIUXS4QpIRQGtH867cCCYSJo6nS8
	AlX0Orxn8qrVonm6aqeo23O3b0iXWYifi1xPz0nPys8QjDxFSTb1Rr57IxWM/PR8FMnSc
X-Gm-Gg: ASbGncuaqRvOEZAePk4BGlUSA1NRHb8q0wKujuDYCx+6rnY/XxKh2Rqx59ytSP3T7DC
	nt4VLyVeYVa+beESJSv2IT+fhroi8OU0LgTytKrv7MpXSyEC87F4Hxf1FCEgmOv4vQXuWY/3mNQ
	ffA03/IzdBR7V/tJFUTrXCrjna87llLzb6Hv3Pa3v761oNrOapLngtNLoB8rs96sxdgognVMKMd
	kQW1hIQhaYoXkHTWw0yg6vNNPGHKmR3cSANJMdSgkc1BwtIGXoIGwhGW5gQG7DMTPTHKPfR6LqQ
	1+bARnOxSyl8Z+ExUQPVQjVA1lWVumkXX1jsuPc92k9vwluMyEG7GYwMRKJ++1sTq9NdfYold7+
	K7JcRxZFtgYr6IClWz5SGWPQSXKHQVJg7gTejeVIOHf8e5dfPsjY0qKBp
X-Received: by 2002:a05:622a:2c9:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4e89d30dfccmr120394561cf.4.1760971202330;
        Mon, 20 Oct 2025 07:40:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzno6zE7d8ywaNnHDQb/mNOI0HSKIv2hIac/LvxNv4AS9Wp4Sv7j0diyZ/CVmZsJCO7Mn8DA==
X-Received: by 2002:a05:622a:2c9:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4e89d30dfccmr120394271cf.4.1760971201756;
        Mon, 20 Oct 2025 07:40:01 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e89713ffsm809097366b.36.2025.10.20.07.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 07:40:01 -0700 (PDT)
Message-ID: <60a48dfb-e266-425d-8cfb-574c637f5e9d@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 16:39:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] ASoC: qcom: q6asm: handle the responses after closing
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>
 <DDN83LOTCUIP.5O05FBN02AZB@linaro.org>
 <7c0dad34-cb4c-4912-9406-2e559b91142a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7c0dad34-cb4c-4912-9406-2e559b91142a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX8nRkFHFtD+xl
 4GU/eN0PZGCyh9PJ7XUa87g6pAIubRr1M1/TzB3tGBw4uzduik7fsPWUNTwCdmje6JfQfSXScMP
 FYX6e5V6ECPfXidGM+QFzEHY91SfBiKAIXGQr3gxZvZXChG5mD25o/bsAZxBJBNXzRQE8WKktqs
 NyQ0KcL7kHKyZGNLsWcGtI8vz0cGY8GqceJPwwhp0HJHJmWcmCEzGP2uckLmAoOT8JxI6uLbKRp
 krscoZPC/Llf6Xdb6u/kzsv92JR/9/mtNalkVClyys7AiZdnNmm6zCp6diehoXrIO2bSxs8d2vS
 vDpsnc23xTI6rCP+w1+inPo4xHkc5iMCJz8Dd/XF9nZjdEhyY8CjlKpVVkzbFdCVLRv4/rT5opZ
 yAYpxZsT1P82KHwCqiCBtTAHncddUQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f649c3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iwlf0Vfv9nm2vOHXmi0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: eSSUp-Z0NhXx74Wml_YrSsUBKAS_aGlc
X-Proofpoint-ORIG-GUID: eSSUp-Z0NhXx74Wml_YrSsUBKAS_aGlc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On 10/20/25 4:37 PM, Srinivas Kandagatla wrote:
> On 10/20/25 3:35 PM, Alexey Klimov wrote:
>> On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
>>> For record path, multiple read requests are queued to dsp in advance.
>>> However when data stream is closed, the pending read requests are rejected
>>> by the dsp and a response is sent to the driver, this case is not handled
>>> in the driver resulting in errors like below
>>>
>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>
>>> This is same for both write and eos.
>>>
>>> Fix this by allowing ASM_DATA_CMD_READ_V2, ASM_DATA_CMD_EOS and
>>> ASM_DATA_CMD_WRITE_V2 as expected response.
>>>
>>> Reported-by: Martino Facchin <m.facchin@arduino.cc>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> I was also reporting this error months ago.
>> Thanks for fixing this.
>>
>> FWIW there is also DSP timeout error on Audioreach-based platforms.
> there should be only one for SPF get state command.
> 
> qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
> 
> This is expected as we are checking for DSP readiness and it will
> timeout if the dsp is not ready.

Can we make the UX better by adding "bool timeout_expected" in the
path that we "want" it to fail?

(I have no clue how this is tied together, this is a high-level idea)

Konrad

