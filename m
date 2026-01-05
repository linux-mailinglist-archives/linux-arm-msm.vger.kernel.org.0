Return-Path: <linux-arm-msm+bounces-87357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F10EFCF190D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 02:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEBD23007EDB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 01:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A27C2C15B5;
	Mon,  5 Jan 2026 01:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/ae0Uv5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRELJ1ST"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F431917FB
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 01:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767576902; cv=none; b=KkxYEv8DsmLZXnVUuLADEwBq4LTccEKctFxB8Crt7FYChWx5HeIdhZmXylu/MbiJAGcjFIPCYesf3uiyHDxRQBL2kHlt8eCHH/PuWfd/hQnVvyg8WPZXPTnguARzvMuj14zc5AwHRLadBocADuOv4O4SL03z94S/ARtbSfnN8p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767576902; c=relaxed/simple;
	bh=hTCCLMc8hEMqdamm1Emrq7NemtMHweKO10+KLPnBarc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNkXpxg/HoirEuzyyWfVBt9SKrPtKkA+NZ3hl0Qsf2zOMH5JnvkkGS8OuSahgvQkeYcv19U8YzgybYi6Efu+XVYsOos8bk/q/YFGYCT4jy8hWi4x5tNXXxZlTREVh77Oqf0bwGfsMpUSWOP4aHPu/h870FIP6hI65eQ3rkD2OHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/ae0Uv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRELJ1ST; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604KpE3h3205920
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 01:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+M+ybNxvSNDjtG3n5APnX1dA1AFl2E1EJpnoSSJW4f8=; b=g/ae0Uv54kb6OSiS
	he4HnoD2xmZjP7UMabxBDrez3ke23a/Q3DXZzJ1Klmb/THfnvxzsfR+wHVO1kwms
	2bBOCUYPtXDlySex/0OgC/CFtqc81DxUsqG8FcSVIulRAl5z7eMHV1pEJjJlGFcF
	HRODtN3AaYo3uoNC8Pr9QdDeiM2HjplsFPYv5yE5W6nfq08H3aazC/Lx+Ryfu9sr
	tYS7PLfdJOf/GUHqr1Aqi7K8TdfghQyW1a5okWb/0ZivCkwmXC0Kl8I1WhCYnogO
	cupXR4/oBxn6M8E2DD4kSqB36P4CNsGDO23sQFcfEfmEh449/ecrSZHc9J5BtU+D
	i4BQEg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beywdjfae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 01:34:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f1f79d6afso190184755ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 17:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767576899; x=1768181699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+M+ybNxvSNDjtG3n5APnX1dA1AFl2E1EJpnoSSJW4f8=;
        b=hRELJ1SThIhHL7vKZIxQfn7TSDD1meKPoFPBBjOSLq6SdEXgDgAtaREBiZt0Eof0QN
         CJNFF9ZTDn11WQVm0QgGqS5Vgqkn8K6jIG5z7EkfqqU2Xge4HgetVmw/1yCwgrJD7oqy
         8MN/Bf1FUkPYw9uk2ILtLarEkJKn5XBF+5nzT+FNZiCMtnbeX3vF3J1tk4ngCWAPDoUh
         yqjkXCNYyCx/Pgkz5MSoWMjKj5SWaD/lFcyQGSLpL/SuSZj3Jt4JmAV2wwr1H59AIxRq
         V3r7RdJew6GSUMOVYVudOD0eyof3BUzg1i6v5xJ8FfPX5eufa1E8ANY/2NocfZYWBJN/
         x4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767576899; x=1768181699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+M+ybNxvSNDjtG3n5APnX1dA1AFl2E1EJpnoSSJW4f8=;
        b=KGwgzl4XpFNYUxOm/MpZdjCMBPtoSCokZ18GILJrkX1OCBHphNFbQMiWd6R0JRwZyF
         9JqxRaJVCojXzOanyXX8A5OQHb5F0jUolCu7On8icVXZkTUcZMYBou5awe4ClnIr5oSD
         SEZjreStMaQSj1U39ZqtsR6p+vYqSYyRMX5IoE0kWHCZqaQmZfNcKd46qVs6qnd6e5WZ
         HeCSQTvdUdegPIkoZWUoZr6vap7XrpswgZwrPgfYgUK4UZ9r+pFsJBUM5biqgcsvPHxr
         SSvANW4qkeomreXKJfTx4kchYkmSm7CCW4BWtos2Lb6fTt31ylaBHo67GobLDn6yJN8D
         mjnA==
X-Gm-Message-State: AOJu0Yx83qlfokNJv52TeSnzCP+1plammf4uYlV96/ln4JIZ91WGntUZ
	xq2wgeb0gZ1/jfEVfAANS8TOSlEmrsXsC1bIFFwfz4mlZBu5ploxZwLLA8iIdhfc3CLt0OSFKZD
	w1v3HU527TMJi1Wd6Dmh/eZ4nW+ZRwOgVNtexxjUc5CzN07mQAwEuRYomnjhKsukpCIzM
X-Gm-Gg: AY/fxX7nOCTZ9Seb+OyBA4gGVbqnGRvokW5n78f5C8LLqsqlf+Z/reFZ+5LCfXqjxQa
	uoBXU0uA2/a/NXUcxUYbGQEeHVE95mOzwAo4rRTTVgap9UIrpTZcAnlaPygUlf4r2gHcpU5f+kU
	v0q0jEzBlVDs+WevKK8UmGzbBtYIW1ODVKCPGAXeCIIVdeZ5awI8IfKKSagJwlEXIMrRS715t9N
	ggo/3M+bCeufcqhZBtf1/josxkOsw9QsDKJFLxEoToIlI0gXJgKsZydiRFYEHCKJ5tIqTmN/LlL
	oUmQXnb8FyKAoz4wf+nUzRpsk743LNKX9bdOgxGrPv0yjeshdW/ijsZVePKXyDomxLgAPEstDvh
	ikSKOLdzuPGqrTWlTyT2qoA1WukFoQfNSFLPHJkXS3tQpBPKaUrefX6opjYS6DPkiBiy3RtuTo4
	I=
X-Received: by 2002:a17:903:388d:b0:2a3:bf5f:926d with SMTP id d9443c01a7336-2a3bf5f9334mr63227475ad.24.1767576899178;
        Sun, 04 Jan 2026 17:34:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAClqZ81rnSnWqMwPdpMel/vCPhsQjOohvj6n1Ohyr9fVWD/0RiYfe/Nv6Pf9/l9hQkHh5zA==
X-Received: by 2002:a17:903:388d:b0:2a3:bf5f:926d with SMTP id d9443c01a7336-2a3bf5f9334mr63227195ad.24.1767576898699;
        Sun, 04 Jan 2026 17:34:58 -0800 (PST)
Received: from [10.133.33.149] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d658sm429166705ad.78.2026.01.04.17.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 17:34:58 -0800 (PST)
Message-ID: <b949779e-5b9b-45a8-a505-03168afc057c@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 09:34:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251230-add-coresight-nodes-for-glymur-v1-1-103b6d24f1ca@oss.qualcomm.com>
 <785daa0f-c9e7-4e6d-8140-dd16afdf2674@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <785daa0f-c9e7-4e6d-8140-dd16afdf2674@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=695b1543 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=A_mDladIzN_DhwBweF8A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDAxMiBTYWx0ZWRfX5KVcJRV3rERz
 Xdgt7PkGMXDVfqO65VJP6L2I50N4MzOOKEsY5TQhGnFZV3/gT5In0tLeYwvelsuggezzXTyZ52Y
 hJgmBEKkOfF1xRcVTi05iaam+4U02MJA4YT4po+dW5OBlVnwFyUy3LirjVP8mOoLZ/pDgwxDz6e
 /JFZQFwiwdL3PPefE6whaNNiFYCrHsDN/o67DgkvfvcyfNAIXQVQBWdywAns39bgVfEnTwz3Ocz
 RKBALQlNpQrA8Vc+/WI4BkTzCe8A0L1vfvumGGppH/deVZSELjSgtf5C/IOiVte9Dtxw9jqgPhq
 L+ulnqWYerZVVPOqHYfIV9PyZ7DKoGBM9hnDg6RFlEkxnsuykn67EBM77Ykem5pWARzzKk04d/+
 QDxGqXRTSQS5BD1RBPAWix2tz7dTa05pT/vdwEa1Vhr1vbhYFp4TrGbWx7Ta0L8HB5xaBF4bviR
 dtEk6GB0vEQEzKem9Vw==
X-Proofpoint-GUID: isKFCqMsFlubiqfHFJDCSlwlz2kQuVe-
X-Proofpoint-ORIG-GUID: isKFCqMsFlubiqfHFJDCSlwlz2kQuVe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050012



On 1/2/2026 8:20 PM, Konrad Dybcio wrote:
> On 12/30/25 3:10 AM, Jie Gan wrote:
>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> 0x1121f000 - 0x1121f000 seem to have different/wrong names
> 
> Otherwise lgtm
> 
> Please try to convince git to output a less messy patch

Thanks for checking, will fix it.

Thanks,
Jie

> 
> Konrad


