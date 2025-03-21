Return-Path: <linux-arm-msm+bounces-52198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 744EBA6BC97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53AA03AD164
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B79A8635B;
	Fri, 21 Mar 2025 14:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z//dnnHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CB77D07D
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742566064; cv=none; b=jL22E5sXWhHFzsRXOGI1PqCJDx77GiQu/WRgZR2dfyC0ie3ZgbGH/tOi11f9SZ5EHakzhRDY82DzH+uY247hQL191ZT4UjXOvL9WNpSrj/Ovq4hhGUq4XO7soQpd3tVdUDcQwH4LwVHxs5brPUINgcW2fbtI8zj4BzDBcePzrFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742566064; c=relaxed/simple;
	bh=VQ6uT463iY5nWfGzJJw8UhAvf7TtU5jaMLmXMDvVQvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMMb98MkddBBU1RABd6ap9g5oR1e/ha0id1gVMOf7O/YIvaG8tkDq/2lTt/jFVbDp9wKoUB9MBDU5V91ry6PT/9jB4lAhtbbPUgV3+K3QvtKHn6eSaBp5m1zV8m8E2X7IqF6mnLPItTLdFl3UwH+lRikrlIjvlmTnQGJt5/KqZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z//dnnHj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATLOJ001160
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6Lj3Z0nr75RSpAKjWGnP9fZL
	3PNA1cnRFr4d9rHGNsk=; b=Z//dnnHjV1USlmiQGf37yOyUhg4DIQvaFXtWQLtN
	cE4i/0Pb+XDOU34kh0XgAUjpTq0GIJWtaWay1mOMl/ylIa68msrs31se6HztnLPg
	qlcm1TxEMgth9pWvv54Sq4WpVwDB3LN5lS0zgIBpWNxR5JMZf3aB77JGErg4331z
	3Bc+OXn5U75ajxjSiiPcsCamTNbguOU2DVrFuLdNaqMmHljWoFAaF3EOzG2g8z3m
	4nv9AZED2dGPI9Syh6XvOom+HXqERexyuSp4HXtc5ShHx091J1B/LYlsNFgghlnd
	ZeUvRMVhqXpF+7aBnXlvQ82+7o5g3ztbC0C7H/UPinNENw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4u9rwc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:07:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4767e6b4596so33434591cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 07:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742566060; x=1743170860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Lj3Z0nr75RSpAKjWGnP9fZL3PNA1cnRFr4d9rHGNsk=;
        b=Z03s7MriLWcLVentZKMkGpt3D2UbhXLBMaeE8NGa8YOmkpNrOv2QoPZBFbSezd7oJY
         T1g2Imzj2nMjx1fXQHeY2FkbbwjL4r18Nkt7DXtfdThSUXvkefKEcwU6g4T9UVnuexsv
         RQ0hJOAG6wtxY8u5g3psjW1sWHg9Q+zN3CBU0nJ456kveRKT6qqNBnOz6+wWSB2z7dLT
         mooXRte05j/S+fcmojBGvUl154vfz7dtXlTjxws9BZlECwdbIx+mSgBmBK6kgWpEYPqd
         iLA1xR8baK1z1FclmJ5Eyw/D75ExJEgiuSoZbeJEDwe0cv9bhtk7l5yK92v/cMZwqzCY
         n7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEt5S8trXUfJTG6fpSciqYRg62XMyCaNJt3DuDNIFTV5ljyP6DT5HEq5uWkl/HQkcboaGp2oQRMnLdN/FX@vger.kernel.org
X-Gm-Message-State: AOJu0YwsF7W9oIKsRe9XWC5FURrBzWz1qxivtadDtc+P9WNCKpyy+t3P
	KRxsNkcpAGWbuIUNMpiM61fR+ZXEOe2JpNvOX3el/4dKHhBP/PrXkVAfwLRI/pEeiLD10waL9On
	g4p9BWRlBLETtoyeWxNlZXXHrMAaeU9fAMmWyufc9AQ+SA6rhCpfDeNeae15G1qtV
X-Gm-Gg: ASbGnctNtSG2oUxnOmjqFMrh6T1PHIfZLdDznWHt2iJBVYJe/BV0fUk/trr1exssNdi
	9KPXpRoZACmXv0fawkg41kU9WpCbrubMT7WkPRjvddNug9IZ4HLJprR0xisliP+U4rl3TGW9ugv
	drJeQvlCc+gWXmVd8aVlR9gVk55i7gxrwKnNYe5mwKxPkGzAmWCMmN1GtKmBmb8ad7ibjpVKh+5
	Um/2C62wK1IsJm8RzVpqynTUXe09sh8g7GtK/sazdAaEcEE8Qin4p/0aZmXRn5FuZ8b+aUHJZaL
	ps+dD0z4jzRQRgjRqMTcSWAjjGMkS8Qm9rfflJmja1G/U55u5npLsjcCOoK4HXhSJHHBBfqW8TB
	tRLI=
X-Received: by 2002:a05:620a:4051:b0:7c5:9a4f:adf0 with SMTP id af79cd13be357-7c5ba1846e8mr427731185a.33.1742566060330;
        Fri, 21 Mar 2025 07:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN2Hi2Iq/wisLHL4FDbRqBoRtFKfhIdoGegXlkIOLj6uMrHc7E55BfjIOutxbvmBBa/wCXtQ==
X-Received: by 2002:a05:620a:4051:b0:7c5:9a4f:adf0 with SMTP id af79cd13be357-7c5ba1846e8mr427724885a.33.1742566059734;
        Fri, 21 Mar 2025 07:07:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647b8dbsm188937e87.61.2025.03.21.07.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:07:39 -0700 (PDT)
Date: Fri, 21 Mar 2025 16:07:37 +0200
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
Message-ID: <rjfccsym3sziidac5l4ecxsjy3rdulbf5ewhfksdqp35oxcimi@brvgpgme5wpf>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <qhriqbm6fcy5vcclfounaaepxcvnck2lb7k2gcpbtrojqzehua@khv5lwdgbysc>
 <9962c517-5c0e-4d46-ac0c-2a7bab550156@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9962c517-5c0e-4d46-ac0c-2a7bab550156@linaro.org>
X-Proofpoint-ORIG-GUID: 5UuxCqyV5-g1R2D9AzjN2tBmsQxyfZDW
X-Authority-Analysis: v=2.4 cv=FYE3xI+6 c=1 sm=1 tr=0 ts=67dd72ae cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=d_F73D8V8anS-nGMN7cA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5UuxCqyV5-g1R2D9AzjN2tBmsQxyfZDW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxlogscore=931 mlxscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210103

On Fri, Mar 21, 2025 at 12:23:15PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 20/03/2025 18:43, Dmitry Baryshkov wrote:
> > On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
> > > 
> > > 
> > > On 20/03/2025 09:14, Ling Xu wrote:
> > > > The fastrpc driver has support for 5 types of remoteprocs. There are
> > > > some products which support GPDSP remoteprocs. Add changes to support
> > > > GPDSP remoteprocs.
> > > > 
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> > > > ---
> > > >    drivers/misc/fastrpc.c | 10 ++++++++--
> > > >    1 file changed, 8 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > > index 7b7a22c91fe4..80aa554b3042 100644
> > > > --- a/drivers/misc/fastrpc.c
> > > > +++ b/drivers/misc/fastrpc.c
> > > > @@ -28,7 +28,9 @@
> > > >    #define SDSP_DOMAIN_ID (2)
> > > >    #define CDSP_DOMAIN_ID (3)
> > > >    #define CDSP1_DOMAIN_ID (4)
> > > > -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> > > > +#define GDSP0_DOMAIN_ID (5)
> > > > +#define GDSP1_DOMAIN_ID (6)
> > > 
> > > We have already made the driver look silly here, Lets not add domain ids for
> > > each instance, which is not a scalable.
> > > 
> > > Domain ids are strictly for a domain not each instance.
> > 
> > Then CDSP1 should also be gone, correct?
> Its already gone as part of the patch that I shared in this discussion.
> 
> I will send a proper patch to list once Ling/Ekansh has agree with it.

I see. For some reason mobile gmail decided that your patch is a quoted
message and ignored it.

-- 
With best wishes
Dmitry

