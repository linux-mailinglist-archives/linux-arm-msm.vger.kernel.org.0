Return-Path: <linux-arm-msm+bounces-69041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7DB25313
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 20:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F0E41C83C1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E232951A0;
	Wed, 13 Aug 2025 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCVOMLEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B94303C9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 18:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755110048; cv=none; b=Dt7Zn3Swv3Sgyg9YuSuF7hpNbEPP2IweAVaf4eArhUgU2n6K/v+A9SMq7cijxJF7Gs5pUN8vxNDS/nQvR+n629uXQYKuaDMYPrmeGDhSACEkJO+8gBIZYhwzGe/d2EjaAtSnhhZDCsnGZQGFTYaEKXM+SzFTjlJI2FL1dVvdeSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755110048; c=relaxed/simple;
	bh=kUmQTWdk9V+1tTkKm03spgwkSbz/zp993Uf4kyI6qYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVJcnDAMbeZQWbrRtedKsTUcdk9scUwG+ObKG0t5lH3Y0vlZaTwdxTLZhwBMHcfx1LCymm+jvCoCClzcuJDHnTXTTQaBxPvc0XMvWY7636qPsQMas0MDBexRat9pzoXJnPRbizVqzhQezjg+UKApeqhxP+D6MnN+UrZa+T5zbZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCVOMLEp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLgOQ013005
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 18:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RbbIuH/sdpYQmEVk3y27yRzP
	CIaqKohYYi4Lma8EvHc=; b=CCVOMLEpwjoUeubYXUwgO60fK4fGRxqJBt2VopID
	af+NFinWfYPdSmcS9Mvx/E7oYUqhlbR7a3+uUb7KZgYdpU5xLO9vGnzJAQNX5edH
	3e6Belg++OcKiag242j34WVcC0An4GP0AQGUqRic03FyXRx3ntrO6Bhjhy+wGbRy
	+YaL/20GC3xr/hWKG0hdO4ZX37V1GpA9YaROn7Ox1NVw2Dmof741zf6egnIvZk8F
	RRSVbwzZOV8LZI+dMFschkzTUX+mN63gOWjOS5wSNInEKmODJqa6btfjChksVZfy
	O+MZBn9IVb52WqGooiGcbrFDMIJw49cfRuZAz+fxSjJ6CA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6rrmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 18:34:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109912dd8so1819041cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755110045; x=1755714845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbbIuH/sdpYQmEVk3y27yRzPCIaqKohYYi4Lma8EvHc=;
        b=mNbQDlKSkizGLLBmSQ98mNScfCQpMZStr/t9lHwQXOuOcDo3tym8BYgTZZcxdwZODG
         H6kUWo4JuPrLn5XLeZTHRY90QAaKvvZo+ZsDBKPB9t4X00GDs+HQ52Im4aT6QSj+Cb/8
         wDyVFUgkW95l9w32+U/GVsiA2wcJb0GRetKkqCFgcuGCbMjFryNyPJdMZquswjzv5iiz
         Q97iI6zyjdlfSLU5OoQ1LyjPk6cGixAO8aGGqaMsOE2+sNtrHjihXaUB0MMO/hIFAwjl
         rQGZxTB6Z2rZYSoHNU3gOQCCPFnm0JgDJi8UH5lJIJXD1TJL5MDrdHV0+UbOw0w9yYlM
         0rYA==
X-Forwarded-Encrypted: i=1; AJvYcCWn2hIhZOw7/Jkowyq4QlX5+hZNT35iI0LbeMnEgt1rAWPO2C3kCCrSNBDQ91ZnuVmpLuW9S3++mzUOCe4p@vger.kernel.org
X-Gm-Message-State: AOJu0YxbHOc1mBRt/rsGnLJnsBSrjvV9yl74SQnVCwwtqf4uQc12qWt2
	qfFcyXs6N0kj6d7vHofrpgW/kHfA+b5zufkI5T9WzhigtMMBuUD8XT7wQ+w94eDJCDvdjssDNrc
	nzHHhiFojfYe8tRiasSjsjr1dl7LGkbcyUdzXwpyeZ5O7b5w19TIrd02/6IvjfBuVkP3A
X-Gm-Gg: ASbGncsbe1ykaHCd1myHrnC8J00OggRpfVDAyTh4LAA4iCKMx7jtdepWnDq3qvCBzOg
	BxFZDvIFqXjRG9kT+L4ZLYSDWJLQVTrG/yS/zlbuty4132ynQpx4tPfk57Go7S2J/IY8v3+nAZD
	lArcJPOqfT3G4Ka/jUdE56XqFoLkS7LWu5/EwjzN5NVHbg6CDd5+x2/jflNS9Hc+RQh5bl22WKt
	fNOW9SMerRsa35r60wdF/zWvzFw9D9HkPWTFY+803/67mkKznjsHofdJzPz8U6b8xTAJl8sY2MJ
	5sCkz9VzZTOGOSljNsSgR729esLERh8Y3+e2A48Hbq0JmRFVr65kNrTcEMYG8YgwiG6Wg7DYkzH
	GsthbOfNzxI8tZztR4kjEMcVX0sidooImZBQCVUwbsrW9GKlceGug
X-Received: by 2002:a05:622a:260a:b0:4b0:6b56:a8b1 with SMTP id d75a77b69052e-4b10aa62697mr3869821cf.35.1755110045026;
        Wed, 13 Aug 2025 11:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECb9y3wiMWwr7oehL+bvxb51ZpRU4zKOSDOO+2W9vdTGyFjzC5xHK+xSAYLOp0JqjmIz0mkw==
X-Received: by 2002:a05:622a:260a:b0:4b0:6b56:a8b1 with SMTP id d75a77b69052e-4b10aa62697mr3869231cf.35.1755110044494;
        Wed, 13 Aug 2025 11:34:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b9fd163dbsm4427551e87.156.2025.08.13.11.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:34:03 -0700 (PDT)
Date: Wed, 13 Aug 2025 21:34:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8450: Fix address for usb
 controller node
Message-ID: <y3uw6fcpv23cy2ghn32pqoz636dvd26s3y2yk66m6ivnm3qqvk@vi34nhwhusoz>
References: <20250813160914.2258033-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813160914.2258033-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX7G3sWteZ/8Kb
 Q/lUZhFAT0BoOTlkVMWZ5lyBoBSgDzSg4qezDfsctuUv3QHY1xwemP6HPZM04hPfoivz+5XIJTM
 f/hO2LrqCCAQgkBFUSaOljhCXqIToGmlRqsfWJ9LX131tNewQanwpIMINTysOaPSq2zK2qdpdj1
 iI9usxQYIOoXEnf9+d4fE+Q2EGv4UAV2NKoBtwwWnZv7b4S0UOeSqehduVnfPwObbM/xXfi+W4A
 l4yQaCS6RW0Jn5JzcYn/PyHo7SfyqRUxLNxS8+FCN9fBPcOFbfXkqvC8LWTUOYes78czuz/Qbwl
 YwnXG+Gky0RSJ0bNN9BrYQU9cYn4t/dQ27utWguFZAJA8xfv0Y5ggpM5zJxxYkcxiGr9kFB2SeH
 gCIIfD/8
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689cda9e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=jh6GGb6eVuZbO_8R6MYA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: b71tN5c_xf2_OYlumYAxGaiRI4cTSty7
X-Proofpoint-ORIG-GUID: b71tN5c_xf2_OYlumYAxGaiRI4cTSty7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

On Wed, Aug 13, 2025 at 09:39:14PM +0530, Krishna Kurapati wrote:
> Correct the address in usb controller node to fix the following warning:
> 
> Warning (simple_bus_reg): /soc@0/usb@a6f8800: simple-bus unit address
> format error, expected "a600000"
> 
> Fixes: c5a87e3a6b3e ("arm64: dts: qcom: sm8450: Flatten usb controller node")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508121834.953Mvah2-lkp@intel.com/
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> This change was tested with W=1 and the reported issue is not seen.
> Also didn't add RB Tag received from Neil Armstrong since there is a
> change in commit text. This change is based on top of latest linux next.
> 
> Changes in v2:
> Fixed the fixes tag.
> 
> Link to v1:
> https://lore.kernel.org/all/20250813063840.2158792-1-krishna.kurapati@oss.qualcomm.com/
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

