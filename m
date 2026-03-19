Return-Path: <linux-arm-msm+bounces-98680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHqdIz/Eu2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:39:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A62652C8D14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86F963045050
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACA03A0EB8;
	Thu, 19 Mar 2026 09:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oygSXYnp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pua3/46f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B952D3AF677
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911440; cv=none; b=WDOOmr3UQsy6JDFRnwzxloeT5DXtPX23tR5/cJSvnDE6/8ghZa2WKO/SfbwuiX15IZLXRz3aO13CGfBfhkoD8qdijUw+214QCwfR3nWtPx47miZ6hY12lebc7//qoG6CZLtTanoI7HelVFkll+ioXqisZPG8vKehIIZynkj5C7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911440; c=relaxed/simple;
	bh=TGIvxDbx64exSryIThvzyeyDY3ngkqlmOHfg/gwGrrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJkzwsJJmpErcayZFZHh4ChAB8P5gdN/8boIv3jpWmrPAen2bnlYonZmEw0RDxz7LBe2hU9efKIw2eRTtAEHKb/9l4Pm5aFjxcaNTDMXRPm62X8FOyLnOIc62KAMyrANRiBhT2qYDN91+KOu5XJNTox19dw6jdiyqIRi5rAeRRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oygSXYnp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pua3/46f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73xYB1998771
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v7m7aQiw0qBzZckwF8h4HRoLRfPXlziXjLV1T22Cnm0=; b=oygSXYnpCeueZHt+
	YaVoHrFxkpgCVElTMpxIHPSKo+u4BrA/3PvRSMnrydNd9sZkLD9LzT6mNqdBEGLh
	tnB3Y3MHeeq7bYAVm+RAilMQ3l5X/yKWKCXp7JWtt8Xc+hRyuMV05LnZTopveuxh
	frgnSkIRQdl8lQfh48wgKL0J68ysTgpFScV8/XPvvYtkv7Q/u5vsDDSFpW/Yc982
	0YYl2r0iEBLTp4ZKwKAwbiC3WejXTz5L2DE4/dlaw22YqrWwIwVGdrh+vTjOS5Td
	npYOVXKVZ1BhPltK7TwFMEPbJ4d2FUc3PPKL5cooQMvschDEK8FJxomsx2ULwwru
	Ik0spA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb4cdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:10:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a012f8ab7so7057776d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911437; x=1774516237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v7m7aQiw0qBzZckwF8h4HRoLRfPXlziXjLV1T22Cnm0=;
        b=Pua3/46fzaX/Fm1MZXLtx6SECWt7RnHMLIcglxbBtSZ/BNpptrnC1VEir1j5X4G/B+
         A8oiYcLCkTiz17m4BUmt0RQfhil/Bdj1ffVwXejbXH3WrxjLCmV/UDCBakfrqorEDWSD
         8FcagT/pYfIKCEkJu86yMGSlchiM29J5ooOHurwSGu+1K0hiQKDhY3Louz+MhjK71pYs
         CWBMB2JH0zN4Tv3LmqwjxRvgAFvWD+XcoaeThqaKILRzKzNx0RHsHIN9ljVvSg2vCz3z
         IW5nQPvCOYPDJ9pfw+6JoN1px4WGfwiNF3fHRoDlfoOUClZzqyIOoZ9lMsmV1/f9sZ68
         5fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911437; x=1774516237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7m7aQiw0qBzZckwF8h4HRoLRfPXlziXjLV1T22Cnm0=;
        b=rOaviZ7E/T50thUZ7xeGvyO+1Pb8mQjWeli+dNmPD0gXhGK8oi08ozLaGWr9tzDqH5
         KF4nCxsPaSkpRiv36fOGsTuTCMaoXRhNZnDyguXNwg7ZsTnsP2L1ct1d6NMSLG7aDEUu
         g5bmXgn9Q0hxZMFdUJaaUsni/ybETFGrP1t4/FXiJBPbKEDAkr8C4lM9SOAUDFMY5A28
         vz11mMrAa70+7TcQuh0HDk8epvTEE16BkjPbPc05UYuXkKYSZDZHXOTsaFSxZqLZ7tkC
         XLrEc+Dt1LF7+ByJcoLJ4avHJ+lohyRWlQLaSq5ZeTnAPuQt4g4Vijq8hiNGHGF/W966
         kpIg==
X-Forwarded-Encrypted: i=1; AJvYcCUMDxCqb39yE+0DO0+A81y1cShldM9+0FFMl+83sfeGMsoFgUEndBDgxfJxuXPkRe1eJhJGLEMEaV/1C8Rl@vger.kernel.org
X-Gm-Message-State: AOJu0YzTtxE9/n1fjfBX336BvFBLuToHMS0qjiK9pdk1FjjVsx2nzJmf
	kaS2jqBB/zf6JDKWhpjq5dShTj0qnDVYBEq2udzg2wLaVUuLjjugx/9TVWMpJzZ3J96RdIxhVeX
	oJ5a7HKAx5A+8RZfqIEw+6wmLzxq4yo5+K0wGqFaytljn7zk7XZC4TGmGkBFMmEGzbXpl
X-Gm-Gg: ATEYQzymdkN7OAauoRStB0Z2115KVcAVvjL5TBPhp2qNuVdWO6IfG5cdxRInqK25Fbw
	kZrivpQQF0JYhn0se29GVylP/MXcXvZu41FqPYjJ4JhTrJ2L/j4eYEBgoHITRPf5RYtqFvJnZ2a
	HixNbL3H6Nip/I/l2oMmc1W2mSG0vJ5g80oVX1tbnIn0dAL4SRMQ/n1AJFo+C2mHFyaIY99iaY0
	9YM0TF1CZxqPEq2Q1UA1oEiONvtuItsq56qR936HCxPXPy5dDwqsAAX4GUrET6Y2ZiJ6z442erx
	wH542aNB1bQ2F2BGU4jjGv8he4+Av41e3rbexpkZtRrvYMwRBI8LGb0Kht/y6m7/Rddey2LAXeq
	gd9ztFLZWhyfSeZayIS2xutAUMiqfcUJ0PuBNQjdSy2XpVKg+vYkx+DqgJ1TjQHHzZsGnsTJCVu
	txKlE=
X-Received: by 2002:a05:6214:21e9:b0:89c:40b3:1093 with SMTP id 6a1803df08f44-89c6b5624bdmr69955196d6.3.1773911436982;
        Thu, 19 Mar 2026 02:10:36 -0700 (PDT)
X-Received: by 2002:a05:6214:21e9:b0:89c:40b3:1093 with SMTP id 6a1803df08f44-89c6b5624bdmr69954876d6.3.1773911436409;
        Thu, 19 Mar 2026 02:10:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f17036a0sm409705366b.49.2026.03.19.02.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:10:35 -0700 (PDT)
Message-ID: <5b79ccbd-5c75-454b-8b3f-812a6c59157b@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:10:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Add support for RGB101010 pixel
 format
To: Alexander Koskovich <akoskovich@pm.me>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260318-dsi-rgb101010-support-v2-0-698b7612eaeb@pm.me>
 <20260318-dsi-rgb101010-support-v2-2-698b7612eaeb@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-dsi-rgb101010-support-v2-2-698b7612eaeb@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: W_3ZcQNy79ZnnhcNFxn-PDZXfrDXEVTa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MiBTYWx0ZWRfX7Bbpv1hPztlM
 KiE20QS4D/EFAr4UYr0NAb/O4VteR3FnarYxVHzjaSypmRPxfgRag2LQzoEA960JRA6G06UJIMJ
 hB6aMadCW5Fg505uMUVMG73xS/iFulaPzweeU7Ke6gMB4HZumqnLFKF6ZafmPxw0RiFWKzo3zK4
 GypxxdLooWt8Lmxt9mCyjNdiAvn6f3RhNVZt1Pf7eTx4pMaKzOzS+kbLYb9zzsKAg4u0P2vvE4X
 lFKpet0Ypk5E6vf2kh5GeQ76SufODUcTDdob0IJ4+BclgnNblQAHJp11b3jzbUlb24z2SkuNk4Z
 pdJMpNmcVf2IQjCEy/QOZpekBDWtzg5FtPvvaD5+V6SyFt7vNo7SAXkhkryzhHEqhLGVL7UW4pc
 GEHK3FvVUrHHLjyaZ46/qwhvBHOZefJQ+zD6MHiiv8H2VvWedSxVLtYxf3nI09dilenmDJd+q1I
 YD4AbWPss93P0I7iUsA==
X-Proofpoint-GUID: W_3ZcQNy79ZnnhcNFxn-PDZXfrDXEVTa
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69bbbd8d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bo00AjUxo_B6Js9JdCAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98680-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,pm.me:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A62652C8D14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 5:00 AM, Alexander Koskovich wrote:
> Add video and command mode destination format mappings for RGB101010,
> and extend the VID_CFG0 DST_FORMAT bitfield to 3 bits to accommodate
> the new format value.
> 
> Make sure this is guarded behind MSM_DSI_6G_VER >= V2.1.0 as anything
> older does not support this.
> 
> Required for 10 bit panels such as the BOE BF068MWM-TD0.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 8 ++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h             | 1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 9 +++++++++
>  drivers/gpu/drm/msm/registers/display/dsi.xml | 5 ++++-
>  4 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index bd3c51c350e7..6a7ea2183a3b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -133,6 +133,7 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
>  	.io_start = {
>  		{ 0xc994000, 0xc996000 },
>  	},
> +	.has_rgb30 = true,

I wrote a patch to determine this at runtime, and only after I was done, I
noticed that we can already achieve this:

bool msm_dsi_host_is_wide_bus_enabled(struct mipi_dsi_host *host)
{
	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);

	return msm_host->dsc &&
		(msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
		 msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0);
}

let's perhaps extract this to a msm_dsi_host_version_is_gt(u32 major, u32 minor)
or similar

and your assumption about >=v2.1 is corroborated by a doc I have

Konrad

