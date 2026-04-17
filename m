Return-Path: <linux-arm-msm+bounces-103580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIWQGjnF4mnD+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:41:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DB641F37B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8227A300C32D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 23:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E0F34DB7B;
	Fri, 17 Apr 2026 23:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Twv2GRQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdX6Q3EU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA902DC789
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776469300; cv=none; b=bXwjN+mqlrlEoPUfpsQbg1NgUrYZB0GIDxrfUkIT9LSJhZPmvOEAlqq3OtpY5y7fJa+Lxvfr6dpLbOp8NmqRWslMhFKId7eeVil8vAZuAhju3a3ea/kZfFSKjEeYb84SsjlE/ZjrFV0CbE/M/z3n2P6vUxiKD0XfQu+NtoG9euY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776469300; c=relaxed/simple;
	bh=jZeUQ0FWrc61nnXKJghAoCF+WkyhjvekmfBt6uMKHZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpBuxzOswVXEfmMLaN5hH9iYfboDm3EvmOGaeWyWEMq7rQdt/v/LVmsTqJsrPf6svDGCWEVFEkvAKHZo4+t1Xt8zad+M+S1r1Zs3IU062W8ir3deM0H+ldTkY/IPih1uDHe7ps4LUtFr6Cz5Wp2zABBGE5WRTkerZci9zZFVrjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Twv2GRQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdX6Q3EU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4bbf975035
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cb9gUEAakmRv8wGC0EJTA21nGUPFfivJ369qJRSvttU=; b=Twv2GRQjHvqituvr
	Sz1EWfq6kVa0np0CnrvqnrM9sA+lqTtpgIr1TaKcCDjChyjNsPmvOyOqAcSQFU+v
	HcIF3w1iK4wW4LI1KSo4wdps1AAlLVnLNjEX+mMlBTmO8Hxx0p0TITe5xQf6jd9k
	OZsrpknTban8uIldwevlS8uTXDC9Zssg0UoUGc36MWFK+x7UL2OE9/KvaVopiYsC
	M+N9laY4UtA147iCyiNjNhQx3NyNXd6dxOXVwyAdT2J7M7yrxgqtZJ6SiCqnF228
	mX8gQxB+qe35JstBgzbzxQ8wRMVAKHSVD6O8xlf13a2Ner30xsocCdRr3fgfn9sd
	qI0gCw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg7ru4f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:41:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e160d5fd3so29846671cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776469297; x=1777074097; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cb9gUEAakmRv8wGC0EJTA21nGUPFfivJ369qJRSvttU=;
        b=BdX6Q3EUMAO+t02bK5mGLx9HZHcLo0vn2coDRyN17CUu6hlhvVApqTULwuBj7C+JL/
         F2yLvJkj+yC1BBnYMQs0oJPy9LTBiXZDfP1g0UFRzIQGlJu+HLirTrAcRHjNC9SGg6yu
         B7vW8NsUvX+juZnStJ98FyaCIiXGYSn/0Wk8tpmsUjMARe9RRfYToFU4soCp7LHs9TYe
         3lHdXWuBbFIaWdRoz7EuEBO8Qy0wgF5sLsVcc0rIc+fbvas2VhPQTN5eNPTb6QeGdISA
         GButqfqZkU1MMCwUMSrYyrUwS3szQzWr+OJCkAs8ttTlaO9IpzVbxL4hVFkHJNPXSBjG
         EMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776469297; x=1777074097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb9gUEAakmRv8wGC0EJTA21nGUPFfivJ369qJRSvttU=;
        b=Sz/GQA2E91P+YCqb4R9f3s1lAqI46p1VdO+5AbMBE96dN4E4DZ83y3Y6MtP7vDwSrK
         omoYvJniuhoahyoj8K6SO94sagSB3lxPh0kxU4+K8BVHEhd4DwZv5SJg8GSj/kSt2tHj
         hjwvCT2l9XkcOqHNyPCce40fl6J2vTnjzRN1ztTjLvmwbIsZWLcWKgLGVdo63faytm0H
         g6AjfuHKtHm/NNK3YNQnspL2Eq9i0ZrkyMvMrgkH+vmAlNptsMrusDBW9SUAr7hromV6
         vn/K4KeCIkWmeADFojAFWMXxwNqAQ5mXI5gQGFbafDKrpMYxxrKa2o12qQRo24+ktCpT
         /ubQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UL8OlWM8ShwcHG3cob2xB8QXfgAdNm9onNQ49Gr6OSXw9P7FyvOhDUgRJ9CphhlYhXGfwOMEH8w8MresP@vger.kernel.org
X-Gm-Message-State: AOJu0YzDDD5B+sXcGL/T2ffQ15dh+3XyG+sIC4n2wTNh4/Bx3/NPwmyr
	HD+GW1YRYSAehLhBLDwNBFoVhtWsK5EN6ECfreUp2kqfI9sxGekVYmVnp0QrtdS11v6M2Lmitzj
	PxarRxIjHrGGyQIr3EW/Vt3+TgZ0ZVLBOOdNSoscp1x0/w2ZIqlsbG8y12uuuvKBiSqHmyvHYUl
	lf
X-Gm-Gg: AeBDieu/NI46iEazqpuuHFDL1UoGSp67VKPVbbPMBmzr6kRV6rsgzSypxK++PVbfhhd
	4ByYROA1mlvuDQ05g0WCL7gIniJ/r3608dnL9jaDDagpf/i6Ikz1UJtXgj12nnqQd//svz91aJ1
	4V10TFUPRRk0e7cm2KAP8CqKrRWQCVNxkz456lMcV/bHe4hH6XBE+nm6U10FrLaO6p+pDvyeW5y
	tCcqLmYNwzPXSzE0RIwrzl7sEE7Zeh7eDXuSAx9kCQKWKqIAQ2DgGnIZgHb3UIjr+AHUf7f4p9n
	vEXm7Fton2HheZeLJrk32nYor2wSyjbascCMZniXF++aC3pdy6JuIHQx2ochDoYvFanGPryxpoN
	aFsHjSRmh6IiILaLXWyKLOsZqkRmFBvQAi8XrdAaM+r0nNX8b69D049UKbxZsbo2CeGdZBOry/h
	0JDgOnpbz51HIiQ9qsf24vTmqY1EIq3U7HIRfSmHwtNcrtKQ==
X-Received: by 2002:a05:622a:2517:b0:50b:37a6:e497 with SMTP id d75a77b69052e-50e36c777bfmr71031701cf.44.1776469297067;
        Fri, 17 Apr 2026 16:41:37 -0700 (PDT)
X-Received: by 2002:a05:622a:2517:b0:50b:37a6:e497 with SMTP id d75a77b69052e-50e36c777bfmr71031431cf.44.1776469296604;
        Fri, 17 Apr 2026 16:41:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7dd0sm807847e87.69.2026.04.17.16.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:41:35 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:41:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Felix Gu <ustc.gu@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: wcnss_ctrl: fix firmware leak on req
 allocation failure
Message-ID: <jp2an3h2ca5q75mkhmpty6jf7zv4nkojvq6ohjiyffbdq3hpmn@mx3jdpes7dox>
References: <20260417-wcnss_ctrl-v1-1-5811ffbd8f49@gmail.com>
 <bn7vppl2ndcz4b6alpr33eniy7ft7fztnwnm4ez4eenbi7wu6q@km3xn3syfqfq>
 <CAKxU2N91-yFCUds7K1ZhYeLab2cduOUct59wj-KfUA_QO3PfYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N91-yFCUds7K1ZhYeLab2cduOUct59wj-KfUA_QO3PfYg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: mj_iehM1WEJm516skeFkjKurJnK25ib3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzOCBTYWx0ZWRfXx2qq10ss284M
 35ySn2ZQkMtdjkapUfsgJr7iInTK4Pk+mUOkWoo870Xm0nT04s5oTZqxd26CCkcxLojzBmrVmgg
 9+CVG4hud9WAncTrVcrMWeEZCvH/qnINLs+DGL1CHEyfmF0oj8t+qW9z8O3MeA2YHKCZm9Ht2Kj
 JyOZ38BGq1CzFIzNzIvecwg/DJLfxSKhO26JYEdiR8gYIcwgBuDJ+1TZzauHQEtL7PSyG1QNmM3
 Zlc5ThIj+/9X7iGL2NtwIP+U9x3JFzxW+64NJN7MhjztpSKcV52CjWr2ZKH8dOdoqBz3z99noUS
 +2e3C+l9f7auX2jXorw+4xbVFtyYUUE02HqUHC267VcEcvXagflS6Z9nVcMcx9B2wbapl9WJSeS
 l2Z4a2Gl4W8/uMZnVnFKrd028WfPOS8kYGUGWZTQjZmX/LZiRb90g48V+2f69Lpf7aqBUkG8yC4
 D805IglAKbMk2ieE8ow==
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=69e2c532 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=18IzKgZr9P9Xzzd_UWgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: mj_iehM1WEJm516skeFkjKurJnK25ib3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170238
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103580-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09DB641F37B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 04:25:38PM -0700, Rosen Penev wrote:
> On Fri, Apr 17, 2026 at 3:56 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Fri, Apr 17, 2026 at 09:17:52PM +0800, Felix Gu wrote:
> > > In wcnss_download_nv(), if kzalloc_flex() fails, the current code
> > > returns -ENOMEM directly and leaves the firmware reference unreleased.
> > >
> > > Fixes: 908061f0ad30 ("soc: qcom: wcnss: simplify allocation of req")
> > > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> Same as
> https://lore.kernel.org/linux-arm-msm/20260407221519.6824-1-rosenp@gmail.com/

Indeed!

> > > ---
> > >  drivers/soc/qcom/wcnss_ctrl.c | 11 +++++++----
> > >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

