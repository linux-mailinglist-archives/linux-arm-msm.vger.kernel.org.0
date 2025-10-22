Return-Path: <linux-arm-msm+bounces-78349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA7FBFCC18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 520F5583189
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 14:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7005734B69D;
	Wed, 22 Oct 2025 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBcf4hY6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E046034B695
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145101; cv=none; b=sM9PpLcnocthJoYCkWkeJmTrrbp5WlHV8zK+3XzsyxW2vOz9VagILRgBUO6LV04Tq8GQDGZhG6XK82aJOOu6RyKfcEFMkEE5rgl2a/RSD+Y7zWkY3iZUiiCyV2nyA0f9dqVHvD6AOjljwD8fsszZst1t7E+SARMyn7nw5P1WsZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145101; c=relaxed/simple;
	bh=UA7FZ7E09YCCwNWVXtHh35Tj2Kh2ruJ5zTVls+xKLW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XeMd+kQMQAPQysmMyC6QpRWWjGlZHlp0E7opfC7V063DOTDUTscEm5Dnsn2vltMdF3k1rROBCTcfVsDdIuU4vXSzkfeTYQc1yIVOIK8OWWO9rsnKpmtdJoqKtanRnRsnWJO/5h6uFWwGyXodY49QoRRD+3HXksfvXfn/IRuZSKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBcf4hY6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAcX8C026895
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgqjTbpnFaE0hcBetVMhGWTjxas9QOG0G/pOXwEzoy8=; b=MBcf4hY6zoRatuO7
	WUdbyvvxobU+IwO4Zzc6NvhTr/q7Ny4dXZivEgI+2HrSyvEoWwzTYwxUO6Sw7nOh
	WeIcwG4YvUQdTs/w3YWlHnXxjhjzWHpDyFHYt4P3DiZsyQBUAEUsje3YeOwekmto
	HA/NKOYESvMyqsx4Y1dbX1Wxb/6NQ5rizxKRgWKP1Kk014sKbfcZRegRdS83BBxY
	U1Kb3RMm1Ifb5vfsS8AxsUX/pVhSigNHV4A9oX/NB4nymN/eqAxePU6dE5kCVdRM
	THdBOlV5r0XVoAMNCAN0WUIz4wMTTv3F9EmfkqbewdBCg6xogL8CC3ogJkwDp/et
	A+IDUw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pn97e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:58:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8b86252aaso3893691cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761145098; x=1761749898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgqjTbpnFaE0hcBetVMhGWTjxas9QOG0G/pOXwEzoy8=;
        b=nte5aDViXZZVgvYwbmYU8hOsnsvK9T3vbUwa+8K237fvmY8TEwYSgv5plpzA49T//K
         PNOIAuvJaIL3vGgZSZUgSfp/NMzTbzB9+O5v0MZQmQHhNeKUPOBlQHDJCY2hBwN013xf
         l8figuA9xOWWjOepd5/RXSnFCZhoRYED53VOzHwxVAAAn9OBs8GOh2hFeNIS823nmAhO
         EGLmiwgEKU05apvo/5E0N3M3pLrFFNabbk759JlS+K25PQ0gQOQEielYhhI2y9LwuYtc
         Dck7ej75Hk2O2e2y+ALJjlh0UmWKW0o03Qby5/K4cLpdlUYq71M+6vttytH865RiK49D
         f3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR+gPcrGnFE6xm8YEbRLsJfEtEP/F9MJiw+UUvKDSKzirZAg2+elN4Vw3L/ydvFKFTB8h9EwcdJhVi1DC+@vger.kernel.org
X-Gm-Message-State: AOJu0YxMWoJH8f2/G9QeoNNY/YTFTI+EZf4heHzlw3rBJVj5ndkWsXrS
	eVkqiW9Mzo2H3Vv76W4vnPXmhdwImGTuFOCOFx3eSAY1pS5Bzr1cBtqk6PjCBPqdQD3g0Ro4zi2
	wmGq7S0L7lC3zEs/UokaZWogOSI7sZqeToSbyVJcyM1ZoCiwKNyEpMEpiMZrxzEIeU7xP2k9GJj
	/z
X-Gm-Gg: ASbGncv2wqKti43YPgfk4XP7+ChGWjLTqgSW/mH7n3Qb6fNd3qeoBpMGhkN/Ni2P9EP
	vqFv9KXdtOxXwDaUjPEOl3jWhGMji5m/1jJYaoCUnaUJ+sg193h6qlYbye8dgsMfQPaw99usK4c
	rg81uT6Oz64xE+yF7MPatC43+ndsXf9uY0HMNt1NAKrphaCpTg+5JOEBvswq9slnYD3dBREGNqh
	nW0egJ0z0ormyeZYG5i8XlMWTQlk3V32iRvmn5RW2yAs5eUvtaTwCRxrkqOW/UdJl4MOnuQLxJC
	cZkp2WoDTIUfKKMk30V2uW1lPRJ/S1hliWQ5wQ2saj3gZBUryqQJpeTtXIqxt0C0HMDIvGNAGbU
	3MT6yXIRAT18EkMrk1hG5dCIlKV1RP5CZidJLgO0kI1o4CW1+1H0DsORl
X-Received: by 2002:a05:622a:60d:b0:4e8:9ed2:790f with SMTP id d75a77b69052e-4ea1177d7a5mr58970011cf.10.1761145097769;
        Wed, 22 Oct 2025 07:58:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUR9bnbGHJDmSjsGFP17dQVzXSza6HHoSAKI6AUZ1xGMLyDyNfS6OtKnS3TvxPA0S0TIGYKw==
X-Received: by 2002:a05:622a:60d:b0:4e8:9ed2:790f with SMTP id d75a77b69052e-4ea1177d7a5mr58969651cf.10.1761145097194;
        Wed, 22 Oct 2025 07:58:17 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb035d48sm1350290866b.53.2025.10.22.07.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 07:58:16 -0700 (PDT)
Message-ID: <61c299af-c4f8-47a0-8803-306c08792b17@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 16:58:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] regulator: rpmh-regulator: Fix PMIC5 BOB bypass
 mode handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-1-5c7a8e4df601@oss.qualcomm.com>
 <on4zcfs5qdaekc7teo2iq6vpw7o2mp6yiqjkbznxo7wcxgutj3@nb35f55fkugv>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <on4zcfs5qdaekc7teo2iq6vpw7o2mp6yiqjkbznxo7wcxgutj3@nb35f55fkugv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX0o4zQyh2jxTs
 /hrgmwH6zvpISpqdZfkD5xcHA3KyjFX5APjidqaTqDMvP2F7Rpf8xxCfcDSoZ8fe96AN3fqd9WE
 2AbidopCOS8q8rqbymwmE8hmHyHw9/440bzlpwiEpdDS6lhfTOnmI9cKRYZObS9ONDRrPGRKzKc
 19zGb/R9gA+koUNFvaU1vnXV7SvGbBH9VKq3vVt/Mp4j2KQdCPHWws5c64qG+tSEcQzdQ/KcC0J
 qwzZ/JGV3+0xPzXIBD3kXAXqMzNcwgj14floU9MjmnfwrlG1+Gau5nG/BUl0nQJTPHAx0uur1fN
 vJeN763WVTEBvbFnmEVN+MNHVxqkQOFmYcdI99/5uIGhS1RgNinjcDBF5e+QmlFadjRcS5akD8l
 7vqjlsA3QBPofxQgIZqfQ+3HCwA27g==
X-Proofpoint-GUID: LM0e8pJa74TZZ2nozOPPMJhACelQisJ2
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f8f10a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kCPPLUCfYJNoUqFreaIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: LM0e8pJa74TZZ2nozOPPMJhACelQisJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On 10/22/25 12:23 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 22, 2025 at 02:38:53AM +0530, Kamal Wadhwa wrote:
>> Currently, when `rpmh_regulator_set_mode_bypass()` helper function
>> is called to set bypass mode, it sends PMIC4's BOB bypass mode
>> value for even if its a PMIC5 BOB.
> 
> The universe will end, the Sun will explode and Ragnarök will be upon
> us. Please describe the issue, why sending bypass value is bad.

I think you misread, it sends the magic value which corresponds
to BYPASS, but one that worked for the previous generation

Konrad

