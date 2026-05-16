Return-Path: <linux-arm-msm+bounces-108005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEtpC2SMCGp8uwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:25:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0A255C590
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93611300FB65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 15:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F923E1681;
	Sat, 16 May 2026 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PC6YqNrs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7DDlVEv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAC530C14D
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945120; cv=none; b=YW+ADidSPiLNSo1rkZVeEfOcUBUhlztfW2DRGpqSsTIdpAD/DfVQK3lwsHv7Kyaq64iW7u9CBnqWSft1Hik9vaFuq5CLQKl1Clp6nDps8/SuwntvduycxyeBIKCYTT313l844p1KqPVaSy1KhzIHOTphUPKAxPwTcqgQah6oORs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945120; c=relaxed/simple;
	bh=rdBRuKzwu7qsXEEMKfYn5gqbOOj5GvyV8UG54PU3Rig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sa8hT4qcqB6fvfEJXegMEroN3U5fgcowsWNpYOanwSLSw4V5kEv/nmlNu8jq8Jrgqpo1AeNjClSKrrMuEB9Cnp7KrpxL6RvaVsVDWuoYnIKxghU0j4kDQ3xbhOOZnBH9RY6Qpw7z1QnX9jcy+Tr9W80d4ToYC2P/UFi9/9F6IF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PC6YqNrs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7DDlVEv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3gqQl1904307
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmI5XrkPGnRBEzq4y4AE8xpkFe5kBtdDq5bDE/u4Ncw=; b=PC6YqNrsYNsJWpGf
	1MjnbI2ErVqwyREzJ932C52J1MhVztX4nY4YLzZ/tVq/8z7YT+nxAdfVEpIMgEw2
	YMoi4xc3lMjSQ/V5DX42bPSow1gKAaJiwIWPHGT7w/sAaj8YsH8j/p79AX1pm6GD
	K6/BjoQU8yU+yl1ah6LxBwHdMfQInR0uu0AxJbWbiOCvSZKj8LVEaig115U7PNuq
	moLpdadYawAKdGYyswB/CbZiQF0cDvFhEYqwl6wAEnhaZrYLivxQIyJK4PQLxrwE
	xMvNy+LGuqkdLx8OQlhYSc9j4FF01ahJPIzweSDC2JtfNHtvHKNHxf/qzDi2KDPe
	TiPkZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gwm94wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso23077021cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778945117; x=1779549917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmI5XrkPGnRBEzq4y4AE8xpkFe5kBtdDq5bDE/u4Ncw=;
        b=B7DDlVEvYd1Xxp9Hkj44rlo6UKV/QZZ2vZ0nfmP/mM+74p5LPL0t71beTYTxTM3mdD
         cE1Ed6ykk0+Pc4E219oJsdftykpK86j6m06VQT+YOcDrKyF4OmJuwH6ZC4fmb0RQfCTx
         dEisei6vvBRcAZL7JSnpaFNQFjbQvdxohsm76wRsf5O8IRXIlRz/2ewcrKPERyyaOAlk
         cObZm7Cuao8+dzDL4eHx3RFSt3pgIXGp1c0meT7DSE0QmNI2ewyFq6C+6t+r5zBHWQP5
         S3ekkqyMUi6oTlv7Sk18vzOedmgtxtf5PO6Qei77Ojj8meWkEdrXMEDKyqJSslyLSHYA
         Fc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778945117; x=1779549917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UmI5XrkPGnRBEzq4y4AE8xpkFe5kBtdDq5bDE/u4Ncw=;
        b=RcfykO/iv2sz+ahjw+Jl/FWIgRPr+Z9Qsk1XbwpDbrGyWAh2fn9U0IpebJteV63Lpn
         GOvZKRtpBw8nmfxKsMiH3IRq/m9sqacE/KHWmgelRKPlR8XQwT+hnaWa4HlwPXZ+vej6
         FFrAZmJQdk2TXieTaJz+QsAbmuXeXSapOAitbB37yw2m2qOmGrI7BqaTjtZLdWiOXV3/
         03Im0YFHdB/3yIk73iXVB+C/EafOdLU1QTcLCW9PgchUG1XY+GY6LdR9PJxj0BVYk3M/
         D3Q8P1/1f14UOKaqxCRnV8Gy1Hr9pignHttj95neBibZqNRgjE7nYxQnCEGFabkR7KBH
         tnoQ==
X-Gm-Message-State: AOJu0YzVV6OF41P+vvKck+b8UE8YV9X+PHLURPmN6H8pNlMyMu34PeCM
	bdBudKDH7fwEuNxMpeMI/BzCqZNIOqvyMsWMMboyRQRxfxJsCsC4EeNyG+zzsfgI7zZyG1rXof1
	78XGqJa/sbdd7g5v8P1s0S+aQOmbvfeFcLaXRVHVYKnDkVxExXTvuGr0lTSHQMsb1cjQv
X-Gm-Gg: Acq92OE0nKNBLpXQwN6MBCcKQ2tufTqSIGycqJh5YrpVvpHIrv0TJr0QvKzCwyyuaAm
	1An5MYPn2YvrTG5NseWsSEVo0j5ftcLf3nhIP6SdkrgGiZzaS2Z/O8jF9o9Sn2aIL4P1sm/Ns4u
	wLgtM8N3aR6QUlQpuZQ27w/GjbSPqzOBaypTrKvQ7epQtbrhRopzr6qGBdOxTW8A31/Kw2Y2zLe
	/xiWMLwZXLeIq1lav+bSzp7Hlfa15e8fFn7qYcHLTk42DzxhlU93KU+PYd6qBggCA7iYvtJAaJT
	JrN/kSl3WO0/HokKBX1ApJl03APqfjgjuKM35RaQw5GgqWz9pfaNXc0Z4OvRNi+/lPyX+hNW2bX
	CPPCuwbXniSQcrSzhi46I6IWhEjZNA5YFGyVn9/wy4k6FevUv3Cx8zzDfMleh79LQuX6Wbl6pyq
	P++vU0vazRENUfAnFv6CtwnnjiEW0sBUvdnrE=
X-Received: by 2002:a05:622a:1f97:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-5165a010632mr135796711cf.11.1778945116907;
        Sat, 16 May 2026 08:25:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1f97:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-5165a010632mr135796381cf.11.1778945116499;
        Sat, 16 May 2026 08:25:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd939sm2057972e87.70.2026.05.16.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:25:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: don't dump registers past the mapped region
Date: Sat, 16 May 2026 18:25:13 +0300
Message-ID: <177894506978.2448625.16346847676373449764.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428-msm-fix-dsi-dump-v1-1-5d4cb5ccfac7@oss.qualcomm.com>
References: <20260428-msm-fix-dsi-dump-v1-1-5d4cb5ccfac7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7WwG5LYSLyBdq4XkH7crwpLlN_hRE4Ap
X-Proofpoint-GUID: 7WwG5LYSLyBdq4XkH7crwpLlN_hRE4Ap
X-Authority-Analysis: v=2.4 cv=W/AIkxWk c=1 sm=1 tr=0 ts=6a088c5d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=pSQ9VKN1VO86L-afhjsA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE1MiBTYWx0ZWRfXz8B3A1M06zxA
 488WA1rKAznvoGk+HqhgdiUuboK7H82rhpReqodrc1tKEIeXVTRqCv4SuYhsR6QY42bp4MSxEMt
 0wMttgtdKIsUX/Mugfyfm0hMiEwKejEsCaQ+N/jypq4lQBpMCPXT5Jrbv4H5sGNXqNdjZJOaH7U
 6Qkplcu2ReHeIsnXKYJXVaFvLpyT3Ksb5NgoHVOApCBCzjVkD3lDzjs4l13n8hWRobh1E2836Tz
 Qv0dzMLFp4xglLeJyFA7symTmcA9ZA0pjVmTupoBlhthfbJ8WICmzSs/1lJNtCz24mIbuOPIhG7
 HToKWtL5qXHwDk/9tcdh7M9DHzp0nqR9ZZ/n5lTdbPSxpAYFnCgLvKh5qfQVwlJWBrwv50L9KIU
 afugr2Nf9fwSffo9t9e05zJLuJM1nGAo7hMCGaVBH5JjHSyOs8Hbntkxw3vcdGW4X9bzvcIF4rV
 JO4In9U2+GBc5k1weTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605160152
X-Rspamd-Queue-Id: 9E0A255C590
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108005-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, 28 Apr 2026 20:21:38 +0300, Dmitry Baryshkov wrote:
> On DSI 6G platforms the IO address space is internally adjusted by
> io_offset. Later this adjusted address might be used for memory dumping.
> However the size that is used for memory dumping isn't adjusted to
> account for the io_offset, leading to the potential access to the
> unmapped region. Lower ctrl_size by the io_offset value to prevent
> access past the mapped area.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dsi: don't dump registers past the mapped region
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5b49a46baa85

Best regards,
-- 
With best wishes
Dmitry



