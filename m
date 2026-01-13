Return-Path: <linux-arm-msm+bounces-88860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 94545D1ABB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 18:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0B413009D4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89ED23939CA;
	Tue, 13 Jan 2026 17:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpalTj+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFOUc8uW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9087B346AE8
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326565; cv=none; b=hHMatUyRbTfO5aWbwTH2kgeKAofq4+APEIDVKInZvPlBwg4AxqfGy+EdL9l9ENT08ZlK5QY81jl3ji02C3C77cnqXd0luc4ngQYQFuukUzmqblE2smh9hzP2jFS7vJLFFFJAoHIh46EgMjvQ4QdXpdGB+Ll0/GSE5asETEIwfuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326565; c=relaxed/simple;
	bh=5VO7o6iYleckltPDwiIP6Y/31QTg6NMKYwDh4KNVGn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPL6yMKoK3K0+Lq6oBsPMzqivVAViUKEJszufMfvxyqt7d2qai2amwtpeyNbeYYRAt3xTCaKV26UIb+QW1tVeAwJpySHs+2Wsacv3RaqUYBaVUjs8HVmLjFUQx9GuH7ogYcI1BujMuFMOd1mPGWgeygLp+bAaGU2OrQULr42WZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpalTj+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFOUc8uW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DH7T181120568
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K5Nxtgtnck4+5o6954LIaJnt
	w5WA1UR6wZbeB3D/ejo=; b=IpalTj+j9tug/d+kjbufBQ7/FNd5uyixjTJdTF9z
	jQIyP2NzI4WpOag+tOjzwdKOlYugI4t5WyG0Ia1RXMFuV5drtnRWg2hRcoUCpeSi
	2OAMZlvUGD/5nCPM7gZj9nm/N3s3PQ6cORTqkq38Ss+g0HgmKLDBRSe0ewr11+dF
	fV1hAD1sKOqx0J1V+j9g3QUbIWf2PkHeijd3RV/BpbXanG29upjQZ5yav40tYn8n
	yxNolB7boC0HO2jmqMhHdT/1GzjH3VfLEKGhAuselusTW1KluvDLHNWS5X4eBIjO
	w0YOQ4PGSiAXyDz/cNJ9vVtZru97eqduevPVrORYLRbGkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnt63r4t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:49:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2194e266aso577710685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768326561; x=1768931361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K5Nxtgtnck4+5o6954LIaJntw5WA1UR6wZbeB3D/ejo=;
        b=jFOUc8uWdAFrjWB4/2m+kVzw8GT0ZyNXVhswmT+I2Q8tQm8hCy5RfpZer075qjwoNl
         /xTnUXnSGLdp0oFV47D8ZX9A/9VGps9C3kyYmX6CJ/7Lz/KjrTp/RKmKVCgjRWNini+S
         NRcwecJA/eT/u1+p+GgvMgZtdsn27V72gb6ag/w6ZpDWidRiwv8+IFstSdqLpi79Lpmq
         lBCY4qIxU+4hFJ+Fin57GZkpo3WJpu0/y5NwsqqnUX5RK+46RoV69uv1yWxQPcxCUVhi
         oYSZGoItNZImyAzF4ufdigTKO/mJr7mUwJmIwUW6vYbfJmhvMP/xJ6FXjtWlYrMH3bMS
         EhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326561; x=1768931361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5Nxtgtnck4+5o6954LIaJntw5WA1UR6wZbeB3D/ejo=;
        b=G6bDKdyDyS/yvnahaLxRzsRQQlzbm52HYvqoqSv87STLRezN1S1cNM2gQ2M73w8wFd
         +iicm//+sH9YzFuWHi3BBiwphxyAY7WOsN/151QTEzS2VgoiVSDoDxvss42V8zfFFBTa
         6XPQLupnkue6dApRIzJxle7c3i2CCJF86YcbH35iUhhcHFlsOSGHGzPXZSm9IqjRF8m7
         xkK/hw4cXoJZpYG0Ox82D6BLCqF67p3NBVNztGsbPbbOa6nSC9aRaYfpZFeyG0YrrBK1
         RL6FqgJpqZEOm37Hs87eNZGhXnKU4XWQQEKIKF4eUGJfZOp0o2vtjNy1GCdeLhMpVAf/
         5ObQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlFt7JhRhHQvSj/wd3Xl7jAqBfO/+iQLzyT4i+9ZRfuZABsgpS3FDqf/HvycXJhz+vH46qrNwiQ3X2ReFN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Vj/z/5pjMRu/rlyuF6tzFxRZHmQZHHbjeIO4VNFr5w12X8UW
	b1ItIpY6962+OirKJDXgZVIJZq+RaGUFzdChToFiGpjvueJ8enJYBe1FCLQk+UceN5FTHlfz5SD
	Pz8DoHYqfxtlzmcw8lMLv1P2vFagwgeytcw/KnBXAaCE56u5j/mKLziysnMdeqPUAuSpq
X-Gm-Gg: AY/fxX7iznMUCGeLjgX4OvlX9axE+/ZEapoA8yD0Wj3QgEbNoxd5mNxPV5AflZ0HG6R
	2/tANOJ9x/fFrFGarcHwEJ9FgnUYweHqSxqmaKba2w+WqUx5zVo/OjPGk+hgM4auoqEaRhlPUKz
	b4D8CX5IKu7/jWHt7IJcBkgOdU56ARIEULU6BKCbsHr/pzxt9RNpsRNlMTEVzfyDjioSXXyQofh
	ji1X4xOvOwuY28ef8w9Q3il/kyoER5nB44ptgNT8niyAucpU+GB4XW+7wizJWDpVtLlyHdTiLEw
	XBkSvSDuGDos3JZLfBlTgLqmvDylNIbFuekvA+8fI4En8+rHfG2g8ebN26u6NckolMalri8nTUF
	yd9KC5DqTJHbziglpHXLG0+3l176dEgla3WMyC2OKMGMyw0TKjMA+Iz1WpNMRTwrcgOuPwAmsFu
	f2PQhVPHHVLAssz3OlIbGmEBw=
X-Received: by 2002:a05:620a:440e:b0:8c3:7e55:cdd9 with SMTP id af79cd13be357-8c52fbfb4c9mr2452685a.76.1768326560749;
        Tue, 13 Jan 2026 09:49:20 -0800 (PST)
X-Received: by 2002:a05:620a:440e:b0:8c3:7e55:cdd9 with SMTP id af79cd13be357-8c52fbfb4c9mr2449385a.76.1768326560335;
        Tue, 13 Jan 2026 09:49:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b732da1e7sm4749494e87.18.2026.01.13.09.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:49:19 -0800 (PST)
Date: Tue, 13 Jan 2026 19:49:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH RFT v2 2/2] arm64: dts: qcom: glymur-crd: Enable eDP
 display support
Message-ID: <wrkkviexnm7tk66mjxyw266vwgyntdq2h5vfpn3orwrru6c4sp@cq552sslrlzc>
References: <20260113-dts-qcom-glymur-crd-add-edp-v2-0-8026af65ecbb@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-crd-add-edp-v2-2-8026af65ecbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-dts-qcom-glymur-crd-add-edp-v2-2-8026af65ecbb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0OCBTYWx0ZWRfX5l8ImDgWV7Q6
 PVeylw/qFoMAayYET23EtypeiFhtL6/sFMJjrlquZWlUMi+zNV1wrkZLfszsah3j2H0UDrC7mqY
 ZT5ea5HXlztguk8hD1bhEDfq30yzrcNm37sKkQLZSEl+0i/wm9H8O7vC/URgSU9B9iBks67C60p
 A9nuwSsQV/8DF5tx1ftAszNLP3n9cGNWvsglEATf7yTCQOO1liTnJ3icP5FS3rFaG4br1BNrWgn
 LPDew+j362tS9Vv4B2VL7mJZpRb+HOZTB2zjsUNDaJ2tmPFlDAS84z1c/K8noCQI2nMflcVTfHP
 SB+jjD/Qv4pTlcZNZL/xWMutj3+Y6w4gaItbITZT/DuUEDtHu1tA1uaStQX3ZwEJKB6UX2OqBLF
 h/p8A42eLUfQIZOg0oyDZPC557e4jglkUSGKj7BDTp8Qv0NRN+qTbGI3Mz4RkxDW+mrlyIUTUGO
 1H7yuUwW3rwZ2Hb5/ng==
X-Proofpoint-ORIG-GUID: Vm7fKhhNmTcsuC6gstcq2J9DYrtoUzeN
X-Proofpoint-GUID: Vm7fKhhNmTcsuC6gstcq2J9DYrtoUzeN
X-Authority-Analysis: v=2.4 cv=EujfbCcA c=1 sm=1 tr=0 ts=696685a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7exTVeyrrGsJc5ecXJ4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130148

On Tue, Jan 13, 2026 at 05:00:06PM +0200, Abel Vesa wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> Enable the MDSS (Mobile Display SubSystem) along with the 3rd
> DisplayPort controller and its PHY in order to bring support
> for the panel on Glymur CRD platform. Also describe the voltage
> regulator needed by the eDP panel.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 71 +++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

