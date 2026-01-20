Return-Path: <linux-arm-msm+bounces-89787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C621D3C509
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5FB3E586B16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995AD3D6473;
	Tue, 20 Jan 2026 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4X3gH4u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKe4VH0w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6660736165A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903704; cv=none; b=WpcelNKrGfMJwbZTEskEA7xwKQeMZBY2hp6MARfgLqsOK7IUTqzoSNmEu2n+anh4yOA3uurvsY5yi/Nzu5pxtg+0M5GAvuC16Rjd9byh8nofME1kzZ3/3uxI1ZyNKyE2gc2je0w6DR83ymIULdOA3kDGfH9A59cGpyPToTzLAoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903704; c=relaxed/simple;
	bh=+z9rshUXpLHFAJvzh1WlGJZC98uo1LMFMNixGYqlGdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=VDO6U1dxEeyG550VRTC/Zwv+r+3ajZgUqTaRE6jGgdyvnHRFYpoBpQeqWhA9Xg7aP7ApGxwCme/dnHMNrY3GOaoWtO4WmdjbeTdDG0dhxWFbmCNGFzL38xezAkLqlDr/wwBkparYa+jbtJcYZWxUbSPLYFV1QDMhuHKBAdGtk3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4X3gH4u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKe4VH0w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K61dgK3772597
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZvS/s2wd/5UJvy67mTLBfdo+C6YFJDi9KusjfNKt0gA=; b=W4X3gH4uGuUDqp4Z
	Mpd/X//skC9tEfgLYMPq0d190U2W6ZfZfuoa+Uo2UnIXzBjV4icR8av3uSNhCuue
	+nqehNyID5Gc9R1BJqVNyO+GEoeynVOEbiPK3X7hj24t1QniN5vaVrnd9BLfGgfA
	5vmjSPTs8ZmNeYrTEzs5+xVsqI8kERHkvf6CRUFqLhaemicOJ5g6ilZ5J3WE0HEE
	hWcIyvi0NM3UxGTZKlet4ZeY70CKbnmBoxTmMejIXr0hf58w0v0fGGIkXVKR+Rx8
	XA9B2xs3rlvTFy1WfipOdmWdUO6ktxnLRXsIQ3TZ7BJNWGUlAB52MBdP4LvxEMGh
	JVXofw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt42wrs8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:08:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso9291004a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768903701; x=1769508501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZvS/s2wd/5UJvy67mTLBfdo+C6YFJDi9KusjfNKt0gA=;
        b=DKe4VH0wkkgZO+ZD7+J/pHXBOxgbzhTbq+njX+mH2yWo3EpDJT/CHJBT2gdu1pV63H
         SqEJhNaavM4dU8jQGXGwB9iAQgHOvS3J/odrko7FlifK3PLEhT2r+heD+mVT+VSO4U1P
         1lOXyzOsuM+4EhGqezpcNczhtEWqrm3WaIiUKF4cqwaR7RKe151kzw88ROlGShD1vPDp
         +iA3K7wUtulYnwhU8rOQaj0g7ZM7ggPV8KjcClXy2/wXwNK9fgWxf1sULhPdPQERA3Yt
         a6TIc2UyFDeI+FJ7t8E/baetMyNI6pUwpHjBK0oddiwSpgMq4/PQv7yQkC+u80w4cDmb
         BK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768903701; x=1769508501;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvS/s2wd/5UJvy67mTLBfdo+C6YFJDi9KusjfNKt0gA=;
        b=JICB/ZuEHMCXipAJhlLytzshSYH3pNBa03PIt5Pd35Uxjm7YKc1lESj7qJK2KFHz8v
         HdC08mAGQqHnzWqrnXMLHcQlV1TZNJZdfPc93jXKnCC1p0kaYziNJIfH90DKTnEM6jM7
         PlIrQwv8exgpxwQ+bkMryilHkeYgZFJukOZsfBFxxwoRfLFrlYdsAuvnc5Z6QiSUVCQp
         Y3AWvJIQIdgcbEAQeF3E9g6vw8oBLIea7zSjX8/JVhp98uIWIzqdFo4x/psm6g85TquN
         QAw7Z/Q0n2/dGbf0igEh+FVxWK5hXFLPmAPkJ6D0mSQ+hl5NG9QnoySwIlqSpJ+mV91H
         Y31g==
X-Forwarded-Encrypted: i=1; AJvYcCWWRFHA/UmcTPAhYzWDfeqJ4wGqpq8yuPbNpYon6l1Ym4MH1eFdihs3bcBgiDUqzIT8pHz2MtML1FZ+kkbx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3czlKSYv4K0VBsm93EC9IDBKv4NeMl9REdWe4+ckg0F1mD3X6
	ixsKreJ8eNh/C4Ghw+n0YWj1YBeRLTI5GfJz7wxO4W0iTVjhq8cQYeWRMYrfaTIQaH1OgDYmyPs
	zDq0Pi7d6IEJU9ocvWrZTKGWK4XJI/RhQSeCMUwtOBIq9WGWuVcTlqRT6Hy+hKH0bDOa8
X-Gm-Gg: AZuq6aLmmQbtWxOUZTy6Eo+30SpjGKuPmQJhyyPWBI6XL6Mtn8RG11WRzHLGAr0ukcz
	XtLiQB23sZbNQTnxhQKmsbnhIqvXfCsQEXz71Y/r1ARBP4lzySriReTJ1pUSQUvfTrOoGe+Z2FE
	z2WI7PopOMT6OFImlueWKC/3YK7GH12ejAltPbhqBBGP4tPjY6e4PKwcbUDkEO7H7Nwc0B/lBZL
	B8GL8fSBUy8ewvWBhbeg/Ehynz6/988q9VnIf5qjmUK9i3y5x2xHx3STZIth26s+l31RGQdmyhz
	VNAY0pUEcItnK/vI0H5P0DxOhMxu7EVcGiUY/GXQHbMHBYY9adPSUvHN2AX2EHvoEqQ0FO7UNDO
	5687g2RVT2XJEdAbigpUcxPDaitUt2LBfTwgs
X-Received: by 2002:a17:90b:3c4f:b0:34a:a65e:e6ad with SMTP id 98e67ed59e1d1-352c3e84051mr1217087a91.1.1768903700976;
        Tue, 20 Jan 2026 02:08:20 -0800 (PST)
X-Received: by 2002:a17:90b:3c4f:b0:34a:a65e:e6ad with SMTP id 98e67ed59e1d1-352c3e84051mr1217067a91.1.1768903700567;
        Tue, 20 Jan 2026 02:08:20 -0800 (PST)
Received: from [10.218.16.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352c1387898sm648615a91.6.2026.01.20.02.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:08:20 -0800 (PST)
Message-ID: <d72dc443-62aa-482e-a480-b98b59ca3ba2@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 15:38:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fw: [PATCH 1/2] DT: add bindings for QCC2072 Add DT compatible
 string "qcom,qcc2072-bt" to yaml file.
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20251217112850.520572-1-vivesahu@qti.qualcomm.com>
 <4bea23cc-68bf-4a78-981d-9798cc1668e8@kernel.org>
 <BY5PR02MB694654EA086696A43CA639DAF189A@BY5PR02MB6946.namprd02.prod.outlook.com>
Content-Language: en-US
Cc: "Mohammed Sameer Mulla (QUIC)" <quic_mohamull@quicinc.com>,
        "Harish Bandi (QUIC)" <quic_hbandi@quicinc.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Balakrishna Godavarthi (QUIC)" <quic_bgodavar@quicinc.com>,
        "Rocky Liao (QUIC)" <quic_rjliao@quicinc.com>
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <BY5PR02MB694654EA086696A43CA639DAF189A@BY5PR02MB6946.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -bnX06XXOLSX_5UxhERuGHTK8kyDw_4-
X-Authority-Analysis: v=2.4 cv=eJMeTXp1 c=1 sm=1 tr=0 ts=696f5415 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Dei6p5SHAAAA:8
 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=mJvZe0GqcyW80rR8KUMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=M-Yerj1wOn-OpK7r_3ei:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -bnX06XXOLSX_5UxhERuGHTK8kyDw_4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NCBTYWx0ZWRfXyf9E4bwRMduZ
 pL5jH6QQcIeff95tGHr3J/fujnKQ0RtM5SDFone6kjrgJLCkhZZTkPyLeZITou0ccP33RWT7RzV
 VVEbc9y4uo3dTd5qydU9GlpWRyHVI+l+gG7u4Q6WyUrRt+7TmQbu3ZWb26veAfZcxMHwwRlDPrz
 KAA5jOtF8eQqEhe6KUtlnUqPWTRC0KeO4EqH9j8Wk/oSB1vAxRH9wtGdChBIxyWght3p+vpjyDQ
 Mk5LJyPn5RLY2A+PKyYP6lt0H83L20796eQOZL9Aa3ithlq+2Ds8vWzH2kDKpd4DsUIEwUGDT5+
 SURF71qPOqGu8WEJYed4anrUY6spMzmHGfwUM7yywpRs5umykxGTpChi9nS88+kh9uDHINzOJM9
 fD5qlEcUXZdNmWi9Jc5KMoQw1aE2du46h4zEpMtm/CsQx9b4thr3pf5IrGbBCjVyaDHWRdKmMQH
 Y/+hsDsUZUWKGqDJYPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200084

> ________________________________
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 17 December 2025 17:59
> To: Vivek Sahu <vivesahu@qti.qualcomm.com>; Marcel Holtmann <marcel@holtmann.org>; Luiz Augusto von Dentz <luiz.dentz@gmail.com>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bartosz Golaszewski <brgl@bgdev.pl>; Balakrishna Godavarthi (QUIC) <quic_bgodavar@quicinc.com>; Rocky Liao (QUIC) <quic_rjliao@quicinc.com>
> Cc: Mohammed Sameer Mulla (QUIC) <quic_mohamull@quicinc.com>; Harish Bandi (QUIC) <quic_hbandi@quicinc.com>; linux-bluetooth@vger.kernel.org <linux-bluetooth@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-arm-msm@vger.kernel.org <linux-arm-msm@vger.kernel.org>
> Subject: Re: [PATCH 1/2] DT: add bindings for QCC2072 Add DT compatible string "qcom,qcc2072-bt" to yaml file.
>
> WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
>
> On 17/12/2025 12:28, Vivek Kumar Sahu wrote:
>> Signed-off-by: Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>
>> ---
>>   .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml    | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> index 6353a336f382..197248d6f7b8 100644
>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> @@ -28,6 +28,7 @@ properties:
>>         - qcom,wcn6750-bt
>>         - qcom,wcn6855-bt
>>         - qcom,wcn7850-bt
>> +      - qcom,qcc2072-bt
> This patch fails multiple basic contribution guidelines. Read
> instruction how to contribute to upstream and how proper patchset should
> look like.
We have identified the problems and are rectifying it. It will be 
addressed in next patch of this commit.
>
> Best regards,
> Krzysztof

