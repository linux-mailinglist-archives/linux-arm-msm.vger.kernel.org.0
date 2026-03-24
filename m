Return-Path: <linux-arm-msm+bounces-99465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHQDB3/ZwWmJXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:23:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 027652FF9F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6298D30172CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB5D23ABA8;
	Tue, 24 Mar 2026 00:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7Ya5dZ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9k3gYRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB1422A1E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311804; cv=none; b=Dt6s9dbJA09lSnkwm4vhS2u47JpwmEG9czDAwtoV87kMN3Y4RcgVdj4bDpxfWey1tKOikQSOAGJ1jWAf0nq8ldjmgd2cLhs3g+OL08c1ii099kwyx02ER6eJjGbW6dbOlqriIIiR60SyF89rNwYlK8wS8S9DX+IFGKVzkZ5NBhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311804; c=relaxed/simple;
	bh=lIzQPJvLQZloJWizwO2RDRpo2OLvnRmzFZuGwuVIxe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DafPZjZlVBTBNVTm2/ISKRrYvGFTmZ2SgG593mH9dqm+as7zbD1Kt2FOqeQ+W+xrwnQoDHVXaQVFvYloe3fnX00hzwt5m76dbbwB0wcOUhLtl3AOR4fjZEI//95QAHgtq/awTWzU+ZFNgzsV+o0/vW26mMDI6iBXaWmD1NcJOGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7Ya5dZ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9k3gYRU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqYpH3634290
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I22j2VRKTTvHYNS8smPDlppo
	QxXaZzbmPUPgZxuQbd4=; b=L7Ya5dZ4AjwUupfGQ/WTZ7nBZpySTohWfgZfKC85
	PrlM7HLxCbrr4QQDUXpv9Dk0AriG5gDAklRtrIFA+otCgNsdGKddvhTD59QPUkfu
	c+OlkVJOg1qiu5GrttcE9v000g4w26+wQleONiV4UwOk0bbyWrgBOckHVdvqrZKH
	Jh7oDUCzGswSo4nYiI4pqCrciCycBGNQf+ALA/46sZ8LZcD8WBS/1ETofq2ssQrp
	jPxwlBYxsU/pO9uXnub142d0bFT19XTun9aSAosrjMou5L/mjchkkvm8CAN6IqOT
	qowx/HR0XNr3Zha/l/b99AjGcQn1ZCocdHJOn7tyZTS4ug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4jjh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:23:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b34223670so187879121cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311802; x=1774916602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I22j2VRKTTvHYNS8smPDlppoQxXaZzbmPUPgZxuQbd4=;
        b=N9k3gYRUQJknwbrJALVU+IkAhJWejxBL17hNJCijEvFdC/sabnEfu6WG/wR6eynzzC
         DgMi5/Bbzzpz6KgJjeFhMtzMG2JynWrJcaeF+1PwbwB1dqsux7u8TD0Cl1Harwkq6bvh
         TOOSirjC0aeh0u5pMYRcfEjXPtxl/LxrdQlJcZZNSKEaA5UWPxksj8Yxz3+rNR41GEL4
         CzP6glkpTY6lI3os5LZtB1njMHpKA+kthVZFms4VqeD7Gee0OmNs5PQlklQZHTosDBv8
         i6DJ3No9yF7tDLeg8wDaD7Yj7Qgwzhcc5vHFXCTLfajkVbqSD3regd+iRg6+Q9w6qp86
         209Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311802; x=1774916602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I22j2VRKTTvHYNS8smPDlppoQxXaZzbmPUPgZxuQbd4=;
        b=lhuHti69k5XWn0fAcAbfyuda2ZtXhOBZoBvhaKo7lDTa8YYao8mXleS8ySHOEZZGde
         5LzK1k8PGMUdoBWMOS6OBdGAV0KB3hVlULqkIndMaE9SvnqdHgYMFIdTYQ3QKtMzzxJR
         Zkz+6YVkNn75IHggsuiNkAFK+YsSIxTe+tasgQIU2xVbRwZ/INQ7EGZfXeElvtEQwIAh
         +zeGfme2GjQRKdrqB2dDkfBkWU85nz0ajUHNYWNseyWrVLIvUsQGD0mh3O9iDyH6xIGg
         NwusBJeVPJeLl3LGBHJzw194AwnS9dNws6Rfq0O2XSnBGv7B4fBuIdOUZX4m5GE7eQws
         rbvA==
X-Forwarded-Encrypted: i=1; AJvYcCVhrD+/WdD7AOTqUlp0uvyTBgrtRivwmu+31vaYsVVfnD47PdaD8ghhPZHhcYCUDSKP9UFkLYa0hhZTz+/h@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhyd9NpnwfDDDeYB0XaxtAXCKkv534XK7a1xmb2IMfMbzNMSA
	xD7NNLgoY614f3XUuX6TJHmchVitHvWAStuK3Np8/w/oRUwZ5ioDiYjqFXHb2WfWznKHBiGHa/d
	1PDiPi1Lp7a7qPfPQ6aq+7/OAV6gcpvsOdAwhG2KINQ+WwvlaqyMZ844k/D8ckkLoghUUCnO5Zu
	TF
X-Gm-Gg: ATEYQzzxnXmQhrCo/Ybn0tfbxtZrqRqRcOL5DY0YeDFpjzLBaHPlB61y1YjdLHAXZ0s
	SmSCXY+Nh7lZefKF2al+Abky0DxfS4kKgaHNWqpYOXlLllxMRVr8tzUvGXDxAc++Ng0MIcTPxR0
	DROXfW73cAobHnuhJb2/im9RO9QVbbM2G7aFFm6Whb8Ol1FKKDGNo2WoAtNHsP1orBqmllmnj3E
	xPo/3VMDM2veFsxmNk+eSp9a6SaYvL1WxY8q54trzr71mGXLejca7KJcTxNfL0UiQXGuUszFQ1K
	/38hQBODuzKHC3a42JLJVsJDj2lPJbiG1ja0j7zh7HIa5w+cFjT0Y4lZfGZKEN4Bi/AWOwotGco
	urXBThS4cF9/YgqAgaeDWT631wRfzqgoZP7gZP6woJrW9q+CPtzPmFzrwX8kwld5eDlYWILwCMm
	7KVmd57Wb8QZUsIbEEQIeRajPOCg6+hy1RpTU=
X-Received: by 2002:a05:622a:438e:b0:509:33b:ed6 with SMTP id d75a77b69052e-50b3744da05mr169013551cf.23.1774311801726;
        Mon, 23 Mar 2026 17:23:21 -0700 (PDT)
X-Received: by 2002:a05:622a:438e:b0:509:33b:ed6 with SMTP id d75a77b69052e-50b3744da05mr169013281cf.23.1774311801297;
        Mon, 23 Mar 2026 17:23:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9750299sm30405251fa.12.2026.03.23.17.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:23:18 -0700 (PDT)
Date: Tue, 24 Mar 2026 02:23:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: calculate data_width like downstream
Message-ID: <cn7npmmpcnztoe6t6qfjkjggt2vtrtp4zimftpiyaf57f4sjax@z4wflh6zacuf>
References: <20260322-fix-data-width-calc-v2-1-d5f28136bc4e@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-fix-data-width-calc-v2-1-d5f28136bc4e@pm.me>
X-Proofpoint-GUID: 9IXau1b_ls4exbN-LYxygwsBdfNg8h3A
X-Proofpoint-ORIG-GUID: 9IXau1b_ls4exbN-LYxygwsBdfNg8h3A
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c1d97a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-uvraK2mi3rOfbV3l6YA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMSBTYWx0ZWRfX/y90Waqg6MZt
 i7tG8N4ZU0DCnOYayqv2E8BvmoWE6k7vvF2Jb55Tv3hEbtTh2hC68IAanYZwT8qnv/ux/DVaKD1
 hI0FR9ywjICsFTrD1DjfUCS0hYetqqe8b37ksCRuiRoTxi6+pyPg9u6uJPPcd492fl9PWPtNgpL
 fCzUaHQm7ECpiq6v2RxA83w++bRbSo478XCdKKr1yAaCy9Iuc8xjx99yAhVrSgYdg620cf+ZxND
 3yyN0bBSKT+kkfAAWh15Kkw7KsFN2Ru/hXZIeP0VAOHYqTSBAUMdS7FD0qcDh7J+0FCshfzMGgX
 j6CM1W5i/8Vzzkh894ljccsWNG3+4/YAExuzokjA9fkY60yjygWA/cei8SPsU7b5H8fQV/U7QC1
 qAvYPybvD4AkAMGxuBU3oKsUNwl2WjVAfyatosfuAcRv08+GYlI8NznieorguYl0osMxWrt+Eck
 44N/sExE9MBMw3m7R/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240001
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99465-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,pm.me:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 027652FF9F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 06:48:09PM +0000, Alexander Koskovich wrote:
> Derive INTF data_width from dce_bytes_per_line rather than
> timing->width when DSC is enabled. Use DIV_ROUND_UP to avoid
> rounding errors.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
> Changes in v2:
> - Added back comment about DSC & DP
> - Link to v1: https://lore.kernel.org/r/20260322-fix-data-width-calc-v1-1-128880f5a067@pm.me
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 26 +++++++++++++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  1 +
>  3 files changed, 24 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

