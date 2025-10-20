Return-Path: <linux-arm-msm+bounces-77951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A05BEFAFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 09:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 43F834E5AFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 07:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132E52DC79D;
	Mon, 20 Oct 2025 07:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drXT9rVh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA182DCC05
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760945788; cv=none; b=Vhkek8ojbD3IMVPuGE5oFRpu+mAqZDkYT3cE+QWNtR9REeDQDdksqu9uFSirkWJEjLffJUnR84h2tba99fS0z4NAOH8YT5VTnI99GZJgatARBf9QalcPAbhH/EJjikwev3m7PDN6cX1YBF5Xw4NFAsXbFFdbG0XiOvm771vz8xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760945788; c=relaxed/simple;
	bh=Qy1G+EoRAXMHmUHIgMwmRFAQ0JRvR1cM9i4cWeDZdqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fHBt/ORopL4E+wwU3Hyk9yu8BfIzYaYT75RMtH9QwJsSrmjubBs8BGgUNKwvu8BkOE7f7MEdG5OuYDPSqG4/AFjg/OKsEGMROkh26UYJh4wuz91yH+gZZJdY6XfnkD6WMHIccwxriWidWgffEfJyb5wY0KlDCCq5bWi1kjw3QUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drXT9rVh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMlLEe012696
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N054C2w59vHr48/aMRyFcCjv0bDt+WkljDcX19Q73Nw=; b=drXT9rVhle0ylq11
	xwdFLr8UXRZII2v9blwBsUMCSbzPOjniZ5Szn0Gu3hgUwXPjw1WE1ZlK2Vgz0LJh
	T0GdJiPRVEuYF6MpliZ3Dy0ePaXIFtn3UJDHbxJAN5vF46SgqE9K1/gxnWJE7Upo
	qMtsYCO8Sw6x+vxSSgNW0u5QC3bMcc+h9qzmqt2C6UGfh6KXt8tSx4DejUABHXLq
	fSr4frdouj3b6keRCY99PwgHVb8h+T3hjqSLtY9Y7VbtjedgtqSPcmm/WeGyBszp
	Cpzrp7feKUjD6ClT+sqDv0viKHnHxfFrsRSEGFiTatbkvGmQC+0YZmGVspjkyMvi
	N0kiMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k3vcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:36:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-886eaf88e01so183700285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 00:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760945784; x=1761550584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N054C2w59vHr48/aMRyFcCjv0bDt+WkljDcX19Q73Nw=;
        b=plyFMmaegNSONTWVTFM29YDbbwU/6Cp0IX5k98CMyN6nf9uAUv/ePRdam1i4/J3nn6
         IrlrqsMBeVD95vcAdmGthg1OfbxC7P07WTYwhoYqCAB/zqNu90NZ+8WU4gYLwWUiSP7J
         wKYQJ4kwDBtRW5YQR9+9tlawBUO4z0YHXtMHlXxpykM1GjZt5MjK43u9DvLwiDsLEA8F
         Z0WXg6HZbtup8EDq+OgT6kvP852HME3zdIOg7r0NjN5iL6+qk9lD7QU11G/sL+PjBMUY
         +u4Wl7mcjpF6MBCll8IQkl2pIxrjFgi6Il9atvuzdFuN+8qSeUDyyUJhtm119yUa7pl3
         U07A==
X-Gm-Message-State: AOJu0YxvlV5zEs0cqGRDgj+jBeF5kXv+sEjrPFIzyZgSVWVIa71noO5o
	8/O5SJaJAfCRaI6oxDZDI6thRkAoZBqNnyKF3omZh6XseDvlpI4ZMDtO5VxCLN1EOM+sz9KE1tT
	8D8fMO3qEdfLfou2iUjYV/yAC1aNJxlunphQwe8sN+v3mw5NzcRQlXzSLzCj2+GlM9I1X
X-Gm-Gg: ASbGncutvOKnlrWb7rKTOMGUNRiv9Cprv2hucIUQtB5vHfRcmRmk1VKXct7LXJaHmGN
	Hc68B64EG52EWIOjo1SaT6wQwm3wlVaG2sdNA7c8US2bSREDlS9m+tByVMbMhCnlrIJelsh9rwa
	2cb6B1lI4xyUY8YTkxa6HR8Wc3nAZ4rNRJbSFrxxPPHkVFT0RzlaP3MXHTgo6i8D5l3Px67NDqG
	FXM86hsiJMyQZ/Wf0UpTi9g8dJQ7y/nb2NrmQATDkvf/x9fZgCuDiCbjTD7LwyVAu0X8/5chLuX
	UpFpZkVDPvLtaRo2T+c6jhcSGsLUcW+nzS2ORHr6ifzFGbsjcm7+NL7PVMQuU51vZEBwyO2piZN
	HbhS6frDoqj9iWHULjxOFXAVTLjq7hiaXEfGWLb2UQRa8OcTab6noGvLd
X-Received: by 2002:a05:622a:189e:b0:4d7:e0ed:421f with SMTP id d75a77b69052e-4e89d207c42mr118106611cf.3.1760945783846;
        Mon, 20 Oct 2025 00:36:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9uBljlSH/Wv6NYpLzdajo1XNL7fsX3OsNCz/tXB8dlR9uxsqAlRBW0Renn1fwMMuIYevFBA==
X-Received: by 2002:a05:622a:189e:b0:4d7:e0ed:421f with SMTP id d75a77b69052e-4e89d207c42mr118106521cf.3.1760945783434;
        Mon, 20 Oct 2025 00:36:23 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb526464sm705231766b.64.2025.10.20.00.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 00:36:22 -0700 (PDT)
Message-ID: <f725dff2-df3f-440e-bf26-6f828bf0486f@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 09:36:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Fix compile warnings for
 USB HS controller
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251019115630.2222720-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251019115630.2222720-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ai_XvQTouA9hYZOQM7V7-FNZhJkwg8-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX7MQ3NZtxq5cu
 ciH5ZubI3s7OdNd2PY00+nmmgyFTwwpfN5ximk10Fy7UNsfwpkESK0I54yR7zhpfjwEC8fw5zFF
 pRSsM2mE/2cDez12raPzGaJol6iP0RJ/Q4Egfu6Yu/qI+N5WwSKP3KK7GGo2buIuB3zKHBbANjc
 sTiLETFQjwEJrNM7FIT4RJwIsmLSqXbtkDAfgXAgwZ0BEV0F2IWp752WWqQaKTAU4pLnbmVmvxv
 KQhiNlkJAO9jldjmd1mmQEVqmTZzuXvGgbIqOpm84TsrgfJD7bz+KB0cU/DEiy77UPniwF1VXXV
 MYm/GYKo7C65e9rlZGhNQZrMHoUp1+kcg/Ilw0HSi6A8lrwyiByNxm9dwQwAD2OYZrOMieWzKgQ
 M/13avGNt5xSjHsMTPH55+7tMK/MkQ==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f5e679 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PrRowSUOeYNWhlAafI0A:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Ai_XvQTouA9hYZOQM7V7-FNZhJkwg8-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On 10/19/25 1:56 PM, Krishna Kurapati wrote:
> With W=1, the following error comes up:
> 
> Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> 
> This could be since the controller is only HS capable and only one port
> node is added.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

