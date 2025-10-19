Return-Path: <linux-arm-msm+bounces-77929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DB8BEE949
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 18:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B5DD1893397
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 16:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4479F2EC0A0;
	Sun, 19 Oct 2025 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8NTMZQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1792E03E0
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760889699; cv=none; b=RaNlhlVOrEjP3ATu0HEDJvC+wbHVm2r1dNqFU0jhqwltDRS+NyWUP044UBgG4mGTC1d+Q0LYqSi8xffQehro08TKYnKDAGGOsN7buFwj5vhDVhpAKb0FxMR8tFRWLg3eYnltNxp7pp6HYbkA/8low3ko9/uB4N8wMIf+nud5G5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760889699; c=relaxed/simple;
	bh=Y0iJ/9eyYoK3n3lm0hBp7ryvH71Ibi/uouxRKsL8GCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEzQSZ3ZIAwU4g0790/otkQVNwb/06ikiUPqbTNnPxEGJnye3Kfg6CBuRK446aVk1AEBFCz5uSIum0OsEYLyG16kFmF1dOG5eOBZZSXY+3jsxbDUdCzVhCYULSoMoPdqJBwdOj0G9qPSaonUg46hrLHlNdUkaRwyJXu/2VajSRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8NTMZQF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J4F2GC024567
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 16:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7rP7pPU2oH883opYvKMVKA3t
	WKGuHzQFE50XbgQsV2I=; b=I8NTMZQFu5H5gWjo1xihfJpbicuFbwvN+TinEeDN
	Tn3HNQtK/qY7cfH9cEd8lkpZVSYYtOaIER7kdQgUJzerkOlvi3Z+Z0Ridv3T9DaY
	ZQ0wYvJmY/9wDDJT4kvDCaTHzTx98X6xLhujkKoivfVH2oxdVzCWOnuDETP9XWQ9
	22fZqEdepDld91YJBTVKOpBnWb0EPLUxxjJqGqSOdTu+7b5xhmMFInYlNS5Im7CQ
	f5SPwivV6pX3VXlmA58sgF5ffcLHzUSIMXG2Ys+gimr0LYjHaMS3SN2g6RgXytLF
	pidetQtlOHVXfdTn5BO+S5zFHwuqBqxGpPJ3Z9xGHDr/DA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3982jt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 16:01:36 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5563f974409so7621420e0c.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 09:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760889695; x=1761494495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rP7pPU2oH883opYvKMVKA3tWKGuHzQFE50XbgQsV2I=;
        b=dOgSS73noZO41nAc2JNh6hKBSsw4fsXtyaBxyNydQbimVT0LSolrJObz9w3j0aWPke
         pNKePVh7jS9S4sBLP7LEsTHoVj/8VtZzlnC9uNu3qnqr+MuZeM3rXmcywSXxynAUwmPX
         lgi7SrgwpoSfOHGA4iHmjUciLcTHW+CVNqEzfddEu+/ISWmpOgETsgkTFhyIz+VcFe/w
         SESjQmYuFCghneI644l24c+kdWfWYeEE3o2umAe7HlYkWWU3eemlIdB+5iYsjKv5xiH0
         AE2rKqiLcutCPTBuQuVpSqr4CnrT52ouaUm4xbuGssM59DzTdeKLlklPTlgcPBBJMMZT
         jg2A==
X-Forwarded-Encrypted: i=1; AJvYcCVxlueofl40rJdGhTDL5m4UxzaxKjnd8fOYoRuvT8kNFhJBaU/cbhXWTsvcU6fZ2fdv8oK7pEm/9seS3LDc@vger.kernel.org
X-Gm-Message-State: AOJu0YxPt7Jsyrul+8hn22+2XEwrP7AuOLZLWYT8P63Gzc6nCFavixCx
	MOO0Ar8HkMW/bF3QpbkuxrPBQfbonNWJZjwcEFYERZD2pzK845BwR5GNQeiCR0PIPrtRJFlEQU9
	quyYVYqDKo4aqA/cS65u2QT9Vuc85FZXkAZeCPUUtxvZDqld0KcDEfVNq6SWsgqyWne44
X-Gm-Gg: ASbGncvCdvO0MabanoofCfaC5i+ZfSQSwp3oqR/1XUoITTgIUAh9MKP78/gYA0FM5eA
	a61hRq8svLDQCOzLrFT6LiTwvBoczuTlhzExUF1vg3qKTIDodqI8ZRbwpFpcGnZMiTrII3IRds+
	7hBeb6nxiYW0HPrnuvzN6rHD8B84ZwZtUO8kP8QWIxpHMj0eUgdQEUEfNQRMe/O2/+gOHMlN8oz
	ZJqFapUdVENPJgzvhhxXUptCcyJZHkPanH7ewEgH+Gac+slBcgidJYzXLB/1bMICPa/+iDqXtNg
	CSrcTw1UsftculSpdmoDuFN6wJgIF0Jn9Qc4Kc9Ym3/zojHIky1HLwhPU2ac/Yf9hmpfX+8axwA
	V5+klIQbmE6DXe0TpiraUw2mamSk/SFes8sDLQTrSCc49VqYg4XvW3UYlIUcdpzm6VcPUFCkb1f
	nC75LHhI4VOBI=
X-Received: by 2002:a05:6122:3c56:b0:520:64ea:c479 with SMTP id 71dfb90a1353d-5564ef2d46fmr3526028e0c.10.1760889695634;
        Sun, 19 Oct 2025 09:01:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4xGLbXTGWU7Ds5/rjiYwy6R8sjX5nyK0xmuA8TsMBsOkfH3epiqp7Zx0TK0V0Yx3i/1E7lQ==
X-Received: by 2002:a05:6122:3c56:b0:520:64ea:c479 with SMTP id 71dfb90a1353d-5564ef2d46fmr3526006e0c.10.1760889695208;
        Sun, 19 Oct 2025 09:01:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deea8cafsm1678400e87.2.2025.10.19.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 09:01:32 -0700 (PDT)
Date: Sun, 19 Oct 2025 19:01:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add '#cooling-cells' for CPU
 nodes
Message-ID: <itksdoavfha6xnozfrh5jcc4g75gcfyxp7ns75yz7xfb6wruy3@qwkcavvxrljp>
References: <20251015065703.9422-1-mani@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015065703.9422-1-mani@kernel.org>
X-Authority-Analysis: v=2.4 cv=KcvfcAYD c=1 sm=1 tr=0 ts=68f50b60 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=hfyut2BFMVRvG-c22TMA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfX0OWGXh2XHhWW
 Kg82J++g/07XeR0/HnuoQTLrMCXr1u3mbpAWJw/rw1w+tkVFpMwoF+va7JZAepDZaT5F4K9kLSO
 3jjc2n7a3t6VoJhTAh5+yrj2P+76ej0wTlD4x92ShhvWo+CBOqcKXthp7dMZ+/w831dwU9ecxZQ
 xG3uNcDQi9nbD1D7UhennXODHhISjKY9c1doYPh4S/cTMOY1px6x71jK9TzRFej9jSGDdduBgOy
 pQOTeesigakk2XR+kq1atd/eNAp5ICdYuK8s+6bZhE730Kbq2CcUkb7ubu9g04XjEK9VYs0zos7
 0VRwZCwMjYWt3YVEAG0Zfbg7pNRBrA+uQBr7+e/WSQ6sB83lAl6UrN0AWlCHGazqKRes99aFaRq
 yu/7R9gpWtglK6TYO509rlENWlxadw==
X-Proofpoint-GUID: ybNQTycmVEBSTqs3ctSBSb23pkPsKQ1J
X-Proofpoint-ORIG-GUID: ybNQTycmVEBSTqs3ctSBSb23pkPsKQ1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180025

On Wed, Oct 15, 2025 at 12:27:03PM +0530, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Enable passive cooling for CPUs in the X1E80100 SoC by adding the
> '#cooling-cells' property. This will allow the OS to mitigate the CPU
> power dissipation with the help of SCMI DVFS.

#cooling-cells isn't enough, the devices need to be listed in the
thermal maps.

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

-- 
With best wishes
Dmitry

