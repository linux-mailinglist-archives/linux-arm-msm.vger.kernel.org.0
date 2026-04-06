Return-Path: <linux-arm-msm+bounces-102028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0E6hOg1F1GnVsQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:43:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABC93A840C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA3E23054C10
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 23:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F1839E6F5;
	Mon,  6 Apr 2026 23:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxB9+sDH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXRQhBGP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D098329E40
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 23:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775518939; cv=none; b=D9djHBrWhCsB2AQNNcqQil1c+cFIzSh/XLDfdPPnosn3LGXksV17KUPoa3jjKAH2KNYiWTXVmVXsZuI35poA8jPIcX9cctzmavO1979KjfIxT+JiQv2n6X6QQiPGWKWhPNMvgKZS0zD+ayKVwgbXDa96dd02vVOS1hiYL9HtqLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775518939; c=relaxed/simple;
	bh=uvDJPGcvB3h+51kwf8AM/B4bN/974zMc9h8srJeXUkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rO8GsaC8d49kJDIkcV5Dgo6HlO4RkTPFosAyX1LmD8p91MFw3F/ddINS31HMTSbEZxj6QxQcyabxyaS0wZlt3xpTMAESTpuLSYLTnOPc75Ip1Y+rPyKuczD4/tITfCfEUcY8Y2lQtekWrJxHc1y48Y6H7EhNtMT1nFNIz0tuhVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxB9+sDH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXRQhBGP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LSGeF2328042
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 23:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+FX3hFxbsXLzmQEVBCnMj3T3W1aaATGH4hCY8cpIBj4=; b=UxB9+sDH5/AEHOuT
	ZvIvt9iSxYL7a/BHSVMoTw7QoW4P+LF5vZiS/ANo/t2mJqheOw7XbfgLumzwmi/5
	9vTlO1ZHDK/3E4IL+8ZPJH7pbGy0qeCt34SIsecXl2O170AkSscEd9+74mXca7aL
	1X/dy1zF6K1DZVBbXsRGKGIvyhxTm3qVLAX9CFqm7V3Jh7qoaQGUPvPhyi7LxPnm
	2xqAAKZUgvWMW8+20PlnqpRLO5F6d+9mrSzVuHgIZNXMTEKJkAOX5WFPDiJBqrVz
	uDlN5ZhMJjbMqBM9X/gn89jo9Bcs23rXFEefRXP+B5cIu0FuvyTiG7dscuTHMMw6
	EdvqwQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4r924-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 23:42:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d984c74a8so29953951cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 16:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775518936; x=1776123736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FX3hFxbsXLzmQEVBCnMj3T3W1aaATGH4hCY8cpIBj4=;
        b=fXRQhBGPrdHSYPIp/i+E3j8VSEWfKa6GCiY3HXrjDnxwyS+aXaktF1yxfWs8wE4Uc8
         9lzAsIIjBXBXMlaik7hXt5BVfmKJdnal2zaWaDfvEp/V/35pobDzGueY6wFxuOY1Z25k
         UxNNFC48RuWztO2khev9yWp4/JJh7SaQv4PoEAnIvB7rw8sFlq2U73+CGrF4xmZdarHs
         iam13EwDdULLC0GaaVZhInGO9Jn/CbzsHsfJ0AaMyT58P8GIzzCWf1g7JEtyV2mOyI9V
         PsVBWKcyRUxXT984AnnMJLH/zCpVqpYZpydQJX+bpY9p42UKtFP+LPqX+Qm4+7G5DrCD
         z3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775518936; x=1776123736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+FX3hFxbsXLzmQEVBCnMj3T3W1aaATGH4hCY8cpIBj4=;
        b=lKu9JG63FMvNH8rGegqId32pHCmab7rizUu0r1CR8MVE4FPXZmLNBtGo9FOJv5Q6AZ
         BU5n1OocvUy61lcGP9rZ4d/wNGmaqCmfnW85IoAC/X+c1K1qqzzH7S2ZW0PGnlKWcM1k
         Jz54D0NWfew7qIDPZsyZXNH91OxaIsckx84GMgu5epMpsPTswv6SS+VD4GtMrYENQZ8q
         MLGHiA8wV/Lg/uSAC0INm8tudf4Wcqv/r78w7oMK5AEAcCsIx7KMKFicUR6xiTt2T55C
         Ctxx8vdSlzUzqs8sVsEuNacQzVjO7VTpLzE3KPgB8xz3NfMvWKBDU08s1BdpRvPCfXui
         q3sg==
X-Gm-Message-State: AOJu0YwQL7WEANaznBRsitrhE9sHj4+H5KvXVwWTMnneKEUBO4B/7cl0
	s5Xm0eiwOxTFILQRnbSGpHXKhsQ35kOsnodug1dRKAN0N3yve2qjXFBBeoPmIlrzqXhzuCcIOxw
	iJV4Xp8LlbI9Zn6/0hb6lrFVJvM2Kpe6g5HI6YVQtHcU/dMNyblO5NIdQsCZuyuknguYB
X-Gm-Gg: AeBDievujS5KyGo8/lUofuwkkSjrogGyOOQPXy4N9z+UUp28TdRafMmO8EeXbo0f+qw
	NciaKMA8Y6huQOtZzECO4e6DG0UBN/WV7ynOVc/qWS0FspX9MZ6Wa5QOrr73cujhu/myry5olbM
	tlYN/6NMXO3TQPIufFeZAa/Hx+gDNdpZOu4eCH5GJdwyFgaNKQ0gkzGgw+HS/Yqi3W/d4x5l3yn
	qpBZ7GdWNxtMheTYngZzqe5C0B8yJzmVmYhTPaUIiyEP6lEwCB9edaNrASqgldmV+FyCeeLlS4N
	Luke+NaqJxQXQD3No43fSLKFU4wXZgXQJfQCe6SNyPrL9Ns7fS//TH056maUw8feOKWnPX4lH10
	oQKWt6365FpAGM50Z0EegXY+jM0FDIEnT9SZS9PxxrWFxMmTjOc4PS3yIb28LvGr/uSBPeKQHHl
	AekAFLX+DFuMzxlq3UmgapM918ssPYTodLzC4=
X-Received: by 2002:ac8:7dcd:0:b0:50d:8389:c3f4 with SMTP id d75a77b69052e-50d8389c6a9mr132214171cf.55.1775518936245;
        Mon, 06 Apr 2026 16:42:16 -0700 (PDT)
X-Received: by 2002:ac8:7dcd:0:b0:50d:8389:c3f4 with SMTP id d75a77b69052e-50d8389c6a9mr132214021cf.55.1775518935725;
        Mon, 06 Apr 2026 16:42:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm33512011fa.39.2026.04.06.16.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:42:13 -0700 (PDT)
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
Subject: Re: [PATCH] drm/msm/dpu: drop INTF_0 on MSM8953
Date: Tue,  7 Apr 2026 02:42:09 +0300
Message-ID: <177551403361.616257.17730405730725411988.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325-drop-8953-intf-v1-1-d80e214a1a75@oss.qualcomm.com>
References: <20260325-drop-8953-intf-v1-1-d80e214a1a75@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIzMSBTYWx0ZWRfXwl5iptjvuagy
 CTHffxHz4WA8r3U/d4jrF+tKu3ehBVmVPV7FTWcGKyJHUWNyZJtbA1bNUCbNzYIcdm3jOXu8VMi
 CVOriYv8VPe8XV/pOwD7jLhodh32dpxWxga3Ti2P20hVOSm9xBgYH/likfj9XobcFG1wPjpofBj
 y2rpQpVESGe/tAbQBkeimpzu1s3q7kGIiSPZSraouZnj/gDC9YmxnkltQ70swaKvBitDVnDqKEZ
 CsvJwKCVSzbAa5GkEETohCqghlsV3DrkWDgttfeAT8nGagzcci2LbQV9a8373juLaQcmr2lS7cQ
 DQYcS9dnMDfSfPHk5/5yyRszI7JYVUqrcuNdcm6JLlMkWhRW4MGencLCc8InybcJceucHKoHHNo
 nLDYrBrLgWBBkwDLOZpCshgdogsYuKZzpEBb++RWcyjNWCJHlxI4hhk4ZBkzBppW0ARhJCdSUkP
 y+YXFOctn8ivct8PfkA==
X-Proofpoint-ORIG-GUID: EeDbXMCQfPA-LKMlqSLrWsB5bfTFbXQr
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d444d9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=hk87uI6hEoqpmA19PHYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: EeDbXMCQfPA-LKMlqSLrWsB5bfTFbXQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604060231
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
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102028-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4ABC93A840C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 07:35:44 +0200, Dmitry Baryshkov wrote:
> There is no INTF_0 on MSM8953. Currently catalog lists dummy INTF_NONE
> entry for it. Drop it from the catalog.

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: drop INTF_0 on MSM8953
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7090420420d5

Best regards,
-- 
With best wishes
Dmitry



