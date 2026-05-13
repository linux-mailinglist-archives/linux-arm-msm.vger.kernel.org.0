Return-Path: <linux-arm-msm+bounces-107266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLoGBQBdBGqiHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:14:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D5531FDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D689300D70E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CBE3FCB29;
	Wed, 13 May 2026 11:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTfh89gI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fy8D/IAO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFBF3FAE11
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670745; cv=none; b=NId272E8EXQqLor2ifSGGs1SgIFCTSLtzWbihS3wzXFeTQdTkagSs1gMJQykmEIWoPoekVHyZLxhNjXjM3o+wlSNs7azkslpqpW8oPlKGUs7ZZNQEcmXf7UZKgvyPd5vOVDj/j9Kk+tdwXmc+uIcdMot6CCHMKTrJ/e0G/JlLxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670745; c=relaxed/simple;
	bh=tWK7xDoPvOhQLhzmBJZnkfCQqBNyAcRNK0i+J3SwepA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6jD8Xc4lFgFQVK+okhsEC5+N0GVGMstB8vEiiSMPXTPBE/J3LPkDHl0vvJ+7fhIWzAbYSNmSbh2vXasjvI4OHwX7v4fIxYTTBGH29S5P3RtR4kAYg7bWfK9j6bQc4WP0qTJfvqKYw8/Ff7gn/LsWtjRlxBIFB4TBD9gb9FL2Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTfh89gI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fy8D/IAO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jiBG3007654
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xtBA0g8Neh+NI4xbEt8pys13cxLS7hLngFtKr+aHMN0=; b=HTfh89gInQ0Mxv7E
	NNGAvhIg1DaDVMOT9cq/gSob7kzi4NYQ8Dp4fSqH0mtDSMp6RG83K4OSHjmDLPiL
	z2vjQ8vG1va+zofOmGM2slDGbAtraGQVlX9sEJ9bzZpnKgm0bSI8TM6OTc2ByBIL
	WPqu9tPQcSV1gg0RQhg9WUr5FM7fmU753wrrkwU7YGchBhbYIZubJv/cN2gB5Zmq
	rTHEbntjA7vpoSlc6h7ZBm0I65E/mhF79ziY9CMikaS+w7AcjcK83d4CAmh5Xb3o
	U2bQfTTSIcIuaejRo3aOevb6OZq0BUdm2eZGabXXW674Lk2KylPtZVCOWv3iMNBf
	2kxW1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0ga88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:12:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514b5d6bb45so38557651cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 04:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670742; x=1779275542; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xtBA0g8Neh+NI4xbEt8pys13cxLS7hLngFtKr+aHMN0=;
        b=Fy8D/IAOTBXWlgQT4Fei7TI2lioRYUrh3/8wUzfZMdf5ZvPfc+/PeSZQp31sBUVXU3
         P4+3Itdwpa6eUlNS0cPTJ4I0CRSrDpMv95P+OicYCM9PT1bGzh/IOztBzZjOKAJGNFa2
         T0eTYSuVQackxiDGaxtYbc3LHaNSaGaTt+bdf4n2aEIt/k6yavWE9lcRyZ5F0GJPLxCp
         piiu/p/JCBL7lY0B8p7EY1HRFdQWDj2Ppe4RoPsbh+XSccmNJK8LAsOSod7z0yiz3Tht
         Q55AFfEswiW951rlbuKFOs1w/w9XGA+c2CsFvV8cuC7cb2V6c7unM42PEvg8IWDgeDnx
         T9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670742; x=1779275542;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtBA0g8Neh+NI4xbEt8pys13cxLS7hLngFtKr+aHMN0=;
        b=eO0OyuvqnrE5/VBa/plMurHq2mNxgpLyXkSCIiKIuF7DE9X8CikNdUhIilZ4/weSAQ
         f2TFT706iZU9MLZ52V/o0MuRPC3vVi4cE4VY1s3OyftZN7R84tV+XrstB+KKFnXb1PGd
         DMl1IrzKulkiZfgZAVZh9Rgs+tUMH/VUU5U5rH0qutq183/at0Ct9qsKu3lRq7Z3n5VQ
         ynKurCb/mqhVhhwXa2WyhDqfix9xTWQywcVDsIaFtP7mongW/lRpk1KP4C1bpd7xRXt1
         R+u2UKFVRJXaEDgZUfWvym91/m28mDTq4FhDu7CFUCaeOdRRo+/zJemT0DzyzRAdQ5eR
         32JA==
X-Forwarded-Encrypted: i=1; AFNElJ9epY/yVpmNYHYy/zAkveC4i2k2SLLnlaRQAHnMGG0MBCp7ViOJQ5b88EK6+hcOmkfSVgzhcYNESxWURF11@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3hJ1rhkFOxqZ1jfptD2Snoq4Wxz7IYGS6XgX/JdssqoKqjotn
	uh+TOCkxlAljiNOoaBLMxP6H7wWVbp13VqxdZSKZZol3g9XlBE9gn0nlUrRk/PTfNSkMOvp/1Z8
	AzNEKgwSFyxK7DX0y7mfR8m075nB88vcQ+tZrjUBaxjcPLF13rwL2Z2jJOSxSmEitTYdZ
X-Gm-Gg: Acq92OE0E0lC2BFAd8tZq4lGl+uE3t2avMjI4ZV9/Dk5e0PEYSrPz8g7+h2pWn2NUYA
	H3syvt7O5ELQkM6yNtM8UZUeKH1P9r3PQmKTu6dU4vjm/F+wHSmPPMWVY+zHmpZyqjfU3mKfByO
	k+Os2PPxLmMtvbFHFR/Z8uQGcgSE43LQU9r455XqL5kQKFI9IjyQyLdDPNCiOtFcdH+quxOSAUR
	Uno7S22cJnEaCBZHMQkkRVnuTTWS303bdCt7Ye3E8H7iQ5jjyKOgZvxDV9ijfvttdxsd4hIzoAj
	sM+Tkq01ZynqpzEM9qLTnMhd1OvDLOjDAscWmZV4TGfKzMpII8ENJpd3G/Lv5eNqmfT5bS7HdP/
	mm++J4wlAes+R31FtwRu1rWFC5xO4eHz9rEofOxS1/m7OSEp0ohHTtWftCdpQz/LFnRG06d0x2h
	6iY7VHEyRUQOcj8ChB8FHiF9ZYgewQTe3Bpg/S3h8GQzi+8Q==
X-Received: by 2002:ac8:5e51:0:b0:50d:7c44:e144 with SMTP id d75a77b69052e-5162f4405a2mr37648591cf.11.1778670742409;
        Wed, 13 May 2026 04:12:22 -0700 (PDT)
X-Received: by 2002:ac8:5e51:0:b0:50d:7c44:e144 with SMTP id d75a77b69052e-5162f4405a2mr37648121cf.11.1778670741861;
        Wed, 13 May 2026 04:12:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8e3d8b18asm1039853e87.75.2026.05.13.04.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:12:20 -0700 (PDT)
Date: Wed, 13 May 2026 14:12:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN on
 spi18
Message-ID: <tmltop6rezrqh2swke7v3cyqdq4vwh3rxeppdw53iks43ajqzq@cs7e62hjt3bm>
References: <20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNyBTYWx0ZWRfX7FKsbDKWdLSz
 6Wejz9VOqKs04QDAwH/iTDRJG8DzdspkwfyHbTINPxCojw8yLqwJi4FH5c0wqvtBkJJTJ3e4imk
 VCrr0ax3E0HZ8O7X24XPJqZYDkQjoT29jkGpZWRk9Gz667eZxxLDEaaXQJ3wIwk1+DbjsKtUf4R
 KkJt1c80Wi0r3LamgedRGOT3uWnLBi9OzYKWUZ7O3OVSsfNZJCzlTS8k+Fcvn5iS9zvD6DXzgtt
 w+XNkAPasx7AxAhuqVc3TjrtAdltb4+TyFjyHqxTC8nEt2C/IVQF+uwpaCo81Xp56J/n/XSRRsW
 kaJK3oclCM5v6O/oGR2rumKcb06FGxzzzgOSpC6rTfwDQRgWM1mcrE2y6ubmrLfft4GZKOvHw4o
 IzTekrxZMxiIiXkdwJR0N4u33rCcexW79PlXrKYCMSiKHqTy+QC76EF8n7BwBml31Du+c5nvwWR
 WPY8kZAEEseOFATIXMA==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a045c97 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nO9I6zzPj4eGOE0Wvx0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: maBj9ShEVbDdioKu0wRzoQwiIakFgAlJ
X-Proofpoint-GUID: maBj9ShEVbDdioKu0wRzoQwiIakFgAlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130117
X-Rspamd-Queue-Id: 7C6D5531FDF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107266-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 04:25:04PM +0530, Viken Dadhaniya wrote:
> Enable the Microchip MCP2518FD CAN-FD controller on hamoa. The controller
> is connected via SPI18 and uses a 40 MHz oscillator.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

