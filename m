Return-Path: <linux-arm-msm+bounces-41773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5C49EEC5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CC80283B55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7640821E0B7;
	Thu, 12 Dec 2024 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A30Wh20J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0C3217F26
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017642; cv=none; b=g3D6WdAkB6zIonwtZ6CvbLwsEtKseLjMauWD4FtkzKZ14jundclRAORXUcwmpHRItuqoh/+ESfjqSR9gVPxgs4NcdiXrabmPGrhbSSxCPx+/9X2/08B8tZfU6EWPnGq54yhlxqjX0oMfuV8EWWvVaBBzbuU4QYzKrpOmQwzZBec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017642; c=relaxed/simple;
	bh=h7Qvbd0DgfU3DhtnwKA4sua59QGqX8BbaTXcCwT4uuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGD6vFLPiZA4EKGVf7BezFJrX8UZxiMSNauRetRa5dW5/Xcvf7DmsYla7RbmesPpRzsMiehytVRVhFiF1hi9p1h/0Ep0x7IDiVddP+kUmmg4pk7yKDNrEFJgG0VNmwzLJVwEC9h+7eUskn5x1GzAEfUf9dc68JgN0BnGjcA3PHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A30Wh20J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC9kbcC030103
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xcobdIQSpd1y7u7mA+U3MsRd/GVP7Hr3qs53FdCE3y0=; b=A30Wh20JxGW7dZ7P
	t/40sGGl0ECGgLK/GImZuwI6+UhSM+SzE3h8mkz3lnUDmDEA8hHgGX6i9KkeQHRJ
	NlYq2lZ1ljbG6CG9v8hhNL1CE6NRJSbANwMwTdj+UAUq8z+1ZxQO6KkTJdOU8Rs0
	kmo8ddfU3iVwywn3sA6HnH3kN63o+VOmDOEP0oV+9rlXZTL6TMn5zmQWqt+fmTXg
	UdUfDLvKoT2PU8zGWT4RB1yhuCcB23/vlryP6cAabN2BRivtt1dMapwtrN9PG5P4
	cUco+bcU8nD5vm23a60t8Dc5nDHk/r4LG7y22+VqPz2QeZw8jdt50dxUQpRrKbDz
	7HkdGA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgegxuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:33:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8824c96cdso2050336d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 07:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017638; x=1734622438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcobdIQSpd1y7u7mA+U3MsRd/GVP7Hr3qs53FdCE3y0=;
        b=dcmPgJJPGYyCioNRNER7jpbvMg5XL0UyhwwMggM8OXRDpzeH9TLy9+4CCWp9wHy2Kq
         cKjyR3VsP3VstzinGzO6qUmFd8b5DoypQWjy4fn7S0ZqjasMQyzhKWuf5n8Hf8VRwZxw
         amqVgLNh/wEYeu6LRr5hy0fD+vdzchW+2rT28xhW3Ksnk3hjBAlPezjUgHgC99V5tSB0
         0RB/WHd6BzeuthgC8uoDM0sw+49z7FNW77IuScqUOTGzw24TR9L8UpUUO1CcdI7l2eUR
         Uot1poYmb9je3eBH8lDOZkGvMKLR0Fbnc1q4YtkF4U6Ni438EtAsmVCG4cgtNFRy9dQC
         D/wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHnpr7iKN5RckHEbGZwGgbiDnDN+GOiWm4PZoQ9KgFx9CZ7XD2hSTbq/vwJlU4Wm4z9pVtiyxV9kx0x7Vr@vger.kernel.org
X-Gm-Message-State: AOJu0YxD5I3pCWaGBIHbwHUOUfTcI1oDT/6KBv4Q7g/3AfN13yF9fXu9
	gysF0lBcmz2oulJ7m0FHXBWXHRrNLay008g4jIheRMnbBeMMwQaZ9lU6pWzQMOO7ygQl/t4KUpf
	rZfr3gNQAa7vf+eucvUrQ5HUphgRsWinNtR0KLe6U1YE5h4Ys3WInNpm8eb0SW/4b
X-Gm-Gg: ASbGnctn5MAsJbLE7mngRHS2tYJnePI3NReCw7mZeS9zc1eL3jkX4/gHZjezYKl4CFW
	DDm6InYoPNrxnzTjxeOq8jlpL6zmIi9zLN9aCvzlw9+MDi0B9zZwfYZBJgKKt/P4TS3gCzk5B8c
	G3LObI3W0GfVTxLZHV2QpQ5i0zf157sWbh32TSNxcuoqWdHauMjKNHe491MxmpYQfHz4ChuLp6R
	2k5MjsGkosVVeqmnbArq6Q8FOPm7g/T7N8gOfuFki9UVcDjp9JhmxZM6AczKWVzXNdx5EmsPoTz
	eoPZv/H4pgDKQuoI1WlcengZ3GXPPG/IDomBlQ==
X-Received: by 2002:a05:622a:5449:b0:467:5b1f:4060 with SMTP id d75a77b69052e-467a153f285mr5024951cf.7.1734017637084;
        Thu, 12 Dec 2024 07:33:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4+pzgX907kDQGDvoWeY/ZuCSH3vIPzYizGVrQ6+6iRhZfQ77zqHdERamPlv68id0M38+p8w==
X-Received: by 2002:a05:622a:5449:b0:467:5b1f:4060 with SMTP id d75a77b69052e-467a153f285mr5024701cf.7.1734017636720;
        Thu, 12 Dec 2024 07:33:56 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa684d6eca3sm614870866b.141.2024.12.12.07.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:33:56 -0800 (PST)
Message-ID: <33f181bc-8387-4f88-a754-0f05dcb6bdff@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 16:33:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1
To: Johan Hovold <johan@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241207-topic-llcc_x1e_wrcache-v1-1-232e6aff49e4@oss.qualcomm.com>
 <Z1mZubWYMxPaHx70@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z1mZubWYMxPaHx70@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9RoI68UjQWzeGnFhwjDvh8jp1MVwFKkF
X-Proofpoint-ORIG-GUID: 9RoI68UjQWzeGnFhwjDvh8jp1MVwFKkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120112

On 11.12.2024 2:55 PM, Johan Hovold wrote:
> On Sat, Dec 07, 2024 at 03:04:26PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Do so in accordance with the internal recommendations.
> 
> Any hints about why this is needed?

"it's good for your cache to be active" ;)

> Should the fix be backported?

Most certainly.. I'll resend with a CC stable and as per Rob
Clark's suggestion, with a larger amount of context to make
sure this doesn't get stuck in a random place in the file

Konrad

