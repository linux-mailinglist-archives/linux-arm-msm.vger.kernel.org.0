Return-Path: <linux-arm-msm+bounces-105324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7HcQGOI082kUygEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 12:54:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCFB4A113A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 12:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B37CC300348C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A9B3BB48;
	Thu, 30 Apr 2026 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+wX++2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vu/YtEYJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D2B3BA241
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546462; cv=none; b=A4e0S30MpOt0jDkO5L7VD80cemNUCvmj8cHb1W01Ykncd024LBbl0DabbMoO+LyNqIR299lI/9nm1LxDMlAC5qN5b7JbU5CQLqK0hRv2Pi8V+nou4ZTNbLt7Tcs9U/T3YGYolEEfjCTSh1BKEh0g8jg1WSW80ZzZz0AhSLGZKH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546462; c=relaxed/simple;
	bh=NiGIsc7+2BG9Ag9y3ftpDM4w1lYngC9h5iIud/W5nAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ow2oGZ5oKAYNjaaSGUQjupnFWbYZxw8wj/md+CzxE8WqRqJsdK9idPMtEHyXsv1vt3rhygl2P+RJ1n5U4nbN70DTKwZJORYTQuA3Ohcr5j9qtEy+iULlDikxEpBHNzv4Dw/9a5oKQ06qpcvb7tkYiZ2lGGAUL/6Jrn6zbD5OBFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+wX++2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vu/YtEYJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UApnef2907506
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 10:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1EDKwO1UG1K0QkJS89ldvgWnbt8po5vsN8CULEuSTRo=; b=g+wX++2sRsPI55ef
	GBVjeOGFlzHmNokT2GEZzxno+pNQ8Fn5VsAA9bd5S5nmCyc8e+aJY+oVBinzPl27
	fJwa9PlB3jt15/9wc+94ryDK0lalNl8ofgdg8J3ESgnY5mN/c7JVKbNJ0NbN4d1f
	1yQ+hJaSfAaRSyRjSdRKO409lOMZk7syAaokmoj/7gwTmYc73kxNEcK1fYkTcQwH
	HHqTzrC35ykQYO97Nms9pcJVOMS18LmKb3kcsD5z/OuKU+QzSaF8Z4ouixDAst/q
	si56y2gLKz5BEpei7AOUK3IXfDrHR5oL2ymvabNJEGWr5Ti/Vj0IYtpAEXDP6IGQ
	OYWsng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pf9e9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 10:54:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so16974585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 03:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777546455; x=1778151255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1EDKwO1UG1K0QkJS89ldvgWnbt8po5vsN8CULEuSTRo=;
        b=Vu/YtEYJXwTR9WPd9KUV98J5qekPNzU2r+STjbP8T/0w93oNi6iTcmZIsdx5VF0Zwc
         +cDYQrvV4/9Ag9meTXp70BHZROhsWGrSdvsvQJ40/xwOKHY812bV5/eJf5+tTfaifOIv
         K6xa0UMG3K+XZWcjcyTVWMM7vX+a3URhS1OLFcfzWJPBcVbI3BvC/zFuL+WEUHYM7yJc
         oRBTWY5tAXGz+1XJWfQhCViwfiCZE7HTZktxBkzClZNXyc6i11mHR5Q5CC2w9v7SUODm
         D9ubudzto7sJzJKRxsyJqE9yAkqPrCbeXT2HfBp0yHwZcl+TLBSYFEzHD1ykURQk9yES
         RNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777546455; x=1778151255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EDKwO1UG1K0QkJS89ldvgWnbt8po5vsN8CULEuSTRo=;
        b=JSfL5hiUN8wKKo6zr1LqdP31P5xo/HUKmDHXRXPhwUOo00x7X6Jg4Am+kyoOEVWqTj
         DW5N9zXysyrwrrhbOw8clCTzfS2sTAK4lneSkg7NzSsdWu3GYN996Nuzs5hwo17qXsGN
         VFjkFmJuN9J2spfrWKBpr4LBnWMb6UDiJ/LAyfblbLu+6edLIvhKr6sSozou1fdNzsLh
         H7JCuTYQsZaSPK3TucG+NYJ5BFzVUbzsrHRVKzdr2JdKJvaxXfmrlSpRQ0upMAdEAt9D
         u0cD0taIjRbjZsqlhfn0L37PC/f+x8igKZfBrUKmk/2kluB9TkIJsoUgC6TRf+DgkoGe
         wEUA==
X-Gm-Message-State: AOJu0YwpsmDV+7BVB4NIVq/KoSUuGDR4bOmm7sG1HTIfCSFq5qXoRlFD
	FjIoXfbZk2vD6pTi3oMWDZRLxpI1P4D3+g8eKev8xZsGhQpMahDS3iDNqaBqjQorXIRXnjoJS98
	5wZ/4gn+1Y16X4oU7HSq0XgCi0Vhicvy/55CLas3Z1+ZgwIe2xvZIAhRbuXFIXzIRmGJs
X-Gm-Gg: AeBDiesADN0y39UVj6UHqty0IZPNkwSTHg5iq6t/o5RzcMjLyLcf1eS4TfMZmwx1c1H
	sPA7/7A/4autnlFobzqZyyizcQh1329D/xl++MOH9y+udAkzg+QOiaEtvCFCe+nCTidcHZMac6G
	ZDD5xdJtcSI2xkKwjUZ99CdG5QFBCdS6w69+62UB4mWWl9mxecV+Ro/p+rr8tvqp0VHS0KbZhBQ
	zLjK5vQHpgLwpWxphfeR/C/5aundoTCHC2FYE1p3NKOUO7fCAr0c+wMKGK+xT6vDrM/lDi4X7sk
	U/yf6Pr15T5KiLmy6tSCumIYVl4V/IRfU2WM8yCZq6yByYgpXxBVjsy+m/8VUq+xwo2IARSHnA9
	1MMUXq87wspub0Dv3k7f4IEEMiprLyC0o/vHSbwOROI/JhUaQYGtM1R/GRxUi/5jdKWJ2QWh69F
	l/92epjJ08Rgdiag==
X-Received: by 2002:a05:620a:444a:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-8fa88a4341dmr240220585a.5.1777546454639;
        Thu, 30 Apr 2026 03:54:14 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-8fa88a4341dmr240217685a.5.1777546454135;
        Thu, 30 Apr 2026 03:54:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b220d0656sm1771099a12.11.2026.04.30.03.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:54:12 -0700 (PDT)
Message-ID: <bf1e9880-745e-4c7b-bfde-3c5ac39175fc@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 12:54:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-2-1b4bb2b3a8d6@oss.qualcomm.com>
 <38bb1b79-67da-4a23-a0e8-3c3da77933d7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <38bb1b79-67da-4a23-a0e8-3c3da77933d7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDExMCBTYWx0ZWRfX8ugPFWeNc6EL
 PTBoo7Y64+O1XO8ubxYenLo47ztVryQGbzy2PVpatrZYV1YVdYcJHsCY5vJbBmwj3F7lj3ieRH4
 hTIvD0PI9RrMIlLe+O9IVvXfDnmi8qAXIYK5NEOSmHnUhrJk0/q9bxtdQ50jeCxp2SWSTBDwoR1
 ldgG8BOGBnTRJoYL5B5O/WxZlD5VM+Oz+6Bvt3z5XyqFZSJco6ELYTC8DwdFMWp7FOfIHNe5evn
 ZLp+9WpuDI9rcWpu5oV5BMWQ00kX1FAYih3apTVZltHmaCTT5XeU8Ksm8294nsCFZkNLNNhjxeR
 oFPpZQzKw8/yZiuzDydA0zgKFoqKBkmwdKNrm+tWvQ+Bx3SxhKVYw+H2JHiVIerEi0gXE3pciSV
 x1EJ08nsvw5JLFLyV9ZS/n5BMFy/S4ec61XFzTBqDRbw7dGqZcd1Yesi+hjXlZP2MdN47ZkfYn9
 07ojln1LngjIgE1Hmwg==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f334da cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=JYc5Ya0DD96nsJLtuCAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: S9UMpKtwS_L3sCvUQx0J8DrZWH3Gpn-t
X-Proofpoint-GUID: S9UMpKtwS_L3sCvUQx0J8DrZWH3Gpn-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300110
X-Rspamd-Queue-Id: 7FCFB4A113A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105324-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 6:06 AM, Maulik Shah (mkshah) wrote:
> 
> 
> On 4/29/2026 6:41 PM, Komal Bajaj wrote:
>> Add pinctrl driver for TLMM block found in Shikra SoC.

[...]


>> +static const struct msm_gpio_wakeirq_map shikra_mpm_map[] = {
>> +	{1, 9},    {2, 31},   {5, 49},   {6, 53},   {9, 72},   {10, 10},
> 
> It would be better to have spacing before/after brackets inline with other pinctrl drivers.
> {1, 9}, should be { 1, 9 }.

If that's also something that the generator takes care of, let's fix
it there too

Konrad

