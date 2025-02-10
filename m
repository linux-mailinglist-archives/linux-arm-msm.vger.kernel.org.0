Return-Path: <linux-arm-msm+bounces-47466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56117A2F696
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 19:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 680037A1D67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 18:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD76C25B698;
	Mon, 10 Feb 2025 18:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddUUcLq1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB217255E55
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211281; cv=none; b=kJvSB22h9fSHgpsM9voz9JlA3o/ZJYtzuayQRYB3bjvLVU912mD8nMtcszp5j3aSyMMq0Xgbkur9jnXzpUV71319su1hDghaYvElftnv2YZVSLa2JKvGeQJ3Fu8Y8zKhxVRQT9kleyM5wKe8Kxjd0ebkobazU16REM6EG0RsS8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211281; c=relaxed/simple;
	bh=4K2XNsaDCsSd1siiGtOIrbmiWbn6LlUnpGVy6QOO/MA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3q1BXMu++2dWx5SPB0t1iKZGhZt0V+/NLvkhuiYfAfdoqCIACVA8c+V46585Cf891qioBGxjSwLO9H829+4qevDubxarndbBBWG9lsfGNMtnPgr8JsCKaidgYKj3GLErYjdxT+WT9YYK93kEmFFZ+gTR9L96cyk9nAB/PB6VPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddUUcLq1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AC6ttg015713
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tj3xl389tb6+vFerHhXhAIIXxNupDXHEF5/CjGgmWO8=; b=ddUUcLq1qR94VmNX
	lzHjGle+Tkx9N+aTb/k6Ly4RzTEmjrOGmHl5E6F6jv6VR6gUqusGIDnA5V7Ak9dJ
	Xoy9BrMAFKeRdlL6PkV3By2CL4Y9VwJJ3CCE8suEaGnt9NjLSS7OF3jh5pYrSGXu
	EcJSz9W9M8y+Jt8NgTdoqkXXmesTtCxkAswl85xQedIkRYaR5BgyYbUd4oZcTHew
	XinYZdZC8MgyB1PXmY1KzFTYX4M9ICspdzjjTgSfSPOUmWN3GTD+EMZuDshBXGv+
	zHdnH7PtwaTS+BezMDk07m/ASevg0Ij9vMiMueHUUp+65jv/A7wtgxtsDZ2UHwiN
	RQXKJA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0esd9b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:14:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e19bfc2025so12634066d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 10:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211276; x=1739816076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tj3xl389tb6+vFerHhXhAIIXxNupDXHEF5/CjGgmWO8=;
        b=CmKFlHfgg8hOmB+iWuv4B02nTqHm7R73L5m7zRlTCwT5brGr7wD8rew7R9jhJxWTdm
         lBJ3pe/9X8VG1cR5AjueQw6ai+0t/Nw/V1Hy2zCuR07IV+810kvQm41hiCNRHuEmiOCV
         qzSBFyp0SWKr5SJU2ltpyviqSoPJr4rMGcv8F4FniM4chKsdtD7k0Eu3R/vme1zJxQPu
         o1sj1Sv10bj2EPDh4SdKo1KoVIYTw383oOIb6KDAAUH3kEX4frxk4Dt4QbdfkpmtAGjW
         AtzaOg9oCfIC7k7BqiKAs+hp3Fn9VGxpm0OYIPRNDE0kPCCIeLWjswbsHRWHfUpUSxJa
         2N5w==
X-Forwarded-Encrypted: i=1; AJvYcCUKeUBr00KhHur0y2jSONb9kOXyQQhZZN3qKGX+zIafSVsfen0uuktQgcjOCinsyY4qtxqNnYivIdH7jDwk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Ljrd9+Q7SpTkbyCqYzQwX4LLfHJZUYTMWSyh2II5h5Pjc4X/
	FjbfHpRagOHb2uwlPKiLkxtXlN8vtMx9hxptxeP+Jm3AX4xpqK6qwOCs+bKpSSrmR5hQKA/EhoF
	fae94PZKz5Bft+UOgDjvkwEhIbc9JQaHWlVWfox0TqBbXkHxz96rD8EmS/k7ooG7B
X-Gm-Gg: ASbGnctuE0m8wZdsdThTNG2rC6XguxpPsrBjhKkpY1SALAVVxkRXe4WCusDqwY0zFeU
	hMGNmxyDLiRMHGEya7u10zeXGYQI3ffQYpthRceZk0Xeu1Wka+LiS53Txmmsxp64itCIWy9qyC2
	D/cLXX0ErAjQhlWqBAbUIIynPpBVTPBbl8HWIYq14MO6Vm7U1NsnuYol4sK1Hm/hXrw6/D9gWSY
	/6P0lzErPQfm5veejwFx7RWFlb4HHe9XDaTWiRcmJ6BOAtmeA+wAYaVLBTz67jIB2gtuKzXQiwa
	ah1COzxtLr0xdsqvruZQgUYBr4e+1LK0cQfsWfURxvUt2qyHvexJF+FQMX0=
X-Received: by 2002:a05:620a:400c:b0:7b6:e126:3dee with SMTP id af79cd13be357-7c047ba6a15mr872257985a.3.1739211276660;
        Mon, 10 Feb 2025 10:14:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH694zT/AL8ajW8ob7MlxOHOkZKvYjrGkifYCW+Fli8g4AUIOJ8m7IYZe/jiaizLeE3gb6okA==
X-Received: by 2002:a05:620a:400c:b0:7b6:e126:3dee with SMTP id af79cd13be357-7c047ba6a15mr872256585a.3.1739211276298;
        Mon, 10 Feb 2025 10:14:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de5e6ac118sm5184734a12.17.2025.02.10.10.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:14:35 -0800 (PST)
Message-ID: <3dc16129-6f1a-469a-a4fa-ecbfbeff53cf@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:14:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: use guard pages
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: "Dr. Git" <drgitx@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250207151706.45031-1-caleb.connolly@linaro.org>
 <85c31e1f-20bc-4e48-b179-e44ee8e1f816@oss.qualcomm.com>
 <a22afa6d-18de-4b83-ab08-6b23b9a1d927@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a22afa6d-18de-4b83-ab08-6b23b9a1d927@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kRG3nBQ4MW70r4xLfO0cYy4corwaalHi
X-Proofpoint-ORIG-GUID: kRG3nBQ4MW70r4xLfO0cYy4corwaalHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=892
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100148

On 8.02.2025 12:49 AM, Caleb Connolly wrote:
> (resending from not a mobile client, oops)
> 
> On 2/7/25 21:20, Konrad Dybcio wrote:
>> On 7.02.2025 4:17 PM, Caleb Connolly wrote:
>>> From: "Dr. Git" <drgitx@gmail.com>
>>>
>>> Rather than manually define the guard pages, use the
>>> "qcom,use-guard-pages" property for rmtfs.
>>>
>>> Signed-off-by: "Dr. Git" <drgitx@gmail.com>
>>
>> I'm not sure this ID is acceptable
> 
> 
> Linus & Greg explicitly allowed for aliases previously. Patches by "Asahi Lina" and others have been merged.

Correct, however the trust is put into the maintainer. Marcan et al. accepted
patches by ""Asahi Lina"", as they had enough confidence to put their name
behind said contributor not being e.g. on the sanctioned lists.

Konrad

> Ive spoken with the author several time about this in the previous years and they aren't interested in publicising their legal name. So the only alternative here is that plagiarise these patches which I didn't write, or i have to carry them forever downstream...



