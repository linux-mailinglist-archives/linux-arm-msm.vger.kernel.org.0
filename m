Return-Path: <linux-arm-msm+bounces-98014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLI5CI5SuGmKcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:57:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A26B29F60F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C05A3054231
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3254B3E638A;
	Mon, 16 Mar 2026 18:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcecoBgX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdeuWEZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A093E5EE0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773687096; cv=none; b=GgE0MKSUCnb6gJRrjhT9eo7YSeYQh6LewjsfecAvOLksGcpV9bbe6bKuxewIpp2FYnHT9ZOZH3LKFzlprb6sp4ZNofCiVunJa2Ui8RPK9Lei2qzKZxzRoZAKa1WFZpIq5lTnY4Nj+4+bgxB6UUuxgpzjnnJ+W+nClJpChHn4S5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773687096; c=relaxed/simple;
	bh=VLOaaPN3+12q2nnI9MsZxOni/pE1gl8lt9oTF4huZGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGyeVFJ4fohecTOXATbyrQBVWUt/6pV4iY92eg7gEeASZZxP/JvNgr/QqOsWvorkty4/jDCjhPgCvzkAfbWLtHMYFZ1hAyZW6We1YiQKAnNvER1FUrVCbZNBX7g+s93VmLBZsb4uwLNpfbMMgsAq6r4fTbVAUuEHlAG5Cejv9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcecoBgX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdeuWEZE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GFMp5C2314565
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GbJIE4awYR31+dxdu/q5rVaW
	rRC34cBDYrzjRpjAoQE=; b=DcecoBgXScz/g3YBunKdlIyNc/mTYUPZmnZM02gD
	mcDxzAtsQ8mZSahtgbpV8DeCmD+aVJPA8ooyaX8R+Gxv/S5L3c5vSMaYob4Dv0mf
	KTDawmaJ6MByns3Acyh5IFvr0bzP+2JWv9wAT+PWB3rOgGie5+0vYaKK/6dDSpfF
	b5zWAUJ/dHzxRQjCzhijW5VfU4LWIy8EyLTJUO/y1fuX5wR120F5D3jnzUra3EB1
	j6bhHQyW0q35jHqaJhNRxk79Q8rU/xQ6hx6vh7INz3rqo40Jp5muk7fOlCFRbalD
	kwlcOkbtPeuQdp+zqgnOnvwcVFIWdyhnN3Ax5ZUwhChS0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf28r08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:51:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso5144807585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773687093; x=1774291893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GbJIE4awYR31+dxdu/q5rVaWrRC34cBDYrzjRpjAoQE=;
        b=YdeuWEZEMdcY0jhnUfmS0gP+H9qF/tNfeFYtCe/x1xZXRPk31HdcLWfACJPWJJkLks
         Z4riZZfE4FvesTxtZ1U5E2FO7N3njADesV2Kr+a0IXWQPU3Nx+7uI0c5aIyWlvzOQR5O
         nPvQcbI2fH7Cv2Ksr9U09QnEe8v6Xt8qAU/wuqe9EBOiaG12LWU7wDA92RUawEJLbPqT
         QFNKZD5kAqb947EU+jwPQAjtjL9SUukt6gC2Grg18avUnPkY+zipBeUFDn7fOayp3gd/
         P9bVsUNnoyhYjzyCdQjDQb+viDPhUpWxvTU0C3rx004mTZuCufDmBjH7b2BhPWd/bkbi
         C81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773687093; x=1774291893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbJIE4awYR31+dxdu/q5rVaWrRC34cBDYrzjRpjAoQE=;
        b=KV0W8OBorDV5/+k5WOUr20dLqi6aFDe5LYw99gqdXy/jsKsRVlmloH3kkMggay3bLI
         Z7dL2ojXFBk58RBGuS/9LQe94p8hYNUzK3M09YQDtC9HkcG6tj28gcrrBfePoN/nMjSh
         ZRdjtlDlIrgL5VDxZ7iCLIf+C//kvAgTvrI3+fvubZMMr3fDTEXctOLPGHjsjZpiJNUG
         YwXw79uTSRpBNPrNReaQtuAev9U6NpFclVqD6CVhqtTivrP4/oVfPlkpzHgS3/g9/bPi
         Tc4Yx39YeGfuKLJKjdKbSLzqtY+3fWJW2x4D7/NZA9nxh8bmhlu2ylM6RjOxQc0iVLWK
         C+6w==
X-Forwarded-Encrypted: i=1; AJvYcCXTclZKmCT/NTTABHP2/IaLOIpGqghAA7fa7QGrIoMi4D2E5B2g9PCPniovQTknaUVVD/WoDabfINmN8KEF@vger.kernel.org
X-Gm-Message-State: AOJu0YyzF8gHx3jEqFIZLsFdggYbtrtvlQ054W2a8LWKOZfLynb1VasF
	GewlEVkxPIcyksrJ8VxN+DIzWu5mMsGuD+IRUDp7wpf8ja0F8rVyCN9+9bx+yIAZSo6UxRNPP+I
	+3QeizRuN4ZrDyzAeFfWe0ykvYglW/s/DzuvbWA6nU5JPHHEAumC36qPB/ET2X/VDOuRn
X-Gm-Gg: ATEYQzytgYJT9k7C4YHCRFcxn4JYmIt4yHYlWbxJe9w9cXDtSFEWeblXEO06y6Qyozh
	km3wTlJzehsCNuAE8rrJcYs0torhVWUC6uKO/plxgt6e7wpZZAMS2+1lGs3yUrixNf5zqCBYP8S
	KS7Xk8L8G4HMbrC4373YAr3mgj9hdgx4aj+4hgYjcJjGFz/pT/8YVXuCxR3kdd1+gWkr2fueIjx
	APILb1UNclRGB1lIjNqFhSvkjuAuz9KGMBFkykSYAOsLUUNzEshfOmUj2eB9GHsq1Ucr58gPARK
	yVIG5TXYVq1ZibOK7n3/QdVnSX17VqYlidBZrTl9IHlh7Hogn6F7yzs5eYuORp8cTfntPPfwXoN
	i9jnjgZx5m50izuRiRJNt7KWVGPaz6wzP1iDE9s2JLTrORhgF43KfVmkFrLbmB4ATOhlFf4KKwu
	+W1xULGs7SeOlhMdv6P4NOaG8udvrcUxtOhY8=
X-Received: by 2002:a05:620a:414a:b0:8ca:105a:298f with SMTP id af79cd13be357-8cdb5bb11ccmr1773429685a.68.1773687093242;
        Mon, 16 Mar 2026 11:51:33 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:8ca:105a:298f with SMTP id af79cd13be357-8cdb5bb11ccmr1773426685a.68.1773687092847;
        Mon, 16 Mar 2026 11:51:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d61f1asm32736651fa.2.2026.03.16.11.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:51:31 -0700 (PDT)
Date: Mon, 16 Mar 2026 20:51:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm/a8xx: Update GPU name with slice_mask
Message-ID: <y4r7pispd2f2tqtenydyxrom4qm3l274vduvsxx2twngkfxk54@n276gxfb4sm5>
References: <20260316183436.671482-1-robin.clark@oss.qualcomm.com>
 <20260316183436.671482-3-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316183436.671482-3-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sN-dfAw0RLBGHIzhZaq-3DYaenoqFL28
X-Proofpoint-GUID: sN-dfAw0RLBGHIzhZaq-3DYaenoqFL28
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b85135 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1MCBTYWx0ZWRfX4+ckHRt76sNG
 +hCtx/ngsedfa6WWJaPaqJCuBaZ5TVEnTdkPJydDQs4dNkGYci21lzPJ80h9BHGu7CxLtV7vWcs
 FHOe/31bJXtyvPZxv1vdAggGyAqm29UBhsOBsthFuSuGUDc7A/4MA1zYFo2DL5cS2aP/QEcyPhA
 fkb6sJOMNgllVFN8dqaKUnDYFJnX5dI4Z7XzHyMq+Lfma+5NVIhkNDstpUeofXDPt3LASnZebgl
 QAx35nbL7qoi85Pj9MhNpS487/fGiXpqSWcH0hsCrE2e101PIfZpb6LNM1spiy+IgtYZPIYdifs
 GBCeEtGeehDSGPpIkyyiqdSSpkSFgoLNVfDeqx4eC6VXfKmLqnin6RtdUHmZXn1Tu/7T+Rq6DmW
 GbZyyVr39GUhP7hL8lKfQxu5hTUCt1dTzVOqjWtvaOLuyTY0HRWDZBBUCG2kTKuuTf8mGXj3cXu
 6W4wAzhoiK8dhDHDkvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160150
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98014-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A26B29F60F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 11:34:34AM -0700, Rob Clark wrote:
> Once we've updated the chip_id after reading the slice_mask, also update
> the GPU name so it matches.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

