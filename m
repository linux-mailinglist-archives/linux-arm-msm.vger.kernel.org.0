Return-Path: <linux-arm-msm+bounces-83346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA2BC879EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD5463B38BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 00:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A6126F46F;
	Wed, 26 Nov 2025 00:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwShmz4q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iavoSjIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1236326F280
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764117882; cv=none; b=nRANvsecTTlDL7tObcBwhoJQ5fxipwwHzIilp954HnRz0NcOHw+qKHmhto5wekNOnkTNYQTyA9lIj9A2bdtdagp6ZTkMhARbSi4s0nMA0vHhaNG3cydOd370zfSghvagU9QfJsgqiphq89VaKqTA33ijj/T2pGaCUZvUlC+upWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764117882; c=relaxed/simple;
	bh=DvKPAI7NaRvnujvpeCf6dki15cLVpIdMDTdx+vW5ntI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxQfs97GcHwmGncos8iswuZH4pcCRhQMuT/mbbomDBM9n42+SFaFVPC8+823LLNk8FZnv2mpktwo79ky2KzHZ2LryF9GEcBJo5D8piSrXG0DLWP6qp2023flMCdFKoTM+NXWa6xPkQ3ctcY6ipx0JKV65l0zTEi2N6DB15NvZyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SwShmz4q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iavoSjIZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APKUQ613255831
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T1fHIVkW5yM89PGka4iIFJLW
	8HXC1OeKAXa3SyPYZyc=; b=SwShmz4qPTVGRUvNsu5dzhVKztwr3EAqgUKnR0sJ
	rbDzSO2v5ISqzrWmW+q0U2gvEUvfxuoQADVtZ1JQzrmWIqE6Ud7vkLlUAcrAXQUD
	xjAWL51Srsf7L4+AXZ5/EAbumsTmIpnHkhuWDYauyUbD84VL8047ItWumhQOdyh9
	0+7tW0A60IT20GSCQnV7EWFB1AMv1qnbwHF+A+kH5TloB3K3xZ5/mLDnE2BwFK42
	uk4K8KqTBjiMK+ByX/jYFdx8iDAmGqjIk6FSL9VzHq7lFq4Q6U8vHeGG2PJI9L0R
	amnHWb2dNgMK0X42ituar7X3RbH8MxpM7hg3/jB0dPXF0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c222g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:44:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8a1c15daa69so556715085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 16:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764117879; x=1764722679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T1fHIVkW5yM89PGka4iIFJLW8HXC1OeKAXa3SyPYZyc=;
        b=iavoSjIZ49elUDjq42tcmqc4chZRjka+VoIlcmHQTsVAHXvJ4+kOl9jqLI4G/AyZxs
         OmAiTsb7WZdZMKjeD9+Tf0iB0MeSUBNVCveKSSntaMmWA06RLPOy4dQAPcL9t040+vFr
         NPl1ttkeYczVcHsvJUnSkEIWEK4F98/kvDCowmQIo765l4kGYx7e5v+ff3icjvZaJIhE
         BHASvPCmfEk1DccLO0uh8zvQcbuf4iB06vVkK9JXcDghkQQ4Gx3u3NcpmhDwfYVj8WPz
         +Sz4HuxbIoyZSOXu32SagEaJ9xhE2lE+/36h92DnjPrzdETScoVLb3TNPxyWqci2fJFk
         MQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764117879; x=1764722679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1fHIVkW5yM89PGka4iIFJLW8HXC1OeKAXa3SyPYZyc=;
        b=fCjNlEWk5qX1shmdIT6S0UehqU58VkdALP9mrvj/Vdky0n44i5Sc473Q7qUaXnIS/O
         b1A4WLGi7OEbQRUmnNMl1gGQuRq9YneJcP4KUenIkO/MqJOvhgJ2PLBQksBXmdfKu5RC
         x7MZyhKmsjnt/ccXatG1P+Wv3saqTZrL64HMXUluXQaXkV4zQfXbL/OfWw3uR8LObeNS
         nmCSsv+Pmzxc7x4WGoK0KyDUenSUdoXqYXNcfw8s4LoeKBBGYM416RRtCEEu2DfncQ7R
         37g51CWWsEx4WMY98xZPVVSAbL+Z77rfbCeMJy3dTOVuoEpnq6KpkqyiHQelbs70NQSG
         Y/bw==
X-Forwarded-Encrypted: i=1; AJvYcCVx8TdkNyDlsNAprpf7LL60M0SnMXfSJMDDXV8DaM3z/XX2tkUthaN+vlETb3seq5rfBgAKqOcsNJt2v/sI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf3GKjYJg+SyixH/EJwpcmkisJgRDnc+AH31upjvsYclxbQo+T
	jDUoFGR7vtbQtwAzm7pvpnlaS6ezC0JixPA1FCNaiT8e/Q398mUtmkZUXCNCFAWXIBbfl7K2yB3
	iK27a65zBF+WT/EMj6rb7fwl56mIlF3JWKo8zK/zvDbXrN4SzfkCgdHHrQ2H8Xsriz4Kk
X-Gm-Gg: ASbGncslIQzYt3eat8sxMrUHAwy24rFVpGQuY+y6gQ8niOt8ZsGxdCyfZY1SU2qrYQK
	6zGzRfZVQPEaBYEPixyxHH3ovj4DGMDifvV+1Ob0DSHlysMjdQgkEK5VGbwGXPzG+PiwuLywzvc
	NYlRrHtSTaEAOTUz1qagIm0Z/wxWSFUojqYLXgLp4XdtLnCF0Zq8fBlQSljXc0/dQ3foefFrvE/
	Y1aLeI62iJhVHIse3iITOjerdRso3L+gMiu7nnCCEz/VdvaL9ReGjde2xGacZyM4676EctNh9Wu
	ajcCy/loeON4uyACZJ52kQLsrIukzoAQbUNCVfxw0XMt0YySTUhcHBmjuIr6VM790lraSOHcZJh
	8RqmtkJddT8NLWFme9aE2FVjkvYQLOxeli6DYs80xbe22nAqkQrLx/iBsMxfD79eKVVytkMjLa7
	MWh4EiKfp0BfOXgKBQl7WWDxk=
X-Received: by 2002:a05:620a:19a5:b0:8b2:db27:425f with SMTP id af79cd13be357-8b4ebdae8cbmr637527385a.58.1764117879381;
        Tue, 25 Nov 2025 16:44:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETtOV1cliBKp82XUzYr+2GksPDY893Lct7SxLK7/rR3lib4/B6Utjop8rxfuA6fHe7V4KyWQ==
X-Received: by 2002:a05:620a:19a5:b0:8b2:db27:425f with SMTP id af79cd13be357-8b4ebdae8cbmr637524585a.58.1764117878871;
        Tue, 25 Nov 2025 16:44:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db8989csm5634850e87.39.2025.11.25.16.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 16:44:36 -0800 (PST)
Date: Wed, 26 Nov 2025 02:44:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
Message-ID: <eou273nqznbew6cmquffzcnwhx4iv6dmfwsyto74w5mcn4pdhy@amgagdf7dz6y>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
 <e6aff9d8-a6ae-497f-8c8c-91d60959eadc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6aff9d8-a6ae-497f-8c8c-91d60959eadc@oss.qualcomm.com>
X-Proofpoint-GUID: iY-sunuBsO_Juhw8Q9Zladg2uc8bXpCp
X-Proofpoint-ORIG-GUID: iY-sunuBsO_Juhw8Q9Zladg2uc8bXpCp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMyBTYWx0ZWRfXwUMlFyvlkZmp
 ne7R1dIUgf77eIAveo2MGe8Zp3e1ixjvukSXYw57E3OuDjuk8Bw+BWJo2dBLnHtAGJvcjU0VxpY
 D3n60VQKdgT4GnoAUDBwLEiwzhzhpWiUj9R4gI4te3ioDoEUyWRz5BLZ18hlgMxTSPu8/G+Bkfk
 SdfPWlmKAIxZxscYZOod++d0zTHh+SmyORuYJd+NlLJS0uzQMo5Il4nGEIZx4mQoQMDCZ2D2fVj
 mmwYb3lkVuEYle/RqSOSC1y7dhD7rxuSZeF5n6Qi/G2iB+3MmhxBhZyHJYGlt628oPuRudgcJmH
 +zAx+d901HzGVOLt3nFIvrg1Zfsijs5RKBf5gJvKtx3X4bsm8PA5+BwD4eiAwn+Z8vHom9poRFW
 mYQtYeBjiHnBt9ID5NmSvZ3AEHRqKA==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=69264d78 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kpPRz-UtyBwCQlaFug4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260003

On Tue, Nov 25, 2025 at 02:37:46PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
> > > The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
> > > state management complexity. This change removes the drm_edid member from
> > 
> > Please see Documentation/process/submitting-patches.rst on how to write
> > commit messages. Please use imperative language instead of describing
> > the changes.
> > 
> > THe patch LGTM.
> > 
> How about this:
> "The cached drm_edid seems unnecessary here. Use the drm_edid pointer
> directly in the plug stage instead of caching it. Remove the cached
> drm_edid and the corresponding oneliner to simplify the code."

SGTM

> 
> > > the panel structure and refactors related functions to use locally read
> > > EDID data instead.
> > > 
> > > - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
> > > - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
> > > - Removes msm_dp_panel_get_modes() and drm_edid caching logic
> > > - Cleans up unused drm_edid_free() calls
> > > 
> > > This simplifies EDID handling and avoids stale data issues.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
> > >   drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
> > >   drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
> > >   3 files changed, 26 insertions(+), 58 deletions(-)
> > > 
> > 
> 
> 

-- 
With best wishes
Dmitry

