Return-Path: <linux-arm-msm+bounces-75621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA01BBAE6A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 21:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63B0D17B5A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 19:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207D81E766E;
	Tue, 30 Sep 2025 19:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkBZ3nWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FA72264C0
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259676; cv=none; b=YdnqZsQP6nEUevWmvxiu1DHiWSLwBotU75b3Wu+MS5+fq7lq/svSeCxFu/SGyRot+Ea6K43x3CKo1YMRyur8it6CND39OT/B0/XLwJGnsAa3AkR74tE13zIXpCIHaz/i3xpaCu4qQCn+zIk/o7wpz8AE4zC0vK7w5VpArTRd0V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259676; c=relaxed/simple;
	bh=RFw7rgPy/P4Y4yF7T5QMyWKKqbgPJOvm9kCEWIoxQTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idhOGDiT00mE7ti9s1ROdiY1p2UY2R/B7CngweoxqI6RdjWByqHZWhXwuiWYKv/hOlTj5oZafU+9QSNLbdfx8d6ADC4G1VlhIlC9reg4ETXNU3ik9X3x0S0CgKqZeNIKBCeNPL0gKmkspKUlssyUEtI9uwV1HoPQLKqBurJYCo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkBZ3nWj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBfkB6017570
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aPq1GrPwVVO+Dr1J6r/OVSsY
	OTBdmX3Nsu5MO3vxHZw=; b=hkBZ3nWjZL29Rv1MU2IlMtR/QQYsKIBbq57Wyz3T
	p12csA79Qt8gY0YpzfXNb1YIDzJs/0C6U7KtPxgXTUumhXkkmJHb0+DY1VjLIjdQ
	QyCVr7D1Cv/EYSZVTGvlZP0ch+TzYCODstwQCBdUj2i7nOL8GOmiBkqcVBtSqwTt
	dG89zeFJzxOMxCe7DMUlriVwnWdxdcL6IUW8jwbJn4IIfcKX2ntIIgr599ew+X/z
	6k9LqXcpSAz57WOgJZeuLCOnh9Ktm+nTs1BkbNgdEUu3HTpIH26reOq7/3N7Mf1c
	n/NniQ34Zti9YCLkE35/kGjj6tfJJBRjUqmwCM68YkLUtQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80ttbge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:14:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4df60ea7a1bso61975061cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 12:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759259671; x=1759864471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPq1GrPwVVO+Dr1J6r/OVSsYOTBdmX3Nsu5MO3vxHZw=;
        b=txKDv0KN7+YjwkMfHNI3HBmtoUMWHoQh2+wiCYimNmuZ/kkt5aAqH41q5M3A4KxVzs
         2sdrHzF52/1fzSXB8w15bglUQCBmQq+L/cOxm69npnq4D6y2FDGgSEuKLe0lkYnyMvNu
         Px8JzBIYucwt5iuAzbzVKcC99c0x7t5kgEDrzpGmy39QxA3YFsrgDtdfcp/TizEd/9sf
         8sZj5dBNPWL2ek0k2DqrOSuOS14/+KIaNlthvs+ugLEJ18B2IoUKcfo/XJhnv0fUJQmJ
         xtFjMv3gSAiWj+YuYAY/+CHOCfnJtM/QSCRT9VUXD6/PAv8GIV17XpbKE0lABw/uOQB2
         P3+A==
X-Forwarded-Encrypted: i=1; AJvYcCXtaFQ0jbbVb6m4jsZ6RgDCHM0GhOyDMREoFuC+UXm6qtpQxPzvZPZjLazVOhoD/g1bNOJuBI0sR9XehSbi@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCrhAgE1clO0z5wcAgloyCqTg3b+LmUMPGpVn6svIZGE9h9fR
	L7qPcknJkEckQu5ev0JFyi2xrWIKK+nPWdV70JODpPfd+dOJLN5TtPvWe3LCt7scS16vnliJ+LE
	VTaSOW3D8Oa8ohEkEou6I32OtrMda74BW+i5p6uL4Xy2VyONPkMhTDeLIUyMdT/FSjtxL
X-Gm-Gg: ASbGnctDK/8QYXCkVWQkV49m+AtqRjklYPqyAh2tkF9YVlmrNupoOO1z5+M5XPMnXfH
	edd4XR/k43moG8Mg3vkk9YH1j89SkvWyGpB5ssu2dh/p7VyOXehHN34S4f2yNnSspUOontEF+uY
	1tJBycMJBjMnrk/t1sDXJD0fGr8K+nn8HeIc1KEgFSd3IRf7LkJ3r89f7sKdcMKykvnu28+XJb3
	8Bo1PUDwESdTW5rvdo/bI5UBGpZ7TfP5eHnH1TWP7JAC5jZhbtfBnPl2wQe8/hfAlX65lJAzhPO
	phzWa9u/SN1lnwWl+QBEgQfvJSJsY/OyO2FDUb9K7H0/fm3Fic3rtwClA2MRm4yx1Yun91qLsJE
	tGG4RPbTFbj/BIS6eJJZGFDZvLjnlxcZTlTDksbszfNx07BmhK4tibn5TXQ==
X-Received: by 2002:a05:622a:1cca:b0:4b5:e871:2402 with SMTP id d75a77b69052e-4e41cb1502emr12326391cf.18.1759259671411;
        Tue, 30 Sep 2025 12:14:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLNJlxjerynVd1dTh9zDT0y9I+Z5SHJ6Y4L40ldD5RmBgpMxLSvRCK4B+vCuq5/baX+cnaLw==
X-Received: by 2002:a05:622a:1cca:b0:4b5:e871:2402 with SMTP id d75a77b69052e-4e41cb1502emr12325961cf.18.1759259670924;
        Tue, 30 Sep 2025 12:14:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4e39107sm36070581fa.17.2025.09.30.12.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:14:28 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:14:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Fix dependencies of
 QCS_{DISP,GPU,VIDEO}CC_615
Message-ID: <t3rzsvmepjoyhlmyldvttn3dopxfgoqcz63os44by7iu4r4cgr@crkpcwpaetgo>
References: <20250930-clk-qcom-kconfig-fixes-arm-v1-0-15ae1ae9ec9f@kernel.org>
 <20250930-clk-qcom-kconfig-fixes-arm-v1-2-15ae1ae9ec9f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-clk-qcom-kconfig-fixes-arm-v1-2-15ae1ae9ec9f@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX634XxEI0Aw0+
 TzRI2bqF4HbhR1sUexdMxRB30MCALZF8atV0oI/8B3gDw+Z4kdOnfXPL+AP6QgGPew+HVY9xZGy
 oZ6axqy2LX+QhRS2pF/7lOSLgb6h+hnmFs87RZp6G0oI+eB5J9bKwiFGi15nKNs3Tx08nM6uE75
 ilG/PDYyYjtp3GOJz0r4/DRW04jhm2ESg9mEt/TuDSaUDpsx+n3waGDmkP8AqdAYCS3Y+CWTLOU
 fEQkD0ywISv/iRXca+z/UTbc3Z3s9eJHWHHJClSe+cvOM1BMrF80yEHmimEySNaBo5FJxYTzop/
 HbIBChQG1HiqE9tAhzcvsFHqnpgw69PDhDYdEOK5l9Nx2FWN99nEz3KunQSkrz/G/CBiosYaN5H
 46j3/JKYhDQn6j3yN4bYOjgk7TA0qg==
X-Proofpoint-GUID: WG5qRHI1xzxYjFG47afHvtstlt1ZQq9N
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dc2c18 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zds2va5xP088SW_5QeoA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: WG5qRHI1xzxYjFG47afHvtstlt1ZQq9N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On Tue, Sep 30, 2025 at 11:56:09AM -0700, Nathan Chancellor wrote:
> It is possible to select CONFIG_QCS_{DISP,GPU,VIDEO}CC_615 when
> targeting ARCH=arm, causing a Kconfig warning when selecting
> CONFIG_QCS_GCC_615 without its dependencies, CONFIG_ARM64 or
> CONFIG_COMPILE_TEST.
> 
>   WARNING: unmet direct dependencies detected for QCS_GCC_615
>     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
>     Selected by [m]:
>     - QCS_DISPCC_615 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
>     - QCS_GPUCC_615 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
>     - QCS_VIDEOCC_615 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
> 
> Add the same dependency to these configurations to clear up the
> warnings.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver")
> Fixes: f4b5b40805ab ("clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver")
> Fixes: f6a8abe0cc16 ("clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/clk/qcom/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

