Return-Path: <linux-arm-msm+bounces-100880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCu7KOPEymmL/wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:45:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 540D535FE84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2F16302DF82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4534F3DEAD6;
	Mon, 30 Mar 2026 18:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksY/POPN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGba8TzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B721A9B46
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896290; cv=none; b=WfiduiUA0Fjl2gKTImBDHIydaPIaMyCJgkRPbefag+tZrGdesiuttX8CdXly5nQOMaTtBG8kz0U5U+F4yqXG+IcIcTgw9873OeODbPBH6/E+irfHe0SL5kK4krwKVFhPgmTjXlROdIMEQDjM+20s9xd8su1rvl4XjYrhDyRVUfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896290; c=relaxed/simple;
	bh=gXLvk9dwABkJboVSApMGx/J/bEviA8VAdA2daXR4ogI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3noB/pZ4Gz5kk5eGSprdZ/4/pcPXkBe9oOJbCaBSsAvKfnxCnrHeZkEdcrFJ68SJbuRH1HU08R0V0wxMd5CD+0uUAZIXhfKByHQzs8daVwFI3Ltnv/X19t05+nYRrwjd58aRmb1K1rfE8rWFHGKjGc4gPHktAK+Kv/+T+MO0+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ksY/POPN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGba8TzC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UFgA8h2723192
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U3BypvaiCzdl51LZPnxaZahf
	WScLov+LNP9bnfOVtuA=; b=ksY/POPNE/1HtSSApgA6Wqp2dVJZtz+Do/AeK7Fa
	NEedQBsGiSj667F1q2lo28YmuenIN74OjV8v2+g0vHsOK2331050pcSBZ2PrXR1x
	mMSkEthlO+7IzurTyYjPNywl/EG67aUUfrCTDZzqbSKdnsPMhbGJnyRpAWCXmf82
	TBEvtj3ox+/sLYozrTkimfpSB4krxO5f3diROLCGKm8rAv1awr3M4lAub7DgQYd/
	IwgJpvV25+RKEfvu3zbYLUggDVfvOJvRZOVbvTf+DB5oJAjG11JrH42P8gdYWPfN
	7PREuajkpCwEGVIpajTybd0JiUUn8GT14VbsNdaF4CErzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7qt0hwdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:44:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509044f54aaso151445831cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896287; x=1775501087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3BypvaiCzdl51LZPnxaZahfWScLov+LNP9bnfOVtuA=;
        b=XGba8TzC5PBPOZMs3Ux8RdpvgZ6xPz/JC5abxnGRMD47Bp1uDFHmmrghD/2+giw6QU
         Z3yoio06JwvVqRGdWYkwSsVYtjvGBKkYLD4pTjPtmvWdQz6zHIP8ALkhpNdmIQKHcNEm
         SUIHRLZnsTmk2+H1vjMMb42JSM76hVmil9/cUChh1GHUdnbqFExXrdX512v51XCqDwAN
         4+wcd+dT3HExjAScwZQkQndLcIT+lNhnfdIUpVnbsYWjq7iR+7FrgdpVftbHzdmoae5T
         7xlszuw6aCuoIPm1Jd14LiWygYNohJF+0ghsHTw8TpvNLtgK1qegZIsN1xyr4NyJiH/8
         tEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896287; x=1775501087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3BypvaiCzdl51LZPnxaZahfWScLov+LNP9bnfOVtuA=;
        b=gh+6sEh+97On6kerjfQGBQH1wAu23greChOZhgPl6OQjsFv/RdtFmySjJaix7CVbiy
         PbIpA0FUk+GI6xZ0Uj+JUJIzdjUL/YH0/86zPaI96CaHNY5vXdlNhBzOMcuol1GsDAwt
         Wi7iQrdDYTrRBT9AU27oxBLqWTADusVEHDgGTPGsH6/eIjef+QlvvYWEtbufTLIejnVS
         eHpcAiLnm64kDK/uNDLnTTiLHtqdZKR6UjXyjEjc7ZW5p/LzKRIFIgG2v1bwlKGNtWXM
         0mjcNW+nT9yVLLJLhdmiA+Z1pAnh2B9yG76Ny8aQ74dKqfjjcUzy/fNcOwSK4Dr+6WX8
         wrBw==
X-Forwarded-Encrypted: i=1; AJvYcCV5MJEA7HGW1Jl7I8KbkfVOEZDtJ2Cmi3Q/7DRDg4vZcCLJ1ycXJ4JyPhu2XpIsXSDqsLGmlHVSbXlLdSMO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5jbsYSrOZMTLemLJPxMBk7N/6oGDl9qe2Xyff+w9B96SdD2j6
	UfzPvEKJ0JC7ztPWpDaBk/byEtt5DYZtJ3nH86cYDubcesaH9lfkecCi+YASc+znZw0ewsSpWjc
	1DDkpKVN+G6lBrtO4ezGdyu+sHxcPRqGNgvwZjiIA5lnK4AQ+byRRTFGVZPP3/KRfGTuF
X-Gm-Gg: ATEYQzw6Si1EzhnRrQuYm3Yw8e/c1rWzciiI1F5YlggdLGI26OJNCKR5rWzroelLZX4
	zd91yeOr9p4+tIPX9JvjbRhNUYJ9lyMFtUQWxPUEzXpRGgZeqFDXMpoeyc9Yx1XBQKrrY23AMf7
	rZbeWJaY0JhQ1rCeZNCVKzf3ftqn+eu4GZsckARxPgQao/x71X8WNtj0KAKRSZdnb9Fq0PHEmhL
	g6pl/GGUmb/mtHivHJccQSPo+WAmseLQq+d4lbWXhYEfyNZ3SwRbRHcFChEeC2m4uR9RL4P4Zdv
	G7DmJyy+yg2Um+eBza+jmqN4GlWv+FJFYPTULrnHUVOAYZRHzLECt696ecmpeus5sVn59YpEeST
	28jKhWFpe8EAaxnc8LNZ+2f93hwO3u2XsEw7YV6CL96poO8lPxFiLgkTK4VkEqRa6s3LBA4OuZ8
	JQtnbP7F93fss1C3UnrdJ6XrFocLV23TYpKZ8=
X-Received: by 2002:ac8:6f0c:0:b0:50b:2096:4950 with SMTP id d75a77b69052e-50ba3901112mr190709281cf.44.1774896287395;
        Mon, 30 Mar 2026 11:44:47 -0700 (PDT)
X-Received: by 2002:ac8:6f0c:0:b0:50b:2096:4950 with SMTP id d75a77b69052e-50ba3901112mr190708831cf.44.1774896286906;
        Mon, 30 Mar 2026 11:44:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4373sm1904509e87.6.2026.03.30.11.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:44:45 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:44:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sdm670: add thermal zones and
 thermal devices
Message-ID: <eid35hd36p6xnwgztvgdemyc4yzdnk6vdeu6mtd22ap3e4wg7k@l3r35axludhy>
References: <20260330165237.101045-1-mailingradian@gmail.com>
 <20260330165237.101045-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330165237.101045-3-mailingradian@gmail.com>
X-Authority-Analysis: v=2.4 cv=XN09iAhE c=1 sm=1 tr=0 ts=69cac4a0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=M8YKDcNaA03c_0jmb2cA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: HXu9rt-lBV5h3a4MQydVcWffiWHE0pRD
X-Proofpoint-ORIG-GUID: HXu9rt-lBV5h3a4MQydVcWffiWHE0pRD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NCBTYWx0ZWRfXxh6tKhr6Dxd2
 G0iKjXZyso0GxjTx8NRwgewuVlVyVDwv1u8t/cB9nwHpM7OBIWiGmd3ou+hwGdbuxyaHkGeA3KA
 YjP1IfSIpgWHDWcH+GbnvS3VJP1V+ttNfMOTa3wM++rucg5xJkAmOIlLhhEpdH8siKh5FeOOtOx
 Kno0ImrEvTa+lHFecyVW22i9OXVIRg3rxraqtDR8JwcY7VSsqbQ11j3CZefdHhiAmdGA4mZp/9D
 QM2fXiCNwH9RQ+U21o1OtfYhjNUMhYe+8KsXbe4qQmKxYlvN5xAPjzMajXztMATmnyJHwaDBk83
 cYVJ1bzYSUr4OruKP+w6dOCy93ua3vCdfI8CDHtRg9ky3MxXcZl1fXCUf/MpwsTue42bszbNfvK
 zgNsCx9a6gOdt/VJawZHPA1O0ci+HiM4e5HAMt1QIzBpI4W42bcYerr9d2QbOuj+XEZkvtAnHDx
 QGrJfX/qiGmQ/UE+71A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300154
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100880-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 540D535FE84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 12:52:37PM -0400, Richard Acayan wrote:
> Add thermal zones to safeguard from overheating to high temperatures,
> along with the thermal sensors (TSENS) and CPU frequency limits (LMh).
> The temperatures are very high, but should still be safeguard for
> devices that do not specify their own thermal zones.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 400 +++++++++++++++++++++++++++
>  1 file changed, 400 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

