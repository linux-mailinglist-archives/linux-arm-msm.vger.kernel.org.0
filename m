Return-Path: <linux-arm-msm+bounces-85281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A3ECBFBA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 21:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE5CB3034A10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E03E30FC09;
	Mon, 15 Dec 2025 20:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oo+FxrqY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPUX6py7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D0130DD09
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765829969; cv=none; b=qx4KmTlnkTS9RcZzY+wXueoUZd/933HLQJSNtuHKz7VFfutP1p4e62HUtgCVLZqsvf/+uXiPDYPiJlNvh4GOxHepwEyUhHD9Bk9dVhgpvQgHjLEQg6N1Ry239SSdJSAWDa9HWZeZsK8sy/qkVRAhGLdHTq7JtZoKT7b90k+2UXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765829969; c=relaxed/simple;
	bh=ZctggFCKGNPdOVeNvoahy6lhLTD5GnVrJTESbZ2zFrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlknEeIVDKLrJAf13gMekEBe0Y8ZmrbgUuXpjaTAh8P2/4PrNXv9r9BW8Lkvbl98Z9ke0/MlCcsLSIsafNuhIeZRFUcpHGlZQ5oARfmaUcHJe0OR6MbbDbAvjmv0WD7bQ0YcF8ns94yE8BQU51Izm8NPvmHV2gEkgEqn97qpxqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oo+FxrqY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPUX6py7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFC5B1w366904
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TT1d0umxtClSU97VLqt24Auu
	oQHZRtR4IuDHXfMJgmU=; b=oo+FxrqYaWe59oSZjqGDjlrKUHn4+yCsEiH+eDUD
	q2J/7JqAuZajXAACZYYWYehxd6dCUAKBPATODxPtEIZliQW20/PRzL8RetAZw1dG
	dLpogUMYM6eA8ZS+3dWG4xjrM0x9BIaj3su58n+g5gT6ygokYEHOQi3E0LePNJaH
	JZbBNFKgp753VyQqYySt439nISiCYiAqo//I/1NKPE91hZ4zT1XGM3Rd7pI75r6b
	vPepr04AShaY4RfDDa35q+r9Es2KsVCMTstb19DHuTTIP6KY96Lfzx4Dr6Buih/G
	UDKKke0qsh560RrbeDktMaOBl5+drSOTV5RGbvd64ZnVbA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2j1c1f4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:19:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74e6c468so55128371cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765829965; x=1766434765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TT1d0umxtClSU97VLqt24AuuoQHZRtR4IuDHXfMJgmU=;
        b=cPUX6py7NJouTpFxiuL9KWAcOwaDH6iUvj4JMObiGz2kWqWmr1WxW+xoGoyyDNhFVP
         gWpFm/p5xD2tpNj7Ec/5yUMBHFsgzIvAbVuhIrlB/0iw6CzpN1MSXeiw/Wzjrf8ruWlG
         lssEDUfbKqQUumayJ4gBeVPc8clXupmSIsI/d+F0xo0ca28Cm/w9Wd0HRxy6C5LNMeR0
         JwGBxEdyW7078ivBJWJzSLtoF57UK9sp857Duyjp0sEQxNwe8uH/Ryy4Gsq4WGZh0wgY
         mZ35Nuf/GcV4avoJXToF3BC+Ztam9b+Bq2fJGJKVS/y9HLyY80cKVKMfdWozKY8i3zb1
         gj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765829965; x=1766434765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TT1d0umxtClSU97VLqt24AuuoQHZRtR4IuDHXfMJgmU=;
        b=IKD/4J/bY3PEZo0Ikj8sae5Wuw8qtZOV3xSqmiwMazGdUbIGqrroDxAGT2orX2EcfI
         oE1aybLY5p/rCGZxmUSZzVtkzwUM1dx2SuAOkttBKwtwD6v0xWHHTnA1BTg5zUon+YYk
         uwh/BUSQMT38U+a70furJla5aMq6RMsIgS/m4PFjVv3N/PhEB/VZ0O9zJUx2IgSRFDpx
         VTHCbHV+O5PRW67crzZlJDzIHcxfeQnrd6NV3hhSBgR0t2ZLGTmJgW4/i/xwHgccIaDX
         lJtlSjOw48UebOXhMuc3SSjLeLZrPluChMB5junet8EECEh0dPkp5B0BGu5tBwpQPKtI
         Kx2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+JQfql7kEl+3b5tKMBvuAQEUT8BIXgD3PnHVhXUIi3uSSm4nhg7iPoVxAIWDqTZ316hiUHlVfTpLQrvzc@vger.kernel.org
X-Gm-Message-State: AOJu0YyN73UN4Iqx7KHyw8TXkqvwOUS65XGH7w++pc/cKukN692RRhqb
	aGzo9+p8Q2QcaV0BHAlnmrMhXJT2DqXpCtkj2SItH/PtvKcQypwGsA2MWdb2DgdYCC9vn8Gbcuc
	yhv0txxy712/jg7/kUOCGH4nO0rgs8SCgNdeQFl2ErAF1k5F3+modj4Q/P8rZiG35dqCc
X-Gm-Gg: AY/fxX5XsSQ3vqogsn5ZI6duxcZ0fzKY8I9ax1qvidZmY/cLoOFvkkR8fdSWNM9eZR9
	5P17xujiBiRJFEM5w5Y77JM56GHthEREqDA5eopNR8m/G8srNQf2I8drbcJaaHpbR5C/ZLJ/fQ6
	lKLHYrGDd9B/pXHexJKx7tG0/sHyWJFsI1dqWUOrPDJi1IlHlfHtgNut81+/FuNRWt7Bbzx6oNL
	uR0BOJqs8xuWCFpBK0s7uI2iNtNAZxON1UcsGsM576v83W6o1kCjOL0AatrutQgn4AKyyPg+zYc
	Xa/NN4BSsExyS+I5pmrq1toIQLEMHgvzdNr0Y9zUZctoUIfytPUnEbTjZHbrWFsTp0ucmAkHIcG
	CI4x05d+SHrziFou1XOieS4m55TDWY2eyOU/SWgMN1g39X5whqu+EHBArxbh0e4hIoN1rYjGXXS
	mxURx1unZ7XmF5O1cZRyj7O2g=
X-Received: by 2002:ac8:58cb:0:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4f1d01731admr166123811cf.0.1765829965173;
        Mon, 15 Dec 2025 12:19:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYJEfX+zyhyh7P4YyfpYutO7MWGAMPIszFLOtP6Q5AB6qwEWt1FE10FnaLONq81p+uNug+bg==
X-Received: by 2002:ac8:58cb:0:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4f1d01731admr166123181cf.0.1765829964435;
        Mon, 15 Dec 2025 12:19:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdee14645sm31330941fa.46.2025.12.15.12.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:19:23 -0800 (PST)
Date: Mon, 15 Dec 2025 22:19:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Enable cpufreq cooling devices
Message-ID: <trajn276nneqmpun5zh3w54mfglf64vl7yea2n5hzqq5skxsqf@vckpmhfchcg3>
References: <20251215045451.3150894-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215045451.3150894-1-gaurav.kohli@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3NSBTYWx0ZWRfX04BJQhMf+0tr
 nJjTpeN2mJH3N3huBH6mUa2dxiO2AQACb5dmj+prrcFhvq1ylfsemMVLDLeQgq+E+IYfvKFucYu
 rBncbgKDSIlKMtdrBon/YgcowaeC9HX/gHCZQ1a1b+EVeYNPI9390QVf0/yGgAO8zKk/c2Be5Wv
 PrF13M+FWhAt1R0CTsn/FGP+vftnlZ8VcLYj/4gqTZyBDp5RLe0+jcz4mUsT0iOQDNaw7TBAgBP
 xVkYdFoKQDUMeYGOAwlmbGTjjaDnwkMLTfKU7Mx+IBQ3TbKunx/gwu1N0K8DjLzI4ijbHEgYl62
 tZTX/VIb0N+mKVhgfueGCAinLKYMvX7hXotZ4pML3gv5T3YWYdXxjpBAGNwFWIVW43Fmvot1p08
 GVFIJl2Lo+zqN2dnh5UNGmjyDvFllg==
X-Proofpoint-GUID: CNY6-zYuWAXpOESsugloT8AvAwUdGUZ2
X-Authority-Analysis: v=2.4 cv=ceLfb3DM c=1 sm=1 tr=0 ts=69406d4e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=we9lbk642uJVcpOj0xQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: CNY6-zYuWAXpOESsugloT8AvAwUdGUZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150175

On Mon, Dec 15, 2025 at 10:24:51AM +0530, Gaurav Kohli wrote:
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

