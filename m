Return-Path: <linux-arm-msm+bounces-85522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF5CC84C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55F29308B90D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1508737833A;
	Wed, 17 Dec 2025 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IilCwr4h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFUF5Tya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3139A37A3DA
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765979557; cv=none; b=D5NGJrl7bLQeF6YrOE0zVi/sDmQFLC80MwLcd/GLBg7mSt89CDlYVzWUsVwC8kA/xXmZrp+nsi3LOE/4fb+/Q6JeEQ+CICOJYi6alfj75lcAGyZjCifhF0W4rFAmMz2o1fMGKBDuVHIb9SENHHbutuaIht/nsBwl3+1ql+PiCVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765979557; c=relaxed/simple;
	bh=TK3INEaxV9cHyuLCeED9fh5UnORuAuWrjNwFjMEgIA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndCR2SaiVh8Xp4FUWPfl/vsgAu0pDP9yCFLwJ+62vba0Fy4szZ/m9WdMIF1GM5PlzUwrhbsMfhlz3qho6XGIYKbhGVZwcFqkN+B7acw98JOskqLb+kqRc3gNJ3h7fbLFjsuSPBLWJ/2G3kCiP70L3Bc47wd329tR8xaDOtUKwxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IilCwr4h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFUF5Tya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKq0O2502690
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MUcFSeForpgs1zaOWkq8M3g4jUQqfiWW8mZI5c70ols=; b=IilCwr4hKN14NE4I
	1siREeR44j54HJR1QBX/8we3n4wgCQr6ZmKT8NMxp6BHsqt9RbpktPpTJWfGLqKy
	t7OWuDEpvSdMe5lXZihFb3rXDZEJEBvtsYxDnAE/eidS/xvHd8Qc6xV5QlLGy1+k
	Giv6yLboDdA79j7/bNSnbhwMUmenZcWDqtd9LWT/1331gfscwuJ/UdtfagI8Sf9J
	iR6+JnCmhynarrOeV9/ndcjoU4xmRdj2IQWilw6j4FteT0JsnWEg4dUT/IGO5wD+
	0+sv8rX3t0uM+wpkbbsjJRZSypUMwCFDJcz3zRhlqcnVLtTPM3bYmCv1KPO1FhbX
	9YACYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3rqa91ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:52:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b196719e0fso133235685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765979550; x=1766584350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUcFSeForpgs1zaOWkq8M3g4jUQqfiWW8mZI5c70ols=;
        b=fFUF5TyaaYCMLqmYW+r5FXuCBpF9PFGhYrkFoNuorynmHExxaH+Tp9dyyiKqw37Mi+
         SZ1lTwKAd33VVFVlEpI/s7xwvqLntkwmlVynG44cMzuHLZpleTJXO84oxiyVXZSzsvhY
         4hkf7yjVgs+4SfhXjh0SIuwdESK7FHiWGKuURKMkhvTyqrTBqNGBj40Um8oPO8WTeRZG
         ARdQzpMSLYmCwocdlR4clWtoZxifiKqqFuaUWtirV0s26EfTIKXDvYyEtIuoZOHSkbRp
         mdXXGoFwnRKRsLbXuMzUNHaLDXl54BYvS6tPENFS0UuU6KqTp7+DayPsB7bJIm+Gg0Sj
         i+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979550; x=1766584350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUcFSeForpgs1zaOWkq8M3g4jUQqfiWW8mZI5c70ols=;
        b=iiWtRJxGRAqq+koxoNhUEg87AK6DgwEgTDKZA3RVS8jiE9lcmFuiUz1AlQ3NhvQW07
         JdyPFx0J20P31RZ/JIk+gFkf9Uo2CDZJ2JEaAPTOW/hNnpNNeUmKHMG2+F92vcL4QEPM
         1CjIgoeTT6C2GnGf/QcRlOLZer/p1Q2TAmg05TqP/qiifxuNdxEkQM9JFSgyBw+mSflY
         rBuBWzsIZgKIr/jeoNK+m1qB5RI3QU31VHAgKaKB79o2e/VXeqvKtMK8BokBDr62HaIN
         tVQGDXah+Ra8ZZBu5kk0mm7bYjKYtjxqiQ3Vt2VLAd032xjOZrr7XHHpBDRMfDdhvLVu
         bOww==
X-Forwarded-Encrypted: i=1; AJvYcCXXN0JQfLvzWYSRlQPSyGkOYlchjitl3VGKbWfEdLVRom2cUuWdv47RLEk3JuRY/O38Oma9mZYaevHHv8UC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8dXqqElbZDUAFNclcwg6ppLjlHYY9mx92LV8M9Wt0EgXbwcKL
	KDjlg3R2ifHMEn/2s1QE1CRxjm4NKezti7Q8QnMlMY4R0RIg+xUAvwE2R7Eb1xccem+Ljoriu1L
	5r8ockM3mUC63lkw5qixoRZxLPamlpfpK/7IGZzJ7cwMo9hmIHEBs5v6z1uxq1RwF+ay4
X-Gm-Gg: AY/fxX6WclXOVsEBqkDO8S0eZc4iI/o0V5RF/W74Bm9Gb1odz5ZKQoTz4s8aqQ/zkT6
	6rGj6F7EEI6TWTv39NfSEPQ8xSqatbGPbSKX/JJ2J1hljU3u90ApTiodzH191wKdzmghRK2HFNJ
	ay6sOlDsHVIv68R3lYqIj5YlgLSz6ypSwq0w6pa4riUKOmsEdZpOyaMwNtKgXe1ilzat9HCLN5m
	HbWYWbYF3ttLX0317OfgFKUNcDrWav7GvrYEvjXKU8IdTc0IVdKOyUgUvOetx6dxvoonOBvHUYd
	t/NCWH+mJ0b0I5ru8OMDA84EJ2Y3SqEbfoBgx1F4XGWg2Hg4UM0L5gL9iwCBQvNNQvn0idycAoQ
	ozo+tS+Jln78G5we4ybtwRRPgxPeIn60EuneE5Jse9VfPIK6yj102wH7j6eoNG5ebgw==
X-Received: by 2002:a05:622a:102:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4f1d04e6df9mr194858021cf.3.1765979549954;
        Wed, 17 Dec 2025 05:52:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHn8FBGFvWlziwKU5p3n+hs/jstKbKvea0UICNhQkpwL2yQQ7Zau1SiOTq9MXzcJTbdWmhfw==
X-Received: by 2002:a05:622a:102:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4f1d04e6df9mr194857621cf.3.1765979549545;
        Wed, 17 Dec 2025 05:52:29 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7fc04f6015sm1054089766b.50.2025.12.17.05.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:52:28 -0800 (PST)
Message-ID: <5dc3d3e0-a338-4f2f-8987-5705fc1fde51@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:52:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display device
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
 <32f013e7-ce2a-484b-8575-e98f2d23f59b@oss.qualcomm.com>
 <faau2h5z53frwfply57oh75zr5gcz4gf3za4vflbyht3ok4zgz@2ylcwcqcl4rt>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <faau2h5z53frwfply57oh75zr5gcz4gf3za4vflbyht3ok4zgz@2ylcwcqcl4rt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fESr8viKKPN_vS_TIPe4VJWdlSiL21ut
X-Authority-Analysis: v=2.4 cv=ALq93nRn c=1 sm=1 tr=0 ts=6942b59f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CW_yPJa_05T0x9ChYMQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwOCBTYWx0ZWRfX+n1MCPld80s0
 Frd+S3nhIk/hVcn0onOtDLa3eMqbRM1RWNVxOnGQNU0SzCZ+L8w5ONTm652Tfbz/PMVp3dT+5l1
 YJLsoCjvIqwmkBNyHEtI1M3d+rzcL4kUYgFuc2P7WJDv60aAcjcks6LP4K+VJ2b0D8EWrJh9gVn
 Gz8UdiGPgPVeBhvmpahkGp2aZ/M9UA5GbZUY0J96pJLWlfocRo2oN+P4AeR/NdIxMRV9GGL4/b/
 +RM4sUx9KTi9Io32hQxo5zb23t5o7r0Nd26/Q4AB8Ki/WYYaQSBibo/8Nfyd9Y0fpFC22f/7X63
 kUwUrTjCWAC0HC8+nZsOhbaLxNZ96ckBL0kNFfqk3BB4OpNhonxGcu3Qi+Q190ySd6WACEo9nZC
 lPvlIammm+QvlL3LwVU8vBqcCnoDAg==
X-Proofpoint-GUID: fESr8viKKPN_vS_TIPe4VJWdlSiL21ut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170108

On 12/10/25 9:21 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 01, 2025 at 02:35:44PM +0100, Konrad Dybcio wrote:
>> On 11/25/25 11:56 AM, Mani Chandana Ballary Kuntumalla wrote:
>>> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
>>> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
>>> on the Qualcomm Lemans platform.
>>>
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +			mdss1_dp1: displayport-controller@2215c000 {
>>> +				compatible = "qcom,sa8775p-dp";
>>> +
>>> +				reg = <0x0 0x2215c000 0x0 0x104>,
>>> +				      <0x0 0x2215c200 0x0 0x0c0>,
>>> +				      <0x0 0x2215d000 0x0 0x770>,
>>> +				      <0x0 0x2215e000 0x0 0x09c>,
>>> +				      <0x0 0x2215f000 0x0 0x09c>,
>>> +				      <0x0 0x22160000 0x0 0x09c>,
>>> +				      <0x0 0x22161000 0x0 0x09c>,
>>> +				      <0x0 0x22162000 0x0 0x23c>,
>>> +				      <0x0 0x22163000 0x0 0x23c>;
>>
>> The last two regions still happen not to exist
> 
> According to the memory map I observe, they do exist.

Hm, you're right, I don't know why I couldn't find them in the past

Konrad

