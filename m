Return-Path: <linux-arm-msm+bounces-52257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 026D1A6D178
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Mar 2025 23:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECF54168B19
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Mar 2025 22:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C588D18DF8D;
	Sun, 23 Mar 2025 22:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkyJ96I9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DA33595D
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Mar 2025 22:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769269; cv=none; b=eUaMe92G8edPvDcSBIDgOMkKpueoZYWW9ImqR4q3ZCB1BVwPSd/6ZvTdiXcaDTwIrtBVziPeQ+5CcN0vz6+tgPqTnkwlW3UUYmH2Vn8SVyRrhKnVucmbzdtqO+6IJvM2k7th8mut+plJdH+R/AROfXOF+PqX+1dSncYAyg9jO4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769269; c=relaxed/simple;
	bh=N6o2IVIcueSJEfQtdTn/TMfbtzyTe3mwQd4zwPk3MVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/ZTNz2tvsa5VDJub1mAr6dnQg2YAPLUT44ftYI4HtT1JViAdGNlZ5/nNpwFgxCbjSU4gzfdhF6Jsb6H4NFFq/I1LAe8WzPIUdgERNcIJ1mASjACvtzryu7JAx+pshREcQfH2bxiI7a5+ILwdokKwlEDnfjWcKEWn3Pk8ojsz6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkyJ96I9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52NMIVme009972
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Mar 2025 22:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3snEPIXC1LTCmcdEm882vMYk
	A7vVU4RykjMrowcRnf8=; b=SkyJ96I98s3xW38mPJufkTHk4hoK51nGTNxFZy9s
	2x0WJuuaObjSLM9pT2JslumxwDblJ52lSu/qDLvcuzDEy+Pwet+gcYQvXHTUA+j+
	dWOagLqERuppKYzEfQl+hZTn73W9DM/1EOGzWLGAQJInS1yEAU1PYDK9qTvLED6p
	2lu/HQT6JMVaHt5lPemxLV9OQWkvLov38Jn66BZn71m/0/+qJ/HMi7djdi4YbvkD
	JVrvTznCZOjcMIA57oE4ph86fD3032tbMsKKiyuvuZdfsuqpFD58rz6OJAAm/J1w
	3bZvg8VONGXuE/hvFVAE6MqFYh5sTcEX4P8LL/NOcC5CQQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hm79jp0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Mar 2025 22:34:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8fae3e448so77372676d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Mar 2025 15:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769266; x=1743374066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3snEPIXC1LTCmcdEm882vMYkA7vVU4RykjMrowcRnf8=;
        b=p8A7OEBRNTZ0yOUvG+Nwcl1ks1e+nG/bit0LCvJqOt+cmZ1amCxeME3W9Mw9k/zacg
         z+QlknzdFqMNrRV/sJYY2kGrk49B/4hGZ4awGK4+6ZDOOfrcC+v7HF6TrVle2OrS5uTx
         kefGSqnq59a/i8+ez9MqpQBFU15muI74qRn2QoJF1jeabK1NIxBiVER9ozAUv8HaNbex
         Nud+40nf2QNSWb7z8nBndRQmJOzc8yGKPrpicNTl/i4v1CAa25mdlHWJ9fdtnwVx+KfA
         jegcaZKV78qUnsNdH+SIcMIRK+WR0oOQilIagkwF9X9LYbYMFiG2ngnC+W6XEbw0e9eP
         Q6YA==
X-Forwarded-Encrypted: i=1; AJvYcCWORj+tQy0Cu46hQ/AfROXK2ua8ejN1n1Sz8Kaju7ol20VD70rJwJLK9+Yxy39UlYeShpHtkfzUR6qGqn3t@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ArJS4lO+3JTMYhHUTzvkTRe+M5kUAXuW1zuJnN1kgjWUN2A2
	HUeOiWBz/vf7I5KZTOZ/6JeTcagb30CXFlRQh5dEI5iG9rV92dgQ481aWVqrdwu9J5n3eaeYFQW
	escKIfpzgt0p42SLgmHbNUZMVJv3ZE22o42WI6hJOwpV8CWVvil5R5BcecwNL4B43
X-Gm-Gg: ASbGncvE4ZzBEvHMFnjwb+4pALxg+nVBIjY14KOf6Zx9JQZkPcGfsINYvZ3yOmPlQrO
	CrZ65AxEh4kDVcUGz4roB8WgXagG1UDwC2a9trEeyWcrgN/WhCqFhUGAIwQuThgpMYHml3ZmbOa
	D6V2RmjUMdb0kJTgG/DQ7ZhFmj/q0BjDUq5qqHDLDZVtp0YReyQmqOoJ8kmzEIGUUKxueK/FHkB
	xptb8A53b+ceYdMgjdj2e5z2yJf6bAbTwHidb/w3xi+RfPkpzfkzSwpX65U/FivE00pF5QO0/xw
	MPjAigm/EdYxUqVRYXwm7y1+rR3TB0hT+D+1c+eImoI1RcvMhaOE4ShLI5FQmO/VcGVwVYX12c4
	/FUc=
X-Received: by 2002:a05:6214:d64:b0:6ea:d629:f48b with SMTP id 6a1803df08f44-6eb3f2e48dbmr208901736d6.19.1742769265869;
        Sun, 23 Mar 2025 15:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQPkyIG2/7s7JdFAgpJrzOdu6NynDFhU+J8MOzrWx+wdbswVIq43jctr1R0nzCy+IODcRg5g==
X-Received: by 2002:a05:6214:d64:b0:6ea:d629:f48b with SMTP id 6a1803df08f44-6eb3f2e48dbmr208901456d6.19.1742769265482;
        Sun, 23 Mar 2025 15:34:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7fea69sm11239561fa.59.2025.03.23.15.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:34:24 -0700 (PDT)
Date: Mon, 24 Mar 2025 00:34:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Cc: kernel@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_akdwived@quicinc.com, uchheda@qti.qualcomm.com,
        Sahil Chandna <quic_chandna@quicinc.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: Add industrial mezzanine support
 for qcs6490-rb3gen2
Message-ID: <2ltsdusrv26qpbh7pduhsrsaoekcbwszn6wsind4nrxgb53cjy@v3mpbaprs7w5>
References: <20250323123333.1622860-1-quic_nkumarsi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250323123333.1622860-1-quic_nkumarsi@quicinc.com>
X-Proofpoint-GUID: 9zwTQfby16GLDCT5sfNIH4E9Oeg_V4St
X-Proofpoint-ORIG-GUID: 9zwTQfby16GLDCT5sfNIH4E9Oeg_V4St
X-Authority-Analysis: v=2.4 cv=IKYCChvG c=1 sm=1 tr=0 ts=67e08c72 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iyB23ghkDH8ShQ-_kBMA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-23_10,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503230161

On Sun, Mar 23, 2025 at 06:03:33PM +0530, Nirmesh Kumar Singh wrote:
> Add DTS support for Qualcomm qcs6490-rb3gen2 industrial mezzanine board.
> 
> Signed-off-by: Sahil Chandna <quic_chandna@quicinc.com>
> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> 
> ---
> Changes in v4:
> - Fixed the GPIO state setting using hardware rework instead of the
>   pinctrl framework, based on Dmitry's comment.

This looks really nice! Thank you for sharing the DT early enough so
that it was possible to fix it!

> - Link to V3: https://lore.kernel.org/all/20250122101424.1810844-1-quic_nkumarsi@quicinc.com/
> 
> Changes in v3:
> - Fixed tpm pinctrl node label.
> - Addressed comments by Dmitry.
> - Improved indentation/formatting.
> - Link to V2: https://lore.kernel.org/all/20250102190155.2593453-1-quic_nkumarsi@quicinc.com/
> 
> Changes in V2:
> - Addressed comment by Konrad.
> - Validated dts bindings with dtb_checks suggested by Krzysztof.
> - Improved indentation/formatting.
> - Fixed bug encountered during testing.
> - Added dtb entry in makefile.
> - Link to V1: https://lore.kernel.org/all/20241206065156.2573-1-quic_chandna@quicinc.com/
> ---
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  4 ++++
>  .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 21 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

