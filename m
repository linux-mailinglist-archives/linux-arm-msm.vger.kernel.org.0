Return-Path: <linux-arm-msm+bounces-106947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB32DPncAWrflgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:43:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9883A50F2EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D09E63051493
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6B13ECBF1;
	Mon, 11 May 2026 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Am/abfV9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGmhIlxr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D8D3BADAA
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506807; cv=none; b=dxkKTelmjcfhxG4KVOZRUWt5dGYko+04jXzo1PSc85BAJ8HyQOE5A4l3Dl+Am1bC/xx0OGTzg41GVGwwITKohShRHF9fvs0p5/9BOt8D+gSoQmmdKTA4PExjwrv7miUK8omDPYGoZowUMbwTT031uFakyGI9pRPC1al2ZGV7g0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506807; c=relaxed/simple;
	bh=k8vpbv6E0xaQeIphwi1YwpaLutso5pMe/mHkN2I68go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6+52d8vrYTVaBZeiLg2itF8XI8hzVQXuPvrEjeu6K/Y9Vby2jiK2LiVAThi+hMvYhl/cYY2Gspy9sXDCwtYXByZ6rCxYD88hX43WXHIqiVdf881TKu+Ol7u7drbZ35qSAWmZ0McZq6uY7SiFVxE45A5q1qH6wkH5jFUUefPJa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Am/abfV9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGmhIlxr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9INLQ652808
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xFVVJzGZ8bN9c3kBkqw5uWj0
	pG+/dcxhTA6OGEfyeis=; b=Am/abfV956P/01FZ7bqDmUs+y/wxZGsQIMoqwfjC
	NNoutIMej6mDJ9wvjVMwEHkFcC6b6RgIDdHGj4/LGW7uKFzRcL4ju5F9SoLKn5Y+
	v19638QGlDolqfD11LDmge3mnY1ixtkAson8V5PhBd8P9XvR8NGIeYZg5oIzIdl/
	CcQEXvoDTOxO8ayZkRq1jwRSNDU/U3wNOmotRk5egu14JNj0dmpKAuKJaMy42ta1
	y4eKIv6bKjvqs5cIVmjFuki4vNFghhD2V8xQQkI3KC2H4FLOz48pmX7Sb5O2zNbH
	kEboSxI/YLh5ip7vzGWyCy44I7fpUpVTXQUIXkbszrbJXw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xu9wx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:40:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6312aa1d7adso2379223137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778506804; x=1779111604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xFVVJzGZ8bN9c3kBkqw5uWj0pG+/dcxhTA6OGEfyeis=;
        b=iGmhIlxrmtZLpxH1+Em/g7MwbHObKK3jU5Cxt47t6b69U4p4nkcYCJ46L3Nny//pH9
         sqt06e3se/eK3otFNj4UvZOOzsTHxjxwyEgR0k0Wcr6Ovt25+BAyzRZ1j0mSUrBVJ6M+
         7RxQFTNAqV+uaUPdDswHNq1vTwDouyikLdnr3kSt0VI/e61rkNVK6ciXkKLvicEAM1nV
         Sg3BAimeguWbfO96P7RYAbOXcg7UkWHAuLjdmPxF31/r1brPDIEWGKa18udMRFENvrqI
         YtoW8F58tsvuJJ7eVWIvF3ASxeOJch0BRXWFKpjXw33496dOsOxkudhlDq1VFED0drRy
         Nc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506804; x=1779111604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFVVJzGZ8bN9c3kBkqw5uWj0pG+/dcxhTA6OGEfyeis=;
        b=VYZRdCvo1/DWMkrNR7HT2Lfanlwbc5ufTdGGxWN5ugTb+qL461+xYQxbXsPbE/Ftqv
         B6KC+//4wDl9sLH990NpyvkeOSk0y9hSLS//a8cbLUS/Xu8PBQ3x5LLxazNAc8K4R4bA
         Iqe0MO0KLFVoCjh55tm0pwTAj3GQVETlBNccYjGI94pRVXjs7Z4HTlHubVPrkspjnU62
         NM9Dm8oP4TiKlqmFA+Hmu3u4hALmJmg0iET71CL9uQgBzadxaxM60CmtFxu1QSFXUc4w
         yZ32uPUPb0Ub+SaWcnlcDAiy8/3Jz/Z14izIl4e8DVLlQ5qA8nzDWYHS60IW1JHsProM
         Xqww==
X-Forwarded-Encrypted: i=1; AFNElJ/fYNw4565e2wbTaAqffslfiNkgi3QeaOVNf1xTsenyLM14pF6KCQLWMscIRoxVcywaEuVeVWhHeGBi86qG@vger.kernel.org
X-Gm-Message-State: AOJu0YwxioN0ZT+azOk2Oili0W//hFZas8YFPkVUFKe397DR52LDzJdE
	DhPBpwN15sLfaoumfWXiFlixs12nTpXsd449F3DjgvjvVhIhkELCDkbPlQfF3qDBuxFZ0boUqNw
	lihXWxhE+0sO/jpIWeRiQlmueTSe2LV1fedkplKzSY32uJIhXCgTgGfRlKUpWjBRtA476
X-Gm-Gg: Acq92OH+NjoB+NKbRucx4ces+36oDnSbywXZsdyP7piLyjtLF+y76oJC67qJ9kLhH2w
	A+0Zv5ufr53lzNqgWkBCabxe7q5QRnsVpX3Pe4YK2I8peeUu6FplAHIflu3V7eFE9lrx07uIcYC
	b/6nicg3sEzxz+a4RAsfgCxRAQ23mBRmnnJ/6WLqqNkHRZT0zJ024R7J98+DYO1vx9U5sPPkax1
	q/cBcT5J6cvfO9q/1hHcTnDK7qFvgGyn42EIZHuWoFs+rQqFo/C4UucYupkyMlUk1tnLubcDNCX
	UVQKQaFAFG4czs5to44Ld7QbdtjdXlt6G6NOeqc/uy3A9/heqOZyCTadg/2SmQ8Gze7h6WcopmQ
	NsneGIM61SJ7hdagSaM4DrM/VJb4fX6jmq5FT9FaEjeOrQ7fqi+XzGX+zLicAdYDpTzxDxK8GkV
	d17ncNipGoeW2KkkzCQK7ioFHzHb6AfIRie1o=
X-Received: by 2002:a05:6102:5091:b0:632:a3f3:914 with SMTP id ada2fe7eead31-632a3f30b8fmr3055835137.7.1778506804272;
        Mon, 11 May 2026 06:40:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:632:a3f3:914 with SMTP id ada2fe7eead31-632a3f30b8fmr3055820137.7.1778506803769;
        Mon, 11 May 2026 06:40:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c0c22b70sm1360848e87.81.2026.05.11.06.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:40:02 -0700 (PDT)
Date: Mon, 11 May 2026 16:40:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v8 6/6] arm64: defconfig: Enable Qualcomm reference
 device EC driver
Message-ID: <f3frppcx66vctnnbuogszv3caissgqrnon2kpj2rpdmlpufo6y@vrlgjgisxubb>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
 <20260427-add-driver-for-ec-v8-6-702f74e495f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-add-driver-for-ec-v8-6-702f74e495f7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a01dc34 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8EeM0g2abuOJCfGMYRMA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1MSBTYWx0ZWRfX/KASREO0R+6M
 yKb/rnfCRB4Zy92vE+JaluMMlnfF6bU5mYXGU8VVPm+BVz0IdF6Lqsr646XEhmYBRJNh0o9kUM6
 1RSMNQoN0uPCov4uSSYPMqwwNj6Iz1GZbO9f0UUnBII2+2VAIZHtoJ0Pzqk9KQCkwep+c1y0927
 UGGILnNYr/K9QkHgJIZVydETkt8gLWowI9GC5eQ7WrIFZ0PhJnlmHlt+HAW5Bxeh8NOg18lnjfv
 Jpdw68+ELitH1XAqu7Nb5E+lQwFfUmbjN2oTp0q98VC+b/M9Yu3Sca9eI9O903DBTqzoJy2T3Sw
 9DVgPcNOWPvVkQAmvgkbaxSZq7c0r0dBas5a8O9+MOhFpLAIvOcrKXo8MLhVd98ta2+LFT/71/a
 RTsdyS62t5pAU45RqnetfBJY+XHrO0lj+4ebD6WLdqy0md2OkEfOjLPfjRRZMdVC2EqM6QB1mme
 AbHBmaYfuMObuQiIKHQ==
X-Proofpoint-ORIG-GUID: GBujEC_qIvDQ9CD0erqs9tyuSdKbHNEC
X-Proofpoint-GUID: GBujEC_qIvDQ9CD0erqs9tyuSdKbHNEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110151
X-Rspamd-Queue-Id: 9883A50F2EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106947-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Apr 27, 2026 at 03:34:57PM +0530, Anvesh Jain P wrote:
> Enable EC_QCOM_HAMOA as a module to support the embedded controller
> found on Qualcomm CRD reference devices such as Hamoa and Glymur.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

