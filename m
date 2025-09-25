Return-Path: <linux-arm-msm+bounces-74888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1450B9D378
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 957333ABE57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070162DF12A;
	Thu, 25 Sep 2025 02:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSnJ43HS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B262DF149
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768109; cv=none; b=P9F9xsTlSKYBNi4m3Vnpyz567us4EeW1BkfkPHZpM26mvGFlrutp7/X7zhvp4JGYLcOlCX+NTgNvnMDTLYtp970MJw0LkxTb5jY/H+Z1hzd6e3GL847CvoXq0DHGQJhpLZXLPfVvlkO3MCKX6HvEZ5HzREm6+WXlw0EUq0aqbTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768109; c=relaxed/simple;
	bh=7ciLY+0WA0WdD0zQWgT/kOVB7yzTSooA9pRCRJa2KjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SY05ZghBuf2/iABK0jQJwGZCd7ys0hB9JE0ZE5Q/e48kOoY433LTj1M7kamSxFxy18RjEl+QT2u6oooVSsYI6as0BiGlsiCXW/elV/MjiajJlObcymnJ23PmmIIoryouH5mnvMZFQwiIUuBb++5WMNrmU6EOo2XgT4LrvrqMAq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSnJ43HS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0HiDe021499
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l6roaFaJv6NtbeRVgfZ0Cnfu
	GdOUptJbjLE7JsJv3w8=; b=SSnJ43HSGLwhj3vESbnNlRYDklAMDge9yoR2l7zA
	OtvGAD6SR/fR8ubEgCByKraNYx1yzfG7UkX6hg6+B8LCuTYmfHb/kNOvmRYVyz+Z
	oxytUB0OEwEUUXnSQmW9QpxVkDE53X21B+uDSNfLV+nALUbOz6IZACwN5Xz1785U
	LHqdAX6PvtQlIS5GQppRQYBgI1BBxdgr4ioO9OmLbd4CHH44UWL479Q5vzLTDTDO
	X074lI+OZ5wBBnrs6Lu+E1vDJ9LhtNiyxKkRb6UrviRfZCV3f050LiA1vJ5J/e6L
	fVKR+et/FSVFgne+ABNUgDY/fVw+Fy70ABjPiaXYgE5MlQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budae1mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:41:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b633847b94so12069211cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758768106; x=1759372906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6roaFaJv6NtbeRVgfZ0CnfuGdOUptJbjLE7JsJv3w8=;
        b=dWFXntsvV/2bBTS/gyxwh1z06ARp+cLKhWtWwqsQ/1HNJktVIrwRJY0Iw1nEMAif1G
         cCn58LzyMGRmvo3AdNDgnOMQkLBvB55UYsOi3fhc46GT3sPpACHXBlih1L+OJnaWnQDq
         8umzbx6ndcA1Gvv15NE+kT3fMdSJjq0zCKbC53rVYh9Nw1U92fixuuVq6PcSQw5uQsPs
         PR0+gJooDE5DQ9d0xZNWMv0UuqOZTWyZ4A0f7kqkagCPUp+NwpMANaT+NnhN4l18NJXL
         eQr3Zg59SLDQmmaLW8yEvaFxNdtY7zpg7YQKVYDvc10jJtROmaaahBQUSUS90ukXjtxo
         s52A==
X-Forwarded-Encrypted: i=1; AJvYcCXIcvkZ4+wL6UPy9Vu5c9Y+jjOELya2Rqt9gkDJ7lROsXxssZPjRAKyZU6iMPQlHC8aTjqzTH1CfRz5MaZ/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+YnQpxZMy37HRXXCz+3+FjgcA6AJCd8QpI47p1DV7r3EcUUIJ
	KZSuEi3n0AMgvnOWiK+lzjNfSh/andq5QYUs1WntNo+Efw5N1bqwTP8Eu0ycWxwrxx15gHUc5By
	Z6E4fmPvX1/f9+ZqcrdKkMs0bkuS9Gi0IBf9uHpM/rIt/iB1Sw4xO5ewREdGe/eWYjcfe
X-Gm-Gg: ASbGnct3NccmClWOa74pgzBlXlyd+0s+F7hheUYhKHx+82VFmgvopyzcAzC9LR+1vXU
	h1ZSfOMj5W3yjStfhLsnkmhQGhL8Y5o4vn7KBpAT9XHHYwNmKpxgJNlW7ecMk659dGwJShtiuBi
	oYfwUtFyuoaCuyN412A9n0UNHHvYqDdTDbxck1SxpImdBAXdoHFvedhFxih0IhQsPsiDXiFX1GS
	17YnawNxpoMjUBxS9nm5SkQo9tfoUGFugyEgRJic/d4rQFlz4PfcvldHyts2mBN0iPIxojIaGes
	414C7bye1ZskV9xFxuSTm/yUcK+9Sekc+yOnP1xVigsrFkf7xgxWCM2CWECmFs39x2ePnrRGrB3
	s6IAHianYQK7kfUgWMGZJ1W2ZwYzFtQlKzxy21zKMlMdYMYFVUqs5
X-Received: by 2002:a05:622a:1886:b0:4cc:48c0:adfb with SMTP id d75a77b69052e-4da4782a6c3mr25545301cf.9.1758768106573;
        Wed, 24 Sep 2025 19:41:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKT8RyctbGQ3mP7DDb/CtYIWh4SsjSRD24MobA41ee3lV6NyrPEs1SAryjLLGpuLO2wIFF+Q==
X-Received: by 2002:a05:622a:1886:b0:4cc:48c0:adfb with SMTP id d75a77b69052e-4da4782a6c3mr25545051cf.9.1758768106092;
        Wed, 24 Sep 2025 19:41:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7fe8750sm2191921fa.66.2025.09.24.19.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:41:44 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:41:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add RPMh power domain
 support for Kaanapali
Message-ID: <fd234vzjys553445l5a2hgdkwoe3gub3ubjzhbmtuljjz3ukvi@y6irjcva5de5>
References: <20250924-knp-pd-v1-0-b78444125c91@oss.qualcomm.com>
 <20250924-knp-pd-v1-3-b78444125c91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-pd-v1-3-b78444125c91@oss.qualcomm.com>
X-Proofpoint-GUID: mYPYG2njwmzDLOn2OC_Hsjf3hkIROy45
X-Proofpoint-ORIG-GUID: mYPYG2njwmzDLOn2OC_Hsjf3hkIROy45
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d4abeb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hka-zFMH_fk-WL56CYAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX/gd7gdryENgO
 oz0TOhy0HUxunih98Qph9l57/UEHDCCWj+8H5cMY8wp74vHOpjpeYvPEE3pY56HiqgQFB5fiRcq
 FrthWVaIyPc/b7OCbEAwaFBBaLLsfySJuTKg1vTr7h1WguzihNcmnDmJhnmrEvJhea6gHNKImsR
 Q6jf7GHsGs2o6rIV1GZZtcqu/IfAusQ1BmJ8Kwxl2AEzeukJlFOkw+uY7kMgCfd4nAnc2ewOzre
 eO12irIdtPlH/qwiBjxpX/FTZAMIuQuKzeCH/1z24XxogB7KA1WHgDxQYKMjb77uiEKF6u24bab
 ZHow5EdIPZdra0H1cmx49GK+ei+0Kqf+RmFZxkojXf86RNrabs1/CH/UBrzW59vnxD9u22oorLa
 EexQut8w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

On Wed, Sep 24, 2025 at 04:17:08PM -0700, Jingyi Wang wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Add the RPMh power domains present in Kaanapali SoCs. Also increase the
> maximum allowed number of levels for ARC resources from 16 to 32, as
> needed starting on the Kaanapali SoC where the ARC vote registers have been
> expanded from 4 to 5 bits.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

