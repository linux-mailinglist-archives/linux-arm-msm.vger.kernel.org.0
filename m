Return-Path: <linux-arm-msm+bounces-63839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E242AFA1E3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 22:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 714D83B054A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 20:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CAD23507F;
	Sat,  5 Jul 2025 20:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElYaW0ug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2409211A28
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 20:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751749043; cv=none; b=e8rXmlD4BgRmoYPwalCtA79QfEVsz9rZGRVqfXBE0+fTuLhJd+WvFa8u+ry8xZNLit9wI6/ZXs5iSNdbh93l03TfDY8XRohgPcFfxIwTbPuFmDauEu3djsus9GtDR3OMBDL1hhqNrHbbN9KZVtSxVaW55SKpfc0ov/ngPs2UgE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751749043; c=relaxed/simple;
	bh=yd3QB9i6892Oi/RELZQPA7eTy1+ck7mvWaDjNXHvHaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDUh8ZzhQy1SBxVb9puhu7adBshYkm8XATQvFohwjhdrEhGsVEiefwSMxmCbrd/WHNvJCp7lOnmtBUP5VTEBzmJU3580HYZqkCSj3PZ/riScpaPV3M8fY42/SmlNV11F8hrUhL/JtCwrdrjET8prlghdrYo5f9ES1Jzv+CrClVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElYaW0ug; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565KS6u7007166
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 20:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ixkjiJJ5xJZnwXwbUy5Cg/AO
	bRkh+NRxwTSQlLi8b1c=; b=ElYaW0ug6LU0UeA2xfo0yGyIvfeLfPCN7rTkYyhb
	ZYFBtjWrj4+qPIfe+3wx3aDg3IwmwrOVgGHEeFA2stdx4Wo9EC2/JHd9bdcOL1+A
	NLd8cC/rrXyDIVVxTbi03o3+B5+nwRa3Y9fg5Adw83+ZfPYu2BCKSpGn9VS16mjI
	bYIM6lpbrvzryEnKquVFG+c5GFgYeEshxd4qEdkeShd82VqXZdREUA7V+nk/DJi0
	uzr61JCebhW9udhyFfXviCWrkduuMfxJQ2qRqcZ3amavnvm9p5tLGvKLh1OPFGVf
	EaqJO2k3bKAxt9hTG5D7GR+47BDd0rqIlF7Z2txQymKX6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q1vkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 20:57:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d15c975968so321014385a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 13:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751749039; x=1752353839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixkjiJJ5xJZnwXwbUy5Cg/AObRkh+NRxwTSQlLi8b1c=;
        b=GNo9lbWSV8JrzDshPltL01hmEhLcx2Vp2WrN8pgUc+4VmY7dEIFQyiZOvLVuJ2wlTn
         eC2GkxCi354c0IA7jHjd4iEDhwiSJF/XKu8rvlC7neY6i2VYSrxRb1ELQ4cwT4VrxVA3
         PrN8nkqiaqz7tVg6o2hRnJ5GJ0hbvQlwrlV9Pj1j27jSs3uYXqHfEasOxpxYFe2v3JMK
         TZXF99jUlJyiH55fcazUl8EbD2h/wYWAojJGau0iq/+3lTyV/Y9+Qd1yUO95+zj80k31
         tJDwTcIUTnLQYKAP98tYKTcFccS0dVA2YxFs3doPgWHz1DPrNTihD/ohd2yw80K0kGVv
         mdEg==
X-Forwarded-Encrypted: i=1; AJvYcCUc6YAozj3aonXfA7ILl8KziU698WQnkxi1EtN5ie5/7qg+jJUNHfdhSox28r4nkMxV8moHFiwS3fEa1Ynq@vger.kernel.org
X-Gm-Message-State: AOJu0YxjmuGBjJY6y7RWmaPEIYgVCBewb3mk5OOdp+W9uloCpsGhp1zg
	25uHwn82LDYBLZx5FKA+lXSeacHko0/Qx4IlOYzizaNo7wv9hfVUGcVweY3FbsnahVsUNjqqICk
	7qiun8aYgnAZclDwSP7RgJaEipQdTMOI8715cDQjxxDxnPPm4Ml8oYD+X/iCXNi+ccVxr
X-Gm-Gg: ASbGncuSrQGChAwIFn+lt2+pkbI/DIviEJxuh/bp2+baFmeHRPubGLM09mVTa0bYvgB
	WiQccXAFBIOvKv61AQlTw7PUTjjnoQ9rGTvWsGGvAQUf6VTA26Lcjlvcc04tfivKeN1I5PUI4D3
	0L+GfkXNFcCLLLxZnC2rT88rpOrhkT8kx0hjGM5+dbXhObCyNt4BRsCEPSUdLFa5nIorFtO6LkQ
	ACjmz5MNPIhG9FCDa5SUF4ytx7uFu10YdB8bZL9Z5YTVBQ0PEZplcsMLi4C35v4+GZ4ocqmu9it
	qMmLyLmwcQrw69Qy8ySN6v1AlDXanO1NANwoW0Lmxv9qhg3Na3rFUtX6gAu188V/NGC742hxIPn
	Ckulc3MN+wPUvzzlpovZdayP+vuhKn4MNeYg=
X-Received: by 2002:a05:620a:178f:b0:7d0:97a6:4539 with SMTP id af79cd13be357-7d5df10425dmr744839685a.4.1751749039450;
        Sat, 05 Jul 2025 13:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM59TkO8u8/py6MOdyXPISy6kh3KQYZz44Fii7ZoY06xkcbs1OMh+BhhFj9MBNEaem6Skz6w==
X-Received: by 2002:a05:620a:178f:b0:7d0:97a6:4539 with SMTP id af79cd13be357-7d5df10425dmr744838785a.4.1751749039059;
        Sat, 05 Jul 2025 13:57:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383babd6sm705164e87.32.2025.07.05.13.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 13:57:18 -0700 (PDT)
Date: Sat, 5 Jul 2025 23:57:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: qcom_q6v5_pas: Use resource with CX PD
 for MSM8974
Message-ID: <hwewzj4ygfbb22vxrahjfc3b4oxyagh3nkd26bs3p5k2fcxr6m@mkgtyjkxz3d7>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEzOSBTYWx0ZWRfXyQNlfD0tuGh1
 3Fra2LUoQ6gpXiy5X98qQWYAH4EDKaq5oN1e6c9tFB72t/lYIjOhfcRkus8BKBdtlm5towV5j/+
 xvvI5mAVWfrl3Ec17gwAty1VGYFuWZHYgLlTxmxH89bp3AjLBgbo1+m2+cG8xErICOla4P2USYt
 RT11JIcTylEgi42Rs7AZQ4DWSDWnmGLm6/+x4d0SZJN+Szt35VJaNiwXpeTQX10IGx+4huWSTEq
 7hHPtXRgd5gNGsuL62C/75Uz1uZ0MnQYlw5vKNPPK6Tyyv6WaTXbxX2DpnfQnJQFRDCWnBRdD8Z
 RjK8CitqapAiKEDxwL+wN2rHfxgn4Wisw1zwIxinpknnNkB0VdmQXAfqKTe8/qZTLtW5mbMjL0G
 QkRO8D8k4f6YnUbxgz32cBrEykIm8nDV9o+ivUbUPQFCxgJNIE5q8TVs2LaiYiUd/NxTIY4H
X-Proofpoint-GUID: mtRVLrxzRbgBi9pBjEIiHsfKGEVkUlV1
X-Proofpoint-ORIG-GUID: mtRVLrxzRbgBi9pBjEIiHsfKGEVkUlV1
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686991b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=dlmhaOwlAAAA:8 a=l10-tqhT6-g9Bduh0oQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=917 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050139

On Sat, Jun 21, 2025 at 03:19:57PM +0200, Luca Weiss wrote:
> MSM8974 requires the CX power domain, so use the msm8996_adsp_resource
> which has cx under proxy_pd_names and is otherwise equivalent.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hmm. You are modifying the ADSP configuration in the driver, but at the
same time you've dropped CX supply from the MSS remoteproc.

-- 
With best wishes
Dmitry

