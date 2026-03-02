Return-Path: <linux-arm-msm+bounces-94919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFHyEJmIpWmWDQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:54:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AE91D93D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 178B930642FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5013A1D10;
	Mon,  2 Mar 2026 12:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npojqhIX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDd5536C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F3E3A6409
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455545; cv=none; b=syU3HujfvC64ufcdoUPo8P+lVDknWKBaIUhMBn4qJ36ndeZn5KUQD7JfaD5j+AWjjFMzkw3LgPLvVpBFpHfCZpR1kQUFLyt7f5OjxyTRZSkGRbH8LAUbk3lPd/aDRjvaLTo2/jBBhFDBY76WRN9ThH9deMkVG27OfRQpY3ipNNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455545; c=relaxed/simple;
	bh=66XEJUdPfjBjVFIVvoYSjjqfJ0tlYNoUgVCb11MzoIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fFzCSvi2L4Z/YDIaZbXsuOiXjQ/rxjQK9wiXAQwd8pC4nBDOUytJNIDs+ZfksgcrKx6K52FhNdCmozfYvNkA/CuvMbepWvPm1kfszuD7D+VMsrc8OTDTLhqP+OxOr9rAnqfvoC36SyDJvRQxexDRT2lIezvhB1N7pgxYAf0AJsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npojqhIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDd5536C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294ZAk3753075
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxr2BeEaFdYlVQi5HtJAMZPys8+ikBmZeMmfYQkWA1E=; b=npojqhIXjW6mWJvu
	CqyzrLQqfqS88fB99Z/tY2OnTHN6P7TdWWVMvCBDtfOpBQAN7GdkhRtkevdjjBXQ
	hgJYxA8jkGbTgZ+XX1+0MMfAV3i7RlTWe5mfCfWKZSvNLegZq+O2PJ/Tf2jOzV3w
	Q7JhoS7KpG+LAW+gBpw7zdFj+7hd8gwAboVpc9+NXAAlip16T1VrA1DP3Kwe+f4A
	6NgWB1rbmj2ofzccIVkGGEjFgmxDMg7CXd/WDQNZBZD0ln547Rh+PoNxuhCwpRSh
	/+7mprppIbYoUNGGbcAe/Sx0C2YT7+TQJ9a4EemLCQCVby6ZzHWsxB+PsLeJEfo5
	jdC6Yg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq8r2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:45:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899ebdd0b08so12376696d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772455543; x=1773060343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sxr2BeEaFdYlVQi5HtJAMZPys8+ikBmZeMmfYQkWA1E=;
        b=MDd5536CsggCLCQM/c+lJZIXBGWpSmZvnQMWIWLxuSIns63F0druavCIVQxQ6V3wXG
         zmoY8MqcjAI08CRuthodKsR19amiH2ncvJJBSyST89GSJX96PxJGUcHeOpbF/6fGILaF
         IC0TXaMu1tIVzWHs2RRZHCMvU9PH0tplUpQU2r8EUiOQIWpcKJULlc0Q0v+VgJctgWgf
         e7GbODqdZ74c6fGpydJ8EaLEJLGxfDdy8oWS/4iTjIy02GAygR6mwotr42LLGXEzTdtP
         6gAu6+dxbByTvePDQj9vYyCbkHWMjj0/GZc2xDAzkUaRfe54CaOxdit4jWHShLFERSvA
         ME+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455543; x=1773060343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxr2BeEaFdYlVQi5HtJAMZPys8+ikBmZeMmfYQkWA1E=;
        b=HAzWHs6zreoK7+nUnntLpG6wZwEyzR+LTiYaX3KNbVNkDnpz0U6W1wrdlxzue/uPAF
         TirqPUYMy0fOc7kDTCvO8pEkQGyaAvyHoITN+GIrVVG8aOO99FG2oSpeA8/V9XidJ9RM
         pWrFPGtot4Xktks+QIk0mpHlWszfY542Dy2/UcK/6Qi0hh6Yot08aASrBGmHseXMS2Z7
         V3muCEZeeLDqRdLea98vPBZguQCDuGSGxa2P4Y/mhlQF+orK0MURML5XSvayoRBWVSnm
         ynmg28UVlgdtVJBdcF4+ZAenqA4/Me6Wx6x0Ju9kWY91rkw++TjgRUylDfPtgvL4WV8I
         lUmQ==
X-Gm-Message-State: AOJu0YwkWETAaKCHLXrLi/G5TuXvwL4zVIHUHfia8CHYfRoJDBo/1dal
	23cuawxWKZL2JgIEzwX5+FPEgLI7nCTOwXgcQNzyfNqEcJY12XFLaWw6p02/2mUb3UfHF2kp/Xj
	nq2Ujnb+yc8wWwpmhdOVuNo+HOmXtWKaN0cE9ffdy8hyr8K3C6OZUFlPZT4PYsbguxZAr
X-Gm-Gg: ATEYQzy1ZWLJJZukc6jFAGZnNSy2XMultYWCx6NslQui62v5hc8Q0bhAt2wWMucdzT2
	uewcSL8NnRlGfp7+/v/v+39aOecwKf8k+K0wb2DIdSV/llYJVT1D9B7U76WGzGI838PHB51ipND
	DoAX7BiErFrArbeCiFhnmqKk2SzelzGLDHIBusV66PA29I0x/TVcZq7/m2WjCy3r8w/Fj0HkkzS
	8SeiVkyB0H7Jlu4fuSaVk3GnIT86058DO7WsyRb2Nxvk1sbcIKnstLO1xoKGkHpzTsJgH/6x/Up
	ikrCILmTT1v1cfOR/+cplqfIuJ2iQ52S5HcupirWZjQfraA+ienMsX3pSixXE0dMIERqQj9ttuu
	Q8gWwYUGGL3FS5a5fCUtfzmzfR1IzTpCYZZi2JoM5qSMh6dFb1nTfX+SNuW/phKtsdimcDFFQcj
	AyYzs=
X-Received: by 2002:a05:6214:5c82:b0:896:f9ed:bea1 with SMTP id 6a1803df08f44-899d1ec1c30mr121608076d6.7.1772455542901;
        Mon, 02 Mar 2026 04:45:42 -0800 (PST)
X-Received: by 2002:a05:6214:5c82:b0:896:f9ed:bea1 with SMTP id 6a1803df08f44-899d1ec1c30mr121607756d6.7.1772455542465;
        Mon, 02 Mar 2026 04:45:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935a597d02sm468049066b.0.2026.03.02.04.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:45:41 -0800 (PST)
Message-ID: <ae03232a-49da-431e-baad-c5ae7b85eccd@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:45:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aZJcs3xa3JnSKBPskwH_d-4HrF6I9sns
X-Proofpoint-GUID: aZJcs3xa3JnSKBPskwH_d-4HrF6I9sns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNyBTYWx0ZWRfX2un96CoS/foo
 Twk/RxqsBsRmbHJkXFaRsYuNgkLtomuWXT+oaAIygztmC7ZEnukwgUKSgRYaIWN005DUjpRcJnZ
 Bzcpfinf+7nzkvQ6vjgYum0SWARrJI7ZU+YgrLunec/0AZlezsplrymc79fALZIEDFi/+mC0LEG
 Ufoeu/CLlTs8OhB4n1GbbChStbPrdpdFm7K3r3/dh0v+7Tz1M2BWrjXkZp2+yNzSaooZ4s2y5yl
 Og6ApfvJBJL+1Fm+dXH/ymqAwi6fo89l1hPXbhgoASrO+aBLmhI3NIyXcIcEJ6p0X8cZjH1vg2r
 npo2uZz8OD1XM7SFKuLftP4pNbQBaMSVjEoI6LKMMKZiUJVy6CdoZYw6BhbFmOicc+MHlXGeZNH
 K8Hp6LNaPw/pkHD/xBLOBlS+9y+aXsJD9PiDkLC82cfUzBl435vMZOBcXCTk16EeMuuh1ihzVya
 ENmE096OPrTu3oBuTcw==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a58677 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TmkEJ0c5ACjQ8L-i1cIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94919-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4AE91D93D4
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> Once Konrad asked, what is the use for VBIF_NRT. Answering to his
> question revealed that it's not actually used by the DPU driver.
> 
> There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
> VBIF_NRT being used only for the offscreen rotator, a separate block
> performing writeback operation with the optional 90 degree rotation.
> This block will require a separate isntance of the DPU driver, and it is
> not supported at this point.
> 
> The only exception to that rule is MSM8996, where VBIF_NRT has also been
> used for outputting all writeback data. The DPU driver don't support WB
> on that platform and most likely will not in the close feature.
> 
> The missing features don't match the extra complexity required to
> support two VBIF interfaces, so drop the second one and all the options
> to support it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

This leaves a trailing 'bool is_rt' in struct dpu_vbif_set_qos_params.

I'm not sure whether/if we're going to use that specific set of functions
with rotator support, but we should probably retain (and at some point
recheck) the dpu_vbif_cfg->qos_nrt_tbl data that the catalog houses

Konrad

