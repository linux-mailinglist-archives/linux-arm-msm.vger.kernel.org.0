Return-Path: <linux-arm-msm+bounces-95544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIZaMD5CqWkt3gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:43:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F3C20DA49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D74B30A2B94
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 08:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB96372B25;
	Thu,  5 Mar 2026 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PV1zd67S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vy5xhRy7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADDE37186B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700070; cv=none; b=HzP37oPsikLa3S4ybCbs3UiQ99/jtozbXLruycZHVtjIFbSmo/Vua/3qE/n8Tz8aPl/Hyw3S2ih6119Vaf+byY1TU0L602ftsISdkMLhGR4w3FJLob3vETv5vvvNFScomfo3hkQCHS1r+CC8Eel+21asbGtnUvWtNcfgjLbww5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700070; c=relaxed/simple;
	bh=2XfN1IUdVDHXRnPcZX29DDqK+fygGtG7P2u+RJeGQZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUi/1HLq0k9u7Gbt+/XfAE5lfDjUE6JuSlRZW6pkLu3duKktnE/B8NaLu/70QO5xX3x+BMPgT37OqJDX1Htk971XCTft1jaLz2+g4+qInY6HwrlMe2489hUL5UrR7aTTlglmyslIGU9oBSRvmBcCAz8vYkZSUbkFLJ0nWCeibOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PV1zd67S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vy5xhRy7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254ta1M218453
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 08:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piRd4pArnPlFES3z5bGfGAc7MxY7XKet73f1XaOJtCE=; b=PV1zd67SOSKF+UZR
	V5fdwqbyUucXumd06BZ/oAA37dUEl5vML5IHmI3mnn4Bmki8QO3evnkI46yjxxGS
	m45CAGu5eBDMw2YB/8jIWojxuj4hFNgf0+OtRvrgxln0h4SEUJdTQ/aCob5K6Yy2
	yldtosQxZLDKpCc9FgtsieLz7R7I4Tsoz3rcYZinQF78wsrB238y/92ii5jn51JZ
	AwdA78m4ieR/9zsGxFByvyfoHc/1zatdcLsswZYA8mS6Zh9fYsgTO7KlJNmfRS3/
	p0NvKqVEk2wjuYVZ4VzeLo6dqMWQINNS4A0/DL8PndXOf5bZqmgVdZBfNE0dCkLb
	DG+FPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380rpyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 08:41:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so577219985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772700067; x=1773304867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=piRd4pArnPlFES3z5bGfGAc7MxY7XKet73f1XaOJtCE=;
        b=Vy5xhRy7bGCsAxkL6xDNmBcZCOneb/heiYu08Yt/RUuYJpyRSLkqUQeuqVrri1+1rN
         jDhMM4jyRBd0XNu38oYDVu8cfbT8fu7cOxLSnKWjmdvN8ArlUQ+qEe+c/G/opUtft5o+
         9R9OQgqE5X/Q66smF9EHQB7TXoPeXrezfWGe4NQqAPptSNSNQ25s04EP727kKT1nstIQ
         LvQ7VXDCriqoVD1R6d8iA5pQiHKBDvXzN/AuBTzoKiXYoH+LoHyDGQrzRDJTJk9TMSVj
         kTgO3EwbbjKHB9Bh1D9Y5ben/T6ncPXRKXkl5+QOB+CzyDvr+QG9W5x43TWdyDt+pvDg
         OTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700067; x=1773304867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piRd4pArnPlFES3z5bGfGAc7MxY7XKet73f1XaOJtCE=;
        b=iTSsbW+OcbXnMay4n+60UDem3u59engl54gJGxulNL/36wijYcl4wvUFamCJy17/zg
         f1rTNmQSr+B27W98E3B0pfFvNKC2RrDuZsYcTgyWEomg2E4Gno1ppPrA/D6AvV5beEO7
         3lcBhq7CodMrIDBS7NjONpYqsB18OHqZVSNYsmN/Ce9qpt80Qnxp+VvTLvjJgaYesT81
         fg2DYrfVRuC9gfw8oSN461oCWp4z5NjGVnwQAZj3apXMMxF/gO34HS1Oeu9guHlFZZSj
         q+2o8ex3EQ6RxEzee5dfbf0LUNtNJj1BTdguQWojhK/kFj/f0YTv5VTo8dY1D6MZZTHV
         1gRw==
X-Forwarded-Encrypted: i=1; AJvYcCWmi0ik0My/vPcAM6m4M16s5sINljl8P6Q3dhQDES0OVmtUBrA+fz2I5BfUpN0jwh2OBVlXEjjqI4KOjB9I@vger.kernel.org
X-Gm-Message-State: AOJu0YzunZOTEKhvrzxAiPvnsxngUXLlR6IDeA93Lf30VCyzKp2XI+i4
	n/vshdLzRm6U91whWwTbDZVohvmDOPl1ZAuI2Re0kPC13Chs0IFbu0O/yvi2iz8hoDBBkU1O5+K
	KMPNqnospeTIeA6/iO4eYy9LsCVsRBfeQpZPAnaftYR2HAJUNf+6vXaBTKANevPKOcxQW
X-Gm-Gg: ATEYQzwHdVexVN2cYCv4i9hnw5pDEFAdigNjKxsBIc9UZys/KKCh23Y3ynPRwfK+asn
	sQvDQWZHtYkHGNdcGJWaiE5PLEw2gyTNy9L1zisOKZxnaqHrosU10Vh7wbjH7bnc/zuk09cqhI3
	sBjWNyNdxNcxWy/o2NYofE5grA69ZpDsKshMfegbW/W6ASAY+IAi5VvPJoFtDRZkSX78+hWKvRN
	riO1M+VAv6yh/XFi8hdre6kzpc5vzBjSTxPhbVSt+uwwOQH+lrt5ftg41Sockjw6iw5AB3NNGhp
	NeQeYySzWvcI7vBruMB8ZUHIlJ8nJNyvLY4+TBcnYyMK6TwYyKFcZWNx9ataZBPmd0Bqvi+itYA
	Uwaq8UQKNPX4yQtuF2iOX3XNYMgWbDHPyl44C9WikFNGmOiZq/32Lpo26VOwHtHPR+W+G7ssZBM
	AaR/Y=
X-Received: by 2002:a05:620a:28c7:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cd5aee64f2mr442981285a.1.1772700067619;
        Thu, 05 Mar 2026 00:41:07 -0800 (PST)
X-Received: by 2002:a05:620a:28c7:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cd5aee64f2mr442980385a.1.1772700067211;
        Thu, 05 Mar 2026 00:41:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66157d35cfcsm394173a12.22.2026.03.05.00.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:41:05 -0800 (PST)
Message-ID: <dea45e4e-aebc-46e4-a245-3603da1779f3@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 09:41:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] wifi: wcn36xx: add support for WCN3610
To: Kerigan Creighton <kerigancreighton@gmail.com>,
        linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, wcn36xx@lists.infradead.org,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260305003253.1022386-1-kerigancreighton@gmail.com>
 <20260305003253.1022386-4-kerigancreighton@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305003253.1022386-4-kerigancreighton@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a941a4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=teg4DUnw7xCSCHTInWMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: r36WWsqSTkvN6lx6d2cFzdM82f_P8uc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2OCBTYWx0ZWRfXy8JzbuDM6W5A
 hiFjhX6+roJ0iJFo7051gfM3XnSWOQOk2Hoyfaz5r20PTWIT+p5sZnFXR9lLtn/vaZMNcLVJQUj
 ewzAY4HqxbvmKnCXljDfGquR/uevlaQYsGIjlrnY2h9eQf8ZmIps1zFk5k2ChGC2vj4oXaic+2M
 AfkIv2sAHf+fYAanlpq7cHee6CFVpIVmILS5WhQl4fy87zF70R3NBNzSZ0WkBIqFcU9bMjuOcle
 BcVjyVH36FfIhlUXkN+a3CfS/ipKIqzQkFzqyaylYXxuYikXOGboJGf/r3rz4QQja6lRQ+gkchV
 miZXyoMOYJuzoj/WL1tQuE6ghoCrpF7fMmZsYZ2XRUvRaQoGXPaMzDwTa0crxTrhKIRmdvIdTeT
 KlCkuE9jMuIdvXFjBIHKa+IaReqZEEe/AYXc7zyOx+dkEhwdv5zTOFBKDo5J2oErWjSQd0tjs4r
 XJvV3+BBRvBkbrR0S8g==
X-Proofpoint-GUID: r36WWsqSTkvN6lx6d2cFzdM82f_P8uc-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050068
X-Rspamd-Queue-Id: 29F3C20DA49
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
	TAGGED_FROM(0.00)[bounces-95544-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 1:32 AM, Kerigan Creighton wrote:
> The WCN3610 has a lot in common with the WCN3620, so much
> of that code was reused.
> 
> Tested on an Anki Vector 1.0 and 2.0 robot. Support for other
> WCN36xx chips has not been affected.
> 
> The WCN3610 requires specific BTC configuration values for
> stable Wi-Fi. Without these values, there's some packet loss.
> An extra CFG table was made so other chips are not affected.
> 
> STA_POWERSAVE causes firmware bugs (long hangs) with the
> WCN3610, thus it has been disabled just for this chip.

Is that something you've observed, or does the downstream kernel
mention these issues?

Konrad

