Return-Path: <linux-arm-msm+bounces-63526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81D7AF748A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F28454E5D27
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 12:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55C72E6D23;
	Thu,  3 Jul 2025 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hdD0oNuL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6933E2E3B07
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 12:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546884; cv=none; b=fOB275M0jHoKOzbBiojUO4I40rMe31OJlRiNxZZepmvs20tLIt5fOzxY4WVg49vpBx6Mx39e4tIgDeAEklVKg/oTFzGlN0S7rTKAPmKiC2dd8/n+BrMlGTzANLsJREecb3CNXlOWVwA/rsRDEi5H3QivlKRB9L2OFPENxDL0Yuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546884; c=relaxed/simple;
	bh=BYSgqPMWSqws0dE3RECbmqxtjHxktPw8T34WNBTAzO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DsUDcWW87gQUYxrSufqrUqVanlC9AzA2mWNNVbgpEyZEsnsm4MlpsOAcaJdPtwrugL7RVzkADZ59b4x2f4n6FkZ3RiIv9+DyfWnxIYDIBv+8/JA0Q0a4PmZZLWZwSzwmmCqH63ekQbJI0wZR0Fl0B/lqLNtLjrbBnKIGcwturwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hdD0oNuL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56366GIr007174
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 12:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+aS6ZTI1Pe+36r1Nb/3WOL9JZ9jQNaAFbIEsCvpPlk=; b=hdD0oNuLPyQbHKad
	+NvDp7dVxLQGLwkvTnL2MolY4D5Jy4R/IahhfhFsyWCNgJoYOvTcZKfaP8A+jD5x
	Y6HveFvbSMt0/hLooQyvcD/tAuxGkKhguO5hB9rDVWYIRZ2EuvS0UGi7Ma3FWp8P
	85wbcR9bvD5HB+TPn8zrrwMBlin4OJz1PyMUZES6Cr4SDmuYRbtGUWzBIQYFBiwA
	yrGdMJKpmoTuuFx8AwVcwKyFKTZyPkxBqOgdfC1er80CC5AkfekrB2tNue6BJ+4j
	sswuB7ulTGyL7Gy4Q5EyLBcLtoqx3HDA25MrK5XWFQNbN6FllqzgShnRORfiH95G
	obEmGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47napw2qfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 12:48:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d440beeb17so86541985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 05:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546881; x=1752151681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+aS6ZTI1Pe+36r1Nb/3WOL9JZ9jQNaAFbIEsCvpPlk=;
        b=P2Q03cG6YG0s05T1PAT8jgsN3nYOh6iR5GIgHYW6OkIsogFHl4NIOFBh4QXLZnBZ2Y
         UBPcmlMBsguOBUVpFYRGiG5X8FhG8jWgPmXgeFuBrM+uaU9wbp85ItaZH6I4gQK0Ne20
         Y2w+NtCxGo6+/seLpRyo9e90a8sbH7qWpvhrohGiUhL+DLKuSbT2J14fGLRcKZ2eCE8N
         XUwlXWPQiTum5KL+XKjOMcvz0pSxtkD7OuYretXEuKJdpEggTTxczrlvn8j6fk8/yPfq
         iiYfI+KKarTditlBlTXOjD/WPZP2Jev0drkulc0jLyz5Qie0bHe4zWXG5qpwB53YgRUI
         i6DA==
X-Gm-Message-State: AOJu0Yyr0QSUWygrJ0dmghtFdzGgd9KF4gf4uX2d5v/n3xqYyZdTMAWB
	RfGo86LbHM/LPJtGsW/tgBbR7za3F3mk6C8/q9SjiIwBLmMhodKnV5uj+7OU3jXxVxRCmwKxwFG
	TObvfeOVJAx28rarY3QRe6WD4ShmzR7GJHKkttLcs/8BkczMk9puCS4zAxr0rNhWxIsAQU6mLCg
	qH
X-Gm-Gg: ASbGncvm0epd0QoaQrYezGSXqzUQv+CSVmtWHiL6FQFbKEWI/4KvMbKACDjEAL7oYuy
	G/Q7KmxMyH+mqyzMGWUbxpivIfx4QJX69+ITdFc8OoGeH0w1ZrfETQRo+FzYzno+8AgpNwuqXIV
	OJhuVv6PkfAnuqYoZAYRxs8hu+DCwKrR6lF+NQVX79PwVQEGMay0/CwcJ+eeskh+60uUWa5elRO
	xNPRq2yDY8taHdnVRWcZQ7E6FFS+X87CHgD68spqzIsa0ekursNHzcgfdt77CZXFxVU0ONrGS3H
	j6KW172GGGS5q+8LbirucihS72UDs1B/bQ1VRz5KATshlKV73WpZS3SjsHo2qe0Cc4PCGX46paY
	cFh8vOw9i
X-Received: by 2002:a05:620a:31a8:b0:7d4:4372:c4aa with SMTP id af79cd13be357-7d5c4735193mr412021485a.8.1751546880890;
        Thu, 03 Jul 2025 05:48:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0/eK/DxumW8pE3KvS0NJ2lDX/WeN9meK7j1zTOfG3RdMslCa3fSmCPgMrEa9zMAGA9A5MhQ==
X-Received: by 2002:a05:620a:31a8:b0:7d4:4372:c4aa with SMTP id af79cd13be357-7d5c4735193mr412012185a.8.1751546878497;
        Thu, 03 Jul 2025 05:47:58 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae362cbf19asm1158218266b.128.2025.07.03.05.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:47:57 -0700 (PDT)
Message-ID: <e6227bbe-3949-4bbb-b01c-9ac97abcd91b@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 14:47:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/3] arm64: dts: qcom: Add eMMC support for qcs8300
To: Sayali Lokhande <quic_sayalil@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc-owner@vger.kernel.org
References: <20250702085927.10370-1-quic_sayalil@quicinc.com>
 <20250702085927.10370-3-quic_sayalil@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702085927.10370-3-quic_sayalil@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIKmmPZb c=1 sm=1 tr=0 ts=68667c02 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=MtGlpxXrABCotuZjxh4A:9 a=QEXdDO2ut3YA:10 a=I8LdOwYyl7IA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwNCBTYWx0ZWRfX+QjkpO0kj7NH
 lXVuEQ96sR6bx6UcGii5Lbj55nCl8PIRBVUKDim8zY3Es+4ze42nDQbE4GPNJLHsD9YrNgPYJSI
 9CNXr0o7atoELnbiu7mWLuo6U6zMq6aNlDyJDCwATFs6ESCxq+huahEsw/w5l47dI4+PISKhGfu
 DCIzsb17SKCeqq2ZysUXRucLQLtC14M/i/ArNUKiVmTRk0RDA9xMaxPEv86o6Oy6LWyBU0C0DDY
 Rv8+aAKvJAu9DHqxf56z5ckELTyfgOD+Un9p0r37Il+g9aUyCDQpZfsVOKvXoyMZQ09NJtH+zE2
 G5hMrlwFrA5mzDxDHVTxgIk97sLQ6c/v/4RlL3PkdTgMd6J2LLPvlqkuUPRgsS1Q2W3wBv/5SyR
 RVl37z1oNI3g+D/LRG2ubehqq2UbFNrNHX3bnqJxIke96ws1OGIbOjuK7M5zFqj/iocIybiH
X-Proofpoint-GUID: 4EQwjS47_0bWCisJmjDtsbhvZWaTAXZN
X-Proofpoint-ORIG-GUID: 4EQwjS47_0bWCisJmjDtsbhvZWaTAXZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=749 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030104



On 02-Jul-25 10:59, Sayali Lokhande wrote:
> Add eMMC support for qcs8300 board.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

