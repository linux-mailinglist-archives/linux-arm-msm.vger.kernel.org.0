Return-Path: <linux-arm-msm+bounces-68012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9576B1D849
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 14:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 987AE583270
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 12:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1A7254B1B;
	Thu,  7 Aug 2025 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oibpcH2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB51252287
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 12:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754571202; cv=none; b=mnOUjnBdybt7KAXxXQKERqG15VGYW3bHiF7toxi/Bd8NU0etYC/IK+wqZTBSxxEs318wvCFea6QnUP2EXeW/jJQP1NQRiAlhN7GDhup8gLDXxMzTZmQT7bkm8hz+NDY/kub9B0dHfTGQ3w+XDjMiCzzu2NCt+A9tl9pEiah2oDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754571202; c=relaxed/simple;
	bh=GnP7q9QS7PYmZnYRIwEV7jCYPkQp9Tbz9TTFQNPo9p4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jeccrlY0/qaoSCGGRv90VAqvosmFzDeUNaNBpev4r7HP1HyJwRlBWR7I9hLwOZbcpU0x8cBDy+sEd71AksTrQvOXrdtKtK9CO0JadUv4HvrRZPcruFpLEsEkLFBwZ85km254yDKRwVZ+3Mig8BzHhwmT0qvJWepMAmgtflUummk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oibpcH2A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779CvOL007842
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 12:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXbBrsAVWEUto+2EQni7MAiMKvsV9MQuSffRI/E60ws=; b=oibpcH2ADyMlCBjX
	9iP57ZSxmSoHzWRIfFMoTD5j3aMxAc84g599PE8Dasua7yWxJ42d+6tSFWFAWU2o
	wzBRQK39vIzY9BCyzCLwcnGkh/cYn9Tc0Z6VL7fvFlhCMTc03Jzt1Na1j4ym3i16
	iXp/VhpQyLDDkF/QlSbCWH2ntBZic0NtqyOZYUFDR+r4khyLQv8dAKxRsiuez6Pi
	4UIl83fOUVZ4drulwDPVesIzGHGMQRBZFn1uO1Cim7r9fSSSI/jljS3mc4JPSOvs
	QqwITLwf71RGz4DxrhB5IiQZxLpcRRLLE8t9L5KfUdLj1J0IJgkXutIG9KAWkJRL
	ht6sVA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6xaab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 12:53:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b06ad8dadeso2386621cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 05:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754571199; x=1755175999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXbBrsAVWEUto+2EQni7MAiMKvsV9MQuSffRI/E60ws=;
        b=uvY9vObS5qa6267S+4UGiDre2rvnT032bfLkRxXAOxrUCBOP/Rwq93XjgPfPFttsdo
         u3QkgW3UePkP/NZbrkAqtw/YrataQvl+AXYoZYeCrktyX10oNh1IFjWm+UJS7odd3S1A
         UTS58N9mv2WIPD0mpv+Mt0rJVAulTZCQ4BQqpL6JarHSH4JSTHztwFvVnvRSObF+3X4d
         4uclLZjKMlL+8ud32ndrMHldc6uH13KqLyCJHzvnGiV6aWCgx/jXbU8if0tHSk3qwUcs
         nSA+z4wSmB/EUehK8wL0C7PAco8Xlyb8ZFLH/DC5ZZnYIalRVF4aWsXJlTiWTUwxfrby
         PtpA==
X-Gm-Message-State: AOJu0YznVVbazmaQqj5CFGdxyVRCAzC+v8htDwWTJ29ykYCWDNKkwCDx
	MVr1aqU/aDrwPJzHiU2MkUnqAsB3Ibl/QLHJCWgx0p5gx45m2fK78gBsIE4pC84SzSdkHUOFZgx
	BG+vpEjG5KLdt2vfmQdvnMMUjy10ArbGteuaEaUkTolcWqwghE3cq4YkVEyE+FBi8jxXC0tNrbB
	/6
X-Gm-Gg: ASbGnctoIRCAnSoH0cp1gHNSXfYpOEE0cBfj/f0im8hXq0Hu9E9eoDkZkzlgHYBRXxa
	NYKZbBaWsCEtfpVgxeWFbhOsf7IqYuuBekY9plInuodeCLsLnCsX2XWViM1+skEw0BtZ1n68oKz
	/U/J4YRbIwaZbM49ap0PmO08HUJRxdBCKf9EJPx7mBO8oxMZ17Z3ycWIvz/pJCQU7BIjWAziaUy
	krcoG/FOcupoHa2+tr9QHpAMBXtDBAKTXnrXQQbG0VzzwoUdGLZX7VAIbnbDbzsoDQSYKXon24G
	AUOf18YFyntGnT65qw0II7s1C1PcxpuFEvT/ZB9u6zjvqqaUslxJHPECflBCj5BZVuh9b69QVYw
	lvh0vzYGIaIX/XNxflQ==
X-Received: by 2002:ac8:7f89:0:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4b0913afaffmr46123621cf.6.1754571198945;
        Thu, 07 Aug 2025 05:53:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjQb/F3Dpx5m3xJ/1/7FQiIn6sY7lvvbOUgnmMTP1/s0ChpRZyk3AJpceI/KbTkc5i5SrlQA==
X-Received: by 2002:ac8:7f89:0:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4b0913afaffmr46123471cf.6.1754571198465;
        Thu, 07 Aug 2025 05:53:18 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0def2esm1276255566b.61.2025.08.07.05.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 05:53:18 -0700 (PDT)
Message-ID: <f5090a1a-64a8-4a42-af6f-36937b4ad51e@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 14:53:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: scm: preserve assign_mem() error return
 value
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250807124451.2623019-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250807124451.2623019-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SrmzsVcvVOtLqeAeCUrkmC6y7hZmoHMX
X-Proofpoint-GUID: SrmzsVcvVOtLqeAeCUrkmC6y7hZmoHMX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXwfrBDAwwpU76
 Gon+/IVpvGAthlgmofvvlUzx1dEiM4fW7fS1kHzZELVWJfdKEpe3o1Avq0abQrLJro79UFf/FT+
 P8/uF3shJ2AbtBQlXYfTb454wYE4HKbKpDgB23C2J5VZ778GufbC63yCM/WwrEsKo1smb12//l7
 itHYualfKiV86uabaLJUhHJRYqx/nAz0d3LSmXge9EpilSA8bpuf6qFvEeOB8cEmp6VYSMTYkr+
 lPPiKmFV+25nYL6/h2f73Kf76dd/pVNA64H0utkDfTEeiCK4Do8M99t4Qt3Q8Xq40MYp2Ek3J3t
 D5wRpwO15w0z1ZbcIAy73SNLHJMW+sQ1YdG/4PTDJhckUccJPlWTokL9i7JpxzX0UPF1F225H3a
 2KyjpYZn
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=6894a1c0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=_VHsfAAm7Tyy6ljEudgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/7/25 2:44 PM, Mukesh Ojha wrote:
> When qcom_scm_assign_mem() fails, the error value is currently being
> overwritten after it is logged, resulting in the loss of the original
> error code. Fix this by retaining and returning the original error value
> as intended.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

