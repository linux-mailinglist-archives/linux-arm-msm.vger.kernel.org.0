Return-Path: <linux-arm-msm+bounces-75960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B2BB89E5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 08:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 37931345F3B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Oct 2025 06:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C51C21E082;
	Sat,  4 Oct 2025 06:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaUBB99v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25F51DFDAB
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Oct 2025 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759558711; cv=none; b=DvN4kUyEr6AmSbR0c7Fl4qovfCq86No7JGEfPmjv+cwcR1g5kA7wGz37MdJ9zFt+Q+LERxwX8GreaBRFxMrFAbFZcoKDvSkgOydL9dKDSLEYp2CXm+44BHd4uykODm0vieQ5UJBag4kjznHmjAujJz+8KZrGAZ6+PYtxdWmKR5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759558711; c=relaxed/simple;
	bh=Xb7GbdUMgeFO6hGVfbM8PH1E1ogGhUzLWkc4jXBM0Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKKaCVnS3Oyzl/7N83+IQ/ylnRtZoJxZjExir6LPNYZEcPMpyQiRqM/UvrGzv4S48StuDq7egLQ+HFSnp8RooBd/LbaZElqdxfqMONqaB9AaT8DrTAO2O3DCr7iK2Zig90Kl9LwWy5d2ZWfCQoEgQHbgTm+A7HL1KZBFID1D0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aaUBB99v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5940KgRZ024815
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Oct 2025 06:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tREHhzBNqaNszskLCqYldCZ0
	jlzI/Dwijuz01+c/GDg=; b=aaUBB99v3DLAUpvqqGdBj9Me9Nnweq28bOfRNTBU
	TmjVXBCeiP5z1vUs2/yZNjXSXXa4PEv9P7QBrcyxba4ef2KcT46Bxo1ge09Ni8ms
	OiP8im9zc6swVzUcRS/Lg/Y5RpRJH3yEo+nJ1ikmrghWzNzve7WLjGaiMbqsgpc4
	H9dfjdCSueIR8lFTmrBm4Pr1wH2bPUVbBGpcgCFu1UVUBk6kMNIGTeZ0MGojfPzy
	LoIS5IBmiaXh3gMIo8KouP/LKXvz7Id3retugloLEllY8pj+nyqdV3CtvK+W1py2
	4WqAA8j7fXXi5iAQs8+SmV7i/vGp1AWZicG7pp/zcXGhnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn0fnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Oct 2025 06:18:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de5fe839aeso75322911cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 23:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759558708; x=1760163508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tREHhzBNqaNszskLCqYldCZ0jlzI/Dwijuz01+c/GDg=;
        b=Gz2eK8rJJzXBa80WQXvRP8WyQrBNkUXR5yAg+wLoTjMGVflHv8E5cBVRnUPNAgYl/Q
         aHuKovv6IKUdZn/T6V5TpPI6jnUCXxgZ18GLYRp+qJxZ7bgq5Y6/xFFA0vOjTXVzNV1p
         GJiwjz2oVBf89WmDwuXe4tEiMqPxPh3PfTEKUJcUb57B2EUR8DO1AUaF0bovJdDb+da4
         cY5S+hQQfJa0Eu0FxRzghEn/T1PHc4zm++6jzuUlp08G2wDVABjDfAgE4gZ6n94FB3jP
         KWwK/IQgXloQ9r0z5DIWkv6CwuRHi59ckZnqsADGT5f7WBI5U6N+/m56NwMjz7mvBcc9
         mrRg==
X-Forwarded-Encrypted: i=1; AJvYcCXYwn1Pl5X8Kl/qWLB9gLAxS5PZGychVUrfCHJmyleIElzWrnH7Yief117UIDXA9phj3PTPxwYxmEbIEZcd@vger.kernel.org
X-Gm-Message-State: AOJu0YzfC90P4gE0O96eOyG2T+HNWLGnJZwYpNUda+X1zGir0jecOH61
	igtP2QzaAJhmT2YLuSVD2STUP462shvGd5ehFi5sHG9Yt7JZsKYDAn2tOvektezNm3NO73PrM4L
	CiazXO0cx62RZrQSSnDD3xrNkFsSfQKBjfnMR7OE9MhNgglLS3q0J051yZpPfOasKNIAA
X-Gm-Gg: ASbGnctNxHUtCjCUKXBPyTO24BDI8yaddIk67N35vH24IJcUmbeKlmtstWcLh7GG8im
	5CV2v8WlhSIekKzRzWafMgKSRwcr/oUDlRewy16gcI0WITJ/CDpthdkiYeYIhhN9eHXCkLFOIhe
	s8oEYc7FRpuxzTh6W2/58sE3raOGL0mLOPYaBsd+QS7MRhMajkvykIe+f3WeaUrkWRZLusfRzka
	I57AT4z4e8/2q0IEZftJAb3yAOjDIZMfYhq84pRmxkL2dAwvcuUW5R2Oh9YQxlt4Dqdq2CW6104
	evziZkGCzBp9k7uT8c5ng3/jhTo+qCV+U0He7z299hF2lM17w82vP3fxQwIA3pPYg3e4L0eN2br
	W5EjsJSshFf+EQnkN2E2g8rRP/lBsGeRtZnqRwQtEXiZjjWVd9Yhy7+P6Tg==
X-Received: by 2002:a05:622a:4d07:b0:4b7:9b53:4931 with SMTP id d75a77b69052e-4e576ab85e9mr66481101cf.40.1759558707855;
        Fri, 03 Oct 2025 23:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB/luGgFeuFq2gc8pMMZHls+pk4ugbASEUaLSkySS7at3hllWxZalz4bhSCVqzUh5bustxSg==
X-Received: by 2002:a05:622a:4d07:b0:4b7:9b53:4931 with SMTP id d75a77b69052e-4e576ab85e9mr66480941cf.40.1759558707438;
        Fri, 03 Oct 2025 23:18:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011a9154sm2520945e87.115.2025.10.03.23.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 23:18:25 -0700 (PDT)
Date: Sat, 4 Oct 2025 09:18:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm7325-nothing-spacewar: Use
 correct compatible for audiocc
Message-ID: <hnphyvnervdsivywj5x3hgyuy6lhtnls2k3djd4i3z6jid5yjt@y7nja2ga3cqo>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-5-5a45923ef705@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-sc7280-dts-misc-v1-5-5a45923ef705@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfXyw/KVoS6wF1I
 yE4LeOs4jcX5giXqawDNGVtGd5eFhCgh/yJxjRr/S2O5e8V6ilAsZLSicNLWEg3VxDNISF5ZC2W
 ucIhsr11EHQ2VT9JxvQ2I/KuLTfJQ+F0CMPLmFS9sh0g0mJn+sXZw/1KyOgO3JOEJUts7lqRha8
 nHMkf5YulHgIr14UTeKpkZL6tnFL25pU0bR9aHVBB9qbi4DuGkzuRhCdq9hPZhapnjdQnZRZzld
 6RjFrvgx85kutiyJA4pucyg3G956omnhG3uQ1SsSgudyVamvaroSny7cShdc1vE9wD9Mf7E8yyY
 zHIJzDHXe4XIF0ley1uY0ZK1lL36HwyXcmL9r8XbHuLt15Z9oYMLzPu6bg5P0j2abLdabKPxKLT
 YwIkNrUKTdZHkhrHluBIDeacOAW/Qg==
X-Proofpoint-GUID: IG7CQYI2AOt5psJvIg5OvvxEkqtmlAqH
X-Proofpoint-ORIG-GUID: IG7CQYI2AOt5psJvIg5OvvxEkqtmlAqH
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e0bc34 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=ZWl6vx9Q9smWLlo6MzwA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On Tue, Sep 30, 2025 at 03:57:05PM +0200, Luca Weiss wrote:
> Use the correct compatible for this phone with standard Qualcomm
> firmware and remove references to power-domains from a 'reserved' node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

