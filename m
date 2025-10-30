Return-Path: <linux-arm-msm+bounces-79727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F852C2162F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A2A73AB7DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDAA32721C;
	Thu, 30 Oct 2025 17:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deKCnjL6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzJq03cg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0D82F12CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761844052; cv=none; b=PRyUJXijJxYe4rXyRSww+p15U+cFKE3KMoPd5mmM/SgPf8z/SLM+UWGaIgSDtTWD9SLhDanK2b4S0OCRCxy6aeUPhJd4lK8bd3BVPkVBAX3Y8M/+m1jOwdOrBeAnmbsrRf+6ewrcMpVPCU426aeP12YhqV2BpuzqY3Ss3DFSfAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761844052; c=relaxed/simple;
	bh=wKvIfqufDuHtKL2AooVSBK47inR75+5K2P7Tt+gVXfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUv9iH7iJlGLeOqrOUOAA63qo7yYg+CCK77tWTHFMu4U3Xo2Vww/ce8usVaFQRTeXBIMsQwU8Z/pN+DIKA5Z3JT6vTZORhXWCgNxlnae/juHks8Pcn26RsRjocqDTQ2GyNxOmi6V/y9aucDP17OM1DQXMebWrg5EMcqflNKfl68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deKCnjL6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzJq03cg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UB8YYE3808751
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FaUffMg0t9RN/r6zOahDKELQJDjO77lGV7JAED5mRPc=; b=deKCnjL6nnjC1qyC
	8fs4PnmeyQ9oYQqtw9ndiYaxFh0VZnSDBXCEO9LWst2vTRQzq1LDTQq2dJWDOcTK
	liROZ6/3hUu9m9xE3vBOoP7jAHJobfoearalPgJidKP0T5zWV/Zjkrc5DTz6GYZI
	tTZUqI6zmAadBDzF323TwgrJuhtE9NZXs0AdMcYz53xv9fVUSTaAmodfQqkqZ28n
	E/tBXKzBhGp9OWfmWso+hO5in/ozgxx84UY92RHtRSHw974uOgkeNYVMEWC1XimT
	JIU85CUR6TxobrVzghi8VFlDAtKqrBetaJw1u7z0B8slmlUlChYkPeYYKQX2538Y
	VQUQJA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a46vv90mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:07:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3407734d98bso438970a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761844049; x=1762448849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FaUffMg0t9RN/r6zOahDKELQJDjO77lGV7JAED5mRPc=;
        b=TzJq03cgqgWfS7E0cPNHzVtWB7LGCqBbg/hN2fyADDrQOPPOPE+5eAQD9T6lT/0kI/
         bZ9lKA9Yl24eIxBSJNXWfM9AZ50IRLGA18tox8RVF9Xeu7AEHIMm8sB4RCH0JpIqb0/4
         2LgmdbcS9J618dDoIZXz1Q+ZnFjHR1PBt1mi+heieZBwswbunz6FrazbFWD5xKp3xHR7
         cuhi0ADz0I3NHjNYX7S0XJqHJYivhlIU8NfHsx/Dha3FWBQEiL/SWQLfJ009e/anerCj
         ybTf6qISeOxK2SyOW3JXQIMwS4yBbWqjMmy7TClhhS7FZAuCxD1GOeZfRnGNhdUfWB6X
         izCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844049; x=1762448849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FaUffMg0t9RN/r6zOahDKELQJDjO77lGV7JAED5mRPc=;
        b=QzlBtY0fkAIW88BRklXc7kBIJPfAJGIhamxk6LpUZ5ysRrdyaggaOkuM+FK4wOAB9e
         b/keAGk/lZhmXPTT52wVk5gFwtUP4lgO9lrhmdRuS/YkTnZmRIOTUk1HtnFqjv9ZHZA7
         f0qmg4gfMRCiPJW/mL1BSQMynZ1Ti+/MJhKzC2uDwhoV7hfBMaqP7bobxaTQkzJHDE+I
         8FSu7K1y1LzieS5R5R+/gzUZY9du6PvHssSzLOe2slPY7i17fN/g9EOkGwEnjviXLeG+
         4gdrMIfdOOKktmZuQJU1zG5le78JV4TiWgnbvRvXh6jjP8Yif/35Wb5166dyJIXAZuQ4
         kFGw==
X-Gm-Message-State: AOJu0YzHmDsjDMfb0Gm/g+mouEwSZEn1vvJ5ByrmF9NvP0Vn3xQ0bw4h
	iSrfiPdrKCA3gqJoPafiyTRHt2wfFQKRcPkMfOfxg1OlVbgsxq5vG+mjkqVShBm3CWlnFxVzxvx
	gr4/4P9Lr8CReKiVesxi0XFD6TAFm/wA/AvPVsPsuUrHSkt6j7j5hUd5Rv2J551MJl0i6
X-Gm-Gg: ASbGncs3TkxI4H1+qWf9P+4ClXRMX63qLYQ8FZqhLRuj3Ju6VAIy1oAGMo8XyzUuDdo
	U1C8jbfCxfBNYb/8p5bPIYAhm84TlOknJo/KbphJptIE/lcGW7xdWY77FsykE7rP3xJPrjwlNW4
	muCIGd42wPaEQuRQCvH+dIpWWepL8/ltCl+B46Q/261s7J0vEDHaD8rw6j1LFaItJdvlSbMrine
	bjnw0cEbLYV0JkJLaSrX/ZkyGTmZ+S/zCHjijfINWETosiTGGqWcCiBz7XTh1x6SKvJy82E93Rh
	LFGKHx2Nn/crF+iaLeUIE8uA+dfxg1WxFb9zSHy6hcisYsdoqXFLGFaHU5L67HpYTYqJ3pT71Fa
	s5npCySM6w/vY7STXspzuDNYOwr8=
X-Received: by 2002:a17:902:d48b:b0:28d:18fb:bb93 with SMTP id d9443c01a7336-2951a35eb15mr6940745ad.7.1761844049294;
        Thu, 30 Oct 2025 10:07:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKj+S6gpsD7cMRDxp+B6gNmnaouGxsBh/tuKhDI+PPphSW8SvQHJcu/fR16r0MTnLkisEEDg==
X-Received: by 2002:a17:902:d48b:b0:28d:18fb:bb93 with SMTP id d9443c01a7336-2951a35eb15mr6939875ad.7.1761844048492;
        Thu, 30 Oct 2025 10:07:28 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.28.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d42558sm192028195ad.69.2025.10.30.10.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 10:07:28 -0700 (PDT)
Message-ID: <cf41726f-cf77-469b-ac1e-404b69019573@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 22:37:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
 <20251024-sm8750-videocc-v2-v3-4-6286bbda3c8e@oss.qualcomm.com>
 <d001f158-008e-4aa2-9f30-a06d314377e0@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d001f158-008e-4aa2-9f30-a06d314377e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pz5YNCinlFIkEG3Z7xg8Huml19qX5rfa
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=69039b52 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=kYOnW6kYNC4MuwyOue8uGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fw0g0I_whfq7NU55yUAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: pz5YNCinlFIkEG3Z7xg8Huml19qX5rfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE0MSBTYWx0ZWRfX7YQBhwEHAKJN
 73+L7xtyJyG5pXDybd3loDvYp/Ku13OtT60/5nnDCh3Acx2rYrIoJfdYgSvk7s9H1LmVictvxNy
 tAeTK7hUPbh1ZmV8k6BvIgMDUixn8K6+W+EraXgjbpfymLbWi05CHWKWC+dgNNaGid7IlNo+wCt
 SbES1T/pysk079fwID1AnR3vJQ9eTFShCXmQsEZFKljmSHff8ok6yGhn9chKYms1nBATKbG3/Mu
 xCdu1aQPhKitpmh+QgVWC1oSkNE1l4IW6D5KdIenbjtNz2UtyHhQlKtccp1aOjp2Do23qjx1+AK
 N9v/cHmixs2vwhP0P/20N8Se+DZRNqAsDc4NEh0KJIz0HzmZwwZOwm3feB2CmyH8cHjKH7yM3V2
 AihG/eISJwr1JPWBvv/HN6YOlgCo1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300141



On 10/30/2025 4:41 PM, Konrad Dybcio wrote:
> On 10/24/25 6:24 AM, Taniya Das wrote:
>> Add support for the video clock controller for video clients to be able
>> to request for videocc clocks on SM8750 platform.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
>> +static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
>> +	.mem_enable_reg = 0x8090,
>> +	.mem_ack_reg =  0x8090,
>> +	.mem_enable_mask = BIT(3),
>> +	.mem_enable_ack_mask = 0xc00,
> 
> GENMASK(11, 10)
> 
will take care in the next patch.

-- 
Thanks,
Taniya Das


