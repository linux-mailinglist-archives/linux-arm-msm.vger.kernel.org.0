Return-Path: <linux-arm-msm+bounces-88273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94812D0A283
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 14:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 714C13083952
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 12:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7342235BDC3;
	Fri,  9 Jan 2026 12:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHN2rQSF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TsUUDfxq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB6035BDDE
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767962944; cv=none; b=UVfC3s6CM8ug6n/xv6PzXSIiX0YDsyasGqQ0en6i4r7ADL0r4Hjnp5PWUZ6d8FgwrRO918tmsLipUi9bDUpgVL+NOaIxyoK3EZ1rLYZl2WsEyS2umDms1VmQYeLBju1zmgs3RR6GV/UWoCFPjpR+oK0vZe5+c+umleJo/p/kc68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767962944; c=relaxed/simple;
	bh=6qG1rNjyCaGlrXAIvRBqTkl3SOnTDMr1BgTkhakkCQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hD4ea0QNueERloCY4sX/liPyUA8aHDs2jBGNMlzrcv1QdDPbno9jh9OG/DMn+I679tNBWEu6jo+2uW5YzKnCbbXfTd44RbZHNwwH78r4dIpCBUCDMI6Dbz1Oil8SgbrZGpORWza63pfcoCA0IAyn0LbJTAFgBxO6K8KWCvSII5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHN2rQSF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TsUUDfxq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096ODxR3019346
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 12:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BySbXPvrZP9cAL+k8tl1Xy7c
	VBDb+ifknkZFrjStDAA=; b=JHN2rQSFLC1P6SPWah92CB567EFV5X+eapoIVRrC
	mnBhetP2o5eYP5tHC4OE5SECEonYY7TyRwy1d4eyMaVU1v/ogDSdOSJW2i3ob1id
	D9+NJ9LddqQ+tG3JvbcHzXk4xDA+zw8I/aItwsI8C0WtiqSeySkRiSWIGy4bfJGY
	Wfr6LNM0ybKyfVt1nAFHDpOrP+Aee5Ay0xCEGJ5fixITnPTtOOoNI3bNrCAPMHcx
	dj6Tk0sxR7jL+aFOzAwiOQ/kSYo/rZdNE42FEpEvcFQ4rHBlm+I0Bo/p0CWVC8vb
	eT79jvimAJkesYtT/T3MhOccpxljTisp647+GcC7+Qt1sA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3jqx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 12:49:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b259f0da04so1053137385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 04:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767962940; x=1768567740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BySbXPvrZP9cAL+k8tl1Xy7cVBDb+ifknkZFrjStDAA=;
        b=TsUUDfxqoQsrdNQ1VHrczon2DblhTp+6TkN/NoIZALT6Gv3YrqX2LFjAjc63JY14sH
         HEbdGnyglDykomppX4wsoS67tRWMHV717H3dp/brGihlE3R9/0PW26IaBhJBG21Fftdd
         GPyBHy046iPzHSxvtY8wk1I48qHmIDVLVq+LCuzyt5NrA6uTym7ikSX/9n64s3WaKldh
         lzcyBoAhi3zLXiBpV04VkZq8MKRpv53b3AIL+B4bMQCbKP/tmf2UNtYfeFcvdbULQniC
         MSxFlwZMmF7hwBFAc6yfMdNhMZJ8BxH8rgJKLi33xebalFu3vqLH+GLV9qQ7JdA+LuDt
         F/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767962940; x=1768567740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BySbXPvrZP9cAL+k8tl1Xy7cVBDb+ifknkZFrjStDAA=;
        b=heTkdnEOz1dFbFNBMRKFPrsRTKd2mmgzeIvBU3GEWa4/DHb1Q1QMg09LHuca41UUeQ
         MjOAIm+BOaUrw2+9K/VkuCsSnFsMTyHo6+tnIsnzICZ4YNzUivhookool2DXDKzIfCyM
         AqN4OHJMjCBc7dKXbTmElNXQ5TVCURex7R5YUc+44EM0vi0ASQ7rrTy1ccuTDVv70ZYv
         C/gyYIphRBFnoPm4IyFtBddsHQNHoy/2qRXwh6GRlFLb9Kc0ekHriXn+U9ixlE89MgQp
         TDfg5eUWO6WK7nlNNFQtJNyH4EekKDuZNE9oZF20jDg5796ZSFHn/jkVwT+OtNbbr/dF
         k4lA==
X-Forwarded-Encrypted: i=1; AJvYcCU0CXiBR3tLCMlif+GII/ejC3uan/T8TVg2O6xXxrwoJPRwVgy6VDnRYJreF1WlQeVDR+8zFsosKsjPSzSd@vger.kernel.org
X-Gm-Message-State: AOJu0YwzcNn7LzadL0iO8dsid75lY6Uc0MPcy2DEXl3edHf0REbOYiLK
	FGVCiNIh15bk1/VVoQZL3+vuAlDD0cZ7g4re+KCPrqT0SvQEdLOLc2rx/O2b4EcwCvNE/d6oRsZ
	v8YYjqbLpj8g/33ylrZSIPP1/VExr7z55n8+E9Xf9+ayIhtPxRTV3Er059Kk7GtJiZAT1
X-Gm-Gg: AY/fxX4IhxaJhgqQnJKmSTkyFgqTKy8zlNcdJdh7FqM5+touhIZ6XQYhQIqNgiMyWaC
	gwSCtWjSGzAgTHnex8NmWg6LeL+LC8i9Rijkkd4jp39eEbSyIxWzr7ytOLzP/1CXLRn8G1cQK1y
	gUNrxtqIctLCy+HTI5Jr59E9S7sI3e7c0knpypFUX3VmlCp7CT6YTdAGgYkuFtPhBbJjTKjr7bj
	R5r89We4KoWcl3qZr14LS1zNyHsgaYPLlK/9Akf3nkG5dVWsoIV/wV2ieCX4jUlst2W3P1Q9QEv
	IuAPOqz/Dz+ylqLaze1dYD7FI+uOnJBrxa92Wsd4bAJLG1b7cvtLuNlzUunXR2IistnEHSQhq/5
	/6N1azf8s+blsmBH5GXWPgRkAl1GpVBBOtfYX0GDPd6cFSdpa7jsi/awhL8yKZsFI/BJn2OXnja
	lEFock6JNJkdEFoPg3QCV1tD8=
X-Received: by 2002:a05:620a:d86:b0:8c3:5a72:b11 with SMTP id af79cd13be357-8c389426b89mr1222955985a.90.1767962940607;
        Fri, 09 Jan 2026 04:49:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjjCiWu8ShBJMtcLcpGp6JkeGrIS/k+zABDJ03A4V/tQwD+ovwftU6fFWyq8KcIC2Sx7Hcbw==
X-Received: by 2002:a05:620a:d86:b0:8c3:5a72:b11 with SMTP id af79cd13be357-8c389426b89mr1222952985a.90.1767962940089;
        Fri, 09 Jan 2026 04:49:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b78894960sm1163363e87.4.2026.01.09.04.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 04:48:59 -0800 (PST)
Date: Fri, 9 Jan 2026 14:48:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v2 2/4] firmware: qcom: scm: Allow QSEECOM on
 PURWA-IOT-EVK
Message-ID: <jmkjhy36tmnel2p3aacuypc4ualgcjv3sfiz7a2efpm2jxrzgc@axnin6cgsxp6>
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
 <20260109080000.606603-2-yijie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109080000.606603-2-yijie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hGuAQR6GpmEagPcaAfQmPh98ZotTO4EZ
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=6960f93d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=XsGshA-rMXuQ-jq-uTMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: hGuAQR6GpmEagPcaAfQmPh98ZotTO4EZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5NCBTYWx0ZWRfX5+Snn8SZ0Gi3
 OrGFUpZ0SxrLqSkGiBv1/9BDkxp8DLbN9+7DM178YhoFg/U4kZ5dEIb6GDXfRuIOxggibTGOwDC
 CAQ2iHsosZB1pWGNGlSWN3Qt0ubahkvQAXysqIKY/LVAHDkOkPgBiz+hJFnmPDAhGcBD7voqFM5
 YRjvJrpq9ch1281FMj6E5cY4+R52i/Q9z1cbCtjbjXeScBW9JM/D4gfI98qItB26lEFToixuFu5
 XNRDdsJcWMKoQt8SFenNXWCBmAS3mw+0ZZlI1EzxJ5SNXbPyrSTuMt9gUZGupSKuRbqmjPtUJ9N
 0Q7avqCVOfgB2oxUpfZNRKO7diprLLdrAOqvRoGMHiLg9bJz7GrnkaZPTxSqjuSXmxSyz7e2ZBS
 yPcn0ncb5xHzkBg49aSqPk+LQ5QRhG3Oo4fmuLCcZxMzIsV+GVmJOc9jPKbN8O6q3o5jQfbhwdl
 CxjZ9CX8fGgLlWyx2Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090094

On Fri, Jan 09, 2026 at 03:59:52PM +0800, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> Add the Purwa-IoT-EVK board to the list to enable access to EFI variables.
> 
> Guarantee that subsystems relying on SCM services can access secure-world
> features. This change improves reliability and prevents missing functionality
> or boot-time issues by making service availability explicit.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

