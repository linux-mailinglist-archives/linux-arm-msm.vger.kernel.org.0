Return-Path: <linux-arm-msm+bounces-96679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHCROtUtsGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:42:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6526325244A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 216D73226907
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91A433A9DA;
	Tue, 10 Mar 2026 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLk14I5W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWkdKTHK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE94211A09
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149637; cv=none; b=F5K4udKpLrKOyJ1sP3P1ueKYxZlwTBgnqpU4cB+ML09bboPs4LhHKpwGOstcnhDlrfWBQw1coD2ttYbUckeKk8o5o2qOZ81jAM/+XCZlujxLsM7/RnrkmqrbvP2egDIBZZPo7tYbKR2whF8PyAxFYPWNusijdmY4Mqx4qR49BIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149637; c=relaxed/simple;
	bh=dVb6y5W56xpzKfJQO0P/rHV2dBw1vm0atDIAY6mSWhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GA04GcujMMedG7ctQmkJA5Em2ztHjHybNT85ZVoczuvMA9rZ0VyhEtzlLTV1Z/oXj0v7KktMZ4a8AQocUPkYStrGSv5lEbvn6yAJAVpKIBjAqpDLb1lmRu5zoTD5y6Ds8LpzfivBL5Qvx31rH/Kiml0fr+EMh8m/lNVa4vAWdZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLk14I5W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWkdKTHK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaolI024877
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DfYI+6/c4jccnkJp/ZUObodv
	ikdpc4ospvMOIs2KDfk=; b=fLk14I5WdfwOiHMMZiPNPQ4vf9T+FksJtzYMRJJY
	YvB7QEwbxYHan/7ms8GAwjsWP/BVwc9mP6OQS2dw629bt6iL25SMq9QP0DK94zYy
	5O7DJ6E//zPlVB2OpBxgEoKFt9lh5A+QfXRAQtUkCRWCAbO9YwNc0qHoi1DgX0d1
	6riAPENs3U2QGOM4DN83TE81L+GnmbYLWdIyIrn9R279Tohk0IWNDAGaKA7gMJV1
	aoEdRUCbfnVvgko4ae1CTK2pZbzmK4Mnj+P93CbOz/URpie2UUo/qOzGW4XAMVob
	Qa35VUrO9h4s4pmwx07BvknB/DQucay/OgLhQnT1LE+FYQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5nh32m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:33:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50920055f0aso108432721cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149635; x=1773754435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DfYI+6/c4jccnkJp/ZUObodvikdpc4ospvMOIs2KDfk=;
        b=HWkdKTHKcUBzlXCJtKMxR4Lk82arqcgOKCfqxDtsYHJvrq+uoGhp5g4EY0LD6jiiv1
         yS5Gv3XNpC5dpWb9YTa4M0eZfmdJ7BagETkBXe1Yxk22RKwoxvCOhzM4PqSO34n3zy/+
         lsc6xUF07GAzNSHyKBMPNmOeIyabU782lNP2oPDlbg2oEzTELoHt/QY0OargE/zrVmrE
         P1+gxS7gfnqUQ1/iZWuUUqiGZNv7JrWGfLEvDEphT9dA5tE/GBHeN3D0Cdk8lHMugqsw
         3+T+MGqb37z4k1jiNb9HR1Sx3XZNF2D7SMuO4SgO5+hAhOb2jaGXbQ+wWGYtfbnmx+Im
         26dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149635; x=1773754435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfYI+6/c4jccnkJp/ZUObodvikdpc4ospvMOIs2KDfk=;
        b=DvaeDJecmXVuxR8Z6ay3Ie6sEqBctg6oflwM3e6AOBmT832K/3Seds7oANkf3HV2v7
         vw2F6EE/LX0cjDVNO/qvkKVunWcqYz1O6xc1i2BPoUoVN9tWaTDAQSuAevYM1CYwfN7l
         MKcH15a7+UC8lAnsPCtUcrf+UJTfQ0YhEr6M8dG+81WXW0HjBtzcRYMuGNLyEVrTHyfA
         qDcNnuRxbapz631Qcq2YsuNvQBNASAZMPpl7kK60kAWPaiDhzEDY6z9APDZxM/IFs35U
         lLQoIClMCoNctrPO5qTjty44e9Q0U/YelrCzfUhQD1eWd+zaQ8D/BY0MnGw9IDiKGK28
         QJsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGn2U84BiL/C644Br3MNj+huTl5UYSgCrQABuylB9pjcKRUxCmiNiFb8JXUMipGoBhTkhTEACD4tuTS2Ay@vger.kernel.org
X-Gm-Message-State: AOJu0YxJf2wy/CyI7CQMopUlwxxgdmrhVvfmv3NP5b6TYAnoPfZTzJIN
	57MwfwyUybs30op+veRwAmPVon7ahTkqnc6YXB9REO8JY0Sf962hWZMWBZBEyf3ewD030iEU91h
	0xvsoZZGT6dTgMruH0rjHWe5EBcmcI8cx28XS5P7+eZLs3IxlUBW5VDvcUC5PyG5A7Fp79TWpS3
	0N
X-Gm-Gg: ATEYQzz2o6yFSWyBvEkbcqocZwt6IeVEih8zoNMahBhACKhx8ERmFnkGhP7Gg7XCXIt
	HWKiOsnXmV+REdFTvXj97PlC3TdabrhxhgmQJlEqXlVIAsskAtvk185QrWcIEFk/OMNX078syxv
	DHarqlVp9GjjoerPrkvumdH0aHDjNsGOckyjoxsOidK/PjJ9y/GAC8IgntepsJUHS7BYYEEtnau
	c1Bf/R5OS/YsAuFUZksi5qvclpMvdmNcdCHrBaJQ9Et48uGTh3afixw/6T2qkZElK4tRy4ScVfa
	K+KORMohoOjs3Jx1CYBGfM32Xw8CF0PphIwi75bw6iTx/qaXlR5Ycyb02ah244aHi2c/XBbfSYO
	iu8nSSzMjqIE+jX6PLh7tMudbqpZSJ55y053OlKBz2ueQZjLXA2xZ89W1HOXEyKqQK9/98UtAIM
	DyAhDlUNuL8KgAwGF//0B5g3t4d66WA+FctNU=
X-Received: by 2002:a05:620a:31aa:b0:8cd:8f04:50f5 with SMTP id af79cd13be357-8cd8f045625mr600726785a.77.1773149634327;
        Tue, 10 Mar 2026 06:33:54 -0700 (PDT)
X-Received: by 2002:a05:620a:31aa:b0:8cd:8f04:50f5 with SMTP id af79cd13be357-8cd8f045625mr600722485a.77.1773149633735;
        Tue, 10 Mar 2026 06:33:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cbfasm2766397e87.14.2026.03.10.06.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:33:52 -0700 (PDT)
Date: Tue, 10 Mar 2026 15:33:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, simona@ffwll.ch, airlied@gmail.com,
        marijn.suijten@somainline.org, sean@poorly.run, jesszhan0024@gmail.com,
        abhinav.kumar@linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/hdmi: make 'msm_hdmi_pm_ops' static
Message-ID: <2ojzypkvxomlzfv4yb3l5scnkozxxknth2egkfl6ivmo24shju@gfa64pxrmnk6>
References: <20260310132501.195954-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310132501.195954-1-ben.dooks@codethink.co.uk>
X-Proofpoint-GUID: HYKyBgxP7yazPdlP_7nkGpKRBDehHORq
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69b01dc3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=1EsaE_6oAAAA:8
 a=EUspDBNiAAAA:8 a=NChewM1GXYrQM836dJ4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=3ZumFrijQQ-2J9H5h8ct:22
X-Proofpoint-ORIG-GUID: HYKyBgxP7yazPdlP_7nkGpKRBDehHORq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExOCBTYWx0ZWRfX8ZyCQlyN8nK0
 Vghuoc5tCZ2WHaqv13qPX/HsONr1qFLgO3pFCAuW6bCc9OBDfmq0PYTNj6Ti0nPmT15YzYtVgFj
 VUmZy5yCVBczeHjtW2yzH0LFIgxk2OGEzizFWSNA+sSkSCMrtnWyfOOUeFR6cPR49Jkc5LqLlaL
 dtZ56M+U9AjkvQdb4N7NMZGbEPnhwB/Upi53vGAyDq/W5olfn8XjU5CdTWa7K2DIe6eVCi3gFOH
 LY3l3EtHWKLbgNEktJt7QOBmjkItlF3/nBWuf9A58vMzWQxkt25U9pxyqxsFUXcp/HGxSfA/yAQ
 sD/vsEDjzlUdfoWNfElyNqk5kc/ElaZYTHnEbY2ul2ocgDWYAb+fGNZkn34V0MRcM9Wjp79L2OQ
 kYp69VeIafMltw2snZWODmVc862+il+gMVg//ZC2MH4NCjhyi8BIbHhMH/uWueWKkW/JpwrwLLq
 0y+JFfKJiJKbtV5aVdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100118
X-Rspamd-Queue-Id: 6526325244A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,ffwll.ch,gmail.com,somainline.org,poorly.run,linux.dev];
	TAGGED_FROM(0.00)[bounces-96679-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,codethink.co.uk:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 01:25:01PM +0000, Ben Dooks wrote:
> The struct 'msm_hdmi_pm_ops' is not used outside of the
> file it is defined in, so make it static.
> 
> Fixes the following sparse warning:
> drivers/gpu/drm/msm/hdmi/hdmi.c:432:1: warning: symbol 'msm_hdmi_pm_ops' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

