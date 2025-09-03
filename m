Return-Path: <linux-arm-msm+bounces-71907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 641AAB425CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 17:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC18C544AD2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137BC283CB0;
	Wed,  3 Sep 2025 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoqhkWoK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D23284881
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 15:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756914469; cv=none; b=lhKOr7z4dyZU0Xelg8my7y4ddYK1z4wtH8zqa3AqPJujHg0GMBVbLh6P/uI4T9EG3liELuuEL/R86eYAK+Mz51IxAyRj8Ue3DWoSPBsKf6zPuFGaVyIawdmrMPQAwdpa4T4fulEmw3dvp91Php+5vnDNQCckHpMUyx6PwWCzUVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756914469; c=relaxed/simple;
	bh=XInwh7iVomsQx5qogF3hzih+Y3WyM16GQrfW14cftWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBZiJS/kEk02IC56y8QEy3uAGdzxeqIDGttlaL4fL7zLi1ovUNNkTwXLelPvYrzAlBuuBatg7p1KLEf7UyIGre5FmHqKxfDZpT4pVqsHla1dIsP5isB/l6rp1It+LS3nyzWrfAKlT6zibbQUBsamlHq4ZXAYVygoWkY9h+Y70Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoqhkWoK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dwp17029576
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 15:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oU9zNSZ+JNQecUFr9QN7ywvBOG1sjWRxRq01g9yamiI=; b=MoqhkWoKRseuQIXB
	zhRJ6euWY97pDSUuhd3mKCZpuIgDFvV/gqKtF8qamruclyNzXc6uR+s/w1GXm5wl
	mOHlceyHakYFsQU2zLvvRoZF1urhyT0xldpqnRx/iZnPzn4thFCjDJ80HDATBZ80
	+Bkg9dZmYVh8WKf7PenuHvVjizd43iSjFLxK9Cqp/M3+EsOMA6jz1w2DLotpCoS5
	uCqGKy1LarQoximJsUB9CeBPnzw2viL3VacWZA0IUK7veCA2hDogndrU+gagpO+c
	3BTzR43Th+S5McMANst+BNgapNJBsojjIsnK2OpJazJ+vxAxm/PUsgKqYWuHZ1Iy
	AJd+lA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpcdag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 15:47:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24ca417fb41so927915ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 08:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756914465; x=1757519265;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oU9zNSZ+JNQecUFr9QN7ywvBOG1sjWRxRq01g9yamiI=;
        b=q6YjnzQK4frLrTEfd/qR74gkLCfWEgqmXe/ctUnxaup2wp1xXhd+WICxDTg6KcfARv
         bLD8yKV2hSp6y+FR8c2NkwYz+kAsAbCSVwo0Xy8iS5kD78mB3wKIYvEwjw5ovfAtcL42
         MO3S2+aeyeoCjz6HJVacPD87rP+pG4vlB8P9C3x04wF/XikWuNlNF1hq91MgYDc6MzRO
         vB+K+r/oljk2La1E1hnRtS6XUIGRqF4XFuNtbkhwifwBF1pFUqhYq7y1M9a9AAtObJIh
         DT9bP/csWmjeO/88K5lJvhucFGvZKAEGlIxD85P26vcM4EKcPVSGeWzKPCDDtsgcYKoT
         QgMA==
X-Forwarded-Encrypted: i=1; AJvYcCXtpNoJPgIdNbYBQn6WpryBGk3nWua9eNoEk1MTArOtQLTkRfn+OAi7ePt5umJfEjir649nFMwh9KpPOgcI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6mQp5rsV5t25o51OOKwkiShgVKEawnAG80/IXKx5rUZV5oXgM
	i7Sm55/ALLEQrDKaXuaVwzAwX28y0P8jTayHBY8V+EKCLxtGMcrGs1K5I544pbWlWG3F0j4Jy7u
	3rwlvq2oH6yCbW6iYFZVpGxMdjBTPDlRsoySja3gChs08KZvFCXHSix7tBUgpCFowo2Tl
X-Gm-Gg: ASbGncsbbCyqeOQOwMSfYnfVs9Xb7l3uJE2+R6Bu3x8oz9s3iVsM24wli082YObBJpD
	oGsOpjKpdlHgr662Sjo3/tTTTbtrdFq6VM8tG3ADHSh7LbMSG+pinTp/hKfyPTm+Xi/7hL3kYD1
	+ZOebQcXi28IRUzSGozJQLicw/3KUnTfBkaqSlA5nDYrWIBPqrr4X9K6JV17LrC5JieSIcv7n/Y
	zmpmBuYiZRBBaq/NaUj4fCRZphwwxfyMxHfyfiMIofuhTk9qMQ1doUCdg2MWjjsBc0wrWeKRxzA
	SWhZdSqhhf+f7L+sgSqhBcQ8G4dJwp2ADMn3+8xupFTL13ZZfUW51rwDaByEHGaus5cN
X-Received: by 2002:a17:902:c950:b0:24b:1585:6363 with SMTP id d9443c01a7336-24b158565c2mr73678125ad.8.1756914465239;
        Wed, 03 Sep 2025 08:47:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4YwLQKquajxMk71cIseTHOUFmzvVFh27auBfgVNaa4odZqX0nZOQA82oA2Q+AJfG8X0fGzA==
X-Received: by 2002:a17:902:c950:b0:24b:1585:6363 with SMTP id d9443c01a7336-24b158565c2mr73677845ad.8.1756914464769;
        Wed, 03 Sep 2025 08:47:44 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903705b91sm166483095ad.12.2025.09.03.08.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:47:44 -0700 (PDT)
Date: Wed, 3 Sep 2025 21:17:38 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>
Subject: Re: [PATCH v2 04/13] arm64: dts: qcom: lemans-evk: Add nvmem-layout
 for EEPROM
Message-ID: <aLhjGuaAybp2CeIg@hu-wasimn-hyd.qualcomm.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
 <20250903-lemans-evk-bu-v2-4-bfa381bf8ba2@oss.qualcomm.com>
 <39c258b4-cd1f-4fc7-a871-7d2298389bf8@oss.qualcomm.com>
 <aLhMkp+QRIKlgYMx@hu-wasimn-hyd.qualcomm.com>
 <aLhZ8VpI4/fzo9h8@hu-wasimn-hyd.qualcomm.com>
 <c7b87a26-2529-4306-86b3-0b62805f0a2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7b87a26-2529-4306-86b3-0b62805f0a2a@oss.qualcomm.com>
X-Proofpoint-GUID: 8rfC0-ePU6MJL2u6YSLyHDr2WdsWnJ3S
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b86322 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=QqZMUp9YY9ei_m5RKlQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8rfC0-ePU6MJL2u6YSLyHDr2WdsWnJ3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXyuBZkrjDAtYq
 feKI9i8uPYlwtDmOcqcc4emtFCyHVWb4afVN6DVZ9+mccKLlCSzEcHMP/EZTL8/dtifFEqjMNzN
 7YB++CBAaG0+YecABO/1abBOLdWwtoqOSolbshowdctj9YZX6BmzDAo2W1aDV7k/7p+wIsKaRru
 iMPJ4lupZNm54UZtxU1K6+Kzyt7N8uybWjQoUnCPJcQ36hiRUHodYzBrrZN0V3ZD9Lu5fTYNPEi
 SD3KgpYVtgEtYqjWggTqCEXPNu2GLvgQkYoNfUKbesHrAMf+TMoX9q68cKkAsT90wcW7PAFxe9S
 khesEcRwibp7YRWsf0/Td4zK1SHlQqGRFkOtCcqvxAVlcjWcc4cARaSoIzRUd3SGl0U2YX4c+NA
 06ICLLn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On Wed, Sep 03, 2025 at 05:12:44PM +0200, Konrad Dybcio wrote:
> On 9/3/25 5:08 PM, Wasim Nazir wrote:
> > On Wed, Sep 03, 2025 at 07:41:30PM +0530, Wasim Nazir wrote:
> >> On Wed, Sep 03, 2025 at 02:29:11PM +0200, Konrad Dybcio wrote:
> >>> On 9/3/25 1:47 PM, Wasim Nazir wrote:
> >>>> From: Monish Chunara <quic_mchunara@quicinc.com>
> >>>>
> >>>> Define the nvmem layout on the EEPROM connected via I2C to enable
> >>>> structured storage and access to board-specific configuration data,
> >>>> such as MAC addresses for Ethernet.
> >>>
> >>> The commit subject should emphasize the introduction of the EEPROM
> >>> itself, with the layout being a minor detail, yet the description of
> >>> its use which you provided is important and welcome
> >>>
> >>
> >> Thanks, Konrad, for pointing this out. I’ll update it in the next
> >> series.
> > 
> > Moreover, I notice that compatible definition is missing for this
> > EEPROM. I will add it in next series.
> 
> I think the pattern match in at24.yaml should catch it
> 

The EEPROM used on this platform is from Giantec, which requires a
dedicated compatible string.
While the generic "atmel,24c256" compatible is already supported in
at24.yaml.

-- 
Regards,
Wasim

