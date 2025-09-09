Return-Path: <linux-arm-msm+bounces-72736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5636AB4AB80
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 13:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36DC7173431
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 11:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31F9D515;
	Tue,  9 Sep 2025 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Er+nx3KA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF293218A4
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757416451; cv=none; b=SzcChB8Ca2Fj4/smnFjCg0IpX5NrnZsi1Adryxmc0AIgHqyIVzFv+MjBVGJJ0r9VpsypBmX8b1FzfDq8vnKGZTCQFr8CkBoPDAA6MDWrQhglDz8pknIvHJ+7afTvWd7rZwXDCWAmQ9mcsWls1QGf4+1GUaMr7cenf2MwSQJwa/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757416451; c=relaxed/simple;
	bh=0cWRpb4Am+Av7tp1p5YR/jKks8jMS4WHToTiBHvU3kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=go/EJsS0fkZwRrDsQW1nFEgKfgFVFxIwSNGizES+2QUtgMJUVyR21v+ZrrqHfde1SO0PQQLH8o8dcC3zLQpDfYIf3akbtAzsZqVMSCTl/efIqy9DtUv3B5k0XylQnotSKTou0wFNl6cC0/4mvYywh1oCfjiZCNjq0aNTa+HvfAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Er+nx3KA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899Lsh5011334
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 11:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+fwEbLviTXnP9T0PkQ6EB6hc
	vv3Rx7j5rDURlYin4bo=; b=Er+nx3KAG2MgTrbkwII6TsOGrwjCXkD0CSo9LkcA
	bPSJ5kfU9Zjh4Xs82cmL9em3BmeLJWznMEMFWHTwLJCFHJCIOVx/u/Bk+NkXEU6D
	+aMBsB2MUOmqaqRsUeqvMSSoIZybSbgMMAP2la3Si5fZ7a3cDsKCMkwM8ooC+kHC
	lWgtjZB+BRd86Z3KX898GEIgJHRMqmW1TlYdtoY0Bc57L3T/9/2b/KPATxlOBGOp
	vcMWQzto6ml1crRDd9vXX5Qcuf+05Mi/1qbDf9Xd2kRe26jnd0ugyds/mUXU+6IB
	wZdyg0rTQsGV0wY6XexuthJPB0FoaeXjHmSi8zfQaoOexg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0r020-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 11:14:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-724ee8d2a33so116430156d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 04:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416448; x=1758021248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fwEbLviTXnP9T0PkQ6EB6hcvv3Rx7j5rDURlYin4bo=;
        b=mZvacIViZrjmc2UOc1qJHz7hkLMiPPoRKEVp57yu1LUboE6dCG/V2CQWTrNnih0dMJ
         ouQK6HwTFtAE4jA8f+wwujcsGwGgtqFqeSlu1Wk7Nk3P9SAQep23cVnyEI/4RATcqaxO
         vIg4YcXWTRgNHZPdoAgC/tjvtnK35MBiCdqbhQPVAoUNIknEHK/ZtE7R8ur8b5AzFQsp
         sTcMI2pLB6f6/PVhLR9RJJetexW/IaHn2WKBrHH2YD3qRhcupiPNBf6ihfme/fMng5EE
         xpvWoA23zYx8AlOsoqcAGpX1LaV/CDbXsW1Y5nHcu13gzbcbI11ET6mqoskB7bYVyopM
         QlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu8gmFo2DZN+DPuGm1OGnJlZVUV3yzl1u1rixfoSvCRm9BE6nCowXQRcccr5iGnKdbaikzzSylc2PcnjJW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1IS/+vyvwIwERl1OFMQDI+kbdvK94tuCs+4zKtMif/Mhi/ZNE
	+XxJ8UKGXFKuXFO+LQTclFbA611Ikl2OAsvwUZlB5/NiMMU7QvPqhT0e7PBD0WSYTwcllPkVgSb
	ZP7GagnyvtEHWrzx2z16+Pr8bUVxLIMxEyRu0UAbmHC0tPsCbslb0L/oxjqMjYqH8o14F
X-Gm-Gg: ASbGnctGf9ihMj1bX/V16mRzJJkVJAXikWN9+qsQvdZtBSy32Sjd97AhXMMwnBzqyf+
	nVSLan/wYRD/jgpWR3FJKT9+r39bEDePTyjdQmvJXCCwt3O5iVK9HuGUNANGX7VPNUzg9d/HCxl
	R9LVTtj5jBX5HD1HJACUwllKGxuyNssXUYZZ0KH6g5QHXuhtOYk9jJmQzd9G7p95MWOd+4dD4XL
	V2tnRfs3hFPyYQcLzXUcWWbplubnbM7hEArM0esgriK2EQnNtMf5mSvrPJkIg1ZxLuRKxB47XuK
	QCAmlsqSo+xeaS4lYOar0AmJznYgY7y7mUln6u9MUAxo5Js2x2HfwqMAI7Nc/5y4TTrHfT3uf+I
	ttVAW3TItxFaQH0cRrng4AsKhM3ZgXO+BBHTx4+9mjaHQgtlWzPsB
X-Received: by 2002:a05:6214:2246:b0:70d:ee9b:9cdf with SMTP id 6a1803df08f44-73930fd5d84mr129752696d6.18.1757416448070;
        Tue, 09 Sep 2025 04:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuYUXflq31tC9iMPaPvSoW8UAsh4FK80jrKd85IRJdZ5xoSa42MbchBXglv6LvXrIwyp7+3Q==
X-Received: by 2002:a05:6214:2246:b0:70d:ee9b:9cdf with SMTP id 6a1803df08f44-73930fd5d84mr129752096d6.18.1757416447467;
        Tue, 09 Sep 2025 04:14:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56817959addsm451687e87.81.2025.09.09.04.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:14:06 -0700 (PDT)
Date: Tue, 9 Sep 2025 14:14:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: qcom: dispcc-glymur: Constify 'struct qcom_cc_desc'
Message-ID: <m6xwficrn7me33hnkaeyjzywmb7qhawkfcj6lomajux3voe4l3@g6uhhrjcgegr>
References: <20250909-constify-dispcc-glymur-desc-fix-v1-1-6cb59730863f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-constify-dispcc-glymur-desc-fix-v1-1-6cb59730863f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OF0C__hOcqkGnYQDcpUHOlZnI8n3q6gd
X-Proofpoint-GUID: OF0C__hOcqkGnYQDcpUHOlZnI8n3q6gd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX9vB/A3QdBf0c
 Ovw0Ulrnq33laZgREBIscf2LiHK367wJpiM7PPqs3ShcOK8uWqcjrkLABN1WaHrrdjaouIv7qkt
 Co3pTOufZuYctNrreqLBIQXsaELDTA6vfT+AnzjqPd5w58I1ELm/8p7rvvaUTQbCkG1cn4WgBcW
 QOY7lJSrgP9xq+JjR09NPkpyvjbMtFyAHElWb69KD8s+l3lgKj+/bC1AkezbyGTmeZOOdWFQ+Hg
 Jz0srOt7YEIJUPupPSsHYxF1lnRtdQaiZLCo5jwyBkUxRiKxCHs81xqyQcz7HDDe/kMHqOXrjIt
 bP/Bwp5Qo+Qq4QeBoT+Lw6FI7fsX9/U9lJ0JTwPrqob3W/vzXyXTK0ZmL9vSc/Fh2kqrACaZ076
 jHrD7gwf
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c00c01 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=eHRkPKsZTjWJbIN5jncA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On Tue, Sep 09, 2025 at 03:17:59PM +0530, Imran Shaik wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
> This commit is similar to [1].
> 
> [1] https://lore.kernel.org/r/20250820124821.149141-2-krzysztof.kozlowski@linaro.org
> ---
>  drivers/clk/qcom/dispcc-glymur.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

