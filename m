Return-Path: <linux-arm-msm+bounces-113675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tO8/E7jTMmrD5wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 19:04:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B24F669B914
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 19:04:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="G6fR/Mdh";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=it9X8ows;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113675-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113675-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D8FB3009993
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D616F4BC02E;
	Wed, 17 Jun 2026 17:04:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9CD4A2E27
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:04:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781715891; cv=none; b=kXU9HEgfUvQq6hNck8tQeuMbAN9Ov3Tuw7kg1SfmYYTy5g/e/ivSRSHUTB69pDj9/KwtvnMcjxzB+olb+fl1L4kGehybLa+mLYaT24HsoCbrYIWIY7HuQkTPCP9couIVAA7vrfqXq5nyxR37xt7uzMhFytjmpqVCLK9A+B0pReQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781715891; c=relaxed/simple;
	bh=6ZRmXpEHJbpqKN93OaRNsHjfn+lhlrd9jdCdeeQKlQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkLgokl+Cq2sWCWtjHHWaPzFGq8rAirTG2OJyOz04MhOGdaOIL3zu98hpMzAd3raFCDO7OeZ+TNAgBkqDXQSGaxOwNVcOLnlylKCV33ZkTpqQpuImHJRUIIry2kGNTW/sCSuOcfkvVATEY94xwtOfFBBhR1GOoIDoM5MvYUVtag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6fR/Mdh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=it9X8ows; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFoakp083456
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/zsHYT/VLV15pDa/l0a4Pcd2IDfua2uu8jZoLR/3PY=; b=G6fR/MdhCJGdaDmj
	+t5ajrUXwnbJ0Mksf1Cew0PgkbVR18xO9TY9siqMZbKIkP/WWa7QKLMmPBQaR3Yx
	ExX9sAj7mODOTTmD6wgZzEuG0M7uAu0mfHUkARFFo+7cybncOfrqVw8OBNgKBGTa
	tfNWR0tXXEHkAqnspuykg9qDua+0PPrBDN9xjKHBWN64+CkkjcxWPi8S+S+9HXV1
	+QuuSrjHnsidvFTseFC3fAtriZzW3OYC4ohIjb9A1fbPh7g46/+iTmK7QMkOXv1h
	NpjzrR15d+RR+moBhFykgOU99ZxxAymk8zn3H74CIeJ4TvNAdfw+1PmdNnNeaJct
	Z7XzuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vgy74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:04:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915737aaf0bso1043885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781715887; x=1782320687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/zsHYT/VLV15pDa/l0a4Pcd2IDfua2uu8jZoLR/3PY=;
        b=it9X8owsfab84sSf4vNCbtU6PxdfIADPMxacyDynpxcng07Mvum6qYrh1dvS0fzuBe
         VdXCGwO7OOUWslFbszOLUlHuSMCebuWiy+hB8IFpK7GY8wWfe5EOpg64LGkxRpstXdVB
         vYW8Bma2MBxErPn9/c9lwqHKe3nSxjhURySalXPrCVNfY/on4u63kKf2OKtIIymvyKrK
         v0pfRuW3RrX7uQUJkyJKdZeS1yGNjH9+SUhpTFHNfvV+fqfuNaTEC4osBylQv/KVVtft
         A+Gtol+mTkvET8VBrQGOeGmF9eRgGXk79catFlbbUWfH0Q61LpoV++wLIDj/ge1qtBCg
         05uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781715887; x=1782320687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/zsHYT/VLV15pDa/l0a4Pcd2IDfua2uu8jZoLR/3PY=;
        b=hzG9OWeP34BompuReAQaVRaYOmVuEB6hD6qqv3WOakGKW+5qKM/v7nUN96RMLYvKzJ
         GdCD4vr6J1FhHulUumjC8JRtQBDAwPEV/xQ/ftu8cWOSQZCiMfy/zTMDWvaKxTgzwU/U
         ULS+YPP1dDF3MGRgoZyZf5jfUZ3deNHpfyUPRScVLuEFf7IAUw0Zp5QiZN1Gpqq31VIh
         mXm0mwekq/V/NpCcyppJMiA94nY57TzNtl9QSrWvXM9SG3n1N64K0mrxQd+m2ao0bBa3
         18z0+6Zj/ulJWVs7ofLq654WVmkehLbbYF7cMMB1xqpc6VWhR9Lfpkncmcq8BqSTVcuw
         KM4w==
X-Gm-Message-State: AOJu0YzD0UhXCX/sdZS1xMTq1UCQu49ANTf3DHJcbSW75cwWxxSy5xpr
	MitHDHvm3TKvdDdSDXfijZB1cvYNRORHqqjq6WZ1/xJTYC+7zJEMMYZe/DJoXQBJvYWrLTg+C2P
	rkBnJ5QCv8fdYVR2ZdcXf2lpj2rFwf72niFB9VBhCP/PdbuTt4TuPD3Iar4GX40A2P26v0kj/KN
	xw
X-Gm-Gg: Acq92OH7bB8iSS9xz0tdOquCqvMg0B+S1nU/SX78UkvXIbnl9I2tB7o79T1+iUVvNH2
	KuIdMa1UXjcmiY0GamHwLa0lyAMekq8YUftiWxy63aROvEC7OKk1tI01PSHy1JCowkNULTS36EP
	mKHCb2CUsOhfJqw1YLW08D3ZbGWIn5ktoeTaU2GkYuac3w29lO29rzedus2GedwHjqoPfREFzuB
	oydl8yWn+3BMtH/HPvQoJqXztngBHqcB033XyGb4tcckUK0JSoFcNvDdZkVcrHb4FxVDjkMYdHP
	O8iGlgu9XlLrasG4ddcHE7ips5IQQaNo0P84DIAGODKHpzVFDiAbjomZ72Ee5T1S02oc7KYg3gV
	dgDgg/TTOb/StNP6uGbnojt+8LaStRUwxZtg=
X-Received: by 2002:a05:620a:7117:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-91dbb842a92mr373352685a.4.1781715887014;
        Wed, 17 Jun 2026 10:04:47 -0700 (PDT)
X-Received: by 2002:a05:620a:7117:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-91dbb842a92mr373347485a.4.1781715886373;
        Wed, 17 Jun 2026 10:04:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8341840sm840779566b.43.2026.06.17.10.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 10:04:45 -0700 (PDT)
Message-ID: <a1e0d80d-736d-4fd9-a765-26f86e0961ea@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 19:04:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: arm: qcom: Document Hawi SoC and its
 reference boards
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gZs6Fq5aaEh9Vf__I4yb482UMke6QwmL
X-Proofpoint-GUID: gZs6Fq5aaEh9Vf__I4yb482UMke6QwmL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE2NCBTYWx0ZWRfXw7TvZsW1CZvJ
 c8BG5SgUuck4mKunpT0J4BM+27iRMqbL8nrl4P3azB74OyWFdg82PrHtYTSrxRiDc9vogBb1jTJ
 bE5VcJTsAMJ32tXhWA90SL3bkBXs8xiAYbVv+0CNNVlda4T4HHEJSfmK+NxPu0fn3xRykjCk4nE
 G2kOEMPmYNuI5odDmwJUR1fSsfNYLx5lsTXqMftnpSvrTgPrzaItCKDIownylLk2t7CmqlAAe1m
 RXOws0dilXHMhRLoNHWztaoaImnE6zUpX8sXINIuMKsHbjNqUEE4Od4JsRUPh0TSrjG21w4Br49
 /iTnqBjQH6OdrBSr85bT/0AjYSU6Y1NvdZKqmoeZKJ4AlcBOIk77VuAbfybgvyHnXtD0P0gGq0A
 hia/XrxG3o0RTIwLDUXhCx0ID77oP8UmN5vgavRraA/zztNoakMPtbCIW6mR3Vy5OCI7a+hQbPO
 HRszfskJDbonEz5Iflg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE2NCBTYWx0ZWRfX+6Rj1fVqYwN+
 s8Vc8Q3RDsUgVih3r8VuRu1Z5Np1KvYVGYe4QCuj7jKg3utpynzJryWNOVmEE2xTA1GqK+PFEon
 fFqMsb84naXkFmuuRjRW+6NLCyMRKcQ=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a32d3b0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T-fziwSqmcXJobsc9NIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170164
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113675-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B24F669B914

On 6/17/26 5:16 PM, Mukesh Ojha wrote:
> Add Hawi SoC and its reference boards to the Qualcomm binding.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2: https://lore.kernel.org/lkml/20260617080147.1657632-1-mukesh.ojha@oss.qualcomm.com/
>  -  Fixed the position of the Documentation.
>  -  Corrected the commit text.
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 50cc18a6ec5e..e229c0097e6f 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -303,6 +303,11 @@ properties:
>                - xiaomi,sagit
>            - const: qcom,msm8998
>  
> +      - items:
> +          - enum:
> +              - qcom,hawi-mtp
> +          - const: qcom,hawi

Someone did us a dirty and put all the router socs out of alphabetical order
(ipq after msm)

I'll fix that up later to not bother you more

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

