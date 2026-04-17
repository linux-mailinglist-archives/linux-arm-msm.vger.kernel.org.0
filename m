Return-Path: <linux-arm-msm+bounces-103555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIL9F1Vj4mkJ5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 18:44:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C7841D4DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 18:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07857305BFFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 16:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFA22BE7AB;
	Fri, 17 Apr 2026 16:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVxpG0FH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ahk5uRuD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A97A1FECCD
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776444155; cv=none; b=QhzdlhORF+cy3WIDVQzivllcDkyxdw2knMcQSrblPwH8lbksYi9zMs3bNxKrL3CJVBKF0mm8eyGGASodoHDLoP+BiqrsOmU/0kwhOsQvUHGJBne0vtF5KJvyHhy6BpCEObo7lVYzX9jVfzrngvcwN8lydqIu9H3IsrGGo+0X1LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776444155; c=relaxed/simple;
	bh=ByaTmtPJ/K+xsN3Lt6JkLMGAoSVGIDe5dtLgioDjxYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJcDgGY0rbmjk/73VyS7c9e4SpxomkP/JD5VJgss5LFkW163Y3/Vu/CHvnFOkNrotGXH7nWNzLOphbKZrjQxbsuCDFClI3+igXhHDuiWyLMlCGDi2zLBgkRdnRxX76L/m5c8+kpdc8MoFZMhKqT248d90JEzPuZu8aMZeM1X2DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVxpG0FH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ahk5uRuD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4GL44068652
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=W7Nil3ecXcj
	6h98aqBWWZjhPtJLGkI6jnT03x/3dt5s=; b=OVxpG0FHfDhisAA84Imu2jNoHrk
	ur50hhXxKLhjankYxhqcY165Zwce30QWhedsWqDIswjE2a5EaT3L0SmPlsjHWrCs
	0Mn7TzIQq3feYCKMoY3pGttWOv+NpbkpEsO8085SOvhfHO131iBOSOwWhq7CFZtK
	3E7Hh8rzM1Aobu2hbrK+RrTuONBfvvS7TTeoy3un07o7WzqHXkIWA2NhxsPYl9aM
	Yan3KlWta8QVZxDnNGTzgsNMrJYyNTyAHf+/8aI15RYv/M39M9P/WVW+IKADDRN0
	Fu8EzldaPBWEhzLNtDfB22k/X8h4RbtCAzXaWNSicGyvSknc3epTidtxOJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu1kry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:42:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d984c74a8so20159871cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776444152; x=1777048952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7Nil3ecXcj6h98aqBWWZjhPtJLGkI6jnT03x/3dt5s=;
        b=Ahk5uRuDWQKSx6i+tLUGeZVkJQy0e/DJTe1B/uUm2CsL+QkJFqy9kNl8IBHB1YdjwB
         eUSXi5aBCvf5RpCtbSBtzN2xQXA+mhOcTAtIFt8rAvh+mtdNT4WsEEDT3NYV/G1XMhAj
         eEGx4MWoHt3QnTyz/qAuyQA+1cfh82EGsW1HvfS40989D1Rf6N7oTXn9Fg13Xm8GzI2a
         yiAFVheR/jvNDzvqnzPW3or93nnkJ8eoGd5ITQpJiPGg+2eeumL3L04ATHZvUIAwr55s
         lOqlT40ZICUpQHsCkNvydG5LGNmGn0rPHnMFVcNYc2RRWQ9fzf+/9E+p1a6K9skbW7jS
         thoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776444152; x=1777048952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W7Nil3ecXcj6h98aqBWWZjhPtJLGkI6jnT03x/3dt5s=;
        b=lo5BV3uS5xyhUCm9a/KxnANY8AnRbWHEkP4QUjtVMP1g5RNm1rR4pnRfcOJtjg96Th
         WjlbpPEtW4gg1aBO0J24lBBX+AqRbJ9L2okHtWwBaJlCVAriu0ErJKhMHrCPQe4i//3d
         8zi9cI/qSxOsgp+2nqffovhnDn4HfrciHpAi0VXRPtQqeo1e9ZTmDHaLcNB/39bDRntq
         tMMe18XAfOvq8sp61d+Kg9Is0BmWZo5X+TdgRhFaMpnpm6f2XCGdP/sM/KRe3/oXA8Wc
         uaFPPvJsYCYYIVRe7L1jq/AXSjaJ1lg381+kZ9pIH+S5A2Zk8RLi2eb7J/3zMiIWAkqp
         ky7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9A0TDARocISAb/z6UdqssuWEo2CXrLjBpD3O4t09BwWjQjYVOvIb+4w7mDybBGO9opBxAFxl6QOkMhQT2/@vger.kernel.org
X-Gm-Message-State: AOJu0YwtPhSrkdz89sH8E0A2iNp+TaJMTbekc6Gpipz+aXjBqEtGi1WS
	MPWf7p/aV3khRg9DnySV11UlI0ADUDPl0N5lguc7lLbtaT2NXFXTbKTCW7cAWhAlXm2DWLHq0kM
	mrtYDEv7dlDfbQ6dMcykBkRuVToGBXTP5j2yi4VtSzFfElO3bwK6T9aEKHrcdhTuNh49E8xQ2ai
	DLX5Y=
X-Gm-Gg: AeBDiet10+Zmp+E2qs9oeJQbWtqVZzvWJR4pN6yR9LSNd1542x2E115rRZz+yFW45Tv
	cE8DfODwMQPyKYIWqjcmt9p0YOhmyp834L7PbY3VhqVlhIHHiNZFT//iNE8zwnb8KZMUFTvMOmc
	ik1H6+5tkh0TuoGJeOetX9y3CtVhW20Au4LgR58BUsJEKTO2UGhQutQJcGUp1My0dXbG3v0z3Zs
	lvbM2ibQPPQOHufxYrRMdkoKD0CNiUm4zhuzMlhbt6QKeE+CfQ5wtLIcHqkYeyH7iW8z6Lnw0YS
	u93IjLi9nL/zgF1dm3d42W6tBNs1WVneH+70Z53ZdZV++llKbD7Vgp/h0lVjgQcfrj1eXMk/iCx
	J5wnN/+D49p46yuJbbcCbYRYdLf83mhW826++GFq6f7ivUKU1UzBvqIl9AHJ8R0RdY8Y8QE8y
X-Received: by 2002:ac8:7c56:0:b0:50d:9b07:9c2b with SMTP id d75a77b69052e-50e36c8da62mr51569121cf.56.1776444152543;
        Fri, 17 Apr 2026 09:42:32 -0700 (PDT)
X-Received: by 2002:ac8:7c56:0:b0:50d:9b07:9c2b with SMTP id d75a77b69052e-50e36c8da62mr51568571cf.56.1776444152093;
        Fri, 17 Apr 2026 09:42:32 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45553e502sm71796466b.61.2026.04.17.09.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:42:31 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: rosenp@gmail.com
Cc: carl.vanderlip@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
        gustavoars@kernel.org, jeff.hugo@oss.qualcomm.com, kees@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org, ogabbay@kernel.org
Subject: Re: [PATCHv2] accel/qaic: kcalloc + kzalloc to kzalloc
Date: Fri, 17 Apr 2026 18:42:30 +0200
Message-ID: <20260417164230.3158014-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401220643.12802-1-rosenp@gmail.com>
References: <20260401220643.12802-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e262f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=1lcS69py3Ix-9TsBHUMA:9 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: d-Lbq2WqSJFtToW0Wul5gHr7ftr8tA8c
X-Proofpoint-ORIG-GUID: d-Lbq2WqSJFtToW0Wul5gHr7ftr8tA8c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE2OCBTYWx0ZWRfX4Wyyhub6TB2s
 d2NtEel7gAtPgp0OG152QgQ/owC/vTUQlR7Fqn4+gDsTwPvnQYcAbM9UqleeYonPtbHjvZUoylN
 gRWNvRpRIgdov7FAOyXW7rG1NlJRREPsOP/Hazv0AUfBJCsSwkzWdVzfZoqqaNZpiK70WsDCZFu
 WOMvDFCu1pqBZNyRQlLUvPc/rA4Mtn4OEU8BPK3qaeuIPQkmVoErOu4cNKu9bEsRyYir/GYm/rC
 vv09NJs6C5RGmT2SFSImS4PDCCS757IWHNJy0CAUgr35N7mmlB9hmaeigRC+3fzKL1zDaL+lfpi
 tzuq3eql2Qo5HdGXIkNHe8SYK1rnaud0Yy4xL2hHkGIDKv8pMK4TGZjA/TMXxFE+0DAwU6EH6PR
 B3WxvoJsxLwCmY982ViVtcytURXxRSteyf30yrSpJ/N7xk2rxGgj9BFT05w5jSWmZvbOC/Qao9q
 ADIcMhIXrJxa9mojRMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170168
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103555-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[youssef.abdulrahman@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 02C7841D4DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/2026 11:06 PM, Rosen Penev wrote:
> Consolidate the two-element allocation into a single allocation using a
> flexible array member. This reduces memory fragmentation and simplifies
> the error path by eliminating the need to check for allocation failure
> between the two allocations.
> 
> Add __counted_by for runtime bounds checking.
>
I've tested this on AI100 and it works fine.

Tested-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Thanks
- Youssef
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---


