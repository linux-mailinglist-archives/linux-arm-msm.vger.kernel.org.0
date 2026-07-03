Return-Path: <linux-arm-msm+bounces-116427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M5m5NpFESGp1oQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 01:24:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2E70619D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 01:24:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="VYD6IJD/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aQV1FoMO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116427-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116427-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2526302F3AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 23:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD7B356751;
	Fri,  3 Jul 2026 23:23:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E0831E827
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 23:23:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783121029; cv=none; b=PeriqHrL3sAYa9+mCB//mZYb5Q7eaWxGIbC92KLUL+Fa2tezlugqhf8/bkweNO1SiKfyoBWw8lH/uA2eVYYpq4YguUhVRzXHsZUnxtb5S0gCs+KqmtFxrLw3nf9Ppja01LzshEgQzjXxqrnMiiFQj1DTLuBnP18iwgD+KJuEhwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783121029; c=relaxed/simple;
	bh=Q6MpStlpatEJkDy1dODKrw+pHg/8lsoWpNmaJPV+J+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WS8lvIOO+FcInufkQUsz9BehzF8E65aMMwr/fx7UqXu0KizzggYiEMlg9rsF+IR9kOER+IzmGXnt7BHKspt3hMUzyPUjZoxySiKNyWlGQuHM/qDG2eTKI54qIIJWFJw+hSpxLPjIkRUbut+NrigK/vtJn0sNbW/QJrAAjmlY8Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYD6IJD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQV1FoMO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPVX1972880
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 23:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WcTSMA6ScX6zdWc2oJ6SMCFD
	q/6WkQB0iYOmZRp568g=; b=VYD6IJD/pYPHVAFazsqV0p5CfCOmIR2/XXiuz2YO
	Z0h/XjKzvXGSHvxn2NPl9lBZNMg4FY5F972rC7A2NDN+5gF6v6PmJ0oBaGXvzOUw
	Y/kTGvoddBw2llUHfgHqsmIPHN13K7Wh/TTLUSUCSpHlDnkL3akvT+HlapPVCw+t
	hCShGGNSNsWNRY6zNd9tlT6G1gD/lWvJGBg1trbGsmfIAp45G9MYect1UqbAIJzW
	QwTvuwZ3fgcR2YWWKOO9BNPy0UIn1sPExRNZijiJj7lwJvUUl4gyDmBK4tazgU9/
	giWEiOXn3BzJm6ottFEFmC+NdtcNjnYk9RZ/ZEUrM1fWAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b03aew8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 23:23:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e73fc29bfso142653385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 16:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783121025; x=1783725825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WcTSMA6ScX6zdWc2oJ6SMCFDq/6WkQB0iYOmZRp568g=;
        b=aQV1FoMOGQxSZv5lmx/U2RslFPssjyvV0qsyYoxDBt0kGbN7EmDLim2rLFpttqZS1D
         Fyh0k5cFBCtaMPfDZhLikWx1fGBMURMY3IJ6eaKvakWR0k4JGLnxmGh0Vg531uiyhXd/
         VOz5nVEsZzQKzDS6X4XJSsuSSkLIW2H80q/RoMrVdPvv47RUFT0FXDHY9N3t1G5XMkQP
         w/uxpvHoDWcNDf2ZSpOnDbFxEK4T9uoaVlFLCLX4X4mmwBlJUES6J5cJGqPDSc+hY3y8
         DS4HjHzmgLVzQg4jUy0sQoQXSr7jhdq6XyfNJryZCAeHuxcZ/ChmPt+OTSJpGgHSZw5R
         OH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783121025; x=1783725825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcTSMA6ScX6zdWc2oJ6SMCFDq/6WkQB0iYOmZRp568g=;
        b=o5JYUDfUvM/8XwUq7Rh2ZYzwYi7h6h07FNI3yVMk5gu2VjF5ofKg9a+ZU8gEE8BpSj
         XZ11/jj1JcYLY3Rz1WqRSkPSuXWDk5lbHd+mlAZ6MJiZJ6l5nzdeQHpHE9PXhq8Z5sLL
         T5p5U/SmH6nAOQ+5X03aIeZp3iYZLMXZ0JCFbAm5CuNibzio+YyuLRfOdclnOdywpfe5
         DCejxQoMy/8WCuh3uv0LPWo3dxx57hlU0Ma5P9Ma3cJYnpmtILOq3EMlU4FKqIC8qIrX
         RFE2IFNBzPgUVV0Wnzq4K4ya+eWO+hdyzrFbaMNfsfmItI8NzWl5JDaMHwijvTfLA7xS
         n+1w==
X-Forwarded-Encrypted: i=1; AFNElJ/oQ6gVu82JzSFYoJarTQXGuoVMUjNrCbY88buqEEV2pnAKxcyBXF7VN3swhmv1bUKIFt66waZvo214camZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzFCM6U9j5VMos4RYs3pCxk64FMQ5HKIVwkiChzI4lTCKKfKIBV
	+/bcWakn2bXWtkPeGs7kjNJ9adQPK5BzxjV/DHNcZ3UpGcrs4NrIWMz+EsoX2USUi0NiJ8RdxfK
	esDfEQbwjrEq5QoohbbwncN5HOtjPYAbnHOTcRdXWRa4FDRUQK7qTH7E31+oFSlE64I1B
X-Gm-Gg: AfdE7cmsAWEweQf3Sl4z0lJ4eR58PcCZqRU81ZNQadMFPBsSKbnMDS5lA7h2YSrrBuv
	jeoRPTYOta+B+J+pGX8FPgLd5gC37Xm31M0GeFT5DUJFZW+PGoqhM/ypeJbOTsb79CqWEfDf3HK
	17rXWNtFmCEBAD2RGKhsP2Fx78V+fHNMBKetNCrsGiM4KG+qwSoE1VBA9uCuP56bMGhdluUQm20
	Da0wQMOb4YIJJG3hop/wJuJUXUM3q9O90c56sToEmblz3uj0JjHIQnsEr/gHBE1+NaCQjYFVTQm
	5hCQuNFyO2pmLb+cDSvjJIqz04UMJ7oe+hZQGxrnG6cn6IcWajUcgMrGaCIwIscm8/fqggTpBTw
	lUvUSnwOV+um7/fwwe7onqLGBciGcjHoJTXr29O8KKBTaXUH4kvdKpym0Z/ez2IvVTKhl8xAX6d
	n7R8XETmweI0Rnmg/9yXUUw97S
X-Received: by 2002:a05:620a:4398:b0:915:de68:1802 with SMTP id af79cd13be357-92e9a48b911mr200515685a.41.1783121024794;
        Fri, 03 Jul 2026 16:23:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4398:b0:915:de68:1802 with SMTP id af79cd13be357-92e9a48b911mr200512685a.41.1783121024441;
        Fri, 03 Jul 2026 16:23:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ae36f16sm5168201fa.31.2026.07.03.16.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:23:42 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:23:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Vitalii Skorkin <nikroksm@mail.ru>
Subject: Re: [PATCH 2/3] firmware: qcom: tzmem: disable SHM bridge for SM7125
 platform
Message-ID: <mv66rmk4ckke62zpz7wjbbzrxfumsjmvf5bpfr4al6zy35tg4f@45iknynh6rcd>
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-2-3e5f752048c1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-sm7125-samsung-v1-2-3e5f752048c1@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIzNyBTYWx0ZWRfX5Y29yfRulm7w
 AFlg7nFEpxS8ILt5LV5/esRU5rnpplYzUApwTcoM/9M5iWb4ahL9akqp9D8jm3zpfZGQIzAyWt0
 YAV9+X2QGXkZRqnomdnG9/TFV88jKkQ=
X-Proofpoint-GUID: qVeJLEbtQPKxAFWWsLuKJAhh20_StzKK
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a484481 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=RgBw9RmQAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xxd52h_9Px5NHeBr2ZkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIzNyBTYWx0ZWRfX1+KVgGMujHuy
 Om8nNE5fbSliQ/UuwuV/vuo9Nh732Xc9z980h8ipNnf+cBS70pIgvuzfRNeqc5KCbQn0gXLeBUj
 PXzewnId6zQnxH0D4E94rt6kSInIAvcGd1FdVajo2NLRwkukfrxXT/YSu8y1qje1IybspgA9VSM
 mos7fDPab0I2orUDeF5DiKa/Mw1zSZt/DIYWoxY5SYMso/huv7ew9MFpsjnVtlVf0Gq8tWSgRtL
 7oT7VbsPzXVRm+6LZ9W4YR9tIqIrhuLcynsCnApRJDucTAXbwZ1vjXWBoZl0QAy7USw++LSYqDM
 1sMs1Z9tA4yPeaU+FKfD20GQzKhO8B4tXCbiMlUKMgd6pd0XkGa6ZiHd2vNY/sqrVpgbGzxEhE4
 DRp4RHbPZGuYw/Y5E2PrwI3k5XfdfByis///WAnt25U2S+E7g/jgrBOLMpYetcjlDOzFOvWT0sd
 lWylQQE9L0dKCRl95iQ==
X-Proofpoint-ORIG-GUID: qVeJLEbtQPKxAFWWsLuKJAhh20_StzKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030237
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116427-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[45iknynh6rcd:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:xerikasxx@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:nikroksm@mail.ru,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,igalia.com,vger.kernel.org,postmarketos.org,lists.sr.ht,mail.ru];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60F2E70619D

On Fri, Jul 03, 2026 at 10:59:39AM +0300, Erikas Bitovtas wrote:
> From: Vitalii Skorkin <nikroksm@mail.ru>
> 
> Currently SHM bridge causes RCU stalls when booting. Disable it for
> SM7125 until a fix is available.
> 
> Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

