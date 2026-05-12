Return-Path: <linux-arm-msm+bounces-107161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDSSNHp5A2oR6QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:03:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3938252864F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E82A305761D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A93F25B08A;
	Tue, 12 May 2026 18:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aU6eFMBZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUBJ8Iu3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1230A25B09E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612077; cv=none; b=GoTK2H3cfb2kgtdjqFxfIwXN7/MiWwPVyzTP2r5brxWxGUzmOmhNZpGSvxJFdTbwJmujCuRAd+ITAk5J5iCh+uk8A5P3ky995p2gYROjqsdaOlPlHDPi/YmLLo3PjLGaxD6thVuwM3inr7f2jw+MWfH31S7OunolACiClZfOjhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612077; c=relaxed/simple;
	bh=gZ7/m9KpQ1/EqhvU01sswVmkLPUjhY90BeEr4h1qAGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdvP41PNZl/tkoCBAhA8c8mVaQDZ+Rf7LhDA9FNHzw37rYnk4PRi6HsECP4WB4ZLROGcN+QqfO+cpor2GMOF8qv/6C7oSeyOrj7dRmk6DvqG6XBbD/2wmB4+qh+kYM9iHnlRtukNeLxKjglazqdGyftUS3no68Uu88PjA1uhNlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aU6eFMBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUBJ8Iu3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CHXZrh591897
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vZkXWqGOTuJ1cPUXpqHQv2kE
	LP6bt2pTDXGQ67qZVDs=; b=aU6eFMBZ9b8hmD6eMXGQ9/PCP6BAl1vgRHrPYaBC
	Tu15soKe2xqa4F6LWQRp9L4SVIcdcyjJhTFmThqa6awUlKvtfCE+D4Fwx/3dDVgP
	y+zFyIluITZtoAUKY20S+tXf6uA0eLRm3Fd+oMr2Mj7PwdcBR91ZBTY7ztdlIHTv
	gkt8fSf1mV5Gfl+X4TiNJ0fC78uLB8kLZMjNLo2T2M1i0q5/tqwfspNggyHjPNkW
	Y5MiH5b/eaVrpQojF7zuv19pWulR3Zh6fWM6iU9J6nOT7Q2Fl8IijS9V4C1qlSDG
	CEGmlzsXIsg4CPtHNoFyLpKbYkYCMpoAG+e0+/+7+7IPcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319sys7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:54:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514551d5f2aso163749251cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778612074; x=1779216874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vZkXWqGOTuJ1cPUXpqHQv2kELP6bt2pTDXGQ67qZVDs=;
        b=ZUBJ8Iu3bpMXM+jhwoVtevdG4a5n4024UF//KA9VBgi4WkpxUdORzllFqvMjMPvc/3
         Tr1zxH+QFlT6QrLrUNkg2fDq8vYgsSpHQwienZdUGrseQPVDD1oEQu4QVFvN0sprhVIL
         BvVFb8rGo0WBAA1D7pZn7xTFrAdvh8gu9aY8IFlYRF6ax36Iy9IpRyU35C/E18PZILhR
         vCRT3w9sjn3KsOYRPwVTm0wY4xgoS41ancpysa51fFqeRJ2+S4e0mSW6VHC8nm/hy/2U
         qZRVM3vFwlOKN2BCe6FGfgckFigkzKhFG1aoqD+2OMJhs8GqrCI/z5CV3GMIyf4F5uYK
         44mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778612074; x=1779216874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZkXWqGOTuJ1cPUXpqHQv2kELP6bt2pTDXGQ67qZVDs=;
        b=jZt3Sh1yp3rp/eJRwXqLy1cBK1VKa+doyuHyXBW4ch0K3rtUBbiUSEetcaD5R6SkxL
         mFp0LdpPRZAFDoAaFysA7qJBZEryeFci1eOOjt1I0eYJrW2+2XUSbsM8RPLub5p3Uxvd
         JcGnliRWsnbx002XtxBKHJ+5vLiq0YAojX0itTdL9FvOgahW0ItLGg4F4ljIT90M1PuW
         EVWIocLpe99sh+6O+uYIjNRUgcNpcL8STBXlK3vS2EYUqG0EGt3d6Jy2h8/RCoP52iR3
         v79L/wBHCL1yTmOHolVaDmtF9OcVAtHhCM4BPDhOGAWMbhkCTFrlDcFtnfLWNNerQtmk
         cN/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9x/Y7wqXHRx1qUYcg+RBtVTwP3+z9sIhEYXUb21qS46upydVhUsRFnhDJi60iXc6IYQQKWhCvnFvwKmgzb@vger.kernel.org
X-Gm-Message-State: AOJu0YwBcYVA1VdVJwU08h3mxuL0Ig5032WBA1ku5GoHH1MxspuW8Y8H
	OEDMSfdD/+Ag9Iwec5av7G3J6hxiB59G+5gIKvi8LSOdANN3hmy+39RbI4yDyDZl5cP+oJV9o9z
	X+5GxAYLfO6bQvWxAF6oF9qtiE3iZZWdVIhyL+e5rpaLaWoaowkHlhsK2t6evbfT2Fe9X
X-Gm-Gg: Acq92OFOAyRTOi206NGuo06mzVFkFZHoUFlUKJW5XszBrJgCqV41mRgqTKNOpn5ptlZ
	2nr/ZJsSjU0Mmy2HbpRJeK3mPQ8rvorEP765MM+XgVIAcrrqYWfuDhTzIzlMCazoR74BVxbte9L
	ARuza+9Okl8QW7zlACp/jy4jPHo1JE64YTh+j4htStybMDo5gdqIM+loa5iNSGmMS60Dlm4HNm/
	iGk9/MvDOsiTNIL5cFyv7hFTCMflldPenyE60CeHFyr3GWYjup4rUiAp/ZewhXYl0sUI77hgvR5
	ZW+PF/Ch9YHisln0hw0NmW1HImxDWPZkJh3tUIubFxdo8xf9/Lt5lnTI2mf39piQX1vaAVRFt3T
	qvJ5sRhdYGmcQdk3UaVdYxT/Mujvlt/wgcBYb+6gJ1tn7BC6SweztEadxsYNQiyM4vLA10dsqJX
	AzVOyIjadvo4s9MJVQYsnXAoa1ZNrCaNbIV+E=
X-Received: by 2002:a05:622a:1495:b0:50d:3e1e:7998 with SMTP id d75a77b69052e-514d20eaa21mr54111771cf.37.1778612074371;
        Tue, 12 May 2026 11:54:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1495:b0:50d:3e1e:7998 with SMTP id d75a77b69052e-514d20eaa21mr54111391cf.37.1778612073721;
        Tue, 12 May 2026 11:54:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95152b2sm3485928e87.11.2026.05.12.11.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:54:31 -0700 (PDT)
Date: Tue, 12 May 2026 21:54:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the ADSP and
 USB related nodes
Message-ID: <c344fbofkaei3dissek3akbou2lqzdffj5smho45qyshnztnbi@tly6yz67b4zw>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-1-6420282841c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-eliza-adsp-usb-v3-1-6420282841c2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE5NSBTYWx0ZWRfX7mKu76lL9Pkk
 gLFZagVJQa8/TTnyb3w5LgyzjgDtXM4uEKDlirhb7UaVZuBRt0JrIX4X8B9JRpgXlHXlvQCWlMH
 sFDd0pEXAAfhFUz5vwlPUFWgJ3yDHpMYAf15cCo379dewYNeUiMmZHdxLbiRDfvZFdlhdq4AiOL
 sHd1FU75j1wy9NTJIb/hr/O/85EmTMHqoYpvVSQtCARNKUPDqmW03D/oEuj8axawcG1o5bs6O2r
 IlEr46WEVYQn47raNy1G6s+Mv5LDJzkV01MKXdymNeFBs+ja3j3GoqQPgf/CvQLfqIhIXxIZQTj
 AoydUN5S71l5cPj+Xq+DPOI5ltYGgiKqwtgKNEqXhxq2BeBILmNKHjjhQ3eT8aNz3sga8ETm0sL
 GXnSYE58WbpXobdmQ2sbuyEJsze6gAxdBQhOcpoTa6W2vtoi3TaY0EM6GQY0Wxaa4RG4JhQyx9o
 L3pgL7OsrvFgPlnRIWg==
X-Proofpoint-GUID: goLOkKrD_CCWDRCReYtkPaA6Er_NWxXS
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a03776b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=68niEd13HyaExDxXyQUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: goLOkKrD_CCWDRCReYtkPaA6Er_NWxXS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120195
X-Rspamd-Queue-Id: 3938252864F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107161-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:26:47PM +0300, Abel Vesa wrote:
> Describe the ADSP remoteproc node along with its dependencies, including
> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> 
> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> combo PHY and an SNPS eUSB2 PHY. Describe them.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 261 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 261 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

