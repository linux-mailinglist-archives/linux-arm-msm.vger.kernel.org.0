Return-Path: <linux-arm-msm+bounces-99846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIBGDAHIw2lKuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:33:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD3323F2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB62030A889E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB583CBE91;
	Wed, 25 Mar 2026 11:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdpbJLQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzXHP4SX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177BB3C6A49
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437688; cv=none; b=CQvtKoB8kBUebFvLOpaDLkv0FGfrZkHKAIWSlvHgS4LhwneuQ4HUkMo3xXFtwQKP2USsnwQ8mq5h5sR3AbFtoekJqejr5gGL57AZwRRhTFg1NizWZmnDT5oHwGYpoZtkkhybEG1zWo3tuD1ln0xeeqUmEIKHPt5IMIA2eHbUdJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437688; c=relaxed/simple;
	bh=c+t+m1Sc5lK0mt9HPEBgVe2zxed20vbySZT7RvQJspY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Um3Usn9e5UNgQbpSeSB739vV7gf1PQkKMRIAnAcO81+FMst6q2A0VIjgDV2AWeAZtzeMu5csMBwLkYrXO0dVphfnhf/lm6gLZEa8ke9a1NeDzYeGcx35dsf4+T4ZP0pBtlyyfgm4Y2ydjFOtwpMcVNwnDHGw1nNNHq4d+PiN2bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdpbJLQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzXHP4SX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGJth3091228
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTdLSXt1gffIHU1hMmW9BTasufvL9YE1TkFyszLzfa4=; b=BdpbJLQT20mtGYWs
	bKOF4GG8EultDAccXuhIU5O6AVzNCXyYI6SdU8Dy/y//J66+sP7wZ09mMzahKgPI
	m8Lh3Im46u4klRzIudeTElN1LFUBN9VZe5k1Ogk1L3308YNkjnGPYi9CrB06CflI
	5KnGr7KuxEDhGL/ae+CkpQ1zE7yOUhcvS+/em60ua2zOnjnWtlq3Bguj1CxSBcJX
	oLEktw+uN4SgSRyAOoIkk4Zu9xD8i5gmbmgkaO4YDYqNcA04udR30Qcn2v58SMos
	PRfE5pEzL7cA3BqunC6vjfzvDNRD9GZpWGI2AS1WevscIgNyI2nSD9XGOjfLh/WS
	ZxWh8Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmpr9n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:21:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cbcb48003so8065986d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774437685; x=1775042485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aTdLSXt1gffIHU1hMmW9BTasufvL9YE1TkFyszLzfa4=;
        b=dzXHP4SXpFw1Kll7+8E1VAIIHIHS6I61LtmtRT1w3n1vfXdXw4MrK3HdOGqPmlN00r
         VPn9Q5bGFnaOgSScnEmbrcsPhjXnNeFL59JfyJgo8QDRl1KlWiytlAVJ2gr7XU+Un+KA
         sjCOisnTND/ymUHe5B0ucFakkWYJZ7WVb3JkO7RkpFBI+26JNxqZX6SPpejZE6ZrVtv8
         YjaVGYSbfk7dj5cHRsf9kfzkw1tTdOgSUf+wHhVJ4/NftaH+/GV+HM0ZhxAYH2pKjghZ
         hlM8g9z+eULf0Iy4dYQA00TzPHKcDDSARUh+VowRTJTy8a/OQqpR5ECvkWA9DnWZuaz6
         YDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437685; x=1775042485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTdLSXt1gffIHU1hMmW9BTasufvL9YE1TkFyszLzfa4=;
        b=fWvcTbYbnED+Nskn0xrra/GJDPO1o70FTOV9g9n3OEOzieZfDHKoGdzBtMJDeHb3/E
         nZgufjc4+HwWYlUdUnY+LtVXt1kx/pWr8Xv/vvF7/7gVwpaaRSWLyUwZcLEVKEQkHLZJ
         vgoU5TBUEQtqnYSZVSwResMqQyGTv9bYSz9GL2zTeLB76RelRK717VKIuKkrmVORiRCO
         IcchB9Q0YVd/IEwpgj9lzcv+750mnG2JvfCf+XsIJsHhu/g2Y6f47aEFUS/dKoZ1VFJt
         CVbvcnhN5Qr7pTYv8GDEuq6obd8qRFmDSN6pZTg6yKlMHcHOiUg4giBQNrukFP3egzSv
         s9Jw==
X-Gm-Message-State: AOJu0YyJYocPjY6iergwlNs5uBIJtwOj3oAuXEegcL26npkkUDXAQ7Rd
	/EBrOuxvnmO6z08P6RlQvb921kZjc9DKYuXYE/LfrqItokZfIFKTki09Spw6JVYcJ0ND8KmCmDR
	q/KoKHv14GP+jZNcuIvkOLb2uKCjWXxD2YetfCATRxuYXffRewHJjiTr2PaIl8eFu9MkF
X-Gm-Gg: ATEYQzwUSQghB+BM+CywxLWAoGJ0T7oGKYHPe85sEDSgpVfllNaFDWOJaujes4cllci
	H/j5Hqpi/ip/T4JXNn9wLTE1g9AgSIyIbOgEoiq1gzIxcdVMYUy/nEWrmoZnka8dmMww6jodbZv
	g9RWKKw6q6AzOcaN7OaOWsVLIzFvODC8r2f9YbOcQ3uTM/c923rTbDeovG8zlOfjmVaZlXoyuHT
	CfrtVi7BRVVHwcZ74B8yhpsl6nGbSfJgJ8d3HPMgVnTxQs6dril+66o1QuXHJXj13VN2EgsXCw0
	5nIPMteeTbWjnPYU9A2SqQhzpHkemoYy+tN+f8PeuvuELK7lBaIN+ghWqXECilLni/D91Y1fH3o
	/QhjGSUqmpZrQtHEhkfsx8I0cmYVfJjEwO1fjPmAH/RcWBl/ssjd+vJhrkuQCrzUipB85NiEgut
	VhVw0=
X-Received: by 2002:a05:622a:4898:b0:50b:2bc1:2c5c with SMTP id d75a77b69052e-50b80cb7bf5mr31274101cf.2.1774437685331;
        Wed, 25 Mar 2026 04:21:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4898:b0:50b:2bc1:2c5c with SMTP id d75a77b69052e-50b80cb7bf5mr31273691cf.2.1774437684776;
        Wed, 25 Mar 2026 04:21:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b996169cbccsm169471166b.60.2026.03.25.04.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:21:23 -0700 (PDT)
Message-ID: <4a681725-c8fc-445e-9772-6b67ab948172@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:21:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 4/5] arm64: dts: glymur: Add LPASS macro codecs and
 pinctrl
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
 <20260325035338.1393287-5-sibi.sankar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325035338.1393287-5-sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MCBTYWx0ZWRfXwMhkX4akJakw
 lGn7Ukap6ww23k2Kwz9TbPvvwZSiBEDbqX7rDD4lwfvyAdPVP6TEqSREVwyDL1TdJkWP53KLCsq
 dr+MKkA6a6RaG0MnavfbD9UE7dMK/a2xcySK+smIgIykClK1uK3HgHcCjvNR1V4bqJi8NRRsF7k
 VrExPPYGIYhc0uJmdh61zbuaDNzDVK/u4T4662ujm60g2kwJWxD9RLXzoEniFiteDz534VLr3tx
 CVgP0gpkFo3dBOB82djgcGjfVctsGXnaZc+apVhRe1XoWydNchtkow0FtIeD77bRjT3FUV2NCcB
 b2wG2hhsNg0lsP7BWuD27xJM+WCK0KiiexDyH1Jc2Y0IOdxdqIenDZbqDZINeEHzoze3RST+pV3
 T2U/GfdnyM4blqwa+cENKigctn98lobkkJsr+fa/5OU3wBSnBCOiHAGwfTgU+e8dP0MHvBnXMqh
 W05NhjIR+VmBApnsSYg==
X-Proofpoint-GUID: q5cKoxcx7ZFCI-Eb0J6hLLSv2lwzJRgZ
X-Proofpoint-ORIG-GUID: q5cKoxcx7ZFCI-Eb0J6hLLSv2lwzJRgZ
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3c536 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6EmWahZ5WOOBv7564f0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99846-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9DAD3323F2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 4:53 AM, Sibi Sankar wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm glymur.
> for proper sound support.
> 
> Also add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.
> 
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

