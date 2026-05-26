Return-Path: <linux-arm-msm+bounces-109901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHNNNCnYFWpYdAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:28:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 222F65DAAAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50E243031259
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482AD43E4B3;
	Tue, 26 May 2026 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1fdhPyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHOPN2ml"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC7843E4AB
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815704; cv=none; b=JAYA6OazQLEyj21OKhwqgH1M0dxWSYxkgiFwwkplGKzAdwwbc3ozUbLGM2rq2nd1bmXLWFMgX6aviaSe0xxOGz78aIt7XHa5UlWsnYdJwoW+Fjy3nWZgG+JP9GZp20irNvWI5CO+5quyzjP1jSqdjL6vFbZxlVMYmpdNnJySDuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815704; c=relaxed/simple;
	bh=gozXShftRMQ9Zq4Y13ikrh9MoSOesCT7RHpSZjBg5l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbcYWWTnE82odO/955s82duOXvsdxpHaHaezYRwvmppGIvIH1ePK6J60sWsjx+XVSCuq4prPVkrWKKHNyqUd35acOmiwXnNYURDv3secQZMStis2XjKHo7vE3+v8a21L5OaGRS4qe+h6N7ESK3baSirActYUF+OE0nU4wnKZaqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1fdhPyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHOPN2ml; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1dFm3147108
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VobqPO8lOIFh3fFVf2dOVAMsaLcnQXQFa1MzwwKIlqY=; b=g1fdhPyMfu8VtuZC
	9315iQQdpWLlZDiV3fOtuARdnSh674OvZP1DYChpzyrFjzca7lLtb2Rl+xt8IERe
	ICo4hHrNjK4Zl2KomNbK6L9beGeWQRBIlSSVQF6xUHxP41PcaYa6vwWGE5e4kYJS
	+V8+fbFvuXvHN5lRhw9XKPwbS1v5Kb0rFWoHmvQ5uHrbAFal+A+dLUJjcw2rsoRs
	0XaVHxI4vO+0CPT69TUifrLlNHW0zZy77jcoPFxr9aTiMXZQx3ScAMe9/eT9DUyx
	nanoFj9OviCqzZA6WGgjwdpn+doJpoHzk8FstgipQK/HEXRihkoLImYHx3qQ+400
	h85IPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3u4uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:15:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso121026455ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815700; x=1780420500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VobqPO8lOIFh3fFVf2dOVAMsaLcnQXQFa1MzwwKIlqY=;
        b=kHOPN2mlRHkuz+IUe4UwwZffakxHvSw0kly+rToz/EkXhM9VC8gxy5vdD+16n7+90l
         owiGTnEYDmnG+2t6KlcbeSUvkbTy3ZkDdwqNBdABj93QIctKj2VrvyZcO1rEp0fJ5qh+
         pGdHW3fh2sMjeNdP6z3sXp8bS6vdhz/ibiy096n2BDmJmuYGNurUuvcVgCmJTHPQbKsE
         W0nDmGcxSLatkKMVRYiHphuttKs+oFEy5ydpFDPN5WbAYaArc0gctGMRmmyJbCym826n
         3ZObKNilTe9zQhpPxi5Yja7DGMPiTdWotU5i2LjxDYZOc+Mx6+L6aVa3Qxh5RJ4aF+IM
         Q/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815700; x=1780420500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VobqPO8lOIFh3fFVf2dOVAMsaLcnQXQFa1MzwwKIlqY=;
        b=ZIUfduXrbWkTdix4VLkjfHmhr+Q2RK71yQ9cUnlezmAmgkMgLVfRveZNkfcsGpr6+h
         fAiSt+N7+Cj95Ayq8vcMMtT+gJCcwdVTPiupJPhUfUPTfAeeI4wb6bGu3SboV1BBeTbU
         C1ZMqKVtOad50y4eCTG4NB/Osn/PrfflYFITlhWsYt21rO2IdhLdkBqbSyfKcWDzpxpB
         /OlKaVG84QPyCGHg2Gj/xH7Kjek1q/4OA35NjejNegVVNmXK9s1D0PKb5kHcvojI8pZv
         EOh493P4aN/Kel2V4Nyp6ZVVx8GBll3ka97rNWLKx5OUrGwTTzl+ku5jg0Nl+pwcqZOx
         wvnA==
X-Forwarded-Encrypted: i=1; AFNElJ9yU4eqz1IBVn6uZN+j2fFJ47pq4Udxfajw/I/YjQ/SmRgClV8DhgJhODZ+dOBOGDjJT4V1QSJOv5bntDX7@vger.kernel.org
X-Gm-Message-State: AOJu0YzptIjnoLjGrOpmK9lIDTbFVph+saHxbapJeU8FQ7ygM66Hf/Pa
	gs0VNBbLOh5cUATgO1XXF5+Q+l5PoVyhoPehAECOttahvV9x9z+gV6r0qB7VKLFTUsJvYLTSinI
	73JmU+oLXmif9gf1h/0UrbinV1OsehRlWSoIjPIyFRiMF0dBQ8Wqhobqdlr+HQwoYg99K
X-Gm-Gg: Acq92OEV+2uvxkZGKCyPWStM0GMhcPZQN5wgtJoCv4dPGsTBG9qS5ek7/p/71tVxJGD
	rKEmmLE8qV4sKJ3sLhLlDeOoh4p78xxi5zcmBrY8GQAnKhUVlLVfDid9QYDMuj/G/ADVC1NrlAX
	MSVeB0oG48dfRfN5nx9dSr8QAdRDS4flhovyQQo192BnYYNnqg8HzybVm2DBnKuTP8nHivxL7Vc
	bY9bTL5nJIbpOUnwR9Lam0SNb3UPTJYX/9GELY6YsvEG0QiN5//E6JWVxo9ER/M6NUbp72axtPr
	AbJh9KaDfvvHzVmghXPrycYoOc4WB26hJydxKbPM0np18zA31pZKBAcxW1pZ9Sd6k0uauSQoA5c
	go5myzgXYILwA7tPDBdJT+wcQ+wr1msrI70Jc9yo2T1lcKfKzNoFuzqAk8dme
X-Received: by 2002:a17:903:2f0f:b0:2ba:237b:7e1c with SMTP id d9443c01a7336-2beb07ed82amr219267515ad.40.1779815700325;
        Tue, 26 May 2026 10:15:00 -0700 (PDT)
X-Received: by 2002:a17:903:2f0f:b0:2ba:237b:7e1c with SMTP id d9443c01a7336-2beb07ed82amr219267125ad.40.1779815699872;
        Tue, 26 May 2026 10:14:59 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.31.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c7046sm133857785ad.57.2026.05.26.10.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 10:14:59 -0700 (PDT)
Message-ID: <27b05350-fa42-4e0a-91f4-a7950c38d7a1@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:44:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: Add support for the USB3 DP
 PHY reset
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
 <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX8K8ppWZOpo6a
 T0OYOTYB+fCLXNEmt2A2K//V2ld8iVH3maHC3n7kutpK8tK8aV+AeaBHlOvAiwDOK8WQhgGhb3d
 eVb57qb4nXIC1BAncoIDRnJRer/ZVO2UvkFGOrMaP5OZcZD9FLcizel+EX1vcaHoDBivLEZape5
 zqJTpeH6RqqYl5UuFe5nJDv7+GTXfpBGC3onUvuep7+oK5+cChYVjhYpHMN+MenudUxhAlIoXHJ
 EWVkpg69tcW0aOg+UWa/SP6M4fRoghW9gt9SYrzW5xeUKUilFLRbD9qPzhbEuyE/YzdtJCsBZl/
 DdqQJjrOTUuu+b5TnprLm5h9njmoL3Tsy7mMS3UcD2hHM7ZuMW1rXIaF4jx7y3Y513oI7spGK9p
 u3QNYZyu+HxG8Poo4uuh73qRnGCWVRfpsT5jffVA+zANj1rqE5AJ5xDCQlMqJEvjZ4EoXzMA8pe
 Vr87D9GaA58FEObiT3g==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15d515 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=aVq2fB6C3sEP8nRkfhsQhw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5L6ES0iTLAyjbOlHcnEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: JJU4NROnNxxYfiiiMemU-AhM7P6M0eT7
X-Proofpoint-GUID: JJU4NROnNxxYfiiiMemU-AhM7P6M0eT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109901-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 222F65DAAAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/2026 6:24 PM, Imran Shaik wrote:
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-shikra.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
> index fc1c90e7e7469818a4372e1bc192761096441221..f323ac5c6400c430b1c92cfc4f7a1550abf08de9 100644
> --- a/drivers/clk/qcom/gcc-shikra.c
> +++ b/drivers/clk/qcom/gcc-shikra.c
> @@ -4331,6 +4331,7 @@ static const struct qcom_reset_map gcc_shikra_resets[] = {
>  	[GCC_VCODEC0_BCR] = { 0x6d034 },
>  	[GCC_VENUS_BCR] = { 0x6d018 },
>  	[GCC_VIDEO_INTERFACE_BCR] = { 0x6e000 },
> +	[GCC_USB3_DP_PHY_PRIM_BCR] = { 0x1b020 },
>  };
>  

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


