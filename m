Return-Path: <linux-arm-msm+bounces-93874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH8IBYwjnWkcNAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:05:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACB518187B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1880630584BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06971E7660;
	Tue, 24 Feb 2026 04:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="in5jhdXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgGP+z/o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B94EAC7
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771905929; cv=none; b=AiBgrfIXvuRhQvreBeaTqoyE3aMjTatL+okJz5NKmGedGmAfCWPYbnSQAcXR5X/ebUxt5rSPincKaTs5fgeWnK+VNE+Q9nE1m0so/HeAKZNVHwY4lVAs5rvpnGvkVQTVR4hmplEARKiffPBTg7r66vt4RFM8mhdJmBTODKGeZkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771905929; c=relaxed/simple;
	bh=phDtnTyi0udLn5C/xyv9JHoxnVeA1nNBs7OwqkpkZZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dGx42omzfPk/pqt04JAOp+H341WJZiCcwUpwQ/IBAWB4Ucr3roMbeAr7856U4GpHmrNt5LLB59Ya3R+fWEhvZ7e4RShElBtuqOxYfRkwRisy4yonmmZxKIs6R3PeHJr+My1/bn9fYyG02yd8l5+sX0+Xcx3vq7NeLKyGafSrm04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=in5jhdXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgGP+z/o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O3VGHx1143997
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cHruPT+MZxPidZtYd/ng3z/8C6BpKuAaj3gZfQJAAG8=; b=in5jhdXPGm+dI+7M
	zRxhPEVg+f8V7PHhb1sN++X3e6fjjKy++Q7aUV8HmubnVCn8QNhe6+xvseF3Lzf6
	o4bR9Gy5yzv/Wb4SRH7FQxBwiOpfp61oyq0MAJLgmb2ZNvzIkU4EbNO2aMzEjMQY
	62+SA0oytzwg/nWCgeSDF820eC2nH34TwtJ/kyHnTPZ18ywKQoWwBrTeP5oknAis
	kEo5FpSlGppaLMFLWvhfPXHI7V7xqaX8SJxnlQkVmbzdWdpk8F+7Xb9mdbKWRbzA
	RjUCNx0bxazBvtCPHKz/I7OAhhBwK2O1Xu7PmKMi+5W5g1NAiRXCjMtFW0mtkTyh
	A+KnKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4568368-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a2eb984so2353199585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 20:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771905927; x=1772510727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHruPT+MZxPidZtYd/ng3z/8C6BpKuAaj3gZfQJAAG8=;
        b=YgGP+z/ob+NwO3dfOJpTuUaLz2Y9a9zEQKGaz0TkMF/zEeSBB6IiFu6IMdVFnQ0sXR
         uwlNriBEkLcRaKVkDuTanI1jcEVIbYIIoN4sg8dqinTviHBShi+XWd6V6HYFvPJcYnSy
         nmGRoSIIImqOt1Q5TnRJiWh7c5xcEtvmNl5T0S7GMbu7ejWAwYqtp92NfiNKkqGmHHIz
         qVYYfb4q1Lu7LWw5JNcer1O0dqqnR+12o0Ph+ou/qb8MvIU5FT99Oseb7ZlFK3FrI6AM
         yfy6XrnYebFspc3yb1sKBqmGG1yBCvvSwZlCAAiY/9nvG2KR2KkC2D3CW2biKuF63zra
         eZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771905927; x=1772510727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cHruPT+MZxPidZtYd/ng3z/8C6BpKuAaj3gZfQJAAG8=;
        b=n8TcK5dKFjEWKfK7pM3dIkjGg5h1DtLFWN/x9HDF8xH+/rTeEcJtOdyJTnHwzeesgn
         /mLDoYaDRsK2K6Ryw8vjMpqJWlnpKww3O/d+tLSsQh7kY8IW7Asp0h1VN/mEFqltSltz
         ws9QoXA9GwegvxGybdgkPkDvbXCldrA6a6DD69KPIa4gCbrifSI3BHN7rJVyplcz3xZs
         xQDighwahaebiTLYL6Sr1v76yGHQiN7Q+jMH17hw1gvJXNaXyNM9eW/caE4qX9aBNfvc
         6zF2fZbUd9PHl3lT2IBUZ56N3nmd3lbo5kr8MTns3wtb4e3xzzwxBYQwThCC52dVfMVn
         JDvQ==
X-Gm-Message-State: AOJu0YyJXvQxi58exyzKLLol3wZkQwdNX35LR4hbaXvY0gU0LAkJ+f/W
	INV33IKWKPIyyw3wesW4d32i2b5TL9Y6fleW24ohay8IMrAB1A8Q2Lv+u7cnoDD/oXWhm3e6cTs
	Cd5CeKxZCS2I9tVHJB6qlEqyQg5YuEXpM9UKYFIgV2cYlQF2v4J4CzbGJB2zYa6h76fTI
X-Gm-Gg: AZuq6aIXRqs/4k9LGOet3jadasv1kvbXQJPJQfCzkvjymDxI75eVZY95/ouqow0zMyb
	gho1BwipWKxkoksYirEcUAJp6+9j1jtEBaOumEEkeJ6ZiuMHxr9fDa12bSNDapbnTh/X7oT9gGs
	BUB1ha10G052SvGltZbDGliOI49Zg0QBAk4gI8H28a73VCrcaaob0Hea/wO7zH4NMiiEKC7rw4O
	agrpuZpbv9vdbed0w61kwbvk8FIPlLuZde9+gRdLLX2eHqf6kBynuZs9pCddiCo4pco012JvbMG
	S9T2ofL6rUsPFVpC9vYFHx5/3utoKaftg4dq8rmXn8uUFLkUd58372rhFgpyPJmLgRUsKgW77N6
	2/HnOxJFtzCI8T3zzkkf2PZ+pYlh/Cr/ncQI/WvvfnemSpwxiKjXelv0Ml92lucseGLW/3cQFno
	8H6/kNj1I8Ki+YiHo+EZNa22LPnJ/h199u05g=
X-Received: by 2002:a05:620a:199c:b0:8c9:ea27:dbdb with SMTP id af79cd13be357-8cb8ca76216mr1543758985a.57.1771905926487;
        Mon, 23 Feb 2026 20:05:26 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:8c9:ea27:dbdb with SMTP id af79cd13be357-8cb8ca76216mr1543755585a.57.1771905925962;
        Mon, 23 Feb 2026 20:05:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:05:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
Date: Tue, 24 Feb 2026 06:05:23 +0200
Message-ID: <177190591482.429979.9121382739276431016.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
References: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jEog4vC5w3MJdHFFIXZBxgx4zbxr-1CH
X-Proofpoint-ORIG-GUID: jEog4vC5w3MJdHFFIXZBxgx4zbxr-1CH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfX371+mc87oKAp
 Xh9gIvq1gp6T2izv01jisybmml3pjR1lQzil1SnDnWeiBM6IejTbkYil7FSc1fQav7oDsTIBdC/
 IJFk9YSk0jR15UJM4e5lW6m8hdivpxSwQbAFscBwFMsFnbWtBJUYdq2Wg63ERgYASkgtcsJ0piQ
 Y5KWpgle8XzeQ/BNZJ/zEqrvBnmPWwOtwxpotOEgn1/ZzmNCIgP9Im9wp7ki/kHVsiLjkKydDh4
 PlPNclG3OD94ykybGFJeiEABLtgGOxgPVvs67ghoTppKhyZm8cAEO5MCMh9e9GW1wo2zWWV8gKT
 TdGYyhz4CWEioocrey/CEyZvErQ4hrNGD8B6GKEUjxuE+6BQVR86Yfyj8KvtymCXNRgpXZaokOG
 z9Npm/jNu7VWGOP11QmDnIT7wtLLYYD+emVHYGoDboZAI+36lpZWhbn+vuTEN7/qJZYQgUt4Hs3
 DA5x7OA7lfMa7L9dZRQ==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d2387 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=UNbtbxbA6Up85joFnAIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240031
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93874-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6ACB518187B
X-Rspamd-Action: no action

On Sat, 24 Jan 2026 06:32:56 +0530, Akhil P Oommen wrote:
> Since it is possible to independently probe Adreno GPU, add GPU match
> table to MODULE_DEVICE_TABLE to allow auto-loading of msm module.
> 
> 

Applied to msm-fixes, thanks!

[1/1] drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a9dece60cc82

Best regards,
-- 
With best wishes
Dmitry



