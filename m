Return-Path: <linux-arm-msm+bounces-57268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B0AAFCE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF4824C063A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C864B1E5E;
	Thu,  8 May 2025 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJ+vvhv5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C652222D9
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714431; cv=none; b=n3KRc96lj6mQ+pgXzix/KjMYn302Bh19qviEqXE5ZvWRbCZt5an1iHKAj8bA0isBAFjESr6PphqHvlFMAVwgTe+I7bGUq8o7ZO66C+qaHVjvEP39gWCXxgEYMVeFw/8F+Y58GuhyxeDqLUW6RbdPSlL7JwLL1dhJOJVVtbchahU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714431; c=relaxed/simple;
	bh=zkds43o5L5B/f6HNVac68bbzTS3DCgZhRIDrIzr3LLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olTGOogASg3b3AVsmBcpUT+YweUOk/I/rRuUEs0Nhk0QEui/hiyul/dh0oQM6TNc1yKXM7OSwfwetKzaBx6veW14qhcaJsE2MBOprDQ8m/YhykGOtpuxS4udmYcCeGA6uXVrHqSEjjT0ZQ4SAgGTOL4Y0dnVOHcS1Roxn1U04+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJ+vvhv5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Cx8TG008510
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 14:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Mep7YcpH9mzwrz4fqg9kB+zrqpI2pfxnFBXIq+LfRk=; b=YJ+vvhv5wxf0zoE+
	FRCfleAoKhwz/ZkxHGa7gIFdg+hImF8d+4z4jqa58MSCjADTch7h5e7j6kcO53CA
	+u1Z7UIt/pzYSvriICYPyOvGLh0SE2qPFXwMyBl5y2wmW8D8ht2IixG2yIXQBjNe
	7TSTZelW0DKwGJkTfF7NHntZZudKkmoQV6Ts8lsJrFXSw+IiLHLjHFtafjPAZ+7z
	U7qsVYO5xaDHf/pODUmle7MKIrCFNIzLYqufBDYav66HZwewUr5gWLMDphuS1LuP
	Qrij5s3zu5Z3thxgI9Tof8rRNJolzGcYyO0Qtw6mG0RMMEDkisgNLm8pd7slh8LD
	Hbnq0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp59krp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 14:27:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5466ca3e9so25289885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 07:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714428; x=1747319228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Mep7YcpH9mzwrz4fqg9kB+zrqpI2pfxnFBXIq+LfRk=;
        b=tc8lKWlLCjWU/sEV0+6PBZUEASwN+4SW8pEKeiRM4g/n1t58SHRidxZjWaOnUrj1sd
         wT6gjI1TlHbPrGyt2GOwdC5K1tAkfVuRiPw+77bfKMhcUki1RSVIYdvSFR/N0WHPdXzJ
         OZv7RlWaDSJQSVd2Z8zKNdCvvvYy03JKV+dMrPa7gyW+ShArpRTBQ7+JWlU8ZWzryZjY
         Hjli+hPH9a9j5Cen6QeqR6+ufp5xW63HTB4b6LjAScSjx6gvQq3+R6lQMNkXkQZjStNg
         b2RQn8yrEqV3J0uSPxS6vENLxDQQPT/aRcTwxYgVZLCPLKVWZEF6RVCs64ZI6IdlX+7x
         CyzA==
X-Gm-Message-State: AOJu0YyZNCzpTw34KxGreePwEU3S6vfTUZxo3RlIFMBymhpcQY5YLcP7
	85prJFImcKEwkeRDE9/k8PZAy3b7ipkWSdfCVtpf4sZxd+Rc8rKDlnPf7LqN7JzK+4PL764L9aR
	LGe9sU097g7m34NNTZ2zTqoSg+/1nUO0vFC3l4Ri4esHUTtaAaWdQdxF+nGhnWjl8
X-Gm-Gg: ASbGncuNxCD95QoTTpMD0oEUF9M3vjxNCpP+ei6F1n46pfnKI83doZi+SuWxUyfTa8m
	HG7MCnl8vCPFhqjjPXE5MNb98NnqlIkOO4eIjTQb5u8sAkO7CXUS2EVKO+mn7bNMhD0Cv8+URip
	+lJmpyiS3R9fSJDajMRBjiBQl17ZpRxDNrRzWCcCkheDRfgANx2lUuekBw8ve8+IF0MgQJ5eMj9
	4LN7cGe42XzEg9CpXndu7MabqAgde5OOpJ9AtYF3VrciN1TqGeLTh6kE/1Jc7ZJBRVK/IK4D0Zx
	fx1Q0sUIl6NHcA18aE+imAaot/e1ujsN6s61APJFukr4H0YfIVFglWdDmAq4/Swds9c=
X-Received: by 2002:a05:620a:3711:b0:7c5:687f:d79d with SMTP id af79cd13be357-7caf73aaec5mr405296585a.8.1746714428683;
        Thu, 08 May 2025 07:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvba6HeUAx7OKuoCqvOUbDJe875HzP+f08GjIi6W0s7XmhXMvoMzNxaPmK3JIBmw9hSJ9S6w==
X-Received: by 2002:a05:620a:3711:b0:7c5:687f:d79d with SMTP id af79cd13be357-7caf73aaec5mr405294585a.8.1746714428345;
        Thu, 08 May 2025 07:27:08 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad20d048485sm55528066b.127.2025.05.08.07.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:27:07 -0700 (PDT)
Message-ID: <f22fe0a5-d39c-4a6e-9363-d02a6b17f01d@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:27:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: dts: qcom: msm8226-motorola-falcon: add I2C
 clock frequencies
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <5a8191e3758e0df78b4213102f25ceadc28cd427.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a8191e3758e0df78b4213102f25ceadc28cd427.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681cbf3d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=TrkI-WLm7CqbamwRmuEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: wv7xiHl3TzFc2zshwKWlpLaxUs9BmnMH
X-Proofpoint-ORIG-GUID: wv7xiHl3TzFc2zshwKWlpLaxUs9BmnMH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNCBTYWx0ZWRfXyTgWoPmmw+MC
 bADJt68uWpwYei/nXHT6HUuK6wBvfcsPeiVDM39Q7bZ3gCn0uagMwn8+MdWgp+4r/vSKpiNCvNG
 rctTPZlYqUnVx500jCNoURFARurzahSuemiTi3GaXkx9hrdxEazVMKASdMPRYrIwpHksgfzCZh+
 GjvJNsHSqinDxIMcFHhX9PoY82jfYtmld7ptVKB09hVNH/mv2tWHryqZM5GD9il1U2CkQMe2C03
 Qv1KVbJST6QswqHI5l141bhPXrrM2hnS0M8yUXjc4UFIQGj5nbP+9yLD7P8bls5DODEuAvqfFdI
 Glkotk+T6nz0Ec/svr2krkiAOhp66jIMn/cbLaeQwGD9XaTcfuxxBuPje/vOP8lOV9RC5H8W/i3
 BDCh8+lOfelHCDE1gh4q0+ZcyDuAPvh2hDCc+GlgDIJPLGWO+hEd2+aI/izZhSlf+n4Ig/+L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=751
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080124

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> While the currently supported hardware works fine with the default clock
> frequencies of 100000 on both I2C2 and I2C3, downstream sources list the
> frequencies as 100000 for I2C2 and 400000 for I2C3. Update them as such.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

