Return-Path: <linux-arm-msm+bounces-91607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPWuLjGcgWlwHwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:56:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EF1D57FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6FE430055F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB83D38E5D6;
	Tue,  3 Feb 2026 06:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OflcdSEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hp/V7i89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA6E36CE08
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770101464; cv=none; b=ZqYM1tchitYeIlIEcU7pKp9TVG9Q7Q8/eGxwslgpw/LeF4n3azyfivWf8e7I5J6rMgU4SsvEjiNkLsZPWQI2Z77m04w3q01xD8kdze+ybaCb7Ma+pgAiKoEC7KhBom7ybqPZqo5N0vCpLPz5S0rx64+T/q2YJVn1tkctN9/aSuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770101464; c=relaxed/simple;
	bh=x1tsE4ZhtJU4C3sZzvuspPuK6Vq3c3UlJjmlYbXa1EQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YdE1PNskD8kb//MmwyVJgcMdox4vyF8NzpRmYshc1dX6eefUu+XF2v1rVVuAzuOw/mGT2Dn9adg5Wt/JXWE7gpMX+TN+9efctvsFWhxWyIrYP79ssLAbxaNlLMrrVCRSWLf5qEeVS145ucmDD4wnDT7YuPyuTVJwr/kgoijK97E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OflcdSEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hp/V7i89; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612Ko5762885174
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1pH55PL93WRwbH9y5bpsksIG5KU6syJ1vyIyGzGvEs=; b=OflcdSEmEe1DRL9v
	GThpDpYElxBY/38afA3xRjC1co3XevyphhwZzaQSSb4YQUQzu/B+MFb5EiOUshUd
	J7OYT2RGLUUjP47e9dTSwEs2ODYmSjzfIDgyd9PCGGB0N6SJXAJS12CHnjegI4YC
	KHKZ2WxjFwHg9HRQN/GMK+fREZKxOz3vLuBBxpywpGk+quXDhC7tgnuTlfA8d6SS
	FVUv13Lsw/l9FbS32R4XRIFvdboV7e4U5EPqwDWBuVqH3HTPpn4ElrZagDWWxK6K
	OctfEpz9zxN44hQ7P34X+UPl2Eo/96FloL9WCJjODckgiJohewIvvQh3ut5kJk4J
	H6qlIg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3k28j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:51:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a377e15716so142510375ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770101462; x=1770706262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1pH55PL93WRwbH9y5bpsksIG5KU6syJ1vyIyGzGvEs=;
        b=hp/V7i89vYRPjAurmHWonzLeL4YlKWD9+p80e40pOEliBYE5JgL/dQDmBvllwm46ab
         BfkR3IH9LsM8Iu+XnCm5KbX6QHRgI9/d0Ywr16O9XwwEy8go10JJXkYikI19lpylqG6D
         U+SxJBn+3uE0snMm5cgT1zySZgSK/kZbweDBlEHOh/uD7uIX8k4uEZ99UR91rZN9CiEW
         NAp32fz76d/Tas5CrpK/VZqu49TSFyZDj6vAiZ93tBn8c8uMOFustQPga1F7fMl408nl
         eJ+4nnH8UUJgCPrrHaBJk/b2vZVKonHBxmZMfia8W/7SAkTdhIyVb2y0ESlV8gZoJ/H3
         /zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770101462; x=1770706262;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r1pH55PL93WRwbH9y5bpsksIG5KU6syJ1vyIyGzGvEs=;
        b=WTGo29LkVE+7t62pnnQmkG+icQqeE88BmCh7ATGeAt3OGbPBDc2q1cIBcXpBoSOPEr
         c4lli5EdE1f7o1JRswyNNapwFVUh0xPeNpuQTT1Dkvakswu4Ur7/vdscMXfOgV6SuruE
         97vEeduAEa+4gCqNMUDj4bR3zBd5wEAh9rveDzUZ3Umj8RxOZMHqBWA8rsjNWBMmOAJV
         rQsDkrlrZ9wx6gHCKsQG26AnvrNAU+8i5hq8qf8369WZWy39/HPiM3L7XzeQqXfCFspd
         WWmT0gdagNtUL6qb3oRAscxR1kbmaMhhonTF4Zmp2mgY7XFa2g133KzrM6S3zU1rHY5F
         YQTw==
X-Forwarded-Encrypted: i=1; AJvYcCWiDZicpNnL0H+2hOQjsLT8gjho+t6R5bDZioLSKDApX0hYJQORZAO81ys0BdlsG6Q09vlT7ZHTYsejkLPi@vger.kernel.org
X-Gm-Message-State: AOJu0YywLyT2m+Fpw+zRn0+UAU/WYarJ8cy7SIrNqN3uxBnZH9tXAhp3
	T98A79OoJRIcOBsrcSjswMo8KtFBtNZs5LCg+edklsqYbnxF54OzNQPNGCsT+uuxonXCS5NKC8L
	Oo/7ImyoBzbtIoR8e0Yj/YutSw1nSxUM/8IfE0g0lBrMoGTNgoA28sAc7A/tP4hXwgSyc
X-Gm-Gg: AZuq6aJ/SN3kOI5z/gtB7hA1P45UaAhuz7aMeMw4+I3sSd2fx4koyeVM6cAFt6ngNNg
	0aQqo8+Hh90TJjWM2y6bsC/tX2IwcjSbt5hBlA8xGdPrTqAnRRY0YSDbqMqo9dauUxJiTJOnLqU
	melHAOimBHXWCq/U3TtazCOLktiZvd8uSqimaRYp7lKDKmc/L3bUNgwwPW9sysB4U0HIyBerAWr
	9SeyBPmQfWCcvS1S6OmZx/9CA6/XMU9+Z9ZhLYCtXRpNnpait2wZ831Vd8YC4T+BW8DpeQt4l8t
	5hTe73gATwlW1dGmMEhswe05DI8vSwv/hu5yqnelmc+dZk8RE+dWce5vvWGYxxRyqVa3geyHe/1
	UfrLpqppyvs08joEBwT67yo4GT6DgLG9mITC3WA==
X-Received: by 2002:a17:902:f64d:b0:2a7:9ded:9b48 with SMTP id d9443c01a7336-2a8d9919450mr149298735ad.38.1770101461789;
        Mon, 02 Feb 2026 22:51:01 -0800 (PST)
X-Received: by 2002:a17:902:f64d:b0:2a7:9ded:9b48 with SMTP id d9443c01a7336-2a8d9919450mr149298635ad.38.1770101461324;
        Mon, 02 Feb 2026 22:51:01 -0800 (PST)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4317sm169781535ad.85.2026.02.02.22.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 22:51:00 -0800 (PST)
Subject: Re: [PATCH v2] soc: qcom: ice: Stop probe deferring once ICE isn't
 detected
To: Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh+dt@kernel.org,
        abelvesa@kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260202082534.121042-1-sumit.garg@kernel.org>
 <eec7aa76-bdef-4c61-8138-1cf111378afb@oss.qualcomm.com>
 <frq54ya6nounvn3rmqklbkrhobds3dznpaxkcnlmcjr7gtbkgu@qi5xyb4o4sno>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <edc737f7-0148-105c-8121-4be0d758647c@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 12:20:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <frq54ya6nounvn3rmqklbkrhobds3dznpaxkcnlmcjr7gtbkgu@qi5xyb4o4sno>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WCTKr7NOONLjA5Gl1rJ4QfTo2b8i4AA8
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=69819ad6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=aiM2xm0B1U5VkYVJFJ0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WCTKr7NOONLjA5Gl1rJ4QfTo2b8i4AA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA1MyBTYWx0ZWRfXzjVyhatjVDbe
 Rw5o67vtAXqgRxWmFz2FsINZFPQERzZV+DfR7Ikb7edmS2qF6EpoYIe5eo0jQWu3Ib7Jg9JAziv
 pznCuQQZxGo7u4OYsFdBfawQM+wg3ab48AK1+5kMc8PZPQZIFs+D0hyS+NNMYlS/+1tn9SAFaGM
 jWVgEzPkBckWKlSbHgd8bVWza/p2T2nm+BTf00ZLPMY5Db11Iqvw62RyXa7HWJBQaLo3/jDjp7d
 vY0mnxbrlcM0ZZSWOcWv9ytN1+SgkD3f4nUL4LxrzSuVZJ89Zl/od/bzFoXLPGTv07bTE9ofOYp
 L3/V4+pYlgFvn1EdGtDERm1v0hWtBxWixDBFsFSAMOqeBewtgHck2mtAC17EiGEnVSaJphhdCGs
 YOByU23GkEnYtbcR7DaT7wP0IGXMRTwyHUhGYqeTRzazEJiOCNIQuDoYoy3A5PU9/sgqirWOiCg
 Hq5sIw2gKv0xZSCOCIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91607-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5EF1D57FC
X-Rspamd-Action: no action



On 2/2/2026 4:25 PM, Manivannan Sadhasivam wrote:
> On Mon, Feb 02, 2026 at 11:51:51AM +0100, Konrad Dybcio wrote:
>> On 2/2/26 9:25 AM, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> ICE related SCM calls may not be supported in every TZ environment like
>>> OP-TEE or a no-TZ environment too. So let's try to stop probe deferring
>>> when it's known that ICE feature isn't supported.
>>>
>>> This problem only came to notice after the inline encryption drivers were
>>> enabled in the arm64 defconfig by: commit 5f37788adedd ("arm64: defconfig:
>>> Enable SCSI UFS Crypto and Block Inline encryption drivers").
>>>
>>> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>>
>>> Changes in v2:
>>> - Keep the probe deferring intact but stop it once it's know ICE SCM
>>>   calls aren't supported by the TZ firmware.
>>>
>>>  drivers/soc/qcom/ice.c | 11 +++++++----
>>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>>> index b203bc685cad..5a630c9010ee 100644
>>> --- a/drivers/soc/qcom/ice.c
>>> +++ b/drivers/soc/qcom/ice.c
>>> @@ -559,7 +559,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>>  
>>>  	if (!qcom_scm_ice_available()) {
>>>  		dev_warn(dev, "ICE SCM interface not found\n");
>>> -		return NULL;
>>> +		return ERR_PTR(-EOPNOTSUPP);
>>>  	}
>>>  
>>>  	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
>>> @@ -648,11 +648,14 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>>>  	}
>>>  
>>>  	ice = platform_get_drvdata(pdev);
>>> -	if (!ice) {
>>> +	if (IS_ERR_OR_NULL(ice)) {
>>>  		dev_err(dev, "Cannot get ice instance from %s\n",
>>>  			dev_name(&pdev->dev));
>>>  		platform_device_put(pdev);
>>> -		return ERR_PTR(-EPROBE_DEFER);
>>> +		if (PTR_ERR(ice) == -EOPNOTSUPP)
>>> +			return NULL;
>>
>> The consumer drivers check specifically for -EOPNOTSUPP, let's
>> just return that
>>
>>> +		else
>>> +			return ERR_PTR(-EPROBE_DEFER);
>>>  	}
>>>  
>>>  	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
>>> @@ -726,7 +729,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
>>>  	}
>>>  
>>>  	engine = qcom_ice_create(&pdev->dev, base);
>>> -	if (IS_ERR(engine))
>>> +	if (IS_ERR(engine) && PTR_ERR(engine) != -EOPNOTSUPP)
>>>  		return PTR_ERR(engine);
>>
>> This essentially says "probe succeeded, device not operational",
>> I have mixed feelings.. That said I'm not sure about the lifecycle
>> of a platform_device, i.e. can we set the drvdata and return an error
>> in .probe anyway?
>>
> 
> No. Let's remove the probe() altogether and expose this driver as a pure
> library.
> 
The ICE driver already acts as a library for legacy DT case where consumer device provides 'ice'
reg range. It was made dedicated platform driver as ICE is a common IP for UFS and SDCC. See here:
https://lore.kernel.org/all/20230407105029.2274111-4-abel.vesa@linaro.org/
I think it will be better if we resolve the race between probe() and *of_qcom_ice_get().

> - Mani
> Regards
Neeraj

