Return-Path: <linux-arm-msm+bounces-61896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2497AE2072
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 18:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0B216A0B3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 16:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9714E2E612B;
	Fri, 20 Jun 2025 16:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mL52/1Jg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD018E20
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438509; cv=none; b=XpvM/QHsKO2i1dqiKZGCFSSmU/Ur/8hYrY4QgmR6tvZeG9wnzLUPNGOjmZhHEkIH863r6yk029nfAKH4BajhiC8vI92wXSvI4aaVFRowdJUubU5GblTbWwP4+brIOLbFvqGeqAki2kJxB3Sa5Vbocn7hzySg6JIpHWbMa1LJYFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438509; c=relaxed/simple;
	bh=2PjTMHy5F3iPIngcSswDszD1rmfKQu+pVIhzm5QlxFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+Z5XG2YPTMZSI0X0eHps4yCAV0iiTEHy+kP7ugp33vD7ECH9BO/rSP0apsqKRoRNFytf2foyoEF/eWUoPRkm4sECmMVZNynVK1762LuU/ixJwZxxkb4N1tMUFTS1eDKJz1lYJNOTatNM8KvbRai5E0Lf1xdfqX7w5MP0xLudiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mL52/1Jg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFxGQp005423
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 16:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y2I2QseFJ0gr5gYIqnnWqNCwwaaSonPDD1prW4PD/A4=; b=mL52/1JgJoGggS/i
	4nE0Id8O6uM8LFH1ZMyXi7NeB3vdT6P8lbIFSEnmBwu3rzG4TnYW0rxA1xFxS3+W
	A/Tgk4sn8UFRyQIW5n1uqiNNwDDdajBTWa2ZlgRkISB42kKMQHJ5ABp1jctCXIGQ
	YCyslYKe/DLbQDQqKginB7+66PmR7fFYeEEYjqFvt2uuK+TectPsye++pn+Qq89H
	pREE28Mh/QbYDV6DvduAzzu2dEf1oMN8lpyGHtb1hAol/MKMhteC6rA0/WCCOLM/
	PbJJ4dGYl6lVD6j2NN6fzToXbDNkYYk9QsolwWP2uYfkXWPXr9N+QEwMRSxULpk8
	UAx32w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47darvr4h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 16:55:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb030f541bso4979066d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 09:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750438505; x=1751043305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2I2QseFJ0gr5gYIqnnWqNCwwaaSonPDD1prW4PD/A4=;
        b=Xkl2wvzb0Vvw19tyWoNz1GNOKBLUKKy+ILO0kdjPGa62kjkIrHE/hy1KUhHOFr6dDp
         3lPhUFtM07MVm/YFZLnS/LCXlPcUVF3z2OYzYtNH+FgsmeRfY8gPhsfChGnEiyzOdEuR
         YsGFnXkqUNvQfR7te+acRDZV5GLBM2D5LtFR330YdgUggfPcS/aS0kzgJoBdRgGOENko
         niMTW7FGPfSgQrd6KDzN7Jvs4knBg9PTYGXIicXj4VDmWkYq0O33G0wwcIKwsJtCeFg8
         Ct649X0IUC59SCZ2u1fo4ZtiaTh8BXdlMkMfwjwvC+4ZNZnVFI1W2JzMKB2aH6FDGZDt
         laKQ==
X-Gm-Message-State: AOJu0Yzy11LIblA13F7VOHL3XxuqkVa6l96Az6aabfmC75AgNfuGpfYN
	Yl6Ela1bvcy8jpZbIb/0KZBPWtWGiWhh6WwItvG5DW1x8oIWh3nVaMIPwrFP7ZWg6d/zNgbIYNU
	SmDw8z0M7AlxaBRoUZEXbAxlIDJzM1kSTEJkiu4evyAiACZFA2fn3ZVMe5uH60TlY+nzJ
X-Gm-Gg: ASbGncviwNZLlplIXAMRiiowUdtIWT5URbhMMVW0vkrLCX84ADG1bmEm0IoA/eA15Wd
	OzrVZcgeo7SpbQjV5MzVMV5wH/aetY++/FHS5EFLY90sAq1yzd9XlmFRGWjQhEO/NtvHDUo1p+b
	mYkQ29MrJGQlC8XtGPyhP7g8ocs4afRbh9+Wz/SWovoAcimx5X2jwrm1IrQTAeWRyfFJ7nne6Ln
	cqJlUpNpB42/T/KXweAisfW5+kH9BbuxAqZODfqO/cybEv8SnFffUsZEWeRni2XKoTDwPpSHQ5h
	NUTPotr4G+jWykvY1bJ5lpxz1t6KZG3fedylu3A5gBZT8VXjtVFe1G25E2jyXia5ivw8FyzKGeY
	HWuA=
X-Received: by 2002:a05:620a:1a84:b0:7c0:c42a:707d with SMTP id af79cd13be357-7d3f993a910mr185106585a.15.1750438505159;
        Fri, 20 Jun 2025 09:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzroywSyK0lLak+kmGhL7I4nUbTDl//l0+nE20iSxOE4K84JZ9jklmLuZwJGAH+b1r8H4Iyw==
X-Received: by 2002:a05:620a:1a84:b0:7c0:c42a:707d with SMTP id af79cd13be357-7d3f993a910mr185105185a.15.1750438504725;
        Fri, 20 Jun 2025 09:55:04 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a1857c124sm1603889a12.36.2025.06.20.09.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 09:55:01 -0700 (PDT)
Message-ID: <2864033f-5f1d-4026-9bed-6a79ca917701@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 18:54:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] power: supply: qcom_smbx: allow disabling charging
To: Casey Connolly <casey.connolly@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-hardening@vger.kernel.org
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-5-ac5dec51b6e1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250619-smb2-smb5-support-v1-5-ac5dec51b6e1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dTYZLx-OTq5dt9GiTpzVbZAv_R_oEe38
X-Proofpoint-GUID: dTYZLx-OTq5dt9GiTpzVbZAv_R_oEe38
X-Authority-Analysis: v=2.4 cv=YrgPR5YX c=1 sm=1 tr=0 ts=6855926a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XZI00cIVyT1STSWTZ2QA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExOSBTYWx0ZWRfX+2V8UOsGFcx1
 pppaCn2ZQxhUikJ+iwogfEevjGsFmAkp2kFgKJnDBvmqN2ZSBZqKiS5RNnwBWgsWqO4QhpIaSKC
 aIgpwSEmVJTsocLDKG+qx83R0d93KL8J0okb60T3x2q0yjE16q9Dh95oI+63DF3D/J5Ehf6w15B
 NqsVKa44UMCvzse2moQiai8WXX+r76DOgZ2kZEKDK728meL/G/1yerqFDsLTIDAnq+Ywp+UsqFf
 4benTfjOkZJWGOuxQjDShrfNEGokVuEXMLA1U0iQ2mbsuICDPiUcktf7LDF5tgp2VDZ7PNtdXSk
 ZgpWmLlrB58FnW5GUdG0fpGyavsnUWy6ATq9JVXjzFgOjN7Yo/vPrFo1TsSnVzv3H2dLwCQtWto
 JllnbqZiWC/kjNR/ihpmduKQtjvnvp/8rQXQHpge76ruBC/OEIk6KSMMncGWnX/nbdwURx2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=801 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200119

On 6/19/25 4:55 PM, Casey Connolly wrote:
> Hook up USBIN_CMD_IL so that writing "0" to the status register will
> disable charging, this is useful to let users limit charging
> automatically.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

