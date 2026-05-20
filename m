Return-Path: <linux-arm-msm+bounces-108818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAm0GFjYDWp44AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:50:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B22C5913DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BFF632D6603
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2063FE343;
	Wed, 20 May 2026 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KgHHbe5z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Le6ax04o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0E13F1AB9
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289726; cv=none; b=YI6AHhbm21PSREDhu17xejQY+uJp9GUBy6XbU6o5hW3MHlirydzmviKCQyB3YeZgBKLvSdJiSavUnr8RK0xpWNxRIgSuM9mwyyOnq43vyIfG3rAME8Di1vQ2CYscWGR6+/KC3zsTZrFp3VY5YAtpUWvKO23y+ws7YIT/hN2u18k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289726; c=relaxed/simple;
	bh=f8PxnRrttPcfg9STSBvnbNWK5Gua5P3qasJH5h7Edwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jW6+WiEkhTRUTX04yQicEMA8YvGoam+c5dGt5iA+/VpB9jmAivwFuMzRtkDrtWSHOg7zPFt4gjuZ3Uz4bNlTm88sm4nHEYx286UVgX9MZVbqHuB6qyY49Xd+eT0SsdYEzDFIw3i9O0N4q/hgBaLAEQn55Yoc3yvSGkipG7jcLt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KgHHbe5z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Le6ax04o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K8um364115406
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h6QXXg4PTNAXr6Wnvwzj5ovp
	8hOpuwWi5pP4tDUYudw=; b=KgHHbe5zSmPPLXQKNMF3VZc1lv/QPNS4gkGVrOaF
	bBurasaBTZHkN40Io2t4sEUNOxDRe7AGmFM23INJmym2clJIzRcIuzCuwlpn+AFF
	7aWwY+oEnRuXnCQknchRzcmzFmt1RIUYG7/ymHh2B1B78KSp6xwuOhTEzsVdLs7u
	8zIH5+HpREVfJFY3J6vHfcCVKSqr8Tp4g6L+r3ItrJZEzUnHNkUAMosLLL8Fs6pG
	cAT1VaU+LzupdA7zyL9skwBwpHn72ym03b1ObmHpUWZjmETKaaIS4Dk8vLn5JP0W
	9Zfi7PS/F6wLF+9uAq8Kw2QHJ6/LfjqqhXC30GrR1MiZhQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0hdf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:08:43 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e3f58830cfso7294722a34.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779289723; x=1779894523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h6QXXg4PTNAXr6Wnvwzj5ovp8hOpuwWi5pP4tDUYudw=;
        b=Le6ax04o+F17nK6XBCAeEJ86Hv+ppDaGwDrjTeOE8e08k3YAc6yXU1m6xUyZtrx0NJ
         qKYm+RCnPpS/6qKo9hpwnwBgkx3hOfjSael2t+3ydR8wuluurtoS/UZ5VUbHiccGwj5Y
         phORQuXFGNt23S6U9DmowFDSewNcfF0ZXbRx7CcqR/zHJKa+OI1cC1KnJ1sV+UrbWq2r
         Ji/BeipXAiJOjqDNYn8zKgD7Tj5+ZPEiPChZFxG0/wo4eC7vyKWMREBCJ7CHiO7ajx3J
         KdDoo14FZbkfJswmjLVi1qTpMsHk/lUzhV6wv4bUaBPUzOEZAD1D3bN7qX6788pG5umJ
         FItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289723; x=1779894523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6QXXg4PTNAXr6Wnvwzj5ovp8hOpuwWi5pP4tDUYudw=;
        b=VVvtx6AU+2HYNG3Vg+O9/hbSaJ5C/mkDMcX/wZj1Ma7rbc39QonAL5EkYHVsALb0Yb
         oCQDYNWAx38GpxcTeGYf6pj8d97yr91qziaCuyCpOTGlGoHK/IrcMtYIn5+2vYnqtPHY
         erfOXF/2KR3fkqOn/s97skHllWCFsR1/RZSz5c15evL3TcwQMfL/7o3L4TbWxjzQ09Rm
         i37z/58o5rATmLF1qGU6CMFWpfKMW4xMnWeGNE7DwSc/JXoJYHmKGwAcGOQkc3sPtgea
         q9jtUqbrI3Uru1uR1qrA77ysR2frWc82AKSCwShwpMCM7XO1meGWggiFK0xwuCq34AZW
         oF4w==
X-Forwarded-Encrypted: i=1; AFNElJ8F+yHDL1q9Q8rkVlNW++IeSCBqnTEJdqzm9MhNgaiZ8sWtPQAf2LKCjGxfqQcV6rj2Ib6Z+lR/7XmnNKjN@vger.kernel.org
X-Gm-Message-State: AOJu0YwSMxRyJH/ABAcBWVYL9Ktur2a/QvxCjP6djXKhBypaT0f+TIhB
	n67m4KA6dQ8yA6ZCdiDxIRAP+IdWUDfWhITPzVSWVI4vEa436cd7BPmISupbBtwr6WtIVu81rMr
	rcyDqM1Vy2rrVOH4GAtIJU8gMJ46JgETPXrByNzgV1G5tKhhCi4dFvWzJzJ9unMqidx59
X-Gm-Gg: Acq92OEwtq9hZmtWKi6auEFoYq9qt+ldeHAzNCBip00ACKccBVFTZYo54EDYXgjit0A
	yC8U5zvxyTDqU9uAREJvbg3RTAouYI9qIgdInyrEH4+WCprxex4IZTucZFISiXHB1vr6tH0k8Ed
	J80FLcj3TKVbc+bAq3ZfZcZrEru9HvXQ9sgesT1ZeazriBcz5PMBb8zOan0zemvQjRQEUnuUR5J
	A0YR2P55c52O0FJR7l9jsOsdQWb6EL8cVBqM3X3UQIPGColPMMKVJ0QhPNHkcJ4V7Il3MBY6iRD
	7UwjtlI4alzIKas9IcRAH4iwbDw85K0AigS0MR5MaMchP3hmnH77X+AWixCwHklE1ObTM9ZvMG2
	kRCq8ivK/FJskMU9gZL+08WHn6zdrI73W7UqXdaPmIn+nmahmay0CbWo0qCnrPjNlyYR5CFJsG9
	Uy/TuTPjKS9S6wrjStIkxLjL1/NGcg34ESKNTp+5gTT6ZDHQ==
X-Received: by 2002:a05:6830:3806:b0:7d7:51af:4aa1 with SMTP id 46e09a7af769-7e4f2b98b8amr16608297a34.18.1779289723022;
        Wed, 20 May 2026 08:08:43 -0700 (PDT)
X-Received: by 2002:a05:6830:3806:b0:7d7:51af:4aa1 with SMTP id 46e09a7af769-7e4f2b98b8amr16608231a34.18.1779289722347;
        Wed, 20 May 2026 08:08:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39588790604sm30119381fa.31.2026.05.20.08.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:08:41 -0700 (PDT)
Date: Wed, 20 May 2026 18:08:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
Subject: Re: [PATCH v3] arm64: dts: qcom: lemans-evk: Enable CAN RX via I2C
 GPIO expander
Message-ID: <inrjerof4vvqmupc6yuvfezpf5kmhtt5va5pjypwz6mstucb7i@wf3pflq2iqxc>
References: <20260519064954.2759960-1-anup.kulkarni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519064954.2759960-1-anup.kulkarni@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fXOIavaHRp8uGovey_TfU7HKpsmFnnRZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NyBTYWx0ZWRfX0xK0loy0EZ/A
 ASiMkRtNDJyJygFUMV/NMQytMmee0X6zXQOyEo5gzCknUcYgHuVTbWgIYqynaCvI2K8tjk/RWyr
 S5gugLvfFYjLF2aP/Rg11ut2ZFkn0P7naCYrWXjJ2v8YpCeXOHI30YX3tZ3Ng7eEpMjipBCglFM
 4mLimsg87yfcUAnMEOXlw3iFw1MHCXkwXMjsXbDoaz7m8tzmEos9ALKATfqj3NGCUWZ7GesY2NT
 pm7OBFUorGtUqPQIIzBoWaWkrNf7yGb934IV+vSNwdIIopK+H7AjVFsaw37TGyZvFTtR/G/I0YG
 1JUOeL516L8Ywbk+g2TWk4exVFmNoBRaJ1IrG1sqtugprPoaJPjcus/LesllV15tQXoZA1JgCdE
 beSvD9qrilXG9NCc5U8OqPbuGQlLIT1puQmb3Hcxk0pH3MScnT6EggEhKWIsH4Zqk037VQJwx/a
 piKhLLJdKymhus0nSEA==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0dce7b cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mTtDrMVxCzSrETN2l94A:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: fXOIavaHRp8uGovey_TfU7HKpsmFnnRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200147
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108818-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B22C5913DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:19:54PM +0530, Anup Kulkarni wrote:
> The LeMans EVK board routes the RX lines of CAN controllers 2, 4, and 6
> (part of the RTSS subsystem) through a signal multiplexer controlled by
> GPIO 4 of the I2C GPIO expander at address 0x3b. The remaining CAN
> controllers, out of 8 total on RTSS, are wired directly to their
> transceivers.
> 
> The multiplexer select pin defaults low on reset, disconnecting CAN 2,
> 4, and 6 RX lines from their respective transceivers, which results in
> no data being received on these interfaces.
> 
> Configure GPIO 4 as output-high to assert the mux select line at boot,
> connecting the RX signals of CAN 2, 4, and 6 to their transceivers as
> required by the EVK board wiring.
> 
> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
> ---
> v1->v2
> - Fixed commit text to include platform name.
> 
> v2->v3
> - Updated commit text.
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

