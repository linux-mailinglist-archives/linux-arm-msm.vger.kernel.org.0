Return-Path: <linux-arm-msm+bounces-116348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QYOvBZvQR2rEfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:09:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE542703BAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:09:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cHFppNlj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Fds26FrL;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116348-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116348-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDB0230062DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D813141227E;
	Fri,  3 Jul 2026 15:08:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F10375F7C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:08:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091283; cv=none; b=oUhx33NCwH4OI4vWNjabTHt1pRe/TW2uZEiHv3K3wfpwNiWcfj6KThx8/Ey2FWPiJaB9cTh2K3qJrgQhnYF9aoP8SMQy8La9Auoe2OftRkMqxVMLJgBV2djhmfJCfU6wlBK193ajqObfOrx9FQH5oty82EGjuWQ6A2Xck5XXT8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091283; c=relaxed/simple;
	bh=3jIYyqc5MjZAiTS5GJ3OPfhILBABRmsafm46SBq2bbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sy6xkWzEljSVcpjYAj77CHnFcR3lTO2UlMMQSn7BneiqOt4GUI+d1xL0Q2+AGVqdqIOVIZD6L4BWEYWill0KImC4CagFuujEU7lytDhiqWvmnCHD54Kev86Fe35GgoAJv+nRivnn9Lg7mkszlZuRIU2unl4gCGdiPeh1OLW2/2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHFppNlj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fds26FrL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663C9trr3144214
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 15:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z81ATdnMeKeyJMtRvUDBLN7sUl7qdcNy8daIoFUOp5k=; b=cHFppNljtBHFW8Eq
	zN0WtZmnAtnKJZa7oMRN2FiKKKhfL2w8Y9PJSTnZrbfix65ThOOAKHgeIs0UZ5ng
	SVaH2Ls1E9MqMzIFImfNK1GkMj5AQzsgGJugQ2IVbLaiuKSNo5Y3hjHx78TaHuU9
	uxQ+TgcF7/nAeUwaFT5LTixk3bLD1EC4/c0V5Os+svDtLnWs5DlAI0ZN4ctIzVl5
	+zdoweDafG8di5EZP0JIf6lt3LB2FwRCrXHlJVz2Pgg7iYUJBbyHzMKDQKonWdX7
	dpxHmLLsxMl+jAmmElecj+XZuteyffWp4IntTXEFohMgsHd6CW76rR/ubry2MaS9
	uvX1tQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bstdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 15:08:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so1995216d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091280; x=1783696080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z81ATdnMeKeyJMtRvUDBLN7sUl7qdcNy8daIoFUOp5k=;
        b=Fds26FrLCjT46iCGyCVtC8QPDvt4r/yCmdUcN/LLktVMv4mbughvITSxYLaZjegA4d
         ckKp8S8z56whiVleYTGHGntURIOY5dI9fg1eUybW2oRoWAjKbFAjtke6n0J0yzeKAqx1
         rHsyzAb3QcbKfsSTJv5vgL9q8dcnTtSt+KI00d+y5HDEgUOSQOkx3YY/e7ofiA87kd92
         g6lyHm12arlqg6VN1nE0I+vv6qRpluany8yQOWk0nIckrrBM49qT+0vPbehs2kQ063cc
         FNV5xCxJb7ExRuDA6HVHpz+C0XAY7JlqqkA90kipLtiRwHTWegVESQcH8IW2sROQ3xXq
         uPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091280; x=1783696080;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z81ATdnMeKeyJMtRvUDBLN7sUl7qdcNy8daIoFUOp5k=;
        b=DZF/RgDhzW6KBLBBqstrtRiHHKb5NBDD/49DNPcT/g3T1thStVhQd9+i7II9ntCKSi
         12P0CUMjsvgfKh7dRdzLTE928NfApiTtAosSsjGFwqsxmaA3FXbIGosomN1IF5MiSOoQ
         4ststAgr/2OESU5JhyNG65DTjVP9MhuUKDGHsj46fb2L5qqF5UCgVTdCQXuUQIwspqeY
         OXh/MVTw9yFgsyiBaulpIp7z3vDWC37x0a4RREi8H/gpDBpgAGsMfNOHP30OBr0NXVfZ
         jkNQrLqkdMJKE/Bvxcv5el9Gr4Ee5vcK3sYfSpx9HafsJxx+oJbvZTplCfA4FMr9TP02
         mbiQ==
X-Gm-Message-State: AOJu0YyBRnutLqwmshmh/f1kWzWkfKsif4WU1y8v5aMsIhULln6XTQqF
	waxc3NkVw2bbnKHOKpnccUCftS4nlW0jlYytYJCor0OSA74qFmUi9c/mz+WFyZz9J7qiJNd2nq9
	oJU6ugpEVDIOEd3/YU3GMsS8cJVFHgouQXKD1izKCDMNdxlTM7FNIaNRklhM66AO/sYp6
X-Gm-Gg: AfdE7cl3+zx2ehMd8brB/k0gZUqxCKtX/NuTSoLDKU37QNf/wgtr4jPCUNVwnjT018D
	FSsOTWyR0aAvdlBO/+uazftAoD344zgvzgBTSCMpnsrCVopbXzXwX1wlNzANhipNPutVcM4ooc5
	NQ9BakrPukXXFUH9ds+Gg0G1b4pP6JDDM6aOvqGeCmAmGcJZe789aiKVk/V3TTCtRUxkYbT+kPs
	kraqV0/UoTyMp/lAP7xlurerT7ylVxnuSO2E/pfUA/kR0nloY/gubtcZnZ9atzLoDSBA3PkE4TT
	tvUaP6DH/2TWULafOpKiHpadCMSUmDjabakjMpnpZuRIZ6OupTpYr7EcZAJHhh63g/Cv/prkaCV
	xf3LU7rgw8lc7PnOo18CLZKbE+jF8fmIG4is=
X-Received: by 2002:a05:6214:428e:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f3c8ff79abmr94566956d6.10.1783091279673;
        Fri, 03 Jul 2026 08:07:59 -0700 (PDT)
X-Received: by 2002:a05:6214:428e:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f3c8ff79abmr94566146d6.10.1783091278946;
        Fri, 03 Jul 2026 08:07:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad1353e3sm2436722a12.27.2026.07.03.08.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 08:07:58 -0700 (PDT)
Message-ID: <88cff3c0-ce85-4d0b-b6ea-b3b3b061adcc@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 17:07:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key
 connector
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
 <20260703-eliza_evk-v1-1-7624440bd76d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-eliza_evk-v1-1-7624440bd76d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfX6Eh6VBuE0JMT
 omFAH9rS5H1+5bipm8U8d79Fpb7U9W4WKkQagIqWo9ZdgqDsvmBJMCyfj8eFA681FhKhTW32Fyd
 +bU7uAnz8WF8XT8nwvfT6/quqJXPW0o53KmmoFMuJlwdMcJ/pAEwL26WTpgN7KjtcoSXLJxiQwf
 +H4SwhlF4gcDat8mDYPC02Vy2PvGtd0lbM9p15FWZwSxaj+dsK9p8Ulgz1g4e/pg0zPC06bIw9w
 e4f87tQqtZEs2spNO45ZiPfEShLIDqxm1l7oVgRV5ujs61L37vg42fGJVme0NjoWve8cJPZx6bH
 Jhx+g+EdZ0WetTPebRCbyj2K6S/fHa1LpUiyGPKiDy+T4tdLnl306Nf52bGNSkvh3zL4PYJyd6W
 SCuqh22I1tlVZKA28KXkIYTVpcuZlxocdoqwu+5pqmT5QW6Z7KpJyDS/vbP4ALBu5pZ/UJzK7Mg
 OSyUKIh1i+I6PmtnDiw==
X-Proofpoint-ORIG-GUID: cSpguh_AIY5-jl2Jfs0WsS1HymE_waVT
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47d051 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfXzDydYkY2lJbT
 84ejIkv4PZNYSvDxplIqosmf22LzadbAdJGpoZY8Oq5nJWUQS9eQsi7cZdHfctOHrEj880kfrSz
 4AjKx0xnr8Z0Bkjm40N5cdSBjz05mbw=
X-Proofpoint-GUID: cSpguh_AIY5-jl2Jfs0WsS1HymE_waVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116348-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE542703BAF

On 7/3/26 2:38 PM, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board features an M.2 E key connector connected to PCIe0.
> Enable the PCIe0 root port and its QMP PHY with the necessary RPMH
> regulator supplies. The M.2 slot's 3.3V supply rail is GPIO-controlled
> via a TCA9538 I/O expander on I2C4.
> 
> The M.2 E key slot hosts a WLAN card connected over PCIe and a Bluetooth
> device connected over UART. Model the connector using the
> pcie-m2-e-connector binding, wiring the PCIe root port and UART5 for
> the respective interfaces.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

