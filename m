Return-Path: <linux-arm-msm+bounces-83325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CBFC87359
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 22:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 926E434A84B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 21:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29C42FD66F;
	Tue, 25 Nov 2025 21:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJ+g6qcG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O9+Hnj3w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6622FB0BC
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 21:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764105562; cv=none; b=djfg1jVIIj7IvAO0Yw/56wytf/j2ItHbP27Hh31YqhcR8O7g9Nt6oJL1EcNJc5ojZO4d1Guzk5e3PpuYewzYzey5l8hklreQT5KKTNkdCwepriONbdFkZvm5kRaEyRirsGp/WoRFgALAU7paW+y21nrkSVeWby0VifhrZ0xjFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764105562; c=relaxed/simple;
	bh=s6oxw1XWGB4I9jqKvVZTebVhKAgC5EJsIirvx8Y4I9k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVDZ8wi8URzg2VvOHSad+imab8B1Bd8xIQ5uPVCc7+Anf3RWcWmifwFqMldVyDdVcQsy9jNSxTHS+F4rEhTwXiimvwxZaWqKZifNVdyPBSr2VaLrX2eT4lqIL0Ej5Qu98OfhC+au4PoRPwsTiK5nGltVKQ7aOQO8dkqSWTa9VUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJ+g6qcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9+Hnj3w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APH2u3s3738346
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 21:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yLTPkC95YrE7y35XKu51MBDh
	XlQiAda3t/Tfz4Ry+2Y=; b=lJ+g6qcG4jkD6M+q24L6QxTnfVAwanik7pa5DbFY
	OxXASjIDibsH0tJb3c2KAYfGbrSp1C7G2Ak79iM13nDs3ZZ6nV9Ru9ia+FBjX+Ke
	N2jXeMAfHjan4vNnHL4u1H3H7VUJMfDzR+NYzeYgeKNcJMhEFOsbu8kdNIm4s63S
	W4AcHnP5eguh2WPRQGjp/7rXxrd3Wyz6TamYn8TPy+hce/jx+BDDDYg7dbr6ly1w
	3O1Rq+KQyEgtNmF/VYGVnqwS6aFImIjsPWsE/Mcsu7zfXv+eQmGyp/hxf8X3hJ1A
	dKCCgb11dCm+6rm2ikYAZYaNWFH2UVYXue6AfW49Tahkrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggygn3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 21:19:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2de6600c0so1688804485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 13:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764105558; x=1764710358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yLTPkC95YrE7y35XKu51MBDhXlQiAda3t/Tfz4Ry+2Y=;
        b=O9+Hnj3wZNpuP7/Fso+1K8Bm14FjHoqNlEwbeo0eLZrunml8f+tgB8JD+FD6D53DGN
         4bWAmU1Nm4qpVvrZ1l1EY7G0URLKn6SwUj5Y6Tn/LhCk5+BmrwLnYAowzKshXGPnX3n2
         RY/SGvNBDewcm3nFszMI7MUnKA2yIUXyoUfLa5ZzOj4Sn1PhrRq4Y045l6g79rUnQWJa
         dn14KfQ4Kzm3kLxQxuRhSqSike6aodi3UdFDdvsqNl9fqrRUaTpf3H8IbxGElTMCW9Ca
         a41wFaemu9p1NxRPHBshbPn2uON+RzE4P9vOBOylhc0/0NhP+lVotQnqyBpp6jbOBoiC
         DZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764105558; x=1764710358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLTPkC95YrE7y35XKu51MBDhXlQiAda3t/Tfz4Ry+2Y=;
        b=W9oxneaX7RerTYufTTSSsWpVvH/lAweEOqxrQnn4jqiRBzWiuO8BI4jlAh8ATufT6b
         6KM5Fkx+5XuXNAfbSrVxK9v3WBKvepvjLNFuv4z/hu1KoohcaoZDTQAeZkcEynEutLbg
         qludxbY2pK1iVJen5AP0tbFApjkuiVDxaqHS4t89cOKV38YaSgPzcCrRSXs1LVhlDf7J
         i/x5J5IWvYZNdAsSzDDQF8eenoEzJutvtR0n2sIkqDPj6G3rQHgDLfpSHUOyXyGF/cjT
         SDf4hTYk4IUwYtcCS0iFDScd4/Ozae7inLJoAzVkRCLjETmpG9dI1RtNyX1cxW02ta76
         I6yQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2vBzKz/5rZd3lB/3n0CvBulfc92TwPYwoI9shJqq6M8j97Kb5FYrG3hA8fRtO8SyMkVnQuoqraBT6I0ur@vger.kernel.org
X-Gm-Message-State: AOJu0Yylnp9jmocoWa8ZFMKvg29U/5bBkoLMvlqZH1SdSeOBJAMCkYTC
	niFbnsMIc0xC4pJYSzHElDLjyHf/2wxuVWruCU9y6p5Gpf2bc7sWbNvsPy7cxRkmQ5ACZk/rG8b
	zoN9qPmliiN7j2TtjKCxf/jisID70QuOyHgJxXPpiZfb7BWnhGPztJ77/U4aUjB3laQx8
X-Gm-Gg: ASbGncuXNtb0RTs4AxQ1rdnJcHx9HeKngwlnP9KxmWz7pf9/eI6PBgmgMbHjxd4edJM
	Rqa+sjOM72kBXWhvoe8X6UcBuVBnoSoE6guwnsVNjdmNfPJ3VZj72nRZRLzNprPDrdr0nyX2QLj
	Ut+AwuK2PNFWAHkNOWI7xfM0p1QpKl/jqyZORkLmNoHoimLLs63/HOhWYSxF6kgkdSvtoasFt7d
	J5lT4UV/37FuaSZyRn8eiZFL9bam2t6wN/c2OOLeObhfuCfprVXQt3LCyuFCGWKBwrlhGlx1BPC
	wao3y5RMScvqis8ALvX+D5w3ZQ/JhhSIhsFabFKpFd32OYU01H2co7Zmm96lFjJw1rGpEfi8sBT
	d6+JQXElYoiXww1D8OaVwbNkE/4rWI3nv53f7PevkL/Cc
X-Received: by 2002:a05:620a:28d4:b0:8b2:7224:b25b with SMTP id af79cd13be357-8b33d1b3473mr2215372385a.16.1764105558100;
        Tue, 25 Nov 2025 13:19:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4F7F27ZWBnL7RYAn4cYaKbiarUuuQz14/G2GedWKvgXvvzElsQHBYyMfyKSvJPr1Lt4Clqg==
X-Received: by 2002:a05:620a:28d4:b0:8b2:7224:b25b with SMTP id af79cd13be357-8b33d1b3473mr2215369685a.16.1764105557657;
        Tue, 25 Nov 2025 13:19:17 -0800 (PST)
Received: from trex (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ff3sm37293579f8f.16.2025.11.25.13.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 13:19:16 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 25 Nov 2025 22:19:15 +0100
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
Message-ID: <aSYdUzpqX38xxywI@trex>
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <e409f318-cd50-5a7d-7f46-a928ea544597@oss.qualcomm.com>
 <aSWmeZHmeUWs1NwY@trex>
 <35d86818-8b50-1c0e-40a0-5f80c4b24a32@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35d86818-8b50-1c0e-40a0-5f80c4b24a32@oss.qualcomm.com>
X-Proofpoint-GUID: gK2ldqz1O8CLWdTV2mQUssBv-CIhE8v6
X-Proofpoint-ORIG-GUID: gK2ldqz1O8CLWdTV2mQUssBv-CIhE8v6
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=69261d56 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=xOd6jRPJAAAA:8 a=EUspDBNiAAAA:8
 a=LunTiXMjpaI1IbjBSeoA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE3NyBTYWx0ZWRfX3ack1cPU/2hW
 ctTtZMctopyYHA8L/p3/EV3vC7NCO7TYI2+sp47vBseilfB7ZTIeqUxrfXI+S69ol1YNRSMQY9E
 LVD7q5CGt4LzJHWbnIFZs+yXU8ENp3Puz5ku/8b4mZiFlxLJtxT161++wMVWaGda4NXKXeisQtH
 ApIwO5Liyp4rDUnJZ+q/yqxD6Ry2Z9EV3F7Z8RAHB4YTgko6czlSRPYS1IT7eYd0IMsONj6ZxmP
 i03O4rKyJ060U8VDiA/kk1XqLLXQkw5JQef1bwbHFxBd9fV6nwAZ2DWV5/VSmSw44awQV6Iwre4
 Usz8kzwizsQZWZiRfPPKfkRC7ABfpi1OiValcqVuraholGGc2SCVcb5DrHDC33/rpA392HCH5b9
 +2SWzb8rgELMniHCHU+tyJTaxHylDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250177

On 25/11/25 18:39:14, Dikshita Agarwal wrote:
> 
> 
> On 11/25/2025 6:22 PM, Jorge Ramirez wrote:
> > On 25/11/25 13:59:56, Dikshita Agarwal wrote:
> >>
> >>
> >> On 11/22/2025 12:13 AM, Jorge Ramirez-Ortiz wrote:
> >>> The Venus encoder and decoder video devices currently report the same
> >>> bus_info string ("platform:qcom-venus").
> >>>
> >>> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
> >>> parent device name. With this change v4l2-ctl will display two separate
> >>> logical devices
> >>>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> ---
> >>>  drivers/media/platform/qcom/venus/vdec.c | 5 +++++
> >>>  drivers/media/platform/qcom/venus/venc.c | 5 +++++
> >>>  2 files changed, 10 insertions(+)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> >>> index 4a6641fdffcf..63f6ae1ff6ac 100644
> >>> --- a/drivers/media/platform/qcom/venus/vdec.c
> >>> +++ b/drivers/media/platform/qcom/venus/vdec.c
> >>> @@ -433,9 +433,14 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
> >>>  static int
> >>>  vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
> >>>  {
> >>> +	struct venus_inst *inst = to_inst(file);
> >>> +	struct venus_core *core = inst->core;
> >>> +
> >>>  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
> >>>  	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
> >>>  	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
> >>> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> >>> +		 "platform:%s:dec", dev_name(core->dev));
> >>
> >> Is there a reason to keep both strscpy() and snprintf() for cap->bus_info?
> >> The second call to snprintf() seems to overwrite the value set by
> >> strscpy(), making the first assignment redundant. Would it be cleaner to
> >> remove the strscpy() line and rely solely on snprintf()?
> > 
> > argh, my bad, you are right. will fix.
> > 
> > perhaps we should just have instead
> > 
> > decoder:
> > strscpy(cap->bus_info,"platform:qcom-venus-dec", sizeof(cap->bus_info));
> > 
> > encoder:
> > strscpy(cap->bus_info, "platform:qcom-venus-enc",sizeof(cap->bus_info)); on the encoder
> > 
> > I suppose the additional info provided by the dev_name is not really
> > important to consumers.
> 
> In-fact, we don't even need to fill the bus_info, received a similar
> comment on iris [1]
> [1]:
> https://lore.kernel.org/linux-media/c4350128-a05c-47af-a7e7-2810171cd311@xs4all.nl/


Nope, that is wrong. 

if we dont fill bus_info we will end up with the following again:

root@qrb2210-rb1-core-kit:~# v4l2-ctl --list-devices
Qualcomm Venus video encoder (platform:5a00000.video-codec):
	 /dev/video0
	 /dev/video1  

instead of something like this:

root@qrb2210-rb1-core-kit:~# v4l2-ctl --list-devices
Qualcomm Venus video decoder (platform:qcom-venus_dec):
	 /dev/video1

Qualcomm Venus video encoder (platform:qcom-venus_enc):
	 /dev/video0

