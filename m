Return-Path: <linux-arm-msm+bounces-80985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36217C46293
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 388C03BC246
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15133308F2A;
	Mon, 10 Nov 2025 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPINLj1j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFZ6Kj4y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63520305979
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762773057; cv=none; b=rzDOUUMN5IfFDaLllyhy6v9Qjr13pF7yM08EQfwWnhZ1wxNuxyPeWHL3YmQ7kJ45w3J1Xq9rNJ8HwCfx1kjMTFitZKfiEBCdsQc3Jrg4pngBFmZsA+1wROvcxgvMXtpSjVsANeBj9c+u77ARgOSGvsQsM1vL03kaIj4e+5yt5jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762773057; c=relaxed/simple;
	bh=yO77kwBGZo7GfxU02vl61rDFI9SWDoQ8KYXb0fdAB+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQtHp3RkVTI1QIaYWKkHhKtgCZ8osAHXEphc3KkLihThFeCJnOg7KXPjRAh4rtvezLLniTW8GBziLiGv3wyXX9Mkhe2XzFLq2qOKWn6pNPgK5ysa2Du1TJF0Rw2SJC5mT62gtPNnxqDb2JIS1VyHY6BZu5N11afi2GnxAx+9zUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPINLj1j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFZ6Kj4y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA6SSuY2407879
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ybEh9EFc/k/OEFrYVPKW0AEC0K4ZVsg0OtLxn2/42jg=; b=EPINLj1j6GgstPbx
	EjcOg6UjpKrFUYhA8RYbB6DrKy12ikq8bgeLM3PTbAfswMaq4+O/Ca44BVa7rEsX
	QU8uxAE0NAyZ9RKHifJj6S3gze3r5/BhE6PFpLi+Np/nE7SubUI0B4mCk7YVziyG
	ywhFO8n911i4X5pqXKnNbJyjSuzLf5JDRWvZfZnXHYySaTRILme/MwWeM51Ja1uw
	pSZNWM+kuo5UpOR8wLplKTPpEr1Ut1JNHvjFAuNaRU1OlkJBRyD54L/RcRNeJTfx
	nMsZ/wFMnzgBb3MSFzUTvx9TzoK6jWQlMc2BroZfL3CcIHnWGcuMTCjbLTRZRKIa
	Rcnpiw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abatd8vps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:10:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed74694decso5834581cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 03:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762773053; x=1763377853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ybEh9EFc/k/OEFrYVPKW0AEC0K4ZVsg0OtLxn2/42jg=;
        b=YFZ6Kj4ygnKMsmkYXMRjAV1n8YYhcIzyhhHy7fHsemqma2dch3TqEOfConSrn1sow/
         O+1iB6tUwixEXLsONKWmSrk09KUpKCxhTlpyQ6n2N3Imao1knMrDirB8wVFG8SSEzsce
         qNGzkccO33pyCOzI7BxdxeKRX6wW4MEzR6381jXiQCi7dxa03V/R66Zl2IWCipPVRHQJ
         O/K800TAtV0dIF813rMrIaP98zYrKawBBtwpx9mQKMC7rTC5kCX+vMfobtXYEioUrQLD
         ZqDVJS1ZGQ/gdIDq0nBoylRAxnUJ7rA2/c/VXs0kJKJj14T/FsaMeJnTALTn8KsnC0ye
         8JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762773053; x=1763377853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybEh9EFc/k/OEFrYVPKW0AEC0K4ZVsg0OtLxn2/42jg=;
        b=O1wNgm61mMm59KgtLy/KI4TzGakTgYNkLACFGz07VxPrZ+pkyooosi68SAwKxtmZjK
         mcPh2YuLqGSQzkzGK63UHC7Y8Or322TrC9YdExaz9v4LZ+BIDIfiVTXdzZCVCY985OHk
         r7SRO5A2bP4UaL+mXt/gJOkkGjdA0g7VbOqMC+zCnQ5Q0W08mIoLVUWmnWmx7wJPniCz
         IapCcxHee3GXNVTbVjfIxavsxe7OKGPflY5c3N2UZI5VURAW8J9xFskCfLBD0TsfvX9n
         oDrgd1UKxQlJwiJbp3C2Y+tvUbpXmTImNMcrD8PTNz5YRUio3+P0pTN4MXd0eRZ9MDU3
         eshQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6qT2yWQorex09zRUGqhuA9bkZ5XtJndAXLi4s6hfTS3Of3gnb0d5xSbtWXbs4JgoVQfKjtluBULOX+8Qt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdl+wQk3roviE0XSnLPzSlrBqKNR5vQATZVYYJ56/upY0NOZqf
	4n4+fDUBxT1NZ4kI2kr0Z3kJlJ10NRQGqIwdqOqg9mcvIjPe/M9XjhTyqbxcJSs/9iwssEkIXR9
	lD4VROxe2PvmLs4+99ULTSLXWB2uwUGcq9NtGqM6fIOG3pH9XI7lh0o6pzGPhmJ4Qa9tG
X-Gm-Gg: ASbGncsqxYTRY35ixFcymr7igE1AhXqiTUeN096ZNUhALCm89H/mu35SrTeDQjAl8xZ
	vBXq9e1rDmt5lwLHtvagCYsxdU/NcG5ZYHhYdBhpATwPI+S6KnJn4ASbR1uh6d6fijK51BBpzAe
	oYI4tcUxE27M99OzwhTrW1IOzxL+pWPDRXioT/xYDjT9QwrMN1CpveNeO+0o+DqVBSi2wZWX/fp
	skl3JNDCOuN9upd4818nMMQb5UT2eEpAIl33G7/WWpwQqI5HBcpxvCbs4f7rHFlos0aRIEIACDo
	Yj3rvucKHPectJlgaAmRz6dxqYSfMw9dogXvvL7cImYLxcnih7eOmV8UJnucPxXTR3ME5BZpRLs
	EPkTVXcZ9Yd0FR6LUKrN+FxV+CU8ZcfeRr/DkruX6oYXXfTiZad6ER5VQ
X-Received: by 2002:a05:622a:24a:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4eda4f9a9bbmr68189781cf.9.1762773053453;
        Mon, 10 Nov 2025 03:10:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQu4fNZk2qrYjwhHpbxn0AAwOS/Kjp/AlwHX5/cKYvrUDHHZLvsGb09MZi5m64KKoPHWj67g==
X-Received: by 2002:a05:622a:24a:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4eda4f9a9bbmr68189481cf.9.1762773052978;
        Mon, 10 Nov 2025 03:10:52 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6417b28a73esm3989933a12.35.2025.11.10.03.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:10:52 -0800 (PST)
Message-ID: <fbd241d2-d383-4476-8e2e-0f9dd9dae484@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 12:10:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: qrb2210-rb1: Fix UART3 wakeup
 IRQ storm
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-2-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110101043.2108414-2-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j0loswfl8uVkfNbzN2zIF2TMRa7X5ALn
X-Authority-Analysis: v=2.4 cv=eZowvrEH c=1 sm=1 tr=0 ts=6911c83e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jiGHEdQAExhvJ1pZOisA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: j0loswfl8uVkfNbzN2zIF2TMRa7X5ALn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5NyBTYWx0ZWRfX6ftHWrCi65xz
 k03rfpU5byMneStYxE0U/arqsAkTnPplVXNDpFn/Oz+t1HqXVbnJZ+mLe5wOU7lxCHBodJ5rkKJ
 xgJSn3AGKf8sXtBiCDGAj5n6kc9ZUNtBjqIzFkex6p8vr32HSgHhTxMIBBRsPF86E0vMPLI9Gbd
 MVb6bPWKegrT6LG2eSLDJWZfkT21/7/fXVqGKcEPAgHAOgNJ+BYhJQswY32l7v/dHY9nq2spGt/
 rnuhiyEfHtltAFcSvrnJefPu0BfspJei8vUraGYKPY26GxDTP/IaNITRXodJoseQ8PjZ8GmeOLN
 +Qj8ZIU+8jWRb2nhKn651NBGcP1z4dfWpxb6Sec57prn1kdKJFKkoNr99Yd73f1L1Hejk0Xk5eG
 dfmmSxhsG95MPrhPtNmktAN1KRnC5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100097

On 11/10/25 11:10 AM, Praveen Talari wrote:
> For BT use cases, pins are configured with pull-up state in sleep state
> to avoid noise. If IRQ type is configured as level high and the GPIO line
> is also in a high state, it causes continuous interrupt assertions leading
> to an IRQ storm when wakeup irq enables at system suspend/runtime suspend.
> 
> Switching to edge-triggered interrupt (IRQ_TYPE_EDGE_FALLING) resolves
> this by only triggering on state transitions (high-to-low) rather than
> maintaining sensitivity to the static level state, effectively preventing
> the continuous interrupt condition and eliminating the wakeup IRQ storm.
> 
> Fixes: 9380e0a1d449 ("arm64: dts: qcom: qrb2210-rb1: add Bluetooth support")
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

