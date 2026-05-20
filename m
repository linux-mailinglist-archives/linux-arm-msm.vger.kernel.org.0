Return-Path: <linux-arm-msm+bounces-108756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKRrKBa7DWpT2wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:45:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDD658F047
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 62A763008466
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A4B3E8357;
	Wed, 20 May 2026 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1B3pF5B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLFIXK3Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4C13E274F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284495; cv=none; b=HkWy9Is4mSAoE0gxztZHTDuXCLaKVN/xyFFg36zDgJEKRYNGRIEeii+mlIJSe1LC5tMHOMFyVnlN5PodnW2fNx4yO7flua08D6+LRkGQBPqbMd4ThlxWPES9N434vg08+4YRjDwb3eUWvnC5MNbvXly9Bpci6Ou93QFIzUS7ACI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284495; c=relaxed/simple;
	bh=0sUXnB7RNWBquaQVyciEZZHD+Uuz29c5lgrLj37PP24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pquG7YZzXlcP7Euxuf9PLrLvmqb88teJufPmMx1uiUv1BMGk6UP3nGeKPnsqM8lF00qv7SewIYOvyPChMjXZUed8F7r3PXaVePwpYXUOWqFtpv6TCIpGa0sfMYdhsgI/GzNNZULqFNh9gyWGUIlkMIYRHDjYKxpaHBx75K1/AKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1B3pF5B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLFIXK3Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCeCVr317132
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b7n7dWS2wat70wUeGbGJzPfb5sbFNJlaG958cf6x0YY=; b=E1B3pF5B06Z6KbVA
	AUG2Tblfo/TiSDGZv98kSjz1r2L4uvQBiFhwNsgJZ6q+frt7pZ6+QoK9SOMwsvZT
	7wXdrZbwkFu4tVBFjp/sadCJIi1/LaY6WRQXhiSa4diypy5VtQDz0QAWo8YpV0BD
	lcePAllJCk4D47/yp+ukh8S9xssibPjak+dUvoxlaKONIc6/BkC3n/kC4qzvU7uQ
	Gd7Jr/pm5lUmoY8PefK5DCcxtStUsMLbAJnYfb1ADjND69Nr05gWaFNHvW5wpvAN
	SbbGkf0CIBB8jwfo72c+OyfgzeQIiWOwFlTJQYIjPmx1dxAcK335bPLXop9d5X+Z
	NcuEfw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qr7j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:41:33 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-577c69d3f04so5372635e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779284492; x=1779889292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7n7dWS2wat70wUeGbGJzPfb5sbFNJlaG958cf6x0YY=;
        b=VLFIXK3Y6z3eggvWWSoA4TD7eOhKgVROgvJeRsWOTw7Yt8gqUMp1hO/P2fICYjzT8g
         XtWTQbbNN2WBFXy+xaSlvMymIp9rps9yMwc+YWKHaY/VC/3MjnfmtomDofPF90kWL7c7
         uxf6j9gIwQlnrpfiWg7QK8bhoowB7DmImvO69OjQ1iCbtRxFfPLabL/gla3eSPPGoDPh
         OCeNOo25WuPsblUTgBr5UzwHpsiqPgWNLs7Tf6pkvOWwqsG6sEKSzXlAPLh7+oZAIRmO
         cSj9yQowTuSB9kP8Vb2qZxoZNEICVTfTz3H45AfXz5vAgCG582MrOKpNurYYM+otdf30
         X8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284492; x=1779889292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b7n7dWS2wat70wUeGbGJzPfb5sbFNJlaG958cf6x0YY=;
        b=cfzyPSVtgHFmJCOaFPbEkRw31p4gv32V8AX0WCJvhzzGMRvy/PxghYIOgUD92r/cfa
         15P8OIy4jFwwl0dkFkIWPlHPrRz41/srbUkWl1NlJ7KokYtvUDntAQxZBAnem8PYxuZR
         wNuhG1Tf6MoOLkTWjnpBm0QySut9KYH8BaE7Hx63VNcEL0WU+vaAe0j5hiQefJqxPzje
         f7elqCaUaWuWNmIhyTW3aXZfnugC4JHk2CpT9lwRIT4qOk3DGKBd8nnilCVbWH9ZACej
         FyH5teXRZ13AtiTvD7u1YhXw8Mdl/w1o3CQsfQeV86kf4jx6e8waTTQ51HWNM3A+pEAg
         H88Q==
X-Gm-Message-State: AOJu0Yx4C0Sxea99X+VCzyI9JVVKgdbbLx+3vcSSP/9UlJC3LgmxliBu
	Lv9U5bF/P/TTPAp7avWXz7rz0zyf3oXFd6xZ4vbXd9OUvTMHhRI3Q6Y31iiuaEDmQvxJ+eUv1xx
	IMq7XhuUWOGIgjlffhy89wiGH5nRKLOJ6Pw2705A3YXGHk2JJjURSgsVYBKg/GB8e+RsG
X-Gm-Gg: Acq92OGBGlCr7A8cBdIRr9yVp4RY7xJEnLpG/RBo5ZslafVhanbu063MnLUs3ZoK6cX
	AbPcZhbG2OL9qFJIdxVC/mdkuEKueAcM4SguETTqZyNJ7vWdma2+WxH9SGKq3ENkKbT8xhjjgeb
	ouj+qxoMsJjHHYsJy5aRqlGjKEwDM7LZNDbzuZkQemUJ7lPriuKd6osYs0lCoVZblp2Tb5MY2V0
	KpV+HoZGmONRc2ZUZfB6cUVDRtqlr+BlwhKnpJlic4EVYSuchPFxGN2+qoL+DFk0+tXphNYUHuS
	eUp2Qoeqr4OA4AcK7zkmuW9O5uqNH5+KRFwdelyvjWVTPM2eLN3Q4DV2YOsJhkcaQH34azpcUkq
	yh++bCzd34AVoLeHsNPbISkoOCFj0/foM6fXwWbg2EO47TpJKnCNTKgzupQpEVlfsXgNOypAGgs
	z161Sg0V3rNbOWuf3HadvuRpm63wxOLNuCxofedt8eG+SEZw==
X-Received: by 2002:a05:6122:6e0e:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-5760be6ea63mr14515196e0c.4.1779284492560;
        Wed, 20 May 2026 06:41:32 -0700 (PDT)
X-Received: by 2002:a05:6122:6e0e:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-5760be6ea63mr14515135e0c.4.1779284492107;
        Wed, 20 May 2026 06:41:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc3fcsm4997008e87.48.2026.05.20.06.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:41:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jun Nie <jun.nie@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
Date: Wed, 20 May 2026 16:41:29 +0300
Message-ID: <177928444226.2567181.13284983255649878415.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415-msm-next-quad-pipe-split-v20-1-bc1fdf140b81@linaro.org>
References: <20260415-msm-next-quad-pipe-split-v20-1-bc1fdf140b81@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMyBTYWx0ZWRfXxblSYnBGXj+A
 asqHP5+3SO+Zyy826jq2cQuJKTuK+snTCu+fH+WTS9SI+tkxK7Le4X12rCPnTjAEA1luxKI4nQ2
 oXPHJXyt3zP317zjUCVRcRBsC6zTb9UBT56D8xWxr3M3OHDIMzbz8PiGb9v6RJirnqwBaWTmLmF
 FnhL1QBy9HLI1EZ9VuYW7FLvYRdhB2oAAlO2dEnxUeUH1XJJO4PapTvRSPHM2sF8GdH8s6TACbQ
 XEiwfh/f0j5Ksm8emEOsHY9jYqEv3bIob/mXe9IHD+uhWpNbJrLxEW3tyerI1TbA4Uki/EijMAx
 UyCUBW1bP4vG+xrqq/XCTmhAhVLU927ozEoNaRia4r1iSFIwzWh+MIPX4+nObjN+WLHl0bW9RXN
 dK5UG76B7vFm/EVcMw8qGAOI5gudZ8ZlmfSpnrstdPHSdRyHLmcAs6GUSSZsExLe+Ky8w87rviM
 DGsl2kAZP8Dgs16ueaA==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0dba0d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=pM-ujc6r0VUMniopd6IA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: m4CAb_1uyj2u10TacR7xjjB9mzBoWwox
X-Proofpoint-ORIG-GUID: m4CAb_1uyj2u10TacR7xjjB9mzBoWwox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200133
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108756-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,gitlab.freedesktop.org:url,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: EDDD658F047
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 15 Apr 2026 11:15:11 +0800, Jun Nie wrote:
> To support high-resolution cases that exceed the width constrain
> or scenarios that surpass the maximum MDP clock rate, additional
> pipes are necessary to enable parallel data processing within
> the width constraints and MDP clock rate.
> 
> Expand pipe array size to 4. Request 4 mixers and 4 DSCs for
> high-resolution cases where dual interfaces are enabled for virtual
> plane case. More use cases can be incorporated later if quad-pipe
> capabilities are required.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
      https://gitlab.freedesktop.org/lumag/msm/-/commit/218eb06a72bf

Best regards,
-- 
With best wishes
Dmitry



