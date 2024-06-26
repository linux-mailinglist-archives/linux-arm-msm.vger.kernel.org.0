Return-Path: <linux-arm-msm+bounces-24368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31677919999
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFAA1B23F3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10D3193061;
	Wed, 26 Jun 2024 21:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XooaA0GG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF8714D6EB;
	Wed, 26 Jun 2024 21:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719435877; cv=none; b=iG0wnl88r1BeW9JUTMvLNSPC6o7BjCwEtlkxFtlZ4jWC8kLdPVtu+KlxNEkv5zDXNOZldMlAWt1BxYB4scIp+OAKV176rN9JTumBWKz+uDlPHu+WjxYCm7/GGIPOHsc2kC30CrP9HphXNGrXwzx2vBgZAiV6LUSQfHlt5kp01kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719435877; c=relaxed/simple;
	bh=Q0aaA0XUQJsXBdC545uW34XBB9rUvYD345m7wqmVwBc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrmkivNY9l3cvAmWAQ/UBzZPZWp+b1WD+1RCtnORNC6Aysa+/AjlbhPM+qsOj4vfIIFqk9Br8x1h8J8ujJyAvt5i6/3YLrYvU3y59dlwPVma92P3Ca969JXgq4UCec1dBu2LV0C4Jk3t1rHQK8CnEcCAaUs1oRUVYZnXrBC8Sx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XooaA0GG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfOGS018807;
	Wed, 26 Jun 2024 21:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JhBuEBU8jsGm3JIgZ1kdYPhV
	HPWq+odUpDKyvquR0jc=; b=XooaA0GG6q972nLyzhGp2JoMKfO+aRSHxyev3dqn
	LyAmkJqL5Eq9LxlgOvhXKA4ZAAt7YXkSx1JgjRYrGhB6jzR7NlQ0bqcaBVeBwbly
	gallBRTwUF2BuHoJIUcd4OJuVJSGEvxMMZY6A6kdKSLJ70z4URD2yEYYwLL2r+BT
	QFd5iz0s/jU4Yovp13IcL6kwvUL7IlOJXYtoyAHo0Ml8BCxApEHIYRCWcDzKHEwe
	H8TB5SfHSLYqKWbfQzhTONc59/CQTUm1qNsexicqZm6nDxVdhhFOb8rGBLOJHgQl
	Jz2R+PrZPUDFqeyw3DmtUcuB9DfSNh5LvZUcgxg/rXNlNA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400f90htx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 21:04:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QL4SGD020967
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 21:04:28 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Jun 2024 14:04:24 -0700
Date: Thu, 27 Jun 2024 02:34:20 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring
	<robh@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
Message-ID: <20240626210420.uapn2dauiskluidq@hu-akhilpo-hyd.qualcomm.com>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-4-quic_akhilpo@quicinc.com>
 <f5ef4e3c-66e8-4833-86bb-c38658b923ae@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f5ef4e3c-66e8-4833-86bb-c38658b923ae@linaro.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: itOFOwsUpOccVDNijsw_GFzwdTFpuf-j
X-Proofpoint-GUID: itOFOwsUpOccVDNijsw_GFzwdTFpuf-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=599 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260153

On Mon, Jun 24, 2024 at 03:57:35PM +0200, Konrad Dybcio wrote:
> 
> 
> On 6/23/24 13:06, Akhil P Oommen wrote:
> > Add the necessary dt nodes for gpu support in X1E80100.
> > 
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> 
> [...]
> 
> > +
> > +				opp-1100000000 {
> > +					opp-hz = /bits/ 64 <1100000000>;
> > +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> > +					opp-peak-kBps = <16500000>;
> 
> No speedbins?

Coming soon! I am waiting for some confirmations on some SKU related
data. This is the lowest Fmax among all SKUs which we can safely enable
for now.

-Akhil.
> 
> Konrad

