Return-Path: <linux-arm-msm+bounces-78278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BE5BFA81C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 745E94E9B95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F0F2F5A00;
	Wed, 22 Oct 2025 07:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXPjYZA4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199BC2F60A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761117639; cv=none; b=n7gZjE7rub968B3OhzamJfN2hg5QvYAE/XNZuR6e145EMjXYJ6XLnUrUmO/AFPGTAVFXySQB20quB/NpsszhgKm+Hkyskf/3JHqezvR8ZO8HoMHxuD74gulkTDyBgUDngxWYLro/oFBHZRn7TqpUyM7XKKwpezzxpupiXX4DcS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761117639; c=relaxed/simple;
	bh=Qx5ZLt0bA1gGhskqBF/wlqngo5r7KHvDRvvusdOm6+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aU/eaYaL9lDqXKzbjLa09GsMUX+O0zNo1sSym9V+CtjN2EUflnZp5L9lY7pqIRaR0SO+Jh/Ue7Gc7cXXEncbCkJj6sY7MQUYwlGPGOt8LY/GYLnvIZixq2PlddK0GOO8CNfv0ldEG9oWjLSgYivI1WHVxvm6fHTboHd4Bb+0FZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXPjYZA4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M39Se7026868
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/P5qUVg0GWzdhRDecSxvZEOZjOjt3BobF0UUDc36ok=; b=WXPjYZA4Z28Ktasa
	LK09WZTV3aFaBq5LIRLzfNfKw82/YAbXnWBkJkw/zXclpxeLlmSYUxCEHOSFwSn3
	qi8na0idnipYIciPYz6JqfyXavpFQXrsngsZ8JFZx2zxM7OVHAKuyuYTuicl47+R
	n0tB+db7A3EgtqPbWS3HH8SJNz1bJTLeore2HBOp3jsnKJWTdsAQBEAHtWr8JKgx
	VyYEytcC+BXZKNdZxOBTsVqzAGXbkxOw6nDWFy/n9/DiqOLQKohLDhyMslz+hRmf
	eMiSZ5HV7dVDJojn3aCfyZvs+Bp+ieQ6q0lKtyQlH4MOZ1l5NLef6q5vrpuRp5WK
	+NBktQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pkw0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:20:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so5785518b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761117636; x=1761722436;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/P5qUVg0GWzdhRDecSxvZEOZjOjt3BobF0UUDc36ok=;
        b=C2ipfzBsNeIICW7r+nF+z0sXAo6nu/w7tT/r8tHLUA5oC0UgyLOP6FK9IeN6Dz0Ucs
         46/mVCZBRevCgXA55pbq6SmL0f6bCY6qXRdhIPBPxf6xw/BDtSj3QPyIhCI4i0Vt/y1o
         JYgX0olJQuy+xsurqMrTwXzE9e8IYP7mJfs0k4+ASwriBqpyp9gWXU0es/PxDQO++01I
         PcC86/gqYHYovjp2vcFDqtllKWoPxlTeFHBw7qwQ91cDe+dyg1uKIMYLckJBebuNDzzV
         OWGrof0g3FSjKk+kU+MxT1QZVtz9Gs+y/HV6+S0vIwnU8KzluaVLhM4eAAwMrG5Vh+qS
         XJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG9h8huZdUuR9+arpqgPY+t60pUaqwBgcPo5EKwwzlLB0vMQkUU4rQw9mMTa+5J49RMlXfkj/xhvb7Ch5i@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5thyTVu1lRDAvUn1vX37ZK8pTuQrLARVIxkFIHOdvkyefyrLV
	OZD5O1Y4uVMeWa+uUdBklUNwnhjBuc6hYZRZ2TXfHXOmH1mxdkw7R6zLcCEw6c//C7IikcSS1aN
	q3Wv3xijBKfDE7iGCM1aCMtgyfLvNdrHxdHHpSrJS51GWUERjKS7rBzxobHFgkTnMa57s
X-Gm-Gg: ASbGncsc6AUtH0OwTiNmh/sWwE1EQegSD6/5j7FxEZexAVXF390Mz0zjb/b6BV0iagA
	0FHiG8yOnizdmorYx/fUgaoSgXOJ3sFRw7FSt1qmcXuxpqdQj3wV+FcL4wjUbnH9bBHyBaWdQj+
	aZoZUQgyWoMV+9qF+b4ZiyNg8NXz+XRiVJ675MEiJFrlemaalpROA4b+ejJ1AJii21FOkwU9T+x
	IB0IZ8VlxCOJRn5NVkHrkCviLYbQZoEufrvx7kKgQK7Lep0E6SLoyBHZF81ArsAfC+V7nR0egfR
	9kGIbmS8VgozxVh8py6a6m3GlMXRe9GNgu1ujjw4kCEsr2QxnqnI5OzVv0FZE+ND5SMVXUleSVu
	LUlnuOVQp8s7f/D1ML5X1/TPu1iYn86zOIw==
X-Received: by 2002:a05:6a20:1611:b0:334:a3fc:797e with SMTP id adf61e73a8af0-334a85341b0mr27012249637.24.1761117635705;
        Wed, 22 Oct 2025 00:20:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQecOhK3VUMqmQQsVoBliqObRe9daZgl/gk+BlnDljUjD9z1dJCRLyXJIODKqTr58ixAIBLg==
X-Received: by 2002:a05:6a20:1611:b0:334:a3fc:797e with SMTP id adf61e73a8af0-334a85341b0mr27012222637.24.1761117635277;
        Wed, 22 Oct 2025 00:20:35 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.252.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff157f4sm13707077b3a.6.2025.10.22.00.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 00:20:34 -0700 (PDT)
Message-ID: <95c93e25-a60d-99b5-c31b-9be321eb5073@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 12:50:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] media: iris: sort out common register definitions
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <0251017-knp_video-v2-5-f568ce1a4be3@oss.qualcomm.com>
 <20251019080212.142623-3-dmitry.baryshkov@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251019080212.142623-3-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfXyzQ3bul4tFoh
 u3WH9cvyUXGCDT2hp6KiileqZpWPEphYS7NlMWc6EJfs8JqlCyscagNwidvAtZkvEDMYYbisuJW
 51v9QbsMa/9cNd+RCeKYbirDtR9Sn9Ua2AMZS3ySCoY0NJr/cWnGdAbVZvfIAt3X1Q77FEZHbOX
 bMkrkCoRTQFdiN/QJmxuc3dKSfdw24tixPPhW+z09kANBebf0yRXN4FbByrBAITN2FsN4bSnvEt
 Lt0SdLA8oHKGi0UodBPW3VkdYWUDOzlI1Fs471GcQTw1CeFxCCocxsxmRkB4G62ia2eNQA0pq+L
 ZoZsOXat9P3Nj7LY6ahMboD4xTuXWH8bSRxYrpPxjnmrgWu7faw5H1fvJAiq3EWeKIoijmiyYjv
 53M2aZkKgXwnBL7vPeSvES3b+KpOYg==
X-Proofpoint-GUID: O1xHgobnaDJ-xFu5igr-Em6V5CAY6-Ui
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f885c5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=FoPg1IWog9mqHsjG+aRTFA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=M1YMS4I-2UCZmqrdDCEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: O1xHgobnaDJ-xFu5igr-Em6V5CAY6-Ui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000


On 10/19/2025 1:29 PM, Dmitry Baryshkov wrote:
> In order to make it easier to modify the file, sort the definitions
> by the register base and then by the offset. Also move bits definitions
> next to the registers which they describe (as it was done before).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> 
> Vikash, I have dropped these patches from SC7280 patchseries as they are
> no longer required. If the series gets resent, please feel free to pick
> these two patches in or to squash them into the corresponding patch.

Ok, will squash it in next revision of my series and add your co-developer
contribution tag to those patches.

Regards,
Vikash

