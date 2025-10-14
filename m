Return-Path: <linux-arm-msm+bounces-77139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B67BD8931
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 047A64FD577
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886F32EC0B2;
	Tue, 14 Oct 2025 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUj+0nu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D380D2DC32D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435510; cv=none; b=kO3DiUwtH5OcMpJD8d9kfCglhYe71WuUx4w0gyf0yeLnB66bO9I+b3tVp2rGcq+QLIEUiEkhy+ikQ+9pXV3e104u5twVW1VqX6sTCAZAdJGOgqi1ROzIWjY2CTU5UtgdGlF8u9rHMJCVOeet/7TG+A30K6kiRx4Zlg1U5ph5gz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435510; c=relaxed/simple;
	bh=HXt64+1Xvlydjl9pTmLXP6gz0dV1TLaywfmvV1SO+gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewfxEwgDgdUsyW5SIfnLu5h7C86qi4/kFWyfNm4WpxjkiYVQ5yR3u/TdCio6O9ucAM3fwp6ZosXBEaGPgL98inY0p0J1k+hunCLmpPSIwr3IU5DJBdlUzCROD3SQTxodhqt2J+l8NH58LPZVnf5o038br8peWkOo/quXMkinp7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUj+0nu5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87HFc001466
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PBxL3RtdJsu1S+FhleqKP4xR
	3hS6Z1oUg8unkEVuIQY=; b=EUj+0nu5lCKxxt4hAqAT2RuYpEFLOIsi2tQeavSU
	uoKZfx4PVnqmTjcWgrTaX//TP92ZQbc8Nw9kJAMG2GomrysvU+CGiLXPwm5DE4pg
	7QrivPWpL6oQmrCLxH+wAzVNhuhfsa0BCwTXQyxS5HknlYymVLTzCs4MuITA4Jvm
	+G7XAsRie+FZp1VyvFSNUHxdKC9cZMt2fPUr4pteQIcnhSAIKK9A9U+X11IK2cy9
	qNJaPvAlwjOLJb4jdtfOYk7eC4W7lr+M6KbRkL8degOzoN4w2t3pF2AvwthoYKpX
	NqAqhgYWjQxlvwcMhxKkX131cgKH1rPL+cbJtpn56EKIhg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa880sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:51:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-870d82c566fso2391811885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760435506; x=1761040306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBxL3RtdJsu1S+FhleqKP4xR3hS6Z1oUg8unkEVuIQY=;
        b=hLV4C6VfiO36mDPv3//XXffD7vq8lWrO7lS/AIR6VvTZWnDDuTm6HrVkB3ZVGRsIkL
         rrtB7PFF8qiG53nWy0wHc9pzw08UL0tF/bcgaU0awocG0dnQXtIopH7Y7QO2Ucejn5xy
         0Xub6Qkn2MDurCOghQSfDr3ZPB4bgVZm7fcU5dllk96xHDpPlY3MM4Nthh1YdpsQ5Owh
         AfjEJu69t3VETTjW3uVH4AE3LJoLVIHxHQ++sprzGEUIuOoPUlUc5EYfsda5bnX+NZAg
         JJPnFGSkFCvYC63ugV3gBO51McZaP5HrBL1jB2NlH9mcleg8sBn2hVPTBGnsBcPDi7lZ
         hbpg==
X-Forwarded-Encrypted: i=1; AJvYcCWXMNnVCIPSCkn2s7HJi7bfz/H4T8QivvFm0GV6rYa1qrrJ6xzWyEGOaW3GTrmNbX5QkayMjfzhx5AvXKCt@vger.kernel.org
X-Gm-Message-State: AOJu0YyVXtTwkeDt7Gsqw47DwssStwdg7fJCEWsCxLav0EvfUX3DQCsW
	qxPbXo2XH59eToz6PT/nnQvC2OVu+yomOLakhDPdlzOLRtmQS52XEZUIDcrxEDDTH4NLARQzTkD
	tVSqroETd2ec2xFEaMGiA0WYxIof/jBs6xH9T5hH1u8EzLANZB1TaDHkS1kGinZ9ZKhnSxnVS3J
	Xt
X-Gm-Gg: ASbGncvIxb2pp3nmjTmZ68DZDd7YdgMB5jgLK50vlYo/DwNK/CMw6BlGHCcA8TZH1wu
	qnlE3bvIVpv4aMEOwjLzOyVlv7SqCy9aeODoe8PoylBnFYdXQmHFdovROh/I9tTnthT0jqOwIT2
	VU9Liu15tEpUPpjwsEVZtblAf1c46+9sb7OKdbSrW2HECwPhPdWq0Fifv0Y7CPCHkKLjJjsVoKb
	OCkkmE2b6C8XzShalp0Jve7a5PIxnbbw8KHIzgWVyKZA5S9+TTIn7XTKrxMq/nT63/AULeIV7XJ
	0IX/ztWWrGgqLKJoivWSg5v/mlKaA9vi8gJqUBVAZWkcwgnXkkG8l9UtFlkxzMiUH+BAYHL4IKg
	z6sFF/trVKEVHk5BgjM1dfdFMs+8CeQ4CLU+SXnaRCBOmBQYBev0t
X-Received: by 2002:a05:620a:4548:b0:855:4f0f:d782 with SMTP id af79cd13be357-8820d18e2d3mr3743665085a.34.1760435506186;
        Tue, 14 Oct 2025 02:51:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxVvkud5xjmzY3lu09oqjenWjIPO+wBq4K6gyqhY2hcAj1kfJyz99dhsusENH986ON+4ZCmg==
X-Received: by 2002:a05:620a:4548:b0:855:4f0f:d782 with SMTP id af79cd13be357-8820d18e2d3mr3743662385a.34.1760435505707;
        Tue, 14 Oct 2025 02:51:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e577asm5106216e87.11.2025.10.14.02.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 02:51:45 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:51:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] media: iris: move common register definitions to the
 header
Message-ID: <t5obao7tm34uilnzoa24shknvdtzqkc5uwek4cxwbof3tgqylb@jehfugyxvups>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-7-def050ba5e1f@oss.qualcomm.com>
 <b7eba4b5-1189-7506-4767-0ef3234fc6f2@oss.qualcomm.com>
 <dzorzudzpjipvlkwik3uylomwi2dy5ticxromzegzgi2jhibot@reqv5ul5ifuc>
 <3802fe42-0c94-8c10-7b6c-6c3adf863ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3802fe42-0c94-8c10-7b6c-6c3adf863ef9@oss.qualcomm.com>
X-Proofpoint-GUID: HBDsOXi3w1OBawjpxclrjyjWexbXFDK6
X-Proofpoint-ORIG-GUID: HBDsOXi3w1OBawjpxclrjyjWexbXFDK6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX/MQUiPUg6+0P
 8Dp2hxn0cLI+vO2G6xLmb7srkAg3Azm8jKlCvZ++VjIckX5MJupp/oNRWb/dYlPO/HF31RcSgfA
 0NhDyIVDM7nzVp78P6zINgcm7TkQS8vdY1EfgOy4hagqT+wdas/TRcLWpNDYMl0m2UBBIsnYnrf
 VttJ02RSHq1jE87nPegHQxvNkC+sp+Cl8fvh4POihyyH7Oz40q+ph7HGOi1g/hXHbE1BHTKjQ7V
 TYarOf5r+SRjsHcgkb9IJHyMrl/uNBj+tuYA8J8wGGZv2X5/a+c3gr4hgXrKFQGgZrMpdqNczVs
 jWS9zGvlZFFB0NGPtTglawhPGL6SzkbMOQlNq1mm2XTD8Ql8cRjFqujm4zimN/CrXPuK2W2KsQr
 AvjHx/KWgVfSoqPaCc1hinMQ5li61w==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ee1d33 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=aQDpXfm0Yy41Go8ML2QA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On Tue, Oct 14, 2025 at 02:43:56PM +0530, Vikash Garodia wrote:
> 
> On 10/9/2025 8:18 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 09, 2025 at 11:40:25AM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 10/8/2025 10:03 AM, Dmitry Baryshkov wrote:
> >>> Simplify adding new platforms by moving common registers definitions
> >>> from VPU 3.x and "common" file to the header with other register
> >>> defines.
> >>>
> >>
> >> Similar to
> >> https://lore.kernel.org/all/20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com/
> >> ?
> > 
> > Yes, but moving more registers. I can rebase on top of that series if it
> > lands first. Or I can just pick that patch into the series, to remove
> > the dependency. What would be yours / Bryan's preference?
> > 
> 
> My vote would be to rebase this one on top of earlier one.

Ack, I will rebase. Seeing that none of the patches in that series are
in R-B state, I will probably pick up just that patch into this series.
I hope it's fine with everybody.

-- 
With best wishes
Dmitry

