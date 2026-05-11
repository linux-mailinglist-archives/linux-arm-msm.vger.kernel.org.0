Return-Path: <linux-arm-msm+bounces-106938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEt1CRbUAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:05:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC88B50E8A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4979A303CEBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE763EB81C;
	Mon, 11 May 2026 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZH8LBy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcdgZ3qL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156ED3E6DFA
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504498; cv=none; b=nHdYgjMiaYQpd9N9lT8jb/roJYW0tVtPs6h+njwX/xfmHIe5rGjTeR7worRcz5boOn6hZ0lk/sLJuo+W+utpYMOT27pZxpy+TmJKuFf2TmKrVdTMKHcD3b+xVtntw6HPdd8qYNrVkIOlAzILaCApa+0CgO9e+TjTZRl//uaFAdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504498; c=relaxed/simple;
	bh=/luFySN9TuTwP132kmsdb3FQnU3x5xvt3hdARMrrktA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EKBW7ib6/RVmrwSFsJ1JpPob+NbYWkvHZ6w5uLHhkbklFaIVV8kwDeR3dhitlCwXYWRHGPc0a+O9r6jTBceGkZ5+X3lzaJjwC3Ntflvjq5qBX71cKx7flI76JDe/WCblZo1acX2OJdymjZfSGVsVed989sE4qA0qEqr36DGCtN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZH8LBy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcdgZ3qL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7APDO453358
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V4uUYe1yUyG
	7QRKd8WtYyuBLYfX08jPs1+jI/fe/6lw=; b=hZH8LBy7dN9wW4Iux9XXl9fg693
	/C+ay/IYnGRXaKJVQ2ncMsYu291YvWWjTzNHyz+jhOr9+mvQtMVJf0YyILq5337K
	tP9SpSQfiCrxA+d3KOCcrbTToExCPHc9BYg4To7JIi5ArGfEJQQZclzFXOLY+RRN
	HdGKD3oMh0q6le+b1NV+C9z7ItTZPcR1Hzx9Izx9ps+8FSJDi3wl9fPAo4MV5Zyz
	1jXmak/IDAXIf8ibzsdWNVwOxvVClTY9clZMDL/az1x5aUJlk5j2QpfFn9wpfilV
	KX8CQLu4czM8MhhgFmfgAHdfpxfWWMYBw0xKlONPLTA0luVOINv6Xmm0T4A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag6h6jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba7662827fso39158885ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778504493; x=1779109293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4uUYe1yUyG7QRKd8WtYyuBLYfX08jPs1+jI/fe/6lw=;
        b=HcdgZ3qLB2+6SJl0KNyAY/jT3rRK9qGHZ0w03vgfQ/PCIRrRe+9gIE8UPe4SVcw4f7
         uX7qNmnPW6j+ZMHly51WZu49TPu1NszzDUwnokwr/Pj/vGm7dc0ygdx73K75xdF/p4bn
         9RXuqjITIvL1ILS0ESq8RV3W4Fbjzsn1lHm59Uf0usfftGBg96znZuAH2mzbcqpvtbxK
         ZdrSfEc1RTEbBs5lhM9r0Si5591fOUcknjDGarbnvVUAZ/uA/z0lyCsuKY2ZndFDrZhl
         3D+ryTTAOS1Dj8bmZTlM70+ziBVJvdFDZj5WHVU6Gdqc2teJlfxqUW9fBZP0QT4rLBMb
         w9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504493; x=1779109293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V4uUYe1yUyG7QRKd8WtYyuBLYfX08jPs1+jI/fe/6lw=;
        b=Hiu6aTiRJNKg8cAGy92c4yv9fDPafzmHbPTKavwvPoB8+1ifFHAQ0stNl91kpg5eOm
         bPU5CC9Wx5wrR/q+UQbiE6+tMNVMs3b1ugDEcNvd7g4pUKlLJBBV6gm9K3kX2y5LOpyY
         MZAiS95f0jyMqKS5CSXSuvBlsSY1znZEurXPCFDabLU3RMjTL7KwzDA76QOEubAG04Xt
         aRnWvbMRfecjqZGUZOBcNIc1CZxWfmUHZvsHQaleF8w6dweaqRhLSoNNSIhjUTLhYlc6
         RcD32H08D9IgdVSo6Del5RKQqJQykuUr7Q9z3PRHiMGD617Tflc4+cp6hVZbfDFL46hC
         WyNQ==
X-Gm-Message-State: AOJu0YymOUa+W27+p9+ydz4i7CIOgyDE6hfmu17+eVs4aEuOmD+L69Cq
	V8/PwyO0shUYd8VD+l02TVvY0r+2fRoya1d0ufFMOdWbSTfed5TW5dr9kmd+2ZbT/3ODnhkDjTl
	aGGhKEGPKbcoyQQLQFMK7+4kl0CpkEBPlM55Qr+3hhQLOOoC7vYfn1kGSa8aUD2Ri3rmY
X-Gm-Gg: Acq92OGP1NntvfHNQUA09OSVgL5Pmll/Y266gAplczWYjUmQiSbbwpz6SBvJ9gSQ4vR
	83T9thbKtiQfata36ulN+oWTqsa7JudjukUDVvJG0UGoUS24BCYiIrELuhSVTplbFsW1HZp9Cma
	hKsbDAZo3SPnMcpZs2ZO74nmqAxBjUaS2W3KWnTRaOkOyJ2nAfY5L6Y/Cmu4/PgBkgL7uIm5GHO
	j+7VaW1MQ5bz7Mb/+53VRHcnk5L7e2p/w8zpyl+JgBVDfgRTvAynF6YUxomY3tgXb6ILJ3oeZuH
	iYp44i1pmh1OO6eYk4tYGtYrGJdAo2UY/L3s8qz9QQIgfBQX+CuUWkuR9xixwRr+vWlqBdeW6iL
	BEHEx6mrKZB/hVLyCvddSrLCDNHHAypNE
X-Received: by 2002:a17:902:8492:b0:2b4:68c9:302a with SMTP id d9443c01a7336-2babd4a48dcmr113994815ad.17.1778504493290;
        Mon, 11 May 2026 06:01:33 -0700 (PDT)
X-Received: by 2002:a17:902:8492:b0:2b4:68c9:302a with SMTP id d9443c01a7336-2babd4a48dcmr113994545ad.17.1778504492563;
        Mon, 11 May 2026 06:01:32 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ebd0ddsm103278845ad.75.2026.05.11.06.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:01:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 14/16] drm/msm/a6xx: Increase pwrup_reglist size
Date: Mon, 11 May 2026 05:59:27 -0700
Message-ID: <20260511130017.96867-15-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
References: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fOsJG5ae c=1 sm=1 tr=0 ts=6a01d32e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=8lTVeMJbxB4f0FvlbnAA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0NCBTYWx0ZWRfX37UsfutGLgpF
 MU+Sp07lF0a4m4S/5DIpHy6zQA8D8qp7UCzjHnVk68xLWaRhox8eKfWFIYl8AImv2iNlEovNXpS
 F1OcSWnOYds3nN9pKJBPCkZMNshlJOSBLWgKpvviFsm8vqVvbObO+WrBe5bAnohIXN461MVWcw+
 0Ho+8RGiLPidbHd0rQTXsz2e0YIcwtWTyUnKEqD61VJKAClaRd8ugVJB7GnoTfNHKar8ddNZPc1
 OtYDOC3JgF0sDLd8gYZI4EfE+YiQXPv2A3j0+1vdBX6ggTFBt86LFC/9cPl/2Qe5XdrM0s0bXT1
 8vWfYpBwO4v/0axn6SoyvW4YLhG/TSYqZ17x5aA4d08MiDt6WCCIo0fWEPej/MRPbD3+4qnGXge
 xpaQnaTDhe0D6qVDuQqIig0xIXD6YI5B0LWBSgA8YZ47TyeqmAF+mD9imK3q3mlUpbgnEY9x0ZY
 PMJLkH+hiTM0jvvfEmw==
X-Proofpoint-GUID: T2C7YJ07wBO9k-3x9GZJtXPrEDE7xhrx
X-Proofpoint-ORIG-GUID: T2C7YJ07wBO9k-3x9GZJtXPrEDE7xhrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110144
X-Rspamd-Queue-Id: BC88B50E8A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106938-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

To make room for appending SEL reg programming.  Without increasing the
size, we would overflow the pwrup_reglist at ~190 counters on gen8.
Or possibly fewer, considering that some gen8 counter groups also have
separate slice vs unslice SELectors.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a329d20033d7..61c6b0e781ce 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1183,7 +1183,7 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 		msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
 	}
 
-	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PAGE_SIZE,
+	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, 2 * PAGE_SIZE,
 							 MSM_BO_WC  | MSM_BO_MAP_PRIV,
 							 gpu->vm, &a6xx_gpu->pwrup_reglist_bo,
 							 &a6xx_gpu->pwrup_reglist_iova);
-- 
2.54.0


