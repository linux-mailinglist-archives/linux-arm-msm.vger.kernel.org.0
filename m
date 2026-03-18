Return-Path: <linux-arm-msm+bounces-98539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN8NMuvlummdcwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 18:50:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3B22C0A74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 18:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E605B32EC453
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 17:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672D316FF37;
	Wed, 18 Mar 2026 17:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCLlQRwx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlGZA8vw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0773148DC
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853777; cv=none; b=aLkbjUrcmg6yA4sx6l3pu9YqNNi3RZrFLb8lvf+IQJCv7Oo5V0z4LPTlW5sRl1SSlDnqCAj4v4ocQ8ssWeb0qTDlrEsTX21zow8X3u+0CMzSkzWSnAsw9fOpYkd1lx6xb2lsSyOjapqpIzmwqYq2n9d6mnpGiMCFQIVt3y+SryA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853777; c=relaxed/simple;
	bh=NH9+OVtPdDHqeC7pTIE8pHeL4cphd9YvgiXAgWcJH9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKOZL5YXL9azvYQAkGlixjUCfo+YlhGx+Td7hAWGNnYHz3QhYSgy9BYkIXgluX70dNrco/efOwWqy7Kl+IWkXSPcUDWmPkCzUtIpfJcpT/2WCfj/CCeab/zI3e8OKWpM98VXdORxIl5SYS5fKf1O1cxzFMtxF0iIVeGQi9Zw24o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UCLlQRwx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlGZA8vw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFgaGP1928645
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KWy6AvBvJuSLSKIvUfXuWYTFb2xoDYuunAiAip6CnCI=; b=UCLlQRwx62Gtdcyb
	ef2BYcyCI2drwNJtS0Il8DPuhISa0lef9Im2M6XGJ9dj1Tsd87TBoi0uNzszE+rT
	HVYimFrYPRXYM8AUDfpUyKwqljflitDuWMBT7i+7FDoF5xEZvVLmiDhlHHpa20l/
	Yv5IWiE9KLKSvUzo8O5snY6IRaaSlPRdo+utQqbK+v5nE4zyFnQyuimqtEIXRrbt
	lxNdcJ0w6e/PTJm63495s3A7pR+ehYCF5QM7Rty+z41KwXViT1qQTYFFdG9apV7i
	/SSr9j50skXti4oQLO7as/+hm+N0MeLcVwddd55mjmxTSrPV3CWIu1b6XwGehtkv
	/FFp1w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1965x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:09:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-359fe4e9ea7so144102a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773853774; x=1774458574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWy6AvBvJuSLSKIvUfXuWYTFb2xoDYuunAiAip6CnCI=;
        b=HlGZA8vwDVhxVz4YSue7d+kIuPcgI8IEYaKAr/kj8CTiOFRaTlkJGA0Cz0LFObcXZX
         yrHdkzHpKtpDY7c65hWRocWCUEzH+Ri8hRjiUTp01FgadmV9wKqpO3iADPCqml0+F1kB
         CHQinusphM3jBYQH8Yi8l1mlWQf67q/zuDRRTiziyux9KLCVxa+yihYmnGm2jmvAPZTK
         zDqR4/LgpqPTflOVDfU+F9RWMmBICAOTSUmtQh2bbXtPjyiAE1gArtBCQpU3/+WaLUah
         lvpajFkc8Ye2bWuV7B8kQRm1orV+aIwXvUTSnra2H7CBQsqeGNNc86iOvJNAK1AajNUy
         SLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773853774; x=1774458574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWy6AvBvJuSLSKIvUfXuWYTFb2xoDYuunAiAip6CnCI=;
        b=K9KxpedSiXI13LJxLFVf5E0+wC9kaIu5rXW/NTWQPeuX0AA7FKX6ag5hmLwF7v+Y29
         FKbTH2lGNe1eGUalNIIpL+Kmrm/QISiN6gbVmE4TeqvfbsAjY2dJji7T7oX1E8ICzziZ
         nevg6UXLa87yUNy+QqWPvx+q+6Dj9E4lPP4V/S1D5/JzT3XXtDNdTGQw/OCrKB2N3/Ix
         ZkEAbC/Bavmcl1JM7UMggEuxP0WNIOswL0Qgp7lsznH4pyLrFVxhZLv3ehSuWgZMbHW8
         XZNV9yy6iNLmAQlbFt2Z+pgrzG66b8uv9/1Hb7mRQMa+FwLytf1fv+zWsjBsFZT13QRN
         RN+w==
X-Gm-Message-State: AOJu0YwPXMYTwnMO4hjSWqVeBFLcfc9lTV+mGHRsb9dC5+4FpncU89Uk
	X4xDJsdthawZHTQjN5p01S8U09PIGiPgeg1VWjVh0pNEgsxPKxeETO4EiXfFJPOxEMbx6cJ+Qrd
	g1AV9jLljFr3Xk2zz4SpWw94nlzorvm5gMsToUW/+tQGOhsPpeuKnFNUuVLc6+83fthxizPQ6U6
	IQ
X-Gm-Gg: ATEYQzzPGEYZYrka2QAGr2V+TKeeYrp2HAojlJq67NsTNmDxJCvBE/2Hr6jXWlYc9nk
	n/nNKXs7Tu/NdGZLxnOMb+r3LH6NPgZsMKZVTLHCtGLFYZEIjv3utmgvVqA4WGsrvywB3Ns+Zst
	bnmMCHd6qNTv/elvj2+73eTCaZBTayTElSzBHd+LdPild4iGZ3Lzr/m8xkgnR2HHm+bPg9JBvgR
	Q8hcBB2TbV2Q6oHhA/Cc3bk7bSwsQHtV5ooH9cnCob1TPUTQTsfR4wev86U2l53ObROr2dpfIG7
	j/OmZSslbosfNLRDlHG2HZlMYDrJVKTEwq5z564hXxpsKwFlzlgT5Y1iPL6uEWF4ylWwzOUcc+e
	xSKgIDzBWgdhg8964/BhsznD8zbTTt8tInY88qwN2qJau5BCJ+w==
X-Received: by 2002:a17:90b:3e47:b0:359:7b9a:2cf4 with SMTP id 98e67ed59e1d1-35bb9d92ce0mr3656534a91.0.1773853773963;
        Wed, 18 Mar 2026 10:09:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3e47:b0:359:7b9a:2cf4 with SMTP id 98e67ed59e1d1-35bb9d92ce0mr3656516a91.0.1773853773480;
        Wed, 18 Mar 2026 10:09:33 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.29.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc62b514bsm171902a91.3.2026.03.18.10.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 10:09:33 -0700 (PDT)
Message-ID: <cd63e6e4-e8c5-4c26-b929-cf47e9b58250@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 22:39:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom,eliza-dispcc: Add Eliza
 SoC display CC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-1-8c05581168d1@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-dispcc-eliza-v2-1-8c05581168d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 51VwLauFm-rWUdumTo_hBKG3IAsbmACs
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69badc4f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=kWG1ar9lY4jofqPRq7zosA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=biJtGA3NR2aAF7uD6uoA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 51VwLauFm-rWUdumTo_hBKG3IAsbmACs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE0NiBTYWx0ZWRfX8v+2kSKGrz2X
 6P2w17txF3ODM6HrtQJvrcjH41uYEaY32J9CxGzN2JRqt9iG807O7l02oqFh8XkZ7KTELkDAVoX
 SHg8pwHGKN4dYcpNDHJnAd6ZqBUfVVhw9FBHykvX41ZeDL7uqeVsufltTQYI2Qty2c7WmOtrzh6
 UyJQnO3bz2wGILRrO7jWZHfcubOxXWL7o3NPDvHutuKU5ZXxBGlufpo2+Yn9/Te4CwXhvOIFzFe
 Tl1gpvGDBw3YmY1QpdSbDd2wk5mnLJLJX04jOzSAiABMmRAsr34W4i3UFN9ryb4fdVU1Mr/+71a
 blu/rNaSSHSjrjRs8RVWax2zFGUYLM11CjGselEbFJiNtO0FScw/SNnMJrzD/QoLnLkmkOofqyM
 iNCVsC/sG5Z8IFqj2nh08njVS/P4lR+OWq6a42AzoU+Q/UojJ9jni3J2tP3+ITgFkSk1RdCURId
 QXP8dYCiP317QIUB95A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180146
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98539-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D3B22C0A74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/18/2026 4:09 PM, Krzysztof Kozlowski wrote:
> +  power-domains:
> +    items:
> +      - description: MMCX power domain
> +
> +  required-opps:
> +    items:
> +      - description: MMCX performance point
> +

Eliza, does not have MMCX rail, it is all connected to CX.

-- 
Thanks,
Taniya Das


