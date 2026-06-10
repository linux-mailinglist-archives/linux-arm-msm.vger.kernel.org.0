Return-Path: <linux-arm-msm+bounces-112396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lOsrD6tAKWouTAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:47:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3900A6686B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:47:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kxaUp2lP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WKtQslUA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112396-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112396-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25E353019A15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDBD38B7D5;
	Wed, 10 Jun 2026 10:33:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2E43E7BD2
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:33:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087630; cv=none; b=p/4TsSSpVvPM9ZalY8UO08fwxL/NgxUer673TdcODJWEVmXWrxgG5HzFDRtEyZFDuFuPajxgZLCxpmsrlyTKw4bT8HzsUH7chOJiXxOD+lClGXMe9b/Wp0IYsU6aa/w7gEhZe+a4CeN+WWY0OpzauKYl0qsWsvqktymEUfQ9Pxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087630; c=relaxed/simple;
	bh=yNvme85oo3d4KkJuNkf68y0a7Zc+qE604sjJhFN7+zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JIuBV9sQO/2k95qP/3PBFHPfSurqrWKCom3MFuIa8/7YzTr81dHXZ6YWn/fOxWgqsyFameTHNQ9oClr4vWVZRs/IoxK/d2NiMBmC5+dfKgIp/2qchNlsT8j0hlb+5BKPw2z2lgL5AxRCjt/MNL7c6/m52nAjJSRdsQn7yU3nFl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxaUp2lP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKtQslUA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iQmX867054
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/2WnocrnpuSiCW6MaX5GTAHjfkhonjDtGxDdr+xkp0=; b=kxaUp2lPvj+fd91Q
	DHY8/3eIEPCDC/MBaZgzgLbCrX6Nx0KxWYUX+yChzxqUqSbzKfiBu9PDuzgVNHth
	J2MSTCK0pfHQUdeWgQ/kpBNJ81khlFvusEsFM2Y8zkLPG94+/8P7gFTeoBnrFeiV
	0UeSL2SeKMVX/uuQBmimGUdd3yCes5vkbha0IQo4BaWFEVdLSU03xkQIdNsKAKUB
	OH4uCT3yh2C1pyXVKPO7Niekjlgopl0vnVehX55UNtyG7o9JgN+HXCRl1Oe2WKCS
	4kDWSgnacv+s5qLMXkECVc1is7/XZvIf8emg6Q2GhnPFhjpc7VA5uLY+0usobb1u
	sWJsWw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd9d7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:33:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cce360a385so14759636d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 03:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781087628; x=1781692428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o/2WnocrnpuSiCW6MaX5GTAHjfkhonjDtGxDdr+xkp0=;
        b=WKtQslUAMz+7KJ4hsz8W/i7H02VMk4KOMvfkmXsXR3OVSAIntU0OsURXLYkIwoTIYd
         7V6c1NOf7X3fmkCroGz5bu2xGwcDXIXelxqdf/Qn7Q/QrzBgAWWLZWnq0efue+WYjyPX
         MQ0c0zSLkNCY6ibyPCgKdHY3nuSV097asY0WMfG0ZUcR/NhIRA3WqDmGFQQAtJihZMKJ
         x9Xo1hh2F8/iTyjk1DFbJMhSnsrIPY/+FagF2IxuhtijfiYDZ/rSPD/DLydJiDVSO6WG
         cTNx3yFLmVN3JZ9HAgWhsW+3TwWXuQvnNMwPq+JQ4WhwsPb/T019dobP+CBoUcUXdqqz
         aMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781087628; x=1781692428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/2WnocrnpuSiCW6MaX5GTAHjfkhonjDtGxDdr+xkp0=;
        b=agkJLk2Kt/JlWafX4DJHVloi+/n7slvhtlxnIGDH8UFGUCQ/VKSP3Ncr3KgonBGprF
         fjSidj7Rvs3OqA7eyEqTm6uyPVTb6ypWp17UXYNJJ5WrBIpX10vqKRvrdoxTiPt0P9+G
         A4f8VqQz2FdPElqYVhwzRqVi+Sqq8AheOgvI49CUmK2UdxoLXhC8nfAKhU4yp7y1jMLI
         L0mi40RgShgwi6B+Zj2qs+zrrk37Ab0Hj1OADxdwBJJ+JdZs4wzS2N3S5rBlpLeETm2w
         knTadn8cHFLLWRW25VQEXyPSoPI1522El/KqS3GPJyuQIs5Xqi26Oezgq0CAeGe20apH
         cgIw==
X-Forwarded-Encrypted: i=1; AFNElJ+y83+NFY6YjeSlYv2EfH5AvOTPvhbJEz3d3G8zoYrN4mbv6jWuxVxKxZckl11bC9qH8eo3aArEGDVu/tNI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzza1pUmp4ai6NvtWix4wkPnAhKZNYNG0l5ghxBPsI7OlzTJN4C
	FNLk+htJnzDqOtT7YxHUFR9f7HkWzfhS2CfnAlZQ6NSo/pr5cTAXiZEF1HIMkDq7Z86yO8zPNT+
	Zj8Zjr4biy4D0gzPOX5zjfdo/uj+HblPx06EfyN7v5f1XtDCI5hlfzD2O25ohv0BBzscK
X-Gm-Gg: Acq92OGYe8o9aaPS0yrNqKlWmpWikPgDXZpqVljTmQrTVDkyQk3QV+o7xRbDpFlWt4Y
	6J+SXoXXwjdb3G0R0XNhLnPmJ2Kln/mam1recA9qvinwQBkcHVLV2myoBcOzOnnxuBNiYk6ZJlY
	mhis8QoarR669HbRNSIy9fdMKyhFuq+cE0XL23+aAL+u/S4fwwfV+UvMYKtQSns0M7CONdkmIgA
	UCb/IuhZ5RqIeZ33U3pvRCKEA+spMkBhRHBWEyB176pBtQdAW7uj4vizk8EM8RynND8o71VjVb3
	MxnGh/5jQ0P/MOBQ2o7Sn0kwkwR9KDpmpGnBqR/91GNk3IrCgVWsLPvgTwjn7b4AH/uCW4jwEb4
	ir9PLLJueHLcfgNFTDqTH8J+q2fQAirE0EqYAwuYhukv0EA3ches0A4Qh
X-Received: by 2002:a05:620a:1647:b0:915:f92e:86 with SMTP id af79cd13be357-915f92e065cmr142431085a.2.1781087628335;
        Wed, 10 Jun 2026 03:33:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1647:b0:915:f92e:86 with SMTP id af79cd13be357-915f92e065cmr142429185a.2.1781087627924;
        Wed, 10 Jun 2026 03:33:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307ce3sm1163172466b.43.2026.06.10.03.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 03:33:47 -0700 (PDT)
Message-ID: <1b05d626-3a04-404d-96bb-57eb57db46a0@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 12:33:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm670-google: add lpi reserved gpios
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260602021722.30760-1-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602021722.30760-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a293d8c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BITVXKfNEooxrV_AlJUA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: _LLTbQ9f15S9ihwMOXeG8sZ5bvLkqb6p
X-Proofpoint-ORIG-GUID: _LLTbQ9f15S9ihwMOXeG8sZ5bvLkqb6p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwMCBTYWx0ZWRfX3bjoqdIcMn3L
 wlTGSVzNfzPBSTG0zwbcCHWIYJGGC9Bhk+VUCyp6CGRxwJUdKlyUeoUUhLTLLiuwofogKzhdczU
 h+Bnofvuz3XVQnppf9n8vzDZpK65XthDD4ZdbnlSP/mCWnyefCjT6PL6x/X5BoGdrlQCYPGtEef
 zKizQts96W/PexMf10OCktYVziG4T1NuG+6GkkKIptZEOxvXBXoLLAjfkHu+tnGnwssbc6c7BzJ
 MA2O/qhN031hBnJInBXWUr1XeTZYRS4xrnphmaIgdwOOj5FiUpyUFugMch9XTsR3Be+oRlFiDaZ
 8UMh7ZORmzfASM1X/lUoVKKjscr0p+ShQmqW/ge0VmUZ3m4nb5EETv+StJ5T6kNkC+HpliYV+U7
 XHi1Jka2b3ilVHXzSZ/EPevrdAWGxZJyjp9MJyLD3IvhzidNjXwdXLvXb1xARB5VuwukhzL4Gsv
 9slqxrYIjkzi+OAk7kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112396-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mailingradian@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3900A6686B6

On 6/2/26 4:17 AM, Richard Acayan wrote:
> Add reserved GPIOs for the Pixel 3a, which blocks access to the sensor
> GPIOs. The hunk in the original patch was dropped in the commit because
> it depended on an unapplied patch, which is now commit fe9f4a46895d
> ("arm64: dts: qcom: sdm670-google: add common device tree include").
> 
> Fixes: c4b423835ee7 ("arm64: dts: qcom: sdm670: add lpi pinctrl")
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

that's a lot of GPIOs..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

