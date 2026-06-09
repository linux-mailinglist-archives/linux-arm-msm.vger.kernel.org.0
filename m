Return-Path: <linux-arm-msm+bounces-111988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FZuRE2BcJ2qCvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 02:20:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC5265B518
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 02:20:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Rq +JHq3";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="j/7r5c1m";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111988-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111988-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B46043020D4C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 00:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9CC23395F;
	Tue,  9 Jun 2026 00:20:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF1A21B905
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 00:20:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964421; cv=pass; b=HJt6hx9jtOC+0Pep21q+HEKP9EspjcdHHdcoDaVviMWSesM60fdDLr71pIfdYoL8oviO8BAed3AdPU7286xsCqSDJx6NqD22uK4mbSyuEtrgt6ECdSNMUIFu9eBihDAAo2TyJ/uRlxzbpNUc2uHDp5XgbvGNflRcnflxeD8y2Cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964421; c=relaxed/simple;
	bh=mWuBvGA5S4JS/qj9Gs+fFDadYotywah/y500/ko9rJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYZMdXMu+UbHXaMWPVG8UsJYVLuYTpvS9b4O1CxUOGKCR8E004+/rR5iCneCkpIDKmUET4oJTV37fZbK+jpg56NiCSCg0R4JzSOd2gIqMXowqB/031/rqY/5n/OnOB7Qr/4qeBDw920RgGrFfJx8n6bd08xhWfX32EnidtNV8PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rq+JHq3F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/7r5c1m; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658NEnfY900737
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 00:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=g/yDs1pWMBxtNUmoY/P6JmCwRYdd15PIPXQOQYf5Em8=; b=Rq
	+JHq3FVu1wtkznk8o8bpLJz7b7J2aytL+ddN7RGjmdy0I4MICe4725LFgbkhf6dr
	wJDgq5T6xWUf8OK5LzzYyu0/0TGQ8kKdsjwVeFsPT++nfTDl6e58aLC50L2nNgkJ
	NjqBzXFL0XRT+u3sRv8+uvzWCTx6hLWlgwaRQTIeQX5vW3Cbqb2RdvhOe5llCwGX
	hLLcxti1WgvSXNF0CMy2eutCl/OLIlzgnC6NL0H97XLftK7XH/RYuEOinThxKSA1
	hmTVrQyK2a4UHilphLIxNrSNab5S+jvGwA5UhWmn5gEi0li8CUM6dhDUQ/DMoCmB
	8gaQy3Rmhh4N4NW126Sw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsvb2nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 00:20:19 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e748b9a930so1206816a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 17:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780964419; cv=none;
        d=google.com; s=arc-20240605;
        b=XdEj5NJu+dfCbG4eH3Vnf8BBlXLovJ+fti82t0Li1DHXwcPviJToGN2BGUnHqs2THD
         ZMycWo8iphaH12Q1VV0qNd1hHYEVg3UfFkZ8JnrY4jH/Wzai2YRrFajlzDPW1zLZ5jEE
         MAfxlNwaFQGI71K9BpDf9QiOArg/YaxXfyeOuk9qPNiiM3weM3YOWTcR0ddF51E4FftL
         KONcOV9/XYgHx8X8wSiiEWiY6clLBdnJqq2MvLsyAH70+aq4A9hDTnbgo1Gl0I7ALiyQ
         ACPXVRSGGKA3ci5DoAJtbt6U1NamcAaTCZBnfarjDlOl0CgwqzdOWpGlhMxbgxVZG+E3
         f6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=g/yDs1pWMBxtNUmoY/P6JmCwRYdd15PIPXQOQYf5Em8=;
        fh=gZbBed2bSuSMUa/Ee2wSgOvNt/5x/nIdw4Zfk+OMVT8=;
        b=Q4G6j7yWMY09Tm7ALFCI0p5rA2mamoDJZEum8iShOzveviqa7d3vVrrzX1SfLXOQGG
         wPiu+VJj2h5kZU6eLFzoSefcZ94V4K4XunZSYHf/QAt47I4ronhAKr0FeUw/KWiZhhvP
         9zsWlNCQ8LMnzjoZ9vQ/Gfq/eFDEQ9rkao7b9/s//wrm6wICouxjcA22gB6wQMd1rBPm
         c3CQk4zY9yxmq9UNxp9undeMakYxIdbONDXJFW36tmjEsynbY1OEF1+tWi9ZT7KDEetT
         MFSxHsiP0B9q6143sYSL9lKWaAxxyDcN9i/rRGPQN8HOMrUxMrBYdJatPU6+Iv1DLYeD
         fAlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780964419; x=1781569219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g/yDs1pWMBxtNUmoY/P6JmCwRYdd15PIPXQOQYf5Em8=;
        b=j/7r5c1mSMeEfmPIC/nto5LnjVisUat+dpiEdVbIpH6HJ8kfyYtjpBk5ogrrD8rZl6
         oop+aR4YykORI1iE4oE4EyRuE5h7kAaN6b+7asl0R3cMLeeB5REqOuTRZNeCS3pORufp
         mLcqBcVMIo1HXsgRnQxcSi7WXN4qPA0BfPCxe74ata0y/V9F0vGvpxgBre/7qwcTvNUK
         W4xULGqIpPjmW2FUp/5yJeb7C+Ow7V+pAxct3OHeCMNEmCoI1iGlHFTkRUqvE0ymr/bq
         MCTsLCndD/BQ8hRhQI6+qjlp2RIVut6AraI/+tC1RTKgJZS4NJgtqNMC3E8A72P1o/a6
         WEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780964419; x=1781569219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/yDs1pWMBxtNUmoY/P6JmCwRYdd15PIPXQOQYf5Em8=;
        b=GILGhMCNhwCx0MLwxTqT5Bv0pC+CwRQO8140+Gerji+k4KhhnI3JYlRLNtqG4KzR0r
         cxMsTs82r2yWwD+ACXnr9IBE/JtoaKZZmjI9qMjBmFuGCwvqUkyhq1Fpqj6peBWUGxlZ
         L+P01/4QFEkVH7+XB1Jl3iCcedjt7lxNSfeFUO9UExiwCznr7s8E1L0MJXPJX5cDjxXw
         dA7ga9c7BddILSUNqfnK46MZiJX+gJS44SZT0hqIM6qT7YBvhL3Z/3sSetnDD7Q4vi/9
         +XyvJz476CQnFBOd9Lhn6R3Zptuf5R8TDBW116qpSKj7FW5+kGG/nXXZEsMuWqMNMAV9
         EP3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+q3pybBiri2BpcjMS62eJfY/1X/7ErZvWgj7JeqjK1c9SlEO6fKXsFXjxh2iWbrEPWGhrlSjTTn5q2uMcA@vger.kernel.org
X-Gm-Message-State: AOJu0YwGi/GTHfhhnfQn82+ZCRW8QunRZz8IQqAwPyRarkN527xzbvk0
	JRK1/sbE3HOyXQoo7GnX72oBl5SowTAXnPwU528WqfifpTNrin8O+JdJpiY3mpoUJmuCjpmm0v9
	HC9y7FOYQ9bkyZLJMahEDcBx3u4+Z3JIIETaM0MWDWgu0jkJquaXEtF4hETNNrPKJp3kXeZKvYu
	MaXOyCRl/sWAUhSiO26gIJBCVoy8418VY9zxzGw3sphvQ=
X-Gm-Gg: Acq92OHkU4fWrY/3f1PJgzTH6aFhPW63Mv7Pe6uelpb1HcrZMf7P+gqMthXzaofooU6
	UiiZBw32u7axef4oSQYvt/fZAm6iVVO/6XlypOPdjSSM30SLC6qD1Y0oU3AU8cEzzUTKExe+PWb
	Lk1DojhKxXwIlb2eOKCJACxUxVorTPvUdFKJncrDoxPURKzORuEupHCSwSPbAdhYR1DTtVcrzbS
	tRv6CSLludY8y8uziYA7lFD0xqtQTb07eTiQPse9TzACxkw
X-Received: by 2002:a05:6830:8296:b0:7dc:c4ae:a689 with SMTP id 46e09a7af769-7e70c5eaf75mr9770671a34.2.1780964418633;
        Mon, 08 Jun 2026 17:20:18 -0700 (PDT)
X-Received: by 2002:a05:6830:8296:b0:7dc:c4ae:a689 with SMTP id
 46e09a7af769-7e70c5eaf75mr9770646a34.2.1780964418166; Mon, 08 Jun 2026
 17:20:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
 <20260605-assorted-fixes-june-v1-5-2caa04f7287c@oss.qualcomm.com>
 <CACSVV01dbQcjE+nTic+9R4VfCtNGvpwODH8BMZi8B7LFtcCCfQ@mail.gmail.com> <49b8530f-24d3-4201-b22c-0f8eaea9f4e0@oss.qualcomm.com>
In-Reply-To: <49b8530f-24d3-4201-b22c-0f8eaea9f4e0@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 17:20:06 -0700
X-Gm-Features: AVVi8CfiOZ9NY7tYRS9c58-NLdm4EjraYCDbUtRXE__tClgONQ-BJf3lNrzK4V4
Message-ID: <CACSVV00vFNZDCN24wSdffZFRWpijb53qbX_-3b09ny4noa7-Mw@mail.gmail.com>
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
X-Proofpoint-GUID: wb-pQXOSteNbuNX-KBUwGIm_-rBAxqVS
X-Proofpoint-ORIG-GUID: wb-pQXOSteNbuNX-KBUwGIm_-rBAxqVS
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a275c43 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=DJ3jTsrCUhykU9xOEzQA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAwMSBTYWx0ZWRfX6GWk8H69P3gl
 8R0PkrgHKSnMjXr23TtLhqJ6HSA3scLX20FnDUzTJscJKS5lbx2BZMoL6CkN03Opr2PtHqoe49g
 PuZieVyrmlm3kyjRWzSCB97lwMnfEV7yvu8+RGdzPC9qdFj5w97ch3LhRnoghT4mqKDGF4e0Hjw
 rHXZ4dYIRG1Remf2GLx40GQfs2kSPOgt5TBxf19mPIs73iqVqVbGRbpuxfh1XmM+68zQVxC17dZ
 Pu3OghHnb/1e1OGffbV5efhRbn/AG1HRTdcBIduaTLY4LZmvt4kTLM4WgyCsAwk2RY4wbgH8cMh
 wMOcZd8w+tvzr3YmoW8C8XfuU2Psvg1ujYeob1QH8biNcjZCFNM3UzblOmhYSTSJtukM7rK1GQu
 eoERuMJeqeevI4MPj7yRJIzj2/pPbAnGIKeEFxg7EeHeSiqZtHLG38wa83OAgj14kqmNDwUneRF
 Wxwj1ZwKBuxXGZRAj6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111988-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DC5265B518

On Mon, Jun 8, 2026 at 2:55=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> On 6/5/2026 12:20 PM, Rob Clark wrote:
> > On Thu, Jun 4, 2026 at 1:10=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qual=
comm.com> wrote:
> >>
> >> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> >>
> >> Once a hang is triggered by the msm_recovery test, the gpu error irq
> >> remains asserted and triggers an interrupt storm. In the worst case,
> >> this IRQ storm lands on the CPU core where the hangcheck timer is
> >> scheduled, blocking it from running. This eventually leads to CPU
> >> watchdog timeouts.
> >>
> >> To fix this, mask the gpu error irqs during msm_recovery test and
> >> enable them back during the recovery.
> >>
> >> Fixes: 5edf2750d998 ("drm/msm: Add debugfs to disable hw err handling"=
)
> >> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 5 +++++
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++++-
> >>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 5 ++++-
> >>  drivers/gpu/drm/msm/msm_gpu.c         | 2 ++
> >>  4 files changed, 15 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a5xx_gpu.c
> >> index 2c0bbac43c52..f1df2514c613 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> >> @@ -1275,6 +1275,11 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu=
)
> >>                 status & ~A5XX_RBBM_INT_0_MASK_RBBM_AHB_ERROR);
> >>
> >>         if (priv->disable_err_irq) {
> >> +               /* Turn off interrupts to avoid interrupt storm */
> >> +               gpu_write(gpu, REG_A5XX_RBBM_INT_0_MASK,
> >> +                              A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS =
|
> >> +                              A5XX_RBBM_INT_0_MASK_CP_SW);
> >> +
> >>                 status &=3D A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
> >>                           A5XX_RBBM_INT_0_MASK_CP_SW;
> >>         }
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index 8b3bb2fd433b..9a4f9d0e1780 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -1911,8 +1911,11 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu=
)
> >>
> >>         gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
> >>
> >> -       if (priv->disable_err_irq)
> >> +       if (priv->disable_err_irq) {
> >> +               /* Turn off interrupts to avoid interrupt storm */
> >> +               gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, A6XX_RBBM_INT=
_0_MASK_CP_CACHE_FLUSH_TS);
> >>                 status &=3D A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
> >> +       }
> >>
> >>         if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
> >>                 a6xx_fault_detect_irq(gpu);
> >> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a8xx_gpu.c
> >> index 9e44fd1ae634..0f6fd35bd587 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> >> @@ -1211,8 +1211,11 @@ irqreturn_t a8xx_irq(struct msm_gpu *gpu)
> >>
> >>         gpu_write(gpu, REG_A8XX_RBBM_INT_CLEAR_CMD, status);
> >>
> >> -       if (priv->disable_err_irq)
> >> +       if (priv->disable_err_irq) {
> >> +               /* Turn off interrupts to avoid interrupt storm */
> >> +               gpu_write(gpu, REG_A8XX_RBBM_INT_0_MASK, A6XX_RBBM_INT=
_0_MASK_CP_CACHE_FLUSH_TS);
> >>                 status &=3D A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
> >> +       }
> >>
> >>         if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
> >>                 a8xx_fault_detect_irq(gpu);
> >> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_g=
pu.c
> >> index 9ac7740a87f0..48ac51f4119b 100644
> >> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >> @@ -552,6 +552,8 @@ static void recover_worker(struct kthread_work *wo=
rk)
> >>                 msm_update_fence(ring->fctx, fence);
> >>         }
> >>
> >> +       priv->disable_err_irq =3D false;
> >
> > Ok, so we rely on recovery to re-enable the error irqs..  that is
> > probably ok, given the intended purpose of the debugfs file.  And,
> > well, it is debugfs.  But why do we clear disable_err_irq here?
>
> Now that we are updating the IRQ mask register which won't reset until
> there is a gpu suspend, its side effect will be felt even after
> userspace deasserts the debugfs knob, potentially into the next
> testcase. This is different from the older behavior. So, I felt it would
> be better to reset this flag during the recovery, considering
> msm_recovery is the only user of this knob, afaiu.

Hmm... maybe debugfs writes should just immediately update the irq
mask (if the gpu is powered)?

BR,
-R

> I should have explicitly called out this new behavior of disable_err_irq
> in the commit text, but I forgot.
>
> -Akhil.
>
> >
> > BR,
> > -R
> >
> >> +
> >>         gpu->funcs->recover(gpu);
> >>
> >>         /* retire completed submits, plus the one that hung: */
> >>
> >> --
> >> 2.51.0
> >>
>

