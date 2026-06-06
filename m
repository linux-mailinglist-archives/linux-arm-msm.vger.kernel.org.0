Return-Path: <linux-arm-msm+bounces-111479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /cOrLbQDJGqV1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:25:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BE764D304
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:25:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=idJhqVqs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gR24Q7c6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111479-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111479-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8EB253008FED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 11:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9EE38887D;
	Sat,  6 Jun 2026 11:25:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71E537E302
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 11:25:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745135; cv=none; b=kDNOEOm70VtMN6jw24u3Rqx90EWZHyv0Mu70FO3fm4vOla0tyWV48g1D5kOKQrSfwkKixf4OqfpFh1+/AsqWMuwVSLYOWR/3owjDoduqFUUGcJmJGBcGv+8RuHYADCb+KK9vD2XuH/vN2r5AUhlZ72duWqnn2vUNfZjuyNpGEIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745135; c=relaxed/simple;
	bh=Rc5SNq9ypUEc+Gmk+gMVivGdRF3kWm5E+NzMvfynb/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fG7q/ObhKaKYK8boHvRd1m5rPJVa6Bs+brtVVMGABHZtTdEeax6B7KiXMrbgMgBZ2OkXI0Z1ZE3u9Wo09MV952B5PMM7VwI2Whw7tbnkAoOzZBkXjRIgdLrV4Mss0tYbbOBH1guCNFBWK+085Yg7MzKYt3CzLmUajloJoNK8cT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idJhqVqs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gR24Q7c6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BIfVL1299718
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 11:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lYibyQhkVIdTVochn2DOZD99
	ZwEouYLEHjbrhyxnVLQ=; b=idJhqVqsqkygHD4ZgE5XvGf2qjYci0pA0yzd0ACL
	RureF0dhPWckpDMjmFSPQjp/CCkupgkHKOQhDJ+xJQbOMVAh1CWiksolhIvkt9TW
	BnBnyY1mYOl7/xmrDcNRd1dESu0hzUKSwRliE7M+Ognk40Efh9l8hy522DaSob2u
	6Sm5P6iJhAbLPTc5jb1bA6E2ao3Rw93q02xD0uW6ceNmgYiY1jPSjecr77kSVcW8
	F8ZiahQkIwU6rtocbQYVNu/Hm07Smz0AI7+x87Y2CG+6xqv1JIzP9LOqsP9Q+ots
	7NV2FYdpUtcZ1LYv4oRBXKJn+Ibc13uVgJNWcJAhvBcPcA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3hbxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 11:25:32 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96391e58e62so3736922241.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 04:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745132; x=1781349932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lYibyQhkVIdTVochn2DOZD99ZwEouYLEHjbrhyxnVLQ=;
        b=gR24Q7c6MNvYMhe8npKh/S7I4k+pDbtQHmv/AqFe71DjdMO5Nzv8ovX5rOJYezt6PY
         rBcnIaqD+fo7D3HVDjrynzY41mlW16a8E50CUwNDjrYcDK0Gs1drOnUtiQ2n+MAZsLBT
         bZnapQbr7LjKnldWHEWP/ZPNJEEfDwvVEtCBKaZ8fzmzkbZXCnvU/XAJ+45FpBf3YQlI
         JUBM8Z2HYso98tINWmQZPRriTJHFjCwzoca5EvEL0p4+8++PknnBBzqVK3JQd0rDFe6f
         qH9ZcphtVQowv+omKheWo6cohMewX0Qa4sRo51TMAIQZ6f0s/VF26s3xtP1/gokdlQEa
         YjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745132; x=1781349932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYibyQhkVIdTVochn2DOZD99ZwEouYLEHjbrhyxnVLQ=;
        b=kSIEa255i04GmiNNRhnutba3bFahoc4ikosbhn3CJR343uCCx6BPnqxeoCsk8pOpVS
         Qm/g1miZWwe8FVljyR3JdsDqezS29kgW4kwSNesY+K0i/+Qy6Hq+Rt7HBfQ3mUKQwkZ8
         PuNAUpRlN9QCMrXhe77JHyifzoKEQCDFE7ZHf42m/ONDQZ7qBd/XVVeREZvJSgdWTp2Q
         mc/3ZdT/B54u1mjODBbx2IJ1Wr0UWvAFEEfRo0ju9UCDHSyIdf+wLdz4inpZih8dcC5Z
         k7ryxPbMJsxkJix1rE1++QtDpHENe7CM4s/n9uC0ygRsT8vWufE1040rLUuslx7GhFyf
         luEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bV/KhLKp7VUE/0tJT5jAeyYjOB501rtiRQhxgMUAyEO6sulpgpKmhzFn9EfqyNo8o+81VCFZ0VDiRYmBY@vger.kernel.org
X-Gm-Message-State: AOJu0YzlBm6qYllVEaWeFUKJdTLWVdapHwMsZFydDES56Z0P4rD/pNQz
	TRO0IEqDM2FqC9A0NylqhcClOcrC0aDbr0DEhx6s3PTUE49x+HCzGMyW7GD88cxb72mMfMwmXuU
	Yp2OeIluqODNe5VSP43mskIFBLYdRIEw6NJHbgSdcClpQcj+oYFLmI9fO3O3RKKx9bCsQ
X-Gm-Gg: Acq92OG0ccE5GYGc8cIh59P5YKBz6Zwd9u/nAezkmxLHPcoxiuHtsoMA0F3OGUpYfF5
	OxAIwud38vMboQwtpPVxKSA5+EWldW4qXv5tgfa6fUlrhCm2CKN0iVOSKw+KyNuMqW7XQsHclyQ
	PZEYQ3EfX/yezrRdrp2ht3iIV2NHCR+0wha9sT020hyR+C/N3lpYRN37Tvg8L9f2zC8evb9GP1D
	ttBPVv86uSGCLeUKRxllDLec3vj9mhAfCIdl+UzK+S/gM92Lzd0ZNB2WzJhZf9ASLG3GW7hIKJA
	8Cw9b3F5zyZ1uZ+iO2WG7OpmjYXz05mGyzglks53pBHNDKRSPK9sw4taCL7G1jCic9yO1q8ey4w
	lOtqtpd/uDx762zFWFtNnkRsHycrKebI6xDUBvs/Fh7rPE9A2IwW9Vk6FXplw0whaDCIjmlrIK9
	xEG5r3wi2HtKr3cHJC64JFTERrcT6mAD+DlTS4OdgRd6GRsA==
X-Received: by 2002:a67:ff0a:0:b0:6ca:4d17:99f1 with SMTP id ada2fe7eead31-700359f5a98mr1913644137.12.1780745132411;
        Sat, 06 Jun 2026 04:25:32 -0700 (PDT)
X-Received: by 2002:a67:ff0a:0:b0:6ca:4d17:99f1 with SMTP id ada2fe7eead31-700359f5a98mr1913635137.12.1780745132058;
        Sat, 06 Jun 2026 04:25:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac34sm2415248e87.39.2026.06.06.04.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:25:31 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:25:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/13] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Message-ID: <qmpaupicfg65jusajonufuw4f7262fju6hqhia5u2hgan4h3hi@ngyujlxpxbd6>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-5-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-5-8204f1029311@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExMyBTYWx0ZWRfXyQjzU+P+QFu/
 Y+W25kuEWRD8w0fdNRt1AlKNTaqG2mrb1IpUsiGwG/hj0sRr8xPRawaztjOHUWdvAy3t3UISCP6
 BHuk50gFRNZ3P9LxmjBlhgWNr55PO4QCkvkOL4ObdqPaDeCiOlgqx2NWMttriGefm2QD1PsCEFV
 s4sKuvB/WMeyaJ5+PuqKw6eq2de/lEviTsI3csvmw5qdBJwO6GTxSMbTi4Bc/4paKor/NO6jl9+
 bZtQPoA8HLvev87QQmo0TZk+IaYBXYf29qsLkGq4Vo8TNbEFPceHcJmBCLMZ7xKQS4V+HqXGOig
 obU9gQiz16Mw91HyFmHVLYt5f070Gb9t6lpVlV6uh/P6OxmKU4DJmpadV8XsxN69jh7MQBZThNb
 4qSKiKnwB2Bin5RAFOa/ixotIq75gBtO6iR3rm1wItCnqbnCGKM3j8/GZg+F586QUCJqVRfV9VG
 8eFd0NMhb43656zJuZw==
X-Proofpoint-ORIG-GUID: 1TLqFzx1flHM8UyHSO0-SGySacWqzSF1
X-Proofpoint-GUID: 1TLqFzx1flHM8UyHSO0-SGySacWqzSF1
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a2403ac cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=g1TEsck5Q4wpR72tbYEA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111479-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7BE764D304

On Thu, Jun 04, 2026 at 10:56:11AM +0530, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

