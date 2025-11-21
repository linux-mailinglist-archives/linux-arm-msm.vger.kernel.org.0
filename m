Return-Path: <linux-arm-msm+bounces-82909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A68C7BA8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 21:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D94633A6AAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 20:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7902F1FEC;
	Fri, 21 Nov 2025 20:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfWZlsVc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxPgz5ut"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB4E2D663B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 20:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763757513; cv=none; b=nJJgR/X45Gphf8dv4qzVz0Aj3zxkj7Skc9fpdX2CNcDVXtLLzMExq47wblOry9/2cGUdYOBXPw1jfD3862RlHDzxBGjYAYFt3O1QHPv/39tdn133tJOVZ8KYnC8BFIBriQF7IlRRbJUN/JonZiObIUqg7FdZ3qlFcbBiJ3w5Q20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763757513; c=relaxed/simple;
	bh=z+lrB+kmBEC4pZGUEUiAC1H0DxgeYRbapi4kZdLLTNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQZPvghULKwM544M+iI0JwEA6W6DutrfjP0AVaYImeCXQtOXSS0/3CvoYfLuepsU7CnFsfo+N1dUxkdVafpHv81gzuGPj5c1VidNvCOBeOhxGXsE7wzgD+NguT4811pbEC8tczvApUyYogxc+xPs+qzxQqrQzhL7t3jNf0Rut4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfWZlsVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxPgz5ut; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALBuW533007831
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 20:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w1hR2eH7HnUwa5LndV/w046o
	vky70Gx8uo/fdHVtGbQ=; b=KfWZlsVc8a4iw6vpneS4JJXq5iVwzhZlNHXVa+F2
	w0L7p4cm28R2V4PiaGhsZ4ejNd3JCc4qs0csbeW5zO4mb5JDLc0MJs+Cc51fR9QE
	Zmrjsuth7uco5r734F2ZRaHZX/iGYMWckW2TNeEwGn6FlYxIeaiHfBL33XNUiyGk
	2So5Jaky7n4gbx5fCBKwBGlNL9KpGLdE9IK9FCJ0VblVayidqkB/OM0axZ89qz1W
	W4HMH1Cg65sbzxUEVa8qBMbfnAtDQFNMLYt7XV0k68mwkWfhD+u15js17epg76rQ
	NFpqVnLrXYgmgCmK4Ooxvo1BLi5lKMKAy6oxebl1RUvsAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkf2un6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 20:38:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b1d8f56e24so708612985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763757510; x=1764362310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w1hR2eH7HnUwa5LndV/w046ovky70Gx8uo/fdHVtGbQ=;
        b=WxPgz5utpGSjQJ0F1M+ryqntvvdlxB63BfbwyPH+yJ6Uo3nl7mnB20BeoYGbmOgo5S
         boOaqhloLXmX1OZLtAKj6+dgHrBBzH7Gy4O2+FiZBMiIg6+MCxsMp+N12X6LviPuAuL1
         AdXhy4lPy0yumW4/a4yZ0A9kX8Vy5+dLr0+y34YANkbF/n2AoY/+3UbdQaEFZ8rx1cRs
         sFyg1iXv+TatRIE3UNAa0oytfQAWVWVjfvhWePtgV+/uvVc8Ktw7DzRmMiAA8KqI2/Gj
         jJZ2/GfTkSPTmVAFnEjLy7cqBoM92ERMHh6dHehNdne+e/mEhn72qo8LhnYKWi91hXEx
         NrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763757510; x=1764362310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1hR2eH7HnUwa5LndV/w046ovky70Gx8uo/fdHVtGbQ=;
        b=mFZnUA1/ngZh66T0HUQ5AI/4J1mg4dp3Xb9deZukNw2BUpszxWri9uF85PnRpMGzl1
         YXJwEUpCpnaRhtnYJtoUBytRmf6FZvztgEfmMTQSyFYmqTKbRQz0OZHa6qpjPE/mEGSJ
         G+u1fjhNGXfCPKcNCa2P//I9ikWWj1eO5+iBVVEWKrfQWwkcz9An/Fgk9jFPAmgcOmF4
         IiNsm73VYXB4LAoqrc4jYLAc6kofF+jF4ML866KDVd9HWI3czo1LLr6YCIj5sH1Vvpen
         FvHZaz/nt+y036l1pMQOxkEDtt6nlxDhPx+l+jaEFw8cIa81rvyFB9fR8ibxTU4OEtJP
         NHJw==
X-Forwarded-Encrypted: i=1; AJvYcCWsXnDIbYO+6BnrdhfjVEWAvBapOMjifmLhx4YV6uLwDdGWPQADHyyv1RCP1kuI5LQjHNFSsK8UYScX2X6q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9R76yeoP6Edp0z5Dr3Q4Z/Gas4iUlyG1ONamVYwC6XHi8qWkl
	urgEbmqG5aNP47YU79LdISHl8Hr7nBKrxf2Fs1w3+wq0HmgvOfAdx+ESNntkXZBpBn3rTrMInPs
	5gUO+/RAlLosEbf+9NHFh7f1Oj5bD/qTNgXZTGxQWx1Eq2vAcRnyqxAb199axPH93tBEb
X-Gm-Gg: ASbGncv7ywUVZ5jCD/ErGvJPK6tYpUi4FtYBKlv4BSmj/16QaMcTn9j37eMZq8ktb13
	u2WDVscim3cYb0vs2KzG5OMsSqHBh59zzlOxcqy+gRipBr4ipIKn81xIxYorS5kmjkmVYap45oj
	iPgxM2gjcgWXuSXoL4Q3/qPfJusMQSsmbRuMI0h0VucXBU73v8YyDTKrC9mKSk4WaDoQJ7QB43k
	mMZppbWjiXdSvIIOL7wTlkvgL6+24RLwjnnQZfZbhLpFwGc+UXe5hyUhjC8QkRVljI6A16Yug6f
	fAq2NXu4MTryoqyowyX81W4BdR0Om4B0T3w5iXBnLngwNuW6Ii0jiEmSVXVaB/ydS4Vra3y+1ec
	UWFbk4OG5uTPypqJECA65PKMt9r/zRDYI8rAxHAV7mESIsa7p7ULcQSQB60wFgx3AyqRuAtKjVf
	Yp4WXCgYgmgatESNQpLy+Vodg=
X-Received: by 2002:a05:620a:31a3:b0:8b2:e638:7dc8 with SMTP id af79cd13be357-8b33d1fe720mr430040285a.31.1763757509829;
        Fri, 21 Nov 2025 12:38:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwF/pqDLiyW2+aj6+2SODooudu2r2Z5OlD6MluktC0Ty0nB4MBp9KGjJ/A39fi3PedEuDFRQ==
X-Received: by 2002:a05:620a:31a3:b0:8b2:e638:7dc8 with SMTP id af79cd13be357-8b33d1fe720mr430036985a.31.1763757509405;
        Fri, 21 Nov 2025 12:38:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75710sm1851688e87.8.2025.11.21.12.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 12:38:28 -0800 (PST)
Date: Fri, 21 Nov 2025 22:38:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/msm/a2xx: enable Adreno A225 support
Message-ID: <heoefnaboftvn5u5ueicmtsqyfr4rpwna37rw3h3dulq7q5m3l@46s7l3fsxzbp>
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
 <68224fc4-9d91-4e6a-9fbd-b3aabe0f23c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68224fc4-9d91-4e6a-9fbd-b3aabe0f23c1@oss.qualcomm.com>
X-Proofpoint-GUID: GWvlBnG6KbFNUXuJulFdDfs0TUKCnqma
X-Authority-Analysis: v=2.4 cv=ApPjHe9P c=1 sm=1 tr=0 ts=6920cdc6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=lhKUE6b7AAAA:20 a=EUspDBNiAAAA:8 a=QyehCSxPrjoiuWyWIt0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: GWvlBnG6KbFNUXuJulFdDfs0TUKCnqma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE1NyBTYWx0ZWRfXxouuxXf07G9b
 zgEz+sXenry651mxmeX+lbIwEbLaL61Cxqx4z1i9DW1NntosPY9BPfSfc+P09hn8hwoaTZdWHX5
 BAnP1bKAIblUqsFHYxPL+EvLddT0vyxas7D0EH9gPA9Kd8Nzyke3Z0z1C37bdiFRxJOq2lKlfk1
 KBaJFNXosIs/YnityrqkIzLFulIPfBD1+PG///ZsGDmY3Cre7tP5H8oXlnY6apDwY5fXFLLRdBi
 qUCiH5PzNsH94EFuH/BFe61AkcnKkDyBb5U9heTgMbMG8QPlnUwa/lLmhaqXSt45xdZHxvLSkKP
 Qvil2KDOukVAvjEom9iDQnK3d6KX8H88/rCDkr2Vz5wXW6T8FI3P2hY4d3Arv0hIJTEvBbwYzmY
 dojH6IRHYeOCId0wA2m7pmFFMOT6Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210157

On Fri, Nov 21, 2025 at 08:36:08PM +0100, Konrad Dybcio wrote:
> On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
> > Add two remaining bits necessary to enable Adreno A225 support.
> > Note, this wasn't tested on the actual hardware and is purely based on
> > the old KGSL driver from msm-3.0. For example, running on MSM8960 might
> > require adjusting PM_OVERRIDE[12] registers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Dmitry Baryshkov (2):
> >       drm/msm/a2xx: fix pixel shader start on A225
> >       drm/msm/a2xx: add A225 entry to catalog
> 
> Not sure that's enough, a2xx_drawctxt_draw_workaround looks scary
> 
> https://github.com/AdrianDC/android_kernel_sony_msm8960t/blob/lineage-18.1/drivers/gpu/msm/adreno_a2xx.c

Yep. msm-3.0 does some other things for a200 / a220, which we don't
perform. I don't know which parts actually apply to our stack and which
don't.

-- 
With best wishes
Dmitry

