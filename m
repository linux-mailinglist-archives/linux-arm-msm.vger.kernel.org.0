Return-Path: <linux-arm-msm+bounces-113780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oY+yHOHxM2oaJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:25:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FEF6A077E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:25:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Di+XqVZ8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KJe8KD2t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113780-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113780-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B111E301B727
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800B83B14BE;
	Thu, 18 Jun 2026 13:24:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131863859D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:24:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789064; cv=none; b=fBZZFzuJSz80M++OBgzYGzTo1cG7tFkp14QV2exUo81OhZf+nhTMWCxzWGYP47oMvnb+p1crp9EgUxXfxxbKRfRK/Qu2fkEE92eEyt39TgoJIMrq1mWlKwfb+3dF1AhSpvaJnvPGsIQ1g+2g4Dl8a8ysUtq+0vC4crraUsZ0jgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789064; c=relaxed/simple;
	bh=EjfJ/ixJ35QHyIg50lTriMaQBVhrwn33zrAlbnoCLoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dn9pplmumicwbjDlkkwNQGwHPs7ikIRePwzv18naEpPlgWNo7NQ4gBVB6mpqBSEqEHniiQicGOzeosqLHV3Y+sA5UJDCtlhGCX48Z+cqPbdJDWHn2uvPmF7gmeFw4Htvme0FeVi+wOJ6qUdryZDpeNiFw0OlW7ZDlWfAO/ju8eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Di+XqVZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJe8KD2t; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICuu2Q1878455
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3iEw7Y8XK5/7tKSn+yPX4FO3YXCdVSFl2Te6p2Xagk=; b=Di+XqVZ8b8ncmrev
	XmwFtP1sVz6e5zBdLBnGBVuIZV6DNCOAq4vUIhCRQQ58Iy6AtNYyOiIksOVGGHpD
	pV+FXivTZYh936bDt0LwvagaM22T40J25XzE/PK45B/7PgVy1d20oJ2grWxnE0yc
	ZwqpvZoL1A2s5K1kaMN6vt4vdHE2gUAmuge6j4bMkpZrZaHNQisuCIWCWpSjlaSk
	bec0VFW3761AhMd/TstjA74qSSADSvNKj9SMLjuaclwywidXiw77AbhV2cDX55Rk
	F+tNiTJuezsVd4r7sL+x8IzT2LI9ePBe8yzjtKRu0jQg2b1JDgjlivrM7cnEwqCu
	wYLHvA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7krrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:24:21 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-72845b7072aso47852137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781789060; x=1782393860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3iEw7Y8XK5/7tKSn+yPX4FO3YXCdVSFl2Te6p2Xagk=;
        b=KJe8KD2tpD5qchD3cLpa9M0AZGhnGr9mHJbaReuvBFxr31g+wPIaC/AB7G8dn+tKue
         UAt3l7BUNBm/FGKcxytSiWLeadU/+6lxT/6jaNMpqujag7SzYD8aw2ZQpsZIQ2nOjLbR
         pt75/B1RtVPVYySxwHq5DPdPEnp35TdE6z1SIHaKYSeE8Ua1R8x3OmHZsKfhUw9DcQxn
         TiGhQXelAE8X7CmaKYTFDacpZEMHK/V5iEEkJR1mtlZEqOXyVWMmzsdnrXQzHEPuqhnJ
         fdr+9q+b/h4eB9wQDhxUEtWZt/4Fao1VshvXg4Rx49QhDEjqeWHYsI5qDpHVeCekybAW
         KzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781789060; x=1782393860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3iEw7Y8XK5/7tKSn+yPX4FO3YXCdVSFl2Te6p2Xagk=;
        b=Id4ddFhHVlW6sKPdXzsOBJnrXucVq34aI1HMBIJBJXSJgiZlvfcD4jKyhmKG6dDQEK
         BLvQCbEhsu+lVF86ahmQC1PUF+aCXBr6OmOzDR5U9Fq6klu+xUssMRIEQYYapt4iOLil
         Kw3F5B2IwnOszsld1zqe30Pj+5z3vTQYEoYEYdXzeOdRruKyPsqZOR3VvTf772xPaEp0
         xzKoEDimucrb94xMsPVtt4qI3jxszEq4QRpA00n9Ef37ppQIq3kvweiO34pb4xfuaaoO
         aOYigMZ2UAPi4hFNF8Wy1AZcdcV5imyY0yzuTPUcNbf9M4hipQz0b9z7uWFads+IzJiJ
         Aixw==
X-Forwarded-Encrypted: i=1; AFNElJ/pDUuuRDpfIsLWYgbyC3VUSvPghunc65QHFWiGmAEB+pE0dusErKBnkbG2dR7O/3m5BdOatkd1cq3f4m+6@vger.kernel.org
X-Gm-Message-State: AOJu0YzGfENKCBfXtmUXfNaV7gTL0RKYO02yzwyqdkexNU5q89nnMX36
	nL9YZlaHQKhPBY//LmG4962wil6bns5YbJ0lHDPfxs2Fb/yeizAODLNy2BjUnCHZDpBHbnrYfN6
	026fOVEoumdEZu6519pKXYV7aXfqVt2yb4udSvvHEk/ROLP/abDyS71bdxpvRSScrgypq
X-Gm-Gg: AfdE7ckPXW4WMzI4SIdYVrKBSH+vP+j+sc4NdNaGg7L9inK+7FcIjUZ4HfZKiXY5MZZ
	/UUAct5rfkvecOLdeddk2t7/rGGWtJlN4NOxKY+t/Es0G+8LMi/g9I5rfl+YPkqV01qSjW1iOFx
	pXEHVaJcUSNCRSMtsUF8xlE8WP4kLiS+yLZuaiedN7qPkocFhUNp1kfuBmgbMh/horoZCxBYOQM
	J5dch/vVlJS7JfvJibxURgTVOun69ZjD4i7yCrAeCkbdUrq+lA6HIwLrYLrNWN9YGu+6XnZUa3k
	3tjOQY+xJEfGCpgp38mHH6s/oKlxmEeVJkJ8ymuLFOFsSEl/XDw5SryKl9Wf4yYYrjCA/W50f1t
	0EDp7AanpHnvI9tVqOUtiY2XzGIN2+UGS7aU=
X-Received: by 2002:a05:6102:334e:b0:631:bcfa:39d2 with SMTP id ada2fe7eead31-727d735f873mr567422137.6.1781789060407;
        Thu, 18 Jun 2026 06:24:20 -0700 (PDT)
X-Received: by 2002:a05:6102:334e:b0:631:bcfa:39d2 with SMTP id ada2fe7eead31-727d735f873mr567417137.6.1781789060032;
        Thu, 18 Jun 2026 06:24:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c07a48c7931sm90091466b.21.2026.06.18.06.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:24:19 -0700 (PDT)
Message-ID: <79c1dda2-153e-4b7a-ad18-c72db1cf4a00@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:24:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drivers/rpmsg: Fix copy of channel->name into open
 request
To: david.laight.linux@gmail.com, Kees Cook <kees@kernel.org>,
        linux-hardening@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20260608095523.2606-33-david.laight.linux@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608095523.2606-33-david.laight.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyNSBTYWx0ZWRfX9URnPYIBAuEN
 QBlJhf/kgpyYx59GGPFSYSdHTipcwNtrWbH9mHR/47Q11Q7lDom5JSA4Nv6ukP8f8dyHWVTDbP8
 Rw10OaFDul/5O+oEuOvP02BQGDqB8hVXdmnTrlIMIEsEBlt+VKZS8qzpV43T/karoGPfoVQSsyN
 InxxMMgNiN1jUMxnKgpGaD6N5iOV9YlxWk6fHN1uM/ij4xAgujHHQV3b6q0cLaT8D5TzVdJgctl
 dQmlS08ymKjQ0hEpx0VtMd3CeqZCouxI4F9iqpSvLFP27CmevLYd9Qg60Ch9zoAkH8TxyYJvbCO
 Dpe9SDIFXtOxS0Eb9UdWE/IcrxobFmtaJ1sfYJrr4LytFGtpQ2jnNlJZEnIFfh2n4byg3KDy1Qw
 xxbuYENcyzHaH0mvDsSRUkfTQbBoAPQmHDXKu7FvvxolZAF1bghjc8mxNVA7qNk3EjrckqR4sw0
 3GB3O7NTSqUh74yUWCA==
X-Proofpoint-GUID: JasFCMmcWii5QKh87SBa20EKAgDIqVWh
X-Proofpoint-ORIG-GUID: JasFCMmcWii5QKh87SBa20EKAgDIqVWh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyNSBTYWx0ZWRfXzKwQuDnuQR28
 sSxWceFVjOJFfxYF5jy6ZCuCabSo7nVCTdAV3HfOhwBKJFjOl1D6JDk0GF7OwIJw45bGAy3wOBQ
 VJVXf9OuEbJafG7S1DamSkPmzQC2E/Q=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a33f185 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=1-iA5IryhlbGIAVKO8AA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113780-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:kees@kernel.org,m:linux-hardening@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:arnd@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5FEF6A077E

On 6/8/26 11:55 AM, david.laight.linux@gmail.com wrote:
> From: David Laight <david.laight.linux@gmail.com>
> 
> Nothing obvious ensures that the name is less than GLINK_CMD_OPEN (32)
						     ^ GLINK_NAME_SIZE


[...]

> @@ -481,8 +481,7 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
>  				    struct glink_channel *channel)
>  {
>  	DEFINE_RAW_FLEX(struct glink_msg, req, data, GLINK_NAME_SIZE);
> -	int name_len = strlen(channel->name) + 1;
> -	int req_len = ALIGN(sizeof(*req) + name_len, 8);
> +	int name_len, req_len;
>  	int ret;
>  	unsigned long flags;
>  
> @@ -498,14 +497,20 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
>  
>  	channel->lcid = ret;
>  
> +	name_len = strscpy_pad(req->data, channel->name, GLINK_NAME_SIZE);
> +	if (name_len < 0)
> +		name_len = GLINK_NAME_SIZE;
> +	else
> +		name_len++;

Should we perhaps do something along the lines of:

WARN_ON(strlen(name) > GLINK_NAME_SIZE)

to prevent silent clipping?

Konrad

