Return-Path: <linux-arm-msm+bounces-97825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPPOIqZxt2n8RAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:57:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E7F2944C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61BA63003BDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C84B31E822;
	Mon, 16 Mar 2026 02:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nql2zepR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kRxWVA1h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF1113635E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773629857; cv=none; b=AdoulJ6B25zGqQ25gKCGNLv4BJks3Kz8zLKr65UCJMHGD2d/2mpmRvb8ag7c2MKjnK0nGPTqh0cDq8U2+fW4h1A0oFSD3o9MtNcl+FOUoNJgU5Qr39yJx400+YCnZNxZ1hGDzNtbk7wxN7VdQNEWsvXqfLIyYfl3CYU/rr7grIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773629857; c=relaxed/simple;
	bh=39+mO8Vam2ZMleBYj6pCXFVbX+AiJnRBzl/jLDXGNc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nnfyd77lhLEvtMEvG6kEFH0QhEEqOTout4qgaTYS05kPeV5EMUMZB5UIS7i7KghkjZTz8KCLCp1UMzYksf8VAlVr+r1JNSOcALQnRTQzprpEMPj+jymlJQDoFZjk31jzVMybCo7Y1WBbfotFo3URH/hDWzvSzxTQH8RQrCUWYGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nql2zepR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kRxWVA1h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62F6U8sx3047000
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9EKqx59suweTA6E/vTasnn23J0k/ujVgtUKj81FsGNE=; b=Nql2zepRVZVY2+9Y
	N57siDhQZKIrOivRRvbXxtFxzS54zSmS6Lqj7WuAFIlI5tnUkAaZ0jitFbHLFKaa
	C6zGGLiHUXsiTVhxC8ids8w+UIkqCC7EYEubRaAIXW3di0FJ09OwVuhqr3cGevdH
	jAieJw7g1DNnSBV1HBmDORrfFH2CE/4k6DPh6XNGG79868WMJ8OKNK4dsAc+ex3G
	ZZowroab3pg7rYf5SwvOYtg/1hXAiJxYPGYeL8PlmA4uMll5Vagk95s0Axfht+LA
	1UGqvL1SA0gpYO+XeigRGUB4lTFzpH4nhA2u+YhOomiaeq3rQ0wYv3IF+dUo8Uz8
	/BGhBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udkrx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:57:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd76ff19d5so2502828885a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 19:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773629855; x=1774234655; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9EKqx59suweTA6E/vTasnn23J0k/ujVgtUKj81FsGNE=;
        b=kRxWVA1hyuAvPlot59Vt7GYlKepWXWIpwKXgQB//40RhoB6E82SiPKW4aQaAS9sIDl
         gOKJYwn/Uk8rtNwg10xgjrfMshuhWa+7TJPXdPBDaM7KkQg8apQUCXb/hPdzVWQWxCC3
         ivWMu6/Br/4D5SXcTMKGyHWG5sFtsJ2SItjS6FWZ3o21tS71n08sCMX9vjswCmEI9+am
         SETuonYXEOGFy0DqZZhFUq+n58Rxtd2rcEGGgetTsbk396gXcL2CNFIBZTMZJkl5R2fl
         yeP7YthTaeFnBrr3rkf6DzqkP3HC7FvVH+WLY54Ael8QvGGr8x5nDzZwj9gmjEY7Xptl
         UIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773629855; x=1774234655;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9EKqx59suweTA6E/vTasnn23J0k/ujVgtUKj81FsGNE=;
        b=BjVJeb9HglrHbwLYWYv99pVfxM1ZhNTZ3qzcnPF7Y5zu2gotBUy6bN1NCQEr7B7MiU
         Xdh1xKKAPorzifonteD5mBF/5OLj9eCdrJJqd/BycD+N/ZcUj1ndeIDve087xhHC4rHJ
         clWB6ZwRT3n3XNl0iPJOHlQoV1xHj15g0NY4IS4I/ZkasxKzESt2Tfgwzr46F39fCbBe
         ppN/bk5RgNA8NTre7VDA+zrNTxQe08bvtAN5/l9QHFJf8XCvVamT1EaYEXZwJli49ram
         weyjwLFfAjbvIXjTwXJ+0iETko0F9nxJz5w/3AHTjYFbUMOrN5AKTLrZesDmtv0N2Cow
         BnPw==
X-Forwarded-Encrypted: i=1; AJvYcCVzuVfdEK5uK4i0bbeTto2O/Z2DSyuzuS/hL4huEXF/ipMeRez218wNgncxGYTRWvKWPSqfkTdZcLj8HSdx@vger.kernel.org
X-Gm-Message-State: AOJu0YxxryoSI70DiNE/2WJjvLeygTx2DO8+K8f+Us6Kiwy1G7FKirsD
	gOlyqhKStx5gwt5sa3/c137woyX4kPIOfwdMY+I5UZjSBeo63azlVtQ2Da+fzX+kdTvTb80cRNs
	AHGjwfExjJife4NUAAcjaSJXNqze8TZhotV+bDi+ZUAGYcMVJ8uAZhPzsH2nb+E6hI1n4
X-Gm-Gg: ATEYQzyPPIizQzhxlkCe6fb3dqybyynJXKGii73qxaLg+LQzB0zoYBEsmq8bQ+S/z4b
	668Ku+9e/L23Jh9ZYqBMpGvCRcWiBgrCWUHMu2DwNOMIrO0FvwoY8UncMrb9eyrutdo+W89wiwD
	N4hjB+zapoGBEQZH1znh14Dejs8liAnq5E27TxSboGbeKs2MuYBWAMoXtyRP55ZnOhhrkPfATZb
	5+c8rNy5hRSm+Iiu5FeQL6hr7FoUT0wdY9GWpiaI//Zsp3Z27yxMsG8/ECzM850DwvXlb8NVT3s
	deJTJVJ2XvOp5pIKymJ6b3dxxdym9JjeJRqNYdFpFgXEnYRDplC/pO+w/b4LaverOrinD7QS42q
	njouzsfPrpnuLVfwceBScpMeK2lpJ+YXaHhJznkSg11NEVpL8og3CpovILzyUHhLi08+GWZs85M
	PP9Spy9hwG6bag3VzUTaIXdNrCeSM/zP/wOG4=
X-Received: by 2002:a05:620a:4713:b0:8cd:98d4:f175 with SMTP id af79cd13be357-8cdb5b1b150mr1493227885a.52.1773629854701;
        Sun, 15 Mar 2026 19:57:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4713:b0:8cd:98d4:f175 with SMTP id af79cd13be357-8cdb5b1b150mr1493225985a.52.1773629854267;
        Sun, 15 Mar 2026 19:57:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed6esm28647421fa.23.2026.03.15.19.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:57:32 -0700 (PDT)
Date: Mon, 16 Mar 2026 04:57:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: msm8917-xiaomi-wingtech: Add
 goodix touch
Message-ID: <a6gg2z7chcllkytsrlvpmcbtaolwzhwwj7rip2eyvgxmxgmexu@msh4z3dkaztj>
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
 <20260315-riva-common-v3-3-897f130786ed@mainlining.org>
 <6bf1a210-6597-4d97-9871-ff82b5aeff50@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bf1a210-6597-4d97-9871-ff82b5aeff50@ixit.cz>
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7719f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=OuZLqq7tAAAA:8
 a=-dtjKa-qKq3EqHSsPZ0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: NwjumkPWLlxI5cYAXWSH9ZNFsA_XYKml
X-Proofpoint-ORIG-GUID: NwjumkPWLlxI5cYAXWSH9ZNFsA_XYKml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyMiBTYWx0ZWRfX82s/ypD1IRYz
 /IoYXPi3AQsAj/rQVtvjiPBZZswXlg/tnIuREBoLhFdj4+k3gGaX0ksCfVKoRC1XcHscAJi8/6Z
 51bNWCOmYolC+0IBx5vbhe07qi80Za5URmvRzQkfCW5t+KPYvckSaHd1cRHjIXXAmCZSFblEC7u
 hLi3fYDtohKDdlvrwaikity0xEm9+cTjTvbwsYU593K285ZVLkssLHC7Qt7nCgKyXb6h3CqWlLh
 Ul8SvAVdqCzf3cTS35pYTmKh1yaDTnnyTQF/aF+2pdaJm834ohchB33qxX5qTpAsMAjWqaX7Fk8
 C4fbjHqD2LS2YTacRYxeJt9aHaVjWkBRQngA2RJwoAIQwE+sKo3CffbMobVhmgUJnHgBrs1JzYA
 82T/yWovGHY3LJrExoq7qroyvhQo1+SCMS2+LnNHDTymAUHODD/Y9dFMXGDC8sk/fXWjVoo1oAr
 /AApaUR1W8VC6Ydb9ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160022
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97825-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81E7F2944C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 08:58:01PM +0100, David Heidelberg wrote:
> On 15/03/2026 17:26, BarnabÃ¡s CzÃ©mÃ¡n wrote:
> > There are variants from MSM8917 wingtech xiaomis what
> > are using goodix touch controller instead of focaltech.
> > Add goodix node for make it able to use touch on all
> > variants.
> > 
> > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > ---
> >   arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi | 16 ++++++++++++++++
> 
> The file is not in the linux-next or linus tree.
> 
> If this patch depends on another series, it should be stated here and
> preferably also reference (can be done with b4 tool).

It is added in the previous patch.

> 
> David
> 
> >   1 file changed, 16 insertions(+)
> > 

-- 
With best wishes
Dmitry

