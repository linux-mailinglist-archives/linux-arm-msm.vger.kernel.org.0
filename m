Return-Path: <linux-arm-msm+bounces-93860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKLHMgcTnWkGMwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:55:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECDD1812B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9478730B6D61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 02:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D647C26ED59;
	Tue, 24 Feb 2026 02:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/VDW1O8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNB16/2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA86026AAAB
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771901619; cv=none; b=AGPACuvgH9Y4kExf1hGz6ef7mO0QLqwoJBeXWs9CwowcXxxpPQ9eS8Eui/7S2xy5bS0J0q+vctP8qIVrxrJpHBe1JMGqShLnKStV4SeBwlFSRevDrh2g42GUzCnUlxo8rE+v/3BaMrxr2Pg9K+PG+VnkHyT1Z6XdWgjVR9ahtzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771901619; c=relaxed/simple;
	bh=W8BBdVsa93lhkXy1HgKfWwtX97/mEx/O19ptBXjieQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYxzOCksinv7LbIiYUyzZ6sxfEw7/Sf8zoM2TM0ICjfde1oy7zg4qQlHe1Fx5+DFRXIxyhYlAPjofojJ8MXhL2PK5pFiz2as4HZEsHzJeCXBssYK41XR2ozo/yPoUgcuimbHwDrzhTCTZGwBtDZxqTjWUXI5BFJkxZG/E3KNM0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/VDW1O8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNB16/2Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O2loBd2927453
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=95WCvKE97NdLyP2MnsuDGXuZ
	rq6UtGh+pSzps0Zeq9c=; b=A/VDW1O8xh8zTCjFm2+0cM9txf7IuYIFXWuxcbrG
	Iyj9Frlk2JjQTvy01yRniXdrWhPzNtQhElG2J64woghCqbYvbqfKQ4N4R/RoU2e/
	OmtEF8k71MiCFCH8n0nYDJoptE5aihy5iuyVd0+y+THU26VVMfkP6rSjapkoEOS8
	KCoHFTOMGVfV3Cla+9p8ddstnf7QrFtyUdLz2yP6pep/P6fBTIcEPB7JOrwK5hN5
	bR7oldxdQloffrgi/p9ML2G4suNW2ZCmb3xyhpBMygcHUoJtv7e7rA7fhoSGR+2m
	msdxD6p9/h1wuEMzPXqdMFNEtwGkypkz97uufavsihhGjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8sjag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:53:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb413d0002so5380616285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771901617; x=1772506417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=95WCvKE97NdLyP2MnsuDGXuZrq6UtGh+pSzps0Zeq9c=;
        b=bNB16/2Zw+29X1dqFYGZzgiZts8vs41nQx4KUJNF5XkNpDIk2+GNMZVq0zbCbV3g2s
         yBfxlaBuUZd265R6OdlgwSOYmCx4wscIui1n5yeiEYKjFLHnpdFqZIyH/lkEA1u8Yt5Y
         kfZQtkX0197VR8D5QqqXwnKkc4U1ntYrDj0aG2Cd/Yfl+4RxuilyuEP6BD7jvsyQvApE
         udEc7Ru5QNqGhkild+IsZDb5vm0hky6byDhbRD+Bdce/ChnbJQldsPCDQ+RXh0/IVcpY
         Kls4Q77lnOzuxRMthIpCAZK2GP3CqnPPfY3aW8fTo+VP2a4PRlnb74sfrJDj/N/RTmu/
         mmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771901617; x=1772506417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95WCvKE97NdLyP2MnsuDGXuZrq6UtGh+pSzps0Zeq9c=;
        b=cEtvCj0we3Rn5mRwvjm0X6LZs9G8nBprKAoVNMKaUUW961rWZLdDjFy5zVxX/EUo+z
         2yJhDn8ZONoVjb3FL/VaK8GHu8UPFWs7yvKTBtf9rPFfeLdWPIxV3dOUT4yPnhlanYfW
         4tavMHvRhqwitXytQp3bnmS8SxoYtrY1fjyXjamKNaVo1jqtGkk0qkufgLMqG2Yg+hdI
         hi8NNshS8OPnDps8W+tOZkj+KnIEItsHYjh5mqdAozuRSZJSheJLBMS0G1gjtdo8UHsd
         ehGBp697/iggbOwJPTaToDznJZgwoEQgaPzvBdWHxOMJgJyyuhOdr1+O5jl1Thown90X
         FQYg==
X-Forwarded-Encrypted: i=1; AJvYcCWx4hN7KgHloceJSLtYMMALcriE5OCVt6nYkeQwz5ERHe5t6imm3o60Or1hIF0dcyZXFvrTbqerMYLkgqia@vger.kernel.org
X-Gm-Message-State: AOJu0YyOEJGO38G8+xDfc2k7oj3arPzAbDQ6XsfqombRDDw2umAYoFzG
	1NO6M5SAn7HH8LesaANfLGpcWvq6QQloToD4N/uPYRDodKP2IFoP36VYG0x4Cb3CqDS28wPtVq9
	rsyoI7Ff5CZfFD71oQ+GGfO4+8AgZleUxVOHucZK79EW/o7XRuk9xCGU94NMx5QtLFnBj
X-Gm-Gg: AZuq6aKnoK3AJ3ddM9sDkCM2qb0w/Fxpm49n/4bGvNRe8rmdURbCli1isGrYr0jmku/
	RyZlNUaevhKT0+2EbdP0mLa+H/WAaC/A0Jp62+X+LrAqyHBt9iRofYgZGwK3pmJIF7l/aYosnPp
	xbrSRQX8FbnEPg+9/3rWQjr1Vbz/LJmrZWBE0VSmFpwIeyngHqK9I0iHb0yaxGk50Uu57RU8HEl
	1oJG5AOftn37yR5IztThw3mYO+ckX3vN12ZKrUKYFXoojhLyhWO8RMBO4xl442+1CkCszrEWgZ9
	ivx3WX+ylkJ9F0YQTnGSP84Dmd7Sf49qOXm/wv25e/0pxRYqcd8YCfAPGVOzcGYvx+UZolmCiVT
	P0zPW2w1LET6W32V7P2gW/qyv4NI5PUEppx3pYb4QRV3+4Lb+05ioa/YuzYe0KrcLKTevIOiJAx
	iAL5td6KDCtLtF880lRKev7yjXlPA27jeOSqg=
X-Received: by 2002:a05:620a:410a:b0:8c7:1271:f336 with SMTP id af79cd13be357-8cb7be3b598mr1899575585a.2.1771901617071;
        Mon, 23 Feb 2026 18:53:37 -0800 (PST)
X-Received: by 2002:a05:620a:410a:b0:8c7:1271:f336 with SMTP id af79cd13be357-8cb7be3b598mr1899574085a.2.1771901616632;
        Mon, 23 Feb 2026 18:53:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78799e7sm18391061fa.8.2026.02.23.18.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 18:53:34 -0800 (PST)
Date: Tue, 24 Feb 2026 04:53:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qrb4210-rb2: Drop redundant
 non-controllable supplies
Message-ID: <iw2uzz5ywv75hd2b27zspjyca4bqiuw62qep66ku3u4pmuzzen@azs7sspcupvb>
References: <20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com>
 <20260223-qcom-dts-supplies-v1-4-f90ac885b3fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-qcom-dts-supplies-v1-4-f90ac885b3fd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: M6qkJrVqG7Oduc2obe7alN9VGLOgMZ2F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyMiBTYWx0ZWRfX1loWsB0uGwaa
 QpyF1UNHaPD0RMBCKsRqjj1YjKDQWAPn3z8AzJ2YPouk1nPgZeXGe7zJWs+AXV1DwNZMh6gtkiz
 0R051MpNW6I5rUC9wgrFfZ0Ga4ThZjoDqEGaqEumqHEffuJiCCAw5zAhbqe0OIRoDfFGahUk2gi
 md/WHGCxfZ84U4z+vQlyuklxhUPaK5eCEOHecpDmGPOBZUsR4q8kkdAYpCH5JvS4MKXH4z8tj94
 witwGKX9meu0KpXLpkcGxoGj/JUgndOaQY7JEMubbtoOom3RsTUj3iLqZPgyCgftqZMR2EDR7G3
 TeHdPyZXeAa/ZQgYJFWv0D6f9yCouSTu0WZC5hy/X7SJmO/wd+/Vd3qkrIC0feBP+nsZbnJ1FzT
 6WA9Lr3Wn86wVUmEu/shdYXQlhnLVrjDXGG9Tk9g4ahmgV99H0mTQjTpfPySq++xJO/LTjmUOtA
 CWcxXMU12TtVe9aSfPg==
X-Proofpoint-GUID: M6qkJrVqG7Oduc2obe7alN9VGLOgMZ2F
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d12b1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YQIQ00YL77e8QyTPvtEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240022
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93860-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6ECDD1812B2
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:54:20PM +0100, Krzysztof Kozlowski wrote:
> Drop completely redundant non-controllable chain of "regulator-fixed"
> supplies, which serve no purpose except growing DTS and kernel boot
> time.  They represent no added value and because of being completely
> transparent for any users of DTS (except the bloat), they should not be
> represented in DTS, just like we do not represent every transistor
> there.
> 
> They were added to DTS without providing any real reason ("The board
> hosts a whole lot of fixed regulators. Describe them.").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> I really wish people say in the commit msg WHY they are doing things,
> not what...
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 45 --------------------------------
>  1 file changed, 45 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

