Return-Path: <linux-arm-msm+bounces-114177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QwYxM/VpOmr48QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:11:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1736B6952
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:11:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H1TyGiA6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="hsRDS+/r";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114177-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114177-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03A373006F2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B2026AE5;
	Tue, 23 Jun 2026 11:07:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93D03D300F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:07:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212866; cv=none; b=Kdox5QXWTH9poG1K2ZsIMAV672PKOrH3VsEk6x9bo9MxNGwGL26aHZV5BRWcJyE0NsyZkv17FOLZvIdavOSRwxInZPOQiQ2l1Rpiv/NOL4O9yCmdqYPjFmucii7Cehnh0bBvUUvk4G9KguVnZk+he1c+FN1bwu4oL0sXaVH2c/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212866; c=relaxed/simple;
	bh=tx6tX/NAKXxkGJejjw5+LIVo8JWcPsmHgbCzWvSJZ4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJz9bkt41ipM2DMTBdEyDRsRE7Stf8/w8NwU2U9Z7OxLbaMyuG1mF6S5LZRYRkN85HzK6Q7q3J7WAMlMMSK5EBs19Y5VlrfoZtoTPGoZOrk42U8g3A4m4cDItj0TsESTYegRDVuVNuslfQEdDutLy9v71/7JGDa0sOoXwHdYgpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1TyGiA6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hsRDS+/r; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsgxE3582623
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g3nt7qx8jqpRumyh129cPCiLJ2ONOmzA7CXvvwHava0=; b=H1TyGiA6MfcS/RNb
	XwC1K3yp6QSPGiMpBGIG2dbHUG2FcCXYApP8UKeagIx3kfUJfDrN6yjtOwfgi3G9
	CVIYyY4gfM6kGwtLx5Xx+YaAIg+1YYUJxbNxTOBWJpnqqA06LNEu/B4605R3V/7V
	94LmQw5SKCAzid+BobIlLgKAYN/FvL5+rhv2RStvdEC4qrxKDpiIPCySaJi+pG2H
	sZv6Ulq5hJleuSXXcU57+RWbfN7frn4RqeiaWoiRdTppqviV11gVbP92uyFLZylU
	bWu3QWJUpnIgFdIRGsl+eyN9dSr6EySzBxYmc4k2P1yDSVRgJk6t8d4iDMxZOL2O
	XKbMnQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729v43p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:07:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-920f826bcb4so59136285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212864; x=1782817664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g3nt7qx8jqpRumyh129cPCiLJ2ONOmzA7CXvvwHava0=;
        b=hsRDS+/r5DH4bVtdifnDe75/aguitcEbVQ6Pqtq/lpss6jLpc1hcv1GKIyxdaKBndW
         loy4QlzCZRUNQdsDubouI2qGPjVYZfo+y1e3WhEX7tceUw52zNE6UMcEld5gb9H9PTNL
         ftrBLJ6L2kVUAHB5XSq2b1UlyMIi1VZtOqgy1+8WQ0FetAiWX0cWnockGYUL7RClDcVU
         r50m9I9eAIxYWcOoX++NmYKHfN9SA0pE1IRjRea42wwxNV40kM7rvB/L4w2ud1KXP7Nt
         lmB8oVt5yokteIX5bwwrGWIZ0y3Ix/E96lyUa5+xawkqRB0mnUemleHHeaQbWXMwep1n
         XXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212864; x=1782817664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3nt7qx8jqpRumyh129cPCiLJ2ONOmzA7CXvvwHava0=;
        b=oht2SgwWEsr4PhwO2TBf8ng4/cBk5Kqkry1pEtkRBHYZmmHDFD6Jk3towoG27Cju0f
         ARoBEvdEuZkvLxjZFoPmZn352JLhxLV8y0T39lXToDvpLesIWN9up7idT8J84O4v6HDp
         QYSGZwP0P6MXAwa1lARzY/Jb+S0QQGx2+WqSWDdIebg7u061nWacOgRjIuuZCaxWvV7R
         F+vCfZkn/Gj+ppObTR/xl0nMi2oinaxxV66PXDDewJYJxo+EpPVYkSHSgXaFeOYy+nBt
         Tr1kaKL1Jtf37Tj+Bc85c4LCfFbFmwWDZ9UjJoT7w6qjN+aUmzzbeGkC48WZdEYupuGU
         FRrw==
X-Forwarded-Encrypted: i=1; AFNElJ/JrgLzAu5eNgDSI01EFBiT0Sw7LGaXmCX1scuGg33m/Muq0N37/heNsGQzpXh2p/3hzlFbYX1uLGnOX1Sq@vger.kernel.org
X-Gm-Message-State: AOJu0YxXRtoK2lQeMZpgPkMR1uCI2vW1l6RKH9xc0JXYBStah4WM4JDj
	cUZjGVYRFCGZvVXEutkq78cU67ULxIAaq7mZg3Ff2DVCmfRE8xirU1jIinegqObU4g3VOkNLvvc
	yHWo6ki1l6nmz/Heb5HkzsBHo1WAZoc1m+MXN7grHYEEym46938pfDMRzEjXPUFuRQvRr
X-Gm-Gg: AfdE7cmLs/13SJuyrbanYX6z0xD7PaMSa3Aie7RVCIFBGrVFzKXH8gfb2cNNqkVosJR
	jRTnz7hCbt6KoueqryupDPXGlUUODovj5+j1DNU0m7VukwblNTMu6UjZroXazHOZNKuqCbDYx8T
	MHGvTh6MaTfJnfJASTL0x5WFP3QBWW7w9OzN+3lDV7mSl4y8BHlTzDQYRGVBcxILh7gfmdAdpqT
	AdmRjiBcv7LaAugd0wn/nVwf9TxS4pxzMVdCAMQ21Z7mwK2zhl16ZX20l8knsOrgo0xliGfYkGP
	bjR4ipyCvhuO3CVUdqeBeOWjio4vaQOtLwkanm8Ecv8tv8o6bBVD/LiXrkCcJG2z98HgqNe8DZi
	Yd9GDl6afMJHTCdIf38/TnFWT/fUvDYstSIs=
X-Received: by 2002:a05:620a:4041:b0:925:4309:dd25 with SMTP id af79cd13be357-925c8fc4757mr509526385a.4.1782212864124;
        Tue, 23 Jun 2026 04:07:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:925:4309:dd25 with SMTP id af79cd13be357-925c8fc4757mr509521885a.4.1782212863609;
        Tue, 23 Jun 2026 04:07:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60bc01d2sm487272766b.31.2026.06.23.04.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:07:42 -0700 (PDT)
Message-ID: <497ae938-9750-467a-8739-5ed48b657d70@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:07:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: rpmh-rsc: manage PM notifiers with devres
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Lina Iyer <ilina@codeaurora.org>, Maulik Shah <quic_mkshah@quicinc.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623015501.31129-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623015501.31129-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5MCBTYWx0ZWRfXxhi1TDw2R3IK
 fsZHDuovHhwk3FsMsrv+58hb59y3ypYawERwTWZcCTvv1k0XPEbMWwzlT/NT3gI5jIHMx7fg31C
 s5a8lcpLV1UVQnTfcARPZ+w7Ei7Eupc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5MCBTYWx0ZWRfX7pta/1NTwuki
 BR/ctu+bnxWY/hyB5HcncshliVIz1aU4ZCWtbow5OJe+iKSWyOTyzYhoZy/Ab6j1e39XT0N+fy9
 F3c3BCfc1yaly4AqnMhBERWWvaItwv+aInwq66xi1PzTb4bLSNIJ3kxCxKWr/70wqBI6jE5RBUh
 5r395/nD4HgJXkTapn2L1ed2Mze3D3DtamNJl7LrSAhnnPm6UyKT/w5EI9fmNGp2kjKEwkzJAd7
 F0yRjlMkL5qyUElHDKUoWARejy7dZBkdI55rb6uJq8X0zniWirZnwEJTX+Jr15xiLm1hgOIkjGk
 lbHqaAEm1mz3qyHcS9/gegtLhWXzgdLN6Lc740uf7ifOO/Wd1J6rI78Ov/zfirzggnrjoj+MN8Y
 fugwjryezUUhSfpmihR/MrElAFEcgAAdd1nx7lnpVD6FZswXarMvGh4CS+d2vpRuXvTGluL1RFY
 nWOLTYlbPzBsbz2K+qg==
X-Proofpoint-ORIG-GUID: PmIsKKvku1OrbzDb5DLZgtEm7baFEw3E
X-Proofpoint-GUID: PmIsKKvku1OrbzDb5DLZgtEm7baFEw3E
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a3a6901 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Qz-MBs0IGFqcTYICQbUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114177-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:konradybcio@kernel.org,m:ilina@codeaurora.org,m:quic_mkshah@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iscas.ac.cn:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B1736B6952

On 6/23/26 3:55 AM, Pengpeng Hou wrote:
> rpmh_rsc_probe() registers CPU PM or genpd notifiers before populating
> child devices. If child population fails, the CPU PM notifier path is not
> unwound and the genpd path needs open-coded cleanup.
> 
> Use devm_pm_runtime_enable() for the genpd path and
> devm_add_action_or_reset() for both notifier registrations. This makes
> probe failure and driver detach use the same cleanup model while keeping
> devm_of_platform_populate() responsible for child devices.
> 
> Fixes: 25092e6100ac ("soc: qcom: rpmh-rsc: Attach RSC to cluster PM domain")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

