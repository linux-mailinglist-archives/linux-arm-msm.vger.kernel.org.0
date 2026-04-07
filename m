Return-Path: <linux-arm-msm+bounces-102225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLTJKjpZ1WmC5AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:21:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8663B3645
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3BD63039F7F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 19:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5023635CB91;
	Tue,  7 Apr 2026 19:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0eF0jTx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJXeOKSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB16133E35B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 19:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589674; cv=none; b=p8CO0kwYO7vRor/bSvbsejs4l7NxoWVugC/Lmfa8+NVyNEj+jl7pjL5w0uVTXYR6CX9tc+/+s3qfNPqlO4nSjAHXJRFvgqTtaAFBdZBU3uK6+3j9LktUELoTdcqQvP9Q1abXZN1czW/UkgAY9xChYFCeekw+wJuLgIGLgnFM/80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589674; c=relaxed/simple;
	bh=q5y/k9WZIypIB3u0gg/0rC6bgmTZvmA+5L5nSV95VYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8Vug8GUrf2uWye9cI4W7KqV9nIgw1WfQWpv7gBhuIsEP8ARPi/TzMU5MdE+xeRaPWnpyhTDV0xznmyOb3r0iTEnixrayVie8cG3Ko75ySRsbyQdnSy+FNxdKiPfKRWFd+vXgWVJCreFWUZq4DkBQyf+7s84kiLYOUhtA2fgtR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0eF0jTx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJXeOKSj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J6dsn071793
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 19:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rgwYZsPuPyDgp1OqiObHlQX0/OsVr8paljJSmYmSXI=; b=h0eF0jTxs3PI5xqj
	fnZdekjuFEQfWxAgBpmNQxZCqu8FuBdQ/aqG37GHH/aEQlsPwBwftvJtEWK+WfQE
	pCpMgx59njRDqQvF7+xROM+pK6Ru6M6U4ebWVXneU+vcKc1Sa6hSckzpUwWkyr6g
	WVcG+T8CHh2h39yYu8TgI+14Gt7HkotYnq8KvGAqYUEdcxwePGc5vbALZnquH6A3
	7NIKHhmetX7IuKEOhCr93cphA20SWeGLMR3RzfuUHuJ9xbNKJ5ajYPgEIsShE+Oy
	5rdfbvEBJm6KCBsECuoC7VGzCoEMbdgSa6ISZOpZHA8dFgKsCIz+wZwjjckYWpQG
	3owGCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7sx81jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 19:21:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2523e0299so136837825ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 12:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775589670; x=1776194470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6rgwYZsPuPyDgp1OqiObHlQX0/OsVr8paljJSmYmSXI=;
        b=LJXeOKSjMOcE/elxH3/m7/s1AAoAYi2/4ldsreC88h/qPn6QNOSMBQ+TRgCPmx3/9j
         jHfw+k+6VKbNq0CzY3W7B4Zj5XnpymBnB85F/MjM1l6DwWSdBdsWlbkKp9cSF1T6PkSv
         rKg7OlTOdiN31Jvv5JGwBzp6tAdJJLk09dI+aBqMtWRWz2d19uGlV9NWrQHZz72X3swv
         kfYSD8FUbP4YPXkn2zclNp8o89aHnK86BjhtCTGQCbj2FG+Tn+jRlrpRyT8e5m9GzIyN
         KDFogYKjvQfZvxKoRujWHCZnhFkUhxW2r9FtVmRUHDwi3iqiyaasyvoCf4YYSMfUnSu8
         eOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775589670; x=1776194470;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rgwYZsPuPyDgp1OqiObHlQX0/OsVr8paljJSmYmSXI=;
        b=qIqotEms0RYjuoMZbNG62o6n6C47JJNKkZ5XXM7B2wLM8Xgu50OAl/wFGFvIl8Dnas
         xgsicNMt6ffOxd21q1JjBSUpWddqvfxmQgiV9O1GwRpllHnd+BpDB7xOYh6h37WXyMnZ
         saj1J9/rRb8wN9P87O7qCWKFaqrYFA8n00HYCuXnK3+uKuIXTH0Jf+B9Fv2OZKgCyVmS
         UkTnTaLtIFWKHkfDzDHUmL+2pplfRDqqoyWW6TW3K/KlE6mkRyV+RO6F++dT4nyrmoGo
         oQ3GYzxUxp8aS9ilVIeEhtVQzEUPcZt8iU7X/5IQCPu2el+mfb98Yj9O+F/Atz6AL4vu
         2NsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+pWdA/+OVAdqgmdJ/dE41HXzqITK/foHmHRV/qi1enBL7FpHFiZwJKo1rQ9UJsoO4TBckpJFmS5KednSk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/DHg7svM280w8RE2Vwu7LQHhgfpW+EpfHD+u14j8QTLCIEPen
	jWAXh33jKfKIs9Ilrq7Kq2aHdC+PoQ84KGWnLJBhMDnTNl6wkOJrjUa8F9biKGXq2LGSvumasn0
	KokSV+K3bo3OZ55taPsCFwb/Qy5E5P72PM1QCCeINPokhARnpNN23we6CGIYQpiPnxe6g
X-Gm-Gg: AeBDieuzTPXcnnx5FT/E6YwoMWmY0Kx283JiF0sHKLJd1Ny3EULxf9eVlvmPJB2rVmA
	PtAgGMjS81VO+z/Y4KpxNgEGWN6IDjZTIAA3aBBdR/u9+7iG+cHexh69l3Mu2pkY/IJ+0rVRWrT
	XCL14BSDFptCKNfTllp5G6ovHbQnY7fpEU4XgrzWVposmVBdV8yJZE0drUav9ubdIu1ByXBct9c
	tunD6G1DoE0ToT/a2PjZ0e6U4uRcIk93rFdZrQZvw7QUvPoyPgEF4MmONgxoltHjFtj0AL4CK1F
	atQ8q/eBM6Kjo+WMa83EGPpTaBovomd/5IhQGTJXsxQXJ0QPbPWFQ72yaeARU4oYjmgnPmYgzCy
	n4aWDe5cZDNc4RTN9tZbjlw0uwNGPYRXOmOZfd3pzrNpGXw==
X-Received: by 2002:a17:903:22c6:b0:2b2:4310:8d1a with SMTP id d9443c01a7336-2b28188a1cfmr192326785ad.38.1775589669817;
        Tue, 07 Apr 2026 12:21:09 -0700 (PDT)
X-Received: by 2002:a17:903:22c6:b0:2b2:4310:8d1a with SMTP id d9443c01a7336-2b28188a1cfmr192326385ad.38.1775589669313;
        Tue, 07 Apr 2026 12:21:09 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749ce29esm193875385ad.81.2026.04.07.12.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 12:21:08 -0700 (PDT)
Message-ID: <ade66e71-d24d-4b19-8a1e-951fa95159db@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:51:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] arm64: dts: qcom: Enable GPU & GMU on Glymur CRD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com>
 <ui4r3krzvd3i6kjdozhmmueejdqpbnbo5wfa6pwzjolcse3eeg@3u7bdphqv4iz>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ui4r3krzvd3i6kjdozhmmueejdqpbnbo5wfa6pwzjolcse3eeg@3u7bdphqv4iz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=etfvCIpX c=1 sm=1 tr=0 ts=69d55927 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8uCpHmCzy03A3Vi_SyMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: vgr0nVwGjIM3EK63-CgruPLULxi_mLhO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE3NiBTYWx0ZWRfX/uIFBcmXb+ho
 Hykq7cSlrl894maQllR9Aak5WoRX/AWiXqjPOc98vXVHF2Te/oECva3MgnVfwyLTfXBwuivPbTE
 D2Kv2ih8lZH64+QaBGgcMfsOo3CtWjcWu4N59gh1S37pSLBlJBvtGZD+WfBrhF26Yon2aFB2DsX
 mB7BuQT42YYpNB/pzFzQSgHbXEChiXJehPt4feFWmCVCWzpilVwanHm2JCizmkK0qR8A50rxDFz
 6b2XHWLfYD5gOSCWW5qWGEG7Qffusj3R8mXjUXjGTOTCJN7W1ScoJc7I61sMnrXaSfUQHFabxTk
 AgnIGXqQLiChEPH2weaS1tz0vXsnZkvupGqrhBtEP2iucd7lxnUq4RwxhXsW+A557fbyedY4A9z
 JNmyoD0HxwiQtwqQMjepLtLnLnR6jl0u/YxYDQMak6qGlji7WfXADkjBH0abqCD4lzIs7WFim0y
 CLvBzcrYyILGzorwVBQ==
X-Proofpoint-GUID: vgr0nVwGjIM3EK63-CgruPLULxi_mLhO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070176
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-102225-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C8663B3645
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/5/2026 3:14 AM, Dmitry Baryshkov wrote:
> On Sun, Apr 05, 2026 at 02:33:17AM +0530, Akhil P Oommen wrote:
>> Enable the necessary DT nodes to add support for GPU on the Glymur CRD.
>> The Glymur CRD boots Linux at EL2, which means it doesn't require the
>> secure GPU firmware (zap fw).
> 
> Is this going to be a default mode for other laptops too? Otherwise it
> might be better to keep ZAP node enabled by default and disable it here.

I believe so. Anyway the laptops are hitting the market right now. If
anyone reports that the EL2 is locked down, we can revisit this.

-Akhil.

> 
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> index 51ea23a49b9e..a579df902323 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> @@ -110,6 +110,14 @@ vreg_misc_3p3: regulator-misc-3p3 {
>>  	};
>>  };
>>  
>> +&gpu {
>> +	status = "okay";
>> +};
>> +
>> +&gmu {
>> +	status = "okay";
>> +};
>> +
>>  &i2c0 {
>>  	clock-frequency = <400000>;
>>  
>>
>> -- 
>> 2.51.0
>>
> 


