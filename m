Return-Path: <linux-arm-msm+bounces-59942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C4EAC9AA8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 13:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9EE917FA12
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 11:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2CB239561;
	Sat, 31 May 2025 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3ravUc4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAF3238174
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748689871; cv=none; b=FjAESabn96BFxcpL0PBAZaxVmayk35ug1TjxHc0euS1D7b+07tmj+ZiEg3cIEtZOz8UNiQ7mdRGBJFZwE/VR90H8RbtPWDcE//Ci8k6bFlcCZOeQsO+BlYegI0vh0te6SWHYjxICVvRhg6hcqFEFfKutPi7tVLHsijQsLz1vqM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748689871; c=relaxed/simple;
	bh=5b46GiRsDSu/uXYhQaQ/gNjsb8GW7abqp6ixGsVYxaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEmP5ZLjg3PC9Jv5AQWBH483PSr6EOotXiJAni0bNzwXRkipmYcGxzSJbQlELX+BxhzCSl1eFEJOtZBv0165Og4mF6R++84GLn8rBTjtQFqSg9Btd2QUMnWdaU/woyBvtZ92y21C62R4ljo9Il3vH+6vGrNRFUxnovl6XNvAZY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3ravUc4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54V4nNkH025440
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 11:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZ+vE5pX8HZbB5flVQGgvGJmT1zk4uOzkDXJe6TM4M4=; b=G3ravUc4nBNsbkOQ
	Rjnu9S4rlJRPOyooCSimwQq0FtSVYBF1UVuI43oCa/NAuvo2OC6TXHwTo/dmwamh
	osWY4F5qH82MNUs5wpxux6M7OkpU83ECW8OGOuJP0cbf4+b+eDJX1WLGr2uiYDK0
	JV1I/5YzafEbaXxNJaHtjEuSW3SLcpgSib+cyaSLynzL9FtEDD5ZZg7TKz5YD5J5
	SFEc9TxFrxchAIcVaM1falgXRASIXiKcu1md2yD+/swedlp978FzRN3554PyNYJn
	+t0HETJV2aPW5wJGik0Ld6dq6B0wiFody0HYCf3ESwCb18a0k+NrgwHg5GG5DINL
	E/PiwA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yu2a0g7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 11:11:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0976a24ceso67596885a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 04:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748689868; x=1749294668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZ+vE5pX8HZbB5flVQGgvGJmT1zk4uOzkDXJe6TM4M4=;
        b=kgVqonICiD7M0YiFrqcbSewZgdcG2n4QW9WGS/u5W5JvXeVzV/u3jrjIb8RE3l5u1m
         b+ZSPcxSGENYBQj4dA1DEdSNMtlvXAb/B1B2vx7GkKWyygnAqxl+FrAIukDlz/Wsr9kD
         8SjwdLTiNvQTUzul9vGr5R2zrg1ndnG3LomxX1W3zi6Tv41oPu32hmh0A2l0WSf0kAOg
         fXsA66lLfpEH9/b6sRkqXppFUnxOvdBnUxdOPoaNyasvM7SJ5+Ywk9Pzlzfms4JSy4rV
         hgIaP9I+7eza1YSqd2ESd168FRRV326KWYhgNbDzaM9aHrOKGsgd5Vh/GF6zLFcO5ILl
         XmXw==
X-Forwarded-Encrypted: i=1; AJvYcCViqDmLt2kJX5wXIdsA27GdHG2qNFEcjED5BMgQkGQY2MtEh5M45K45tQ2tN58bO0DiUMRoxnhuWYcyu4C5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3wA7cBrmoC8EIj2Ig880ejBaWFe4NHkb+JTioUl4hYREhs82k
	GpInApz332PNYJjcYdkJEeNrIKk8QrSnPZfrv3AGcsY6qNHXEhZXaMmW7Qyfi2r6iJbZWQDJeJM
	RwexO/W/kyYo2oi7R9o6CtgrXH26Js9u4GILzHrGAbqYvz5DDB8gZ0Q1f+Bxo9ITVvfHCzHtPJA
	RP
X-Gm-Gg: ASbGncth5WdDwOHy2L1FcV/moQtIjLokkBsAbXP44ikFanGxRNEqUEjuwbTLxzoaSs1
	EIZz5N3iRoqal1ma5RmL4HW4XmszOCkej3VbouNQiZexdTplAgtlfTvOLf/xb2OZawfhSH2xg4S
	GjMYf+UEkSG9cOxyn0aCTU77umdoWdrW5cdZPe1KfHDx4IRZk6Ko54XkJ/F828gV7Ktfj7E+3b4
	dkjf+uq3/+mlVvdFHsE0Qoixx6YekoTrGUqaKQ6kGB5Ill4v3UVCbjplZCribuZC3g2APg6fSIA
	SBrzOFrybdrDR7f5Ptfqn0UorgEvj0VlyxJzufBDJ+wly6tWadSfMd0N1Gzbm0Y7LA==
X-Received: by 2002:a05:620a:40cb:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d0a3d978d1mr297824285a.7.1748689867835;
        Sat, 31 May 2025 04:11:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSvAl3+81zPxT8GtGObctxByRCmdXGFKJiq1TFWGEKnxHTfUWMUwJ0OE/8YtwwGaBL7+oiOg==
X-Received: by 2002:a05:620a:40cb:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d0a3d978d1mr297823185a.7.1748689867482;
        Sat, 31 May 2025 04:11:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e760sm486122566b.52.2025.05.31.04.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 04:11:07 -0700 (PDT)
Message-ID: <8c57ed65-002a-4ddc-9056-6b7908c0ff52@oss.qualcomm.com>
Date: Sat, 31 May 2025 13:11:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: venus: pm_helpers: use opp-table for the
 frequency
To: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-1-c0092ac616d0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-add-venus-for-qcs615-v8-1-c0092ac616d0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sp5OELw2hcPHkS2bNuGP1YDw9RYCl6ev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDA5OSBTYWx0ZWRfX0FhXPeAKOHXQ
 NDAXuv6TKXZZDta3eittrXQua/TzUJuhJMCAU8h/FErmxDXUZQN5gx+MXEp6F8vyBK0w+acr+au
 AuENHVA3vTOEcvALZe4B84nKyKb3+UkpsMEsNBTkSwkQyOpQZj9VfzHdA7AzI3KmtDDh9O/ed48
 gHybxWF6bsWLr5L0OYa+X81hTyD6lYNq03y7C5SZ7qaM3TsGgfEkk/XTy3knF/VMLnWPQlwECfe
 tJrF3NodsFGC5OKwgHtV8tf6VCo0Xvx6vxaKFftSHiEUkDpU1RA2Xy1ZlCO3mEyUunJxND5AiWE
 np2tYpfnT3zzR8zs9IYjSd4E6Y6yXN1Hv1ukL4NFRLUTqrotqB/RAjs3B8940WnVUuCPpSHK2Vn
 rRAB5SC31NMDVu6nxvuKg7w5P1f/XYi7g4wF/S85yu1mNBY5zCIkcQbGtlvTTeTL+ga4cxP5
X-Proofpoint-ORIG-GUID: Sp5OELw2hcPHkS2bNuGP1YDw9RYCl6ev
X-Authority-Analysis: v=2.4 cv=WYIMa1hX c=1 sm=1 tr=0 ts=683ae3cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=3ipQxu46YsJ9vmREi38A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505310099

On 5/30/25 6:02 AM, Renjiang Han wrote:
> The frequency value in the opp-table in the device tree and the freq_tbl
> in the driver are the same.
> 
> Therefore, update pm_helpers.c to use the opp-table for frequency values
> for the v4 core.
> If getting data from the opp table fails, fall back to using the frequency
> table.
> 
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---

You can save yourself some error-checking pain in this patch if you
do something like 

ret = devm_pm_opp_of_add_table(dev);
if (ret == -ENODEV) {
	for (i = 0; i < freq_tbl_len; i++)
		dev_pm_opp_add(dev, freq_tbl[i], 0);
}

to programmatically migrate everyone to OPP..

But - tangent - I'd say efforts to preserve compatibility with DTs that
don't even contain frequency data for a given target are rather futile.. 
Such descriptions where we only know the frequency (be it the tables that
we currently have, or the constructed OPP tables that only contain frequency
data and no voltage corners) are incomplete, and if the system manages to
not crash if the driver requests a TURBO/max freq, it's all because we got
lucky, as this consumer is not voting on (MM)CX.

That said, it's probably to keep the breakage to minimum, especially
given this is an old driver for old hardware.. I'll add the missing
OPPs across platforms with an intention to drop the hardcoding somewhere
in the future

Konrad

