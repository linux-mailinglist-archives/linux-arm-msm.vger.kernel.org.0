Return-Path: <linux-arm-msm+bounces-83226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10095C848B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 11:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BA093AC7E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 10:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E19D31282C;
	Tue, 25 Nov 2025 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ObItG198";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPmaF2Tz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC6D3126B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067529; cv=none; b=dKPYNJSctnEeeWGqSW1Zkec2+x4X9EPdfv+ff4Rdhmsj/5qVa9Xp4pY3IwfAdHMBuMwWzYcvOUA2hwP1BCeBIuo8EfwjerRMFGUDitdmF32p1RaLLVKMZ+fOhzsurFfqBeUeWRFU8tCbAwb/ynAXt1H3TR61tsXBwr0bQNhek2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067529; c=relaxed/simple;
	bh=VCq+O1s7382hys/B9SmoYilKyWtXfu1me1mpBF+J/kU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvTPfhRBBOSU+uPUT6nBD8bw881bw7c1o8yCn63G+qHmFCWG5v/wcO92ZtDnYgNXEyUnCXba+ePvz9ywL64152ASLv6InU0EGEWS1FVZsdRICtbyC3H/H/whJ/P2u27unnxTj+o721z5N+h59TlRj+pUQSj2aaQh2iqloAQRl+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObItG198; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPmaF2Tz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP8Duvk2726966
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wn1SxpEKcwo4JCd8zTQuVpo+QZZl6aFrR2Lf4TtVpMM=; b=ObItG198kJWPWmj5
	sU0sxiBjog/KrpBUW0Sj3MlbNsfbng9b2MTBkU5UO3DfzmCl7E8xPYArXmAslufX
	gXajqOD+kQ/4dsg3n0uqhhFxwelkLm81ouH8rMRH4golMmBPpK6/SQGBqXmbdrjQ
	0sHefqgf08E5uvdhsLovRlZDw1/nyd2NoWM5L7Uc3s3NwNPiCc9q3O0aBg58MVbt
	DHCPDZz6ee4t/dpk87BeMPvqf0CGzEaI9XwlrMkZBNmtbX2sCXPGXr+o7q74a878
	fvrAj1NOn4+5DsxGxrV1hFbT5TN6Pe+kI89UP1X6KbhS23Z3YHQtDwFC0/Qzm7Wo
	8QH4VQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an8rvrh6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:45:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b222111167so142983185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 02:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764067525; x=1764672325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wn1SxpEKcwo4JCd8zTQuVpo+QZZl6aFrR2Lf4TtVpMM=;
        b=PPmaF2TzFRU/IqLx1GcTZ8onSpL0ZaN4G2ai22l5ZMLie9lzm/g+WL+1BlHSe2Oect
         ybNUwW6bkdQ0mXAZRtkFPc12Q04jMPiEvqSgGzxXKm4d0+Hc6DW5NVppKNKhTV2dvTa5
         RAzA6AY/UudmfHCJjQGJf2WPXRrB2uyBMVSoTy4bGVy/X55nJBsdevMjBDqsUfh/ySxk
         HzQ7Nfaw5t438/Oxm6L0SNBcpmKgJsbpWfaJuEYTa3G+gtaJjmsRVzIMjkcsJpi/GjDl
         WAbK+7uDvWmc6XNCBjpdkdzAYzZuTdayqQHnltyX2dZZTs29SyhW6eMWspVBqSrAaKWR
         gmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764067525; x=1764672325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wn1SxpEKcwo4JCd8zTQuVpo+QZZl6aFrR2Lf4TtVpMM=;
        b=SdtUm4rbgUNJQpRhBeNBBgJWzZ90vZFzRx9UQTfaMPuB56QcZ5ZRXQOEptRwikEonx
         MncwmZIMUwxSLiwr78GLxYG5Lkhs5opSB2ERU4gWgRnyM3VRpQcYm0cC8V5eKt1hsQ+8
         wkdiBYShNCl/I1/CbSJ+qCn3rEKE6s/A6RCIS+VALrh8QFj2FfSyV0DdvN8YIKucTkfU
         7AsLkdpZBObvl8zt88TX1DE8ndF9AuVLajlX42rplvLyYCFNE8QWWcVJDzzngPiEjJGn
         aF/Gf7uVUXaxJ0Pt/wDlVV+0h6edgB/zO12qbh/VimkK0gWZP5WYyHN9qIKmq8ZO/KDd
         IbLA==
X-Gm-Message-State: AOJu0YzL3jg0JCLir/jNf1AI8+EOM1nDx8I11ZRPTWMz1DiCTveUJLdc
	2zY8RsKYpT94Q53gITAU70DDVL0QI3m599FJjqlfBr4Fhbf85DVPXzMhMm/rY2TV5v7AgZ79/QR
	p9Zi2mBxeS7mybnhEBHDuWrK3rUUFNncZUNX4dFsZD2+OoU8HTPLRayi9gE23I6E6Eae0
X-Gm-Gg: ASbGncuJy7auP3BRCjBOKJTJTYUzVFKf0H+Wygnp82y00vtsaxMLVennUh9oSlH4NYF
	cRhtk6b4DmMjNCPSW2d4loG6H8UPK1Cv8G+5wjz0WMIiqZhjc+quLqsbrsP2vrLohF/hUKPt4h4
	b7oFI246MYyaItcuTLVbCR7tu4r/Dzd+9TTpn+RWqMM9YE+xpKt8N8lbWIXmjFp5K1KKPOvq1v1
	oSvqku2FBzBi0nahmJF+wX2SCCqdEvub0L6gvLiymQQdmA0Sb0K8gLkguLQWKZzfOktRcvRk96R
	lHZK6bvi5HNyNJNOdPR7n/k1heDw9t1Sye1g89BYd//xn/idKDCZmCL1Wl7TBcH/ycXplBWO7Ri
	uMGcGUgqmQunOEjixkoG1hqsgBuEK96f19cljHYWzGqTQ4UHs2381vVW/ZUCSz9I9Nvg=
X-Received: by 2002:ac8:5dd0:0:b0:4ee:1f0c:c1aa with SMTP id d75a77b69052e-4ee5b74c2b0mr137857121cf.7.1764067525565;
        Tue, 25 Nov 2025 02:45:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFza8C8YbcTHUSzQ9MsUfOfDbV7bpXNGIVx3J9Vz5JDGtYEYciUtpiYbEpD4fsxLqoXIPyqnA==
X-Received: by 2002:ac8:5dd0:0:b0:4ee:1f0c:c1aa with SMTP id d75a77b69052e-4ee5b74c2b0mr137856991cf.7.1764067525104;
        Tue, 25 Nov 2025 02:45:25 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654ff3c40sm1560776066b.47.2025.11.25.02.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 02:45:24 -0800 (PST)
Message-ID: <d3318386-2646-4f1c-ab4b-6ae3bc71e9bb@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 11:45:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] iio: accel: Prevent NULL pointer dereference in
 interrupt setup
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
References: <20251124-expressatt_nfc_accel_magn_light-v4-0-9c5686ad67e2@gmail.com>
 <20251124-expressatt_nfc_accel_magn_light-v4-5-9c5686ad67e2@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251124-expressatt_nfc_accel_magn_light-v4-5-9c5686ad67e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qIpKtwYD0At4EYz4kiCSZFyTinVqhw96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA4NyBTYWx0ZWRfX6MaPbZjEn4VV
 ZxRL0jCCslJJ4arYtndmSk6nDur30y1PmiATe7AfAaKdsnYfLLhz+/RXRViMXr+TfPd7Cysnt7a
 qtkeUkbrta8BJNdaFLMlIomuM0K5fDOfMrIH36O45Lo3YvE6U2cSugilVUVbEQOKXGsAlknMdYa
 NwgQV4WAVo2JwVedRPHqNqkW3zdFA2RjPH8xttFIgCkAAAnk2o8WP7KHt6KpaxiIJyuX5MRChvH
 22TR6vk7+mZtxkWuT2V7jz1K9jvQfgULKXfeyVWoMj3iptaSjSd/EOaR/vaIiJNc51DOUIHRNRH
 rxMBWuO5LF65k+/uR6WYlWjTfx5qXuegWR0S5W48E5OeQ0q5f5phPK2g4Z2iM9hIHuyY5annNxA
 R0647dhH7oZzSs3j1OqK49cOrEjvUw==
X-Proofpoint-GUID: qIpKtwYD0At4EYz4kiCSZFyTinVqhw96
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=692588c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=W7vXZdNd1IZ0taGBaDcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250087

On 11/25/25 12:35 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> The bmc150_accel_set_interrupt() function assumes that the interrupt
> info is provided. However, when no IRQ is provided, the info pointer
> remains NULL, leading to a kernel oops:

Hm, are you sure your device really doesn't have a pin connected to
the IC's interrupt line?

Konrad

