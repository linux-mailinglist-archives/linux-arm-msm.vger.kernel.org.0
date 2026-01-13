Return-Path: <linux-arm-msm+bounces-88792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A80B8D19751
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E1A330222C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 14:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F03288514;
	Tue, 13 Jan 2026 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVwp3T1+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UApvqlWN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D0A22F16E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314497; cv=none; b=lyk0PwiDMkqjYGsJh0AFyPuMWFD56H85NecRgQMhndrdqRNJS+c8ib3GWx9VwU9NN86vZogtoqlb2OafZsLXxGjGSGjPDR5WbMuE59qo3snAbRHgNVY1A0Q2U/7r0Iy/WGtyZsIirXoSSW5VUujmFnu9C65weghTgQJdVyyosIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314497; c=relaxed/simple;
	bh=GEyvcU7FVWlyZol+s2Qczz4gRoztqnhhOrtCtAVsLOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hacmTOw/zI1XxxQXZvb1vACoYY84gfHdv4u9WCJApe7P2BEcbNwYchTjnG+8uTVl9y4k0oksDI+vRx5+ZMQ1/42d4lQNxRrVgIuOmkSWdxfWLWFCjl0I852wXQsSeSBFEKu49vfOv7BJo83UmZQ9YyzmMtUPRG/LWMS29KjkOtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVwp3T1+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UApvqlWN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D8Z7DA3728616
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZxqRB5HlWu5i21n6GBEu5rKuss69ZplhsDQf9AUqOAk=; b=HVwp3T1+/inN6BCz
	NWUQsSV3hwkOFUBII21ziJt1ElWKOqr4jhc3J+xyDv8PQ4QyntunGwkwBEFycXAD
	yBIpgkv1JpXwUlPLFLr7BzyQWxVVtcEQHgyRh8dSM/PL5MDaf4XPwU90CdJ6d2UC
	UgsU5flJ/56SlDpgrX9yjJySo8vL8KhK5ScP+PH+FrA5eABEaPvv58kvmB+yzDRk
	bfz8RLueBchiGRGJTNMjbf+wWKnHFSLXSL+eESk8//QKZtcs7tEWcKq5RO+KQQyl
	Lf7RydPuKsSdQMMFN8shOLjlp3C55Zcab5wGQkMHbT7oOBJYMOx3YZqU0hebQbBS
	IJbXKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnjnu14ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:28:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2fdf3a190so141260785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768314495; x=1768919295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxqRB5HlWu5i21n6GBEu5rKuss69ZplhsDQf9AUqOAk=;
        b=UApvqlWNOSvq4ROriQQha36tC8HzEdn6pfVP65CqXm8D1o6PkTjaUrBbjrJemsb7cY
         1JIor5BLAhtup6srfbPoe2QoF/8bE0u96s03WX1R0TbEnXbjv/FvLli6Bzpf3XLJqQ88
         fM/7uTK7tgxw4MM5WccjdcLctDni+NgPMr6uOtuZqzLK09WiHV5zgbkARwkc7IiKr5LZ
         tdyUMpQAQ/4U/frO4i1TxXI1g+BV7JP5f1disqsKui+dERR+Bmo1SZblr+VQkRcI4Jky
         9A4AkEN3i3b08JFyrUTorrQhjD5X83MBiN7+yVzMCs6hNOLfKkO9AFZ3kF+OH4iwP/cf
         jv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768314495; x=1768919295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxqRB5HlWu5i21n6GBEu5rKuss69ZplhsDQf9AUqOAk=;
        b=ZbhNr3xL1nitmiSaUru8k2VncKK/A8O5WyuWytGTxIBfmn88U0ve6Y2k3/ZuwL9/4y
         IkLleCvCXnnmK4NExQTNvjaomItHQg5Ds0c49ciYCO2IetFYHUHba7qZ6U4kodsCsuUl
         bpW8dFH/6AY6OPz2Fu/h62gd3pcOlQSqT2iZobUxoPREayYqew7ObFaNJF7OXQPM0IzS
         jVRFTT6iRQbNwzx7KJFn4AaY9UVmdv1UyEB6Ot8BcCIJ+L7ErJdwbIgutj5pYIKJAocP
         0iqGjf2tLTdLGOagBRdGuzHoJJPWK/aRpVOo8qr0GS/kj0tFmtXcEuIpvA+bKeyOhaJv
         39Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWINROB8L4Ilo3wd1QB3CoWiQyGlBOJ2qMUAlIBTN+w0h1PT/T2VVVxgGLPteOFmodubB4TvMzAjJAcJrC6@vger.kernel.org
X-Gm-Message-State: AOJu0Yye+2rmI090onCr1pgfjc71Eg7grfMHjjRynWJQ6WTxZz9T+N1z
	Q4viwXQ90TUaZ3cZPR4YI8H/CKCNyDnNZX7ofLWEcWu9tsD+6vPUHBCvu3IFMQLI4B+fd5/CrU0
	Tf7FuINKYAKpWHKKntqhgSydvRSl6B9VVvH6+HMLqBncGKX+VLAVfDfHOdStr37x8oSls
X-Gm-Gg: AY/fxX44FtURQyDn7ZU1W8QF/n5YmIht6BpUfnAvSRLUT7FRJjekbO7A2sspzhhS8LZ
	oOuyRNgzxi/zfPVrQNBbFTpDW8d9B/39QNNkr+Ux59w4wrS7JU2uij1JuMffveAOjYc3DAOmVi0
	kYcbCtZiGUg+IhOlyJTsj2cIeBCNiQFL76qyHjm54wcK1K4AcyuIJ3elElv4QU0k0p0rOZedcsk
	CP66kA3UJk3IqrNSOKF5fGwcKiA5eGSyqrg+bSEyGHDka0bchi24GaHToS7s3edCrATNN9odAgV
	rdXyMi53bQTJN8kM+BhVnmBMWHqRNEVsgnivFlYpxONUjVVnCVqvHV7LsxfZIW6S7iHXKNCj3b+
	AHcJPzTJS5ErSFkV/fciE6hI8uf9MGWkXh8RGECIeKzLGidJXd+wfaD1YeuBh9qMyRDE=
X-Received: by 2002:a05:620a:4107:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c38937c1bcmr2193464385a.2.1768314494861;
        Tue, 13 Jan 2026 06:28:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdjim0AtdFV39wYUK2oZNSJKlSOGQXB3wsnGeW8nI6+rx4ttssUu3p3UZw3cHWQcxqBahbhw==
X-Received: by 2002:a05:620a:4107:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c38937c1bcmr2193460385a.2.1768314494383;
        Tue, 13 Jan 2026 06:28:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a563f73sm2305390866b.61.2026.01.13.06.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:28:13 -0800 (PST)
Message-ID: <14283f23-31cc-4bf8-9762-f0348c30618d@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:28:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574
 support
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        krzk+dt@kernel.org, mturquette@baylibre.com,
        linux-remoteproc@vger.kernel.org
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Jej2q2ZR5r68QinTaxDRcO2nhsKJvxTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyMSBTYWx0ZWRfXzEvTZWmQ+s4e
 ZF2bDQdzySGW4DKFnnwi6XyMG6DfaK43Jvcc1tttwb5qp9Ku4dNeI0Hwz6Skas+NvS6f6Bzom2D
 +LFo0RuD1z6nmOYlV12g4FPEmsFOi6U+oyMyvC5ZvqGY6N1X7+XHhO6U2RFHEYe9jKuk1l1Otwz
 9LnFyXBTldIKalvE+GpTs9Mc3lngsG1B0qMZCEc8jq2aG7jc5UbWZbyf7wSB/9nlFOdvJLhZqzE
 GE4AwjWlQC5+f2yz43ZLV2/izjjXnp4rMjNDCY0zzNRPH+JZWVFzUPygL0k3VB9/gKa1nUAbopN
 BNO761VBEN5dQHNlKAXhbO76nro/+B+0eQjcaSvfXDqw7kQQ1lH7YQYPD+pwf9QFUJin9sBrius
 sEuZgIth3tmLN9FGk2pUHkAt8SQ/UWCzvdXlAVEhjYnqji08XBdS+cTMArF7+QA6v/GlDplJWyf
 4FV3be7c9/31rFLmpug==
X-Authority-Analysis: v=2.4 cv=RMu+3oi+ c=1 sm=1 tr=0 ts=6966567f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9AGPOYKhFRli6DSTmn4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Jej2q2ZR5r68QinTaxDRcO2nhsKJvxTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130121

On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
> driver. This firmware is usually used to run ath11k firmware and enable
> wifi with chips such as QCN5024.
> 
> When submitting v1, I learned that the firmware can also be loaded by
> the trustzone firmware. Since TZ is not shipped with the kernel, it
> makes sense to have the option of a native init sequence, as not all
> devices come with the latest TZ firmware.
> 
> Qualcomm tries to assure us that the TZ firmware will always do the
> right thing (TM), but I am not fully convinced

Why else do you think it's there in the firmware? :(

Konrad

