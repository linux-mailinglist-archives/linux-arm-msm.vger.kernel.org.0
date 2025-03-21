Return-Path: <linux-arm-msm+bounces-52203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC93A6BCC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4815D4806FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E801A256B;
	Fri, 21 Mar 2025 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJTOldNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9DD191484
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742566543; cv=none; b=NeQ/qvnXU85OrQ2hJ+JTNfEd2nQUGH+yGpoIPJwYAvDaqrd+nR5Yy0HscoKo76IKKQmSStbkeyx7Yd7WSATng3lM18cdXVaXseGyKvW06Rw9wPVE255VhR5KPbLa+LJZh+Cg9OwiNYiyeb9vN/ugD9QfweTyIV4Cbjr0XxMaAoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742566543; c=relaxed/simple;
	bh=QqIcu4sARdCLr3zrpBsteLaFTv3e4KDGIf+jbp3Xn9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+MsY0s6QNfTBanBTtrYhqI4pC0M/DYthlFyd/dgWSU7giE7NAJa9k9rkiOXmOS3mral3pgXGVehPhuzxTGaTk1DfGe9QvGlCb00SdJR8aeI9VzKfR8c4qxF8lN69pS19eZuWRJKiojUPGrCxfwaynZ6Un69OHhVAzrNnGxRCjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJTOldNn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LAT9Ul022053
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IygKvUSovqJjIcgBHkL5I8fd
	pvAkZ2upGcSD5Jix+nc=; b=iJTOldNn2Hujp/0G059Gy26ug4FclmrYmd8es9cq
	8K6TWDVA5odygD4qey/epN6oVcaw5LFZiG9lbyj0bRdmxwWsgOSeeSL7kplhRhBX
	jOre/1U3+4O7xg4IVT0uQWXP/Dt8UF0e+/MtlllSOi7fjeA4RnZHp2pcb5DmGZQF
	hQPzFT8IVuoPREIiX5PMrVsL/1hy6CtdpWbxbeM/r2B3/N/Zgg3amQUAyi0lCGEg
	MMrDVIfeFDHtkJkGSQVGOzuT4wJH6eb/Zdf/EP5Kkk2mq4mheGy1Cy0FQ69FpTKV
	Rt4BiyLLU0eGNCn/zPes5yN9OKWDeouak3r/qqi4UqJvkQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4wpgx9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:15:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f9057432so38567266d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 07:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742566537; x=1743171337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IygKvUSovqJjIcgBHkL5I8fdpvAkZ2upGcSD5Jix+nc=;
        b=wAFw7gXGgeIHqpUfT13VGuC9C2zmDfHnfBeym1VOO/rriUP50w3abYGLyoGcnBAZ9C
         g53kISDO+f3Gp03nwMl19pPH2tq7Ifit+NffzzirHLw/nES7LlaMPm8xGQCWOX3qJWFS
         fw8Kb+Djf4hj4Iurltcz+pQq74JqiZ68e9ZqYOMzMy3feXlx30Uetw5UFzyZTperRE+3
         0YyFrhO+WMpAGUF8EWmL82SqE35P2gJEq+kzueo5lP7YrEOJ17dmuvnh0EKQTFu9R2Pt
         m1xm0xkixaLZWI3lZMTbc5uk7IafWJrsNt2CPhLHudExdwq1fEHp7HLrq2u8qXrClDmo
         WJig==
X-Forwarded-Encrypted: i=1; AJvYcCUhZvVrVAhI14bsiNyQzHjVNEGpqA/uoH8mve8hIYaHYt+poHJB9eKTUBm0ehTNSzPjeiW3DgsU9JtWN1/u@vger.kernel.org
X-Gm-Message-State: AOJu0YwzhJWZDXCzyCxKpQQvrGiBwgssaRKVGJVjABX7rmk7Dgqi6M+3
	qlSaL4I8/+ck1niCxoDMxLA9RmvcN8gh5qL8Z6IhN/KR50s05ni0iqRB5yQbDD+7uwy/dCbyrsl
	U1cBnSlgDk59Pvyy5dVzSMqSpcqaPDq8qVc30Qw+wkKJQ/DE+HlnIQqJqklvN1nuT
X-Gm-Gg: ASbGncv4NRGZiA8g/wBXq1v3lRDsyTTAE1bpJNfQVALeqBwXBMPsuCq54Vqo8wzyG1e
	uAPJhfBX6CHgxADQGogb/PiQvRiDVVJWCEIHnTrf2SlgWjebhF7Aiw6WzktYpo55KLbT1iVVSzE
	Z5R2j887kTUlQuikSmMwSCNngvqKrTvznMehVk5W2aMxndLqXIC98s99VDC5ht/2ip7wsqTsgmo
	pdza4HOzM4usNnrWIjvLGQJgedgB1LYUesryIB3p7oQwB14WhW/jFpNivSvralM9WpsujW1WX+i
	yIakLm8C0w/mhvVyKWDMGFkRSm7qt2YGhyJpsqa6uHIeiyBdBtub/4H2w+qXJhisxDnRACLHWMn
	W6f8=
X-Received: by 2002:ad4:5d6e:0:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6eb3f2f5960mr61025116d6.25.1742566537088;
        Fri, 21 Mar 2025 07:15:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFN/n1Ojxb+W+fnWe4TwdIO9ZmKkhfBLlVD64bA7J5vncM0McnA+X9BWkDQCQmyd0kZxS+AA==
X-Received: by 2002:ad4:5d6e:0:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6eb3f2f5960mr61024326d6.25.1742566536504;
        Fri, 21 Mar 2025 07:15:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d8f3c93sm2661681fa.82.2025.03.21.07.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:15:35 -0700 (PDT)
Date: Fri, 21 Mar 2025 16:15:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 03/10] phy: move phy-qcom-snps-eusb2 out of its vendor
 sub-directory
Message-ID: <vzlylhf5r5xy4ip4hkcolt3iye4stiabzxc4jwdzenbhll45ct@hx5gwpzrd33y>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-4-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-4-ivo.ivanov.ivanov1@gmail.com>
X-Proofpoint-ORIG-GUID: cKEFAA_AqF4kDrBftMsRZiDZHrjv8fvf
X-Proofpoint-GUID: cKEFAA_AqF4kDrBftMsRZiDZHrjv8fvf
X-Authority-Analysis: v=2.4 cv=ZN3XmW7b c=1 sm=1 tr=0 ts=67dd748b cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=N56nwJYzXhOJYq9YhE8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210104

On Fri, Mar 21, 2025 at 03:58:47PM +0200, Ivaylo Ivanov wrote:
> As not only Qualcomm, but also Samsung is using the Synopsys eUSB2 IP
> (albeit with a different register layout) in their newer SoCs, move the
> driver out of its vendor sub-directory and rename it to phy-snps-eusb2.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Please fix the order of the tags. SoB should come after Suggested-by
(and usually it is the last one).

> ---
>  drivers/phy/Kconfig                                      | 8 ++++++++
>  drivers/phy/Makefile                                     | 1 +
>  .../{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} | 0
>  drivers/phy/qualcomm/Kconfig                             | 9 ---------
>  drivers/phy/qualcomm/Makefile                            | 1 -
>  5 files changed, 9 insertions(+), 10 deletions(-)
>  rename drivers/phy/{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} (100%)

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

