Return-Path: <linux-arm-msm+bounces-57626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574FBAB3FF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 19:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED0547B19C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 17:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49654296D3C;
	Mon, 12 May 2025 17:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBNt2v/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF0425A32E
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 17:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747071965; cv=none; b=gpHZ9CY4yBnvyGoVg0Cmw2s1qE/MLeDjxPgWhLQdm+TyHPwo8ghUx2S0ra+xZm693QTwvHBI8vJWUk3SeUiKkj7CbKGrqwBwNB5yz6Lw+pTzaznW7eGWcxlUxEVYgVrYxo1FdsRRtg47l7VGRCkp5x9DNAyJUKr7180qoqTHbUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747071965; c=relaxed/simple;
	bh=+1wskF+vlvXOeOxiHmSxo4T+OSiZzaLsuf2oDKcRKNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsaXeW9Vt4yExhx7sOnplOxeVypx+TLcOdBmz/F8Tc1ga/7O9kg7pjo0F5zXAoi9JPtUwlXJPrkgyb2tupe1D0lg9tNeYZyFOfMWAdXXfrVbK0NvVeqOREfU43NbJfKr8TMnsJaS9ro9bXDAQcA+Cb6D8aObjfTR6OI4yD1EA3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBNt2v/s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C8lxGi022717
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 17:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwFMyjoqjIIBSKHAiFDJ1GbvaXhMQFF6rMgZHx5wWGg=; b=HBNt2v/sRm1MaXjB
	9p590BHwq3+D4FxmsjKBgn5F1VcE1VTanlIbjRhIlqKBGS93JepileyTkjBFT4zV
	sK19krkNM4JrIApcqP8YPFJhQJUAXiMYbfvtl8BloOZOFKhYIk6cV7SLKJR/jLtA
	8m+toxlqSef9exhdRED4X5waxZiuGvSAALMLGEoD9B4AbNBiBHAaa7HdOdaG4Pj5
	JCdLkuYDDLw1psKNjSN5hdjGffcpw9fPIVgF+Nmh+2RnvxRWWDqupjergR/TObhU
	crPsEmYERpRwkJgHrpUW6LoU+epQ8UWPGY0OfdgrQ1hxD5NveRS82zIQzBs42mVU
	OvfHRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kdsp1dbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 17:46:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22e815dd332so81726955ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 10:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747071959; x=1747676759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwFMyjoqjIIBSKHAiFDJ1GbvaXhMQFF6rMgZHx5wWGg=;
        b=NQYjUMVW59VGbgLc13siWUhHUfi34olozTII/4GZdn3bUordYNi16W8LMLfM17huQo
         3qKPfDvgjauv4a2+cObCYXqObhku1nAw5/xdwN+bzadVMp3Vq4W9+Ysg1AcTPHftSp03
         S5NOOGcTqYy/h7P8ZDQTIp1j4/3joTx/lG1v+XX99NO+s6RfxJijL33cWz/N6h/dHUM8
         ytr7JVodt4B9QD3R8+qzROPt0CdrXKFvjwBIEmohOEb4BBNLl3zBilZt3HOl1sDRIbzP
         ODKMcFHMuWvPSOEZRtifPX2eUuRt9gGvoQcOgKSoczVdLGPNKJDy/94qROmEqGW/Kkh7
         qcGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQK8iMY5EizDCbbpVCfl020dnnjKGfsLDP36vFRL/1eAfhkTpKFZRLEeWW3iUTfpCb2ZNQRpOW9InMDiJs@vger.kernel.org
X-Gm-Message-State: AOJu0YwOKVkGUV2Nw+VgjUaSPvVGbbIMJzcRRw/xN4sWOq7KpWsZtvHZ
	k96jlM/93OhOGbRguoA58u3nrJEHW2wYrjmD2fFViP82gQ9h94W4f7DCjUYR8Kwe2o4reTNy3Uj
	RqkCf7FHlVXjBjAjM6BFR+nKXBGHTKWwZLXeqFIx6urINRBA/xVWcxczSut4oqk41
X-Gm-Gg: ASbGnctvE7Dm3LbaBUTk44p+gPfBQ82NvCX3g2E2135JGzKwQznYR1APpdAM15vb63M
	fui6exZs2G3RQGH9NmT5d2/HLbtKWwhaFm70bR77TCTxufUN80CxtFNtdTa+WKkzHDYP4nRHBS6
	POLZLAUe1BXcGnQZfENo0Uba8vruOsSgG4Jfn2Pyedm11jttomZ9QEyaE5gDQU/QZE7uJtBWygV
	8WSu5f8smVz9ZSwTwVMuwujp/tjI8XhvX/2uyDZv1xrFM3eJ3aLfo7jozIAVODmbvMEQbPP3gS+
	Al+vDWoPQOy+93eeOWEKnzAjE6u7PDleOtIzCK15kQpJ+eKyBfnvEMc0Y295EIzn3mWAJrvt2k4
	oBkDlhXbi0fPFt7mz4vfCPQ==
X-Received: by 2002:a17:902:e54f:b0:22e:3b65:9286 with SMTP id d9443c01a7336-22fc91a84edmr219453105ad.49.1747071959317;
        Mon, 12 May 2025 10:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9XtBpqjWjP5GwO1PxhnOOa1IOruziZG6NCExj5cy6kabPSTmxGq7mZ3t3zbgC2KxpriUv3g==
X-Received: by 2002:a17:902:e54f:b0:22e:3b65:9286 with SMTP id d9443c01a7336-22fc91a84edmr219452725ad.49.1747071958894;
        Mon, 12 May 2025 10:45:58 -0700 (PDT)
Received: from [192.168.0.207] (108-253-178-250.lightspeed.sndgca.sbcglobal.net. [108.253.178.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7743b8esm65502785ad.101.2025.05.12.10.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 10:45:58 -0700 (PDT)
Message-ID: <f2215dac-6d31-42ec-b2ef-d0357b9542c6@oss.qualcomm.com>
Date: Mon, 12 May 2025 10:45:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
 <20250414-sm8750_llcc_master-v4-2-e007f035380c@oss.qualcomm.com>
 <cnlu4yhfax3ggtkig46bwimr7acpoxl6x74dpu3kdwq2wcjwmd@d6spkmdywrja>
Content-Language: en-US
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
In-Reply-To: <cnlu4yhfax3ggtkig46bwimr7acpoxl6x74dpu3kdwq2wcjwmd@d6spkmdywrja>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VBj0__foQzL6jQ8X7YuTq6EAxI8QiOSr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE4MiBTYWx0ZWRfX2kWkDyYhbMtN
 rjHaMhJHoZdwsn0BfSJMkjacecNQlI3c1M6jJ6CQpPe+2sFNgRyq4m6RwdnxKmme8N+6Jm+3/yC
 s2wRlOnIig9KwpWGLCkLMZE5/BLIgJDXtBgIosMoZR3Ml2Z5PnJevjwS463RmbH8qzFVzcrF7jD
 0cyX+WbG8gCQ5dV4Jq4Z0I/sBlpotfyF4V05l9JpipHDdR/fmDXfm3PSCJxxGg3a2+BIabTqC9V
 9nXQK/Kf9T1VGJjY8PbzJLs4a3/L47rxtu8qJagp98Ljcji4XOWPFoPwYwQw72avSw0L3QRlK0N
 ZlkpBY/7YOsFHRjGVd/SEO1GSfm2QUqFunQDDbZ1+JVaaVO/P8NyGGGfvLDukf3PiA2HN078ffe
 8mLgbdfkT0H4sSMF5xAT/IOCD1g4GmA22ICADl804ytrNuaVx3It9Hyb6t5bhtJhLoy+/Wqc
X-Authority-Analysis: v=2.4 cv=TrfmhCXh c=1 sm=1 tr=0 ts=682233d8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=FG+XuRmzQztUAIe4/jomRQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=w7cyabqxlMpfI9qJrWQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: VBj0__foQzL6jQ8X7YuTq6EAxI8QiOSr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120182



On 5/9/2025 3:12 PM, Bjorn Andersson wrote:
> On Mon, Apr 14, 2025 at 04:21:51PM -0700, Melody Olvera wrote:
>> Add support for LLCC V6. V6 adds several additional usecase IDs,
>> rearrages several registers and offsets, and supports slice IDs
>> over 31, so add a new function for programming LLCC V6.
>>
> Can you please fix up the checkpatch warnings in this patch?
>

Apologies; I'm not seeing checkpatch warnings on this patch. I'm on tip 
of linux-next/master.
I ran b4 prep --check, exported the patches with git format-patch and 
tried running each
through checkpatch.pl individually, ran dt_bindings_check and 
CHECK_DTBS=y and still
not seeing any problems. Am I missing something here?

Thanks,
Melody

