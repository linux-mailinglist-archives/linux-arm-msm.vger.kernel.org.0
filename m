Return-Path: <linux-arm-msm+bounces-93852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLxRHdjknGlNMAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 00:38:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 838F317FA88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 00:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AD4030F8F08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871C037FF60;
	Mon, 23 Feb 2026 23:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOK/drvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eJRlR5vN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5621837FF54
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771889703; cv=none; b=VVUb21TIyLpkWZtacSyL+HpaKaQuyHr+12AplJBKlBPowakkV9a36J05k4UYN0ZIs7P/70M0VI7MqDWg3NdTuoOlW7qV0RaodBi9l6r7UoO19XQ3I70bN/RmrfzCMTwHY3UoyHhph9WtWnCXy9ojYz0J5l4oTzVgaMvQRi/IYcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771889703; c=relaxed/simple;
	bh=s2BYXkIjgz5mfAkTqmysnZphKzjbr0skbwes8i35Nu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9wgkxTaV+LIhpAg38NLyQzu3eFJf+X/YS7+uTVakhRvSRP9/DTKwHy77VSOwuhQ4KBexkW0kwx81s8qaIip5/XedtDloivzdnptI2i/NfNu89Z3P3EneE0bkWAye5KkjXXfUqOMz0SB4wKjEQHJwxftK+8RvRwWHnQWhbU2HFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOK/drvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eJRlR5vN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGG9iV3937652
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R6iGiDMxzNBI4bYZtehCx374
	P/hdReWApjKdZoQePd0=; b=FOK/drvM3AUHpGVE37jxn3YFt3GaTFXREYGQ99Rn
	ZPHpoexrBNV+2eP3wnWeHWW0l3YrGuLntvP/KFKatfDbhojCU7EnJph8WVLm190L
	D/A8tQJwcyWNhITt+xeITJNSicFo0Sz6OSJVhFWPW1QoJvulrHOazyGBknq9QCLL
	7j48LiRqAOM3qNLK2pLCB0Xm7GuGpiKhjHj7+rsdNO7Bw6nAZlHo2/QPCsYcIV3+
	9qG4uEHLn50UYlb+QY+MkAHc3qJXV+yjQnGwBsTukaFfziq1VxjlVlkbxzrAfsoK
	1cLzgvuO5pF1ATCdbgloH62hGNhadXpgPp+4vg8OAZYjmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgt8mh6a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:35:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3fae6f60so5828222485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771889700; x=1772494500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R6iGiDMxzNBI4bYZtehCx374P/hdReWApjKdZoQePd0=;
        b=eJRlR5vNjnSEX6qy50grkeExjadrqLFMXD5LvDoxTuq6qIrRVBpRV1vX6XTlYL8QxD
         suW9lljZYmbC8Dv5DPfB5MY16PBiqmNvdytaweZ5K40doi+Y+qR9gTk47SL5sbDuon3s
         6kwC/Z/ExSjggtMxnFMV6mxAsh4pH4KW+3kQ+2XDMXi/LqJMR+dKCE5Wi4/Q9rjl8Dy9
         I6hkp1c6mdc7nAP/mKKct7m7Db+PZ3eMngHa6C64hIwIY+D13StNi/zlGGDHKp+QMEmI
         R7VDUyxMwyNIALyeRhoLrEciWMGSxxbyhcxQT9praCs5Zl7aOAa49f22OEpV+2ANvQ9q
         Z8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771889700; x=1772494500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6iGiDMxzNBI4bYZtehCx374P/hdReWApjKdZoQePd0=;
        b=Vk8nhTgi9R8kMawI/h6P2+CRRf9BIvuhX9wqCWGSyrZas1j2Lg6ryprNtkomZpQ2BO
         hd1fLhVITKYua6MMRrLFV4Rf4gJ9LMWEDi5p8/sspbBuqy995xxGqEsi9ZXj7WblzucB
         Ht4oYr1uRKL/I4tBJtaMa7tBnbxEU8yyZLWrnyYYBIRi3EbmNhZ+61Yfexz0f+lKwEOZ
         oICOhqStLEve+shRJVl7ODaEhp7Q6YTh13nuAEw3dpr0Yz+TEZeKg1COrx2keYfrbCLT
         2Joa4xLRWtsnGnfAzBTPRWOfU1f6L7ZpQK0nTUq4UEMusvk0bG2oOAcvIDKMJ/IW8+wu
         aUVg==
X-Forwarded-Encrypted: i=1; AJvYcCU43vHBFCfXzoTAO6OtsDYqwyHgVjLhiCcrPjUoF0c6Yo1TngGqxVwz+H1WgHKSWKemTQibJRu6llp3shRe@vger.kernel.org
X-Gm-Message-State: AOJu0YzpZU+AytWgF8T8h1C7yhhfbhfWUp7g7/fYA9FtiVE591btIa4W
	lC4lCv3LJf0g/UEg4u+tVQ+Jd0fAGAEBaYkGo40pbDKoon+cnJVqtFDj3TPvxrX214q+cOLqOPp
	zur0OKus+Ppovtll90plZtqokUOruo8gL4QvW4obsKZG21GhbB4bj+elNupXP3wO3sB3p
X-Gm-Gg: AZuq6aL283KN+gxttN1w1ZyXg4ENRVdlaoPnctf6INS0HfhasREU/FoqaU74CJaFUmJ
	cP7hJqdPWeNotCLfR4rz9+DFt+aL+FekAm88AILXGkIIbRzJ/xVTU47DvF17gZxZcmmqE2c//EL
	1NGaF2pGBXB6zyscMqD4dpZ4ssxQ6hYSjSOsEmFoY2kEjzTrNuMs1UB6Mw9lgqRRNKUjnqUJqnO
	UobL9p/Eyqb8fqHwdYNmGTCFCNA87nNatSsGyEJQxvZkJg23syuALLRV+/aHcMThM6RzQDxodCf
	LPSRvDPsMZ3mYaEBZlw7IX4bqYrTcC41ulOhFVTmSaicdsmMCygA+kNq3m9HS4d9epcVcAe0NS8
	a7FijyG1j0peSm1nKcs20velBPqxt1uvi5EdZN+ODbF5aPTpOKUOxA2l1a2Uv8Kkojz/3/sCakQ
	cKHgVb5iJTTbq0EA+Ylld2D4xjAaC4eki6V/k=
X-Received: by 2002:a05:620a:2946:b0:8ca:3715:eea5 with SMTP id af79cd13be357-8cb7be70d9cmr1716828185a.14.1771889700399;
        Mon, 23 Feb 2026 15:35:00 -0800 (PST)
X-Received: by 2002:a05:620a:2946:b0:8ca:3715:eea5 with SMTP id af79cd13be357-8cb7be70d9cmr1716825285a.14.1771889699874;
        Mon, 23 Feb 2026 15:34:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c600sm1876384e87.86.2026.02.23.15.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 15:34:59 -0800 (PST)
Date: Tue, 24 Feb 2026 01:34:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: fix hdisplay calculation when programming
 dsi registers
Message-ID: <wou62ifuvwru3mu3m5msuuolvou2ivkxbqjz4efy625cnnxagu@s3ofi33zqveq>
References: <20260214105145.105308-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214105145.105308-1-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=J/unLQnS c=1 sm=1 tr=0 ts=699ce425 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=BqgQB-vKev___VV0tjMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: TAMlypiE5aqY2tth_hEH_h4L0hAs9QDN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDIwNSBTYWx0ZWRfX1aNdp9BkeF17
 41EqwOK8N3pAf23qGJuIp//MfK2SkKnq/u2WDSvsTzMv+ti4BjYudxZVtd3KslGM4YOQiDT85wo
 OreNCb19UgSGiysmPBCzr/A8csTOfVX1uO4xCJFZe2nL4ME38eKtewShgTkExYUVMkvyf3hI32W
 m9YGLzXZUGwMuIFVRClU6QDt8S33+irmWfEXaNDta1G4PHO63//VtFEvD4AtPU9w36ygBMWuAcW
 Gqv9ZEPLGHTTHnrB/pTAnEomjtqqMicR8GyWnmHtxtWHxdeEbabKiPYcvyXgmlS4umh9SdCSCeB
 xtX17iQqvvi3uETGED/RTzck3OY7nhJdt7aczOFKuEp6JAnCA08gT6KJQFzWACfh1zxS6te+Bxa
 9LpgIaHdOhkK9GVF82ppXVSRTanfnfkb0hxNVk+xYAAqhnwKlZhD5dVLIQRqZqe92HiTlf0L9gv
 FrsoILmJQmgvBWUqX8g==
X-Proofpoint-GUID: TAMlypiE5aqY2tth_hEH_h4L0hAs9QDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230205
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93852-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 838F317FA88
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 06:51:28PM +0800, Pengyu Luo wrote:
> Recently, the hdisplay calculation is working for 3:1 compressed ratio
> only. If we have a video panel with DSC BPP = 8, and BPC = 10, we still
> use the default bits_per_pclk = 24, then we get the wrong hdisplay. We
> can draw the conclusion by cross-comparing the calculation with the
> calculation in dsi_adjust_pclk_for_compression().
> 
> Since CMD mode does not use this, we can remove
> !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) safely.
> 
> Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
Could you please point out, which platform / device are you using to
test this code?

-- 
With best wishes
Dmitry

