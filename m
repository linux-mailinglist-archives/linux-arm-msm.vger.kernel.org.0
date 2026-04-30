Return-Path: <linux-arm-msm+bounces-105428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK/sIxbL82nJ7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 23:35:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB354A842A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 23:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C758D309E115
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D023CD8B9;
	Thu, 30 Apr 2026 21:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpcxtflH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UI+pjOh0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B93C277F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 21:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777584652; cv=none; b=Qxq1TT1qJuHPvEJCauogP/Mn3nFFb3Ij9oQ42GKCBrWOp/5JnpDPZWhEDJkrfXAddorLQlTpIaex8VqlGF1pPFkxuuiwT491wDpj6ElR5YOInnqVoYPT7f+Pa51QHEUtQDwKEEWds52MYFhwXYogd4M8AyBAEnfVz517ZsrilyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777584652; c=relaxed/simple;
	bh=RHeNGzFsaO5OU7c8ibFy6bhq1ZsmwbrnW3uotbi3WGI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rn4nFmbAfgFNy8rA0TSyU8ZMAAhIgiFk5TUuxx4bBOoaYavNDikA8KsyWI20pnc51DwNsrH/GIsnEtOfmcA9iPvj/U5Z9NB5lBALy7hJC7oDJAQXpwfWu2AcwiM+yLGnIHeHmaAqgLy3uh3fcZlrb8Ty6xLCNjBimOxOAjLhl4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpcxtflH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UI+pjOh0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UGImDu2122428
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 21:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=; b=KpcxtflHF1RvLzrm
	x/LpGvQMk5ePecYf541+Lp8GKCTwzWCI3tUaQt31d9/jT861bvBMMi9HGjm5xmoM
	KgIHSG2oqN7Pijvoi2gJCb+peObcavyoRWp2CndyK0uaAYwpNhtOlkjHxFAejEht
	8NK9E/6u2huWO/mo9rv144LFxvyF2M1GpNkhTRvAW1ou6aVLfr2qI5BNc/pdrlFs
	A/TeGctbIaGdNHLBzLb6Fz7sgiQtWqLhS4wsfBB0z7nafe2Iut60Xqaue90XJ7PU
	e2YlB0Y0ESBmg6jXoRvHEfU41E+JJJneP7mdyG2n8GynP9Q1HW05kXmKDl5d6zKI
	0foBKw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvag4sc5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 21:30:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so2033360eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584649; x=1778189449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=;
        b=UI+pjOh0j7pi/MCiJKIE7k9Ce1ZXzpWDTJ+VrMUUTHdwCkhXth0joKxn2KOQcYFfl3
         H7kpeTbiUtbsPV242pQvMBmog/gDVsXZ5Np0clybi8kfNklVVPGdBdgCQ6qo2p6I7kNP
         QavM/ckfLYQAtewhhQMuQwcON3RptfuPRV845jfKVQikO0q88XHf7MOGWAPto4nBIK+r
         L4bMyleyfEbrntSYMu8sg+PXQADfUBpz5zXYkIGPDtbx7ET+I1Pm+dzHL5zf9YDeNKFG
         W3KufSrNzTYknAm0oBKEktlQIq/z0f8GEZaUfbmplb0Tg/q7EGmG4BofrR0MpA4IQ6VN
         p8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584649; x=1778189449;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=;
        b=FEQVYn9FnLAHJDceZlBFnz2eNNJesotyN6k/1o/JprxotidnZqmqCmgb6XejDm6K5L
         +lq0yIvizuqoniRmn/nwYzwouuGMgArXOUCdIx1BUjmEgNAJsSGHp8ZAcwyw+YH26yAN
         oB2rqVYzp59nTzmyz/7h8lCdfqe6DS64TlP3+midiR5knj2MsvrBsFOAeElyULQh0GJG
         rotW1Il3rzjiZYzH13RHLPAZI9Y4zCAidAdFDjy3yLvum4VcsYApWL1bBHo/6V4M2P9L
         K8IhCQHXLIkcgnrCzG/lRoZdkBzE6X5KdKp6oynLcPsBll5gN4O0yLBoz9vYGpIqhjuQ
         1nvw==
X-Forwarded-Encrypted: i=1; AFNElJ/d1gVqmYCvmuI8C5AxD82t74/1qPlyJBlJ+pIa6tgF3ghtVI/OUkaITUFyskOl9c7lTT3EBMyQoeGb1OMA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6VbjsvPq1hpItoUWWTsHELjoxDygGVsrTuqZMup0UsGjenqg9
	pp57BwjCpbPFuYzsi9CET8ZHBVr2HM5l3+YbgmgCLT0mmOUiSEJMZN66w0ucIIN+5LLnFuBVpM3
	nmfvUesfGt0jZUlL8iRcb8D9c8+o5v4Da/m9UKywYPbfINP6gxigLiEs3OEFM40knNuVg
X-Gm-Gg: AeBDiesbuyjcdCsO0wWEnR3O3AqWLC/c+o5J3GU6EZ+hMVj9VDq2p7MtBEkVqyDPzze
	nY+Tgk8sQycWutfidTHafU9T62gVZ6GPTr6cHWXgQwEYIEnJ93HKRXoVEIlWOGf+ADZGGkwQEyw
	fzmpHTiSUOcTGJQHODfyhEBKcQv1RViK7/jPuDP4g7bE3IZGsiVEIOQmK73xDePgEcO4noNsgYS
	CbbxSyWE5RtadB3TzXj/DQYRVoJ56TPztwzCrT2iuINhN2BJGCiabVTFEqCXbsDqHQpkzXHaWtS
	dJpEwWSj2Iu1Oviu9NnudKk59+ouHNN/sHBtF+wj6FW9uTFj5vlXm14t10L9sV/n3+EQ6pBK/57
	/vsCRZ2AQy8LRWISFmvlJoLoGaLCWr1JSUx6zsKRBgI1UeipuLLVda7pEQgCiBMg7mewee9wUqs
	HdDsBT7YeIkRg=
X-Received: by 2002:a05:7301:d19:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2ee87680653mr181094eec.8.1777584648970;
        Thu, 30 Apr 2026 14:30:48 -0700 (PDT)
X-Received: by 2002:a05:7301:d19:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2ee87680653mr181009eec.8.1777584646856;
        Thu, 30 Apr 2026 14:30:46 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] Use the QMI service IDs from the QMI
 header
Message-Id: <177758464538.1848985.4937106435944960092.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:45 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: gc-4s8u1qbjwb8e3FkJTobk1ml4qvImy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMiBTYWx0ZWRfX2qlHei5qCW5O
 RzQ4Ef2vh/pDI3j8LawFrbCqfsl34Gp/rxxrHpZqHHOgcmcbKUeAsPf5T6c2rezJMyZ2pJlyegI
 EI/+iHKAIorATig86pCaGOBEde1BbDxGpC9ppqdi+3SOJS2ErYNnGXzTZf20Sq/XZSU1ljGI+P4
 oaRYd73B/SD/DtZ2amFIze3LKW91vbmxOnnl5pYplpqfixKMCn+D3wtbaYoqerqz/jrKse4m8lN
 8C136RdHHOLPIly7QNvqoQOSVoISAsTHYw16ijS16teSxOIu+ZEjt0rXwQV/g44AgQ6/l1JEqhb
 1aPlOUO4u80FNT2kSAg8z82ityUWZ02oLcoS+cv5w/g77yFHMHKtvPAAKCdI+TMA5MLrBSvlAxQ
 C8GGMosaM6clyyIE9GnkECUGFNxywKq6Ye93ilEbP7nfV/7YaJPWC9wvFQCT8N3qbxwG3EUCTOJ
 4LZ6rdRfWx3VhVXV/pw==
X-Authority-Analysis: v=2.4 cv=UcxhjqSN c=1 sm=1 tr=0 ts=69f3ca09 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pNJNIoqo8oUBudG6fy8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: gc-4s8u1qbjwb8e3FkJTobk1ml4qvImy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300222
X-Rspamd-Queue-Id: EAB354A842A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105428-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On Mon, 16 Mar 2026 18:14:10 +0100, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> The QMI service IDs are defined in the qmi.h header file. Use those
> instead of defining the IDs in the protocol implementation file. It
> will result in unifying and providing a consistent way to represent
> the supported protocols.
> 
> [...]

Applied, thanks!

[2/4] wifi: ath: Use the unified QMI service ID instead of defining it locally
      commit: 0e39eea57626e545c596734c0d250c1735f1a7e5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


