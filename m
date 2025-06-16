Return-Path: <linux-arm-msm+bounces-61489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01CADB747
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 18:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 774721686B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB731ADFE4;
	Mon, 16 Jun 2025 16:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7QgsVvh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54602BEFE1
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750092374; cv=none; b=tISPWUHyU7pSujIveCG2QQn+9SeE1VLbH11jSfS1tHZVQZya9t5s1mB0Jb7ljUjL8ISwoT8c+BynmskdQ9vREK2TE3Htin0bf2WP8dofYBvcQjd/tgPJkmSanyHW1zoxZAEfaO0WbGRLFSu7CvrTZUPh3G3yxUZUdZtWZMsOeGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750092374; c=relaxed/simple;
	bh=E5U1yP4hQA8QXwz6fW4Z68bO+TMhLlGp8Tk/+yKLwYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6MFfUkeCp+KTRgr3n63x7rvadE7UGGKmrTj4Yx+dT5ISeEFZuL1kPmAAQvzjT9727nG3Qu52ajXe8xw4jiPv0MIqZa9qzAdlPBOHiGAV9GyydiCgKEVaquLGAnn7jpHOfXzIWqN4df1q9Gt8WX+7GKO3T1TsCO6YejDMH0AcRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7QgsVvh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8uIrG016220
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+PyABmtYdCmM1nxKezq910pWxD+orgLkSJMDq63LKk=; b=L7QgsVvhZBDl2eQC
	+GokdLhoxKlJpcuAC99EOczeMBgps4eqj/FkE4SV+hfH2ZkdghpLUEKBshAVU3zH
	Fvj0Co2hqEMPc+EApeYjImqgI6x21mpXtIFaQsW9y8uJ5ghLr9RL2cPuKRo6Cp1r
	mI3Up+ZZqI90yEjsTmT11063TZ7BsJXGddJYbrN5qCwX5Tus2RfH/3tGq/bmz6sY
	B5j1DDyeVSgWHRYXCoy6qeLS6N55DhxY4WKbcFJj8uy5HcGdTRuUdO0flNelVZ2g
	4CTBV+D3HU8xEOkByVp4dvkq9GeQo1stHrj09qeIY1+1Amys5rmnyVAUrsn2qm+q
	eyIgpA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9w9ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:46:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0979e6263so40996685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 09:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750092371; x=1750697171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+PyABmtYdCmM1nxKezq910pWxD+orgLkSJMDq63LKk=;
        b=duRiSFGit/wM5e9GkPquGxE5ik1B657vaOklne3NlVofMOcT86hYuxzCjNX/VXZd3E
         nC7PcDZI91F6cR1K/3tKD6wCdJdlVQHCoqJWMh1efMUmnuRrMN3GYGeNK8DCIPRR/SvO
         KzXlTFQM8DfqICrRVybdPixnZaplz5wsEj4U6D7pO6ervi5M9i9s3FIO4ex3GzRiP9o0
         jIDkAyeORscWEJiUvmVclb14UMloV/qcl2ADhpzQswpAuLSYjqI5IHKu0IE2T+RJHed7
         Dybt/mnYIAB/WHMqOpMtj+POe5ipadL9pUz21L4ISbdmgiM4V66CtMMDAF9qTUNBNtgk
         CsOg==
X-Forwarded-Encrypted: i=1; AJvYcCVmZKys79AphHogVApSntZ8I+JTeUtCF1cMg3bn68eSwdGc295xiB2K13e5/sGySvPd/wWX+3Diq7L/M5kK@vger.kernel.org
X-Gm-Message-State: AOJu0YyjrwHL0A1my52n6dKfS2OQaI1kMLlJ5GDcblJ0rwrAl0XqHdwE
	CGlGCN5+LYEtsveUVSySHfpjuP1tEUUfLaGiyYy47SWbZXkaNMASqwva2x+owdS34iE5SwcEtno
	Efpwk47/ib5nzeHd7fYto7c4WTYIvW9PgVFgeF0cUELjrZac7lQyKyDHuDpxAY/s8fd1i
X-Gm-Gg: ASbGnct30nzOyUrMoKgjbbdR0U8+76dgO9uhX1NJpFvQSs6JatT6tXIwkgD5r7HtEpF
	jDJKhNMPmFPgKqwIdpFsUHSzelirLqllkOtJh9i6dzUFnKkS+Dq21dFVKKk4zzay36iuiw1G8ec
	O6D4Q22WCZeoahhWuKwRE6P2+ccbq/zc0WpHE3DWv0sM4wyeVpMdIIWMwHPEEggdVCfhcC3awY8
	vXhGfwsYe+hzYQ/CNmuLznW6yFqiPly13CNsyvZkruLGEIe7N82ats1LNI2WHYXd8hhwa6TVjiU
	odj7C4ArorhuxfdxLmL8mVAwkZkxrp8cIuHkd7nqxhtTbAw+juP9Gndc2DuNkzzehqrwWYbeEGj
	XcJU=
X-Received: by 2002:a05:620a:1a94:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7d3c6ccbab0mr534392485a.10.1750092370613;
        Mon, 16 Jun 2025 09:46:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECa0uf5zdXNpzOvYXV4+oB5gSMav8jAoDEuKhXiLul1U3ZDZicZ9s9ALB+gnNdoxN0MV5wcQ==
X-Received: by 2002:a05:620a:1a94:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7d3c6ccbab0mr534391285a.10.1750092370218;
        Mon, 16 Jun 2025 09:46:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adecdcae670sm666104066b.184.2025.06.16.09.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:46:09 -0700 (PDT)
Message-ID: <e211630b-09ff-4267-9507-4d67d58a9257@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 18:46:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: add debug UART pins to reserved GPIO
 ranges on RB2
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250616143341.51944-1-brgl@bgdev.pl>
 <713cd518-935f-4501-9753-d33c9ea6aef7@oss.qualcomm.com>
 <CAMRc=MceV-HgyFFvqytXAiuY+y10PQbdPBxuvd57NCeSLVLXCg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MceV-HgyFFvqytXAiuY+y10PQbdPBxuvd57NCeSLVLXCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w3fHdFx3QoYmQN2PIj4s7KtWwJf185LD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDExMSBTYWx0ZWRfX+toXzGicPQL9
 FXQAXH/pl6r83jnBZYa8My4t7L6XDSPeslIjvRdagtVWuAm+MLtJEvuDQkJQVf1/0Y82AnmDa0Y
 FeGO6LGaVh846Fsr0mL4X/fkxC1p/afzZN2Xog3fWgdxbcC15hoI4kbQXFgJEHj0ajaVpZ+Pfs7
 C/CfCeHH7vCj/f4BzBVu3kiESjbN7C021z04fVB8I+Wzb1fEuW9Tlru/+Q0rlpWacoIU0fTAlp0
 kMoMig5hy9z2b+rRi+AS6WoPtRgqFdKR2FEkLHYtbK+aXInv9iNCO9fuQSqQt2MRiitqAx7Pkl4
 x3CdmLZqf01ndXBJWfAdLHZdxP3OltJcN4oN98di5NCEop/+L6HOfuRqX5xtieNA+SgeB0sbWTV
 H7VvJ91HTSod1LBD1FvWfjLmswDhjYcpq1dSLt/Ublx4sHIKF0KUdyogzjluKbkrL54fJOpn
X-Proofpoint-ORIG-GUID: w3fHdFx3QoYmQN2PIj4s7KtWwJf185LD
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=68504a54 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=znVqVWsdYbECHmFFIgkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=877
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160111

On 6/16/25 6:43 PM, Bartosz Golaszewski wrote:
> On Mon, Jun 16, 2025 at 6:20 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/16/25 4:33 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> GPIO12 and GPIO13 are used for the debug UART and must not be available
>>> to drivers or user-space. Add them to the gpio-reserved-ranges.
>>>
>>> Fixes: 8d58a8c0d930c ("arm64: dts: qcom: Add base qrb4210-rb2 board dts")
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>
>> That also makes them unavailable to the kernel though, no?
>>
> 
> Yes. They could only be used by QUP - I2C or SPI #4 - on sm6115 but
> none of these are used on RB2. I just noticed that my console froze
> when I accidentally requested GPIO12 and figured that it makes sense
> to make them unavailable. Let me know if this should be dropped.

We usually carry an active/sleep pair of pinctrl configs - would they
be affected by these changes?

Konrad

