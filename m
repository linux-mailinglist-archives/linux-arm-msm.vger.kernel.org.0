Return-Path: <linux-arm-msm+bounces-93405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G44MY0Zl2nKugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:09:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E56BC15F586
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5FC3302EA9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA5133A9F3;
	Thu, 19 Feb 2026 14:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hp1O/gBI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0kaAsXr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9684A253359
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771510094; cv=none; b=nLwpkbrZs8cWB4UMnea2NU+eTlQEy2DJ+eb8QRXuAAa2apqy4fJ1WqPmnP7BUSdf3J8TTcg8pMqcPKn9YhIzCTqcBCNdFwnZcdPtiAu9xSbtAkrcPTifh7nTpEFWZE+vmjdPHcJtOdA2bxPY1ZZkMe2Ge/E46QseW3SvI30BP/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771510094; c=relaxed/simple;
	bh=Q391Dm4SW945TKo3rFI4n5bLT4WA25tx2gWp/2vMkJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9/X0c2KCj4RVxiy6PaTZMviLxrg0DkiwsmJdU3gE+ZhEWN3AFhKOV9WQEAXXWVce+xF6Ln+uIpQ95OEVs1QjKRBHTEedH9e+eoChNBjaEu/s3sSB3VEcV3h4Tfgicm+/D37OBqszmUrCS3HjzbLjgokABXdMIyCxPNVE8ARpok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hp1O/gBI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0kaAsXr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J56ki33319689
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	39Mg5NcA8IAPxnmut8jqgaZH4uUJsXDv7uokjlJK1Ko=; b=Hp1O/gBI9NQ8NEUi
	PgY/+v/c9Z5+yqQHtXo1CNZwnm7EffZJbmbIlfTKGdXay1MBSSm17bvft8DyC8oA
	tMFwq3oYCavQTA1kzlOm5q1ZybYttlpWxvQkyksbLHG2EkAb7GqN8GmQ1I8G6+lv
	v+14TQMMhLB7m81DoA/Y5O6NHIlN2swV+CbSCf5tF6HhodD89RePl4WARvTFVjN4
	yR+02SJKHnkeOf7a/M8df5bGsTL1ZPh2leBUsdH5BxID5QLcwPuoBUCDmkBszadp
	zF/1YcxSNp4LUyUww93CS3um92WVupJgvC8un+j5UBnqrA7XZNEnfwEAwZXXhIWv
	hTnP7w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdv389ckf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:08:12 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5fc58a4122eso107650137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771510092; x=1772114892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39Mg5NcA8IAPxnmut8jqgaZH4uUJsXDv7uokjlJK1Ko=;
        b=b0kaAsXr+LqR4VXLRJ37q03njV8Kis9U3QfwHDe26iIBQculV7o3MLFe02Enwlv4rQ
         EnbA3NrxWWbdb5No4okqcImry1lsn9s4os2V94srdFgh4GkkWt6l3H/LNIW4wDaOgqgv
         /eapP8fmv00bO4V1owvMa/QcVrNmWgXvi0Ozn8VIH4SPB/p05hKCU4ZXwrDbwZfJDlwo
         +8FpGXSS0ggvnuphyUydQXAyzZxyCY9zCN7fkneOsy4jy18RCy83roFOti3OPOD5p4j4
         O274beBz92e5v0dlD18v0q8cIxcNUT8RtFBRVtEYTIs+GGPVwpeeaQWHwLuXnl72+XpE
         tgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771510092; x=1772114892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39Mg5NcA8IAPxnmut8jqgaZH4uUJsXDv7uokjlJK1Ko=;
        b=AwzrYXYctruxAhzrfkvDRqs/1eI+b+m3nfv+qD69bUGFC4+8eX+o6ZzLhTJiu6Trt+
         MLFIsyRn23Uu8kXTUvTEMiOISj+SXFHB1Q5wcJHcV5I/rEtIGpUQ/lFqqbR+iKbaomHj
         Lqcv1YOiFVZ7+LOL06KYDDFw5QPO2VcE2PtFKntGt3MkxocuSrmC60DvSQYet1hzUwQq
         pdO4lCe5lbTx8cR0oHS2hWU/asrNVlB2o83zoVHGQmEABcwuZM0mZBhOKywIW9Y71kG7
         ClOAJQfxrH9cmueHHgcxm7BKvlTKETtHXF2nYn6eeYMMrvXSRJHyPg0kx1gtSDE8tbBl
         t/Cg==
X-Gm-Message-State: AOJu0YxfSk5ziU1B1r3u4YcUd577xrop/0rf57oPIOrfQ1B+YkiM2PQb
	JAT9V9Yt7pyJhcL6bNhEMlpVIWwE52rWZTrcwcLf8eh+1fNMxBiqCxJ4IqRm4moGPvQqO6XyGiF
	bjT8JPJsm4JH1xgiEGjNY4nTCfRtSObo4QqCsBcMcjY/StHS7aJJGcoCbhD8NfMjx2czFF5l/5P
	ex
X-Gm-Gg: AZuq6aLg7cHg6au3RS3z3iJtmJrx/RyEuaqzzHzrDZnVcM3aIcNmjRIYDNvwM6r3ujZ
	zuM9RVxHbTpbTV3ezh8r8q2gb5hDb6z13JeQ84EXpJ9AdDLTlHN8aeAnStz6hL0kBok/NGqvv/H
	2opxpwKIJ3gJ9FwoqLaZ2Y+9A1cBFPlgc4/3I9et5iiEg6XWu4QTYomfagu6s0ilymhmVv7a9mj
	TQ+ee+vwNAa67NXQmegwBk1sdClQfAqYwjlpm7i0fnTxtxXqxFAZxuSND4N91wlcih2Ioh/NyX4
	XubFsg/u3V8qfZC7h5xUXXkBevcAmLAbcUlv5snXfbLmLKOuntiOFlRVDvjvW6UNiN7aOLsBEvC
	XpH++L2ZAhHqAlrOqtjAF0p/FHc2VQOl5eNTiGmNpsE4TdN+d5yfW449DSFwV00PO9xb6/apQNe
	5NMr0=
X-Received: by 2002:a05:6102:6c8:b0:5db:cc92:26f3 with SMTP id ada2fe7eead31-5fe16eae167mr4009009137.3.1771510091663;
        Thu, 19 Feb 2026 06:08:11 -0800 (PST)
X-Received: by 2002:a05:6102:6c8:b0:5db:cc92:26f3 with SMTP id ada2fe7eead31-5fe16eae167mr4008978137.3.1771510091020;
        Thu, 19 Feb 2026 06:08:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766554bsm575839566b.46.2026.02.19.06.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 06:08:10 -0800 (PST)
Message-ID: <71026dff-f358-411a-b98d-aa9a8b24360a@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 15:08:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Enable lvds panel-DV215FHM-R01 for
 lemans-evk Mezzanine
To: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com
References: <20260219-enable-lvds-lemans-mezzanine-v1-1-9cb2075f7c18@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260219-enable-lvds-lemans-mezzanine-v1-1-9cb2075f7c18@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ceffb3DM c=1 sm=1 tr=0 ts=6997194c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VLlN84S9TD7RBDtoDY4A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: uYzVkuPMNUbHSu8QMu1rFaiHnzqZAfjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEyOSBTYWx0ZWRfX5M65xGnaJLRM
 pdHrQPt9GMW4K4SayoWA70rEhV5+hMQDH9mU6OqXfqGy9fV2VCK7yW/teupazL/hJDfd5p5TO6T
 d+Zyt6bicigDPdfujBEVGI/qkX6peHSl2fSHLvT35TazNk8Q61M0uT9KRj8FQxDIgoms2YfGK5Y
 my8cRiu/z8f/IKYOk692NQiMm6/S534D1howRf3VW1yVaoB2LCNqJxMCNa6vUJsGbDJRD86Kw2a
 9Y4mv+TdHqwaSP+Q1pCEv+0xKsS3CM2vzaopvJlgEmNK2kud+DgKsCda4x1qnLr+ZD3cs7QBN6G
 22OnokY0UvGpIBYzyUafINBpcJm1qqs9BFeAdWbXbUes2T50c5HX74WP0CnQUz2xOTguqFQ02GF
 qg0txyOW26oCbPzJkpx8f1lZ7WXF3XqMVUZX5JYoGdlQgBpt3sSvSGjbcRnZbtc3tFRIO8hcsxS
 rsNGmXZxCZq4HSZE1aQ==
X-Proofpoint-ORIG-GUID: uYzVkuPMNUbHSu8QMu1rFaiHnzqZAfjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190129
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93405-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E56BC15F586
X-Rspamd-Action: no action

On 2/19/26 3:05 PM, Gopi Botlagunta wrote:
> LT9211c bridge and lvds panel node.
> LT9211c is powered by default with reset gpio connected to 37.
> 
> Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> ---

[...]

> +	panel_lvds: panel-lvds@0 {
> +		compatible = "panel-lvds";
> +
> +		data-mapping = "vesa-24";
> +
> +		width-mm = <476>;
> +		height-mm = <268>;
> +
> +		status = "okay";

The status is "okay" by default for new nodes, drop this line

[...]

> +			port@0 {
> +				reg = <0>;
> +
> +				dual-lvds-odd-pixels;
> +				panel_in_lvds_odd: endpoint {

Let's keep a \n between the property and the following subnode

[...]

> +&i2c1 {
> +	qcom,load-firmware;
> +	qcom,xfer-mode = <1>;

These properties aren't documented and as such this will fail validation
(make dtbs_check)

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&qup_i2c1_default>;

Please do:

property-n
property-names

in this order

Konrad

