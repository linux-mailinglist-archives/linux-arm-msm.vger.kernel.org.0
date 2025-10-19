Return-Path: <linux-arm-msm+bounces-77927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1CABEE91F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 18:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5CFFD4E24C9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 16:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104491684B0;
	Sun, 19 Oct 2025 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feI+pIQ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255FA2EAB60
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 16:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760889618; cv=none; b=VY4DEXCf6nPlEYcK3BHAbnd6Bp3YlsiMfSjSeHXXYgZlZTjP20hOUgxcyFpBNR3yV8NtpKIlWr2NUip6j9qphSbGv3cQtsEEzbCnM2BrQlNHS+PGJP0vyJxFQjkdhA9+IT5kAS09FhrTYoTwLI2Tv4zb05iX5lQ29gmYxmXLJNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760889618; c=relaxed/simple;
	bh=xzkqNwARdbLPvZgk1OAgS7gX8Y2Q8ThSI+Q8n9mJvko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwqSHTiQdMWjmVWyFnLXQn1wvCMD8TQwE5PUD14s3EM4pv+xKTVRlV4/rvLU3X8eGvUIJYiAazbGsXPZ4E65HY1mV/vr8b9ZGGM0G0MgMztxhfHDJChLCbfhDPUXYiRZUZrkmeI2V1ATArRk7+LTDAKakT9wYn63QdfRdI4GgBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feI+pIQ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J9iCev031143
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 16:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAnCrH43ey70zMSRTiR6RqBTO1JA+aVfzw+gy4a88is=; b=feI+pIQ3/fGt1CMW
	xD2FBpeiwuud94vB6kvK3eapY/ygA5ChHpQGrj2eUE9ybAlkpT/N3aXXNm8Vtjfh
	5EMztP3cxfAyqI5mL/IMxJPr0BmfBX/CvEd68Fuq14i+W4jMsoIykAK9fxbJYASz
	ZYCThos0pyHwgHsxOIblxv+g/GozptCjh5sv9U6Q69LPl+zK7N4tuqNY6HMqxPdj
	qGn7bnq1glwaA2uZ5rC8qLAhk6hA3rZYYK9SAjplX0vHN+KdzJDGakLC4Mh3HFHg
	OG3hp6mW1AZr0kNkalPZR7U48ZKdKcXd8s+kq8mtI+GEBPoWVkOXP6nC9PeLSe9U
	9hIfow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27htpd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 16:00:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c1f435bd6so111061986d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 09:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760889614; x=1761494414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAnCrH43ey70zMSRTiR6RqBTO1JA+aVfzw+gy4a88is=;
        b=domTEIrbPMH/yD4XC7abY+eaa6llxIYdQC7cnVeBaZOIpq8LtxNzZ2PAbofaLuitAf
         zlVJ47Slh4PcsxtPW0unk48zywTcW2YhEY0LV5Oa1BIJOuP/TWi3IsIvEPVcj07AZQd7
         YxcxrfCv9lditfDt6npAP24m6OYEmObYQJDfGCNEjh+524EmUGXJmUG2X8J8B+74O6zm
         9lzGW9bdr4tEyJRJnj2pDgS0+VjPMNGea4diSfqSxsJSZMB7aGLZq5Mzg4tX80JkiOry
         X0gQBKAwYp9+D48Q1j+PBuYXBjPhztyS7HJMxOOla2QVYMDweUKcoUknulnguWudRQlP
         0yew==
X-Forwarded-Encrypted: i=1; AJvYcCU5LTujmpE49Zw8Nm6B3xkY4zh+2EobuOH1qIwOjbyrAl9ADt2dzwF/niwnZBHjicgfBsFXurzt3LbFvpxf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5GyTnBTibbxT9Yfk+fZ5HaqUk7pCncZPSr0Vv1mZXz5R/3X/l
	qFDuHxvUXlvvA3/JETZssCX52rljAnKbXwn/ww3CcDwXn9FHRsDLR1QX3XKo0SaLCWj67ETvtUo
	NzMsXAlzvVogXys58MWgyexF+HqdnMCppeTZJr5rd5O5/7Wtffp6b55bvDocsZQdWTzSK
X-Gm-Gg: ASbGnctLgbVK5sAvwoAGVQVwPSjRI8fqcEEF5FhvuYXFZOzAa+lc9k8U1iEJ8rFUKKD
	RZt8JU87gd7zKHPHdTk6LxaDobePHdnN0SrFjJ8Jf8yqO3bAE1myFU1eY54J8ISsifo7P9FMXqO
	u3VbBHTzJSYqN9XT+F2UczH5BCIjOwN+2jNYflYUWwASkbGX7xHnoxLz/9akMwEQRCR+H+/dev+
	hDclM/PPbCohX3x6WUNO69aaz1UQTzSEtaNobKKtfy+SnvYL1Q09az9/+w8aDory9VvBs9IoJl8
	9aMubXcFjDGZdRuznfOz9wqoblW/SkQDq7yyVOtyojWp3MnO34epGsJflQGEXUkuU7Y7x37MS5T
	xmqQrbujI0Bb3QkhBskWMgymOApis0uEwpk5UisQu1U9qbjmuyyuwYkmbl+wg0c04Nfy+0/CTA2
	xEHS2Xa1gj5L8=
X-Received: by 2002:a05:622a:28b:b0:4e8:a54d:cce0 with SMTP id d75a77b69052e-4e8a54dcd87mr102910211cf.53.1760889613610;
        Sun, 19 Oct 2025 09:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCrJXyG7fI27LwTBfN2BGJKRA1ASFutxhuVWs+afd3DWD5EMMDTDstaSi4ip0vg9wyDkDPdw==
X-Received: by 2002:a05:622a:28b:b0:4e8:a54d:cce0 with SMTP id d75a77b69052e-4e8a54dcd87mr102909491cf.53.1760889613076;
        Sun, 19 Oct 2025 09:00:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def16b3csm1658498e87.72.2025.10.19.09.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 09:00:12 -0700 (PDT)
Date: Sun, 19 Oct 2025 19:00:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: pas: Add support for SDM660 CDSP
Message-ID: <nv2lsvuzrgoepr376gghk2klm7jqtmpcg6auairl6zzm2hks5s@z5kohfm6orn6>
References: <20251019-qcom-sdm660-cdsp-v2-0-0d3bcb468de0@mainlining.org>
 <20251019-qcom-sdm660-cdsp-v2-3-0d3bcb468de0@mainlining.org>
 <sasjgm6pua77syu5qjbr5zxl37jorvhs4dx75lbiqlisr5aq4h@zjxu4k2wcfye>
 <596771dc-1564-4f46-ac07-ac0e9c6c80ab@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <596771dc-1564-4f46-ac07-ac0e9c6c80ab@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX3jUhzXyKBLRx
 1yxXcVEis25KUmXU0Q6NCkjafCIV1ntZKzm1wODvv0/3FClzoz6KCDcuxBttz5ZVKokef6+RiOm
 Z9e3tWClnE4MNNRDNE7ufF1vSJ6xkLlx3QXVCph9xb8BPzKG7DUwcQpZmYpIJejIExJ7znfbqbV
 6jlsPKGmfWSDOW2LWtAMa4fPUV9NQ/qO9ATRhWcggeceBtPaCz52Y1k4BWiUlNnzBJc0idyInnb
 j+A/9q1EvswRbXwALPysZZsrEMzVF+A+/IgWuS3AGQG0T2IUHl26AMQpfapt3Yaj3NIvC8g0gAs
 enRVic/1OWGxaSJdypRAj/SpQUOEN8thNtyDjphQBgb+6Bx9A0VW9hBh8LCb81mWXPbEt1xGLIZ
 NfMY5OH5CF9IWOqnEshwjuhh4DYkqA==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f50b0e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=JmBaj7UERdyy7ZS9UVoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: jlbzlGLqwJmmDM39e-4xYdApiSbfBV7h
X-Proofpoint-ORIG-GUID: jlbzlGLqwJmmDM39e-4xYdApiSbfBV7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On Sun, Oct 19, 2025 at 06:38:01PM +0300, Nickolay Goppen wrote:
> 
> 19.10.2025 18:37, Dmitry Baryshkov пишет:
> > On Sun, Oct 19, 2025 at 05:20:21PM +0300, Nickolay Goppen wrote:
> > > Compute DSP in SDM660 is compatible with generic cdsp_resource_init
> > > descriptor.
> > > 
> > > Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> > > ---
> > >   drivers/remoteproc/qcom_q6v5_pas.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # ifc6560
> > 
> > Please send DT patches too.
> I can send them separately

Yes, please

-- 
With best wishes
Dmitry

