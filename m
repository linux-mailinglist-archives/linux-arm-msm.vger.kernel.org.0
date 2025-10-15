Return-Path: <linux-arm-msm+bounces-77487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8421CBE0C94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 23:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC2D919C3C4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 21:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D1B2F5A0E;
	Wed, 15 Oct 2025 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILikasog"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B112ED16C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 21:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760563081; cv=none; b=D2DTefcsT8Y/ZQVGDzAthtJ9jsrUqi1AEXUqcgAjLCjCp+1XhQfAVD5jlZUblyjKGgyzUdnBzJSuWT5N+ct43N8KaD8H8PgjhgWHKPa4OjDp0Wjy+YWu2pgH9/LbDCMhggIpCDOzjE8Ax+4Fm5VkBmQ0a0jBU/oA7wKkUuOt8g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760563081; c=relaxed/simple;
	bh=zk0BBT4Hk+RcSV6kfked05wBSaFZl99P+G64EyCQFE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayl5iuML/+PiElwc01cfpy1FzvpFXpzXGKVpkwT0WF7qiXewdcZOsDLckSh8h5GSSb5wit7PLtcrAo4Ipqt0z9+/vapmvxNINJxE4kG9YGL4PzLBTpcizbCUbiw3aSP97Ctw3c3QHCtw/lfi+Ewa/IWRJ8+sovet+FL05Rf/2K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILikasog; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FKMb57009192
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 21:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VJeGrgf9qBiX+zK6vs7ZHMmh
	QNY8bpXGFobNX4Fu/fY=; b=ILikasoguN8vUw9dY0Of4A5sKqiegwg4lgOnqIHC
	92cSed539XnnkW/n8gS+c0nlz5XMj32aN14MprGKJYOCq5H9foyUGa3FyQ9JtxHd
	/HjrIr1rlXkJgbIPmZB2iBYhsYZTqNjc1usYb363E+IJP1CPG1Ug8XQgs3/KnEAo
	kWhCtMt4jqZFEdIhyrC3F9WASSsDmKDtP08T8zcEIGD2k84iHHY0tkyHDFm1ZIvt
	xlJaa4Q5d97EguT4RpVki88wEOwnAId50KFjeeig7R0b49Xcb4CPK3ccUkhE3UG4
	CRKtgU1eYgCXdgQp0OY+kSvvOfWNXh2JE+zXHUswp1d6Kg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c5v4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 21:17:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-78e5b6f1296so2148596d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 14:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760563077; x=1761167877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJeGrgf9qBiX+zK6vs7ZHMmhQNY8bpXGFobNX4Fu/fY=;
        b=qoqCGKOTjwZeTFjvrQicAnGiim1BI+zvB4SOjPc09AqBPhsQ5MlbjxKuoeuf9rl0ZX
         0zYaXSL+aJmQf4kRFrDDvLiHo3C/GK7K/lCOZ4WBSmHYSgyhvnLZJldod5N4CT/dDN3S
         Vri7Np9vk0c8rrJliL7TN/BJwBS8EoDT1K49rtM7LNKoP7+BBG3bN1Ny3RuhmxIMauMj
         y8Oqs7p9pL1YxX2JhBzd4gk1NvQ95KGTUqhxNA97PjsXj2RZVJrM0SZiv/ZHwSLKrE/R
         tfOXyedEgrvbraTEGAqpo6Uudb2sShHSCS+XNeZAxD4MhnBQ4FEC9k+SFaCvJ/DL4NX8
         st6w==
X-Forwarded-Encrypted: i=1; AJvYcCWMFKH0gpSu/XoTe7tNB1YihP5korC6zPSwJeKAkH49+f4AIaCF5Eh7xHIE6+0iIleA+C3vR33xIiLVeCJV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0fofu6/MfnZfnCxXA/84epsUROJ/1wT+NcB24QZ2NKx3ddJAe
	rJ3+zpzS46mepvXGVoRKr1vQbSDhVvRhPHoR+ZIe2EjLphX4EZPQWxxB88wqwQUHH+lyfo+s9gS
	FA4pYncH4xmeJJtYmDfLVbyiCS3o69i4Gl1cQnDYGhUvpva5UcY/tk3MNhm8omoQVE0BVR65Ghn
	pg
X-Gm-Gg: ASbGncsOTLGzIJMgoiKBQKSBDUmXHhutBoxTqHz8jNmrczteeO+bPFRc/dtK2oxdKHH
	UK5UA1ygbm2qEN32K4mpyZxbWw9baqBVzc7JooVXriRdnjisvPDTvik0fmgETDMGQav+MWXy0rN
	Tn7RyY9T3RlRHGSBp1HJEtuFU+7SExo3q5AWsIxZYzTbyZuBZahMWLasD9tROeuwXKBKekIErb7
	l491u1/nOOFtzATHHYqiaJhEgJPEx1a17iBM75JJUBNoo+TAMxThjA3Hig+p9Vt5Vws+sa4iihZ
	Yo9OqKa6O3KwUYsMOoO6OeZZDUNjtw7iKOeWIDdGKImy7oivTbP2/t9l3A0DKUzFAuQXDVvHnMR
	3DIp4Gtw9zlzJ2CVOfmUD4JMiENR0etGMQnm5FTSvkcoLCFTrUOM6l8qVAZHO6rsP1dbqZ+Hy+q
	uehVhbLO5bQi4=
X-Received: by 2002:a05:622a:4ce:b0:4b9:d7c2:756a with SMTP id d75a77b69052e-4e6ead709e5mr430447361cf.77.1760563077221;
        Wed, 15 Oct 2025 14:17:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWUJjpWuy2SQ3uK986PVDHVWiBrMZNqixssrAxbnP8C6oKcxQyRgYATBifnIDH6x3LpocicA==
X-Received: by 2002:a05:622a:4ce:b0:4b9:d7c2:756a with SMTP id d75a77b69052e-4e6ead709e5mr430446851cf.77.1760563076717;
        Wed, 15 Oct 2025 14:17:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3ab05sm50829681fa.44.2025.10.15.14.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 14:17:56 -0700 (PDT)
Date: Thu, 16 Oct 2025 00:17:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/6] phy: qcom-qmp: pcs-pcie: Add v8 register offsets
Message-ID: <3frncuf654d6wjvegmlwvljouk2xehsmouwjkf2zlgke3t27he@3uh5zyfyglxe>
References: <20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com>
 <20251015-kaanapali-pcie-upstream-v2-4-84fa7ea638a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-kaanapali-pcie-upstream-v2-4-84fa7ea638a1@oss.qualcomm.com>
X-Proofpoint-GUID: Q4VNiLoojeHABDMDHpR4XVPEUZobCerf
X-Proofpoint-ORIG-GUID: Q4VNiLoojeHABDMDHpR4XVPEUZobCerf
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f00f86 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=aHvCONSEC-igqZHWBgwA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX92LxHKCyEVrK
 TK1JNXVtdnJ/dOicdUQe0W5mkKwKYdUEqHWSg1gBy6f7VxUuhMs1hAJph9vs3XrzeUFCC6e3tK9
 fxv8rOAuuWE7IBFzyKFeuURKlw8lsIz92ZwQ8oJi/79RurXLzfVEVZ26GQJl97Tm9S9h7OOWVfj
 pffH0W9z8SM9jWOkXtEoeAwwdySkmaZMZicU6c0VLDK2ToRDGDwVBNE2t3ULIz6JPGTCVKQNaM4
 qonKzpr89nLXRDu4Qn4N6t8N0ndyJymj3jmDSZ/OWB6HlA46sLzaHqAObFSm7KQk9uV8KzHLUUJ
 SCOijmnNPd0XmDYPIL66ZwDz+AGPXJUg/HGOHvDb6SrWs2sVDy6w6Q6b4ynQXS4UOn4+65DYtgd
 p691Wo27OJaZ1LmJTMK7WdE3n/Zlzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

On Wed, Oct 15, 2025 at 03:27:34AM -0700, Qiang Yu wrote:
> Kaanapali SoC uses QMP phy with version v8 for PCIe Gen3 x2. Add the new
> PCS PCIE specific offsets in a dedicated header file.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v8.h | 34 +++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

