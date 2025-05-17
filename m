Return-Path: <linux-arm-msm+bounces-58262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F7AABAB4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 19:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF2163A9ABE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 17:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E2B20C03E;
	Sat, 17 May 2025 17:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyTlT0+V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE651C861D
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747502469; cv=none; b=WJ2Sm+NakQYBC7NwFQJij+a+75diId0E6gtAJV7dPpEZbcOV8UktRHazVPCq6U7yPUdTlVGrEU3qUnMnTzbXvR0rdoyAMeOIm2KpLE9Y3/Op8DNyLcXE478DqTO7uQ4TM9d+yiVyn8a8KKmmOtX42mydKHu0WdIV2BT+BjBFVTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747502469; c=relaxed/simple;
	bh=kM6b80Bkv1XCI9nr1OXIWLdlXNLC1th4jgNd+WyRqLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiQNNfMF0FauJVoYR8LcKI7HTZ4LbSuRGfayKPt7BY08JKCX+6mjNuyazRsm+oPSPmZlSG+cWwIA0DghpJ7f8Ly0YFbQouowW6M7PYCb5PL22STz6AHRZIPed4c1pUvBcIuFJPKOSsFs92VQwvTj/bxYrL+2z3W7WMy5wi1Aw9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyTlT0+V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HHHfTt024139
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 17:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LD3N/dB9dxL0NuGVYuOpUsqBzwJF+cAwfrUr6EDS96w=; b=JyTlT0+V41ZCgI4Y
	Zo4c/pHRZVE2qs3/EIcW3tJni/qVANZfA3kghmEQfuo9pJDeqWFy+Zkpu5jjB3DP
	2psrc/Uut6+0YnIcfOIyBMLV6p3EVgcZXOfXRinfs/88EpiyrUBnUtEXpTRtfsPe
	3CGQ2Nu3dn4nXK6BOaavaGviyPPMXAMhl8zbwepeN07HjuPElXny+myzvzVBZAJa
	apopSYbFQIe0N5m2Oh52bIRLTS+yH8BIxpRlFjKq5tUi/chS2y6vmfE2HlIgL2S8
	9HAgvcjaS0uyEPvK0BTJYCl4MUrd+ogUG+XdEdMPStlHsAwVoBn7R811GTrM8Yt5
	NX9A0g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmm8uh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 17:21:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c263ba30so2272966d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 10:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747502465; x=1748107265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LD3N/dB9dxL0NuGVYuOpUsqBzwJF+cAwfrUr6EDS96w=;
        b=sbimpC5jPhEXKEmGN4kndXg/L/Cgvu37NoYOH+tkqA1QDmDZs4hV02sc5eg5Z1uPD7
         DfgzeghT4hYkda1HqZZJXSPolfCJPXHteoAbMC7Jgd+3xfBlycKsZj70r+2bA9FMaNQ0
         wCVffWNm7558HItj3WJxQOJaW4M+GqBvFRGv+1PwMMjJ11Q/pkU9Z3YZlpK9D/1vAjFk
         EDdMfD+xjoLTZsEGrtInsK15Fo/tUTnYOvzn8n3+7KhRMza93QSYmnaPUdetUIQ6rHKF
         fsDZkHvQmhNdc35bFlwgpDJcprnfSNP0H/Mg6DPABgkNkInL30d9s1c53l0bYaiR4SJy
         48WQ==
X-Gm-Message-State: AOJu0YxTmBpco4kvljqY6gn621lU07TtZ0qdbnSAG3Gcc2DJVdtsA8bd
	QEz+ocPZ6BjR0X2hSa+v6dzgcXWu+iAf9encrXJlaDdOmEZ/nvCGD/KFlvb6zDjQiBwWHMQWs6o
	LU+Y3tuohZjk8w3GcS5/zB12c3B43/R2NWgNT9Z7ZSflzTzVOJxo4XDj7mesZFFdfaEnW
X-Gm-Gg: ASbGncvwLVm4BNALKo6/RKICgzu1DUXP5ZkeGl7LlytW0Mk8wHs68Rx+S+AYHKmEeqf
	dh0Z4pcubQ2q0EJ1ryC7vW1Ohyouqiav+lCzPiY+nt02g8dak0fBUX6bKUVLeNUlnPaNWxwBrsZ
	1SlTVQ5S3B1mhnQkI+OzPd6G6zNWiZ4+OILal+F+r7iADo/nDJN6HGAV/OzvFgAZXkH41vKEdQX
	iE/Oi8SUDhQsAebSdJDkre//jtUjvgxtRVHDL4zLzUpLBFfx0jTUXG88c/A5OQyF+6Z07zMjVpM
	ekPpvL/7tGIEq/Duhr4XAC1EEgHvgrcyU07VI1rVxUE00W36xrbYrypVjk8aHgoepg==
X-Received: by 2002:a05:6214:48d:b0:6f5:3617:556c with SMTP id 6a1803df08f44-6f8b0834f7cmr47221216d6.1.1747502465598;
        Sat, 17 May 2025 10:21:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL/rKen6YM5r/g0Pxafk+XQRuIYGMxqfn1DIef0c2Cb5fAVGwQZBFB3zwu/wHgNmNKd2SnVg==
X-Received: by 2002:a05:6214:48d:b0:6f5:3617:556c with SMTP id 6a1803df08f44-6f8b0834f7cmr47221086d6.1.1747502465285;
        Sat, 17 May 2025 10:21:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4967c9sm318992566b.129.2025.05.17.10.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 10:21:04 -0700 (PDT)
Message-ID: <a2ada2f8-bf0b-4730-a28a-2604a405e491@oss.qualcomm.com>
Date: Sat, 17 May 2025 19:21:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] clk: qcom: ipq5018: keep XO clock always on
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250516-ipq5018-cmn-pll-v4-0-389a6b30e504@outlook.com>
 <20250516-ipq5018-cmn-pll-v4-1-389a6b30e504@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516-ipq5018-cmn-pll-v4-1-389a6b30e504@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDE3MCBTYWx0ZWRfX877K7qsuh2DE
 gYlwSVnj7C7wFN01u6PllBWVBJCMKSsBH65TpAMv5ZFDflcDcxiBEzKlr3ipDzlrA4md2PKsQk9
 6ndGMOsWR7e/HxlZxWLJgOj36JdtpSXNYt4NeTCQk8lzJJWtL3XQA+pLo19IwZXeQB2aRxb7ulh
 94WgDETwhaEVZmLT6ICO+qWFwtfLSBbgu5iVAysnsTlAaEobTret6rU3LDUokX8pBLugUk+sfFt
 JE9Iw/1NxVeS0N7z0xBInKy16FKVFbOM/82cWpCXhY/LyI9/F7uchhy+kNLHfD8lu4XaZjsp3+q
 PdhurP/FDPUbWx5ZIxzlLiqxVUwG+FR6lPU3ZcwXLxkq4S4K+mTHF/hwff79oyQ1IMKSbeFlYg0
 NpXqaIgPa72aRbLqscKOauSpCxzG+8FJiwjhTaqEk+Dm1Oh9hMzZyHo+AAnJFFpeqoLrrPev
X-Proofpoint-ORIG-GUID: LElOa7iDiRzmC1baD0gZy-fukhxdqMBo
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=6828c582 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=DjvbsIfDJYjzuW62fVwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: LElOa7iDiRzmC1baD0gZy-fukhxdqMBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_08,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=541 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170170

On 5/16/25 2:36 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The XO clock must not be disabled to avoid the kernel trying to disable
> the it. As such, keep the XO clock always on by flagging it as critical.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

