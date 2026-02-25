Return-Path: <linux-arm-msm+bounces-94172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHfqBaUon2nmZAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 17:51:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1490019AFCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 17:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0047B30847D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD881386DA;
	Wed, 25 Feb 2026 16:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjIVYZoO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hlky7G3V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A202727FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 16:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772037883; cv=none; b=SOy3Y4HVuhxxLMKON+QB8uFTxECxPCduHEl11FdadXNyX7uT6TkDwuspa+lkSdX4wpOClaZ+mAC28BtUhttnIp+tGvhHdfhJZnIr+iHDotsnz1cijrad5NzrbGFjtAA6kb+ftDS45BIYNrS58nyg62gqyzxSt5E4HhR3yg2iljw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772037883; c=relaxed/simple;
	bh=4+WhaYZVbC044qiWc0R3aALccnyRgLYAnX8GPvMvM1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0pCnJpfQpNLiD1+RI2mlmlJmwV7zOw51MvE9HQC5UaUgJhD6BQZc5KsO+WclUdiAthaMYENDC3Tm2t+2spg1TurWdLgqUZ4C8fAQfOAOl1L70COR/Z/S0U3dW/j308rkLZK3as3chSz14Ls0s7x2rBrjQ89eJ+QlyL9T9WISfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjIVYZoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hlky7G3V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SKZ31025033
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 16:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FPLVcfKw5IWz8lzxbKMBoAuR
	iK8OHzaS6FYc9SRfd50=; b=SjIVYZoOxmm/St7Mv6HP3BSHibIqWVgEbi/UG6/b
	LyMKWL58HMmN8zqL7ATacHlwho7iXVyGpfN/z5V6rr3gJ8LGJT+M8IzrxQlFBInc
	i/4db5tRnqLDKXXjFnNM2fIY1iNgQeRBnJdntPs7PbPjvmz+nzFc1JDPcE0TxliQ
	i+/H5VJ39sHFdKhbCWrl9IYKA2wpnsMGZ3txmC+QURSKkqrTH/25wmpnJSDolEU4
	/B6pmXx4UFYpvRAlAsOpEl5B6dnoX4fsEwkVkGvnc3TG72kArIkLWi2Oik3Fotq+
	9xcQmm0NFkzZeoCEdqS8avoiDo9zsehxaUHS5qE/7IT1pQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57tjrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 16:44:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4e37a796so4511002385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 08:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772037880; x=1772642680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FPLVcfKw5IWz8lzxbKMBoAuRiK8OHzaS6FYc9SRfd50=;
        b=Hlky7G3VcFVYCwx0YhgsxhCiMxk+yzsZwcydGiQQU/tgr52AJKF/P4KaOVU03c6TFr
         TZSjJ/qSKNmlc04BtyBsNs1O9JTytmjlWiKM9SOaVIy8OuE0s341QDCX4DWT55FJUxsA
         VU8VCkdO/M8/pnLJJZSl84w3zjrrxT0PH+bagebXKxb5NMBborHrhYijyVA6CrbL7Nuz
         ofc2/bJriollMzeq5CVrHxesWVnZlkbOcjGr0YPDDvKjdC2z73xwmZNA7CFIRxzCh+px
         BTyEbSqPGPHr76HC6p4DLXEI7Im4YaaulrMcJJGMNZsbWKSwpLLTXV8R6siloUxJXlui
         DTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772037880; x=1772642680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPLVcfKw5IWz8lzxbKMBoAuRiK8OHzaS6FYc9SRfd50=;
        b=NOeD97UGZhk5ZeqW+7+ApwJX7exysNizG9/gwVLQl8q3dLEk/ZXhx1h735O0PahBLl
         5kIpHYCE3rQoiG5Q881LuhCVrZ8zNAfXdBvs+k8dVH7jKrgON8ii5SnYRbmDvYxJcIf7
         ZauMEzXxQxqI6684ukijAAxeS5aO9B5UDYR4NcINBMP8aP/GUJy2wavgLCTayDpwLHNV
         8AlmDBnPcRnoyZ4Goy+xLyuJZaPTggtahQYzoSKGqg+e7MkeZt4ju9AOhZNlDdcVk3+W
         0oBUfvP9XDRhmxNZVmXUkqMdfENNNpnLj+3ZbsbFh6RSggcjW+Oz7wzsZ3BPpKI8p2oS
         5eKA==
X-Forwarded-Encrypted: i=1; AJvYcCX76N6koI60/5jFjnjjghRAohF/R+MY39d1VcGDF/Uib53ivnYyuKEe8mXmhNPLDGd1+zP9Rlhq8L3EuHXK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/lUDM2PeA+U5sMDGPwQ0xD4Yhou2ab3fwCGTIMoyZkWpsr2X4
	Ch7jguYi2eqk26rU8FDfTEZ5pqv3LIuf98HnlRe87g+kaQEDf2Fe0sFGaG0uuQLC5k0cWfn1AD0
	n8OTuKM6LUHkTpKDiigUZVwxKP1VEN6t7inszubCLW98uyK/NnTwjIU3wTMDA5/c50U2K
X-Gm-Gg: ATEYQzxB7k5EB93DEjHPgHaybukDEKUtEC+aXGEb1aC+J477pe7C5OGQTDic2rEM+Yu
	HPHtg1Z6AwFNMvF8HIUOnRFkyJYWNMQ0RPdH4r4/lcnlHtuq30iZt0uCjrezUp37hnSqQOQRe6C
	/km76qBN3gMXEOOlyPG7yDdXbw6BLDh8rdGxUIC+di3xni4dyRe3+YN7YQ7DOJmms2Dha86ppvi
	18RmxrOysNK9oQG6FHS2ERDq9G+NaIyCByS7GlScQZ6kdf8rAKJfIO1CKxMUX7aLY2f2Ft59hs8
	B2oSZG/xqpSOigEFDidh+3Ztmg/w8bRxmAlCV12PzrxeYYpwncDuUNKIutO7HYDFQCrKwCIUn0u
	PjUrqan8alru+0oeQXrYZkdD2Zh6xFxFYZI0O4+RNnhA5jbzk5RdRaF37tWbrGTbquzF07yt9V0
	VBY1xVqFndW1Z0ZunyXCDmf3pPuhurArOSvxg=
X-Received: by 2002:a05:620a:294d:b0:8c6:ec8f:c8a1 with SMTP id af79cd13be357-8cb8ca71fc7mr2235413785a.44.1772037880537;
        Wed, 25 Feb 2026 08:44:40 -0800 (PST)
X-Received: by 2002:a05:620a:294d:b0:8c6:ec8f:c8a1 with SMTP id af79cd13be357-8cb8ca71fc7mr2235407985a.44.1772037879897;
        Wed, 25 Feb 2026 08:44:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7b0d500sm27629641fa.46.2026.02.25.08.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 08:44:39 -0800 (PST)
Date: Wed, 25 Feb 2026 18:44:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH] media: qcom: camss: Add debug message to camss-video
 format check
Message-ID: <32hsnxlqg6dzu3zjszuarn5tu73vpvwhf3u22wvrucznz6h4ub@xzuqhcayo2jv>
References: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699f26f9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=MSYuwrY0xV-Ka2yJnwAA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gVRQsJbSRNhLaAZObQpVQgBmfV0zbTLL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2MSBTYWx0ZWRfX0IMgWoxVAyBS
 iQquojuN0vUAdT9dalt0ZeGYm4haX+mBBvuiDra7Dk8VUsXqDXEs95dxLLrgixWk5s+fb76unyE
 VP6NAFc98IDT01QAuDfNJiIVc7txGc/kiRxUwDv9xiiT9dznZA82nW12BLgxChvFgkj96d5BWLL
 qhpt7WhLFsdxIedHOZ9xkUrEh2zATriycb5LBrC2pmlzAnTCDUyKX7o7NgK85LGw9DXETIeJzCk
 uQ7mJds08YTX+Kfv5NrqcxsIdcq+cWG11llCdJPDv1HUMwNBMDYkY4CSs2VZimhVn9vKgYwoGzL
 cAPxBZzg3AryAJGA/hwIFdvSIWdf/fvrL6L0jf4gMfhqgNtrYn+E/54CjX5CYA6aqwS39gCTpG+
 kY39VCu7uLtbArun7e77xUYyc85BByLY67JeW+D1C6N4DNWuQ8HfClkELoRzg8ti1RAJXSiOe76
 N9un3xa5pP6fSx5VkTg==
X-Proofpoint-GUID: gVRQsJbSRNhLaAZObQpVQgBmfV0zbTLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94172-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1490019AFCC
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 04:22:11PM +0100, Loic Poulain wrote:
> Add a debug trace to video_check_format() to log both the subdev-reported
> format and the format requested by the video node. This makes it easier
> to diagnose mismatches between subdev output and the negotiated V4L2
> pixel format, as well as issues related to plane count, resolution, or
> field settings.
> 
> A small helper, print_fourcc(), is introduced to render fourcc codes in
> a readable way.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/camss/camss-video.c   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 0c76bc2cc574..601d5a43306f 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -114,6 +114,19 @@ static int video_get_subdev_format(struct camss_video *video,
>  				    &video->formats[ret], video->bpl_alignment);
>  }
>  
> +static char *print_fourcc(u32 fmt)
> +{
> +	static char code[5];
> +
> +	code[0] = (unsigned char)(fmt & 0xff);
> +	code[1] = (unsigned char)((fmt >> 8) & 0xff);
> +	code[2] = (unsigned char)((fmt >> 16) & 0xff);
> +	code[3] = (unsigned char)((fmt >> 24) & 0xff);
> +	code[4] = '\0';

Any reason for not using %p4cc ?


-- 
With best wishes
Dmitry

