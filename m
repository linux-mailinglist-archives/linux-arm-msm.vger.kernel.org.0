Return-Path: <linux-arm-msm+bounces-110575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLv/OZRvHWqWawkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:40:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 490FD61E763
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC464306033B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5703F35F179;
	Mon,  1 Jun 2026 11:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2lSDYN7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCX6dJ7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0484357D19
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313561; cv=none; b=l74DgUGkjbDsM4Er/kni33qCePHvR8MsRvrYEfeVJ7Ex2QcO7yzP1GurR5xqcqQGJ2EJO8zm9aJxufVqPkf6q9D7wPHKp4T2CchOB6HKj/yz2DKq0fOESpIWmlXGK2GqgonSQMh7pdwAI3T1+3FDbPt4LXHfhL2ja4wX2TCEtvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313561; c=relaxed/simple;
	bh=KinhUJbjrVceL/4Wl+dsdy4Ce3twecfvD0JpSPSj5UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgC+9EH0Yz4CII3mw3laxhNKy0i+E6fdo+dS9MHBZXBhnN6LmsuHjABk1Wwexl11C8ekJb7NWYp1AxmSDbJjykL9c2I31Zu+zt7a9VpSFkrjSkftX1Fl8lcNb3ueOdxMSvre7f0zTINJTSpH145pF1sWl9tLDerus6WS6GbjdUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2lSDYN7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCX6dJ7a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518ddIT3563820
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TcNMxS8xRhmU7EwCryiVhoez
	FRvWo2OX6g5i8iYoWQE=; b=i2lSDYN7NYJxU/JcM+TRKvV+SVJvK80al4qrAUCU
	TQXhsnY2ZjxRYmiDpGi12d3DHuxBWjrvuXXNhNgoDVoj+O5KL978gktcCEgT7gsD
	inuvM6f0jC2ryPNTVA18oQsQDxTraYtrnnYhRio5Rt1uZgUzOEdmzbC0nOSEPM4u
	0Yfjat9FIyckDkSK7ZDDFVq81tZ9qomJHOIwEv9rNTjYZj7PAJwd8j7ps41tUBbM
	gl9OjDIeE0Jt7Bm55yr2ATyP9Ux7IcS5NsT1wjw68rUYascAciT38gJz9WAer0A9
	LI+IIHr7C6eml5ARDUvwJLiUP1IEg4Y9lrUrdIZbzOC7tw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxrqg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:32:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cff652cc58so2213425137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313558; x=1780918358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TcNMxS8xRhmU7EwCryiVhoezFRvWo2OX6g5i8iYoWQE=;
        b=aCX6dJ7aKCyZqclKAa7Xlg99yK8GbwfmJw8CkCk+/zyLvhMUw56evDeTQgNzbGbmPV
         HEeAJ2UcJuYF8uxFtz4GWW517C8JjKJuBiFOKisxkwWqKEp9Jq15DRBOkKBZ/EdjJZIR
         WxtBrgreV+Uxjd3486CQOyfUVATz4l9OljzD5qepngyyUerJkkViqQUtuFsk0adGIF9I
         c9Ml/LxoWTyTk1BaHIw2+r5XSygkuwmCLInbIpGQyrsXpVM31Erdt7x5cgdj1QuXqe9Y
         b/2UvDBZKotJ6ZVKVBZSZyX/vMnir6wZK6rTVjlSHX+shx+28wDrK0kWTrCGvwLdZkFN
         Mq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313558; x=1780918358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcNMxS8xRhmU7EwCryiVhoezFRvWo2OX6g5i8iYoWQE=;
        b=qgCll7Fu+a83peE3WKnubjOWgL2TgEmLKTWfO4OWR8dDiZcE/VYJyMBNnZMeKDTwl2
         bnGT5KGa0/vQuQ6jPUP2oAMywlxSmLPgKn2l+6ibCF1dPpL8lf3wXUMvdB9+bEB57l5/
         cF7+rTK6osQMbh3CChGDTzJaWIHdK6oYKWu4Ntb/6cRbtOgYAO+NTOgcpMLvhBopvzI6
         zZWXs/sVAioCbuBf2F1awSR1oUEzyR9Hm/F3glE/kVNOjZq5kuPTvLU+bLqL1nJSDpk/
         Z3qitKU+GJFAN/P98zDDCQuNGUf+96lf0ZC7lqzZi1f9YjCH1a3W3unkdoJoUj3omXT7
         PALg==
X-Forwarded-Encrypted: i=1; AFNElJ+KlmG2E628+8EaHlC/NNgQXSWh3YgaQ/JNJv7ZW7SMgUxL8UhbQEcDDOCNw2vzctL9KCIK6ZB/nkZT/NwF@vger.kernel.org
X-Gm-Message-State: AOJu0YylvHnRfPyR6WZZsudQ2yIhdsNfRNqSN7kqlMRJRJ/weDFYdHNl
	zacrwmSU9I0Mfp7a4NVB+TtX+w/jZ9tj9hU/Z61yxWwlA9f8iyfm1o8Zi9m12G6enirN+f2S5uP
	EZ6zzm+E1JLWnPsTL5uIKpt5h7hN1h5bXr9FV5dXGiYrhrH1AbWlSd+i7wkmmgDU6dWxf
X-Gm-Gg: Acq92OEutl7tGjhZtJMAy1utTIzdUPv5o4H8sliUJ10caczmBpq3FajGto7vX53P+io
	JMuOoWBwHjsZ4T0tZfHydffROihT09DzRAtT10eK/0qsZ6Ik94W8RxKQEt11C00+pSsK+smc12B
	RktMb/ei9cUQiv9IEZsI7vgdhvZnnT9JHmXLE/9IpYnSiY+YJe6LCUOChc54NAiiguHdAGYCrkt
	Ul6TVNcy/v7PC9qFPbkR9vsoybVF/H2mW9VAW7VjD5hyp784VgCYAZKMY7q/t8XV4hmwzSSbaai
	OlyCSCgcj0/7P4wTuC/pCBCKSQxntf56m+V5rcId2os/hnnY0ZSl70i7GDLHhlX8kjko86DWEId
	TibvsvJfVGJtUB2r2i+0LQI5c6v6FhhLd5YM4D4qN/fDH/bzuUfdzSY/iULORimZBg1Z5D8WwQ3
	aRiSsPbFVjYD2fSYtJN3bhOTwkAlK8VZsw1vNwhGfoGIyOiw==
X-Received: by 2002:a05:6102:9d0:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-6c6a72cc962mr3699787137.21.1780313558090;
        Mon, 01 Jun 2026 04:32:38 -0700 (PDT)
X-Received: by 2002:a05:6102:9d0:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-6c6a72cc962mr3699774137.21.1780313557681;
        Mon, 01 Jun 2026 04:32:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396840dcfa1sm6288321fa.40.2026.06.01.04.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:32:35 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:32:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] pmdomain: qcom: rpmpd: Add Shikra RPM Power
 Domains
Message-ID: <l63dp6mv6nu3dquqs5mzjw3izg7rk652dszq42qddd2yj76yai@bhxr4cekvu7w>
References: <20260522-add_rpmpd_shikra-v3-0-632838e2428a@oss.qualcomm.com>
 <20260522-add_rpmpd_shikra-v3-2-632838e2428a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-add_rpmpd_shikra-v3-2-632838e2428a@oss.qualcomm.com>
X-Proofpoint-GUID: PB8l0r6Rjwc_JC5S_VJwvcLla1TobQVY
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1d6dd6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=uP2ZawwrIzpawsG4yqYA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNiBTYWx0ZWRfXx+Bjwg29HvP3
 EMh0sNo6qjw7OlkdwacZH99GofH/LHKQ2PxRaUlmZTdBwX/b+PtxQqLty/qWD575DZtx9uZV6zh
 Ff5MQY4ym49zfvwR2/HtCEFNpi+kVGp95TlkaVrp26UBuV9ioaUO6Kj9meC292OmnT2TFeK6A2n
 q54GcsxSp+/0yIj4C+NHyepuF7/euSBmjrE/aP/k/gY1nhA6GuYpRZdoS9wEKs/KeAGrvC8lZGa
 oztMZhfR71NsdDIPpy4xyE3owU5khC6k8Ymr83RUx5avYxbPhUvMM1iBmWGMsCj8lRbt6DUmNda
 x72rbGXddiaZ9bwVtP3AxYYm3510OCjM4cD63/u5+KhKPC5+QeTC9hkN5FrWRpoAsFNZPEtk+Jw
 RP/n74yvSq271WJVm9IMOuUxRsTUiP3u1ii8SdteaXjISnNNmyALh5DYC0CuZZsiEqQsrELSYYl
 FvvPyWe6P9erehw0nOw==
X-Proofpoint-ORIG-GUID: PB8l0r6Rjwc_JC5S_VJwvcLla1TobQVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010116
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110575-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 490FD61E763
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:51:55PM +0530, Rakesh Kota wrote:
> Add RPM power domain support for Shikra, reusing SM6125 power
> domains with RPM_SMD_LEVEL_TURBO_NO_CPR as the max state.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
> Changes in v3:
>  - update the subject.
> 
> Changes in v2:
>  - Collected Reviewed-by tag.
>  - reused SM6125 power domains as suggested by Konrad Dybcio.
> ---
>  drivers/pmdomain/qcom/rpmpd.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

