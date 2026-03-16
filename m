Return-Path: <linux-arm-msm+bounces-97832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPqcJuKBt2mCRwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 05:06:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ED129487B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 05:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A9E0300E3B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814E1336EE1;
	Mon, 16 Mar 2026 04:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irvJfoL3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCYwGPHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558363368AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773634013; cv=none; b=VlXAAEjw1nSrmbe0ryaYuDSnRacykx9bTejYcWVIC7tFw/fvkYeihCSaS9SHESBDZSjETScBkHqJnv89/n2AJA0c2RJcLRGtWHKuKgkuoj4TKQ82daxBI+4WhVH/5xSMu0Jq2b9Mucnxn8k3SZZ2CPKkvmrePvvlKg1FLZQrG5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773634013; c=relaxed/simple;
	bh=JaLgnger58+q+UIWkhi1HwRgoOKLN5fnyd11JV87dsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kntjZ4ZSAPmgL3yz4V2+XqNFLO9XigJYw3SkiRLjSOYDiqKD4JTCgnYEoOy4gBcIXATt09/fYFHMOT0L6vql5bO4MV3MRjpiHxMziJJGBWTlRA4oyHzCo4zEw6xRqIy8LeAGfS9CjZrld0OYfYjq6adLb7ZrdDIK55tj0xE89ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irvJfoL3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCYwGPHJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FMSRMA3972560
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ndkr0+Bc2XuTO21elnXe8eizYrsuKcsqBqzlOnvzrDI=; b=irvJfoL3+jiwweR1
	KxZ3VyTgLmfgKetpXxDVJyozeGUuXaqrG9e5sLeFtBCVvZDvNnfOLQxQpHWbW0ST
	YALzvy3VrGCIne911UGY3lylsV2fXNUWoOr6tZNA0Dsf1Y0ksPCe1rqSj93moPQ2
	Sq6Cl/R+AfjqApnA/xzG3CpAXeCKk1dTuBakNwUWJlTrcLHSZmogk2XXmS6rOTgU
	kZfJEf/5fT/hiDli9yBC1gkFwAyMD8Gv1q8MpMZ10KVYc91iTvOi6nl+bPm21eg/
	d1NXWXLIrSbwrz43bUtQFknxzEHzQ3RNHugrcBVIYWASrnrz6h8PX0/bSd+vD33L
	U+KZPA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bc5fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:06:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c738662b963so2824773a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 21:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773634010; x=1774238810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndkr0+Bc2XuTO21elnXe8eizYrsuKcsqBqzlOnvzrDI=;
        b=TCYwGPHJURno2LZgvV3PAomMGrGVk1v8OvpUlvf8eLvrtA0tEZQx4cQ3+7b/cv5riO
         FhyLYjm32sYO4vFvp4b2947Q2Gzhw1k6PrwpFPgqud/pxx77muc/hj5X+/r16WAbV9or
         3LRjb262l+VPxD6JUz9fmbK9LhIgG/+erMCE6KVKxHf3w82FUIFuRlyyTRmI45N5rMN4
         6VaZ2CiN05ryEBetpExrvwmMr7nUymEaIYSQd6wuI1lYlaA5ZenT7s4CsAh8zg4BC7FD
         NjiUFgylTXy6txR2tqFXooQnIWBIczbFjr6352Qzfs5fCW2bEHrwL71SJvZA1jQxy9rE
         Ee8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773634010; x=1774238810;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ndkr0+Bc2XuTO21elnXe8eizYrsuKcsqBqzlOnvzrDI=;
        b=IKn3lGIiGLd57o7/70t9V8fsv+o5utXIK9cXuaDHH6RW2xtHoBgLIdxiOfJsA/dtdB
         OhZOwbpuN2sVOzsqXOyLbHaUszeHmmZ9fs3/fXGtrXrk6Yb16wlF8LlXYP6rLd6bO85U
         UZuvf2nUK2PGALZU6YWdKzZyFIMXwMWQCCkrdYxd0v3yQ1ve8LI0mYMhKbmtmdrzn5OD
         Qt7S2fFtVgWyxDgCUpxmWQa0I3bUlfLiZuVAoQVA/qfLw84E1RLQR7tjSGDSbiXTgKhy
         O/ldQkLIxDuk8ORkQn3eJFO1tfnxhXzhDZVZnwMA4Atwcu0DY4faU0Cfw7f+u/4GiLHI
         RD/w==
X-Forwarded-Encrypted: i=1; AJvYcCUqbyBAssY6rJhBeOPvLnVgMjOvpdTdVDqOosXTTX5WMLdC+7ODsAdJL385ihIT4MnYMssPbGmjSs3oo1FU@vger.kernel.org
X-Gm-Message-State: AOJu0YwABfijxaglBOJ3Q8Anx1nGnW+3h0XGBS68R5d5z9YdALxbSOX7
	WB0xWCaO+NViytuwPtq/Dm5drOkKA3gnLUj4qxTt66WXkw8B/RgC2xkG8ARIfMJXrG073MZ4IVC
	pcG3eBQ0waYgMyXuGpjdpwlnLDQYIaokmZ8BizwNeTshZGJBDC1jfcThUnVXhOwC2Jkcb
X-Gm-Gg: ATEYQzwFP2TVOkDxX4a76eZKiTLQGwpuaRqlzjTf3kgfBCh43s98yyW9N6+uaZrq3eD
	sc2JW5WlquvR209tyiUpPhAqpflgXJhC/LUEEu2iOFec7Qp4qOemftfGOBEdKDCpOkyBjnFwQWi
	/7LnTCeyszB+NwF1OlQl9mrXxfkG8pwRVH4vk+99tzdLbhLhyCFICFGnXPizLzDoYUFXGBZOPwg
	zm778niyrjyxf+KGYdzu5yqkWkI0p0i3mREpHMQ0nS4wpTqqFwRRvXHpEjPNI2cdIFXhl50kxDm
	UEYKB+zDwO3q44HUtUa+h4Badh/hu0P/VSoA+lg2q1s96sYc+bEjOGv4IgU4EFgzT4dmkd+kXqA
	HLjVEzvjZbENQJ2ln7L/x1BbcqmsVBZqanj6j2EgzdCFSnLfLCA==
X-Received: by 2002:a05:6a00:c84:b0:7ff:ecbb:1c28 with SMTP id d2e1a72fcca58-82a197298dfmr9631231b3a.16.1773634010173;
        Sun, 15 Mar 2026 21:06:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:c84:b0:7ff:ecbb:1c28 with SMTP id d2e1a72fcca58-82a197298dfmr9631201b3a.16.1773634009597;
        Sun, 15 Mar 2026 21:06:49 -0700 (PDT)
Received: from [10.92.199.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725bfd0sm14339943b3a.14.2026.03.15.21.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 21:06:49 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mhi@lists.linux.dev, Rosen Penev <rosenp@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
In-Reply-To: <20260312045921.7663-1-rosenp@gmail.com>
References: <20260312045921.7663-1-rosenp@gmail.com>
Subject: Re: [PATCH] bus: mhi: use kzalloc_flex
Message-Id: <177363400652.6449.17696320046026788438.b4-ty@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 09:36:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b781db cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=K8mwyqB7UndrMnxzXikA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyOSBTYWx0ZWRfX1qKM7jh6+AMk
 lA/8/twrsO7gM8XxHTyNzp9eP9rjA9oaltyU4hGfsAwwqRD/jMZ7inY+ezFDFr9YGWHFWmmtqSd
 dFGrI3wJs0xfdLpLrkZ0e9m1F7zOX6RS4oRfoHTpdTZNoLedaR/Z+Uacmm/1jRJx0HY2i+GCVjR
 YOlLZKF79b1iqjNXctXDnwxOtjF5q9QgKUYrIn8/H02Wc290JIwnknS6IFWYx3a0WaHmdNITBc7
 EvZwbjEFRO42fBBbqPDPbR15/yxqJJenpc2wpIqzbxUipNU6YiQxPcx1Y0s/DpFCstHued3wtJc
 iewbo50gkL5oKQzsnQCcQQekt2RrE8Jc5On7kGDqz+hBvyjKbOMakY5s8m/z10b7/2fncZAM36c
 6f39mG6rkYEQjFgLHjslpaKCtMHwgLCMm76bpDgKYOywZC0nirgl+FtMi8EMvD1vLvylENAAdqz
 VnKpqyxKRxS5t72KZiQ==
X-Proofpoint-GUID: ZdRCIqoLVjsH1av_UHGmSIAdr-mVqKUD
X-Proofpoint-ORIG-GUID: ZdRCIqoLVjsH1av_UHGmSIAdr-mVqKUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160029
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-97832-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05ED129487B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Mar 2026 21:59:21 -0700, Rosen Penev wrote:
> Change kzalloc + kcalloc to just kzalloc with a flexible array member.
> 
> Add __counted_by for extra runtime analysis when requested.
> 
> Move counting assignment immediately after allocation as required by
> __counted_by.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: use kzalloc_flex
      commit: 2f5ae4827e94955ad3a9757e06da90a5ebc4cc6b

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


