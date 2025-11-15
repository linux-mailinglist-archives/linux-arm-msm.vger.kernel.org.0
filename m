Return-Path: <linux-arm-msm+bounces-81927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD34C5FC0A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 01:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7DB64204A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 00:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FC61991CB;
	Sat, 15 Nov 2025 00:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODckJlfs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJcuJGxq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4FD145FE0
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 00:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763167503; cv=none; b=HMnLLFw5SkTUoY9R2IqYc79MRVJ5/FJ62l/jQyIzwKlBbXu/Di3bI3bRea9lG4iloNBb/4D0aRvadai+PJvgvW+MoU2nEcWgFQrTvRb0pVTvobCjO78gj9ZHNmdSMJlwu08avGQTILWVhcqkMOf4FT8b+gfvQz/TJi6EUC7+Fbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763167503; c=relaxed/simple;
	bh=RfI7Pl8POOHPpn3wIDYOadl1rbDNl3ZzGMDG1gTfGxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHfG5FhALEuJRhplETY+3Z8yRJHkEm7PJLFQjT7AnGm3Rg4cv2ZJxYWlPg5/42CQ7e7VXqDvDf+/YC8fcWYENwkFTl91PNovwFO0ibVrpFJOiNYYXr0OAmth3TIgoCiA8cONpqmKrsIgCtywwu08kBzqszwX58GukRXa0ADaYXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODckJlfs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJcuJGxq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEJVSlH070999
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 00:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kHSr3Uxb5gfTp8PMcc+9CNwl
	Vz3omOLQcZ4QTy5X+lE=; b=ODckJlfsAxbyXTtcs5Zm543nzNcWtRpWXJwR+uMn
	0BqB/hWSyd4H8OuVqMp+yys58KTOTAThFhwxlyoThmB8gRaCIJKPfVhkcmZd5Kxw
	lfcbla9wgB++EGDkSmbCH3068Oov13I5BCMuM6f94boSl5AY/bvN+c9GpsOuxyr7
	MycHmceYdsDFwWcDa2NG0gHfD8rcfCSOQmWn8NIYI/9uFIivvkXUR12lN1VBKjT5
	Y3HSvqZFPm2DH+IcfCemhPBe1GISzlubXCJjqLHl0l7FtUB6DIxhlggAx+QrR280
	zmVmdjj2viq6ssQ/HDura3pZoLrKjHWEt8PvJRHceOdXOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aeang8pua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 00:45:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb84fc9bbso117400821cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 16:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763167500; x=1763772300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHSr3Uxb5gfTp8PMcc+9CNwlVz3omOLQcZ4QTy5X+lE=;
        b=TJcuJGxqs/gQIf7I9kZTFeWTV5QtDGgDqKiKiajq4Aj/zhWUBsYVEwlVcVRnOj8QIa
         /Lf4ZJvJyultHevjEUupjPunu/2INEDojdKsiZNdSDjQQjq7hmq0FBg3Z3qNbvR5gnad
         B1ap9WML83mxbf288Tr4/RZTl23M8+f1ZD+vuduIJbncptrRNTjUU3ediASCpEc1OwlC
         L4J85PFB+0WhHyOGiWvT9CHQu/60isylHP692lR48+DA+GucCDCnSTJ5Ck2mowGK93J+
         6XdXIb+nDiXg/vBPijTqPQBZUAAA+aD/9u1ql83DjQMlV0jrstxBoyHq+L7WzSOFsKGR
         wm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763167500; x=1763772300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHSr3Uxb5gfTp8PMcc+9CNwlVz3omOLQcZ4QTy5X+lE=;
        b=r/QXfgTX7ZSMqoS6qvpNvFAg7ZYFnNreLqda/y7OJXLzkHqWjdZCaw0T85390AV9iv
         9x3MsZ4BTT1h7P8hogNfDhM0rBkJFkjfl80d2lg/QB3nqqzn8ic5EH9l3trpss3uO4zC
         B5+mK8x+ubwwk6reVIM4L9+4WytHk42UHghzeMLLxrf5Eb77AnAivdPr22R3O8xoK6Fl
         ZJHWegVH8Wp/sVvFqXsX2CGo2SYuU9CU6CPnbkYocn597SN5JyJL4ferLnZlyMZq/6mt
         Kijp7nz5wQ0fwEyuMvTkxGyeHFOLsqRzWPpOP3r1vgIUZAVO2Sar0gXdoqSOjhhYeVv9
         bfCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFnXEcmps6Xo5U/X5ESjLOJJNwmfkT2BfPFyukJ2pcxq1FXw3k/xTfx28uF+YTAvHVL4QiqulOiL7jJklF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrm+Ci+jlsgmi8yLRSbgutLAE1Z4J4kma7D3BdKi8fADxdIMsU
	ANqmx4IcVUPCZi1Qg/1bSVkCfXBerHwT3zEBdMWerpHvfgR5jhd1VxyXM5Jw7hAcypoWSGKX6Uk
	/8vG+BwqhDxC8yDDiqJxuTxG2hLHA5yltu2U36L7+kseHM215DAkLlPrS0lmZLBM2nEQK
X-Gm-Gg: ASbGncvuY9NzBQxoSTAyHOYLImgvNn2mfOeDYmASj+H/M+PQLMSw/oJKC25NHKDcO7H
	JylRjYekHuabaAWZf/yZ/o8TBQCVMF/Q6rNMcHX5S5Aq4Kc5notGVHd1P+YOlcWKZmaqMULw2Ug
	rJDTahBOAHv0d1Y+74x/Jf0Q4HrZ+v7L/RW632hJqI07ssn7X+vZfnKOpRuPgLrPZez0rl3Xsnu
	dVcwnpWHgBGhH0wtngyRdZGszGFogEv8bkofM8dsw7qlftpRpvOWoa3XzEYj8yq2/zJKG2Dp2wT
	sMUWH4YvNpc1U+3yl26Lskt6b9hMLdI8m14jyKdyB5XBm87z62Pl+FO8Nbj/KeOHnlc5l93L9LH
	1K8F/Fa4C5jPMqM202Up+TDiN5tc5O8Gd/nPCoVWT3IRgKA+UW3Y2UKoQn4xCjfnzp+XZqWoSuQ
	XZdiiPeGmhqTEa
X-Received: by 2002:ac8:5dd0:0:b0:4ec:ee54:b141 with SMTP id d75a77b69052e-4ede70699a3mr106378041cf.26.1763167500260;
        Fri, 14 Nov 2025 16:45:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTsDRVIqLn1VpOlz5z6xTpaoGY3LMTcHDBpzhVsFe6h8FITQwTVx2wdmRWmkQbySXE0rNnig==
X-Received: by 2002:ac8:5dd0:0:b0:4ec:ee54:b141 with SMTP id d75a77b69052e-4ede70699a3mr106377841cf.26.1763167499760;
        Fri, 14 Nov 2025 16:44:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce1577fsm12961501fa.17.2025.11.14.16.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 16:44:59 -0800 (PST)
Date: Sat, 15 Nov 2025 02:44:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] drm/ci: uprev mesa
Message-ID: <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-2-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114030056.1139570-2-vignesh.raman@collabora.com>
X-Proofpoint-ORIG-GUID: l2lO8A9PNBFLWjjD9pvEL2Og6Em6T3xH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAwNCBTYWx0ZWRfX79uglC1BNIFK
 eFK82HaqsRZNf0x8YSQgFSTmEVDw3GUc3EatEcGnN+iaJKSS12i1URPKy2kCVwXDfJ5OWHKRpBw
 7X+pwPStsMDDVe7IeLmQgP3QrCwh4nIQcVAQWZcHr4IP6IdtjueGowBJb99kv/6CzVdxS813fJ4
 UBBBQZBIBDIuBO+U9E/FJtcN16qo37zxSpOOP/gcF7DDhtVDQlg8FTtNF2G3boYc1KAJAZrQkEZ
 HLUTjfSGHoidR3Wo0eq/qar+egaGzcrBs0Ko1I3dCNvmfeXuyDua6NF48wPaPeqTxZRUgevBT68
 HFdrtSzvrszFMS0C3VRxfiZYvlqVwRe4T8bscmDkBFmt8kczvSh/bNo/fQ5aN0wcWQNh/zzmkmL
 Pdpf4NmJJARM+LUL6uI+h3oBHW0C/w==
X-Proofpoint-GUID: l2lO8A9PNBFLWjjD9pvEL2Og6Em6T3xH
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=6917cd0d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=H-B6EOQw763qFByNOf0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511150004

On Fri, Nov 14, 2025 at 08:30:50AM +0530, Vignesh Raman wrote:
> Uprev mesa to adapt to the latest changes in Mesa CI, including support
> for firmware via LAVA overlays, removal of the python-artifacts job,
> split container and build rules, use lava-job-submitter container,
> and various misc fixes.
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/build.yml         |  22 +++---
>  drivers/gpu/drm/ci/container.yml     |  28 ++++++--
>  drivers/gpu/drm/ci/gitlab-ci.yml     |  95 ++++++++++++++++++++-----
>  drivers/gpu/drm/ci/igt_runner.sh     |   4 +-
>  drivers/gpu/drm/ci/image-tags.yml    |  22 +++---
>  drivers/gpu/drm/ci/lava-submit.sh    | 101 +++++++++++++--------------
>  drivers/gpu/drm/ci/static-checks.yml |   1 +
>  drivers/gpu/drm/ci/test.yml          |  18 +++--
>  8 files changed, 186 insertions(+), 105 deletions(-)
> 

Thanks a lot for taking care of it!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

