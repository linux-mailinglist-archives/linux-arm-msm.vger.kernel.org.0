Return-Path: <linux-arm-msm+bounces-66791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60753B1305A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 18:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F90B189573F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 16:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C631121B9FE;
	Sun, 27 Jul 2025 16:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDf2+nCl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4723821A928
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753633171; cv=none; b=TOlCswJaZ4nui/JJXVTwAFq2CbWfvEsxnY1iDwWhZ1xl6Q3HzdyGnxXX19vy0UY+YmV0Gh72UiaGcfaGCpPGd8ScMFdOcz26ihmEM7jXOGVh/qlQ8g0ylfCi7r0XqY/nI8dxj0U+z7h919L7kIyuBjjK//FmraNyPFRANMPbFVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753633171; c=relaxed/simple;
	bh=zk0/momZBJ22XiQ3Zdbe51H83JVBUxT1l++e5D0cni4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/4iKflFh0+5ADh+vwZxK46/3uw133pNIUHACWJZvWjELcNb8h48fwnTXEpDdFqZPKoEb1ns3j04/q0CJKslShr0UbU346lm6Krg2eG+anfEYLeVH313MIaPYsKFa3DiTEIbf8NRnVlmdftSC7biLkq0o5MLxb/zSE6AjBL2toE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDf2+nCl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56REmc4x015729
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xog9pMwnTfyyxDALiAzNjbCD
	9BofGhoxhGYWP0UmMU8=; b=IDf2+nCl7wRx54VmXRaUeNB9EC2WlJjSQrpf1jZJ
	vQvLRYJfrlwn1T/+I4BCQukjzL7+C/aQFQOSnL8ATryk9cj23SqtNQGYWs6rVjre
	vyl8ady4KuFv9cU2kw5eyFz0yknPYABPiQrF6HChvTbYQW6itf9xJvVoOP00v3FE
	iAY1KgzlzLqEuPbrJppMdAj2ZOfDjsLUEzJXzqHMiREG8LG6tvic5+N4vBP9GZMw
	I4B/IYsUiF2mo/znvqjv3/7nBqjclX00Ekqk0sJ3aUyNQz4Vext546iJKKzl63DC
	aqLrCvIS3JEUMhS0OpIxE38J8F7OWEieRDPYVzlapROg1Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2aart-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:19:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fac45de153so58316326d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 09:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633168; x=1754237968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xog9pMwnTfyyxDALiAzNjbCD9BofGhoxhGYWP0UmMU8=;
        b=iLXVby9mvM08wgWQ2WetcTmg/HRaEDbnpoPkpPMO2937WusmYX7KpxxWgRQZ7IF7YP
         vyaXeDeArBssQ0iNYqR9veTeZfFmn+t9X6nm2Uv7Ea5oMuybaiS5iSXJfhf7YaZSaLon
         Mqth0KCCLXFXnAStgApJDBn8HuQmKDnUrDlhyj1rSOUK/40tdK5W/qpPlMzSd3Ei7bhq
         OvIip9Yw6wjpJIM7FdrdyY3qNhEOBtjpmiI2H4SH2cRmWCbVcQPDRxI5jOZCJtuWu06f
         2/5E1PRDelfoSCpxiJaoBIzk48IRwvnewfpLRO/pHJ1lV8UB+PT3bo1zJoQwAUEwJT8i
         54OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBvUhf7wHkdS0xvUHzqLNqyT1Y011nu3rfp10Yq6z1MJdJn5t76OCaiEWBvLMkyHcklZZl8B5APJrMp12z@vger.kernel.org
X-Gm-Message-State: AOJu0YzFnMFzohV0P3u/93gz5MNh+fEdBC/bqmVsyO1vsODU3PAQRtnX
	0EmgxJNeUqUk7KOMNKYsjtbgAeXpFYx7gkRZHyv+7DtZxveXMXZd+hTc6MDR75B10LKNkHsDmdw
	auUxGP0rK7GUruEM2pW3VGhs433St7IlwvClyiF/yGkihRdhG+sOsqPHME+oBZsry2exf
X-Gm-Gg: ASbGncv/JgZWuniXEJt7lFMvsT6IGszddNVGAKAYJfymDTLkCKpB44VbvrJe9tAnVCf
	TjqiC2X4w32jd/EsV4/pObLQaUdsAbf9WtaIoJHi90wUC9L8+EkG/NOyK/MXSirM6kRNG9vkD5A
	pVfMfFJQ5a+0KkaVDu3xl/rIbvC+Ro6R1ubJU0Mh36fBE8TTsI1QPUmTkjDPsOfKa/I4xN2mdKy
	0nz9ifigf3BVowip+20zbn0UuFMCidTKFkCQJlS8Saw2su5Py5UgqEe4pyPTs+CSYmd6fnzopMj
	J/kyXoBysHqDvzQ0oOGZSd2KHTDRxyuSa6bqFW1x2E9v/6yPjEpNtGF3eFCcilmORxY5GmsXUiu
	idTYq+mExrRLMkL/vve+axbJIvPCwB2SeZM3g4t0czZ15rk2LN98T
X-Received: by 2002:a05:6214:240f:b0:707:92b:477b with SMTP id 6a1803df08f44-707205d64dfmr97744946d6.44.1753633168087;
        Sun, 27 Jul 2025 09:19:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2TnT3REp55fBcuDgbNxcPR6JFi4lJ3WbDg8RfzzK6v8g//TLZH0w+iEyl3THFdkppmKDF0Q==
X-Received: by 2002:a05:6214:240f:b0:707:92b:477b with SMTP id 6a1803df08f44-707205d64dfmr97744576d6.44.1753633167592;
        Sun, 27 Jul 2025 09:19:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f40a2f3esm9079341fa.34.2025.07.27.09.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:19:26 -0700 (PDT)
Date: Sun, 27 Jul 2025 19:19:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: qcs615-ride: Enable WiFi/BT
 nodes
Message-ID: <vgjnrsy2x7mkgfanmyhkfdq63n5kyyll7voa5ttfekn3wqokip@4kdsaa3hqfkx>
References: <20250727-615-v7-0-2adb6233bbb9@oss.qualcomm.com>
 <20250727-615-v7-2-2adb6233bbb9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250727-615-v7-2-2adb6233bbb9@oss.qualcomm.com>
X-Proofpoint-GUID: jz4APB1Tcnc0z38HAGtGi0oZ6GFZB0jP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0MSBTYWx0ZWRfX5bOZdlJttjL5
 GPvuNSCaLBGRNpv561FSth4rClYgW8gV1zyHe77OJBrRFPAP/pqAySEc/81GQyyX1wGRVM6UlGb
 z6FQJCsuix2hlIkqXlZrrQ/omqPP0i4KAhyIBZkqgGe0QVDfQQ9+ejeWoeBae2zjkzeyb672zn+
 s/lhh62O5wj7GL2CQNtCITBpIIh1EgjXlJh8MXIu/cvMqs6FPHwUcFLyl/f134WhV0iSkjrkLxo
 WQCt5zeAf7cyd2MsY3myi3gI9rRXQRTrAZ0+kBhVtLztrA2QThqvVa7HUA5Q24axdZiRruVlj5d
 IHauwyZOEh+ARLZQS/gj5P918Zfqq+eYka95vojB4WjyBoo6yDLPVrjbxCkURfIUKmi+jjWtK7z
 cJls52T9N6GO+RC3QICrTI9qIT3Dmpjkj3G+elDl3heIsVxZz3drVdl0bAXOC5z76xt41v16
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=68865191 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=lazYHay8Bcf_2JzIvrUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: jz4APB1Tcnc0z38HAGtGi0oZ6GFZB0jP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=653 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270141

On Sun, Jul 27, 2025 at 06:22:37PM +0800, Yu Zhang(Yuriy) wrote:
> Enable WiFi/BT on qcs615-ride by adding a node for the PMU module of the
> WCN6855 and assigning its LDO power outputs to the existing WiFi/BT
> module.
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++++++++++++++
>  1 file changed, 135 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

