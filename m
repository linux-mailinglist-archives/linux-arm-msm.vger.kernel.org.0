Return-Path: <linux-arm-msm+bounces-52110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD383A6AD34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 19:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE5F84604DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 18:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C24226D1E;
	Thu, 20 Mar 2025 18:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZXuv9jgV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCC01EC006
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 18:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742496220; cv=none; b=RIz528fGihBwphLIoWbprxJVuV9JSmcMPl+h6uXY+jQhZlEYZM3x2qU4+JlNtBFz52b9tUwpaBdkQvWGA14HksORQdEiVuBUkUQMJQ+bsLoFWww8KYwL5irne0KtkFsZ3L+dB3ZjGYWM170eUGEEFGpKc/ik+TBn2br4AF0oKCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742496220; c=relaxed/simple;
	bh=dEY62deIYUJSirCrYOMEElVt/Ji4rW7/Q6uln6aIjzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJzKsaSh5VDE8IzcqcnRsoGCJxoxI26YKfPpdKK+a9OvK/bjRVg5qgAH3b7kmUjR34ncxKk5QKQbws/bD6i2fnkkLskkG5ojZxyBWklX9LgzSlEPCaW0ovkq4a3OAJ03G9PcZiy0QtVl73gYpOvfZ5woPk+LdG0VOsNfvxTpTF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXuv9jgV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KESSHL004882
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 18:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ONx5//4UtMuIj9b1Txh1pQb
	rcyKh3E5jAL4BLqN58w=; b=ZXuv9jgVgoDsC5ZU/SvLq5mJ/aS08aIE7x3Zn3Pw
	xIeU5FTc0FymB9NBjJcdnNJAhwIiIZJt0EfvfiR6YVSiNytJcIXwaPZ8znu8e4No
	AwmlBpvDTxpfDDWUeiWRyDGBoUNbzPpOl1WtzwsUqrmimu5pWfzCGChzd4g7qa91
	ZJ2rADlL4xtDjl9ciSD8zmQ/1EShl8BkykG/o4iqyjED8Dx85/CeyJ2rHt5wQaFf
	iNDe6gQSGx+7xVIg6IKxlvIRHmAqyd42VhsxeN2i7bI9w2HPhI17Dv/kObkstrok
	uWBzHerSNNNKMkFzSbo7lqT0kWnr0VraKU92q+fOfY/Odw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gcd1adp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 18:43:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54e9f6e00so393128285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 11:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742496217; x=1743101017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ONx5//4UtMuIj9b1Txh1pQbrcyKh3E5jAL4BLqN58w=;
        b=xDK14TQG2puyyoLTonBL0rGFwbFmABHp5OpvdD7VilANGEL4NuPzve4P39Iz5BXV3J
         LSOKLog8/4wps6165NAHcqBB89lCw82hB4GuqaIRioKVlal+bJy+n9aq97TKGvwcAR0j
         eQrM2cZIlEDlZmvE/NAhpXTZC53R2i1ADpP/nLd0aZEsO86E6kiV7HRQ7wNUT445FmxE
         7Q7zOa+DWN+Jlj12kAnOkATJ7w7ISFGMwz6bFIlbQ/pq6IEDlALHFws6spRTmqxnYZCS
         JtkgSAKFObPStfuCXe+y+RHQBL7DsMdGXMQEre46sI4NMBbWXnoDHlK1y482vZbWLm0X
         8/vw==
X-Forwarded-Encrypted: i=1; AJvYcCUf8LqMkNW+/Cn8Wp0ck4aApupxduaYyBfEU4ojzxz/ZQnygLgTSB9i9Kpqn0S45uDaUhZYJ+YpHvKArGVs@vger.kernel.org
X-Gm-Message-State: AOJu0YyPzzp2NCRUSLaBXwPIqiJ14coSSN0IMH2V0MVQkV9SCwlq9m0T
	CVpigbqiUqaOBdIQ8daWbjNrypbkE/h4eRBBT+Q2rcz4U5StXa3OBgc6+vgV0Yfm4tj01EJvua6
	BZBhuqPPSrpK8/jl43hev0v/n/JRIHKj1Zugs0W+bnTwaQLbSmBv6/XRCN5t+KLi4
X-Gm-Gg: ASbGncsVl3zYuRkamqj+xN72okpk861MueOL9bb2bCdxfzeREzwvk6hHm75SKvv0+Wy
	FcDepLETGEtNnaq0gnGBXUvIxyi7o52J91GE9iOA0fmvjR2p6zfVZ2WmyyFPnnWLATo81jgmm5U
	m4cBsb4X/pncaUS7YuizV/EQYMzROef+MFDl01sVBjNLeJBQGDCwJmqRtFGe7YHHYgXiQG+MJzu
	DFCP8gV59MteI6uugSpSB5DT7CvlZeHzIIQnIN+CwXLpnI+o/1ctCEiD6NZaeGC9K0xkNmHaIQ8
	KcYFPXoI0NProy5pa/kXh3AOmpYj968naS2r5CijUKQabK7AZ0pR8LjkOy+WJlKyB2S+BtiugXD
	/ldY=
X-Received: by 2002:a05:620a:2846:b0:7c5:93ad:d2d4 with SMTP id af79cd13be357-7c5b0505fb7mr790744285a.9.1742496216646;
        Thu, 20 Mar 2025 11:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIOpxyiAffu/h19LyVC1go0TlaRx2On3Hti1oWXPswumXindR9aN6vgdysZcfnA+vAuG/pvQ==
X-Received: by 2002:a05:620a:2846:b0:7c5:93ad:d2d4 with SMTP id af79cd13be357-7c5b0505fb7mr790739385a.9.1742496216221;
        Thu, 20 Mar 2025 11:43:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad63eedf2sm20268e87.0.2025.03.20.11.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 11:43:34 -0700 (PDT)
Date: Thu, 20 Mar 2025 20:43:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
        quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
Message-ID: <qhriqbm6fcy5vcclfounaaepxcvnck2lb7k2gcpbtrojqzehua@khv5lwdgbysc>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
X-Authority-Analysis: v=2.4 cv=bfFrUPPB c=1 sm=1 tr=0 ts=67dc61d9 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=QMmaw6yphwjc_7Rvn6EA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: h5oNETotgQJbAb6XY1uzu2M26UKnTCer
X-Proofpoint-ORIG-GUID: h5oNETotgQJbAb6XY1uzu2M26UKnTCer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=956
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200121

On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 20/03/2025 09:14, Ling Xu wrote:
> > The fastrpc driver has support for 5 types of remoteprocs. There are
> > some products which support GPDSP remoteprocs. Add changes to support
> > GPDSP remoteprocs.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> > ---
> >   drivers/misc/fastrpc.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index 7b7a22c91fe4..80aa554b3042 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -28,7 +28,9 @@
> >   #define SDSP_DOMAIN_ID (2)
> >   #define CDSP_DOMAIN_ID (3)
> >   #define CDSP1_DOMAIN_ID (4)
> > -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> > +#define GDSP0_DOMAIN_ID (5)
> > +#define GDSP1_DOMAIN_ID (6)
> 
> We have already made the driver look silly here, Lets not add domain ids for
> each instance, which is not a scalable.
> 
> Domain ids are strictly for a domain not each instance.

Then CDSP1 should also be gone, correct?

-- 
With best wishes
Dmitry

