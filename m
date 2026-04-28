Return-Path: <linux-arm-msm+bounces-104991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHRBHQuu8GnOWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:54:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4948539A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52B2C30C827B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF64441024;
	Tue, 28 Apr 2026 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPyslWW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCVjoO6c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613B243D51A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380247; cv=none; b=Soh54G0OY3+FOxFf7hyJSoQc6puqsJ8xwy4inKY9tWyVqQgqYTgolc3aOhvQG1I57xVpzQM1wTeoyouvFhUsAfJE8VaYufCHp2o2RpgOTmvens6++AlLADAyx7inM5oUYQfMsZpyc64ffKZ8rZbsAh0bR0gE0UIWqFzwi2exRMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380247; c=relaxed/simple;
	bh=Kyz6EYffvLG4xr0TWW5Yydc0pruMZ85I/V61U6d/yjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YY/aT5YtB5RrXgUbxcJJ8owGFl3I/NAdjrJS2rmDtSm5wz42y4/0Gba2AH1Ut/lsTuui0AClTTsvXXldB2bxZHfKj0+zhqY/v3clhLLSGJa/6M6XVCS2u1JT9bFCWBthBsHSR94Ku7gWMhRrsPJ9YXpbhW/LcWKorsctMl4TVXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPyslWW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCVjoO6c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S8qXWR662982
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g1bOohnbPKotWjRJvNuEVMjCfJZe6MhtrFtnqyLmN8c=; b=GPyslWW92QAGYl6P
	DobdNVPhimyrGOa13al5Ly40MBcExRRA7YuH2wxE/Jj/1K7ftL/NdMiHX2zXMe8S
	rJyQeZytisfd+oF45HEjMEWirnMwu/T1BXz4KhVRnsfNC4S3gG0dXN6DGnaz3ur6
	vRk4Ts6+nXld9EhfONxmcOXhDIWRmsvvD/otvokIIt+rMGXHoFnW1BgAdEMgKDSD
	XIRUx8ogLC71ulpamly2TujwDoDKWz2rAh2Sj9gJ5PDes2NCrad0QUQDVP8k1Laj
	8QiTwP1Y4HjG7ooqm2MXaecS16X8PQRlR5mdzsG4lkXsYk6aHd93bpUkdEKZXZx/
	Dbstuw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n3wyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:43:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e576143baso23756801cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777380231; x=1777985031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1bOohnbPKotWjRJvNuEVMjCfJZe6MhtrFtnqyLmN8c=;
        b=VCVjoO6cGiERlN0emohN1GUmU+LoC6JDBZyAhVhpEKXpN7qGGVYKmThzexZatZLIvy
         Nlx3II/4hKgZuww7qW+wQfTw6CaURQ2UDTKTOyF97IYWKO5X9gnoQJV9Nv7mfkce6cd0
         1BSswbxJSxzIN55ILIhTkTl/Z7H55lVtc096Q5U2fDCJVSSiF4TcpSot8j3j/32yOFY4
         GTATl0+m+GYuuKxGZTE1mih6tRAFy+ckI1cyhSBRjVar3aEl0hnejoSUBoPSR+HZGMDg
         IIP02/m44ljLNp8T2dr1fBRg1Upt3y1UnwF79HRh/X0rIZBcegZuS6zmIkvL/p1Wcp80
         quRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380231; x=1777985031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1bOohnbPKotWjRJvNuEVMjCfJZe6MhtrFtnqyLmN8c=;
        b=O2h/u2EWpF3oL8k1i3pVVxFyNrAkNuzK7/xcGK5IvVNZkstkxGNB+MKaWFQD1zAGyi
         HuAhzp7pGbAnk4M9PXk+gL5IfGAX0llBgwsOYLywjwnzrodBBCeJDS/I417BICYywrRv
         0Sz8zsgWBw6sszZqx/bxTljIn0rI2Lrv0LtHEKRX1TKBi138WcoAKAyDqHkbAwmNcnht
         G0zwaEC/4TF2fn5dDDZk3UwMgXGHoZcEO+iLYxTSCRuhkz4Rw8ARi7jcYVssdPg7N3pH
         ceE4kPa3vez1aSKHyAYc86Cf726wT+LaEj1pakq2ubhAMPI4z5dDEgBbFicojg8WM3F1
         yDMA==
X-Forwarded-Encrypted: i=1; AFNElJ8UgwopW4PHeMBV6e5vGXdNZX0rECEikC6Bvcp9qcJY4uGhhOs+Pgktn1XjfWYlPhdZO4qyn/NsQF3LyCxd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhh7v9Av66s32djzFFyz3AYfKXtHedmPbYXxaCOz0aDE2r/tgL
	cttqZrEVBMYT7HTQ10GsPi2G+onlEIdbWlSAe2k/ZyftzEKgu+M83ftbSJDDGzwLyibqKoq/VsC
	wBwI9pyGF86xqNOhuh7dPnYrtaegTn+75mRXVn9bHnTrJoKG73Wtli4k6r4rMulc+v6M2
X-Gm-Gg: AeBDieu6X/FvLT9zHjmMBNmKGodsYtVz2T8ocGxQiF+bDspUiMB34pXx4VGlBevyLJZ
	8+HE1MCV9x3UMKxFwHt6hscHmc8iAD4CCUP8k7hxPcS4HoPQzGK+FPvJwIKm7vKCTTk9xpVbNMQ
	Dt8GoLU7sUGFmPAahdBrxsBHxwHCbLa/L4eedyfYSk/7qmlQz1ytQh9HkjSHZDh7Aff2rYaNlsm
	qSnfKZ4It+APG5MP1hQTkMoro5kvn5zCCZqicnpWUfIpvqkGopLhmLmPhWpdZyt8EovAK1l8fDJ
	rLTQY66zMIkZdp3kIAe4KO1RS8x7cDU3DqeHsGA/YKfslajnnxAaLsiwc8p+D0fWW/SIlqPukc9
	0QVdjYmVq40vuljlzgGzC8gKFaCD0EBcWpBHa1/y49TobhvRRhreNVYSN1TQCSFo0EgdZEOl3L/
	ur8d/lla67nHCVvg==
X-Received: by 2002:ac8:5887:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-5100c8399afmr33634381cf.1.1777380230661;
        Tue, 28 Apr 2026 05:43:50 -0700 (PDT)
X-Received: by 2002:ac8:5887:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-5100c8399afmr33634101cf.1.1777380230167;
        Tue, 28 Apr 2026 05:43:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80853b479sm98446566b.6.2026.04.28.05.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:43:49 -0700 (PDT)
Message-ID: <6230dec6-f328-46da-96a3-aebda5c15815@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:43:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Fix Kaanapali CWB register configuration
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260428-kaanapali_cwb-v1-1-51fdb2c65498@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-kaanapali_cwb-v1-1-51fdb2c65498@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExNyBTYWx0ZWRfXzt3bRNiyCkqU
 ViGeZpAVp/g+owGcTZ9Cnxhx9HREOyYVkqboBJ/8n01gmgINN1rYfljpTIBv4zIj6eSBa3hxyPV
 72A8qi/XYk6mezoJLeNV3+s5n1ORqGfWcCL3Alj0UaUdT/e0JU1nHihKVuEL3WHA04xbzaGWXCS
 DuimoK52mbTTyFaZCxqr321krXFSwZDwgda8EkMMBES3AAhvLQUoyL+SoJzHbSYCAEBZ5Io0Cdt
 RSNqgmaiS2HKIHjIfwGBwYOA2e60k5YF+dAovBuouaPTRXz/fEnCIWJIFrP4quws3t2fsH8TL8P
 5V5lpzlTLPrq6/xYFUt2VIocg04xrxDox9UDWpfKl/bXwiKIGuZSyEZZgU1yhhL6wZwynTtSovm
 O4YSRqrJoY4iPJU5xI8Q8I5yDdQAb9gK3WZCHNaOpWQsdZSX5+T+Xeo6mY+WEhB/J6KxTti+PQ6
 /aX0y7dKiH1bhghLcWg==
X-Proofpoint-GUID: LInxJaRxbBTcu_Zg4WspwgveT2fVhb_o
X-Proofpoint-ORIG-GUID: LInxJaRxbBTcu_Zg4WspwgveT2fVhb_o
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69f0ab87 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=g7eih2tgvwwgKFoWVAgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280117
X-Rspamd-Queue-Id: BFC4948539A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104991-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/26 1:44 PM, Mahadevan P wrote:
> The Kaanapali DPU catalog defines kaanapali_cwb[] with the correct
> CWB base addresses for this platform (0x169200, 0x169600, 0x16a200,
> 0x16a600), but the dpu_kaanapali_cfg struct was mistakenly pointing
> to sm8650_cwb instead. The SM8650 CWB blocks sit at completely
> different offsets (0x66200, 0x66600, 0x7E200, 0x7E600), so using
> them on Kaanapali would program CWB registers at wrong addresses,
> corrupting unrelated hardware blocks and breaking writeback capture.
> 
> Fix this by pointing .cwb to the correct kaanapali_cwb array.
> 
> Fixes: 83fe2cd56b1d ("drm/msm/dpu: Add support for Kaanapali DPU")
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

