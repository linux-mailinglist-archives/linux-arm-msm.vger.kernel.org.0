Return-Path: <linux-arm-msm+bounces-111321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a/LZLO5zImpOXgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 08:59:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1874F645B91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 08:59:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="GJ lyd7w";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="I2ixWB/s";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111321-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111321-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 780ED3022FB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 06:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7380F30C179;
	Fri,  5 Jun 2026 06:51:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7E7426D2B
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 06:50:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642263; cv=pass; b=aPW9a+bdOn/oConLmyv1UpSQ5H6LGIH8TjhIv585uBWejQQ/CyRnDjCmTH4CIbYQkGY4lLo55ix9Zyl9olaG12I1Lco8He46+F/NfBYguw4Lj4zqtP/NX0g32CtIm4a9Z0O7KuiMy6PQkDRpaPMysBGcKgZuMFoYY/0sU4GFCl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642263; c=relaxed/simple;
	bh=cDUKRqw6f/ibni/50fapJuRjmkDUOXiade4dIJq3sBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtzLCKXgpeBqrtAFTNmOdj/Me5C2QzJPRgStZZM0eG/xPz1OiMsk9xfAp2vidQ4rMjttFwY6AfJLxNuvJYpXXs+giCjTKoKhtC47Vt+YEHRjAXDo8qyFluN6gIbhQKja+j8uHOFjeQnlOLrg1zkPrUnfjJZuSIraj4yHUP18RJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJlyd7wu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2ixWB/s; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6554isqd2667044
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 06:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=C0PixtaCHTZbkLE7GHSnrZq7GqB2sS+e9Mz/CFsulb8=; b=GJ
	lyd7wuuvendePSqfJ0ULgItlMswN4Mc3/8yNiOEYRbuEKd4g4BJ1RYhelcxJPKHp
	rhlM46BjIODHFFQjsRj/RMNjV2rbeUV0Ogy2onUM13e1ebyngeA2qdASa07Srnf4
	+escoGxtoTySytgs0DR6JuydDOSrMbe99E+uoyN4le1wYD8+NLkEE0ucxU+TXhdp
	e/jjF/YlzYVqwpoI4wR3SxEApLJhKquecc2r3guFKJLPFad76g16WMTsTxmEKaVg
	rOzXDXtFax2TFQqZYl2HNc+1zFt0TysGOn2HP0BOCsk7boGdz0nfWtHLL9ad+LRL
	1rGk0Pu5TVhWgXd1N2jA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekemytkv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 06:50:57 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-43d1e8bbb82so3246301fac.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 23:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780642256; cv=none;
        d=google.com; s=arc-20240605;
        b=MQirq89wLEI+vXLArA61aZ36IRw75VHwoLrHcny8UlDmAAZpp/aZ6MTr9FYKzO66lP
         Wmo2HrQzm9bt7gol8Ldg9ZtPIkfMpJWULcCLclPGi0rd3Zdof/NH1wO4NDgHkDa9A6Iv
         Ndo7nBcXJyxRi7hPOP1OGviahfQlWLOe0k1DH2ZCGNSmjgRpfkE9JadTsPphvrhGBwq6
         aNfXANUOewaNJAmRW6Ea7E5cYFFbD0mA8neLyDMsemsyFMXJApxc9jJyVchy1X0x7WNo
         4/HDso3UC4Ap4tezgsSGFhR1bk1hCXPd6upPmX4pzNXN0CXaIjdHSymj9qLQd8pUFBeF
         G7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=C0PixtaCHTZbkLE7GHSnrZq7GqB2sS+e9Mz/CFsulb8=;
        fh=8aTICImIL6SWbIcTXKdZ0RBYS/6gWxZdx5FWT9h06ms=;
        b=fIXHA/JIhi8U78yK6vRtETFDoupIresk6bRWDRVtst5+aaqnjveDek+3nvbFZ/gB8V
         9uxFf6nT6Rs/rBveQ2yTBgj1hGlK3f+zIbHvoZ06/u69+fWf9U3Q2I7YlKGo5yRUzEMt
         FPHUKKVaQTGur/a0xtHnEX478obXUOp3fBs24GGqMChZdRK9RFCVDfNrTj4++F5b9ByF
         o8iXKBfBKfWP/inK4UX4d6QUTZJtqWGZhJbqGdfbO3kaTPsy7MyVixsp4BLebv51Ya/E
         lIFeCUovk5VsSR5zreSw/bASW+C7sO7uff4+xdbS00w2xwGEwzc4ZgnQQ7wtkSSlBB4T
         1PPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780642256; x=1781247056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C0PixtaCHTZbkLE7GHSnrZq7GqB2sS+e9Mz/CFsulb8=;
        b=I2ixWB/szEYUHFTcq35qOQUMWovneja0Yc0wxagiHKRxPTSAGOsOcyi7/Ot9rAd6cu
         wyOzx+KpideNhpmln1N82yugXTH+jNYUvA9s9a5MJm4QTLnz0tUXMfsm1J3PFgNy1gtU
         O0Fb9dep0Ckh+Dam5oGFHfIznavV8S4DMZxzZ6Urmb3QABxi4g4ZY7xMV9IXSgr831GR
         QZd3alWe81Z/URdlZzS8rvVkz4bQ2fl5xL/LeXDGwh5jRBEzSI/xcPK0L5BrwLcwuG9T
         42D+0bQwh+EOfRFvtzueXpjaDFVLjnL3xSt4Ak8xLvNhn+8FMKSUHitNFqQCWRcsoium
         y3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780642256; x=1781247056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0PixtaCHTZbkLE7GHSnrZq7GqB2sS+e9Mz/CFsulb8=;
        b=hiQ7y8uQ0Gx8Tm6rLjIxNa7CgWXxq/fRAAh5I0N/B70MS2AWT4W5fooUxeDsu1XxQ2
         +eMt9Cj2l0VOJXPfymhmW0oIMQG9mO5KU1Lk0tAD/QGLZ1LxY8rll6TDj+gKT0h83GhN
         2DjqAFg3MaeLuvosjGYUtHfQHWStwvH5dvuXQGCJ6A8n1N++5kckxXdzBzwTQU+lxsYa
         38xYeFh6yqhZIuu1jKb7lceLmMRsXrKf19V1AyTJk2tnyjUTPyyIdgFhOBcwTpgAqyR2
         32bxlrCAE4REdfAb2qDeqUkmg7BwDab4sGWAMhiwsdiB8ASGpqZrxbNaJoiQDqGLC5tI
         2ybA==
X-Forwarded-Encrypted: i=1; AFNElJ9c4d4JcV4equsnFJ1DxnShKk0ISDBtquPIUq+jir0Rz35Gh2BGiyUs2TEGNAGHTE45BgaGdFL9zt2kB3Wk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6CTZ75MWWdwdfOCWHzxtubzs89Qp90yJvMI+2c5jeWew1QPQ0
	zbRgFnnDH3xU09SuaiA3hrF5jlYI3kKtctjsVIO8Gl9FnxPbxFYnkRU53eqXVOFgjE6AuU02wlT
	Xks4pTSu/LRFE3AIgleATW6aUZQ8NFGUCVwc/Q6R9LH8pWeNH2yjlV4GR5a5HdIEjrWgJG75UAM
	arseP8uGh25fXTJ6OYC6xWLk7jtdUFmm9+e3rPQZbYipY=
X-Gm-Gg: Acq92OHTTs0jWxpy1QynCmyieYLvOeSi8jAzexZmktiHbCW67oRQp/OtyoDRDJD2blS
	Zq4DhEnSCuBIYjYxjb5PS7TmaWJpwVHv+jRm9MXDDh+EsmuGKG6inQDXYpJ/MahIq6yNZd7U9mF
	twsoZdl6R1O6XfoXfUCxq4Q1Uf2D2odE5H2NEUE/7p3QpYMLFKW9BArOINHFhagXLLlzFQTIJ1a
	NCFieCdG1R04wg=
X-Received: by 2002:a05:6870:390a:b0:43d:2ec2:ff3b with SMTP id 586e51a60fabf-4413dbe55dcmr1123250fac.30.1780642256509;
        Thu, 04 Jun 2026 23:50:56 -0700 (PDT)
X-Received: by 2002:a05:6870:390a:b0:43d:2ec2:ff3b with SMTP id
 586e51a60fabf-4413dbe55dcmr1123231fac.30.1780642256113; Thu, 04 Jun 2026
 23:50:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com> <20260605-assorted-fixes-june-v1-5-2caa04f7287c@oss.qualcomm.com>
In-Reply-To: <20260605-assorted-fixes-june-v1-5-2caa04f7287c@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 23:50:44 -0700
X-Gm-Features: AVHnY4KWQZlB0Wu2YJuzc7z66ane5XslCOJNlcmVyKrJRKSGHNTDKEy_LRM8m2M
Message-ID: <CACSVV01dbQcjE+nTic+9R4VfCtNGvpwODH8BMZi8B7LFtcCCfQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/msm/a6xx: Fix IRQ storm during msm_recovery test
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: jzFi1B4DXdzAvmq3UqLZrB-2J9GFDbUk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA2MyBTYWx0ZWRfX2byImr4n3Gih
 g9/lgWSCF34mf2zoFT+GLJrahjOO8DUv0Y1AP+M/8MPBWsBlGydidLW+rKfAEC771NVmreEWFTY
 vTIp4/jEssdgx38H21GM/FSLG8oNMyKXx93XGTkkNpL0zneRDvS+WE467ivMZ3aIIXOJpAJt0nS
 1BDHT/w0mpCI8XGbT+c0mMcJ36yuZud0eil5z6YafK1ZwD/+7Glk16nWzDKvMSy0qWqX+yvGmLR
 TDFChqY8Gemdz6CV1pMutLdj328KZU2oSHIQfKzyth1XKzrJxvlGPMr/thuEA5JglTOEH2KSAR2
 fxYdLZXouN+eLxnZptOngQCdICfL/yuGVdMBqN9eq0RgIwsJcKzpthZHX+1aqrs++wjarCLgDjJ
 r8oxgIFSxhtgLsRelchJ0WjgtE6oYa6Hujwxmg1z8Z9VYRCiXbpTjv8NhxgqlssQFmY5vJEuFhi
 LRK4WE5FZUfjisk8r+Q==
X-Authority-Analysis: v=2.4 cv=K/wS2SWI c=1 sm=1 tr=0 ts=6a2271d1 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=q3ToO-qe0QkLoiTUhZUA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: jzFi1B4DXdzAvmq3UqLZrB-2J9GFDbUk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111321-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1874F645B91

On Thu, Jun 4, 2026 at 1:10=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>
> Once a hang is triggered by the msm_recovery test, the gpu error irq
> remains asserted and triggers an interrupt storm. In the worst case,
> this IRQ storm lands on the CPU core where the hangcheck timer is
> scheduled, blocking it from running. This eventually leads to CPU
> watchdog timeouts.
>
> To fix this, mask the gpu error irqs during msm_recovery test and
> enable them back during the recovery.
>
> Fixes: 5edf2750d998 ("drm/msm: Add debugfs to disable hw err handling")
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 5 +++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++++-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 5 ++++-
>  drivers/gpu/drm/msm/msm_gpu.c         | 2 ++
>  4 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index 2c0bbac43c52..f1df2514c613 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1275,6 +1275,11 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
>                 status & ~A5XX_RBBM_INT_0_MASK_RBBM_AHB_ERROR);
>
>         if (priv->disable_err_irq) {
> +               /* Turn off interrupts to avoid interrupt storm */
> +               gpu_write(gpu, REG_A5XX_RBBM_INT_0_MASK,
> +                              A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
> +                              A5XX_RBBM_INT_0_MASK_CP_SW);
> +
>                 status &=3D A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
>                           A5XX_RBBM_INT_0_MASK_CP_SW;
>         }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 8b3bb2fd433b..9a4f9d0e1780 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1911,8 +1911,11 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>
>         gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
>
> -       if (priv->disable_err_irq)
> +       if (priv->disable_err_irq) {
> +               /* Turn off interrupts to avoid interrupt storm */
> +               gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, A6XX_RBBM_INT_0_=
MASK_CP_CACHE_FLUSH_TS);
>                 status &=3D A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
> +       }
>
>         if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
>                 a6xx_fault_detect_irq(gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a8xx_gpu.c
> index 9e44fd1ae634..0f6fd35bd587 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -1211,8 +1211,11 @@ irqreturn_t a8xx_irq(struct msm_gpu *gpu)
>
>         gpu_write(gpu, REG_A8XX_RBBM_INT_CLEAR_CMD, status);
>
> -       if (priv->disable_err_irq)
> +       if (priv->disable_err_irq) {
> +               /* Turn off interrupts to avoid interrupt storm */
> +               gpu_write(gpu, REG_A8XX_RBBM_INT_0_MASK, A6XX_RBBM_INT_0_=
MASK_CP_CACHE_FLUSH_TS);
>                 status &=3D A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
> +       }
>
>         if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
>                 a8xx_fault_detect_irq(gpu);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index 9ac7740a87f0..48ac51f4119b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -552,6 +552,8 @@ static void recover_worker(struct kthread_work *work)
>                 msm_update_fence(ring->fctx, fence);
>         }
>
> +       priv->disable_err_irq =3D false;

Ok, so we rely on recovery to re-enable the error irqs..  that is
probably ok, given the intended purpose of the debugfs file.  And,
well, it is debugfs.  But why do we clear disable_err_irq here?

BR,
-R

> +
>         gpu->funcs->recover(gpu);
>
>         /* retire completed submits, plus the one that hung: */
>
> --
> 2.51.0
>

