Return-Path: <linux-arm-msm+bounces-92553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOCbLJHji2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:04:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C189120A53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A2B6305466D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7232F3C1F;
	Wed, 11 Feb 2026 02:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o03j21BV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gwTjBaWI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AFB2DB788
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775437; cv=none; b=Bm8UU+5FBXh4SsgEu1feDiQSf17JVRkuZw/aSVbD627el4puIg3TXv/Gs16xbVanAHXU8tl1kD6bMnN6U7vXYAFT9ktvebWjd3OdTVTs5qbwL7H7BxzMxglgmQgM461qXhw0drABJ3QR5taFw1tJen/D6DYAnKpJlg4rmpT+yXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775437; c=relaxed/simple;
	bh=la4ssP6J67KlWLTxP8YBoUL9rR5X4IDjeKaGYyGRRRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUwDxpCyccEnFN3zQNTxN7Oq9NXURouWqvQ0O5K8PX+eIuDZBPfVlq2bF8UFk0LcjTOBCLroZocCNRMMYyW8TbmaNwnwKcwhmiHZTCRocmmIIijsOdjRatghuIcGkgFd7ADcFmL1VF2Q/cFsUgwRj3LT9nTmlK4okpGd0l3eqaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o03j21BV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gwTjBaWI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B0Zw2H4008340
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y/NjlHf1Zl7Oyi5VQN3riBej
	m16B9GgO9QOEnQtzwGk=; b=o03j21BVPVbcMvjZz2oiQLVYZqi0rgzd0slhciwp
	AsPEe0sgnkL/DXVKbZyMaYwuesgTaoS/KdvRZUQZEhhPkXJFuWQ6/5/HxMrnUvLh
	xt1sOd9z+nYW8m8+YVZcDx/BbRvT1hDHojjSMpt9qjfNG7pd7t3gpMFQGjQep404
	tRuILfCINC6X9JHTd/gUOQoXaKd6PGqY3Uj8Jufvua9g+E8AQJtQxji5oWcgpksS
	uklPJab59Ed5e/IQcVQB62s/PxW9Vff7AkeVadwH6yP1oAdtbQpaCBv75d9wQ8Pz
	8ci7/FZCQn/3TXeC85nt0D5MU89BS2uLbgRZF0C9fXHAKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8fbwr699-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:03:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so135382885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 18:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770775435; x=1771380235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/NjlHf1Zl7Oyi5VQN3riBejm16B9GgO9QOEnQtzwGk=;
        b=gwTjBaWIjaj8KQeKZh2M22qN4ejpR4pKwCDV0ww4kfvgbj9it5vX9/gwtH5qsjj6ZO
         GiVV/B93Flb6LGLpALKflOi8GT50IPIT7Vnr0eJPfscF3V2cKm5292PxLgPzdOiWxQ1V
         Ah7fBvyS6LM1KB2cF9fHC7qHjw27+G+AfAee7NgXEQV7/+DXLYXs3ZrYQFk/b7M4J1bB
         nDQmnpEIraf45wx2ZncYUNn4rbEmiT5Bxb2mTc+gR0Xg6k1W/9M2UhCEzojKIiupUbkC
         HFYPhq6n4K/atf3d8x6z+HZfPBip8UlvVgWUshNnVBwjVAQgOif9d2L/Nj2AHg8867OQ
         9t2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775435; x=1771380235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/NjlHf1Zl7Oyi5VQN3riBejm16B9GgO9QOEnQtzwGk=;
        b=OqJJSj3M7Wyy7K9Tgmyn2QGjFJEPRvdiT+D1eqykiQFlraGUR4MjO00hWD6qV0fBkP
         aPm732ofglo5wRagvvQn/kFZBGrXhFQzqT2DIKCFddDEfXnHm7M3YoNurLIJwGXXb8oZ
         2wk1HJm45zgWG2P/p87HsoNyBCgEXO/AhEe6BNsmre8xDUPHC8TZq5dL0/PG3DT0NH7Y
         t4A3XQse4wLQ9yJXVwMC47egBNfTBPirzaGZyvFublPnLbhN25ELGTON7b9T24QuFnJb
         Y8kDYTdz/q34XVDUQXqBC0OoHBVk8B3Myf2/wnF+Y2sHzv6siW3X3fq606FzkY+/yZ69
         yUzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMLk21F1KcnMq956/DCVjTl625LdvS/MC4v+jBP0QXXhGMcz96GYxVtbg3MDnNZKz/j0g/H0cGMYnCL1As@vger.kernel.org
X-Gm-Message-State: AOJu0YzYzLH7bZK1Xa2q4sN/kVOdaCji+n05vJwfXUqhyKn9eU6Qd6JT
	/lRp2X8UP3+dHgT/W+EuTJroOog4hsRhN6UrBshOk7E5bP7pNVksAi+qy82Yb+zfaZM0DKkMvW4
	tEKBL61GbUYzs2ghLPf90VLQ11TeTqpBtGcflQFu6dRhIfKD7dvVJqM8wiP9pu66jceqD
X-Gm-Gg: AZuq6aL1scDEe8Xmd1ujP+aKFvlOIDIFvnyLhhqZSf593ywzCwPPux1bBPzgK0OP7Ae
	pZnjrOlA+X5I0QDYWOueA7Sxtn3IOjcMJSj6QzPPn2558eBdGOjio+pR2mgjwlaDLNnA17DqC7X
	EGZqXajF0qzozb4Xprcb/DVtdH3XEsyJmASZVja5Qm3EeaEGatLvRKniRWFK4nM1lW+9qW3zoxw
	x9WpvWVLhcuxwy+EtczL5XWGkhq3iiuAGeNURMWDGknd5ontbYfOq3p7ubIh7Th113o6gip+bPA
	9ZQ+oC7Z66QSkqbrmgHjHWrPFFVR4uJ9xZ2I7MS72I/LiICDuhA1yULQrLcIdUJG7ya+P/WE+r7
	Td2nvGE4t8Bdgd+HepHLEO2leJLE5YKcagnnehb5PAGvN2rq8FTHrmawNvXkq/NozgvxPt59vmQ
	ejLaft6zF49isWvzu5Ll7SsfR62syMZDPSa6Y=
X-Received: by 2002:a05:620a:25cf:b0:8a3:a42e:6e14 with SMTP id af79cd13be357-8cb1ed74340mr557798185a.10.1770775434902;
        Tue, 10 Feb 2026 18:03:54 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:8a3:a42e:6e14 with SMTP id af79cd13be357-8cb1ed74340mr557794985a.10.1770775434381;
        Tue, 10 Feb 2026 18:03:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3870689cbbcsm566451fa.10.2026.02.10.18.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:03:52 -0800 (PST)
Date: Wed, 11 Feb 2026 04:03:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: lemans-evk: Enable the tertiary
 USB controller
Message-ID: <spo4k2w4rfticusog3le2qd6xx7aefydwhm664shopclx6rsac@asu2z67q3ke2>
References: <20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com>
 <20260210125348.2800846-3-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210125348.2800846-3-swati.agarwal@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GM4F0+NK c=1 sm=1 tr=0 ts=698be38b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=LiLsCedRSls9ElGAgoIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: qz_1lKh0XHO_OzMvUXWd-JZuR_Ls_XZn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAxNSBTYWx0ZWRfXxMlMounGsAtE
 4yN1zybhcVPuHnEhtlG59jg09DzhTwRfjHNtUr0DL8qiHZGNu9q66ndxAZ7PPVyImMJciP9BUMR
 Bpb3KSa4xrgpYfU/oRdcNBeFuxAigQMpXcUpkjy7dxFbAYfdvdd8zdZN98ENnHAqOPE3hzWUIxA
 8dCWE6HYm6GkdBzHT8VA2CTkzCeS5KlI16c9hEN4NqfA6qKXmpUwAWPbPY2zkT7HT9Lfjv9aHff
 ukZa3X3ZEvma/z0eKDXhYMnL+B9cpRB6CXB8wwyDZhx4Xk6uu6bSSqGkhzyv3lFkE8ourkY1XAI
 YHzswtG5J+Vw3P0+859xuCccPjAkysdCilXqWhJdol3t6t7p6EADW90orDMI253tBWWMUymW1lK
 inHM72ICUhGKP7TNkH1XH/RFTtxsVnm8/T0Mn/hfvmQSGEyk0XPJOkaDHS6SQVdev4GBvdSK5Ke
 ys63NPMK/QpHegU5JrQ==
X-Proofpoint-ORIG-GUID: qz_1lKh0XHO_OzMvUXWd-JZuR_Ls_XZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110015
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92553-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C189120A53
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 06:23:48PM +0530, Swati Agarwal wrote:
> Enable the tertiary usb controller connected to micro usb port in OTG mode
> on Lemans EVK platform.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi    |  7 ++++
>  2 files changed, 59 insertions(+)

Two separate commits, please.


-- 
With best wishes
Dmitry

