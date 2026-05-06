Return-Path: <linux-arm-msm+bounces-106060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLTvKDjg+mmGTgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 08:31:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DCE4D69C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 08:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88A68300A8D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 06:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D422ED154;
	Wed,  6 May 2026 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4BUZ9iL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhvGnFyH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0500D19E97B
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 06:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049078; cv=none; b=EfbtlmiffmRJ7pmmgDc90pg4C6x6cEzPJUdJzY8Nztpcfi32pmX/ALpnh1fC4puZAocSvBGizuw+b/zbgb4IN7f8ryDZJxjJK6nDnqu/4yXOhVeu+ZVdqXrganJuGpLI9+rvnL0Sso3A7I2oBkXaVTy1Qwxdub6fz2GjNfLzHwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049078; c=relaxed/simple;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=Message-ID:Date:MIME-Version:To:From:Content-Type; b=GdJP/FXujwF3JiQTRduxc1YzV1c9VmwtUuWD0Gvqb+5YeDRWyCKmdFSjCMycG7DaKe8S8kY2BDNrbA/Sz05T5K7fwDVq5Let/K6Ix6qPetonZ161p1FylwiFkMltdKr0F2tVGxafYPt/sMVE191CqwgKRsTsGIwFtFPl7QtF2aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4BUZ9iL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhvGnFyH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645N8c7K911956
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 06:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:to; s=qcppdkim1; bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++L
	fAOrCAj6OvBfk=; b=K4BUZ9iLFH+WsppqUOPyqJ2XtgMm5nxRpkZhaA8845dF7G
	PYD0lHS2FOeOd6SO63I/JLoYDDwLNcnO31FLuIe7CD1OfcuzGfUQq/gX2a3jrY3h
	iQKKawLktM7ibrOmvGapJzJyrjs0K+8D5h8B6crV1ZTCAsnn3o0XqvEvUOor6Wc6
	cNly0pG5g0BpwMa3kdvzFjJ+1jGORY1rJxbSwu1eF45IK8CzZdSvcAYhgwaEPXWX
	8rFoXnJ+z2+hC14PvJYHh8Fokt6oa5+vfqtnJn50dRYur8lrvUSGsr0T1kWtN6Kc
	Eai4i9UaQBM0t5VrPTIGTLCbHSfw1+6wgRGd18QQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj7jk7tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 06:31:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fc22424d9so14414867a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 23:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778049075; x=1778653875; darn=vger.kernel.org;
        h=content-transfer-encoding:from:to:content-language:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=dhvGnFyHFjTCp2HvS9E37F/OimdM8HWgOM09FdgLcAEhoXRY1iqW4P2AOtek4+UcU0
         GBEr+Xydvr8BFJWW7eD1c9WRPuP1m2X1EAzmtUymu/mBMzs5ru3BBd2ckv31ukJ4iq1+
         cmVbw2QXz8J2k4tLfNN6mgdmb77ka5Dn74f4+uvQR9brIPDmF+TIcYJZxwZQeuCHtfbZ
         UvZT1f17KvfFDiJumhmx6M4TlnErzHMZNu0uS2ChftWPPLt0JTRPt8MXtVZAh9x7yDMc
         lvxqyxJPcrwIWNkiR68Y7XTQ1PqgJ2h1nTgpfzR6GY1V4TVUvjFlANm3DeReceyTe5FL
         CZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778049075; x=1778653875;
        h=content-transfer-encoding:from:to:content-language:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=iCWlVDm2D6uFLWsPVZvR9Wst36RSmX32D6DxyG6Fr1u1vipyngjpMFuXcJt4mNz/yS
         byVUPVolsvaf79AP6PPn4pblCqoHBl4vheqZCUA7Nv4ckGqyfu6irwC/rh8cRgPr455E
         e4k0oaUePOkcTzYZc2ikpW8aAIsX5FxysiCr0u7w0/HAwRE2QbRxWeytlkzGEWl1dqax
         b6ol9eP0hypgoku2qj5+ZGmhXSl/MVBZv9VHyaLXnPfXdPkQGC3U4xD9Vr/FjmAT7E4N
         /+cAt1aoshydgqLKWDhCnvh+X3Jo6rLE7huEqLKe90lTkGz02NWIzh3WjnJdrlwE+sFT
         J+Fw==
X-Gm-Message-State: AOJu0YyNfJ2CQX3aIgRArzQTwrt6jy1gRPBk++KKxnepFxsF+2PWUmDa
	MSJank2myBzGaMuJTozBGtlbuFgbN9h9q6v2NnYdxIBSTU2Y7CMOf2CFk3cQOPBWsyXP07WwLSV
	gqsTqaCrsbPBvrlODtflvx6RNs+aI7/tbmr/yu/E31/f67KV4Y92dq7LUjm3c3Y6DXX5+uXWi1J
	wpG76afw==
X-Gm-Gg: AeBDiesavkFXnAd96rW3Xkz9mCd0lwIjolALH8ZfTDUXhhkH9IKFsxjqe6cF+PthUDy
	y3XyS8hwWDGILnDyzIaUiC4eO1sLuYdUicRFeDTmhs5f6Yvkeh1b99nHuaLQdeHae9a94oOpAAe
	sOrvI+eVkaXqbgUZOtRdMcyMDvMnTGcRpFzmlkNQEKEj5Ulbr4IhncwiCp1eEBoZgusZz+P2Z8o
	01OfiV/oPVKdOyp07LT8dzju9z7cRiVxr766OqjCG/NEryhNJLSAe0LaDZacHYzfXEHsfciyH86
	xDGUUlHPgTXFwvFzLotazGkn08TaRZ9IdRKKrNbJPnjp9VgMhYpGlloOpAdvQ1rX4fw3c1OJSUr
	thdPQWy89BGOFmNoWmH3B9ggvdjOrmBeo60IgzAQ=
X-Received: by 2002:a05:6a21:6d88:b0:39f:3efb:e888 with SMTP id adf61e73a8af0-3aa5a983571mr2087918637.25.1778049075224;
        Tue, 05 May 2026 23:31:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d88:b0:39f:3efb:e888 with SMTP id adf61e73a8af0-3aa5a983571mr2087881637.25.1778049074725;
        Tue, 05 May 2026 23:31:14 -0700 (PDT)
Received: from [10.151.36.91] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82429cc386sm1106494a12.0.2026.05.05.23.31.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 23:31:14 -0700 (PDT)
Message-ID: <a4ca7dff-8ed0-4b8e-a9dc-5f4eb25ca78a@oss.qualcomm.com>
Date: Wed, 6 May 2026 12:01:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-arm-msm@vger.kernel.org
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA2MiBTYWx0ZWRfX3iTS2gEWOGyU
 45V4O8V0eX2U3Qbfy5rZB+E4LFzRLmTD+cUJwqmpGnPtIyGaS78ey8+/l7NoLP4e7WQFKiDPgxt
 9EvJ+215fv4KuyvCS/9B6eURx4X8JFR/i3RVo8cKs9akZGB/T9PRrX/d9d6hby3eON2OCRTsT7N
 /AMmMPhRT43E8OQ2pXioCG57bU5ykpJkvoZWolfaPEg0ndPHvB7li7ISj74zM09nS0/F/7vE7qK
 RKLCshbPaUCCNQNuLmF0fVFyPY8SgQrz61QLcOId//uGBORIf5PLqSy39zfeeqfPTeyml+nc5gR
 R6y4ruPoH8pYCbxGLfJutszW5dAtjxXyq/DldQQfbUhr7OeHp9ie5DqmR9HQpQB0sLrXAyhLieK
 suXVswYp+FcIx4UQbikD9jJSqK6ALM8W9mV6bWi5OsOjhvhshw8hW7Vzp7FtrFi1+xkDk1MZhQP
 zrd29GrVCkKlLcZRPGw==
X-Proofpoint-GUID: 652Hvi95SN-2s9KUuEvFPG0nSuxDSCpa
X-Authority-Analysis: v=2.4 cv=FpA1OWrq c=1 sm=1 tr=0 ts=69fae034 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=s5jvgZ67dGcA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JV2eVSZHMSyV4Tj97bsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 652Hvi95SN-2s9KUuEvFPG0nSuxDSCpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060062
X-Rspamd-Queue-Id: 09DCE4D69C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_SUBJECT(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106060-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SINGLE_SHORT_PART(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[md.alam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

subscribe

