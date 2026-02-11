Return-Path: <linux-arm-msm+bounces-92547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGO8G7Xji2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:04:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E4B120AA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 968B330A7968
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290562F25F4;
	Wed, 11 Feb 2026 02:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTNREKyY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0BBGcj3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BE42F39CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775379; cv=none; b=GEkzvzOmJU/gBZ2zP0JFBwEm8AdBtKfSv60eENL++SgyfvNBA/HzoEPQ+2PP5to7YLyZu1/Q0JmO2qjn+u3Vknl3CBvMVM2wWzPsy5bxmANepAPisNpi7SckEnTaITQoXtuMTMQ3U5Z7rIIGGDYZlD0ZxmNKA89l+vwCGNGonlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775379; c=relaxed/simple;
	bh=T6G7YVQsFYhOGkDDT7cYoKPEjTDPSh7GQScV8zs8qrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbXNNxm3eexuHTz7UWc2WzezvtQ6VY/X9A+YgtFADf78snwdSLvPtE3Cz4xD4IgMx3DVBmnox6qMVHfR8HSG2HlVXRmFj1GYnm2V+LjDAb93LWeKRQhc4ttpgxzKkbt2/BviMI3QfVQ97SJqeaPeZJldUlXDE+MlCdLGsvwd61c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTNREKyY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0BBGcj3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AHFLUK2396794
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qprscrmdO2gzrzAh/SmswRXv
	Dk3TafDLjIo+l67tJlM=; b=fTNREKyYMoiapSvQPxHR94v4I4GKb1rQaC0cTCHK
	+0ckW2uNmLpZmpPn8OfvuASCd6yUhQquZTIY4cGWhTU68GEykzEuSd+mWU6oVaxv
	5WjPp1w/qb+sgf2cGutzYtXh1CFsSsEzmAjtlFWsEc0Z35EyZARemvISLu04onCN
	cxmRDCfTnwoETkQk6UXCoXsJOAFsZe2wKF7gjKU78iGKb1tM91YpXQ73yuEL4dt7
	d7BOaPVfXbbkaAOjgL/6rsEbMMjk43NjmS390QjZPJhEb2RDRnL4j1cuvi7jKXg1
	1K8GvrXraG97maFRY7d6MMNNb2Vp0bMzq16zzf/8Ed75gQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c88wqhh66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:02:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a5bc8c43so1917490485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 18:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770775376; x=1771380176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qprscrmdO2gzrzAh/SmswRXvDk3TafDLjIo+l67tJlM=;
        b=d0BBGcj3CH1E38MNuS+xi/ZkUnWbsWfZsWUWAhG548CrzFRUcRu80y0HZqX+LzP8ic
         Wq6V5rSl/0feLiuO7IlI6rmuASMAWgLoLaCJs5AtZs6qKQRLmaUm/enMNO+DDTKC3nnD
         E0uykrSsYRLeH3Njp+7H7m/lpt8nKBhHB2PTbX9e9T+R15eS5VbdV82NbiQPZccwyLF7
         4/MlsNNdunTgZLJXUZXmKWogkTyhkoHuiY1ale439qL8y/Sh9cnkqYdmvbfDmfGGL1g/
         xJV3wN0ydIYROlMEZLE52/twmsS+lgmtnalW2tY1tTK8MVOW+IM2mw4LsgjAzYAuHU69
         2uNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775376; x=1771380176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qprscrmdO2gzrzAh/SmswRXvDk3TafDLjIo+l67tJlM=;
        b=qEN56nPgi6N5tmGhKu1/TXlUAlxYDFGP45XU0e3cLjPFjHAbryj6NcG63liC/mjsBt
         PdkuPr8KqL2BsDGw9H8JZjjsqurhyZhHpz3sI/SHLqc9csMz86RdJhdzIIswMb5z1etd
         hXvyNWTYtZ2Q1Da6qkh00UMjyzK9YpNKzCXwzP0qBCg7D8a305T42joVcOjmgzTzKcOb
         7v9Gb75Aa5rqED4WHZ78uBHg3DdCb7wptejteCEUO8QmgDDUA0U1lJ7ie49ewWLmTX3G
         6BZ6RZLavqOvGdtrV0OzoDO9xa5NwL2pYHaBXyf6jGX736jfFK1zE6RZPubUP6sQlMSC
         jP6g==
X-Forwarded-Encrypted: i=1; AJvYcCVmHN5oKHjhCMvKnSJsr4DTl5UrN/ikf+Wcv1YxUK2Lpyy1EI/eVbqGeMQNdR0nsyln6lp56clVRNn0cDjD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8cqDM/bosxZmDPJCEpQOFiWD3UVPIgdbV12nD3ZMgkiUxpckU
	laz3z1PTA2RtWPLwB1dQed/jXT4uiyk+gdcdDmvoC6u/CMDeUJ5x6Uh/59+zLHaRJ+sXHrWPwDj
	Kw4MRWw78hwRNNxc9Sz/gbMnPwlqJ9/ZZ5IdzaZ26/w5LzynaHr55XE4FAGeS08IY/LUm
X-Gm-Gg: AZuq6aJrUHjg8IRXZ/mVfNdJ+uO1u/Gj7Fmv8rpmtw/5lAmmrm/lmYRRwsaNpwF6HqX
	G5ZSKQ31KTMUvxtBJKvRBo6g+/31VdlXNLdBU/kdXMpFJSJQS+Es250H/4ulXNnKwC9QCVrcldC
	A81qWScmPLK0b3ubB8kocQw9NreDG1NYeyov8ugQgH6b+jBjbbeJMklk6jxbi877uGyCoVxd0gM
	cjc0Xl+9oR4vPJGfuLdTh4mLLpe8LJXx+msz5ldOeGPoQddNr8hySRXVLtFF1NHpKG595w2kSp8
	fIDRB6vrSCVI3d19gg9tOfSQ4oxAwMyhtVE5KstrPHBXwsZhFi2eVVNm9fj6ECy58Gff2etALzI
	gVHyHa78bmDHCs6aiq5tWOW4V/T2kuRDYcNYpUodAEsrVZit1GccgwpBnD+PunN8KGyI0/SrYGY
	QI/9K2pbLZBcIgyyr7esxuma8AL+3BNbav6EU=
X-Received: by 2002:a05:620a:4447:b0:8c9:f996:81f9 with SMTP id af79cd13be357-8cb2ad3902cmr29860485a.82.1770775376306;
        Tue, 10 Feb 2026 18:02:56 -0800 (PST)
X-Received: by 2002:a05:620a:4447:b0:8c9:f996:81f9 with SMTP id af79cd13be357-8cb2ad3902cmr29856185a.82.1770775375801;
        Tue, 10 Feb 2026 18:02:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568696sm24089e87.22.2026.02.10.18.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:02:54 -0800 (PST)
Date: Wed, 11 Feb 2026 04:02:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: lemans-evk: Enable GPIO
 expander interrupt for Lemans EVK
Message-ID: <sx6kamyoenkemc64n5uthulkcawzkdpbwx46nzvh72ccxdwxto@ys562sqphmyd>
References: <20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com>
 <20260210125348.2800846-2-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210125348.2800846-2-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAxNSBTYWx0ZWRfXxIQBl48G5Zkx
 5yf0eMiqlLu/yx2o6HPQXtiM339WRNYfsbkEJrV5YaLKfYBrm4tsBsLqIvzAMi/QRWeAg+v4lc4
 FM7Mg3+ci31Vl2R6wTGE3heiRktX0S/A5phOxq0OG9aWMNasawTE2StLqcygKRttHUY4RYeePRa
 T/r5qNpH5wVYXTMiN5fLlqohWVkWMlPKUHJ5mt7tYqah6IxOrMNIdmZnNM8iFZqVNXRoUxWgwAN
 loseHp9OLklxFAv3HlJb550Qk5eudfnSOVW1yKF4oWVQNWJqcVOpNICdi4ex6BxS+8+Rihvq5oI
 3Yd4mEcwmHXoKyGyfmp9KG8pLlRHp8avRNKIZcpuKQV4zYMR4hiIJb221DPK+dPee1A1Gt/5Q1X
 3xck4ODRsXaSSmwllybNiolRKXk9ofs5JooFgVCyXag8p7LrIvSEf7Smm4JNSYoP8XY2PRWYQmu
 UE9+SjY3Xj+kWK/xf/w==
X-Proofpoint-GUID: j3gB8bj5Ya_jnGQATqh1s65VCKH_oAfI
X-Authority-Analysis: v=2.4 cv=W7Q1lBWk c=1 sm=1 tr=0 ts=698be350 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=0oXT2CdUHsumAo5zBxsA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: j3gB8bj5Ya_jnGQATqh1s65VCKH_oAfI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110015
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92547-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C8E4B120AA6
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 06:23:47PM +0530, Swati Agarwal wrote:
> Enable PCA9538 expander as interrupt controller on Lemans EVK and configure
> the corresponding TLMM pins via pinctrl to operate as GPIO inputs with
> internal pull-ups.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 44 +++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

