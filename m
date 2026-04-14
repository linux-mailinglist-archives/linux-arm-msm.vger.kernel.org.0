Return-Path: <linux-arm-msm+bounces-103111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFumDJUW3mlBmwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:27:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F43F8AB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BE29306C7D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2353D47B4;
	Tue, 14 Apr 2026 10:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hk+1n8Zj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZvXG5EF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AEE3D3D0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162146; cv=none; b=eEGZBZKB6XQ9i3Nfxoo8Wk91Wwu2v2Tp6gHlIkaR7zJEfE9TSROwqtm+ADaoeXylReAyKImNr3o5dAHMmlz+sVrsylTOJpiwIov8A/UCTRLfbF262wjiM67oys9/imOopPcFakaZp0SxUr+yjTxshQdFL2KpBBdK1xDdyV5pZlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162146; c=relaxed/simple;
	bh=xZvQV0btEQC7XEW4VG5tg7Lr9QviucOi1s3YfDjh96E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tAWITlBo+u5S7TVXiwjNVOJ0zmrRx9HOEvr0KMjH4N3jFNo6PeSLCFDeYfx+v0pJH9n+1Hb0U9jiOuw3Wr2EIvB/xUurJQ4BYSJGxshxCWGOAMuweWH+57vKrxWigmfy4ynpHYtTwajiFaP4jBpxbVt/WM44Cj+uCgQJdJ1o6YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hk+1n8Zj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZvXG5EF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6rxvb969085
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WiLWJ6pQMYgwg6cQ9yFxe+yYkkxwmMyZ1v9obgTWDr0=; b=Hk+1n8Zj+hgYtzDn
	9FkWtgXpC/fBh5sM3QrJYQj1jql1Gy55waqrO3p6iBmO67bhVGgDEe+pkwLfZMqv
	e+SOkx2NMxY1OFL1HOtwLiHseZNnNB6aoPFFtTgY/K0ryJPLIHxGIP/pbei32BTp
	XRzJ+37zYmk485nF7zCzdYkVS/GwOYqDMvPWEZYfIbNHpQajUlzUA2g56HS6DwgI
	PlPgxc+0SzzdZbHjm7McdpZQIdocJsA8BS2A5exTE0Oc5Qv5vESTM9y8V8slXZST
	Edjjlhc3slWE0KolIv1zZ26Rehuwf5Nwi010eU/78eEl3jCHgwo1BNejZInT4hlk
	1RD/5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v27ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:22:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d7128e038so13267751cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776162134; x=1776766934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WiLWJ6pQMYgwg6cQ9yFxe+yYkkxwmMyZ1v9obgTWDr0=;
        b=EZvXG5EFjdUafvVXBXFL7Hemu1fR7m+4V9iKbP4YaYJy05X4Xf56dSB6G0/StZkHI7
         9DkKmCFyw86sMBSYEnHvxUcH2mn3tyDPegJUqSvO2U0IzSjwU//0fh9HBgDUxJKaStEz
         g8vJjACUz7VdnN4KbWCtXk4KGyG16m+CbFWABxJ7FGAzC6OS7xpC/Y4YHsaS6ltvsmNB
         wmFrkRoKayh5baDBJw2B3innKK16E2T9mG9H/xDj+1bTqgMF46WF3O2MolZMIWLt3MDW
         DuBUvTL9Iu3nz5OWbuZ3Tz+koeq3DAQUY5IMrTI5VlLEKoQ1D5ejD6+OHob76+6xhLvo
         1ALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162134; x=1776766934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiLWJ6pQMYgwg6cQ9yFxe+yYkkxwmMyZ1v9obgTWDr0=;
        b=LeWlpYrkEEeegcA3wORSHa8fsrc1E8C2W1QZ2gaaVjCtbkwZrY2n5z93M6J4ByynzM
         tBB3C3vjkiH8n1YtJ3U97NU6+ligvlE6OcHs65L8xTWMHGNIdzptbQWEYNw8EwU5AFcu
         a1irmYVQ5vXmi/GyXno+LOvwLbRqQfFVvzK7TXPoY3gSUAdI0DzOAiXC5zlLLvix1eW6
         aC1ho3O1Y6pDevg10foQVaWEoAxcXv82+bo5MUe+QpJ44LIlCzbC0T07wbUj49fBNUx8
         6xbgMtb7lVsgLlvHUaWyV35Z4g2aLHvBQu5MiBRr33ohwXTboCqO0BQ89dJXFHe4v+Zd
         iFaw==
X-Gm-Message-State: AOJu0YzasrCdy3AmyWC3havsoAV4MBEv50MfWBTkRN9fh0dsAvg4/Obk
	AUDVUuV1HI9DO4Y4HWAzsiTB8izQSA1xgvaGf4CC7d8gFSXL4mbevbNds0FDpkWUlZWuxStngbO
	LZcrbdD8Ky58lnT5crdIMxfXUHpG563MnMkJjQK8kKlAw8vtYayHKG1+erSqj9LWI2d46
X-Gm-Gg: AeBDietQutTBYXL8LemjG17lX+rPCFMX7BR+YU9J3PJiy89asOv6Ixlm0RdtLpuEJIG
	yG38MU/XgOvHIBChOW78Zkpn9oKRVQtAoGND22Pli6LQUWQnbOu9KHOoNnfv7tSeWykeK9KzSZm
	onp8O8l9j+0LUfPYSETQhPr36Hm6xuOi1LBp2s1RYgQnEbWIKNSCXRGmixMq4GrNq+HhvHUiizM
	02lZb4f8knS7Oq4v2Pvh/qHllPP3IX2iPT3s1iFpZaenVuAiIC9pAT5N/dOyM5dkE34MyET/GBP
	FjiJS7ZhDVwckHCmOoEv7ePgKxP4GfWCBpqNzUn4/hKB10D781hYVVDUvyuq5WqNLskYRfeTwPk
	IFoq313InwhRwkJdkq4kmFCN/foEWkKL3Iv0Kt1zbl/vQQTSaAFvfgig9udHJaLLfLi18cIE4VC
	3eqQdkoNWInVVxTQ==
X-Received: by 2002:a05:622a:5815:b0:50d:a92e:fead with SMTP id d75a77b69052e-50dd5bf0cf5mr174980031cf.3.1776162134126;
        Tue, 14 Apr 2026 03:22:14 -0700 (PDT)
X-Received: by 2002:a05:622a:5815:b0:50d:a92e:fead with SMTP id d75a77b69052e-50dd5bf0cf5mr174979831cf.3.1776162133703;
        Tue, 14 Apr 2026 03:22:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6717ae8cb15sm1311068a12.19.2026.04.14.03.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:22:12 -0700 (PDT)
Message-ID: <9a424637-2c53-4436-b2fa-a0a77b22bc5b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:22:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: hamoa: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-7-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-7-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5NiBTYWx0ZWRfXzNJ8TDqJVlF9
 79IxeMdHKI0msQ/Mcv1c4jLElcqzELkvYE0khVktRWHgD9+C2/RX/63a4bg/D3avET2fAAUyflQ
 4+Bt/3ON1nch+P0ATHt9CqjKroKCM+PPTLEgAkNLYC877TonkfywUY304IR/ZdvNta8CBQN40Ls
 X24VquxfihrE3WLoehEwwXAreGyGWZOIJXPUIVp7jchn2GN5+R9o5YADef/C6P6Rk7PlXnN/CCO
 GVpH1mNI5IwRCz9NNKf/OTqrOBi0TlF8CaFx0EQgeupQSP5vWWsz2hnU448CBTjHijK/L9T/fBZ
 l9Zea408k2TxVVjOtiVOPEkKXItJs7o4MH5c6BcnMRd34U1X09W4W6wiAXdWj7pAGNFq1xy9qhS
 8i+J48uSYwzSIRaXVd6whd6TzeWeJcg6cchgPP8/mG0esuXV2suiaPV6/kPM6BYQoLGK4sXgQhp
 IS1aLjXZR40HvX5Kaqw==
X-Proofpoint-ORIG-GUID: gGSstadW5UL6gNKDbPEWvBad7TWYTUam
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69de1556 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uGyuuOI-cJ-b_BVNecgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: gGSstadW5UL6gNKDbPEWvBad7TWYTUam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103111-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C1F43F8AB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the hamoa device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

