Return-Path: <linux-arm-msm+bounces-72294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C128DB45975
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66B8C172814
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 13:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4521319DF8D;
	Fri,  5 Sep 2025 13:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXENI+dQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15F325557
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 13:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080001; cv=none; b=K0wTDUVwRk7kRHtDuh67gcCsBaEBx0L3lkUAoVWFYkTy46+Xky/cRu+UCxw2t5L5XpN/sEc+/LX3aqLqDuizq1Hp19FwYzX0tzmE7q5um4Nr4L0JPqq5jvRyqRvUxAMcD+8MdGkoubA6jg/5PgROKspK3HEVaH/rBPX9YjY8FZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080001; c=relaxed/simple;
	bh=rDwUf94pWrtY4v9/Yowz7CgUxlVbI7YWAum7k9Hw0bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CunGz4g4IZJgd2WVafLuyCmvya0+/NE+U7/P4CkOHMQc8k6pUBmiV2RxKiSQbl0Oh50RmTW8m1gflfZP63bxlpUvxcB4gqTnKK2cJY5c8Gx3BOJSHPDdzTg2Mw1VWITSFQKpEMXjv55/gVjdoGLNrG8hYlKFQRY0MkbrVUxlyrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXENI+dQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856ukc2024727
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 13:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3wQB5Afi4Fdw9xsNR7jXT3pZ
	/Wg7hEvuCNLqqtAm4js=; b=SXENI+dQMtOeTueVqf9WdnSGWzjCsGQStpytdnB0
	o6mCnrhrDPwXbi9h6jPFz7jdYvOxVwWwqFSF3oG24Ib1mopaFzQh4YUa602ji4v6
	/ooWz3aZKls8RQU4n0kdEBhe3P4b9esSoI922Aq0TWRNWtGO6TUfekljdNGjR3v2
	4dpXsBG5c3Lnv70p/HJc0ckXedvoKbxV5oyI4KOhwjdHssqFOqrDE3I5BUvkaxDR
	UniKF3u3/oMoJqUXz/MEsEytmtkxYdzwrFUmJ/2JQNsQ3qvtXOupnRND++iPrGR5
	VffTqF8UYS7N8sx7ZaAreNaKMrrjWcwUXeklaeV4NMWniQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fu572-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 13:46:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7296c012f86so34296706d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 06:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079997; x=1757684797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wQB5Afi4Fdw9xsNR7jXT3pZ/Wg7hEvuCNLqqtAm4js=;
        b=BGXikUYBopRAZKL8eVnwKovVNfgiq9QZ1dXsmJyNXF/xdnJechC27DEz487g4Rhyqh
         aTJGlU8KhSJ5BVwhtrrF5WIWSMwOk+I8wXm1J5jXYJFHj5qBLJWJKp+ugVbypw8NNfHv
         Do4rCbLlJ4GKGN0KcimVTdT8yDae/lRvfjv+s7NCFzbsWezwQGX8CFUZA/HsBymg5rHD
         TU5UPI7s71Bspdwyy64r1PEQpePC0L0sydpIR8WBOCbR7ykLa8Chq5o8HM3ZjgT1gvCm
         lAxhdjz044nk43RsuoOiV4/4zG9W3TuxkoBNMcAELigHvIaNScI3ppTI+yzuJx6+zulh
         4pdA==
X-Forwarded-Encrypted: i=1; AJvYcCW68SA76JQ/Hg4TwygotH/VcCuxvMEapJH8OaPq3f0fdED8LxxDCXjEjt4mThRKeApPDbVWxvs+lMUQG21G@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/olCs0HAX4k70cME9+jBkjhTQ/ZVYCUeevbhxDrQIiLqrM22p
	GUO6sfzQpiFeuYRCEhei7Mddn/h9SgmaqhV2hkq01AZcIoVSDi05Kyuj58I0A4XZ6mDbzW7K+jW
	IA1HndRSwbAT9dpSvdvg2ORIXPaeCEaI3P2c9F0lSp8C0S/vay8pYBFXY0sKuWqnrw21s
X-Gm-Gg: ASbGnctQZfmKT10es94DV6ysp0BQQBmf0JtNhkLqB8xZApp+sVbGRjP7xk5WbdvWyft
	tnu9au+ZIXzbv1jLFvmNyI0RBvvjAMGYAsvoP6RUcBMvrE4gH930B33SnFmXRja0gQlUn4u60Vt
	d2HB7ODPZRnSWKSI0US9Ilhth8IJl+OXkji+BUzMwdMVmkRLS1e+y3ACF1bNDGfNBXEGaS+Ny1v
	GUTuXC6OtWVGEVif4R0ATvg6Plg+grnOlMckisnMd+QGeCwyf08k+MFObu90o3fPH+c67Duq8Vj
	GGPkZbNK7KYrHziZnnJDukDvQYt5MgqMK8eN6TfeSS9ub7O5K1hGCCZPSCTiuqxBDZHuHdTvJFU
	2WWaQw5asyDLAlHi70lTzSmlm0EYUjV7E89vWLxAa/eKzLf8wakiE
X-Received: by 2002:a05:6214:3308:b0:726:32d9:db64 with SMTP id 6a1803df08f44-72632d9e19cmr98143306d6.59.1757079997456;
        Fri, 05 Sep 2025 06:46:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyLPSqn/5cyLU/ufeZ0J1VNb94Xf/Kcme1ni+D63yeD+5Me3DlASVIJOBnDX/9AWOyyQgd0Q==
X-Received: by 2002:a05:6214:3308:b0:726:32d9:db64 with SMTP id 6a1803df08f44-72632d9e19cmr98142896d6.59.1757079996852;
        Fri, 05 Sep 2025 06:46:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad52b4dsm1763359e87.152.2025.09.05.06.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:46:36 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:46:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Chenyuan Yang <chenyuan0y@gmail.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-usb: Set regulator load before enabling
Message-ID: <vda7dcqqfudhoiwbe45irfab62vbn45crfsc7smenskebuteon@rcutjxrfbwrm>
References: <20250905101243.14815-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905101243.14815-1-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX0SE5WJkbmDnZ
 B+crc0CEKPv+TVZ8tA1sh1A7Bz574J7HkAFgmmRt/S66CGev91pDr3UGvak6q9V3XWGOOO1VUZe
 dQ2T4Qw5DZUGkfC/0OqIMfyqQlivLcQx2t3KgmlbVqS5Z3Jlm0gYqmXApn2ScaaJRRg78gKurqv
 ohTcSW3XG5mFIcxG2BtGBqRT0e+LhgMz2St/IPgWr+SNO8qfZDD0es+LuLIQhPNYRpPLOuf0O2h
 Bi03OtrFGAN+LYAsm5wSoNWFutpswTt+qCpa3JgKRgOS6HsgG2Ezkf3rH7lihzVM9JWvJCUHla1
 xfvh9B7KKij9XSz/c6Ggxhpwsf7vcTCTg3TFV8caPZpL2bDlEUs6UcWdY99xzkpR8TOMAIlRbrb
 mR0Vwbd7
X-Proofpoint-ORIG-GUID: kbiq6M8YPk7jANX3pwI1qEbSDR9aHGBU
X-Proofpoint-GUID: kbiq6M8YPk7jANX3pwI1qEbSDR9aHGBU
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68bae9bf cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=wC53ndoxZnronpF1UXEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On Fri, Sep 05, 2025 at 03:42:43PM +0530, Faisal Hassan wrote:
> Set the regulator load before enabling the regulators to ensure stable
> operation and proper power management on platforms where regulators are
> shared between the QMP USB PHY and other IP blocks.
> 
> Introduce a regulator data structure with explicit enable load values and
> use the regulator framework's `init_load_uA` field along with
> `devm_regulator_bulk_get_const()` to ensure that `regulator_set_load()` is
> applied automatically before the first enable, providing consistent power
> management behavior across platforms.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 27 ++++++-------------------
>  1 file changed, 6 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

