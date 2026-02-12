Return-Path: <linux-arm-msm+bounces-92652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EqqLYmYjWkt5AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:08:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E83D312BBE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C426E30091E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087942DAFAC;
	Thu, 12 Feb 2026 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itir2PcM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vxcintm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1B82C0F68
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770887282; cv=none; b=eUGCBYbi2R9du0ZrN6st6rvHbBzmxjHdBq2Gdh9f0UVPd05KxY72M1Ca3LkZ4ngfpGAjtcgM20Vp5nPs3h78yWKEBq8sFsoEgIsCRdN0BIfJllgtMCQAlzCRkseALT9r8exkA+v16YOW4KeDxN2kzpE5GYUYpHY7kSaaGsl0100=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770887282; c=relaxed/simple;
	bh=QkIlC2c1IrycbIOZYSpNKUjw2hE8NTS/y8gf2m829fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EeNJ/3OrnVVtxK0CyrtwbNRctJIygkc/K4e+CcxiXaxQiW+bDyHm9jDChDKkyJUtEJxXn7cbYoqMad6dpo/21U6PU8yPnpzyGGQ8awlVBLL4rY25IFUhrwDI2cCtDc5smpIa8J/oMRk7FL715cK9ArTfQnqGytvtfa+AIpaYSp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itir2PcM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vxcintm0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3RhYg3143769
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yY+YVjt0peQ43IwlSakYCF9RfkCKpZ2GlunAx/uQ21Y=; b=itir2PcM0dzoSoEk
	NW6TEjvYhCp7mB2lHsur6XmYp9VUfFUIzBwMDMUgaQ8TbcQQPf0yum328ICCZ/Xr
	xMJbVMTvU+1uOzQhSZoVs+6kC5qrkZWsPBoG3PsdhAwWj4j/ct/xP2E0eMFVGEaO
	MGZE1oUx/cNRDI5RurJV5ohmVpYFtLj9sbCUtFCI8s0/ppgMI/ukh3cFn1+2Ohbg
	DNWgYF21vaMn5cYusZTAi8QRGoAXYMT44M5+S5fUpEHxHAUTp+DGs8Vni3TgjZ+n
	YuYeSLXsJdE0DxxbPr7TQSWOgYyXli8qL8LzmFAjUDGEKsBVz59s8EDfXsPXb2jN
	V3EpNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c93snhfp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:08:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb38346fdbso10092785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 01:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770887280; x=1771492080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yY+YVjt0peQ43IwlSakYCF9RfkCKpZ2GlunAx/uQ21Y=;
        b=Vxcintm09ASzxKWlhqN/O+qj35iV4JItLOOCxcOsUd+a8/env+xNAYo2Oj3yvDFI6S
         Q636ES6/DDFa+9txQTFpducKZK/jrqM9XRmXpShPTGVIESwDbq9CN+1T/9/2AyBEBxJ+
         Lw8Xqdult4o3LWyDjWMqzophNPWIfDJhd+8OzdI8e/wJKIhUXuIcNQ4xEprBL6sZ4vIB
         DuLCZh1vKajZXulwhJoxoo/rmPg4qU4/vRiSKB6kSTsZ2O+C/o1Q1C//TP7DQTwQkIpE
         84mrX6yapSTPw3v5c4AXSZ0JaP/Oz6W7X2b00jyKoVtRKogkDjMBZ6GOcIyU6vAZHhCm
         phbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770887280; x=1771492080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yY+YVjt0peQ43IwlSakYCF9RfkCKpZ2GlunAx/uQ21Y=;
        b=L8zoEwpuIzeuVCiwYjlEI4dqb7ND/YuHrn/zVu/papJYCToF5SnWcDW6/MTvwihhr0
         szzcz/DoEpsyXzh3mT3GaYNsUI4NhGB+2PAoBTvWsm0grzyBHOVE1HCy7Gwdeu5XDum1
         LxYZL2PcgCOqjYF1ePYqjh5JXXZ/s7XMuPwPfSYZlnULrxN+Kc5guIK3rIMolE+FHJG6
         7qBNZHYvIhbzHWFelwY70MWYXOq/BHfaoPGQ3m+WGCiFRDfbJ5VzY5MjloHV6vceDUTh
         zBJn68cbmQD8QxMtNMvwYY/5bpwTQGvNmPwR0Hhxt/DVNK6IipZ7BqYAaHWaLVTbGkVl
         oqRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNWdGwcQ2NvqsuFYQYqr87+WpnvBffY8qhzjdlNcCYxDGnYjt6sPfpMPWR2NJ692fUG/ulMtuEULYa1V4j@vger.kernel.org
X-Gm-Message-State: AOJu0YySkcFWWOLNljWczpQoBA4LBxypg3InC4rBRkkA6FoQjrxRau/6
	VwcW9uxp3OV/F2fWCholJd2u5crvwAaom7942zbc8l+vJYXlNxPSzLo9lubnsbdA4Rtab4PzX/2
	E++QormhG04Z2kK7cHBt+6YHwPrUheaKp/Htg/pdcasFyzDvUnp59huAFvRmKsf/m7s1n
X-Gm-Gg: AZuq6aJLmJYJ+VQHpEqIRFgGzpMvdatj11QIql2d21YNhfPfH7vX99x+Fwy7ANFY43l
	TQp96Sf+YfZged8po8qT8Gxsl4nihgLHqz4bLLX8bK5zmyUMH1HXe/PgbFBp1eOqqTzhKCqfb6a
	AwyW66F6068PL9IhYXNDYGmC1gNPtvfSOskMlsHxJGfR0uH+c2qggl7Ketvw+IfgoYwyq9kZd9n
	JwLRhiOl6iDAejhZzGwoXZfxWgbLYW4FsIvbFhazQy6kgEojK7GIo8GEWj86idrwgAu4fmUofxA
	eWXQrPbdThyU1zIqe0x+hi3aNQqxBbXdc/zA9mslUIj3nBGxp3MqC8BcyTNsy9LGpEWR9c9rvd6
	qYjO8UsVLIS2GviSQNKRJGqL0U0i4l2Mn/n798ilDjawbbhM49QJ7Eh4s80YL+KtFBdlbh1D2YK
	38yLU=
X-Received: by 2002:a05:620a:1aa0:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cb3315d0f0mr199956485a.9.1770887280067;
        Thu, 12 Feb 2026 01:08:00 -0800 (PST)
X-Received: by 2002:a05:620a:1aa0:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cb3315d0f0mr199954785a.9.1770887279609;
        Thu, 12 Feb 2026 01:07:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ebd976fsm139926866b.34.2026.02.12.01.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 01:07:59 -0800 (PST)
Message-ID: <e7e8db84-d30b-4e10-8b5b-926c618579a5@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 10:07:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: qcom: add sdm670 lpi tlmm
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260210021109.11906-1-mailingradian@gmail.com>
 <20260210021109.11906-3-mailingradian@gmail.com>
 <5fa188b3-d060-4513-bda3-6608a9bdd7ef@oss.qualcomm.com>
 <aYvOvYPDnAfYUk_w@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aYvOvYPDnAfYUk_w@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2NiBTYWx0ZWRfXwGnQIy+XRSFE
 TB/NStc5WlqExdojPnxnyQSvKsMGvikDZxA0jKRKR79QLVUMDZoONu3o0sH3JB0/KsEabSpWGZg
 eKG5JOY/WyHdzV1Ys83FtLDKC72hBlT90OWlzeTfZ0G0O+C0xiFHEIQylSa8MFfWQ95dqKQ73m1
 wNjny2+CwNLTMTo4DH39B4TrJ7al+xciZK/6KLgWotmPgaGF6Aoh2U0az7Oz+hH5/qWpvMAAD9B
 Ft/TCqvyGvHd6LXN8aZVqGJLJ1ue+5Jc01UyBpPQBrl1Mm4+iVCQBRt6pWKGROKWD38Vl8rT6Eq
 Y1f/3u9kebPkv1twTzHYQBEVQApluRFZbzYLrdLcRNBV8mmSP8+jD2A6I1HXiBWN0vZ9gNEfZR/
 YjyvhVPJ3vLRTIdKDbxlHxqM8tVnDOGAwimELRoEbUo+gUIQxM7TXfQfqzEccXjApqY5Vr/6y91
 cwT0NrXQfyw45A++GhA==
X-Proofpoint-ORIG-GUID: 4KpYvOwKBlJrqJxOPUYoys4yr5UeHWdL
X-Authority-Analysis: v=2.4 cv=dLCrWeZb c=1 sm=1 tr=0 ts=698d9871 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=gj1ucRnNfbViPrpgjTwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 4KpYvOwKBlJrqJxOPUYoys4yr5UeHWdL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92652-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E83D312BBE6
X-Rspamd-Action: no action

On 2/11/26 1:35 AM, Richard Acayan wrote:
> On Tue, Feb 10, 2026 at 10:08:19AM +0100, Konrad Dybcio wrote:
>> On 2/10/26 3:11 AM, Richard Acayan wrote:
>>> The Snapdragon 670 has an Low-Power Island (LPI) TLMM for configuring
>>> pins related to audio. Add the driver for this.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---

[...]

>>> +	LPI_PINGROUP(12, LPI_NO_SLEW, _, _, _, _),
>>> +	LPI_PINGROUP(13, LPI_NO_SLEW, _, _, _, _),
>>> +	LPI_PINGROUP(14, LPI_NO_SLEW, _, _, _, _),
>>> +	LPI_PINGROUP(15, LPI_NO_SLEW, _, _, _, _),
>>> +	LPI_PINGROUP(16, LPI_NO_SLEW, _, _, _, _),
>>> +	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
>>> +
>>> +	LPI_PINGROUP(18, LPI_NO_SLEW, _, pdm_clk, _, _),
>>
>> "slimbus_clk"
> 
> Again, what pinfunc? Is PDM, the protocol between analog and digital
> codec, using the SLIM clock?

Where I suggested other names, they're at the same index as the existing
entries, just that they align better with the documentation I have

Konrad

