Return-Path: <linux-arm-msm+bounces-89930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGoFAP8pcGnYWwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:21:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB24EFFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A6B9364FAD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 01:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3236628CF5F;
	Wed, 21 Jan 2026 01:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRXfFwvA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SyzI4WXG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973303033C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768958424; cv=none; b=CNisgeMKgph7LKQgXB265HNq6QQkZ+bb5Nkt44osgYyGeMCYNFwkLijVvJJNCiTprHbB767v1g7gvNaX0/9S35uuUDlMAMVBnnP8WHMEErHaJRTrUphRcehq/J1FXgyDqt1LvYlTaoKiYnj50ORxNd8BPtRC13d4Gnz/lp3Whp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768958424; c=relaxed/simple;
	bh=c4zZHPmSHLwlXi//KYC7Whz9l5q1H6+J8H99OOq0iiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eapEsrlifdRCYU9XU4DvU/uEqqIzY97wbnBm5xPGknHKQoBTX9Qd8aL/QISuXfrQOMsvY4f+3jBu6V1gxCHn5Qc+MjcsMPRWwB/s++3dpk335ZVScLfFKYEyTi+1DxqUzcftZjGLtYe91aXI3VI+ywjYTM3BkEh19C98ctTZf/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRXfFwvA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SyzI4WXG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KKh1Je877858
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jTmmo93V7xGePLVLaz8pP3Gj4E1I8Db7ikybXohVsfI=; b=nRXfFwvAt/xui9gh
	SLikcMcLNpmhXShiClsb1lPO9mk81EOyvqH/S++ybTSDAVuJNnesPOC0NTCldppp
	SZ6HhMXfKhOzzBnd51Oab4iG3QFdS9jdMnaL4F4FluSqNOboSqusmxD0DYEUmpIO
	HA3gCd7AbsRL5Oy+cshi0wz6srnz1CAMIZALJ47OwWL7VmMqj/P3W8z/LaiKbW2t
	Zl4y6Xo2jJmB7/+69kjBs618upZMXZZCJgIOL2PrNxj8CbvxeJMibwV4wqMhzRok
	wBuXLVnhdGT5TwaJcvG1YmPQHSnBWr0OkOT/I6a7yRzt1LOv9Sjx4JjOmXnL5naZ
	yyOobg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta42jbrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:20:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52c67f65cso312729285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 17:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768958421; x=1769563221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTmmo93V7xGePLVLaz8pP3Gj4E1I8Db7ikybXohVsfI=;
        b=SyzI4WXGbYWQqultIxHxrfsac4NVwjs8Bk4pcfF0WIDTPTu09TeA3OuMmhoHRJdqCj
         kPGa2MhXq02K5RufkBgGg8P6UTRnnRooTRSekTCh5zyfqj5B/jYR+TD1Kh6Xk2PhZfZx
         SUwR0GXTxUaLZv7q7RFGi2Yu93fvlueIyY82vXRXWB6b7oEFzCe7LWq5dcf460NATR3H
         yklihBKVMpvP8HPyAjWkN0JtgMyhQk+Kbw+9p77PRdYynMCuGl68Uoe3aNH4VdbqrceU
         VSzHMak95cgoyv1tkV7+PEIiijWDbNUmV3uUJaCTXHdrNlXrL6qHe+mxMevQVH/33PhZ
         TIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768958421; x=1769563221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jTmmo93V7xGePLVLaz8pP3Gj4E1I8Db7ikybXohVsfI=;
        b=pGZuKN9sEqzK25J/MrXofOpI31e+P5aVZTU6GAoIwCMybapGkYSkaqrPQkTXfjGEPh
         c2S4sH4I48hxtpY0ayI/e7RRNYJXHBeZjFL9D9VNdKDgcoxWLlluFisvzHPURgi6MwYt
         kqboFby32rSnbDPTx7O+JogSu2yKMi+qc0ZMEvcRYd/gvYv75iE+p1fFHM44BCBiVc3I
         Z++IxtWv7kS5V8zL4g3j51PvhQKInO9U+zGdNQyX+ttDrJal3ut7lnENoetazKCZCJim
         K+Qu6rZKQnMR6vYJf/QLJ4+JLbd+cm1ytc2/oBZ7oDyuYBHKwf/+gQWSm29cwkesxsEb
         wGPQ==
X-Gm-Message-State: AOJu0YwwdzwwbnMD4ulEJCowMR0kY5Q4WTcEtAdKkUNbGAWhgPzuRydu
	IA1GwyfaL9xx2oIcbDhwaVybdLnG+RFXQDoBo4Cf4KP/7cwHgaHwEhrWk2EKhwmFnyyscp2jv84
	7TQCMZiF7ZZW9BAaIuDr3FIe9QY8iye5qu2dgJkEaCCeD2fgwrgc+QkPdBIFAYc/6SVz6
X-Gm-Gg: AZuq6aLwwfrnJaZE3dOZfF/zszCN24L25SD/8ZokOyXdnP8IYaJOVW32l3XnNKW4udw
	EcqMxRzCDQSCa9KfBbKYLbgOvv3AvYgegTIz6niFL/q0Tpce3JJUFoSp4STT/JRjGnvdyEJGY0t
	tH31mfNbgVLMthc8DG0cm2dtHz2FgO/58MNiUC1aWg4C45MrrGoRl8vJA/KPuvrAzTsU8LhRpzc
	slQWDubkG/id0Jj1TgPdH1NPPqlXVekCVpAfYD3tYWp6Ed9qioEiG5lCNt29WcDpnEADjmQhS5I
	WWVPp0G9qaARWcP965y1Lml07YPVJ1bvjJh4rANccCVaCF9n6r89+saDCOIrsla1XkNQTQN/D5V
	q73uBsY+ijBkR5ByaCZVn/eMEquk+WWzCwF9UIgqHSuYI0iMvq3A9up8ZpMEbUX3cxelntzLkWj
	Emx+qP7hAj7epc+b0Rcfl1pjQ=
X-Received: by 2002:a05:620a:4490:b0:8c3:7e05:daf2 with SMTP id af79cd13be357-8c6a68d361bmr2197552385a.15.1768958420736;
        Tue, 20 Jan 2026 17:20:20 -0800 (PST)
X-Received: by 2002:a05:620a:4490:b0:8c3:7e05:daf2 with SMTP id af79cd13be357-8c6a68d361bmr2197549985a.15.1768958420239;
        Tue, 20 Jan 2026 17:20:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3543d2sm4383110e87.43.2026.01.20.17.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 17:20:19 -0800 (PST)
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
Subject: Re: [PATCH 0/2] drm/msm/dpu: improve LM allocation
Date: Wed, 21 Jan 2026 03:20:18 +0200
Message-ID: <176895840438.3580355.1415508163541607317.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDAwOSBTYWx0ZWRfX1Jt42yABTmZM
 4QGIovsXritlHgGBzw56ffQrB9zssNZbjaLNOkVh0rDzsgjp8TpsA2HfCYTGIcfgDVYGqOEEIvh
 MIoPIKuSPH7+7NMsiDJu2gK3jxyCycbiAyNBonp9Ae5IQBPmPFYsyvJSdM5lh1rxoYTq6gcfrT6
 0ZzfbCKRCl/m/O6ve11oydi6CowgZF5As7aC2LCDbnaayLpYgRb2wGMxfIR6OjGUr4m0RHus3kc
 3NrbONuAR3ZBcHOHgGOdtCLDlqUulDMfylbRD0+DynC1sWATvrq8pRKOdAztAo8wSBsno3Y+i3/
 cqcCQ7tKDTvQdZ2OuD3hqfulaU/tbdqslT6ya4Qj/k+D7HVBiei+RKEIDY7OhvkC2a6ryaSBCtl
 ySlSnFcsHbPcAnYpg5yMVl8mVIJJfFz6AtpMlh6F5eh6ioaBBg/fMure8LvfpVYSSrQVPM6S+xM
 FlqCSp2AAzJ9B/hf6LA==
X-Proofpoint-GUID: rLU7glr1xf3xunT1Jqm9nnh5FvQspVpG
X-Proofpoint-ORIG-GUID: rLU7glr1xf3xunT1Jqm9nnh5FvQspVpG
X-Authority-Analysis: v=2.4 cv=JeSxbEKV c=1 sm=1 tr=0 ts=697029d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=eItp_FwtO1cFr9fIi8cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210009
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89930-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63CB24EFFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 15 Jan 2026 22:05:37 +0200, Dmitry Baryshkov wrote:
> Not all Line Mixers have corresponding DSPP blocks, which are necessary
> for CTM or Gamma Correction. Currently it is possible for CTM-less CRTCs
> to get a grip of DSPP-enabled LMs, making it impossible to use CTM (or
> GC, once enabled) for other CRTCs. Make sure that RM allocates simpler
> LMs first, leaving LMs with attached DSPP for the CRTCs which need them.
> 
> 
> [...]

Applied to msm-next, thanks!

[1/2] drm/msm/dpu: correct error messages in RM
      https://gitlab.freedesktop.org/lumag/msm/-/commit/98c8f146f574
[2/2] drm/msm/dpu: try reserving the DSPP-less LM first
      https://gitlab.freedesktop.org/lumag/msm/-/commit/42f62cd79578

Best regards,
-- 
With best wishes
Dmitry



