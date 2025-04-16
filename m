Return-Path: <linux-arm-msm+bounces-54525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBF9A9072D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 17:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0D263BB56C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 15:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6221FC114;
	Wed, 16 Apr 2025 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKEN7RTJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF5C1FBEBE
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 15:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815718; cv=none; b=SftGPfxTCwvu57o/z8lDuy7bP2ZYc+qgp8o4jB7PEWomPsBrX8TOnWpVteGzpMut8BK28B5PxbiWVETO17XNkIufFt0jGlbOejs72Nr+4jbrc8s0r4pOF8g2TvxNW7mnLsOmw4kyKZqrn8u8gpM+qZsnoL2bYMe7XecvIonCj9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815718; c=relaxed/simple;
	bh=q+pwn+mTg05s/EzUlLJnkTpgVmwJvA1ZdeBL481JB0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rNFOl5ulWP+crjCFwsPDPNnWiUe2kaHmuTbdcrSC8LnaKOWUP9aumbpgRAVsrYReCBYVvoHhMSVdy+1xiwH5g0yAZk3y9XUZPkrwM/JLB+sG6r10vaTW8CMrbZ+Qx0oZ+xNrWX6c3lEKnpvPKAWY7dlAm5rG0jCktoDdSDlU1FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKEN7RTJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mEkS007060
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 15:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OFYziKxJG8xVp8i/T0EL0nwln/WDTU0Zw36EWWYoZO4=; b=DKEN7RTJjU9VBohb
	anNsJDKr7ZDtUfG6uNu/AeBNJWGyFJPY5IhYhEiOiTXEAC9nw3p3gqeeyDr76b0W
	sN1vX86hjGt6GigKL4hpPMzMB+HFvnM/yDydln81AFW0JOowo3sGQjjpLJgV4oNV
	dSCDnL4U9RM/VAn+NXsDnw4DcKVZnnOTJvq6d/TOMGJoABXFOT8ERg9OGpASGmBW
	tq0jHEqGau+v9N/J7vU1DAUWcTV26HaVl6MaWkNO+7/ZnzSV7m6LGhKQlhR3uGGp
	2yhlV+EgVoKOY1i4Bj3Z1Lpz6Yt92XRJNV/l6n5kHjjd2s8C+42R3STnIwsTKmRh
	GFX6VQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6ky8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 15:01:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0c76e490cso13441536d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 08:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815714; x=1745420514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFYziKxJG8xVp8i/T0EL0nwln/WDTU0Zw36EWWYoZO4=;
        b=Grd2B29LZjMW4rP6iZ4W43ptZViZj2sZsYtf1X8eS+lWLMWQtBjzOkHtTiLCIKo2Sz
         uG6cpa7CVftl7FqAV20e3CgScNrMHavUlfA5AWKqT1iuZfVCD9b2Glz7Xkt8C/ex/ilA
         9JiDWJRm/jpS8vhIhCj+MexraLy1kVqRtWXUiVidTvokHXT+SvoQE/WtyXo48kYuJbzS
         t+rDFPbZwlsF3iBumBkgvU4QGAPxzaNvFUFT0pqf8MC7uloBjxDEFgwU+yrtoBiHhkJn
         vglppWtNwbaj4yegIFUKP0iH73i8Z3mz7VKCC3hI4IWbZV+UHQ4E3q8LdMDElAQ8kD+c
         a/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCuBs91ZNQrHteHum0NzNDtQlWt1gSnNJcqNbAqAEbnq8pfix19Evg6yh02I/3y5umXPd2UgIc5alTJJAN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo68bMZsEyVnJy49+oP1bLWoAfX4IWTaAaGVnGBHabixLIgCEQ
	PxDd0zNxw7ujxF6ZnRI6TViR1zB8oUSTBzQgE7B+Bke8S/YwKRCsDuJZW93JaCTIH3nKsnQCsmV
	mB6dS1gKk4h+ZLa2mk0xxz2pPyQfRIhfMAFiGumKZ2st3aG5BwK6983Mz7kXtof5I
X-Gm-Gg: ASbGncsIaV9qWJ/yLSYYa8ylfKXD6vq7Dgbbu7JHVXiQzLEA6O4mHs2JftxUagR5qYA
	D8Y8UDkEUwczBy+pQhlhwKJbDUprAVI8cG7KZlu2P+q437ZA3ru5Nx7FsRsJ4qVXShYE09LuiNN
	BYkSEyn7J/SlJOU19TtSlD0v0UezXStqaogWVFaNvrf2rr8Oq+reL2RRtee5gaZaR1HrDGibdaL
	XQfmEp0als9YWOXqiczxWvRwiiWwDBSf/lTLULik+SyMdKF9gzqGeB1fsbYkeRvxe+PYzSaAEh7
	WDYu5WYWmdYafKHn023mEyiZfld5I2fE2PNlU+Uk6vac7qzTO1V0YB8k+KZogPAVOLs=
X-Received: by 2002:a05:6214:2386:b0:6e8:9f7e:8116 with SMTP id 6a1803df08f44-6f2b2f5707dmr12167616d6.5.1744815714460;
        Wed, 16 Apr 2025 08:01:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELlRZxT4JGjUFMDcyO4UGKfpFEuuZ1EimZ1MIk+XizDS3GTqyqLgfM+L0mkHYpw7kfYzTbdA==
X-Received: by 2002:a05:6214:2386:b0:6e8:9f7e:8116 with SMTP id 6a1803df08f44-6f2b2f5707dmr12167276d6.5.1744815713910;
        Wed, 16 Apr 2025 08:01:53 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd6257bsm143250266b.13.2025.04.16.08.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 08:01:53 -0700 (PDT)
Message-ID: <9f09d4db-b586-4a9f-b15c-6cc2a8af2934@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 17:01:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: ipq5424: Add PCIe PHYs and
 controller nodes
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250416122538.2953658-1-quic_mmanikan@quicinc.com>
 <20250416122538.2953658-2-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250416122538.2953658-2-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fwmgLzT1BaFE-NdnbGw6WGNfRx-DJ_SE
X-Proofpoint-GUID: fwmgLzT1BaFE-NdnbGw6WGNfRx-DJ_SE
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67ffc663 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=wBC3ykCyNm9gZvjdBcsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=946 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160123

On 4/16/25 2:25 PM, Manikanta Mylavarapu wrote:
> Add PCIe0, PCIe1, PCIe2, PCIe3 (and corresponding PHY) devices
> found on IPQ5424 platform. The PCIe0 & PCIe1 are 1-lane Gen3
> host whereas PCIe2 & PCIe3 are 2-lane Gen3 host.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

