Return-Path: <linux-arm-msm+bounces-76696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62554BC999E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C4564FA9C2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEC61B4F0A;
	Thu,  9 Oct 2025 14:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dKamZcO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327DE2D877C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021125; cv=none; b=SGW2d/J0vSFrZST8T6FpsTS9Qsc9xI/n5XBsBFicC+F9ogSjT4WxhvS5JpQ73Z0x/FjsIwFJAI3ocIRxEhIV/vjSWdpZ1hUU3x4Cuvom5nA5hOmFo0vw5xD/SOhL5nvPzCskNAJ6EOgwCI0R3edRk2UXQqHEVqy6lwWqZgRBM8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021125; c=relaxed/simple;
	bh=Wpq6X2Bh4pWgoixvchHMpCayL0dRsdmKyfhfouSikNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q++5jk/wM46oL81ZjgtzcjACGDiVh7p5jj23fxc83rQWcPEQbduf/FSKzkBeVzwjc5GUy4XFnWFeWxmLuDxnfcFKi53k29u2R0+4t8ttS3/bhputFuQ5FA6LvoIVKRxHv1X36pCb4OlHPmi8S1uQj+xQaBrGYRygp2IFFH+3NnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKamZcO1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5998V3eh031866
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 14:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zS0WtM/F0U5NDqRQEtXZLsZ8
	HXMsmD9R/IgnETcvlU8=; b=dKamZcO1PgD1eBG2bOoP2bTgvej76gs+GV39sjRY
	D/FMLr8lm5c5vEAmGFHfpPSHsQWxWYpj1RI2m4pYgU4nx+k+eZ8SNm+GyGQRY2MN
	S4oa3FBi7sWMvwuZGPmqBDZInsNgeIi08TCi8uuPz7YKvXCtET3K/PTNmPAA0kno
	OHUyElwGsdJoKt0tq+VOEf3dVtEc2Uuwwfq+c8uBwOcWgf+w69AQWXHadET1m5yv
	+NgioEwbFLzZQYvPu+TpNgcSMkEmCVnZtRHE1fmk+paRKFnce/qean2E9nuLA2D3
	vqZIP6cPxSsAZmCGTSvdUOKNy2y8BixFCdHTVpcnltcsAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49p9m0s5wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 14:45:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de53348322so60972991cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021113; x=1760625913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS0WtM/F0U5NDqRQEtXZLsZ8HXMsmD9R/IgnETcvlU8=;
        b=mZApS+EM0UigBTTVaJFX103XtmTOG97AOdNSJTg+MJxpZLRPQ+MyP+Wbrz+DVRzVrF
         SR/Qsy/ONuoxe2O7dn7M5xegBZexU1TYfiABmZyf+IObxBiQ/ZkU6WMuxB6h+DwDji5b
         1uY+bcQqOo6JxnhBPWyAYUUOumuLtHjAzAhy3Q+YRBfo7CsZcyobvD5/wpd1Y0ejaVzh
         t2mr7FTZP8vrAgthU9oAUdRDg2ohZ09AJC4htoPJIcx706prld7iosk7MVFEjWO0+wk4
         lNcmGhyW3bD8qhUibLLJTRLkk2LQebRrc4HCBbDr6wx0zj0OSp10Hc7UDODzYA+piuw3
         XI8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUz4hq4pC5UGvG3F52tuLxFFR0Yf9ELnbt7d0YznXLkS8Ofj//2iV0vk8qQUn939ZMiqBo9YK3vDWfdEVlv@vger.kernel.org
X-Gm-Message-State: AOJu0YxT6sX9eSgoNeU45QV7v+ficf9NwrDbSqkfBw1LvUSdUqlpjeXX
	7lVm82TcDALNLjwC3pEeWjeIXwffjdYTiBdEnouu3GpAXCcKxAoX/CWZscg5lDCDPQAlWKzkDo8
	TS7F39UFBOiI5+hHJ+DXbtoigYdffma0c8j4/iijBSRo4VZLJRiRkTr6DUJfmswvEb4tA
X-Gm-Gg: ASbGncuji4VpcilXBRjCBZFBTuUXo1u6sgaDoym6WQqJvnkOsv5rPP19cTxpIR2fkan
	M70H5bdL74TAf18E8sDR/NSp4deSE0wJrglJaObquVTfi23c856786Nuytuly3TilzJ4NNGuWor
	IfhDFj16Bq6NQ0+Ldc844Y+tfWSntjPAWpW0xl2DlVzAf1/oZF7xsD+oAzlqSyPK+0IOUqY2sE+
	KwAOPC7O+edKz+EGkBgayniZg/kPdEl1PZUKtIXJsc2To6JHfKRGhLw0c3l4D04XFNfjt2g/tAe
	nbnFAuJFNFvy2VKIrzQa3XqAWBEMoXS2hpNHQbMhoYMH+Qq1+EoKONMMyvIS2B/t4DFMLkyLnEg
	qMmzgkGrx3irHHf0Algu1q7lLsAi60blFL59bxYFQNUDasykmqHNYrb4fUA==
X-Received: by 2002:a05:622a:114c:b0:4e6:d0e3:ac8b with SMTP id d75a77b69052e-4e6eacdb2b9mr121918421cf.3.1760021113346;
        Thu, 09 Oct 2025 07:45:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHExsw3wuCbhIUXYsG7UAJJhdf1NCRTGbXdHExJaMXOVTC3+o0DKeg0yWshy0/W0pdkUoQVvw==
X-Received: by 2002:a05:622a:114c:b0:4e6:d0e3:ac8b with SMTP id d75a77b69052e-4e6eacdb2b9mr121917961cf.3.1760021112870;
        Thu, 09 Oct 2025 07:45:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907aeb40bcsm1095761e87.121.2025.10.09.07.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:45:10 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:45:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] media: iris: turn platform caps into constants
Message-ID: <cwpv42re6a6o7lk4jqetuwfbtnr65fuwcl5hcbldaxls7xj5e3@tkdngtx6mh6l>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-1-def050ba5e1f@oss.qualcomm.com>
 <206dad42-7a7e-5293-55a0-d6d5bc702c07@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <206dad42-7a7e-5293-55a0-d6d5bc702c07@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a/U9NESF c=1 sm=1 tr=0 ts=68e7ca82 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=kPCPtfcKM0uLTnIstR8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: KUV2yBBt5WPEcH1-TbAOaLTZY_NAJ_Du
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA0NyBTYWx0ZWRfX8pQAnoaMd0Wp
 sTMgYcM5Tlkgz+dJ98M1kTda13pybnoEW30KV1aAy3jisAV8OWsVwkTFgvgw0svjrZwp3o4p3s4
 7b5Ps3R71TBjjznfPacY1D//rGiqramEA5cDAbQPQ1DFVoZvHRkjYR+phvrh5gM+nYTCSCdbeRj
 KulKhzAIfR40/7tNtua0mHFinUQzNXcfaThF59n9PM93xFtQLAHbn1sKjYXRt0kEgM7eiOkU+g7
 pcEiTiHb6xqA/lTiYgMRxN26tdYUx7rWW/gt0sazFPbRRzwUs5/kf7vR17tHpmgVNw65ERftehM
 fnqaQZ7qKMejV9IrjINGJe2dpkDAwzz63zaiwfWsPIkKhgnm0m5Rasxve+JWhI9nMSdCCdTUEEU
 Qjyt62t3u6mGlAaL35KFt2Uoxt2YDg==
X-Proofpoint-ORIG-GUID: KUV2yBBt5WPEcH1-TbAOaLTZY_NAJ_Du
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090047

On Thu, Oct 09, 2025 at 11:38:54AM +0530, Dikshita Agarwal wrote:
> 
> On 10/8/2025 10:02 AM, Dmitry Baryshkov wrote:
> > Make all struct platform_inst_fw_cap instances constant, they are not
> > modified at runtime.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >  
> > -static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
> > +static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
> >  	{
> >  		.cap_id = STAGE,
> >  		.min = STAGE_1,
> > 
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Please trim the messages you reply to. There is little point in
scrolling the whole patch (looking for comments) to find the R-B at the
end.

-- 
With best wishes
Dmitry

