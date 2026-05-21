Return-Path: <linux-arm-msm+bounces-108974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDtpNY/MDmpoCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:12:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDF85A2058
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 119B132027E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35A2369D6D;
	Thu, 21 May 2026 08:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lrFQNDOq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hgx799Qv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BCA36998C
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353651; cv=none; b=RUAsVz01EKs56evOSFlvk+Rq9G8oO5ByPghAFGIs1aYaKCqAKbaXUf1DG14Rnbuim/IzAwwQjcYSB+uHuaY9/47aPfwzYmCJQjBlBcNVMiillotUgRk4DSUUv962T8brbY2l8pQcT0D4egh2hZDwiGgfJLd51rwQi3mB8mSrfNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353651; c=relaxed/simple;
	bh=B5qsYpbh9omGjcvhHLQGohxpwuyFWi1vSGi2dc96Cic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUAlpQT9SmM9IHN1/y1/HM8frKQ8+5yYiISzT8526hM3EKlEHQmaIyVcKU7PlB9wYaKZisdmFwJ3z4MhrBczJlygtYGILbx0vv6P1dN32etajbaqRd8g7KDqLDJlOJKPZwm4zR+UBbzHkOJ67eaZBu3T2t/I8aVj3X71A9H+OEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrFQNDOq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hgx799Qv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6aD0x2157896
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v692eTKlDFQGKi6VPiSwojmbe3259bYPJucXnvxV50c=; b=lrFQNDOqLigfATeo
	ILD7zYr6EFuZEWZVySCOi9T3giU0ZrG9Y0erUE97iE5nuSVv+LO0pZmpClnlYs2I
	OHeLZ5OgpeQS76AcVh0D664APkYyNbUAjz2mp1c4XuxMJFLT0Hx2UFIU3H+oa+Qs
	+0gyVH8cWCyb7zY/cbjC2N+HUtTlMO+UJswOqoE4H+1zURNyG9pKynPr7hy3PHT9
	uvMTtbtMmvhyFxzkSufWG6phWotWwNpqmdEuIliQRC1j7x+VN9uJgqZZYQz3Hyl8
	/2hVOt3P3n0j7e792BC7Gb0L6dSRV9Fo/01kPo2nMAenog4dynjwKxKR/MYeJaQ6
	kKc5XA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma42b91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:54:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c183c2eso32023641cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353649; x=1779958449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v692eTKlDFQGKi6VPiSwojmbe3259bYPJucXnvxV50c=;
        b=hgx799QvgZqBHHVMYWwCboaQx1odYfWcrYulxEoKSUiNSHPiR5SaNGkpTNM9lV3aQ2
         BuQu8Tta+3td2Ejwk7ZopZpkf7MNXucr6q1E27NYSEK+i9DtpyCztT0rPVZPAfo/HIb3
         WEkXzSkV7lZFMhkF0xbk4OtrWxnmlDPAvyPluOeS6EBLEUtjPnPToGJaVFzz6ATUpHBv
         VLZF08dG1P7J6YdTWoPeXnxpXgMeaVKw/IiSC7x30NhzwI5rNeQzsBFh5kU/hxvC6faJ
         qywEJeeaHp2PGtfFneLzZAyO1fSDXISZcdjQ78j+JgnXiqsoae4HgiA67gpfFHrOQvKB
         LceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353649; x=1779958449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v692eTKlDFQGKi6VPiSwojmbe3259bYPJucXnvxV50c=;
        b=eWDOaz0m4Sz8lG3RkL4HV162mbiipBwfzyPPWb/pFs9zpYaDIWTGfUAhVbwi4GjWtn
         j6jbO5af/huuTpo3ky9TAC3c5aia6KaVEyBpI2gbGI3wrQtTYRY9LA2vmLJwoBXqhv46
         MdGCbBOzZRUDgdV+J43g1qciXhr+/ihipqwSFZgwio0xETqa2MgPBq5jA77incOVnFIG
         mR4WIJWKuA5GZyencULFfoMKUHx3O2YCpGkefO10xpGhN5ZfHZDHDFdeAbDYSRcutkmF
         ZFWBShwA0wgUvoUHlPmr66jyMzMftsGKGhd3LWWDXgBLnsXrEKOVIahTC0WSinQ0875G
         i1Ww==
X-Forwarded-Encrypted: i=1; AFNElJ/ZFjaSW6B/F4QK3ljlY1hHF16/YgM4HcqlgQDUCx3o2pynA0waa0nOkcvZVUTGl5tf6AtoJgHIDjhvWBc2@vger.kernel.org
X-Gm-Message-State: AOJu0YwB2aOumQcKiD5A64Mr0/oI69uCOyXgQQxtOFiu/qMUyZ857ggL
	40ki45yu7smu1auqf/RlAh6GbEtTfmLJwSGRaoIXr658nW+cWh2YQ55NNSnelu5TcRM3pf+oMRE
	ZGKzj8lFagR6Cw13b5Ja1jSbFXh2+PoufUziuOySIIaK5AfCWuteatu3e8/tSY/RTMIVL
X-Gm-Gg: Acq92OFvhnm64akOG3t4GXgtNIBDhVWGkG4reuUSEvEKvlrbQPWrTwsa5PqKVu2og24
	xNqaC59R8G/Ww8EP5gMp9bzY2XKpMtPQ5gfhPC1leib6fZGkJWsvn3oEjegIz0hErSPn2rcPgIZ
	r6/TV/jJFc3fLUKCUUS+iD+v8iYor7yZ2VmO9mLjdkUlEg4XwhbX1rt27IrIXBicpftYuLyYmFP
	J4n4qYh+XZ+4aB+9SkZvY5SnJ5eLDePtrjikd4JqX2NkQPx2pJhD3UP/BLu0gOpMDpviIv3xRxq
	v4ttiJKO7K/qu5cD/SE47PHEepKhOFF62TzJRLVU5/PsJkCJQVCMxD/hUyZGn7UENJADQiHutE9
	aSekrkOWmIZ+QRF5SYTU97yWzPKkyaVabAovNTOK9qG/Zviy/z1zbKWdeLzTKcxZkdD1dqbUpG0
	h8bAA=
X-Received: by 2002:a05:622a:182a:b0:509:2a92:8088 with SMTP id d75a77b69052e-516c54c365amr17392971cf.1.1779353648831;
        Thu, 21 May 2026 01:54:08 -0700 (PDT)
X-Received: by 2002:a05:622a:182a:b0:509:2a92:8088 with SMTP id d75a77b69052e-516c54c365amr17392711cf.1.1779353648434;
        Thu, 21 May 2026 01:54:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87891207sm18449566b.7.2026.05.21.01.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:54:07 -0700 (PDT)
Message-ID: <4c89121d-9502-4cf2-b5a3-cb789284643b@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:54:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sc8280xp-arcata: Add volume
 up/down GPIO keys
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-7-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-7-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0ec831 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=S3QPRrZGCkirkA1mjOoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: jR59OminmmbplJz7SewM1OivzCr8poOE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX19vdnQBgZ0OJ
 X57Sck8xJS4kYNDQbM52/ixDgzVOB/fQ2IFy8/C2dygQvVLzjwpJiDdFFXqNzEQ9EzFLXQot86/
 Uk7+7DEGFj7FM/Cxk78oKVz/iMgLUH52if+/fKbw0lvjZShRJ4lugqsC+pmHXrNEvwNzWCdp+IB
 M8Q8zuSZ9pjSMJ4qqYFdhoQ3P68P9ZaMCU8UODd9UqsFjyiGOL+cyXPpWpNQk8yz0i6g90gyx6K
 OAHxkK/jNWxsOTropd0+JKk87bZMlizimxpPv7PHZ5fvIFJxDDu8ypKkn+mOGYUIcaXJ1lvdY8o
 vvTbNZcMUJrWc9o4kyqLD6QAw6cuDczeizWv2BGa6o+xcb9aGxAFOBI4Bhd7myECi7iHtuy2ndQ
 nZ/s6ibp6MZeSdziv9tEAP8S61Ygcos8TlKwyn86jFO13exCP7+wyRAm41IAlzYnpWtRuc4qy4W
 SZvc060I1Rhc5Lilb6A==
X-Proofpoint-ORIG-GUID: jR59OminmmbplJz7SewM1OivzCr8poOE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210086
X-Spamd-Result: default: False [-0.11 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.55)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108974-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,chromium.org,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6EDF85A2058
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Configure gpio6 to serve as volume down and gpio9 as volume up to enable
> the volume up/down keys located at the top of the screen.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

