Return-Path: <linux-arm-msm+bounces-78601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E899C0173D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 15:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC2371889A45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8C72F39C1;
	Thu, 23 Oct 2025 13:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Isv/NH1S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA37314D20
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226028; cv=none; b=kTxds1nrib91xkXhn4/jeTqKLzDpwRulFvqespvzFOq01ZGKTnuqwaPJQ3xdSqYXjnWI72yHweaRJnE1cC+PtnC3A5KeQ405yQaEfadhjV2Nav4cCjy26iT60IkLl0EEAzD6ENuxWfuqwR8LybC91+geZ9NR0gj+Mz0f3Mn+z8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226028; c=relaxed/simple;
	bh=g+Rv1AjpSsTCKZOwQpgnDI79Ij1e7QTYDmKCsA8cuds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsyCoBPC+0vlyl1gQ1jFQ9iSUZLEfDgHtMTgWl0zUoZ09JhkQRQR40hTla5VO7TufmfRnIS40SmQM0olXGjUPW9CZcGN/3JpAt2TCOi2jrpFkCV0YVoIlvsiSmoXhgMadjZzHz5QVuygZSoo5vZIRB0FQ5FnV3NUM0zX+QZwg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Isv/NH1S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6o3s9007458
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 13:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zT/v/9VMVWiK9/shfJzJr3Rj
	xsz494Ezk/EBK0cyjeg=; b=Isv/NH1SmSzG1p6Qccm7OyquMrKA9YbgTBmcbf3v
	pO+PgWznCSHvDXc07zZxcJYODtpFDsaI9pMyvoRcSx4UpqEkW+UPPjSjjbogOcAn
	nzvgxtBHK1M3wssZOnCGw/yNne1LhqvqaTTHVajZQqCjx9IW/xSCCrHlfNzd66LK
	6zBJuPyhXYKmnTECmYAraKllOLgWNPy1R6IHB9L1+HxRfHmak+/RnwduNsSCs/cv
	ec1ljypNmw2wjcuxiEAiNAMjM98uxGmHjjPDEANsN5y2O75lqwvi6Ev22M83wWyL
	X4HCCfdDkR/i+ZDiOKsKGoG9LIaA4yLtLqSx3uKgcJoqyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3448kug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 13:27:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8bb155690so11260521cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 06:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761226025; x=1761830825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zT/v/9VMVWiK9/shfJzJr3Rjxsz494Ezk/EBK0cyjeg=;
        b=tuaGCAHF3EwCvkrcanRn8c9/L8MRyUlfrXGjVyuKImBV5Q0dWAK3T8GePLuwJubSr1
         fsGwZDAptNsukZYhC84/MCPFu9MJMmtaB/CnoDNoGmG7Kw4nA3MaKo3K6D9xYxfY8WJn
         gREYhsI+nzDG6sgkmsoJ/s1lE+WbUH3C9W0xC1naiJhqhlYl3A3rt9wdjyCs32L6XHfM
         yWpTcJG25q48HTTzK/fI3fWZ3Y7/DEfSZbIGe0fZh+St4p/MY17czKIzLyjiwIG9f19g
         JL+IDDn4iVmfJ3O7fqyzu8l3Ums5/x3WcYp558keKf+3SoO+ds9xZ1j+I7tGC2n5IjzE
         LiNg==
X-Forwarded-Encrypted: i=1; AJvYcCXx6RshMsAj16wbtT724mYmY1I252BMHqC3k/xaYmllHVDLilioQqtfOeKWH+l5hQT/sErQMFVxqxyEVLal@vger.kernel.org
X-Gm-Message-State: AOJu0YwsYVufFJBigFsmV7NMM7YJOnAAcV+5VQdzqIskjgTV4WUgKZFh
	yaFDgxfHCZMgu9cDvDGAFZyRj5U2B8i7HGivhUcqju1VtHBQLzHx+WQAazUzGQsESVNqO/BgJfk
	u2kNZPt7H2/q7Sf2eYvwzSIMg4r7LdMqH6uV3ttZOcddgsMlYgTmxMLQH5e4KeLZy5hhf
X-Gm-Gg: ASbGncttIEecoWUb07hD/Qc7ouy9OffBnecHPGbLOF46wmsPNOZApTkgfeviDfzcMwB
	v+ZCuBaP58HxtX4Iks8djQYwTG63Hm8yqFA8gzlJvfwG5YHjN+NiLRwbjA35+JcGi1GL/3KXqKY
	XUTNExD/SeeKiASqyq44E8zRgBmaSS3YK4y/7tlj7+aNfXz/Qd8KiOTuP9W1nvoD6dS/3q3aJB7
	q++viauMuiycQ5iVQfDXvq68IW6gKHBxgw57hLz3++S/DwGDpbmri6jdyylW7sUTdW5+XTQqc9R
	6EB/RjfPY5KM0GqTLchjqUbtjuLtnE0KefjwwCHgXHtJs1VgU++Dfw9xem80b1w7aZAWqANWvWg
	0RBk185lIGMQ+i56tL2pgzvXHXE1kQY94AzwVSt/g46RCm93pHmbk4axPuArFTJIafAyJKNn7Gy
	3jfZJJhpTcKlUl
X-Received: by 2002:a05:622a:1923:b0:4e8:9ade:108c with SMTP id d75a77b69052e-4e89d2aa827mr271838151cf.34.1761226024548;
        Thu, 23 Oct 2025 06:27:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGANmpmamIIGJzojFfD9uGQMnLDoNMf499KeF+uSksNrzxNT9z5RsW0fShxZyAoOgvuNuO8rg==
X-Received: by 2002:a05:622a:1923:b0:4e8:9ade:108c with SMTP id d75a77b69052e-4e89d2aa827mr271837751cf.34.1761226023947;
        Thu, 23 Oct 2025 06:27:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d67dc6f5sm4594971fa.44.2025.10.23.06.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:27:02 -0700 (PDT)
Date: Thu, 23 Oct 2025 16:27:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] media: iris: stop encoding PIPE value into fw_caps
Message-ID: <pcbpoilqcqgidtbnji5ntzdqrk453msfmoccs5ntlustiqdomx@ekatz52c4f2u>
References: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
 <20251019-iris-sc7280-v4-3-ee6dcee6e741@oss.qualcomm.com>
 <8c75296f-2cd7-b0cb-f7ae-d433d2834bdd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c75296f-2cd7-b0cb-f7ae-d433d2834bdd@oss.qualcomm.com>
X-Proofpoint-GUID: QOr6WRW1EfknEpx2bsrEg-9Z8ZNfVGyI
X-Proofpoint-ORIG-GUID: QOr6WRW1EfknEpx2bsrEg-9Z8ZNfVGyI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX6CUsDsayS7jT
 OKpVSibTEjb3vY86t/eRQkbUyj+SEzGmI9AxRzXapyAReJgE8esQyiz+HTZ6nzjOecshNOxhTUH
 1Lmyo6npMhfH4Stg2Qsrkydz0KZmWcTwmbkQzd5W4M/2bUKIgXb76gC2CZsJa+r2eyUfLwwUCf7
 p84jHwdwfYeDMQ0F1K9EX+2cYXBAk8hHXKTRsFqEGi4ysa1qtCH4Gjajm7m9KjpjDm8kkmHLo6e
 YHgUyxMXG/KGgeZM7D3la1z4L6kQgDDURNi+b93L3DR3Exvz7HLS5oPoCDspM36SsTd4pgfni/I
 1wn9CoY/zl3Euur+SRKbtNPbUYwp1UrALoiNgKd9bXmTn5XIstXvoibF3xdGMFUCFrZm51ZNyW4
 25skHriavK2QMvVV+NB08qzfBNNDDQ==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68fa2d2a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=q52pqm9MKi6dhOjivlsA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

On Thu, Oct 23, 2025 at 02:20:36PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 10/19/2025 1:26 PM, Dmitry Baryshkov wrote:
> > The value of the PIPE property depends on the number of pipes available
> > on the platform and is frequently the only difference between several
> > fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> > iris_platform_data rather than hardcoding the value into the fw_cap.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_ctrls.c            | 16 +++++++++++++---
> >  drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  3 +--
> >  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h |  3 +--
> >  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  |  3 +--
> >  4 files changed, 16 insertions(+), 9 deletions(-)
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > index b444e816355624bca8248cce9da7adcd7caf6c5b..03ce5c259c8491ae6882128795d18569baea6241 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > @@ -161,9 +161,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
> >  	{
> >  		.cap_id = PIPE,
> >  		.min = PIPE_1,
> 
> Do we still need min here?

No, it should be dropped. I'll do it in the next revision.

-- 
With best wishes
Dmitry

