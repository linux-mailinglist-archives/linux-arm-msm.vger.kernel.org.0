Return-Path: <linux-arm-msm+bounces-100435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFwvIRzfxmm5PgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:48:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2A34A674
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 822693069663
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008F4219301;
	Fri, 27 Mar 2026 19:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtHExjP8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TmsJOnOj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C454E37FF60
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640878; cv=none; b=NNODVGYc4GROb0EwFkl4vArLKnpPIyKDcxWJXCugXDzBYe97iovSVfPbrEcDPjVrhg6gmpHXBXB8oIIvZ65WuLFnXR6u+jxUBurhsHESLuYQhBK2zzfUf/9evuEI7GoLLhcKVuGl1iKmGnUCw5UM3t6SQZ+FlEGp0zTmJV44sGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640878; c=relaxed/simple;
	bh=yi/NMAzf/fP7TIYvedpUvoW0zVtcWVFFZ5HNSWxvWhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EcGHZdnCnk0CvjKTzH8buxoYYiaeSN6yjH1NAzPvxXkQBMXOcTVPnXzNXOwhaxsMOpq1KSQ6Mrly++tIdppzYtV/Ah0eGTxMESYe4qlht0XxPSCb9IUwSBLHo0PR2CRr6SrFkGJzl5TkMjj5o94sqQTdzKFoBoa76QKHc6vDxA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtHExjP8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TmsJOnOj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2Xr7890278
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3/7oi9V5zEYfmrCd11E6BnEImx10l5mAyfwySmVa/4A=; b=AtHExjP85gtbbVeH
	DN1a8Tgx5uzN5MCN8tbWrmMKQpJk2Qgskx4TPxSmr73SZJCPwvzA3tPZu8Eshd+z
	2glXAEpcadfjrmo4nzobtDazY9DZ9QqJQAfrJZHFE4Se40dLVSDPVl6wleidoiI+
	ubsLwTvWRxSxpY78y5svwLWCxgtpkfFne3Rh7PoW1Ml9OuoakaiTTztrBO9IJ1pq
	I1+o1LXk7gUA/9mvCZaOu3Dli9sOPNsHI6EgSd9ZOec5ONnv5WCgAwevZHwDpkYQ
	XNgRezbiliLffBsKz0IFAsyLwHXE80YOfuG86qGKcXZkYLN85bo6FDOOJKjVhXuj
	tp640A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6rufe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so56901991cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640876; x=1775245676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/7oi9V5zEYfmrCd11E6BnEImx10l5mAyfwySmVa/4A=;
        b=TmsJOnOjHCnp8jD13dKHKqBwiRa2VXS7oeuGJX3zpuE5y/zCV6bqyeEaXMq8l+myfu
         7G1HEl6k/JKgH9Arw2EqqEZrCdF3nHo5ZUXsvne35225nKqZgVZjAB8/uqlXngZ0f5iF
         G2Pzu7K2P9glKVVG2z8awq1CvMI7FqEpSCUl37xGuujq6A/VK7kt7gNSdbUPMf/ULgNy
         wYjbqReGMNVHvJjV21d4FrVnjyCECf+o60O7tYMuWSvl/f1OkULiHqsEqdcSUxMHCrR9
         1+r1Fwby8lxijiX6l/Qm1Wok2WJIWyNuZ8v6bn19wNM3zp7a32+85TvM1YCeGEll74HF
         xnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640876; x=1775245676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3/7oi9V5zEYfmrCd11E6BnEImx10l5mAyfwySmVa/4A=;
        b=H4YBxTEddSmlSsusN6MXa6GYuAxABGWzmVFt0ANHFPSyGl/Dz2OLLsV4o4H+Iwa6AP
         40Y2SHao5ea2bo4x4GXHvY2PHwbsqZwyP/F4ewGid8T40TgDAg5ZRtL469lsWvQoG48y
         CUr2NUCu9iUA64uIIB/J2PMbgF67DmEbgkodx9fqxLSvP0FjGtN2Yy7kihC6uEmNBayx
         xLjegN2DDelfPunVi3y7AgQKuLaMFW2nyRNZP5Ns6bUEv70ey2R1gzAl/PRxw2bCmjqH
         OXGT3NXgXiURfTNyxkujdn2ImsoeIKdNejhFlz7GPGcS6dWS5l+9Wkohs1hkctxCZoJv
         YwLg==
X-Gm-Message-State: AOJu0YxPByP/HDswY6LLpwsLb39uyTWJYE2j5bhr5rJXLeF4PrX2JZ1j
	H6PUtsPSi7hpwZALMc5auA/ff8Zl4fg9yB8bGFpYmHZRV+OkFEvl8hkESz9xAS6/g1dSfWSvBdB
	+7lfm14aVptX2pjpbaytwCuW9rZIi5UGO/xHp/TQiZoibl0NtWQtcPwqRLGe1OfrfGwXz
X-Gm-Gg: ATEYQzz063dcsFdGEBoKX216hKiy0tI5B06ocx83M996CRicQrhu3wDZTmkGcsNbz5H
	g9QxKkAw+efO8KMxYUjRJ3nZKNDw88M/oO0QOmsxyZTRJsr6Phpx0ldApZjokHa0a8rvHc7Gy0Z
	VrCY5rFUyOmCC3rn0PffCE3AC5TeJFZyArkD6Q97QHnjvt8bFXkFG/HyZtvqnKPjZaOWm6+4OFa
	kgHRZ1wIgZ/W37mukZm+AU4k2SeVRWF6U6DLxVUKPvctkPZNHgVmjVOJHPlRBlEBY4wsxRc3op+
	QKqo8ZkSi8oZlK4mYHtTG55L1Mr9u7Of3IvKpn7UlE1U2rQhHfEqo+eaZNu7hiG81ul4PFKSUrx
	apx+1m9ypR3KVHhTr2uBuPEZrL9d72ODZ3MZ/IYR8o6ibKoXLOiQ6qXjhKVVz3+20u23meruoXD
	ZRTt1ezkzPG0UUooC0X+pi6yFbPGx719aT
X-Received: by 2002:ac8:5744:0:b0:509:33b:ed6 with SMTP id d75a77b69052e-50ba38369a9mr54190861cf.23.1774640876098;
        Fri, 27 Mar 2026 12:47:56 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:509:33b:ed6 with SMTP id d75a77b69052e-50ba38369a9mr54190441cf.23.1774640875610;
        Fri, 27 Mar 2026 12:47:55 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:47:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH] drm/msm/dpu: don't try using 2 LMs if only one DSC is available
Date: Fri, 27 Mar 2026 21:47:41 +0200
Message-ID: <177463970794.3488980.5641186548018992630.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317-fix-3d-dsc-v1-1-88b54f62f659@oss.qualcomm.com>
References: <20260317-fix-3d-dsc-v1-1-88b54f62f659@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6deec cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=LbxHV1oPoWewQDzF:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=e5mUnYsNAAAA:8 a=pO8qyPEA-sju0QlNnlIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: RPpbzE-5wZzY9a3tE4uiHgOCx1jAQlAn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfXxo2RM/bICoUv
 p82vzGcmRlcCJZxtxNbxt2kMGXotH2FS4KCDToyeSR/xnFK9ig73r4sRyMp0QLeIcx6YwGRpupO
 80LB4nsFULBZRiNyQrng8OXpaOHN2XNTU3QxzMKDagAy4igEukCFYRoq5SoezZC8tr47/r2DhzE
 aDwlgyENrO65BwwUNwbQMBqwb+gmJkjsKkMQlJytBWPcCRzCEvVxRJHHsPfG9x9NPWkiF48govf
 2rApxyb8LwxMr7ZGMLwAyBYGTyoWofQI1AEHPUZa70MRuccl6mmpKp3+C7dx9Y0464noq7cxpo2
 u6pTJiYt0HbYt8QNlewAiPn1vLLtemFaf12G/57eRly0kESYwC8/sYtpg7UB6FAH9QAO0gSC9uk
 tAQBUuEGbo72h6SarlCNuzRzxAId5TPGkSPSXHLBSj/ib/wOpnm5ln+clOnWoEj0Lu/sc3tWHEQ
 VTFsv4S0RT1Ekn//bng==
X-Proofpoint-GUID: RPpbzE-5wZzY9a3tE4uiHgOCx1jAQlAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100435-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 60F2A34A674
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Mar 2026 17:30:05 +0200, Dmitry Baryshkov wrote:
> Current topology code will try using 2 LMs with just one DSC, which
> breaks cases like SC7280 / Fairphone5. Forbid using 2 LMs split in such
> a case.

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: don't try using 2 LMs if only one DSC is available
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b9699dd86276

Best regards,
-- 
With best wishes
Dmitry



