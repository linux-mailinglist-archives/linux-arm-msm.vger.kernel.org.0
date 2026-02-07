Return-Path: <linux-arm-msm+bounces-92122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGIjIboWh2nBTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 11:40:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE0C105932
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 11:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51A03301DAD4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 10:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E7533E351;
	Sat,  7 Feb 2026 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYrtw/AE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTi+NYna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5419333DEF5
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460855; cv=none; b=DEYsM23Btxr6av9ZDiU6e3DweO9RY61UcvU5lGCopUDLK31kC5iQXp0LZHeojvfiYDFFCfaUS+jpwLYyBcIvJGyKfgPtavClPSatp8wHoDQYAgt6Mw2U5WmBZZTt3HeobQuS6YCLNRri1RWhCsiEsvQxz2yxy8i/TdRncQrymUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460855; c=relaxed/simple;
	bh=Btnq49XorOH3N/Gj+6SbZqBgjJYUN/tq1x4NuTSnaXs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZvV+q10kJACjW3E6BvLvqUgyorquMflDKPwr1pkK3KEC8KnVsxh0D5NQbvO6AmZbFM/GibRwKC2Pm322ua7/ewGBQKQAmYJ7VWs4SHjecJzRl6HaUh67Oa24To3ywOmAULLJRf9hWFvA04udt0htYpiKvnT1MryCLwMa0LwKYkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYrtw/AE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTi+NYna; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174PSCf413658
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Feb 2026 10:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCw7wSL4eGHs+p13won9KVzKu1j034CJcclFyyJMlEs=; b=GYrtw/AEZqpHs3Vf
	C0yazVgvvhdM4ledK+f2K1QS3Mzh1vJq+Vgc/CySD6Ja3Zqe1doQUwncaXjxduKk
	NB3Vl7+UlP26dFgfuvUuzzMez9vrNchFzHF4/x3b+YxLrysEvHGI9d/IXvTQ5eKx
	7itDffzklrsDoLFcekTQs+KmMKfj9Or3DSkI9OraBnVL6CwNlx+ERqjzujNI4YGD
	DwtI3f8cwCv6aRJajkXDGMd+kbvQ3V9rLWdbxR2+GhkKmD+ZmP6dcoFhhWAvpdTW
	Ri+9S7eb8yTXI6QwEynS8eZ2BNyZG9NTz9qOqp3jKYwfE1kAh2Wk4Zwwt9iFs/KF
	DzXd8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb4rhy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 10:40:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70a08daf3so729044385a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 02:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770460853; x=1771065653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCw7wSL4eGHs+p13won9KVzKu1j034CJcclFyyJMlEs=;
        b=cTi+NYnaePS1EKNVJ+blcaKTOt7lDPdQ7mhDvq0LAqkhgZx0FCfj8tZm2qTfAPbJ13
         u/CpMv+ohgXMxOTEJUmHK/Vv0/hJbIDF/xRd16iIwAUmG16KCxm8dCWwrD9Zc6f8B1Ze
         WWxcOdghQoQh4BJePUZWn2GPgTiybYuQoIHiFGOXTUle0cOsRG9UbHKesApyvS9SQAAy
         y/F1Iu+l1C3pNfSmxKGWQqMBNBVa16CJ4r18DBchq2ocQPmY/hJyHqZXy40ZxdSUa47w
         HlsmF/726vXEwQ1tkKyzWpDA8srg4xe9fE5L7iG2/PYLfReUW1MVa8E7MgaMs92mkSXN
         dvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460853; x=1771065653;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mCw7wSL4eGHs+p13won9KVzKu1j034CJcclFyyJMlEs=;
        b=OBj28SnjyajB8VjQ90cPeR2dtquq6JwXUVdhWn9/8szp57+KKJwq/4GHcUrL+YBGXa
         qEd72HjgsfmZi3sTX2xiIqd4jw5sEW4FTGDV4Q0/v5C7jnrHa/Jl2IkJ3Lk9v31AyLJU
         hVAkEzOClroJWgd22dZG9id+tCOVf72zWNU8QMhpSPHiABd/FQoI45/QAKSkgochm34h
         ktxvtCH7WS0i94e+yAjWrfK3kR6KYBpbYleWSx2mZAyQ8+WotDJz7ogKFX4HHxgxQrP9
         Vmq2LfsfkxwV7Y+AMIE8gCs1nLhf7BjCHsyO9rAx8ogE0I2DzxbG/FEXwWEcpKr1K/tl
         5dnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF7Teqpewc/4B5kNp1IKG07rkjiMCQPV4+zm+jwAuaM2+Lou1CTYCPRXHJVIjkn6j2vRXvWPRDEr88RIqu@vger.kernel.org
X-Gm-Message-State: AOJu0YweiM5Lebv/UndtlBCeKdqdsSY3LNhH3v5rS5Ty2yxqyT/eXNJu
	BSxBnWzDkYL3L2LEJgIW9h3ocNNZ3tJB2/lJjRObIjwbyt56jA+gsTnuSx2Z1KoM4tSq9ZhV8ZC
	quinbF2JvcORGG9VauvR0hL/fbyZzhuKsH++o/rp5uTawxYvo3qkYNGYD9c1oOF+TJWQ0
X-Gm-Gg: AZuq6aKpfMzbRRxHsfS5XfjRpEb6l+LOvnWzEfcX+bj5v2/X6BSyNii/OOnce9qfFjQ
	qj/q0I9zZAucdxO/wKRXdq+3IfYLUtk7/FxvAn7lmYvqsiYJ+3gno2pZwnEEGfgkEoVCKWPZJEF
	nbJvH0SDWHuQhQU6MNCu432YbMEHK873TJ9kNiQhCYkrRU4rNI2s6qlnMvEhiwvdgE6mFbGQTvK
	5FWkc49U5Pmg+kA72X7uOcoBZO58HAh+2fQcy7+ZLcTf9G4pIfk98fBSgU5CMwRxRaSvUe+a21g
	pB8QjrGJmaodfhilfPNQYuZnnhpqmCUdlPWVxcdG5j/2bo/Y9/a4wdexBAw+1JuAaknUd/Ehpxh
	DJa0qAfKGGLQBMo6OZvwMHr+JKQYxp/OaaALwpbm80vXVtJZXCRE69+U8PQtVMUPaCamYTdG/Jl
	/y8uedzfihwk9inhpcg9pLGv8=
X-Received: by 2002:a05:620a:700d:b0:8be:6733:92ab with SMTP id af79cd13be357-8caec1bf257mr730166485a.0.1770460853605;
        Sat, 07 Feb 2026 02:40:53 -0800 (PST)
X-Received: by 2002:a05:620a:700d:b0:8be:6733:92ab with SMTP id af79cd13be357-8caec1bf257mr730164685a.0.1770460853192;
        Sat, 07 Feb 2026 02:40:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6feasm1244990e87.7.2026.02.07.02.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:40:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
References: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] drm: bridge: anx7625: implement Type-C support
Message-Id: <177046084993.2611002.7265880027469077346.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Feb 2026 12:40:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: wEbmhfFhFR0XSli79G32f5Z3HYd57FCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4NCBTYWx0ZWRfX69LtslhMP2bn
 MuRp8kUbdn06MRtS6WzlSSYgOjqXMFl/fLFl7x2U/FkIwbgN4lAMFBkxBgZxk+Ym2WKIT0LDzwp
 RVoQXkDXdkcNzi8x+wysMPi0RyIo3okJ8NMxQx3AgAvIFbATJn6zF1yDlmnCtCcK733a54k09nj
 2wNJGL4zZaKrvewv1ZyVs7nEiG0YtBABvmGwUC14DzDVkT1Z0drgnmtEtDgDxEdR1sMrth/VjjG
 g9yEQIv9ZkMeUpou09QtSMyTzwekUU84qLl+QWwBxYX3SjMrX3JXviM7Pe1Phegym/ZLUHEFpq4
 K4+PQSwk05BAcFCNJyW/M/jR3Ykm/Nji6ef0HqydWp1Czu6VM4aVdVUHE7AMFTcjw65WlJsHyen
 Bl4S54EXfeR2B8Ytv/1Z3WG9TCYAQ4c17/4bDwNanM1HI+dCheS0SoPmihdTrR7Vi8gT7s9Rhzd
 /fszNZ7QV+D88U9/YJA==
X-Authority-Analysis: v=2.4 cv=PYLyRyhd c=1 sm=1 tr=0 ts=698716b6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=_bsLKE6ODhMN5xNVZ6sA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: wEbmhfFhFR0XSli79G32f5Z3HYd57FCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92122-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,analogixsemi.com,linuxfoundation.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDE0C105932
X-Rspamd-Action: no action

On Wed, 21 Jan 2026 12:15:44 +0200, Dmitry Baryshkov wrote:
> ANX7625 can be used to mux converted video stream with the USB signals
> on a Type-C connector. Provide minimal Type-C support necessary for
> ANX7625 to register the Type-C port device and properly respond to data
> / power role events from the Type-C partner.
> 
> Notes:
> - I'm not 100% happy having Type-C code in the DRM subtree. Should I use
>   AUX device and to move Type-C-related code to drivers/usb/typec?
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] dt-bindings: drm/bridge: anx7625: describe Type-C connector
      commit: 1d7532444a32b53ff7344dc52019bab5a4b5ed66
[2/3] drm: bridge: anx7625: implement minimal Type-C support
      commit: f81455b2d3327a5685623e7db4050dbbe5513bc3
[3/3] drm: bridge: anx7625: implement message sending
      commit: 8ad0f7d2e6fdfc4462a5b168ec64d73b7e952ab9

Best regards,
-- 
With best wishes
Dmitry



