Return-Path: <linux-arm-msm+bounces-113609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pTDcKTSDMmoM1QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:21:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19671698FED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:21:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jGa+OMAW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ARSNzosN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113609-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113609-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFB0E31E6DF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF04369D42;
	Wed, 17 Jun 2026 11:05:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4962B2DF701
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:05:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694315; cv=none; b=awQ6k3sHMdgfWuz3Ybty8/dB7z6QNdijqgOFaZy00TD8uD7L/7MYTiVJ5/r7iPO27iJclQavC3eMebBNDRMtQsEdByv0uorxKN/ohU6n/GAdMt+r9kDlCAg8vaEQcy4tSUYBDkNaXb2Gm9MfhuutkwaTXBWfoGtpWhHZ/WQPVLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694315; c=relaxed/simple;
	bh=eEiU8vMu+5O1vd1w6lRUiGs5KR7SZ5QpDvtIFlNlRTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IAGgzZJ77st0f2uIrshBzwtaF9MA9J9zLssQLm3gSYxJQqNXWZgiBnkyzvQ1c461BKIYO4WoXe39l+10oWssMVwZsHcNo03KAvhbm5AKFNpWMAKOMBq7v6Ad8yIxTHv6cOxIN06VvvnWQjE3Oeclq/NSpJK621/SyTst7EChEIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGa+OMAW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARSNzosN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UhAe2219571
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qj70XiMRBk88XSknFY6Ir5XzqLm8axeDAtiCmENjOvs=; b=jGa+OMAWzW2QNASV
	RBhcQINUjagf0ZQcla7SH4cLO/fG4+60rqMscZWpAkwf/C2OMNtmHZxWWUKTtSv7
	/oY/yXoeIcwDjr4AfJN1m9yHnfrDpCWN73Wc/iF0/q17X3FclXRdxDSjjKgCgzRM
	a1SnLoNeTUbyhEhMhDckcuLOZK6rA6c5SajdnW4DXcEgR84qlcSFBfhxpPkZvqp6
	GVahBusdh/Ui43hOBMHHX4qt66W5GBK5JOI2Yzvu4mfGTh8CLWDaH+jW8NoaWHWE
	X1Y0j1xXRuwj+n6/CHANhdCHMWwqRE0FJRODDTaVgX7ra/KtaqyDCiO/XCBVH275
	fBNA9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueeratw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:05:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915a547f4b3so69078685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694312; x=1782299112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qj70XiMRBk88XSknFY6Ir5XzqLm8axeDAtiCmENjOvs=;
        b=ARSNzosNfpOTWoCL4krVw8RuZm6MdZMMUaHYHbaywZZ79fvBMedYTzzTucqNjl/FC5
         1sPbSGN6KtkKGz6sObPL0rXapfIyRMFESYT7dBbA11IeWvVJoGFpA8rur5K5IGjUBz3U
         YP9FYDBDoKkyEullxp1BidaO7RcExFxgMDCBTxaTB7/omH1xKFnTxkhwgLRaO5gnh8Ax
         7JhuIjBlSJiSrKYrIdSppUupYO/zpJkCeT/7zxckFqopfXUgBg4MBd1wdCSgAwWXS8DD
         dJNS+d1V4F7AFpQ39zY0vsLASgH0bYzOoAx6hX9HtquM2eBO+r7wKxrKqDEHNJMOtQ70
         iIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694312; x=1782299112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qj70XiMRBk88XSknFY6Ir5XzqLm8axeDAtiCmENjOvs=;
        b=i4bfPL8m8qCKrmW/er95Zdvju2gZ7N2KPOsSMqEAlL++ZuCF/E+DEUdbipfrXuydY8
         hp3pVVcwMBrwhnIGbieVWfmLFBmdIe5gTBuh878qMrMmaC3PqV8HO8n0gXBOrFgQrqFz
         DgiK5WR1qatBeWSU6sJeBdcbW6Q2Ye4i7t+IR4KWq7uh3BHX4P1SsuCp6BOovEgMaYvS
         8i/8dbCMz6vCUWm900q+mhvHc1oUlFIHB943ICDuanifrURBa6pt4OqULUfluD9T9+YF
         cPiffpLBeLq1YzjJuwX+eiPKX+WCwpYx+bO4xLiYAwKkbOxRoik55KPq1045GI65936p
         8CLA==
X-Gm-Message-State: AOJu0Yz248cck485b+Dkv0BwUIn0DTZ1Ziixf2jyftHwOF9RgDHP6vz3
	/J5fdBGi+0wpPCOQt+3+ucjHd55JJFunDTy8ZU8hOMDdUqsixwiHgJj8KziaN2K4shtzcCL+SlB
	xKkjJAz97m+TnKlfIW29tUMwShaR1tQIJsbKyZvEYZ2FVsQyDoXCYpHkCBso1lAvkbggv
X-Gm-Gg: Acq92OE0N6kCbN0B+5G+mdI13j3/sZOVnB/iWh05Vu+txOzAdcTQtwYAPprB9rEPram
	F+dJpDh8gCgx5a0+2lGUspxqGsnnjH0S6X4v7NU6PQ/hkuT7ZfotexvmJbgcuPAhQKtgJkMEV+Z
	agdgsc73Ae5GFHcQ5+e8MkQAfrU/QqnmZIup6MoMkxNA4ak+nhjt6IufHg7UvtToN4tPqwLjwU6
	NSwi0E+Nh9X4sQEC3hKF7IwCPxgTOqKIbn7JbC7BPsaXSanNqUZQcQGWl6I32XVrk0ytJICFkhh
	Giuu+ik6epiI7t1pCF4MyF12ho6MvRugbgmGOb+zd2v5LeaHFK969vgtW7LtZ0ziTO9jV9yZZDW
	XG/K3yZZkCz+f96l5+PwL6h0qeoXc8pV2F0Q=
X-Received: by 2002:a05:620a:6286:b0:914:ea37:6f14 with SMTP id af79cd13be357-91d8aae2593mr337702785a.1.1781694311651;
        Wed, 17 Jun 2026 04:05:11 -0700 (PDT)
X-Received: by 2002:a05:620a:6286:b0:914:ea37:6f14 with SMTP id af79cd13be357-91d8aae2593mr337696685a.1.1781694311144;
        Wed, 17 Jun 2026 04:05:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8b23f8fsm760459866b.53.2026.06.17.04.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:05:10 -0700 (PDT)
Message-ID: <d4d01a6d-4c9e-4822-b0f6-b98e8ecf34f5@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:05:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
 <20260604-enable-spi-on-sa8255p-v3-4-43984eac4c67@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-enable-spi-on-sa8255p-v3-4-43984eac4c67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX9H1MdZ+0uB+5
 nykDdihPmf3rBlz+C1JSiyEV7Kbbbp7NF9ON1UGpAlXH+eJzPbl/V5XLLuUA4mNJ5708NoL/c67
 8SwIjSp7s54WJI1ZffiCWpNDdfDwqic=
X-Proofpoint-GUID: hR03_EQJRcmp1XRmzuqKbI6x9G6ROGGv
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a327f68 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Ow8ltAAN0bl1iHkyYvMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfXyj/ejEow2zk5
 x2nQySl0zo4AYKcAayhgZOrKadDLJBYsA0aTSCUUNed8c0fObtGlAv5sxFMzRzpPlEvYob4/wPr
 K5MjkWnzGbp0i9ZFdqU2Lf3CR2d6jcuBT168tUH78plOsMNGkoMq9MZ7vkyg5orjiiNWv8vJieb
 +0YydfWYZRmOAk6wzqv4XuX3L44iU5yE6BPO0wdP8lgaotGV6xh5g/o58mcBtfsMAWLv2UpTi8W
 2BHZl89IFEgaF15DVj+g1HfzYgVtTqy8DZ0knBrO9lr837zR9/v0kYjWXfx5v2cQ/hTkkOmCK1B
 xrSuQfloOSeKBm0CYcTF4izX5XF99c2eL9z0jV4hSNkudPALRNjs7CB/apn4BlfmfcQEd/YiCdA
 /PVdOR8bUQXjqGMIs/nTq+dcoSDrlxxdlf2E3HoBCjMPOuDmDFkIvFduie+Qtb+K6y+SnJekjFj
 mSdtInI0TlSQsAdYeHA==
X-Proofpoint-ORIG-GUID: hR03_EQJRcmp1XRmzuqKbI6x9G6ROGGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113609-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19671698FED

On 6/4/26 8:50 AM, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
> 
> The SCMI performance protocol manages SPI frequency, with each
> frequency rate represented by a performance level. The driver uses
> geni_se_set_perf_opp() API to request the desired frequency rate.
> 
> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
> is obtained using dev_pm_opp_find_freq_floor() and the performance
> level is set using dev_pm_opp_set_opp().
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> -	ret = geni_se_resources_init(&mas->se);
> +	mas->dev_data = device_get_match_data(&pdev->dev);

This really needs to be null-checked

Perhaps also the functions within that are called unconditionally

Konrad

