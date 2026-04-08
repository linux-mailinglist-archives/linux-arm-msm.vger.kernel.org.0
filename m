Return-Path: <linux-arm-msm+bounces-102278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCZZHngZ1mkxBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:01:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C313B98B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A95530191A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 08:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FCC38944B;
	Wed,  8 Apr 2026 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lklu30Ub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hawqrtZc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B7A38E124
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638774; cv=none; b=D5Jp/YyqobX8UkmCelDc7U/01lwhkLuDEz0QS6cSXae59nld6LXTD0VGlI01X/zUoCmtd8T5k6jMoZ1WFfSfLnaLZRvK3nM+BNnN5Xk3rR6v3RRn3b+5I/k/Idj6NIDVSIb3b2FYSmgRpPBYz87vfLqlTy4GvhYRZc377IqBGrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638774; c=relaxed/simple;
	bh=rFkZf2w1nBJ9soa4SB66gP4TV9/XUpL9rJLEEkiqYr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxvGRQh802V5o+5y9jTjBTyCCzeKURyFS6RY3trrKIgLz1o14EaqayOot9hk9lGwafxfJTTIoG+8gCcdqt1reiY5l5xqurzaZSfnmNQCEabrnbAxxsaI0RVoYqWySuZMBKi9jqybRZmvVdFysQjiAyHs4Wv3frLK+OsMw5s/OWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lklu30Ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hawqrtZc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387VReG1259200
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 08:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUyxIW/i4xT3N34Xx3dygSkRm2tUQ3zinozI33xIahQ=; b=lklu30Ubr2+bgqCN
	k+TLL6RWeQvi6XjctS61beAZ1IEPVmQ9T3JsG7u/6qKfLkKf3aietmLZ/3gyRage
	8lnBS+UCs8AtgMC2l1D4+WRY17YCAtkp7yBgPWjT4PXyWhaF1Uv8rp/vlVRVX2aS
	91Qv1bNnH85LNCTXlfaYWraR8hvFga9g2wTt6Oq4PvwMIsit68rcKimPoBRcKLVd
	Y93AxcqHQPHSY5Q94Hy9Hofkr1yw3TFsJsEvehhj7od2NUgVB+xbTI11sjCmzGHD
	AB/8MTyF6URgR6Ps8fpYbL9A2Uy5WpAWORkfvmI/wvkU95JAeerFL+dDks77TDkc
	KjHDig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttsr19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 08:59:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d076d88so14098031cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 01:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775638771; x=1776243571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUyxIW/i4xT3N34Xx3dygSkRm2tUQ3zinozI33xIahQ=;
        b=hawqrtZcDDHLxmwAEPug/TftEpPG+Oi4ac9rCk42QIGBnkh1M9gSu0fkNhH5VLhNn7
         ezSN8XFvIIgxIu4icks+gz4FkrkHG4YcTwHJGV6JNIYwiznGEV5Qtwg08km1e1V/JFtG
         T8eIrzdMGxYtfVBRfyG/yz2qfqeVc1sYByEROF1nsWN8pHb0LS17gCvFC8xr/bK0907t
         /MmRZRTANWxtoHz3Owm6uBl7/u2TZh8pqPUgA9euioSMdalosiNMAIPC1OWPXbs6U2VC
         K5TOuW576NJiBKs8+nyUV5cNVup/OI6UcbrznIXPrflmVmqiMShyq50pBjASmwVnRG9y
         uvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638771; x=1776243571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUyxIW/i4xT3N34Xx3dygSkRm2tUQ3zinozI33xIahQ=;
        b=phWhyXn4/ZIMa2F0BTBSvmZsarQU5Y+CajrQIEtha/mAAZ1FW1EBljQPyTG3dWPndS
         K/OPPOVlngXEEyGQTxg6YH4UL40InM9o4Nqg92JmJGAxS3IYKK17nBsY17ObnMb0eR/R
         QBwsedyrY+ENvlr7PUCe8K6AVFdmOwUEjDNgmJWUAjYdto7iIHT/4ZoJXIy9Uh10w95S
         VOJGSh/tKV3DdwhzM7YwhC/KH6iLjsAR/sla0gv6Lf07S/uzKayG9rNLdpnMRUXpChGj
         ShHPFBHUcQ4Hftsix08wsEDuJsOyMRvYsSQlEyPKmsonK9iMZo4zLwPaHGR2nct3YFjp
         Ujdw==
X-Gm-Message-State: AOJu0YzPT7G3swlSbNJ71TtjTidtlPfFbSLoeWPwbIU9C1DZ/U5OXCwf
	EfKuIsGRWTepVu4FRgjNd8pXne3Mi+tiXMIENWBksaAa+V3mBcu+e4P010Z1KU5kKaI88prYc1o
	kbn30Nrqa60pTyAn+koGgYqU/eIF4Ggzk3kkkkwJrb7in6tA9I3PATh7cvf7VdQWDqb7N
X-Gm-Gg: AeBDiese3lVJyYyHhN9aYmgJ6mzz9M21x4fZn9fN1Sj+O4SZWM7CSE8PyQUMkb4OFzW
	2RcKhdORc9cZhmqmJbSIpSovaFjYCwouC1+0RTirAk6F6tvC+D7531IYYYti1xtuUXyRYnCRuFY
	Xi+NLV3JaJEtky4/jvZI/MXiAW+dhUq/U18XGXl36lZf6kDewNiMLwHxFoSm0HAYStg9cKsrK5k
	ZOuwrcHiuv2ymFTToggA8EdnAKRuT5Sz+cv+RuGe+qi/JdM8q6XsrI0FCa4fXUjRXjv5NW+rME1
	IYbAZrOZB3Xik7f43t7ay+f2s2PvAy0Vk2NYZ2xLACJxRQPL1PZQuqRAQckkE7U3gKCmjitnon3
	RUtpInfinvfyxHt8zqa2+BNi/mXuhFuLFElY4M89EqGPi++9zrBuEovZ0d0LbEXwxKbMyovw9/7
	EbGXE=
X-Received: by 2002:a05:622a:260b:b0:50b:5286:f756 with SMTP id d75a77b69052e-50d62c83682mr219884241cf.6.1775638771438;
        Wed, 08 Apr 2026 01:59:31 -0700 (PDT)
X-Received: by 2002:a05:622a:260b:b0:50b:5286:f756 with SMTP id d75a77b69052e-50d62c83682mr219883931cf.6.1775638770970;
        Wed, 08 Apr 2026 01:59:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3ba180ffsm2935966b.35.2026.04.08.01.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:59:30 -0700 (PDT)
Message-ID: <bb21b9b3-7432-401a-a0d0-1b1970f27770@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:59:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 UFS controller
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-2-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-2-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5szbE6zCumQidbMeK5ZQ5qfl5cSs94tJ
X-Proofpoint-GUID: 5szbE6zCumQidbMeK5ZQ5qfl5cSs94tJ
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d618f4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=JxrhfIILcghro0na2cYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MCBTYWx0ZWRfXzZ3t0wJqIT5q
 /qXs+MpNCuSZRdJXFVe9zaabEOyN3BY/rCkZF5uAYkiFcDJ7+PiJXOfFNdVjahKMINVB2RABINK
 3RBA6eYhLzLfobl8KQXs5+moV8eQYLcI9onMoDaJHwbksmEGjYxYnDTDM4anqU3W3MVojpWs69f
 nDhzBQh2Gw+oh0p7NC/Akq+0s/EgAWKQiCer/alR7Y5K9QXhTKpwk9K0N+tWBMW/JJX67viIEae
 Amq94SOz001YDCGEeaATL93MLuF3APkbKij+1/cgqKRNo+SKyDaY7YUqPkjUJ/LqXILhsEaEwpo
 iRXneUucZAMzJyLVVjRw54YJBXdVzhG0aMQlgTMNzUJlYAEmNJeRyo1KnBXZB/A7WZYwAnuzG9A
 FxAaVJBL4XIy1DwFjNqjPLeBXzK4D0XMqhg4iaPELrhPiZZFoE9+CBtk/cHleFXqBgCXJuL/whi
 OMMmtoXpmx+amlIb9+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102278-lists,linux-arm-msm=lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[radxa.com,kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 15C313B98B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 5:19 PM, Xilin Wu wrote:
> Add and enable UFS related nodes for this board.
> 
> Note that UFS Gear-4 Rate-B is unstable due to board and UFS module design
> limitations. UFS on this board is stable when working at Gear-4 Rate-A.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index bb5a42b038f1..c961d3ec625f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -959,6 +959,29 @@ &uart5 {
>  	status = "okay";
>  };
>  
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l7b_2p96>;
> +	vcc-max-microamp = <800000>;
> +	vccq-supply = <&vreg_l9b_1p2>;
> +	vccq-max-microamp = <900000>;
> +	vccq2-supply = <&vreg_l9b_1p2>;
> +	vccq2-max-microamp = <1300000>;
> +
> +	/* Gear-4 Rate-B is unstable due to board */
> +	/* and UFS module design limitations */

/* it's a bit weird to add two single-line */
/* comments near one another for a single paragraph */

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

