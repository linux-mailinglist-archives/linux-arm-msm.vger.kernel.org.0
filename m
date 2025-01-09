Return-Path: <linux-arm-msm+bounces-44578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 907B8A076D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAFDC188B61B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5B821884A;
	Thu,  9 Jan 2025 13:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvIKrjkJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ABA218599
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428361; cv=none; b=VxILMmzNGC7+Gdynv/fEKpSybum5FKFgpvfa/6v1f0+eJtANk8zBg9LHE7g27quzREEJAHjbyQWYnKxacdBSoGnOHAmuJf/i+91Xqso0yeKf754SeSkcUMyWoqx62wcReBJGZ0Z7o6B4C+jMuHrozFDvGg7GmdAMh+iVmTIjqVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428361; c=relaxed/simple;
	bh=jpwNmvkXoNR6B+tH8Sx83R+MPfKaIHFv2zRN1lJcpYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hrkdugzrdg+9GXsdTQwB12tOJVf4Fl+BziGK94EPKYc3e8Ffx27VtPsR2LY+RBB4o6wizqNuKvfdOrQ2Ea2WQTXRASWljsECzrHEwBqGOzV/B6c/FtIXncowMf7zXkFqjqNjZmCRXGd7isnN6GUpOHX9wGo/0QIItWauS9cMHGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvIKrjkJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5097GwH8019433
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jan 2025 13:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aVaJFDIFSQan13L04M0avNtyYD02w5zrm6M+LsFD+O4=; b=YvIKrjkJxoxcyDKD
	Wwq7jWSrdkyzrqBahfEJEIZD3W+Mt5F18dVqf+y4yksk0VzjsErY9/AKn++PcmDU
	4q4PENSVxb36XDj4O2MYS1psXJpWl1n+kyTIVMxhOypKgC5ym1tD/QwJwJYg1axy
	1m8ufri1XSTZckvJYt8h229KQ2EwUNAxGQsWHSPVQIh89QPWahH88O7LPppUZFBb
	oLoyYQzMZaVCVPG7lTUOgGehtItH4v6WnzajmQz8Icz7XQLFGvAVpgutPMZuRUFZ
	CCqDJGZeRnKfRiULALWmzI3S7iwzEYMEAvm3ved76setlAoogX0eFMKNQYPLwdxq
	KOyssA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429x50tvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 13:12:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4679d6f9587so752321cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 05:12:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428358; x=1737033158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVaJFDIFSQan13L04M0avNtyYD02w5zrm6M+LsFD+O4=;
        b=ctFKm5VnqAEQMMNZ8bnkb5AZjhvDtjG8PbIQM746KAHUWlbbLcIZytODj8In0JRNyR
         qx+lTOpT7LV1+mWMFRYl56wyxwMt/ewddSunoCbzbUF0npFU1dwaRVWWX6OlxyGIfEUc
         IQ13sO0BTGqqkT+aSzi+6sZNxrX4OVPFeOpQqEjNP1ulVtqjRr01wP58TlTeX4JusIMl
         TvmhGmYKdq8FjwWmwTVhqBaWdUkMXqdmVhz0VTE8Xq0CVAmOh718phy7SxZekcdGl6W2
         MXpKk09j8JPItKbdpupGEHSdzEFcmI8DcwM59ouPnwljeGHjaiGRFbhFjIQ1RXUVwhuf
         kJow==
X-Forwarded-Encrypted: i=1; AJvYcCVs5Kdx1Sj66GWvl+19xYlLAw0DZ9LOg+qzIE1ZDedGB7hIYFMIzRk+RFET72rD44TkQ1b9nV2EnPpCfyWc@vger.kernel.org
X-Gm-Message-State: AOJu0YyJts3zn9DmsQypBdeXFWpki9IWSEYML/NWTKlQ6z4M/qeB3kzO
	tEui09MJl4lWbdZUGt43RqculinvL/FahNMPe8k7nKw7VisZOkEFuGqAKqV2mH8Q/9dkkNARvD7
	AQ8a2OpHQt8C58MOZ2VoA1KTefyN2vPk7l2SAAY2qe/uw7FCYmshVLP5PcLJR2v6d
X-Gm-Gg: ASbGncuQrIBnQ1DqZOj5Nre5Uxqt1XvRESs7qKdyI9Zr5kdCyskmvlgXXGe6SJFTrQ2
	QoTN1mHAGjSLD1OUzThzWc/Gi/m0j0nLKJWdHmQSTLtS7ux5tlcJrG3IWUc+59w15vXGEFxb3J9
	jmHRA4/Y5lEs1Q6b2jWKyssEeaUyxj1xVXvXBueJXvSQi5rXSMPKdUq/RrdbNk8NdcIdHX7n3V4
	r0ydoB/Z+3uy+ZC7xgILyC/vE1qDR0iYyVFpb2Sx9E9q91tCBi+fSqnR0AyjW32+Wg+QPZtrFdz
	bRlyX1yCQ9MM/UKLPmALnMOpBOUBe9SqYdo=
X-Received: by 2002:ac8:5a16:0:b0:467:6b59:42e with SMTP id d75a77b69052e-46c7102b634mr38200281cf.7.1736428357836;
        Thu, 09 Jan 2025 05:12:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkwHMLW9GjZHWcKUH2RSnFzZoO8UTVYRg9nJFkeAjeMJoOIke56jqRMFk/LL/dquo5VojYhw==
X-Received: by 2002:ac8:5a16:0:b0:467:6b59:42e with SMTP id d75a77b69052e-46c7102b634mr38200061cf.7.1736428357436;
        Thu, 09 Jan 2025 05:12:37 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c37csm607503a12.6.2025.01.09.05.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 05:12:37 -0800 (PST)
Message-ID: <20abe9a9-34dc-4712-8fde-b959eb3e22c6@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 14:12:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 7/8] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org,
        konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Cc: quic_viswanat@quicinc.com, quic_srichara@quicinc.com
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-8-quic_gokulsri@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250107101647.2087358-8-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cReWZ_dUFRfxIWfpYy5nFytnFfA_XRg8
X-Proofpoint-ORIG-GUID: cReWZ_dUFRfxIWfpYy5nFytnFfA_XRg8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=627 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090105

On 7.01.2025 11:16 AM, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---

The comments you got on patch 6 apply here and to patch 8 too

Konrad

