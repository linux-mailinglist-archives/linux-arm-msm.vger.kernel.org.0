Return-Path: <linux-arm-msm+bounces-60516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A566CAD0DF9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 16:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D31BD3B0CF0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 14:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE0F156CA;
	Sat,  7 Jun 2025 14:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4cPxXT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAA71A5B8F
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 14:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749307441; cv=none; b=IbPrrVqXz38zzbD4hzSGmG6OsWx4PrK2XYONXhmuBh+7n5PIs9oaInjJP8TPNFQt/MJprQ5TXJr5g/JfjoYt0nM1pEuqSZxlA26lvUlHlcu4xV4caIA7j8X0OiygNFxscgNRSl8DdyQCH4osmcRaOkVsmyELIqeK8cWs7XUsJqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749307441; c=relaxed/simple;
	bh=vV05sCeFpR0egI97lciX4iSzeYjP9TGXqiwcwA73mk4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XxJhP36EotIRx/Z2FvKb8Ll2p/QJxY2sPbYjZAOtmiOoxAXgWCd/fthJ5FjZcGGpvL5toyNG915ILC66iTDaeXVUIEqPTn0IUFdYf61qiec7saNAEZ3pAWXakuTqCjBaOFf3b7T1DhYBD4deVH0LKgGfWUSYOIligauxXmE6UPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4cPxXT6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55783uk8020031
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 14:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pzcxmCnV5pYzfiX15guSgFMIxLrLb3NYj+Ra6xjgQnA=; b=Z4cPxXT6LBUkradC
	N9MnJk/8zLs8BDAqAUwa15Raw53GHEYgEBxhGfnZLYZdG4hrpKPO0bMALOQU9teC
	pfB221wfUtBfYsOHMxzF39Q2zlLaCZZkwYxBq9dfQ/qp/A8Tqk9l69Ebx8BPE/lP
	kFzHV0dLaX1gjRl3BK8/j0Cl7DelMUwiDDijvRCIL9q/YL7wMTv8sGwXw6DnOyCc
	6CpsHZ9J1mqDS/Xdt0ZBzELZBXVEvsc8nNtACH1y274ZXk6c+Yl9ZT3VigDeL5lE
	TQxWvFmQB4AcNyJB2mt8toylswPCx32x8zyIaGmBgDDVJO9LOPZocjz+FtfBlKLk
	uMUB1g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474asrgwgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 14:43:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235089528a0so33010755ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 07:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307437; x=1749912237;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzcxmCnV5pYzfiX15guSgFMIxLrLb3NYj+Ra6xjgQnA=;
        b=sOGS+ooPsg2VHthH2L56VsqoPuq7wMZACPK9t/cLFi6pv2NajTZmtQPlwGvZqS54WF
         KslzTZEIW/3NzmcQT9ETbNiHeHRDfCkaP0/SEuUkwH7wMMbQ1hC/x81VKoCGq3IebHRE
         ZvpxX+AVTCGkP1gZ0RIQQ5xSGiylwgNlGYmJ0rM7ESoAVZk31XyTFIArkNjaf5xQ5GPf
         p+BffiJYf0k6CKQnHrhd1BGVmwPUidhwUJNSVZrramwCN4+VqOmnRgWsYZPZEkGswrSS
         0L7Ieu2Kv3A+6wbqhjrw7sGl7A5Vkn/El1DnLedShAKXTDFyHQpslLuRHieGaaTPeaaJ
         JNfg==
X-Forwarded-Encrypted: i=1; AJvYcCUmAiZXo8xShOx48Pt7045VnTW7sjcgYcW5nyFkdjGWGkqVJzMUbw3OTUMV+a/be8RUK0yB2ueqahnpQSbI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4UJ/UIALFb7iasTjlLeljr6AlKa6D8a/0V/IPjeLy8cPZpJO3
	y0DiKI/uWcYAXIQWjvFj/KEe5GVZPfHdvD1DGZl7s05cwwloqoO2SaveyN68Ymw7rAxulwVSL3B
	AZsPELAtK/BaVaWdKv5q5pAqdY8ytNpqh217IgLdth8VrR2SVDLpHYHaDjk+SO+6s7koT
X-Gm-Gg: ASbGncsIvZdgTQUcmHphvv7Bx2dgs2j8ChQTJS9Dd09uLKkYf/5sh8OMuM//DcAiKuX
	q3XI+rT3/BWbcWSKqCjJYGEzxN4P37SZywmnhhqzIC5MeHOMY2/e6WuK6aIdhJiMYa4JMA6Htlv
	REmVGWhvP2GWZYcMeGNu97y9CSLJ0avfGMYEU2+irQ9/R90fnPRAD8d1aHETfbkjgPE4c5u0/Qb
	8T/5lVcPTsSSUK8Yjx582D+7kookLmLHUdMkSnMbO5ZmwJXirimTOFmS+5M7vzWl41eNv1AE25e
	b9GjfulHgu9GikBHEVTp5ts9LtJAGi3K6SScwWRqhlNtQDqwY95v/ePbidk=
X-Received: by 2002:a17:902:f688:b0:234:325:500b with SMTP id d9443c01a7336-236020e6e0fmr94478205ad.22.1749307437183;
        Sat, 07 Jun 2025 07:43:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtEwX+CYFF9tWBi8OSvwsaTfDq+qAz9M4ipDToqoJL56YkpTKX6fp9SV49PLNR9nRrd/51zQ==
X-Received: by 2002:a17:902:f688:b0:234:325:500b with SMTP id d9443c01a7336-236020e6e0fmr94477825ad.22.1749307436453;
        Sat, 07 Jun 2025 07:43:56 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm27626415ad.72.2025.06.07.07.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:43:55 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Kalle Valo <kvalo@kernel.org>,
        Rakesh Pillai <quic_pillair@quicinc.com>,
        Surabhi Vishnoi <quic_svishnoi@quicinc.com>,
        Caleb Connolly <caleb.connolly@linaro.org>
Cc: phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
In-Reply-To: <20250318205043.1043148-1-caleb.connolly@linaro.org>
References: <20250318205043.1043148-1-caleb.connolly@linaro.org>
Subject: Re: [PATCH] ath10k: snoc: fix unbalanced IRQ enable in crash
 recovery
Message-Id: <174930743530.154748.10228995269580503920.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 07:43:55 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 1e2owcdVkBMMwQDJD8_wWc0rMhajzh1G
X-Proofpoint-GUID: 1e2owcdVkBMMwQDJD8_wWc0rMhajzh1G
X-Authority-Analysis: v=2.4 cv=AMUSjw+a c=1 sm=1 tr=0 ts=6844502e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NluFblzGRrdN37FGmV8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwNiBTYWx0ZWRfX+dU/nfDCNSYY
 FHiLD/8P2gYSjXeep/cXqSfTid7J+oHkXxeW4tOR3y2r89t2/IOoKmx3gBypFMRWzW2NVJOgHm7
 cIokUz2gxvEO+zRjsxNv6eEncD/IWZm7YQS4aVe4g7Jb855lH/dhNkYbAlNdxDSl4dQ+yb2a/Tt
 kjge5/F/zjFjXcK0o5mqz3MFy4z5Wj/YM353/EzVPitQNv408nkLqSUub7cCJhNES/RIFvRHGBI
 ctP9EJ/ao0yZ6toVna0bpas1O7VQhYIbZ249eWfj4fsK/KWlGH4iZFdMcVxOA/KzRqsBS4PNZ/e
 TCF6GmGcPnOeFkciekx3R5it03Q8KPohghgzoEg2Fuaudp3mgOsJEgaAxOpPvTXs6B3l2G8FKUk
 NG/11DjawCOQ55xHRoNcyaBsIrzclG9aiw6qGblD8ZNQcd/bNO/AW/qs3RUU6ue3OaPzBwWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=527 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070106


On Tue, 18 Mar 2025 20:50:27 +0000, Caleb Connolly wrote:
> In ath10k_snoc_hif_stop() we skip disabling the IRQs in the crash
> recovery flow, but we still unconditionally call enable again in
> ath10k_snoc_hif_start().
> 
> We can't check the ATH10K_FLAG_CRASH_FLUSH bit since it is cleared
> before hif_start() is called, so instead check the
> ATH10K_SNOC_FLAG_RECOVERY flag and skip enabling the IRQs during crash
> recovery.
> 
> [...]

Applied, thanks!

[1/1] ath10k: snoc: fix unbalanced IRQ enable in crash recovery
      commit: 1650d32b92b01db03a1a95d69ee74fcbc34d4b00

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


