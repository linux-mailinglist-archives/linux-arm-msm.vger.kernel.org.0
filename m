Return-Path: <linux-arm-msm+bounces-54323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA946A89609
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01753188EB26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 08:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34102750FA;
	Tue, 15 Apr 2025 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBNP9Ppf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC622797A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704474; cv=none; b=SaFVH3r0wq1LGmH8lGfw+Gq9+gjF94yTDH7e8laKSg8+Jzwemvr8du3p4Kg4iWxQQs1it3pP0I70a2ea4fZQFb7vcXRiok5I7beWogcbf67zu6nfu7CPB0o6hI7geDASPr7a5puAbpcep8edEkIkNelOepB76S6q83N0g+Q1NR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704474; c=relaxed/simple;
	bh=NyNzWYetkJTOEcUyWJ6oeCzC6581aAO1Ja8RqfVJ2gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEVldmCp+t2bo52yvWw03O23ra6deNsf1W3ZYWoum8+Xdo890VhzwGdp4/f1HqfomPgJpGT4z/N+bnDvD//MYn0Dxmt3UJQrTEbzm40NLzdqfo+NDayjg7Y6+u1zVswGy+g/XGIl0g7nNKFK6+Fli41rgZ4ey7P7uLFvfSsSS0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBNP9Ppf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15N5C012741
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 08:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sfo0CAie457ANf0kjWKsPJLb
	W7vU/MFpplDe4Ai78WQ=; b=BBNP9PpfdhajR2945x3HlPCWnTuhBTegq2vbd7R+
	9EdR0voLPMPsh0+5bfEYHQyUAKrab+o8TEzLe3OCQyK2HwCbBRClz6FudolPF0uB
	buGgss9a83w3QqAh00ABZTcyb2d+a51058OAmKWHwtI1+H8VJeWJhDc5O4noa9t8
	plicwiLrLrwi0Iw5lCsC7lXo72Wu5gg+yTu64OCBQv2AizpSQ7XmFUT+43DSjehA
	3v1vfT6EC0cMe8NWgdBCzBvIy5/61VDCOUkuGo2YTKtW5e0m95dzmwzI+kgM7HCL
	/GrHOjNnHxnl2zYCZui8HH7issfMNVlLf87+FSiRzYMG8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6f68m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 08:07:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7c30d8986so359232485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 01:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704471; x=1745309271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfo0CAie457ANf0kjWKsPJLbW7vU/MFpplDe4Ai78WQ=;
        b=I8TRelKFTwwzZqCMm7i8+KejFvTcPO0T1kmt7S49B5ko6/Syg4MtVM5FccC339TCso
         GSaIfsveQBFCi1gWO7oQDfShrp2vTygTfAIN6WT8bTrX+9SYl9Y0NbcHStbeyln8/3ok
         LZ2ChU3GtdlpcmzecYCWTgllmQRVz7TIaiaNClaWcr0a6O0EA8iKolxdgJAoRblbuqgD
         qgGs4bLEV9drQrd66tn5GnUI2pxCAwX1p9bXkgQtx3N2jNwa+uIJJ91J6FfCWVjSQAbW
         AihGbn2FeuVY0x1H6y6A3V89aK9cNEbk0cEnxy7nsMZOycXiDYC18CKnsLVbHZY2FCps
         l0uA==
X-Forwarded-Encrypted: i=1; AJvYcCW+CBCLkRTgKgLDoyptG/kImOB/r3Zv/oq8HJ+nuqcHNvLCxXETE5kTxMx5R9XUrhZV0niJEDa6S2YtDMPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxnXoLNCxBD64Ox/1fdvEbHOe0+/jDF6de1r9BdBHJE7UdC2KCK
	XGahK2MHmdjVhteFlh9eUaae+VTGE5j/NvsdLqrCwolyGRmAcMItcOnyBtwwx8Egcbx2jx3sl+l
	m25SZOeRhgVTwaQ8ar3Jj3gXIh49Fh4aV3sqpLyGacWDceeIANZJXHHH28MrSAS//
X-Gm-Gg: ASbGncufYxuWz01CZ0mQ30J7IR3GUVCDZx+k03EDQIrExkwR2Tn12S1qDgcKnSAl5Jn
	2laVXIOtBjrp1Fr/STEOpsqXoxqEwPiwqIOMeUk8kTG8Owc6e5Kfw+R9zL3XYE7jvxbI1skxZfd
	ffYz/G2NfQfbz7iII2n1QEjkdidj5xc7FVZQTQhSI9fVSHLXsfiWaDQ2DgIEUBDWjux4IxE3d6Q
	S40nVbHrHejAxEqKi4BVSXDwjrbWmtwPuXft6+ruvKfhKmThrlingtP2UtVsZ7xR5DJEoYXcrLV
	Cak/V1LlvPn2Khbvpbun8owTdxQDDXarajdOHOElY1MdjvRgDjGVRk9zDPckrkTNoK9zFan9+SY
	=
X-Received: by 2002:a05:620a:4627:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7c7af0e3291mr2024046785a.29.1744704470916;
        Tue, 15 Apr 2025 01:07:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9hUvwu6zZUyY6fvtVdyJ4E4LxMjO1kvcyqX+7MW3VKl++jBJZlmvKb0i86KlUbaBirAtYaQ==
X-Received: by 2002:a05:620a:4627:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7c7af0e3291mr2024045785a.29.1744704470658;
        Tue, 15 Apr 2025 01:07:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d238bafsm1329060e87.65.2025.04.15.01.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 01:07:49 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:07:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] phy: qcom-qusb2: reuse the IPQ6018 settings for
 IPQ5424
Message-ID: <jli32pwz53xmyymhvud6nsdc4b7gp4mhdpsg63yubnbk2fpv5k@t2jl4btfuq3o>
References: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
 <20250415-revert_hs_phy_settings-v3-2-3a8f86211b59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-revert_hs_phy_settings-v3-2-3a8f86211b59@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: G81cV0-CFep6OrpBD8h5rNiSH0AKsnxc
X-Proofpoint-GUID: G81cV0-CFep6OrpBD8h5rNiSH0AKsnxc
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe13d8 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=SwJ4zpY-I9peookiyZkA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=804 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150055

On Tue, Apr 15, 2025 at 09:52:51AM +0530, Kathiravan Thirumoorthy wrote:
> With the settings used in the commit 9c56a1de296e ("phy: qcom-qusb2: add
> QUSB2 support for IPQ5424"), compliance test cases especially
> eye-diagram (Host High-speed Signal Quality) tests are failing.
> 
> Reuse the IPQ6018 settings for IPQ5424 as mentioned in the Hardware
> Design Document which helps to meet all the complaince requirement test
> cases.
> 
> Fixes: 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for IPQ5424")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

