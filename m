Return-Path: <linux-arm-msm+bounces-117899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PpquDHlYT2p1ewIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:14:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E267072E1E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:14:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R20WDevu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iwniuEWH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117899-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117899-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D5DF308710E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9D13E866B;
	Thu,  9 Jul 2026 08:13:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23FB378833
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:13:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584784; cv=none; b=qAWVHpGoEHeZFYRRU+nqDmZsZkEfQOYlEkO7pnAEbMRlwMsO4447YcNsEVeH+48z3gls035R1TLeXKgovRaTzgVEW29z3PbYML8CxlJ3SlmHKDn46HkGiFXZJMd2UzdJ3LNUZxMzKsyPiQVTsB1aeswJRItVS/UZ9608tF1BxWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584784; c=relaxed/simple;
	bh=sw4ZYQUkSTfi2fUJscACJ/CQoJQ5XIsAIE9CStuEUTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R5tHbtauw8VOiXJp3ejptS5csOdY7p1CjzU4F3zoVwkrmUyy/0dldVsXLzVxfYi3YYrRyYI9O3ghYwovnAdfSIOl8NFp9RjyNoLajHc2FBkk1FhUDBKydZD4IJVMvhCM21XfO63jrAZaiKtSCvlvhnYYcYQfgl1G0DsAENCESIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R20WDevu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwniuEWH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66961CmY933499
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=b1d7ZhWs9f1
	sgfVpFc0YAcv2UrqZgyUhnYNnbfueP+Q=; b=R20WDevuhVIFqzclgrOp2Phy05C
	m1JVaAb/UgDNQdE5wCtzUBSXIqB/B1xmONzdPUBNSQ89ehj685Lv5gSStfmtQHl1
	dx85KmaDa8KDzv6I+6xXQBqEgOzN7SGTdAVWexjsgNRafanLQTPH7EPl9NOVZjcx
	0ZacKNr6GIUg++8T2RaLlvgQul6iFIpqNQ2LcLWF65nUzt3JWdxNaonaTxzJjBT/
	5JNCdx6zIu0XmJ4LAAop0av6v8zR7fiYSgK7Iu0rYt7ap1Zsy7saoyzBbQ/2izVS
	P6j43w1q/XN4DV7KbFQTc9nwsfYSlh87yEj4cpjXrRfA+QwslMJH5HxmA2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6jmvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:13:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-387087245e4so514466a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584781; x=1784189581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1d7ZhWs9f1sgfVpFc0YAcv2UrqZgyUhnYNnbfueP+Q=;
        b=iwniuEWHOLXfGIH4WEvjEqTGBJkbvqMFVAhbAN657xFZh8JgFrmjAom/sUy9rdlc0k
         njnVe+VB0ptEYnnaJ15jlCz7xu5IoBDzC+iD2ST8tvHsbQ3n0lBlGW2XQ3ErdsnQyiMe
         8LMyghzHZG1QLVsPtxXdAKeQUHng0a7U5w0qN5W+17iMF08nT0NQc9qPw3oKNOx+AriE
         r6KJQSG6euJWmqokcV+0oawXqKs1zg7zVG9P1P/lFFjHmA65Rj3oI/i3bYM2N9K9DuXi
         TpFeNcqAL/u9UUwjHwNeBVtMYkBVPNH10l99G214Sq+lD0vRqsrjhSy+wK6WWXxGR22E
         93fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584781; x=1784189581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1d7ZhWs9f1sgfVpFc0YAcv2UrqZgyUhnYNnbfueP+Q=;
        b=V5yB1s73LM2+ERjNPauI+/E/P1MiH54qjOOTEsiIqogUBjqmpE14RQpga7v44CjIrj
         45B7L4g4gwKp3gM5kuGpX3vwIZCChFm+niUqzHZSd49aRbQwlXkodoy+0rYDSuGLptSS
         UaaPgNPNYtCi63f5vx5tryMVpIsJyGdEIVUukNFCuXmtvtEfV9HOBhsU68ftVhPe8shT
         PgCHiLurRr2TGbZfuX059x8gK/aa3nlzTdJKbVnF7kuU0IG6vX9Zvu+mL98ydq1wcdp8
         FomSopiVy2x7OZ7ptSIYFqRxzFHtrD5cDpenSdncliM8fvXO/2UhKJlyDITU4OAKpsBb
         gYrg==
X-Forwarded-Encrypted: i=1; AHgh+RqQNbEhfFIPzAjScA8hP1LEp58i0eHHdx/kj0kqvIIlee06n+GgkXV11BEQZRsI9l2zlYhuqHLG4mmBiv23@vger.kernel.org
X-Gm-Message-State: AOJu0YwjaIlbOPszoMnUMfagSKpwYYfQwHZJgX1tUNYcnYvQyxWMZThN
	cadtrKeaC5qwRZ3nKY8SW7zH8ePSobapMt8StS+8SH9coMGYQU4H4cr2l9I87UMbbKaA0rRe5dt
	7dCwsuWwkyzBICR5riCzp3mhFMKwRFpVSg6GaVFH9eOm2p3z6o8tmDeBUTreyj2MoOpUn
X-Gm-Gg: AfdE7cno1knLpPGD8ElcHj1tkpElN5jiJTP6XzGkkvpf7FZX7W/V+xt0ZN7Ax1WkScw
	WbNTAxw/NmAKX1NJ+ut+6k/X0Kdz80eS/ZUER/zP/fsfuDRu98T5s7uUk3EvsgZDsuXWjt0EaLz
	gzdzrIG4wZQ1VlbeM8J/JJ0kkNVN+p36x88g0Bin0nsiGf4Ljr1q6FIqDz1onmSfat4saw/PI/I
	taGUTXxtdnwtjec6XiS5g23+0iVxAjeazN4mBUoolzrdkXhAAfu1dm8hduV2cEf+SKcY7G79Wcu
	thbOPPNe8dTqFi/9rUoZ3k9lNLwi3dSheSBXbvdy0B51XMVNH+FV281g3eo5JTpM2RONu/pKtxx
	XFjiAjWFmqEC3wwOhR/DpfXdpzft8VBBUH1hNnuBStxer/oim94GxdFwr0FmPrA==
X-Received: by 2002:a17:90b:2f0c:b0:381:abcc:c8d8 with SMTP id 98e67ed59e1d1-38a1f1de21emr2603840a91.1.1783584780877;
        Thu, 09 Jul 2026 01:13:00 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0c:b0:381:abcc:c8d8 with SMTP id 98e67ed59e1d1-38a1f1de21emr2603808a91.1.1783584780378;
        Thu, 09 Jul 2026 01:13:00 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b48bsm774740a91.1.2026.07.09.01.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:13:00 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        brgl@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector
Date: Thu,  9 Jul 2026 13:42:54 +0530
Message-Id: <20260709081254.422145-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <vpsczyjw3ew4lhjwy6edzjomryna7ygyamgr5idw2aiq7al2lh@64to3cet3ufz>
References: <vpsczyjw3ew4lhjwy6edzjomryna7ygyamgr5idw2aiq7al2lh@64to3cet3ufz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX1VqYzLXvm9Fm
 OD4X1b+DESZYVm7srgr1uWTXn4oxwgA86ww4SFdCyQCBiWnLlHoLSneitRnsetgsw2Tn7533Qop
 i+GTI9WfRInov4N8KSR/XVK7r1ACKYs=
X-Proofpoint-GUID: eb7c7jVub6fpJl92jhQufdTW1dQgKQuB
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f580d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=eHU-EKddRagIODziGN8A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: eb7c7jVub6fpJl92jhQufdTW1dQgKQuB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX733X9nbl0HqC
 +Rky6WaxSZgznAdCQclxI82zWXGmcAQNph3Bqs8h1baJ0/tFuzNhxCfnYhKpqPHki/P+lF0nbMW
 o+pdDt8aeOVYKR8wyHyjHY6eDfsWXNYCGn+e1CsR2x3whF4UwjKm7LmeOszyXBPLfFhlnn+NY+v
 UqQmNiysuj9Y/jLz4zmmJ/p1FMB2U4D+1PylLuFl0X8WeGl7SM3yEoX7jTlSiARjmGrg53zB75x
 +YYXntuYRtOJFCyzZooG/Ns5a3QCRbPgN6YXGJmUZ2ny1ybf2fQsgD7zXGvac89azh5dupXPpCF
 NZzeUQG3mBLpFBX0db2tAM9FtEPeT5lJaWgpu8IYb22cyNXzJXjnhVyFlPJdqDQkhj0d4hxZ8fb
 htPU4En93ryC0WbxtER2F7z30Nnfv0s6WXTqlIgMk937aMfBrLl0pFC12td7AFQjTqOi+HdkZxC
 M7mNeZZqrPrGYL8CrHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117899-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E267072E1E8

On Thu, 9 Jul 2026, Dmitry Baryshkov wrote:
> Separate, unrelated change?

Agreed, will split it into a separate commit in v2.

-- 
Best Regards,
Wei Deng

