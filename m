Return-Path: <linux-arm-msm+bounces-52056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E085FA6A0BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 08:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 165CB7AD3D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 07:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F7120FA8B;
	Thu, 20 Mar 2025 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2P9OlCi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1458B20B7F0
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742456962; cv=none; b=apM+AGRFr3zige4JGkSjPvCpEyAQuTPKmGrpWv307OSrn3cIDRI2z82llZQbSCfbc2kv2aG0ubXR8mtNodqNS4TtLB1I489gtB5hSUrn4FDJkrKe1Xk1gIdzNhtHF8j8OPdsRJ/4Nye5SYnzRdYnyaRN26kMruxiZ3ArE/SXz2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742456962; c=relaxed/simple;
	bh=9xyRInh/JuT22nwzulBLrvoDfTg+RPaskoAt6Jh8wIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+JFajwKVsRGffhzw74sQeQQI64y9GamWBHZObBruzOSooC7zcO+r+MTH3gyoRSj199tK0w2wJN85wuOb3/k7wPrEAsMJOYDwFB+2k8cMuneaEk/cZZ9Tu04jlzUYNzkdh1ZzOEkMm1qYJ5kstAJSQLMklOM3I+8R3AaU2XO9AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2P9OlCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6ZKa2014738
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 07:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y0yS+aQTmw0yZPeMQpU10U+O
	l5ONqbJCFVaNlZvX0Gk=; b=o2P9OlCiXeHE6JsWF/dFuB3V7cPQzgELmd31K2w+
	hmIx26nP5s1F6VyAx4ubc6xddl6g0MaF/B90uDIW88GTHyTIdFBeM0AWDWQNxvld
	F998F7Ocm+DgCTGi3ac3YNUzLypE4t6YhXWVv5GxPMTbs2dnIwJ8sh+i8jwL4xMC
	lDpj21sj1WaXEjpVImH51hwoekyxY+W10Tvbe+Tgjr1USNmhWxFTk6fq21ECzCWj
	OhX2cpP/gqpyFZogTBtZdLmEgvk1EU5vpKSQFP4Tm0Ni8j9424M8OQETh69kQp7g
	qxW7W/0pj2DM/GFpqJkrJ/2AA7CZH0jzrMtQDiFutN9V2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtr75v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 07:49:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c549ea7166so94605985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 00:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742456958; x=1743061758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0yS+aQTmw0yZPeMQpU10U+Ol5ONqbJCFVaNlZvX0Gk=;
        b=mcag0prGWJ64VDnb4bYyttosZ2iPp07VfF/5VKAqa4XcELUAE5WbQK4SOxTz81G4EK
         YmXd+5j5zrWeQjc/3UdKC0YoC1z/oAMeEN0n0AWKWTVYbSReFRqjncIc2vXqBcxftFUX
         R6u6jMg7EEP97Ne7OpsTxKibONruivmmo74u0JYmU0y8Nst9THizAwR0S2lLUCa+8zjd
         6EgJBh+ZFNONjs6cd4aDu1CdJr1vVZAtLisfabwqW/nRNVODPzj5jvE7o5xFt+43HZDk
         VZnQdFTCdMYwZWvSPRAOx0uBV7w1BGXN7vQEGnMDb9ycTW6hCjYBgC1ZklXOQBUUSggo
         fIgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWihXrrVuw6v17+MiZRpfmUN+tFy/tso4KBs+Own++fj2V1XIagsy9aJ2AC2iRUhSUVo0rcKy1lDqDn35BZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1lZW9ZRZoo1O9h1B5JbkNKN5LU689d7BvaXy3nXc1UbuQWl6
	QK3zFw0l5UXzGOk/wDIUbvpf5fcBsGdblLifqqoYsAq4BtG3jx5WKWi9orWwvc3UHPzNq9EGH6n
	Y4v3xFsC9GAB8O5pgyrLQBwCz//w1pDoUh6SgmPFfZ2a78wEvszkUYHCjb33Y5enQ
X-Gm-Gg: ASbGnct9SEY57gxJ8OFqjMyqjBl13zHzrJiXjPmqYtCogydpDStFyL776c44iAYUhuW
	E3ku1C7w2PXgvy2M3ttuyo3B4HIUU4uVWmqstKbecvN6RPd73rZ9PxhsVcivOsxp3PsrDW3+geX
	VNPf+ULg5YbrR8+jYnlFkE5dvdjP3Xx6Oi2j7xh580SO1c3uXQiB+TwGuHIt0qVfWZ6oI27ygZy
	ztUJRyqydcoM9+G8wsJqWVZ3eQqEPlwUfjYFe/QeSgPKw2+vD8IKqg3Zen2QSNO8meU0lo/YmXI
	jDyXkdcK1Rq1QfbE+t343nP7m8efPZaJLPCcUuotcTJgGe9PVo0KrJmNhsnNdqAPYT+Cy3HHt9V
	wY6A=
X-Received: by 2002:a05:620a:1a90:b0:7c5:5343:8c2c with SMTP id af79cd13be357-7c5a83d1517mr790764585a.27.1742456957971;
        Thu, 20 Mar 2025 00:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8Z5BNkfpKh97ly69kY/44WHPpgB2U+BPmvSvPMFr6Be++EdmzzYicH8E8wyVmOTRhm/ENMQ==
X-Received: by 2002:a05:620a:1a90:b0:7c5:5343:8c2c with SMTP id af79cd13be357-7c5a83d1517mr790762685a.27.1742456957653;
        Thu, 20 Mar 2025 00:49:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a8bf7sm2122917e87.223.2025.03.20.00.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 00:49:16 -0700 (PDT)
Date: Thu, 20 Mar 2025 09:49:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@linaro.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
        quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] misc: fastrpc: add support for gpdsp remoteproc
Message-ID: <3zrwjody6ffirauzrtcmvr4fp6nx5b6eqkt2eyt7nxm4jfwjn4@pceeisasgxqn>
References: <20250320051645.2254904-1-quic_lxu5@quicinc.com>
 <20250320051645.2254904-3-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320051645.2254904-3-quic_lxu5@quicinc.com>
X-Proofpoint-GUID: hpCWnnFIZu2f-vbJMHAXSeUMxMpQGPwm
X-Proofpoint-ORIG-GUID: hpCWnnFIZu2f-vbJMHAXSeUMxMpQGPwm
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67dbc87f cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=lc4KdpPQecCvDiYUKO0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_02,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=801
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200045

On Thu, Mar 20, 2025 at 10:46:45AM +0530, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GPDSP remoteprocs. Add changes to support
> GPDSP remoteprocs.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

