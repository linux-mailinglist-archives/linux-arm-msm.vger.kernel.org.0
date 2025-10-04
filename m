Return-Path: <linux-arm-msm+bounces-75962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC7BB8A1A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 08:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71B823C7ACC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Oct 2025 06:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC61622F76F;
	Sat,  4 Oct 2025 06:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEJ/mhuL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003612C86D
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Oct 2025 06:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759560365; cv=none; b=mCBt+W0YpWKTjGCfsrIcSKsMa5m4gNrmRe6dtNj0IiOvqTKx7RFOJmcgymptN5onEjgoDmGjCzsq/fYdO7szU4iXOG/fqBT9os5044PY/KV94y1fFqn+gZwyIhh4buD3ipB8dYXY4ZqJ1ZdnKXOAVmOpPUtJqoVXGKEUsGvGaoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759560365; c=relaxed/simple;
	bh=Tr6GBYqy+IzLd8uqM33CAtRY3paCCFvnoi/vQfjzRKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frQQK4EJDL0Bw4gFdcfLWD9YzKmdf8bawsnec1YcDm76srSoN0emgaXbcgDbrDysU0qjYrYnGXNdiGVqSgyBpz0BxCRW5JVYNMMTRYjWXfp2TIp82U1dmKWBKFQOmWin2fHX6hbhuAgdMnccshmDJ6mCZn138vCaXB30zEre6lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEJ/mhuL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5940LXpX026218
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Oct 2025 06:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T/5jf8viW1Ms0TYa2j+4TJfG
	uZOdpLLk19JW7AHS0TE=; b=nEJ/mhuLLXgISTtPjE5OngC5ziHVqscmEFKPBtJ6
	EeQKlhY88+L+pxPR/XFVAQRSQRG4ZVPTfpuRrzEtbZ2FMXaTlycOjthLDUUISWC8
	S1dmkdKp6cvzX+Oamu8eChprnIG+Wr3lJQry7WTXL1N/gJKba/IzGY3z/Y0/VQbb
	fr8SyagsLV4so9uMM17qtA2GY54fP6Zyppv3YBTGoBbQ6orwUAvc8Ak6dpRlBBfA
	dV1X8yhRqpgVlRpe1ZedCSZXhbGQLvtGkYUx54BPQlsRfjQoY4S37YUuxhS53vFL
	H3DZEy93TbhBJ7hcFrXgcVgJxJplhHSfFiOx+6gI5cU1mw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn0gka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Oct 2025 06:46:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-872d2ad9572so669113185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 23:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759560361; x=1760165161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/5jf8viW1Ms0TYa2j+4TJfGuZOdpLLk19JW7AHS0TE=;
        b=SYIEXRgKpo+bVJEzyYtoaH8DKd7bBckpMVS8cNo5SiA0vNleEbRkdu4/B6VBW6hRoI
         wQ1fuSBdF0uJ0yyKtJp51PFogJpsOMReGbmUvS8tOEIpetiWkF5NV5kbIm14WQWCvqVb
         Xt6cjue36+rX8o8wADC16KWoRwPs646mL8xReR5kI/DOjspbkskNtp/H6bkz56ps9JuC
         i1kF43x8gUWYJebc5EcmpUZKShSY0VygWsu1eyf42v/r91Pw8QNxLj1OMuJAVTdZ0jXt
         jq8r1/11UuMksqPBGE9TaiNAB2Nw/DbB4/IvNCoLB2LN1iCs22PJOJPsHw2pP8eOq4bD
         UdYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMViKMoRtpODNxQHqpa9IKqOQpGsculwY1bYIIKlRH5nM3JkHq1cDlR3E15BxZauqIxuS7U8DyTjcNqVer@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+DwJi33DyAVYIYrLWAHUY76rESclt9IHeIp1aRUctkjtbMmOl
	zy4oV8loMsU5hALrAtI+pe6dJJe+tHiU8aClHINjGng4lEsOvPu/S//hz4xw+nT5fK78ROS51WO
	sivGRosYLCbW7S+K0sQ2jr3CXgpsRriV0QAmIag+ww7aHcdd++l0ZhkTZQvu63dGoHQpZ
X-Gm-Gg: ASbGncvLUzAIx4qLM/vbzUxVC7oMVEGUAnNmYPLg/PyFQrQjixwktLxcHmRYUyS0iaG
	iNpZAj0Syr9VgfoRe9yZI/fedGDpWGboHFuBoM57VgvWhzxkY77K2n7iMoptBsyRajwkhkDF31T
	dcjhLdTNtXlpmB5H5oS2VaPZX+ENUmBaPTFCuGIPlxSH+kL/x8tr8Ls6KsnMzue9ddYGiuRtf60
	FkKimSz5ICWlKj0YAg1YJVg4kai1l7MefkoSAJixQfXfomdeJxO9YBdUPb6Q/KpS0Me9b/JbUh6
	zpCBdVRLiiL9rQIGoCWb2n75JL2BiCFcox6sM8B78kVelTEIJF5rsQaC8GE5Z3wqi/A92JS4++n
	qBfwnOZquMtJYlV/24DuXt6c7qhbJoFr0WC6/oCr69wUxwbmo72T3YPLSjg==
X-Received: by 2002:a05:620a:2a0d:b0:83b:5f20:41a6 with SMTP id af79cd13be357-87a33f1f29dmr848489085a.2.1759560361037;
        Fri, 03 Oct 2025 23:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUMkJm/6OV7cxicvapSEjp5hlA70/rYB9hv2U/Vt5pJr1Bht3HvfH+Ym3gM8TNKn9utq0DZQ==
X-Received: by 2002:a05:620a:2a0d:b0:83b:5f20:41a6 with SMTP id af79cd13be357-87a33f1f29dmr848487685a.2.1759560360579;
        Fri, 03 Oct 2025 23:46:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-374fc0787a2sm3101491fa.61.2025.10.03.23.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 23:45:58 -0700 (PDT)
Date: Sat, 4 Oct 2025 09:45:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sa8775p: Add reg and clocks for
 QoS configuration
Message-ID: <ezlm452ti4lrrkjkriz4yasbbsma4vw5grsxhg4ggetvku7r42@aqhdjeyc7elb>
References: <20251001073344.6599-1-odelu.kukatla@oss.qualcomm.com>
 <20251001073344.6599-4-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001073344.6599-4-odelu.kukatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX6A/WI/6bNWNj
 jKXW2AXq74L95ixySETINmKA1UkcHF7XJWpzPy11ryF8Pxq5091U1KGsvxQUDhlP7Mp8Ech8qDD
 bRyeaYH1SHfqZDeP68NcEZLzSgVLiEvHOy1LskJW2/GOOCg+M5JfgR/bZz+1/YK5olHpP+UH7LV
 XvBeTHb3HvZPMKmj2+0M5sbIJHetkOWVbA0Q1yrWOsAFRSFfTcSyS7fYLKf+pYMIWGxH/q13SR9
 k8x/8oMDC8ch6FY16Sn5DaE/o7m5r2qEmm1st7p87DQMA04vZIR8GNTEs4PfGEKFVisoMtDSBWT
 zqlAHiKNuuGaR6vmNOEtqQZ353jW49GNUEKTUL4/S3oPJQrbk80xuljFFQD73Miqx7D8ZfM89f8
 D6wC/cO+ESrlDdHTYKxumo47mwALzQ==
X-Proofpoint-GUID: RKPhpS44Be0u3pWGaWg6TGOUYrpgnz-5
X-Proofpoint-ORIG-GUID: RKPhpS44Be0u3pWGaWg6TGOUYrpgnz-5
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e0c2a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=M9tGKf1UEhd6l-wMVe4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On Wed, Oct 01, 2025 at 01:03:44PM +0530, Odelu Kukatla wrote:
> Add register addresses and clocks which need to be enabled for
> configuring QoS on sa8775p SoC.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 163 +++++++++++++++------------
>  1 file changed, 91 insertions(+), 72 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

