Return-Path: <linux-arm-msm+bounces-104454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OYJHL1X62nkKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:45:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C71745DF1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C613D3036394
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252A83BED11;
	Fri, 24 Apr 2026 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMcXYtU2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QeqYvANB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E461F3BAD8F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030821; cv=none; b=XlJNWCSoxA4a+Nbpi4nJYwviHMYXC5oHwlcSe0b5PJZfWbBuE8p595ShIjAcCO4y5XzPKIZw2bGRuTGSipxf1OQVU8V6eL/KSqpXnxuynmJhU8DuP9lOQrt7KDsDaHvVR33YqMNTBEW96TFebyDpWVHUsa/yaqri+MaGUcStm6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030821; c=relaxed/simple;
	bh=zAGY6O2hizEENAg918dpM+0m5lOBf40PuOwM/h9En8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YMCjOnLOtB25B4yVUGPRUVgIRSuNl6LmGDN7Ht36lkzPUuZ3OgvOuTulcYZ7JhtDovwYKcEr32cAxdu6T9E9LW/pf+1eAXjpCEsIHeXXjn5lSBavk5IgQeb87D/LIClHveyL0ZMs1A2p5r3An9jMOMGSLA1USPOfJdaypAinL4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMcXYtU2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeqYvANB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OAfkk11959136
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=; b=kMcXYtU2JntMEEVO
	vzxBHYitkpG0WikSf8OZ/TXJl6KZ9jjhaRbOODsSjyJlXFlG48/rS7Fck1x647fv
	fwsblb0RLUjoQCY8RhGr0osUsuf/pLR99qOYB4djWLOcNP0nvtWjbrqy7CRL2deZ
	F+BD0eLyge+FHFd2zkaH9rWqbHTslKQCSjtBYxPumXsqXZfrgrgyqJPai1pQW/y1
	3OpzEDSGU4LAVNIih+bGsmC/L4zF46teE5m/SdYZYoOgwzTROGYXJf3Do9VDHLLh
	hw8vzazFn576CfZd7gbGM995J1swZI4kHpSc61GSMZn0jjHZYcEGpzfnJ/7yRiM8
	W4352w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr2nrhh7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:40:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b026c4497fso15810876d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 04:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030817; x=1777635617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=;
        b=QeqYvANBq0jm4eop6FBI9KAIOA3FeG8pfpFRMOHQSOUmOB3de0u8SxrKs510fA2gRB
         UUWp3I64KpgRsSnpN7mnwpamQSpd0qmK7bZz5efDVyO9BPHDCLGs1UkO+l5SAUWZnOFd
         ytZA+nFZHVTOJR4GrQ/L8FKLmSKlc2DXXSsY91aVe7SylXOMknSxCcB5BzOafH64IpXl
         Fg7ZVaqI6Z3eLtiuA8XX+a3JogIEvIpIQJCn8iOhMcyHudyRPlGNznXeJwIBi7RDTwVE
         jwMkpN3k/Zp6wR3oQkyO5fGbcr4G5G32gU9TWQylwba5CRDaSJX1k+xOYLYy6Spqpgyg
         6p9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030817; x=1777635617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=;
        b=flb3eF0SzdmhWDS+l9LQcqfFAXCOQqSpjq7EzJf37b+it+OVrP2KAG8Jih2TkKwUJ1
         MS5X/KF5MU1K5jWmGwWWImiEk2XH4GrMasnBpaE9pteg7ocOhxQiTDlbsn9ZPiQCouYo
         PmWWs3WBrMKhKTvDeIBW+Rhuw6Rpkg6UEDGhg8T3Y/ZxB6x4SIbR3iYLqofACGhw9DX+
         RbsiwKZB1qxzal9zjooYvl1GHE6AkRnEIsunw588zz8tcItJtNLC/69BEUWV9vd4++S9
         MMKMTEB5Gdu3BTzlCV/iR4sg+5FYlLCcmOVNHK/28WCFgKKLbHDUDoH4AtYqDU5QvwN+
         ueSg==
X-Forwarded-Encrypted: i=1; AFNElJ+Im9hNXC2ajMhf3MfiSJzXioEiT7MsBS4TPt0Bx+a7pqSVp+OU5op/UBeHQ6mSePuag4r6Xt8VbZ7ZB342@vger.kernel.org
X-Gm-Message-State: AOJu0YzFgCeVwds+Y+swsrUs0Q/kywdXCdnUm6o/X1ySKBIxJ6LWggeh
	a/4Vn8yy6yR0hohSmR4+1op3zdmsoxFfT5WloEs4mgqKQX0H/jK52McQgXTH5DvRa4kp/2d73Hw
	V2V4Oun8isdrbp5mUC9duwrCnvvD0wfFVaVTM6FKG05SpEge7bz/G78RKXbePzT8IT/tD
X-Gm-Gg: AeBDietCvoHWxuTzKZzmCGFmVAu7PnU0rhEYH7nB/wOtlXBeumBDkp250GpyHVDfGkp
	r+kzXD92U8/U23NgA8/NDUFo1+S4eBjDoWI/4qzp2hXxAkIvu2Xe4KMSYL/77icG9LCh6ewwqOS
	4IiKOo40rEIDqIup/sS1bwT4xh7DED2h9eUbNOxIkCubNBLOlJnGX1nBHOQyhQr7hc/mrDQvLy0
	wdvlQTYUetFO4iWQ3oXnfs7PTso4FKXTZgFRIKljxrv3ExQKnWzR9j4cpYooldMV70yKnCVSfUS
	JFH57Czc5ho2T8DADbeS+juUnAtd1ZPP4QNijDxQJZ+ViuHGN/1LvXNDLMU602vBh1nyitJR+47
	Fp9kxDGNIFceGl8cR2ISGB/113YVC5cqkI66pKBV3hhjm6nBnfKTUA4XgrD3c7Ls9x2mbwA4QH2
	znfgHgKKP94MOncw==
X-Received: by 2002:a05:6214:411a:b0:8ac:a91c:c9c with SMTP id 6a1803df08f44-8b0281fe001mr342499486d6.7.1777030817385;
        Fri, 24 Apr 2026 04:40:17 -0700 (PDT)
X-Received: by 2002:a05:6214:411a:b0:8ac:a91c:c9c with SMTP id 6a1803df08f44-8b0281fe001mr342498976d6.7.1777030816944;
        Fri, 24 Apr 2026 04:40:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7dfesm5896580e87.71.2026.04.24.04.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:40:16 -0700 (PDT)
Message-ID: <b0690213-da71-4b8c-bab8-8581fc3d0211@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:40:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] clk: qcom: gpucc: Add GPU Clock Controller driver
 for Eliza
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-5-bc0c6dd77bc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-5-bc0c6dd77bc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMSBTYWx0ZWRfX21Yee8LhWF1R
 iw2FWCEhcb8gRbL26aIkWRpHbjoKH21tTvkdFakL/eUNq6X+UYNGvfIRRHBYPt82SINbE83VIZN
 pzyd2aoWtpyxjuwsg79qofXODy/2zdZvPVhTNBefr+BgPEn/HTqMiBzyP49C3XQ6ryRGvPmXN2D
 fbQHLb24TyBe/XgptW5QDdYEbZk+6W2R7aLitLqR60nKqUb2dIUEAEi55HuVvtPpZRrq4iiJ/55
 IsWIfwUyXt4oxGPYnEk8AmXjUivamtlTnUf133yuUsfJABwwqXpKa15FL4FJJM058FttPdcBdoy
 CNfRELn5vseQeJmT8nihtFN20/7L7uWKkmV470rhB2DzCCxuzL2+uJRvtTyZqcFuk8S/nHv3T2j
 jVQV4eTQg00V39JEozzlvLjkYhU070pbmlAt2XiaSIilCQ5BXIqYqIBOewJk7ZGV951mDYFGwSl
 bJ6uv3hv958E3cQJpow==
X-Authority-Analysis: v=2.4 cv=UqpT8ewB c=1 sm=1 tr=0 ts=69eb56a2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=whjPl3NbLinN2m9j5McA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: xKCNIH_-uV5MJ5qLMcCgUSlsV3v-a-gs
X-Proofpoint-GUID: xKCNIH_-uV5MJ5qLMcCgUSlsV3v-a-gs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240111
X-Rspamd-Queue-Id: 1C71745DF1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104454-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/9/26 8:10 PM, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

