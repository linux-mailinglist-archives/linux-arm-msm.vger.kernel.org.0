Return-Path: <linux-arm-msm+bounces-76698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D83FCBC9992
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C08AD1893254
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242622EBDDE;
	Thu,  9 Oct 2025 14:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuDIsEqN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0D62EBBBC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021200; cv=none; b=mcd0dr/rl1MgaqZG9vPybuXFp8c2p8dT1vQsuBBVbBdjwYHzaMyeCbG+l9apQaKeuD4SSc9PTRqZjL7eechCt5gDgQ8vk2MSuKkVUpQGAlIAj6CZe/ULvuOSOM/cEvhzIhxc6Geb/rQQ1a+4lmln/WSVfk9WrU9UKg/Er0kPbMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021200; c=relaxed/simple;
	bh=HCVYg7YLF1NRKPfftTczIu52IvG4diO/x2IeTxseCjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbTbKVXEGa2kKPmuLF5PsbhjFHST5j2QBIQ6mhktpLauzfZ1u6F8rKM7a7yVD3D1PMB0KEcEPX4TC7Uokl+djiO5iM+UKSOQGARWlSiXtsESF23sT6AtqGpHXBBwsIPDEqORuGCbmqKT1tpADFQZUufYEQxQytAdiS0/TWtoJBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuDIsEqN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EQLV019239
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 14:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HCVYg7YLF1NRKPfftTczIu52IvG4diO/x2IeTxseCjk=; b=AuDIsEqN3HKUd6bh
	3IaPolLJ6PiAMVZuDNDzcoAtaIxDGUmQ5VFei1tlX+usRQ1mM0csGHt7pkOdwIx3
	+h10kRLQmncyg6/J3DSk+LGldv9A1x5jDc62nweQf4LdWX6rAKCRtulOYV6RcHLP
	ag4qDkmVnXvJGsKmY90SEXooR1HGn8pZ0oAbjoZjw/dTvc9qyDfrzc9uaGmDaeQM
	2lpY22+mczkEQNQ9Fd1o4+2RR4qoukb2zeCfnkYIhiqi7xBc0y7opCTeD0dOKeM7
	/BZ14GTrgkyhwzjLyW2ZIlTiiY0KxrT+URGnWflOL5I+/J2uYwWOtsVVXqURQ6lv
	xgYZ1A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nu72a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 14:46:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7958a07a5fdso2852046d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021192; x=1760625992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCVYg7YLF1NRKPfftTczIu52IvG4diO/x2IeTxseCjk=;
        b=b3QEcir29mHkA9FxDJ4eSLPy/p9jFttjH2L6MpKBi7xiXvPSe8AA8SE8RNcFZQeFMP
         aMJgHKrLfJCL3mcZ6WRKELkMdQUJs+9lc7zX7pheFOXwx0pnSQS0sCZOjmkSKd+eeIh/
         vv+5TFpgHUZnpMulk/I2l+dp+qOpOqTnng37w6vsVSpai0lYIudyJIk6r6+umf953Gb+
         Ea8LYN72V6gquVfsvGBSKZxx4jpE2Mi3PNEZzze+IA66bEHwarsIhBjLBVeXhg4D7IX1
         5WM3zysImBbDFH7Pfy4pQ35amymC/HpDfKwCmTx5tPDgiySHz3iyhx7UxrfQg8HF2F4m
         XPDA==
X-Forwarded-Encrypted: i=1; AJvYcCV3jnZ5wRMrz6MO2QFRDYav/WE1gvoFpm0BU8t0Aqk62G+N8pXQseZqq08h6nSW7bAYOsEHKL7S4XOoO3q2@vger.kernel.org
X-Gm-Message-State: AOJu0YwkUmbNo+pDVREIZJUiAOS1+mDLIt7tTJDXB6hB82aWlydxFz0s
	RxO4N074JKqG9EVi2L8mS6dEk7zYSkB3300/v0Ezss+rOI5oOfja+cPKCDayFU/n5xKLdrCkjMd
	7hgQ44RDQPfWuaDNs1qlbfwE+sYlyI+HcDIBe0vZf/EYVO5fiSFrj/+R+GwPlnSEnLpMy
X-Gm-Gg: ASbGncv46XUZL+e4Yv1iZ/JUzdgrXefSIfxgmlQoWE/QSOfA5xZgfcGB2CdbGn2V4Rd
	ySjh8/Y7WQeiRB6eAjLfqC1bBw3YZAcce02UCSpdfYXCEQb8PkhyTkcf35hjRXdwdSnRK7iFwKg
	akSLD6f9pA1iZWYdTBagRKGg015YFTwxt6L3yG4f4tizSaREUGbbZwzErbcy2qpbccUFHEh9NMX
	7JABrmYHeLm+Qw/gM+AedXWqHgLKJOxht4n/KmzWMTSOHf4TqVnxux22nH+i+IokbMDlfk51B6D
	Ep673MS+UjV/sODUd1fT5c/F8z0ZXtqkeIYNhgg6+A3dL3LuhHDPgG1hN72mq6JUWOx84P1oS2s
	s8IEybZk371nx71koxq7C35AhWYk=
X-Received: by 2002:a05:6214:1c89:b0:7d0:8b28:aaa4 with SMTP id 6a1803df08f44-87b2ef9394bmr70623726d6.6.1760021191540;
        Thu, 09 Oct 2025 07:46:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbkxsgpA2R6ZHZIpuug3KaY9J4Jw9+efaGwspf70reNmliHQ6JBJOzAn8d48ngP1fI+sY3xw==
X-Received: by 2002:a05:6214:1c89:b0:7d0:8b28:aaa4 with SMTP id 6a1803df08f44-87b2ef9394bmr70621816d6.6.1760021187635;
        Thu, 09 Oct 2025 07:46:27 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f30d51c7sm2578021a12.11.2025.10.09.07.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 07:46:26 -0700 (PDT)
Message-ID: <045401ef-3a39-4b65-9874-0a0086e72325@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 16:46:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB
 LED
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-5-5bb2f4a02cea@fairphone.com>
 <rnlkxpm6crulpvfleclkszio2fms7t3ulc3rpsdozteml2bak2@zvfuyc33ohez>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rnlkxpm6crulpvfleclkszio2fms7t3ulc3rpsdozteml2bak2@zvfuyc33ohez>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ksSfSfENYm3yu03nq4Nzv4typiS9E91r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxu4xjWBnlSZ6
 MR61VmOM1/tYklLbY4zLczaRTlo/qSYqwySwDBe9YdKwSCmWBfLMjj55jViztHb8akFrikO4qlc
 6B2yQYv5aYSitW8+JLpOIOXLWk0xLjSnACWbUrenrPIQPrEcAMgSgD0jZFNVp2ZmM4eyMZ03nKP
 s6G5HgEY93iO4JanIQY8DtNNw+PnTOdPB1XFv1ccKifaF/yG8txM+VMYs7dBzWHQ94EqVhRbHsA
 KrS02sYO4Nn1k1RWmdccxZCxdlRgfFQmUnR5pTOviGYJ6oMGLQm1mieREZ9EKgBHVBPhAgB516v
 SCjj+80pLXf6J8YKURtnVqvAAcwgvwgUn6ZuAVpJB0fblnYpA1HPzrnwitzJjHgtQUrrJWvom9M
 Jax70EUg0OjTO/Qy4LM5Rd0M7GBmGg==
X-Proofpoint-GUID: ksSfSfENYm3yu03nq4Nzv4typiS9E91r
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e7cac9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=6H0WHjuAAAAA:8 a=h-s2VQCXUef8IyaNg1wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=y4cfut4LVr_MrANMpYTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/25 4:42 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 09, 2025 at 11:06:35AM +0200, Luca Weiss wrote:
>> From: Luca Weiss <luca@lucaweiss.eu>
>>
>> Enable the RGB LED connected to the PM7350C (PM8350C).
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---

(you sent an empty email, Dmitry)

Konrad

