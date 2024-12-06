Return-Path: <linux-arm-msm+bounces-40775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5543E9E6CAF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 12:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19CC61881CB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 11:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A401DF732;
	Fri,  6 Dec 2024 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o75NoZGH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E1E1B6D04;
	Fri,  6 Dec 2024 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733482868; cv=none; b=eCcIhU+d2NTPJHOT5L3DIqNPVR6wtEzDphxXrjcdueOHvoKM1/bojbzGs1l4SVsRX80PNDJfo7etcoKLskXzTQLI2Tq4hrb8C7n5XKesDcUXR6ucczeN8YlUfbYR153w+lTOlADom/GWBBdTtMrBjAcmsg6l/qkOq4PwPB6STYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733482868; c=relaxed/simple;
	bh=lO/tyTm5+yR5ePg4IGo2uulBxL8vFx/D5lpPw78n5/s=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4YkcaozeAhI8Kz/i67Np+X+mpidGZ8JxLfaGpfBtn5fcykUJHhknSvE17iVGO4xBas0ysE6pGsroAhABZW/Ku07mGr8hMJxe8S1B6jiQ3LaJALQxthw9YQ3m0qJfxLRRs+NO8h4RTwl7o0mGeQgpf27FrtzKpV9cXutVx+88TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o75NoZGH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67Lh5v009794;
	Fri, 6 Dec 2024 11:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OrZ511VHXj+LXC/Z8lUQgB78
	T62iKhV0p/c7TUXR1oc=; b=o75NoZGHjuTQYKGCd0tofmSVwv9lkl9Ie9Cw85lm
	ZilQw9JL4Q3V+eLEfmCM19cYeYSgD81HeU1APRnU2sYZjFfIoytj7HTHEpDSu7mz
	FccUzozvEcNaUT18c110HL0ynHYvpLVMO93Ge8yYRxuAOt0PIJv5LjgWaCShSZK5
	0x0w3zeyw9kr4WnoOWL/lVCopbEjsiobBHXy5XsfXUQ6W0tjvJtAPSUQpb3do8yB
	D5MBiCc03LyRQ0RRL0Do1C5Bb0+5vvNDxSXNiQAXtSSFBoFRA/zTSOQCbJTzV5HT
	R3P7a47GVtxCu8ODLnV6sL/ygXQuw/sPvN6NPYvSY5O0Nw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben8atb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 11:00:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6B0xK2005391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 11:00:59 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 03:00:52 -0800
Date: Fri, 6 Dec 2024 16:30:48 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: arm: qcom: Document rb8/ride/ride-r3
 on QCS9075
Message-ID: <Z1LZYOJbl4snJu/u@hu-wasimn-hyd.qualcomm.com>
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
 <20241119174954.1219002-4-quic_wasimn@quicinc.com>
 <9fc564e4-4bb5-4529-a38b-88d93684805b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9fc564e4-4bb5-4529-a38b-88d93684805b@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Fb8FyK6FS4-WnD4wfmDlAdvdcNstOcCm
X-Proofpoint-GUID: Fb8FyK6FS4-WnD4wfmDlAdvdcNstOcCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=794 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060080

On Wed, Nov 20, 2024 at 05:43:12PM +0100, Krzysztof Kozlowski wrote:
> On 19/11/2024 18:49, Wasim Nazir wrote:
> > qcs9075 rb8, ride & ride-r3 boards are based on QCS9075 SoC.
> > 
> > QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC
> > without safety monitorng feature of SAfety-IsLand subsystem.
> 
> SA or Sa?
> Also some typos above.

SAfety-IsLand (SAIL) was intended. I will rectify it along with
other typos.

> 
> > This subsystem continues to supports other features like built-in
> > self-test, error-detection, reset-handling, etc.
> 
> Which subsystem? How does it matter for the board? Drop all marketing
> stuff from here and rather explain why this is not related to qcs9100.
> We had quite a lot of talks and I am surprised seeing this without any
> earlier references.

It is for SAIL subsystem. It does not matter to the board but it is for
the SoC.

> 
> 
> 
> 
> Best regards,
> Krzysztof

Thanks & Regards,
Wasim

