Return-Path: <linux-arm-msm+bounces-60702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCC1AD2AE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 02:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F01413B1582
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 00:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B99481CD;
	Tue, 10 Jun 2025 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpDb1dMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DA32CCC9
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749515135; cv=none; b=YdiYwi1Ycw5wHtPw2DyCMOuFckSfxEOy0RZD/ZksVMjQeFTsb/AnIsdDLFn3EFUA4tnj3EAC18Mcnv8xZGQ8/GwrxFvMqBNLFuHVb256iYHTdxMCty+bm6pNQPzOI9TsOc2TkZfzfKr/2swNQgAlsM9y+xC7j8m5DL3XcgFqzqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749515135; c=relaxed/simple;
	bh=aWBGDsONt3DsLjvWK84WyJYg7SV4UPTZ1BXTjC/JrWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fr3KH4+no+rW40Ort9l3yxYnYPTwsSCnC+GyQyp53qCquj9NK9gA9XAqTOLo8IJRDklpKQU1ll9/a8VeG0ezNYAtweOHWEmgM7bzT8Zjp8BUCITrZ9okfPgMqqZqsnsZyo8Xa2mWV2/iB1uzTR5zsFtZO10taRuHR3z14u4CnTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpDb1dMD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559Klg3V015857
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 00:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09vmSKArL95chil96Dhr62OqEuJwsqeryT0wyUra1sM=; b=kpDb1dMDg3Hno0DS
	5gjYFOI1O2StNBnOWfSDaGMePQRiS3m6oxqJchOnrsGgCmR3jrcxZT0Rp768bSWB
	+EwwGJnicIFX74T6DuMlcmc7gk3mHgmDg1bXKGwG/r694Gay3DFd1b0xe2nAM+zO
	918Jf5YQ9qvAth+frXwH2PuTa3/jJlBufDFaMDn6bkguoWaCl0K1qSbe+49QJ2rU
	tdCN0s6As6lYVVdb764/Y2CBcS/iQZsGvpkpRtZlMgRUfuZrUuu5fm8mz8I8Gkzd
	4DPlIMw1cDSE6pgOPmzoIFapQ5YnjFs3XaFZO1Pr2bEMNhboqKLftsZoLj5gyJPF
	8XIR4A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11ys52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 00:25:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f539358795so12486336d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 17:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749515132; x=1750119932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09vmSKArL95chil96Dhr62OqEuJwsqeryT0wyUra1sM=;
        b=hkmrzCvH4Lk/Jc/0KiXsxjMBvu2TSXLN5AY0LePm5u8UvHsSmSqzvtrwEoE9uuK4zn
         nOPmdCeGTAIzgUcQsUg2TGqN9RYPpLgPTGRugkPcL89LQu3lHbxrza24HHYL3HuE8N1z
         SL7DHblAzQju6ftMEuV2O/R7EZ/VfqEUKgNr/cHPs07gcanqHnOLXCOq6nCCIP70vIve
         0KtJp+pmbaIj2P5OU7C03S0SCnP0+j7bLKhjfJkp77sShASPDMuSaVllkOKyvb3vH9Kq
         K6uZSs/xrAOybAMGsniODNX3vsWNgmHrCJLtdW15j2UgynIjbWrRB19pIEbGFrfJCcCg
         MBaQ==
X-Gm-Message-State: AOJu0Yw4b7Df5wgyCrjLr0j7/8TfWBZbG2Sia1eYX9q+Y6kcLC9J8oOx
	RyZO4gQ4Fa3GaQheFWDSSPZXaIKcSX4E3XuVLKzbIt5MjNRzxlIjSHvO5UWJR4vq9TJYciRSd9I
	7xq4aBu1iNc1VXjvQW+UxK/A3QsNO2hbiCm/i4wmNBt/iQa7efGsYj1aBJQM8vNMl9FoR
X-Gm-Gg: ASbGncvez1tC/MUw2CR9PMqJn7s32MVBhExJ1Te/+XRwhMvNOwydIkUuQeYPOiFPCrr
	SC+mBgV2/900Fb3e4bCtnk+3M0nzcxn3KVZtR9B7SdSdWhT3e5Bv7RuZaI251CJFl4EjK0QmN4E
	RONktKoby2RfIiH6YABiNSlfYz/EUm4TKKQOXcDMyNmRw3hzWWvshSprVTPldO0coSxqdNgRD4K
	nhiFCvu4QjLfGfiecryFpjafcYkFWAoIagdAgSpo+l418CGx361ZemPbp8qQ8/9aXjbk9PpkzXj
	PwellQsC1uQZPcYrG1mqgkcALKApM3k0V4wX5nvxMmIxwAevy1VWodMP1QruVHsD4B7gQQ/bopU
	d
X-Received: by 2002:ac8:59cf:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a669071b67mr92670531cf.8.1749515132090;
        Mon, 09 Jun 2025 17:25:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfBazml5ir8PMKKBZnsIy6xGkN7uScP9aQfNz9MkoMEsDOeZMCUgKUdSP77uFtWQjRzg3uTA==
X-Received: by 2002:ac8:59cf:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a669071b67mr92670401cf.8.1749515131704;
        Mon, 09 Jun 2025 17:25:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60778377686sm5444185a12.25.2025.06.09.17.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 17:25:30 -0700 (PDT)
Message-ID: <e1367b38-875f-4a9f-9dab-9aa9f12488af@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 02:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: enable sensors
 DSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250608-c630-slpi-v1-1-72210249e37e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250608-c630-slpi-v1-1-72210249e37e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2ndiec3s0R1fpZr56sqP6ky5mC_8O9pA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAwMCBTYWx0ZWRfX68CTBmF9Ot/P
 kh4UzdZZpVwVSJbszSaRmtgTBvAT4pRiHd13rCkAzb7KLlb7/0yXBWfGGt0aPhR6U44YAYkurbY
 4WjGxfyptZ9IeRGUBSpHADq3Suvyn4RYB4ylghUumsfM7C0P5SxA4c08UeGT0pCM2GjKXq9j79s
 02G9gnxLP6CQoVkJrfMat3YW49nIBIygZAFlV3mrWi7lufsCclbndpqquE7TSOQR/yWDrfFEHiB
 NhDxChexJK0tGyXX8gXMINWaU7tMKFdVXo+1XBRYajtIL6zTcH4IUR2O40ueOq/BOPzEGyj35V8
 0MbdV02F29ywPtiL0twkATzphocbxru2dRypUykkWMG6sC0CEktOTOMqo0anE1y89B2mKhTO9ab
 j41aqyQvrZGl9/REF1+Yxo84K0wTM1g+2VogQk+pm9yPkqmSWsrXep8Rsny7CBkMGiFHJj8S
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68477b7c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=UYkWuftlsXAw6W1qggYA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 2ndiec3s0R1fpZr56sqP6ky5mC_8O9pA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_10,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=597 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100000

On 6/8/25 6:02 PM, Dmitry Baryshkov wrote:
> Enable SLPI, Sensors DSP on the Lenovo Yoga C630. The DSP boots the
> firmware and provides QMI services, however it is of limited
> functionality due to the missing fastrpc_shell_1 binary.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Check if the Flex 5G's signing key is different (or maybe Lenovo
had more sdm850 models?)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

