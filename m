Return-Path: <linux-arm-msm+bounces-100281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE8PAxdsxmmkJwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:37:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D13343933
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D24FF311EDA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D356337AA87;
	Fri, 27 Mar 2026 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cI8GtQcY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KmwIQYjs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6614379979
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611163; cv=none; b=n5xnH5KSyMsBW4OFuyCLyXjBEUJPsdMcHqkiJNs0VHjnI6t+qPtMJQ04tv/tsS3i/4AykCv0FBKJ8h271DVp1A5FcLNMOrwB0xzZmDP9FcVERT5/tbsTdbYFwZ0jeZ5+78ejctOAh6FNcI/rQchUA0poVRljXftMtszaVS4Ocv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611163; c=relaxed/simple;
	bh=Dfbt6a26su4If6yjXSaIWsczfXA+UlYzh7DSG2hxcvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFTEAtQZo0OIMKxo15gw0YACYKlftyokEwN2GQD3Ao4PAiXU8S9I91+biBVszI6q2hCr8ubftjLoHx/h+00uRuUVYl4fRjTheeRSAGqUZme5H0DtUtEFwDqh3YhYuKnG9h/DDl4EgRXzQcvRXV7H3G2jxE4y1N+WWhq05eifg9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cI8GtQcY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmwIQYjs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vqSx298588
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chefL0VhCP2pkztsvpJhn296SxnIHxiefqjU+kXnQV8=; b=cI8GtQcYB+hiYNoF
	CkemIfXlARwTQCsG9MN2k0UDCiLCkt/V7+QFFfHWNuNem27Qmb66I8Uznq+n9ZAp
	J/SN9i1rogwo9FlCkMsS0HbOHEprZWPdhSN5ZVBRsvCyV06S9CO+Ay8thXyrWiCr
	R1eUCieIKXoq/RVLQkuqskhB89f/7k7/xDG24/XGjDbHnRrCzOckHZUXzgPsUnuo
	OLlcZg3v+3QsbSfyvU+HKJOwNTBOPvlwVl12r2JWGBQm0eozlkPamT62cx7TsZz0
	5E7Ty2jnSVn94IUx33rac8NJmQLhqd85Hn1MDmX3lkhK1ljTP6Q7RuiFMaJfyIGv
	51whLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8tvxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:32:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb39de5c54so67254485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 04:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774611159; x=1775215959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=chefL0VhCP2pkztsvpJhn296SxnIHxiefqjU+kXnQV8=;
        b=KmwIQYjsKyXLgRUYeJ58vmiFvTFs4v4BIk2gn+IVio/YOVsvvu4+RVm5KKYxunfHK3
         3UN4gcZUNvNIUxJ5NY3CCjHMdX4Lhv8H3JCowDTTSxIeKBApp9A4+jd+h/3tDWFYPyRc
         vYOeir2i82fw42hiVpLuFk2I4GPR+LkqDNmW4Kf6By97n1ZQabzl0ySU3Lr9wrJkNMiW
         JFUXifwZToeEy79PzONqmhfILtblfGisPswnbwqFsEC+PR1G+12sSqJSPceAj6pVKFD8
         xwaAOt4tz/Kw60PoqgDpkWe8o9W0ZbtA/4kz/gLc97pnJheQXFrxzt0mYNmAKjavRxgw
         czdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611159; x=1775215959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chefL0VhCP2pkztsvpJhn296SxnIHxiefqjU+kXnQV8=;
        b=mGi2uiMoKUU0n7DpPycG5m3WR138g0fWY5UT5FiSB7NgXYnJ8qPWvIFFRbRoHXAMiG
         g+sRpMNqXKzv07fqj0BqPRvv9Lp8cqlxf1QSuMKDblobX1XizN0EEl4Z4KAnCtFilYWf
         qtdFj7SrVFKsZBqaKgQDoZmvFhBIWbNmQD23sd27GhDaxXuZEWWipQaDzuI09C/1TU6u
         9ivmjNipTxTv5ODtxx0bkR1S6bcpy1dB65KnqGnGVhatI0RwO8SfWdXdd/vX6GZJWkhv
         NtXs52LkhApJOP0iwThWZQnLU2bcX0h0qx2XZGzkKHNHnfXTl3ZCLK9W81saJz/h6hRK
         LGYQ==
X-Gm-Message-State: AOJu0YytCw+VqfrF3b/oMZNZUk31gy3MdtJfu7mmY4x2x0bOvC/PUnod
	S24sVdrNKiX8RJbkvng1dNEEdgx9HDtRka6836p2NtooFd1aaVmITtx5P7bzzhdMCx/bpz6A2g2
	iiaJOTJsYoFN1Bty2Wo7NuoozdZNsNaxW24wNN89mrN4FWtM30EKYcp7fzXHFVznvnBPp
X-Gm-Gg: ATEYQzwPHBph/ahJsSL0HGCsSwrhTKSVq/VWJAQBKbxhwTQEMddtHGgaJP+7Pgh9gun
	0HsV+8BG16aJnWhUUNzu+bHNC9/Cy9TPgoLyR2IaqlEPVNy+GuhEDd6bzjN1OfcvUui0EYBups5
	eYKlFWq1pi9ZXk4U0PWZS9oNVY1ZdjwbWJgEzlSzjXoxgYQqnVr7Jsg90+IQV75fbcF4JAc2X7o
	xMkblIj1EFE/Ia5gm5Q1gW4SB5I42GoqyL3RM6vwTAYRJPEG2iA1jGpB8OqXDV0cLssB8ehh5NH
	y0OHkGE4EVPkvGIPkWVj8cu00rTlH3LU7NwWBnpOUvsf1bVhCkaGrgwC0lrK44MMbJCK5ePyPOQ
	flegfTPKZvqU1aU2EYet/6WzV+CJZ5NhSx/AhmXPrv1aSIO0Ef8CyC8vfn+p0JKKTyEqJeqi12Z
	kTvaw=
X-Received: by 2002:ac8:574b:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50ba39f670dmr19717421cf.8.1774611158899;
        Fri, 27 Mar 2026 04:32:38 -0700 (PDT)
X-Received: by 2002:ac8:574b:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50ba39f670dmr19717041cf.8.1774611158427;
        Fri, 27 Mar 2026 04:32:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c10a0sm240967966b.39.2026.03.27.04.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 04:32:37 -0700 (PDT)
Message-ID: <2ddea137-bff2-4576-94ed-4f3a48aed386@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 12:32:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] drm/msm/a6xx: Switch to preemption safe AO
 counter
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-3-2b53c38d2101@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-3-2b53c38d2101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3OSBTYWx0ZWRfX8a/lq+qRb2b0
 jlQ4ARrQB0y1bk0++p6GujqM8ZF2scZYANCdnH8bgRAm2PEEIxNMsT1zKF9ivk+ewOkGU8QUmN/
 hzLEs9TSjQzUUdAntVNjZJ2KjDi59qyXUsBA4iACxI2W2fODcZBZl4eDHXa6WGWiXkSAOPd7XsM
 24SYHnQ/Puj5iH/QycPYk5Sq9yvU+loktbcT9i1a5vBiI3uLGKLc0EMH3kTKjtRqb4G3a2i7qbj
 NMSSABNgWUBf10jwZvrd/JLYJZM4Hbi2d3o0WDff+/8vcQPFTo1rbpJKMGO2FYutFrqU+MFnwbZ
 JfcNFJiXr99EQOuKxJ54bz/xmAH7e2Yr3/3zAYzV0cgei3KyKUDktMkjstJwatORs+jo/xe4VC/
 fICd+SLPbkXfQLAvrqWcXAP+VTiEfmd5O+QV0/G4P8QSKYeEyy3ID39X2xWf47HTQhDP5X1Ko17
 Xdg50/W27xZMd2nqjCA==
X-Proofpoint-ORIG-GUID: yx6yPT3Wlatdr8zJbMhR42RblrvTacHZ
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c66ad7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wLQHWzgrVt_HrJ2nkkwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: yx6yPT3Wlatdr8zJbMhR42RblrvTacHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100281-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61D13343933
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 1:13 AM, Akhil P Oommen wrote:
> CP_ALWAYS_ON_COUNTER is not save-restored during preemption, so it won't
> provide accurate data about the 'submit' when preemption is enabled.
> Switch to CP_ALWAYS_ON_CONTEXT which is preemption safe.
> 
> Fixes: e7ae83da4a28 ("drm/msm/a6xx: Implement preemption for a7xx targets")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

(this is not a blocking comment)

would the _COUNTER counter be useful to keep for any other purpose?

Konrad

