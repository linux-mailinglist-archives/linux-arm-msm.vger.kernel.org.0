Return-Path: <linux-arm-msm+bounces-83952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4197BC97172
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 12:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5721F341341
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 11:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35F92D979A;
	Mon,  1 Dec 2025 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YA7iqb6o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A58DepHN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFB12D9487
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 11:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764589358; cv=none; b=dGcrAUps7qD9DgnPw5eSKOx+JrQMrfX14JnVaSsggLFS6U6m+5CI6RD0nyfDQpBw3IqAE+en0q+v71gH7hY7MdC/y/kHXCc9cSDM3EDz9EyimdOawjGSC5hJ234GkGAtzchJJ7oi6aU202T7F4mctGu4YuLPpY4wu+KhbQ+opuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764589358; c=relaxed/simple;
	bh=pGZqwPPf0pQCF3sBnET4Si/EPdcbyy3iS+zz5CzoJAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VoZjWe+O+xPULGo+R0nZcLTSy+yIc7+06Tdt3mN0lzi85r9dGbYm87cyaP8S14USBZPeOCYgs7d6pkEeuIZ5l20NanUyDkuYLl2xkCkRE5/UvEPyKRvQO82Rug31kVvSUXDGeRs0g0g8LuT2c/3K4QSBNx6C9z0J5ajrW8b6n+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YA7iqb6o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A58DepHN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18gZIL3433224
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 11:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pGZqwPPf0pQCF3sBnET4Si/EPdcbyy3iS+zz5CzoJAo=; b=YA7iqb6o7+oDOQWN
	AtUYdzSuR/+OyshkssRGHYZtEyHNMSUEtkGnV7SlDmdrP/tWnnNZzDo6m3lmQ+NL
	oyY03E6eMurLhCsHuTRu8toISkGQjPChWy5ZpA50WKeDfLo+/RSJsl9X3QjCzanM
	xbSbAC8P4s2rR7SjyG5B3t2ozlHvWDnUTmteLV+3qMEqJBoUEerMrpM2lFJaSJMm
	d23bPMHvwL8vfXn7aKF4oEgu2a00rj+ZNTbXOwGj4AJaEJ4MVp0mz1pDbQ2QAQef
	GIfe65yRCF8NmOvW5EK9B6JuI2UuEIrokel7VwW9XyNi7L31awZIzWFe/Yaggr7/
	XIsM5w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as7re0grm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 11:42:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaa289e0dso18547831cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 03:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764589356; x=1765194156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGZqwPPf0pQCF3sBnET4Si/EPdcbyy3iS+zz5CzoJAo=;
        b=A58DepHNEObfgceqNS1kIMbhyQ38WupgKPEmOeGr6YOWz69TWznPzNe+pv7UK/sF4T
         r1MpE5t39hCw2t548exJUW7Ps+x+Z40ogYnalhGky/5PCnCsQ8VN1tN82gxb3e3LsS5c
         CB9GOtuerKDbty1o3t5y6+oMsE4Qj4daKqmEk5cgGAOSvblVN9FbED7jpZlhbkQ2V9vR
         hUPvN4IgrqP/tfO07yDGZUdFKDxplJZ6rD6mlUTgMoLKGOrHvlXYKlXwHTA+rJNwplcg
         az8DUOp2bmE5hmbdOclYGx+dY9Het4LIWxaJH+mFAYBuHQWi5aTOKi/tz2AXtd/Y17Zn
         IElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764589356; x=1765194156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGZqwPPf0pQCF3sBnET4Si/EPdcbyy3iS+zz5CzoJAo=;
        b=XFocIo/n4YMP1FAKvDD+O4IdsAFKtK7DAXE+wEILef5Xpz5wCgqYDgQZvUMGwkxy03
         EpgJz8d4YS8uhTaUyqg8OJcS3d2dPXpU+aGvCPqQxdBkTUw/TIKvaj3HzNSB6TvxxU2j
         zJernbku3Y//SejfY42Id7crmGtTQCfFYGoXQy/vYHedFfUeGaynVTCx/jcQRrxX3O/D
         4huipG2fTrkQIE2zyAc7Ugl+TtqjZsDn+gkH8Of5wS+cq5TxYod8yKH8VxRlVaP06aSY
         UQD02QoWPrbgz3l8ZtLf8SmXphZy3TKVzMeKrTOSAZ2VkfaNXroSJHz7cEVIaEFyBTYt
         c8wg==
X-Gm-Message-State: AOJu0YxHBHqBVr3i7yR6JSqmQUwYHxoXeGArjMxTP8bEiZ/bX4wrn40C
	4sYk9T0eAxtfZsg5q2J4BKrphkrN+G9P18CuC66rXrc52qnB7RIBhUImIZDUV2w3qXHQE7VY7cN
	sEqdpBFI6Ucsd2pYjMwN+jlvkxNGPYk/Vh0Q2g2udMpKIf4brR0CIJAjDt/TR6gm6mSRH
X-Gm-Gg: ASbGncvNPdofCO2xblGi/WJaMAwMXRwVxOYqdMERusAiOCXk6WeLvpnRzY5BylPUrq3
	FcOYbTt+ECgmeN9yuxvc6I9aWBmTQrnS3Kujuz3ecxxLQYIwIF7KTS4rcAEvAnM74P6R6rdRXA7
	rv5vZs2vOWiKS87LmUn/Esb7z7/OsjZlfum1QnAJX68ld8E46xFHFpUfZ1lmj8oxImUSrYF5BW+
	aLhxZQ6AOEc4fX/dIQw7q6Frzr8jgerknkD0IeSF1Xod/zyeAZHD4DRAKDbU0LOJNojFGkHm1T6
	GUPT3wVMJXmXyMOn+9du3v81isVgrZnl2fSpmigzrCj9mLYfC9uBYs2cxNKaG7cel0s48yvyw8Z
	3jDEix7cVCLaH8V8KrKN+zRwXaJl2pC/BdXYXyyYystxXZB50Pgl3Ddwc9BLVkJVcm9Y=
X-Received: by 2002:ac8:5acf:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee5890bf69mr401442911cf.7.1764589355502;
        Mon, 01 Dec 2025 03:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtKPMWapl5XLHH3Ls6A2W4eskhuJBji8AbzTzz7F2JxfHCs5s7yYpv4jTjsYG3lHoa/ByqDg==
X-Received: by 2002:ac8:5acf:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee5890bf69mr401442621cf.7.1764589355094;
        Mon, 01 Dec 2025 03:42:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519d828sm1198664666b.18.2025.12.01.03.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 03:42:34 -0800 (PST)
Message-ID: <863db415-51e0-4c54-85bf-ac6a168758e0@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 12:42:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
 <62ce91326c0e1d5aef1ad5ecad9b99695f983347@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62ce91326c0e1d5aef1ad5ecad9b99695f983347@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7YhpPxCEc0QqtToA-VksVEe8sCX_FQVo
X-Proofpoint-ORIG-GUID: 7YhpPxCEc0QqtToA-VksVEe8sCX_FQVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA5NSBTYWx0ZWRfX2JCFP5rEJh2V
 fagohPKLQUTGP+5zRE1cRU7LWh/LAZVL9kcRRKKJGyaW1NhJpoMHLnULFmP9/nIwhMxAIhzMUwm
 6TLfVFJUA38oqOcQdRoPMkwhmQ5tKcjPuSoDnDTdB7PGvPY1qX7ZODqZXcfvhBPeHp/myV8wrs2
 d5RpDg/f6NOc4C7CgchvyUI8RdjCgIdQ3ejO8KFfHB8FHNfU4koSBXhPqrbG6+breygFo/RVkHx
 01T0TpqCu+U+vqneKqFAAJY7DIANgpfBH81QCnYcMwmvYxaPtTEcabN6UkL4rg8Q6TZPVKnLbpX
 x82P1egJzKIrcTEyTJFcqs/C8sJQyEpMncGSdNlH1JfF4L86bMotYGy6LzoxYMfEXj74J2Xoi2h
 yF5h+SqlYtwBbBlM9KyY5hDkYGZW/w==
X-Authority-Analysis: v=2.4 cv=BOa+bVQG c=1 sm=1 tr=0 ts=692d7f2c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VVznJNgsxCGEoLoMiiIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010095

On 11/28/25 9:20 PM, Paul Sajna wrote:
> I did more testing on this, and the led only comes on if it's brightness is set to approx 150/255 or lower. In that case, should I set led-max-microamp to 60mA?

FWIW your downstream kernel sets up channels 0 and 1, here you only
enabled 1. Taking a look at a picture of the phone, I only see a single
LED on the back, so perhaps you're (over)driving a single power line?

I'm not a milion percent sure, but I would assume the current draw
*limiting* register applies to the sum of the current going through
the three channels because there's only a single instance of it.

Konrad

