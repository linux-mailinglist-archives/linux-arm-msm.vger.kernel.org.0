Return-Path: <linux-arm-msm+bounces-20960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEE78D3A62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 17:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73236286385
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 15:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F5D15B97D;
	Wed, 29 May 2024 15:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lHOcXiUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9507BD2F0;
	Wed, 29 May 2024 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716995478; cv=none; b=iG6yg8iztnvpQIGl5Lte+2nVDilO5i2lmp1/Mi9o63aChLteQU1juFZVhVzcRYY1WNC+HzdVUSn9nt7o3c1+5QR8WPNqYXC+CRLR4t7X85gCQLcONkpqmXHk7RYIv7llr+66uXJcnlh2r8Enf8ntvbKK8tYzYfMtVRVULoA02mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716995478; c=relaxed/simple;
	bh=LfsyLBuOEebZXf0FmvHKrivubLb0L6gjBUDj9eH0Mvk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ik92q0e8bQD5YfUE4mPmexsWfXf5wx3+UDgQCR9+zyfzwCtVL5LewAOy75P4IStSPdzWlmcxgTPIkcEWpUS70gOG1yJKi+Ie+DUBJXHPhOAdOZ1kuP8BIgSCkYpSpod1yVOYWxajbTUTC9W1YBsdZvXlh5+n9Iy0iSrYSq2yNyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lHOcXiUI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TBtabU021170;
	Wed, 29 May 2024 15:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=owCWHyok5RQxLdu/CPu4P8FF
	4Lb1VB7+ZRXHc1JgNB8=; b=lHOcXiUIFYq+7o7LX7m8c9WsSCx1mx48TDUcVZWf
	TPhARGnopuoQXUrj28nmdv45O7lRalQKej6nULa3/RICoeu9hEajjXaJHbUhTaYk
	zaXcM/VaepLISawmzfP64yXe6pgSnhyfJnjqh6AwkjPtJKSd2UkD2I5ePrNXFW7c
	Xzax3Ye9FTj3lDRt6EfXKfiuxnh5C5v8IGCvGXk34ys62F66rEEFMZzs/q5iwg5F
	xwA7v7966TP4RJTtk4IXISMFw2YCNbnLjwBmH1t20pDQbR5/ZmcxQNxnrJuFSsCI
	JrcIgkUcx6vSlTMmvpbwv0xP4wVHRNHS7Gu0cZWytIL7nA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0ps682-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 15:09:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TF92ca026153
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 15:09:02 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 08:09:01 -0700
Date: Wed, 29 May 2024 08:09:01 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Amrit Anand <quic_amrianan@quicinc.com>,
        "Peter
 Griffin" <peter.griffin@linaro.org>,
        Caleb Connolly
	<caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>, Doug Anderson
	<dianders@chromium.org>,
        Simon Glass <sjg@chromium.org>, Chen-Yu Tsai
	<wenst@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Jon
 Hunter" <jonathanh@nvidia.org>,
        Michal Simek <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH RFC v3 5/9] dt-bindings: board: Document board-ids for
 Qualcomm devices
Message-ID: <20240526115810183-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <20240521-board-ids-v3-5-e6c71d05f4d2@quicinc.com>
 <20240525-parachute-plutonium-ef8d1472ff50@spud>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240525-parachute-plutonium-ef8d1472ff50@spud>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0kYVmVeWY6R4bZ8uKCBfVzN1tngFO0WX
X-Proofpoint-GUID: 0kYVmVeWY6R4bZ8uKCBfVzN1tngFO0WX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290104

On Sat, May 25, 2024 at 06:08:46PM +0100, Conor Dooley wrote:
> On Tue, May 21, 2024 at 11:38:02AM -0700, Elliot Berman wrote:
> > +
> > +allOf:
> > +  # either describe soc or soc-version; it's confusing to have both
> 
> Why not just use the one that has the most information and discard the
> others? If your dtb picker for this platform doesn't care about the soc
> version, then just don't look at that cell?

The dtb picker for the platform doesn't know whether to care about the
SoC version/platform version/whatever. That's a property of the DTB
itself and I don't think it makes much sense to bake that into the DTB
picker which would otherwise be unaware of this.

> 
> Likewise for platform and PMIC, why can't you ignore the cells you don't
> care about, rather than having a new property for each variant? Nothing
> in this patch explains why multiple variants are required rather than
> just dealing with the most informational.
>

Sure, I will explain in future revision.

- Elliot


