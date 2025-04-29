Return-Path: <linux-arm-msm+bounces-56145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CB4AA0F14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47D17188E1DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70632163A0;
	Tue, 29 Apr 2025 14:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtRl8Ac+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5707A18A93F
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937405; cv=none; b=CP6YXmyazFn0dO19aqP7otVmSPcElwFQ/c8teBDjJOtdp2o/wvzCJIJnuD0QVJargtXe4znxYF1OaiB+eOVSKysAc65WUIMMLP/xaCW1te97wTJastnzUfOOXw1Oc6YGajJMgVKCadqvaUKavV0KV5ei2LurvTcxf3oGZrwBEFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937405; c=relaxed/simple;
	bh=UQgcJ6GoV/uLYNRxhueM8RM3nuaZhSLiXzzJTTtrZD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/wLlebHhCDmOe9uKbmsliXLQ+nUmULX24NoC3f0p9SAg7PbUK7XM5Xfz4wtbbUfhhma5MUtYcfBWSE5+VqP83yM67iq64oshcHuKsbldf6RDzsJA4iMjZvoxnPWR/QVSzsQJ12chO8zwocZGvDs5k6jnhpEG/r7bB8uTXVQmIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtRl8Ac+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAE4se014348
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J4vapM77cSti5bfb1sVRmOKt
	P/l43U94DBDBHARRk/k=; b=VtRl8Ac+hVPXwWy3/5FThBwnFkxYES1cyFx9j5c5
	hrB2Emh+tAttSdQ+cSoIFI6chbPBLR648bmTBP47f63eENqDm0QBDU4i/XYPRSiT
	v06MrvR57ohjYvmvcb0vwmwCVGIzSPcP6qQhxm3nchPEZVN/5lRUM5VnfNVcQnZQ
	k4ueE1E5Nri70Q8k5o3pDlSVz20AqlCjQPk2qSEp5tvq6qsQ2TCb54u7h5uKIXmg
	a5oObn7EiZ95kkrm/mbYcM3oG2aLymTgEXXX28wPQQQxLl0puKP4CEvEy690RDlt
	ZbYRERWS5C6ftUhef9uRSaBS96mGNu8f2od/7M3eWJETNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn3qu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:36:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c53e316734so974513985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937402; x=1746542202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4vapM77cSti5bfb1sVRmOKtP/l43U94DBDBHARRk/k=;
        b=LeTxYefI1BmcilUQ0OzEqpAMxeYkiK5G8uN0YGSpFC5IoYQOMc2EWXLiwsQ2aUEDlC
         SXevr64DlCBFXTAHVlKriiTM+Jb1qXobEop01Ri5clDe0nVz6PjcmyeTSwEPvMCsI5go
         1bcNVIwZEH+BXHlOXMeog7BFzwev7NawoOULphm4TLa6XOzfKCSxdl2qUKisTh9uEKvf
         OYbOUmbr9yqWoz7xVmR+NW/jBahEQfCSxKMdslUrnrgw8i4z47BhHCJZlpOGLh2D4k/v
         zzdut36jPg3xb2cwpkaaKShqrtWuOQpGaXse4SRy/tGuv9VknJ7D6jBpzvkdNchjQjvy
         Qmfw==
X-Forwarded-Encrypted: i=1; AJvYcCUneqPM2gI1pM4tzBymf2eDriayeVlRxce2RrjLrO8rapBUu4VaL/Pa719Ybwc0PsNKCIwXWwDHCRTOy+jd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi3N8Cw71sNRtOL13J9kNZWMZHjbrzZv6f8s6VTT9Jppt02KZL
	xmpvBXBwejzQvOqEOx6e0aJVZPgQDYhOutIcwkYSYnr76QfRbrcz5rtMtKoPYs2Z8fn9Be0u5US
	1+6pto9smmYhb60zYkwsMCp0dDGD78C6BniiBKEG0Nt8+IolMiCNr5nOs47wCFeB6
X-Gm-Gg: ASbGncv2DJ2ixY9UYQz2zdNjvYpahVaoXQLrHARbU+mcJCgRInYu2leBynA51A6/RBD
	gJYP6Cd+bIGCuF2S4BYeTkNjwaaGFzKpHc1Wkv66zTPiObirt/902t5NmBQekEkr3H9ch5GGAZC
	UUH62V5ezfZNHi58XLmTEQFpU0o4heUgFZq4xke5MbFw4Va7Q6m9P0XA9pPoqLCUnUM/1B0NdMI
	KngxvGtvk3bOS6I2tDouD1hxwjDwmX5LjYDLoi49L2dkdhfQYFTeGwt+iNr88QVgtQMiQJmy55V
	xvZuiqC0rAKfEIQo5i1QbNSm4fP+UcbZgA+9yVWWPCNskzZgCKTKSXphQtCwhrHq6/fbl/Ci/tQ
	=
X-Received: by 2002:a05:620a:4309:b0:7c7:b600:8368 with SMTP id af79cd13be357-7cabddb646cmr566807285a.38.1745937401965;
        Tue, 29 Apr 2025 07:36:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvlRPDp4nVxPl5jkoeJcUjoMVkueqG9MbxVn9JenlF+X3kyGNQRHfqzf9TZwOykEYT4V2bWQ==
X-Received: by 2002:a05:620a:4309:b0:7c7:b600:8368 with SMTP id af79cd13be357-7cabddb646cmr566804385a.38.1745937401635;
        Tue, 29 Apr 2025 07:36:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a833esm24539771fa.85.2025.04.29.07.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:36:40 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:36:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
        quic_abhinavk@quicinc.com, lumag@kernel.org,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Convert comma to semicolon
Message-ID: <67u334iujxbhkklsy2awxhmionha6b2qxshv4gjvjesudas2ie@6hhn6gxgjyqb>
References: <20250410025221.3358387-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410025221.3358387-1-nichen@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: wZ7ffAYFbRVNrR8DLwKE2kPlyS0zc8-S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwOSBTYWx0ZWRfX1IpwV7eZIaFI Wbc7CfZZOrR3WHF14V2hxJdwjOAQ5LpqIJr6P2Qxm3V4e2MrRyvnru1s3cyvvfBd/U58HNbH7nj HkxfDUw6gqrdT7klRViVek5ZLyT+LfxfNV8IpIvRT66pn0TlzZhHoJiiktkLo4VJwWonzOCcAxp
 0oAGP/WlG2xkN9LL2qSoBwnQJDrdEjlm3DH1kdFfnIYtQSPSPICOmryxxsoah0/JI0dHc1UOgQ9 IVxWGo6y+EfOQqP4BDdmvIRH8lOTytlh+heLXcazBijMkb23SH/y7NKuRPmxIdP4IdvU0Y1JVe9 AEiqvwVp6UuoFGTv1FV7NKmgTzoTYTkRGBxp6RmCQN03eG+XGDKITjSJV/CDzNhtpN1MH/kY9q5
 Herl4HbYFprks5hxcaPaxHmf9T3MnM1RwjL8WWnSHdp9Rf2WHG5FLOTCWxJCDwteF5XUeCO6
X-Proofpoint-GUID: wZ7ffAYFbRVNrR8DLwKE2kPlyS0zc8-S
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6810e3fb cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=sNhlO-HqowW9r6Pg40gA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=791 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290109

On Thu, Apr 10, 2025 at 10:52:21AM +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/msm/msm_ringbuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

