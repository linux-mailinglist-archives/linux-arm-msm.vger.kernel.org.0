Return-Path: <linux-arm-msm+bounces-90567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEYiLc1ud2m8gAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:40:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B888FBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F518304298B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F02833A6FF;
	Mon, 26 Jan 2026 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTGbgHR2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dw1xBCC/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722FF33A701
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434728; cv=none; b=sRZvvSZsCRFwpzQVjxyocuy0V4anizsErDDVgXVbvDEKPpx/gTAk6u8q6tsGqG5Dq9XieaIQbZZmDAMCLzAmLN4sbUf/I9FfMdVtYT1M7NMMixLS01uI/ToSwFanv//rehuGOxRiUSjUEooIuyulAMcVge556CNci7O+kb+mHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434728; c=relaxed/simple;
	bh=pwjK4+pdWgeLe/K3hHRuwqqM/os1WVoxjKEALfiTNTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RidxFjQTihYAshJ75c1wZxcund2XltO22PZkwCUBN2bQdU3Ps5UJJj2wzABh5stREKmhiVuhJNoG9aU2FxcjHa1ulx8vc07gKBobW2h+1CQM2e6jk2+9Sy5DxRjnZ3iHew349tlgTOMqX1+UkRsgBRGmQPsoqTO7F5iidc96pc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTGbgHR2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dw1xBCC/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8dmVg476471
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YskG73YSaDPdLYLxN7gxrpSE
	dUjoPZzx6h1RXNJhXkg=; b=BTGbgHR2c7gbWeI6uKP/KPuMP13PAUsT5cpdAu27
	aTiZUVZVX8dxkgYQCXk8W0rd22yRb+SgIj2x0lIOeSLC91k7+eIg53FH011wJ8PW
	FT75ffvo4WLGUn7RYv7TcbAGESVC563nUgkDr0pjbfy1Mm9OnBnRMkRE3fOtm89E
	FZHZzOnh34tAX5lFyADUtVJ5YsNx17lLpiE7wO8Tso+wAbwA3M3HN1OyxNVjHkep
	Ig0eNKk0ZDh7UkmubwY2/nBXM3yWecBE96K1fksSfByDQZJztn+AsLM49VuHJjYR
	P+x3YxEY/XWnvHhqbpwakA3uZJmLEFxmkA2uYaE9t1BZnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uvmty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:38:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a289856eso1412127185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 05:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769434725; x=1770039525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YskG73YSaDPdLYLxN7gxrpSEdUjoPZzx6h1RXNJhXkg=;
        b=dw1xBCC/0MTEEe88HApc69uhPnNiv0zhA42CXuVHg3ssRhJxevUzUCorSlZjIqdUP0
         GRXuNNdUIC3ZnP/EQEZOLh90SFkSBczU4mo6xQym81mkR5DJ/onMFwr0dk0EZhIAN7aj
         /9VpgarBU5tr0c+dwzljzmQWnC14JPf6TB/LLD7w0zrMwCcIF0rhZ+N/KrYupDdWLCKC
         lafbksMjPvxIVj/bJszJumA+0Tv7tpRNGKE4E1qB3T1WxTHOzNVXffjDZtfpqUag69Iy
         abGKXT/41j5jUnlFITjzWwgZXuA4KZAksYRBbq7a6M2lCOPZNXk64uj9RizBPjJKGRKF
         gUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769434725; x=1770039525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YskG73YSaDPdLYLxN7gxrpSEdUjoPZzx6h1RXNJhXkg=;
        b=N3pOisZiNqdUY9Hypk7bLp70PTzm9apKGaCxkSC1UDEVN2dDQ6DvGT85IJC4m7rb23
         9Gi45CH06ma1e8yiAb4q5NRyYgtrbnKCz9uRfuZMoz6v/HHGgH/ViKgaCSeKMyBzlJ3S
         PUGoaBaBkH6aPQMwRSMeAV0YpSwR2ajt2d9OnqTso6Bv17ficE++sXuuYEV5rNqc1Rf6
         NA1lIuCGGycAerflObiqobOBO61rY4JTl7UICQ0KURGuPBqtESEQX3gUljm3/RIQ1aKI
         nnteYVnh+KKZoImwBieGgWJBeZWjq2Pm9RtowrOgUqduZkPetLhjMgKSlTBsl9/Cyr+Y
         B6VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIHO8yE+FTqGDFMniKOtkn1m66CmS75+OAZIeFy6XtCm6ZvPmcicAlb7vUjL6YbcPGRx10hZKmk08ieW8o@vger.kernel.org
X-Gm-Message-State: AOJu0YwXJSU13oXc8+DeGLv9AA3tO55BRl+torb+/buKq0Rsv6cUsaLw
	ZXvbKZnY4Ebe9lhSi4L3+5Z2/Ybd+fg73kWlAupaFymKisv/XdeYH6qEq+nOx5WT2bCukSzTbmy
	AqVh+AWlCokNDEOE5IhGl7Ia7I8uA1xUw1J/OGQ3qr6sTe4koSRFzbcG4zgo59399YJTi
X-Gm-Gg: AZuq6aJ/CYdHGpkQ9LtCTwWadEV9vTrT7CgEAypLyEwxlmZy9DD6VuBOnBG26JIk1TP
	IfWBauBSX8yudAI/DLzUeA2zAz34JGxAW5cRugfj+c89fd1/E1RqnnZoYCfjpOlpTwaMCS5N6HU
	5UAhJ51q+vGMUglX5cEXU3Z9KeZ0r6HgH31rl9Wfwt3/X2iBSXJUC5mwTopIejb1q1/YETmzKLP
	7cNudf1JnOiAkfHZsSOWl3cIVlB616jLBAHrf0h/9V89lEVOeynMx68mGBv6pI7lZ0x4yxONQnq
	JeFnua186UIarSdgIYcEcw4uiN5MdD3ENgBBXoZv4tq0D8rD9lCnqj+5DIdoH7oXx/DbIvmhnoC
	PA4Sl2/SsS1UlJTTdQU/3TYNvOxPXE6jdrujarklCRDvPExXC3GtaSR/0EefEbr0ZgMHG+57rBY
	kcMY7Pxc6nO6Gj/2hwLSv68Rg=
X-Received: by 2002:a05:620a:1aa2:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8c6f987646amr480076585a.28.1769434724707;
        Mon, 26 Jan 2026 05:38:44 -0800 (PST)
X-Received: by 2002:a05:620a:1aa2:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8c6f987646amr480073185a.28.1769434724156;
        Mon, 26 Jan 2026 05:38:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da017b5esm27709771fa.19.2026.01.26.05.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:38:41 -0800 (PST)
Date: Mon, 26 Jan 2026 15:38:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] media: iris: add support for kaanapali platform
Message-ID: <lpgw6eodclsvfwgvtljfiorvjkpd5vd27yhxs7i3ijfibaqzuk@bak2lwbyh77f>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDExNiBTYWx0ZWRfXzgnGuXAIhLhT
 /pj7+PXEyOMPKdm+h1c8YZQFfII3uU51Ynlj8fYByho+EuGyAbAhnGLOiCpMCpCNBoba+90rUrM
 qovBeqOIUlyKhid9r+7B5P8SgWTsxhZrdNj18wGsXZw2fy029VWy/5DYLSv2uVXqiS0TCrK/Nyp
 Vawz0xECSA7c0kWYK+iMqirSo6gm7Xzi5YdKs2Ab3+SUGKFa9wOrzvrTYobOrwWwSE8nnfNKSZE
 Lu/neZRBc1yBtEH4EGsK16UkRM6FwQ7LHCz51o4KK+G2dfsOccp//7w3SOkTqJUxQAEgBUWDLne
 0wa/2pxlACjJ6ah081nenWVTnf08NSytyaw2JZVCz6x4Pc1ugZ4uj+oz+cq5DPJcZFqudv3QiRc
 EobeGbtN8L9jSvtqXa4Dz3UdE7c0IrEH52xAtrl5faVULfa49hj8G2Y6qPXRqlwO4qPRlo69woR
 rmDTdO3pZTfYUG6aPfQ==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=69776e65 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WVDdUWqqhAlxm7gINyEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 5RSCSLHRIplGPX6_oIVvxWzU7GgShv_v
X-Proofpoint-GUID: 5RSCSLHRIplGPX6_oIVvxWzU7GgShv_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90567-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 627B888FBD
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 05:55:43PM +0530, Vikash Garodia wrote:
> Qualcomm kaanapali platform have a newer generation of video IP iris4. 
> The hardware have evolved mostly with respect to higher number of power 
> domains as well as multiple clock sources.
> 
> The series extends support for multiple iommu-map entries for the same 
> input id. Considering iris as a client driver, it adds the handling for 
> multiple stream ids from VPU via iommu-map.
> 
> This series is depend on the below series:
> Link: https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/
> 
> Following are the compliance and functional validation reports.

Please validate with fluster too. Having a "knowingly good" command line
is not a validation. It can't be reproduced by anybody else.

> gstreamer test:
> Decoders validated with below commands, codec specific:
> gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 !
> parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none !
> video/x-raw,format=I420 ! filesink location=<output_file.yuv>

Neither of these commands specify, what exactly was validated. They
specify that you've validated _some_ videos. It's impossible to even
reproduce your results, because you don't specify which files you've
used.

> 
> gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 !
> parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none !
> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> 
> gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 !
> parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none !
> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> 
> Encoders validated with below commands:
> gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
> format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc
> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> location=<output_file.h264>

At least these should use test sinks in order to be reproducible.

> 
> gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
> format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h265enc
> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> location=<output_file.hevc>
> 
> ffmpeg test:
> Decoders validated with below commands:
> ffmpeg -vcodec h264_v4l2m2m -i <input_file.h264> -pix_fmt nv12 -vsync 0
> output_file.yuv -y
> ffmpeg -vcodec hevc_v4l2m2m -i <input_file.hevc> -pix_fmt nv12 -vsync 0
> output_file.yuv -y
> ffmpeg -vcodec vp9_v4l2m2m -i <input_file.webm> -pix_fmt nv12 -vsync 0
> output_file.yuv -y
> 
> v4l2-ctl test
> Decoders validated with below commands:
> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=H264
> --set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap
> --stream-from=<input_file.h264> --stream-to=<output_file.yuv>
> 
> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC
> --set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap
> --stream-from=input_file.bit --stream-to=<output_file.yuv>
> 
> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=VP90
> --set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap
> --stream-from-hdr=input_file.hdr  --stream-mmap
> --stream-to=<output_file.yuv>
> 
> Encoders validated with below commands:
> v4l2-ctl --verbose
> --set-fmt-video-out=width=<width>,height=<height>,pixelformat=NV12
> --set-selection-output
> target=crop,top=0,left=0,width=<width>,height=<height>
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
> --stream-from=<input_file.yuv> --stream-to=<output_file.h264> -d
> /dev/video1
> v4l2-ctl --verbose
> --set-fmt-video-out=width=<width>,height=<height>,pixelformat=NV12
> --set-selection-output
> target=crop,top=0,left=0,width=<width>,height=<height>
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
> --stream-from=<input_file.yuv> --stream-to=<output_file.hevc> -d
> /dev/video1

-- 
With best wishes
Dmitry

