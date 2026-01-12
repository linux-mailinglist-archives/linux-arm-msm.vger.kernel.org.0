Return-Path: <linux-arm-msm+bounces-88513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD1BD11F02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7380D3009682
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE68F2D0601;
	Mon, 12 Jan 2026 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjguIGn3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kdg4QCyn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B812C11D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214224; cv=none; b=svlZ6L7LB1Da0egYxK9UUCzRU+EuF+AeVm9fCwPLk7pPM5L+oOxGQUNXrfrwPZqzxshUKtSs39el8O1qK4BuRoNm8SH2R0EHxIb7+VhJdmlbyq9EO53/vkgu2PqFk7OMniyO4ecEYYae4ZlU2F5svj6EJfalATblXmm2Ivc0ihw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214224; c=relaxed/simple;
	bh=QbgWNSzIoOhG5GoMkMznH/hM2py5f6Wj7h6jS4oFLmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XwkRq8yPmES6u6VGZNr+uu+uPUh4bSj1GdatarEHi4yeWZfDgmtbwCvolIMc4YRsehhzNvrtgSsFuxc2YV7DmMOm7ZSNzZRPZkaig+X+0dneF8IYykwxCHcAsGslop0B9wPG7qOn/TPbkLBnF4lMXb75eQrDW4abNdS8nku0mPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjguIGn3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kdg4QCyn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CA6hNf1380754
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hfVyE9hj389TcKf1IZbtDL33a7k2ZEiOtmVjf86fe6I=; b=TjguIGn3WreHU2Ir
	o1FE4ShcE8WH3AdB0vNY8q3/Da3DZ6GuPr1nOFhm8YMdTKlE2E90hn1fk1YSezzI
	dVTl7//NOf3WTiAqqu6VfjLXzUTVkHBtwaR0/d0K+7lTEF4wNs8yuyYAGkLfRVgO
	9tZaJd6M9Yt3GxRdVJOzP9wyB/O8a5+tByY9n3Nzd3EztbdpHlYrYvDMaQ1XKQAj
	/PQyk3mMsslhhG7WRzrtbqgVVA/AZfz5EjWWqG0nR/kvMSkR02wV13cjuzDpg0zb
	Un85vRTU7+GrNfxqxr2FezvAboztz8BzLM8wgZ1+DAZ7wsgH1Bbudec5lgfnAX+a
	x6Zd6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmxwv02cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:37:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f357ab5757so23027631cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214222; x=1768819022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hfVyE9hj389TcKf1IZbtDL33a7k2ZEiOtmVjf86fe6I=;
        b=Kdg4QCynZ1q7an9RD5DOkmlYOnr9zQq8TQZ0ZJyx2v786o41CfzMTy2iTWnx4wEs72
         RNnd3aWegTd4C4zuHcWyc0JPRf8wSS0r2L4T/e0FhbCn4wHsS7GcYx4MroR9u6sy/luj
         E0jRWLvEY7IzN0O4GJwSmY26+2eop9obySPLZux7ClVG2fBj9rkLEHoN6wSRVE+ZrtHk
         T6eTi32UcQ2nQ+jxQN5WLj2NE2swJNHxfkrXR0sEMn0Y1QCimaHTDJeUsj2Npek875sI
         KYay0cr/kKJOcfQ/Fya5VtG+Lzr/fyR7URAYMkkadUWkoYmBpiyXlZLD9WZOFf+2qRJC
         CCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214222; x=1768819022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfVyE9hj389TcKf1IZbtDL33a7k2ZEiOtmVjf86fe6I=;
        b=QafGdUskFZoNgKer+dnly/NqjVKBBF+oAp5Bv7g9/2lefyvFY27Xca9pSpu6fE4RZv
         f/vuc7aCoUiIVdsxtPwwHglzJ+ZoeAa2geAt3KoXTG0ge7SKvM8xINmKNC7m0k3e3ADO
         taPc47APIaOh1x4w8OdUxgaQxiKm4OkICmpAlKCpoooWcuSfG0qJZn/DFer8hmKOJ/5w
         ZgGkja2f1cxaumNX6ytixPEREHKGtRHVwn7r6MiMnP++Ah3RDkif0qcXmKdEabvE5e5v
         oQk9eK/6MykBt4sjtbvJbhv7WoMck5Spbe2fD/eB2pvwesc/dVzUr9LbsiDJXc6gY48y
         Md1g==
X-Forwarded-Encrypted: i=1; AJvYcCXCbBCZEbaqafgAKFKgl1VuWg9LrrniC2R3wVw8fnZMMjiUJIEdEZ+9CNOdxFGORnFhf/7vbWOCTIslYJrK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0BjELNcF6ZB3/hg5ZORS+6xreX9DVUlXsLrhh3CzJZmmuQLl0
	j8ATMTSVZn4fzFRqokOTxXwS7abkC0QhdfUiWEpu0Ox1+ovsdutZJU9OP85/Q57RgAXxDmNFwFw
	B6DzMkm7j3RCPxPumG5C5qTDk/MLjckU/zGelul+alcx/RD3GjQpuv6ypPPxZ7FAbKEuE
X-Gm-Gg: AY/fxX5uu4noxx3RynVU0vH66jN/OoGGZQXiyroZFcZSULtt9EPhhH1A6yM1ge0M5C0
	+KmafzWoHg+fEZ6kc/lZ4xkUfaRiserx3QsgZAMx2P59fWObPNABnhr7lfbjRzojBAOz7d7U6ee
	orbwwbq8FiiiWBnwn63Lcnj2SkP0ePwE7tJTtJn72f9AYYhCd0JEjGzeXRzItGSz2UpguGJbikJ
	7/EFQWiPK/xxPN2AvGPBdLOwB11/bsH4Bm31XXb6O1BSpM3KYqchTDuGBh3zTSrSa8xN3TzToSU
	0d9aQXUCGmKihxACjOWIo3dzuNGhXk2PhMXUyW604oWGMLZIxTWH/qMHiXiyFnKefKi++t/xKUB
	o3/IeOdAUUinOqe+oimyau/vdwRL3aNdZSnNhZFDGxMg4XonC6PuPXpZWj6yrbQyziOQ=
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ffb487595amr182682751cf.4.1768214221632;
        Mon, 12 Jan 2026 02:37:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwPXJrTbjQzQTcAzWAfSbG7+Ps1FzbEAnhMHNBzRiaoZEtHpgn0LcFOeGeJ2lQqXcP7SdxSg==
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ffb487595amr182682621cf.4.1768214221046;
        Mon, 12 Jan 2026 02:37:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f1e95273sm664311266b.62.2026.01.12.02.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 02:37:00 -0800 (PST)
Message-ID: <534e88a9-6863-4494-a565-859eeae6fc9c@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:36:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 3/4] arm64: dts: qcom: hamoa: Add UFS nodes for
 x1e80100 SoC
To: "Martin K. Petersen" <martin.petersen@oracle.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, taniya.das@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
 <20260106154207.1871487-4-pradeep.pragallapati@oss.qualcomm.com>
 <yq14ior5yey.fsf@ca-mkp.ca.oracle.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <yq14ior5yey.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dzRcE8MpJrFSQ5yahl5Y53E9X8BD2s_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MyBTYWx0ZWRfX1xRamAYdQyx6
 SqxGNZcr6bgoomry642TgGIBnbp0ZUtCow4AtE6Dj1W22ChfwvFGeKlwtzwFX2LL1OtaJqjqGhA
 QkCuMIn3QUJ+kmWGCjsTJbbmjck7dTlTJzgFqSReFtjdXQEArOxJ21kmzEi1KGxVc1hOnq3I/P5
 WpAGlUBAD0bixqCqDHpJVyrjNcEObO2h6mVZK5pZFzG/xu2OGVWqoUrmH0LiKP7AGy3lpPIQqdN
 x7gHS3bI1fVl+ADtkx2CoD1oY+9AEoA+CD2r8sDevhuEtcPaYwqMpVR+TeutC20Ud7V72Zv5BUO
 ozVWVH5qpI7M8qE2rm1KLi30vs8VYs69DLZcpJR2jl8g3xRVPjMbOs18lcK1i1VI2MQn4eEvotS
 rovsSsqTcCTB2t57bNQGNlFE0nHCj048QkkW3U+/SpXSWwomnXeMZGlU68ezChazp6xtRYOYyHH
 W+8mYTjRSTz1PoYNkBA==
X-Proofpoint-ORIG-GUID: dzRcE8MpJrFSQ5yahl5Y53E9X8BD2s_R
X-Authority-Analysis: v=2.4 cv=C/XkCAP+ c=1 sm=1 tr=0 ts=6964cece cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8jcq0VWYKE_BtxzTVVYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120083

On 1/12/26 3:59 AM, Martin K. Petersen wrote:
> 
> Hi Pradeep!
> 
>> Add UFS host controller and PHY nodes for x1e80100 SoC.
> 
> This does not apply to 6.20/scsi-queue. Please rebase, thanks!

We're taking the dts patches through the qcom tree, that's always been
our intention and the default expectation for cross-subsystem merges for
years (we'll take these ones too)

Do contributors for other subarchs only send you the relevant bits (or
do you grab their dt changes too)? Do you have a specific preference
for any of these settings?

Konrad

