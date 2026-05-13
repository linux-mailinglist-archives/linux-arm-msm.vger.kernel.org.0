Return-Path: <linux-arm-msm+bounces-107250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aE1eMppRBGo6HAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:25:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 892CE5314C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 702A030160D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 10:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5B23E5A30;
	Wed, 13 May 2026 10:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1QguBQ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvhuhNJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E673437207C
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778667919; cv=none; b=Ehokwik9eVrY0zAVXxB86HxS+oUDB7FmDEMvtF1aEdUDW7l4M6TpMdLkbVCnLDHeGR6g/9V5smEKdJGqAB1ag97/HbMQZm2r5lQ7QbPGhpgs//A6vQATzcIHr3tIZEoDGTz9oHEhy0HYsFMc3eLABl1Msh8k/Xa04Ec3+Hh1jR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778667919; c=relaxed/simple;
	bh=4xeboWFZ7KIkPvp8DbqtxY1UtjVPp33APGryhQKBOv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHjCrfCWOghkUDLzjkVspTxKcNRqF0gWfD26r5PHTz/5X8QqVqKNW6UvI2zJg7/X341K08ikICpINNsgUhW0TyVPKdGHhRXEOfnM0vknfAjUSvIEF1uHox7KskF5qbHgFNHHPnuhSOWGncBUaPuh8zsQSraMmMnmB3LVkH20n0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1QguBQ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvhuhNJ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DANTkE2338816
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NC4z8sUzDtuoZefjQNFdQx8N
	XDr0UWsSEbD8EvkofEE=; b=S1QguBQ/dKua1sKA0ZsCJe8NVCPqr4tczR65Qewl
	fRNY9MHhQlpYlEjMuh7UU0wodljBsO62IXlejU5cYE5bmrvBOLCzSmQU+Sjx7ab0
	OjjY4r979cNK/Ghw6KlyHVC9qRQh2K7M6R9cmYDgp5xqJkPibdZg1KNRy+ru3l68
	/Mfp42wV2h0bZkIjHQzmmdF/8qEvvnS9R8a0YDfCphdKul3TeZnuoubP9ZMGrwZ3
	dBd5H7fD+e6aLZtoKNSfzTvXTyyo2/OH2/lK6Ftul09p0B6N2FAZ79+XqFyqcRMJ
	oaEeGD2KselY8VlTwglMeuE3IkyWyBwx1EemiB3cYfP3DQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxayn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:25:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5104b861649so199630751cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 03:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778667915; x=1779272715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NC4z8sUzDtuoZefjQNFdQx8NXDr0UWsSEbD8EvkofEE=;
        b=jvhuhNJ6s1N8PgD6Fz0b1JZb6efn4ob6cHatf+cTqXLpGhAaAPiHaWcisofVt3K+Zk
         Q5DKy4bCptkWiVDGYgqIojVLxIGFpRrTGi826IYUBF33X/RPD3z8TzWlPythMUyzUOzq
         zJTYouS58rSZk0FHoigLa7AaxctCvh9X8UbrnXAMqibnYJQqV3PIfxcmovqdQglvIJQO
         4ddeyijrXZEAefpclljIFyksrX3/+QShUIiNCoAay+r1PZisyoVxwehJjMFOvEOnDvHL
         jVUjDvqetF8GvIBMjS5l3lBGxOA9VX8jrnECkt+L67FIQELE2GjzePoh5eMpH8bSkQwx
         OQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778667915; x=1779272715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NC4z8sUzDtuoZefjQNFdQx8NXDr0UWsSEbD8EvkofEE=;
        b=czxct8xw5IwaKLJfSr5l5QTJ1p7IKSTxb4f/aQGBkWxys9dK4HM7+aPn5pXHCzFGc+
         iUeD36W/mw1YP0K4FVakxH8wLdXu3YptVtx7Hsm/WUOgLOyQhDa1OS20nPlZHMyPlUG/
         BNE6h7tTfC0VeD8vjfZKiJh/5nKIl9+YBOHbuuLaxDgTSQjGWprEHz9OOtBB4OB9K3R6
         gthEQevctDfV94Ty/nRLJDnc4eX2j83bFlDuxqo92tpmaPxwQB3FeLO/o7KROBNGCHg/
         K0gqzypf2BLIhTUD2VMR56klANI/9185EZ6uV/nXgg1V58fXCHSWTK4+rnmP0lm7Adpm
         LIJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pRE0cRWggT25M/xUAYQMd7Gt488k1ybeJwF2fh69NKcTlxunN9T1qkQqrgovaBb/L7egTZMg5I09bxa90@vger.kernel.org
X-Gm-Message-State: AOJu0YxrdSDOUN19hANXFZ6PmOFsBTbt8kQwvHhsZgX1iLjynD/1BGA3
	X9W/o2w+6ENq5iSdEnOIZ38415SufRN1kmGTTtXbeYZxdJ0vp2GsFS8pTCHmbVk8Xj43DfuJy8/
	HiRxH+vjwyMPakpFMYdV4FO45O4y18jEeem16qXcISbHQBUAneQK9IV7aRuiPAZiftCcs
X-Gm-Gg: Acq92OFc/IO0ft+mOSPCBbzjWUbW8Xy4aFIztAICSxzzNl7tTucmXeARaeb0ar678Ny
	Aj1b35hxeB8RG/8Rb6YcrGy9p3+yHHA4NS7IiLAakaD8/URuR4c98XRzrhRWp05zRY4v/X8T9Am
	vPlG0SwAiSskuEEoceypQaq0f7ZtzLR3fEvodyTEuzi8MNEGXBvws6t+YcofIRCLFZ7ooqMY3Z1
	JkHKDy7BsaoQkX46tkRFVc1EU70bHtpwbHcXBrW/fm1/VwATDIjdhF6JNYX0AOWUEjF87oAo6nI
	guU8vEkAMau7TbCPtpc9BGCEjunPK1IcptHIznKVY0lvM0OHJaREerKktZbzFaIqS4ytkMztzYZ
	e9Pjv7ZcU4wQnFYsuYVwaGYtuKbH8/RMPw9aLopWrqv9TDO4K+5jhhdIGgHeannhQgm90rYR5Fx
	pFafOBL5GbhmvgtlxpB7BUaCd+mzBprXZYbDI=
X-Received: by 2002:ac8:574a:0:b0:50e:60b8:347e with SMTP id d75a77b69052e-5162f68c693mr33074231cf.59.1778667915216;
        Wed, 13 May 2026 03:25:15 -0700 (PDT)
X-Received: by 2002:ac8:574a:0:b0:50e:60b8:347e with SMTP id d75a77b69052e-5162f68c693mr33073901cf.59.1778667914755;
        Wed, 13 May 2026 03:25:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8cade5fadsm2312103e87.4.2026.05.13.03.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:25:13 -0700 (PDT)
Date: Wed, 13 May 2026 13:25:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] media: qcom: iris: add helpers for 8bit and 10bit
 formats
Message-ID: <nxydcmpfpsgndmsuh2oarbmnm6ko4k44rlcxunsjgdpmh2zsof@53elccft32x2>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-1-7fc049b93042@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-1-7fc049b93042@linaro.org>
X-Proofpoint-ORIG-GUID: llJVGUMg0Hl6xXvcAjLt8y2DUqnQnygy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEwNyBTYWx0ZWRfX40mCk2VIYzTP
 SuPTyinhY2GUi6aM8Zot6kuE/HMwoSCriaWEwEr9RuTFqBkxAlvAGDHKw+qXIky5F75O15UeEfH
 kBNVnCurrTNxWnxyPZravCx61s+SzQVipb2TuJYe2sEyXykDbPLldkR7psptvT3ijhvj6aad3f1
 Kesxj17fU1BhrrpEFBL9f1JfpMlN2hdP8YmSa3mf7xgUd2cl/m4JGBh22qW1ONgBCSgxlbHYSI/
 n94KoEZPwpO68RKyMv8tFGlHnbeLha0j5lUkB7hjm3L1Ed0zFav+/x0KJ/oaQszpjwrepnGUGaH
 /ZfscmJO99Z7enOStIpVB5lMz/8+4UdRGJGTFIIaLUDhmILsIEV9eOrFqNbnQMIt3JyjGagb3UN
 qPflBtgQBSLmLXYVRYBqKYbCs7jt9pPQmlACdJ5VvA1Vpc5LMmsvwIoGZozCnVpHNcmIqYVHoZr
 Ku+TldrfWxoFS//I5mA==
X-Proofpoint-GUID: llJVGUMg0Hl6xXvcAjLt8y2DUqnQnygy
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a04518b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=5Kv_vQZlazJxXpBqwIAA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130107
X-Rspamd-Queue-Id: 892CE5314C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107250-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:20:26AM +0200, Neil Armstrong wrote:
> To simplify code checking for pixel formats, add helpers to
> check for 8bit and 10bit formats.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_utils.c | 12 ++++++++++++
>  drivers/media/platform/qcom/iris/iris_utils.h |  2 ++
>  2 files changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

