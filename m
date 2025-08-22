Return-Path: <linux-arm-msm+bounces-70354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CB7B31512
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAAD75A855E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80F92C08D4;
	Fri, 22 Aug 2025 10:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMmZqA57"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34201AF0AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755857923; cv=none; b=I9eyLrT43gMxOZm1G9LT/F1paikDuvtngtJgYTnDYHTIyR5bGQJfU6la4MrM8QkL+VLQEH7F4S487/F0DWqpfk4dDIXCxQe0OLv6GGio352enrdUZWwBxqUdQIY8Yk3PsVwwl9r3masPJaWqAsmO73ES2Odx7rVPMqa11ujg7vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755857923; c=relaxed/simple;
	bh=LqY9DvvMFJrnyb/3MZdXHgMs4XuGKf1wBFJPaPu53MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1tzT0iQMuy1C3ZhLkLQ3k/VxhwbT83Sv0soStPwVoJdS922elm14KNgknnuyws878iVPZgxNhgGE5sJ8yyjth6hs4iRI2iL/jtxkvHAfN17qoDbpQhpE037y1y45zT2fJPZOcDPuEVfSHckH75Xf66a1mmLFVsTYzLfH/KldNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMmZqA57; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UkRe029666
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ac+nVSgZhDM7Uis1Ey9g1tmw
	QUcK1Fk95dUsNGYgbrI=; b=HMmZqA575k8n3YhX6PcQxSn38iqvxUNcQb6kB9vG
	qJZnkJdCfkpgNlGOXYAvJ5cBZESzZbRy4T64X1vaeJ7tJ2/Y6Sq+JvTwAMf0x3kj
	R70nf+edQxTKO2Ah+pnqAymz5q7n0tW7m3ANPgxx5DTARJWzaNG2JuDoKot6DNgh
	pEPW3Q9r4o2aigN+atDqaeVbBilW9W3tiPIVVtswRH6feiuClNuUKotBx+YusC7K
	FgLB4ZlMt9hYxAstBTK/wdrCRIg/YGaSzHiT3A2901ygsc4deZ9SPHDmm7olcgDU
	deeE8APVcu4E/5ynu2PqqntlgmYiq1noPAeUfvnQrqIMBQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cruuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:18:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d9f5bded7so4589236d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755857919; x=1756462719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ac+nVSgZhDM7Uis1Ey9g1tmwQUcK1Fk95dUsNGYgbrI=;
        b=kTH+Z4PCHzDYg6ZUUhzAHjHl5ZpQgNOgppiozX1qPMiNCEsZ8oP/WsgtYiUM2I2Sdy
         WmSAjvMyp4KqAUcX5QNGuDZKewVMCkD6Mmzk7j/1135beI/8pleL7PYBdl6QcczpocXV
         bR0Y6pTn950o7YN1kIDA80LUdNhjRRP+YW3hPuV1fv3h4MbxbmIqcCL/FImmGSCP3FjS
         k3a5suOppgpJ58/bceEPrp7MyzxPcaWPXSTUS72kDD/vg7Aqa2i8sUai84cPW9W3cAo8
         l+wLfYVJUoLAApNzSR/7dXeH9vlCAZxcmKJXJZ4mY7C1JrnIvkSBdzgPOKl8oAY5osCs
         IOVA==
X-Forwarded-Encrypted: i=1; AJvYcCVmE20dDf6ZoPKN2uxm/GIv+HjSyGIhTFD4680JFLw5I+0CbGV5M2B/G57YJW/LUpMYnXH9cb6NuOtnBkVK@vger.kernel.org
X-Gm-Message-State: AOJu0Yys90q4zMEr51Srh50l/WeMWQzzJ2t2THmRfuylJ9mHp8vPGwcS
	kyWGWhKpIbVp1RXjRNhdAifCwm+EGpNGgWmlKHsz+11DMGvGSi4Tz9LzjfxtotZaDdZ1UatVWr7
	OmyyG79vg16TQNtqp9+VyYGn5hY4ogyTA5tAhGCTEyrL4SQaMJPHZ50jIBVwMegbjcrQJ
X-Gm-Gg: ASbGncvWZGimVxJ080IIbDTSnRY/wgq6D0M0hHVkhN/sC/UfeR7VmqenhZo1uQk75ec
	O533xs5XDYYy6pu4YSn4BkGR/G0fDR/NgFRF12WlrEiid+fxMRbOUMYlNltQX/R2w685e9FFlyE
	PObQelEPiNz4mcVS9ShkAhGISJGGI1cnpHLtsCzDJm7upZY+cMJDEqJZKegyKH/XcxHgAcAwL1h
	ysWm2edr6tASdTIcgobRBM3Q7sAA6pweYothy+7xk/vulReAcWysPY5mF00n08TyQRQqJw3/vJE
	6yWfmKOAr2hrYoURpNNzITRWWYGBhOcYwZ0wVb7ZSGZxqqOTEb7QBkhkXhVzl0i2SEacGNjXe7J
	EL39WgLjRGRpgMcEi9en8WlubEkGjaDTRmNUew/KSqQ/xmA7SvpLR
X-Received: by 2002:a05:6214:c2d:b0:70d:6de2:50d6 with SMTP id 6a1803df08f44-70d97213470mr26722546d6.67.1755857918748;
        Fri, 22 Aug 2025 03:18:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErGePoMT5ywVRUZa2kbz8ENiaVTNjGMFIKjDHTl69Ij615Bvp3AsW1z97fsCHMLNb7j64twQ==
X-Received: by 2002:a05:6214:c2d:b0:70d:6de2:50d6 with SMTP id 6a1803df08f44-70d97213470mr26722056d6.67.1755857918063;
        Fri, 22 Aug 2025 03:18:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef4345d6sm3418726e87.150.2025.08.22.03.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:18:36 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:18:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
Message-ID: <armnr2vplar2fppyxgkxeaywdlgjts3jmf3qmirwvyh5qb3bra@treg7qeqz4j4>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <95fed1b1-8359-4221-8245-dc12335dc4b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95fed1b1-8359-4221-8245-dc12335dc4b6@oss.qualcomm.com>
X-Proofpoint-GUID: Y_U709cI1eEtX1DUNCczlE4_K3_GTPqD
X-Proofpoint-ORIG-GUID: Y_U709cI1eEtX1DUNCczlE4_K3_GTPqD
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a84400 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=9lylJ45cP0l75vQ64wAA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXy2GNVS64vyX5
 zE0h+RQlnQmk46pnXCxPkkRYcpqYCaz77GHZSZe+bQ2iochaMrPcGwIQiKbhs21/MxB31DtM+Y5
 t16U5ohq64zYgyixGoYJ+R0oWBiH6caDHMMxO8cZ6WCzQg/gP6VMuEDzO8h5qXZpxzqYCZXmLj3
 K72P83rCgyaTRoqOjK/d/MeEFYs4VzcwPa+jZFjRMXsbwIEMVD5jh0QcyfSiwkLBiKCcz+nuWgv
 HjEcvC1pHZ/XC+pYZ8ANNBi7R8IwLYUKA56VqeRvviBKrTQOcJfkIHmXPqRffUu9pqqmKgKsfIT
 UXQH6AYaG3U9RKXOuDO4oPDVycdWyI6rcxOQMjUPv/JrzFMgyGnMJC0HRiFLGkUpivG0ilpMQvY
 M4R1hRYqg+rmud/hKe50V4VaFb2G3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 12:36:47AM +0530, Akhil P Oommen wrote:
> On 8/22/2025 12:25 AM, Akhil P Oommen wrote:
> > From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > 
> > Add gpu and gmu nodes for sa8775p chipset. As of now all
> > SKUs have the same GPU fmax, so there is no requirement of
> > speed bin support.
> > 
> > Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Dmitry,
> 
> FYI, I retained your R-b tag.

Sure

-- 
With best wishes
Dmitry

