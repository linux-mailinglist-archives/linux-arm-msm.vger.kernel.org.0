Return-Path: <linux-arm-msm+bounces-91883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLlGHEBihGng2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:26:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C67F0A5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B5B5305DA81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA7D36EAA0;
	Thu,  5 Feb 2026 09:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+xHztOu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GjNz4igr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B814362157
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282621; cv=none; b=OlrKNNDDdLIcEfwi1VVmUUZN4ijgeA0u7+ASLFc7FvBuqZ6hVRlV7/grCCxbTVXHK6KSGcQB4BOm+CTycMHoJYyvAiipvIia8shklJelcPdGbIQzPI7Q/TYAOplk0fyWMf0bFy9qnEZNcYvVaZyfnpv+Q0gYLng6w/PPA8mmY0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282621; c=relaxed/simple;
	bh=J2fyxizp0gxgY9v25dFNE2aqa+rNAOoNMdBRDI/c57g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/dx0Z5hiLMWDRAgqnfqqp9GSpSopfdPaqvbVyZt7D/LtIN398GRnDn/Kw6PmEcQPvQ5u+Bddz1bmjzdLH53pfslW9t4tYWMRRVLpa1YdW+b5hAtJkGT/rRZL3TgG+9QrFD5/zdW9S9RCyCxNP55gITmHALFmlcyPQGLgOYe8H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+xHztOu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GjNz4igr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dkcs2639675
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOBUWSZfBN3uTZONHP9txNcZM555pQKMxMWdmZy2n9o=; b=Y+xHztOu2Zemu8OJ
	Ge6MWc2V7DWtdaGQaPm9tIHZzIbu6pVHitwuckoJ1ZGkf+V0jSE3MFN9lYZ/ljwT
	P9MLCkTk+xWiZinZvPdz9h/DQlKBch1bLNArEqQZTeDmJpjM7JF48yI8OeKLgJuP
	4+Iq7y7Nf1/rSb+qEnEPMl9xCmNVHwewAMNg5bbqypzVKQ3catocBbPcNomNzre5
	XIluk2DajnX5hNZj+Phvs2Q3V1u5ZkP3xx6fMak51AMcQ3vuKqxZ+n/x2k6TOQid
	Ke2c6UB7QVdF2o6V9H8Degq/RQ5Zcn4N5+v5Jfrq9i1fmHVkvXAJikfiduU9SWu7
	SngJvQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47qvb56u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:10:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ca3952cbb9so30287885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770282620; x=1770887420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OOBUWSZfBN3uTZONHP9txNcZM555pQKMxMWdmZy2n9o=;
        b=GjNz4igrzdH8OXmHU5seivYKh+tAo3Q7LZQBo7SS8Q9oQE65cjf5W2kFyL1VK7Ij4t
         c4OWAk7HXBQs1QIuSp92lt+liwke9vI4G8S8isO+5+3hTMLqEnPQiILDXIcmoA+qfCOU
         8PqassCK/ChRsOGJK+1i9aIK7/sMWvlsihKeaqNu71NdbjeFiTKw54EjUWXIT2ILHql9
         BS671HX9pwYqeW8sqB7UHMacyXhVfT+be2Qnw0NWLKVXV9dK5rNAiNjaKhN3HL0DYKfU
         b5UXXMmmgLwWbYSl+qXAIin8wP7tggUVdrlvWD6CqnliqV9kDABe5Mqt8ktJfUZNJsEZ
         7nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770282620; x=1770887420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOBUWSZfBN3uTZONHP9txNcZM555pQKMxMWdmZy2n9o=;
        b=ftzmW2iZOZUQhs/g0PnFtXfw78DgxpVuPbSxglplkT0zvRmSvrYMiEyz6CoC8nl5ze
         WPv5OceIhWS+7hPSfLkW4xYK81mrCjg1SuRlHvFzBGiIMfiZWCOJfQOaUGaQPZ78jL0Z
         Sqr9JA15Gojcz3PRxJNzNGBNfBI+cZIEQxDP/A2BaIzcwSqT6UjKMYKLAApmqCvZLpIa
         zFte/xKzk5M8RGCHw9r5fHI1/Wc0eQb2iqv+BbGks6NkwjyD/IL0vC73rzlfM0BuIpMO
         O8J7Q4AGxqB8oKQGZVukVrKXxNe0a7Vg7FuP3mlNziXr4FMVVdex9w9AGy4ayc7dvxfQ
         rbeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3XMKql0+b4xC/jqlFYFKP7Gjba7xGnb2YJFRzJK4vlpO/k6S1xO7wu67mcQio2HrxsNzsHnhnePrs/Gdu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2cjQOB1WCZQ377wz1PoFBl5MrGkTCHlb+3DmBYRJaGvx4pAqk
	d1umxVuM0VhKLb7Oe0qLqKG2dfL9RqDfM6GgkRGC87YAZHkQwM0YlL8E9YsTUu9ZlReZgAWNbPd
	CeRlFMGbD0SCZLuhxj9tXtaGthT3oBL8JM87QRUIllB9O1FTEGjcBmNFz/dhTApEIzJLO
X-Gm-Gg: AZuq6aK8tdUaTjKoEa4bHYltwp9fdc1Liuk8i5EO9xzhzuLRqnpXIt86ZKEBuQHvlvM
	Vl5iF1kNyX099MFb9PParvxWT+zXIMK9TMVFHMigUwlOD58K/tuhG1KrITeuNGWkvblkqAh7hch
	kucqJla4ZVyCOvQZxl4qB9GfM8PqChP97oTKiiQ6jgEAuiDqO2c+CNxlVeOEWxdMiNLyVWeFUuX
	r1o9O6CzM4aUlAi3sWE3jZBVm1We3QcXgbWFSVk4dRjvnVgjimKUF3O00DI4Bwl52Tn3nq/Nc8s
	7bf7+saRGdrN34OtHjH+QOT/GuNqZ3sjuzmNC3YyH5JvKwGu5s3Q422aZNSnCTCadnZCb3Zh8wi
	hkNMEtdlkQuoBRoTZkkgU0C3GlDqmckhYrjglDoHN5GkGwy+eLDMbAw7hg5uC7/5XJsM=
X-Received: by 2002:a05:620a:3193:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8ca2f9c4d4emr526861585a.9.1770282619709;
        Thu, 05 Feb 2026 01:10:19 -0800 (PST)
X-Received: by 2002:a05:620a:3193:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8ca2f9c4d4emr526860185a.9.1770282619268;
        Thu, 05 Feb 2026 01:10:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd75d2sm210270466b.3.2026.02.05.01.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 01:10:18 -0800 (PST)
Message-ID: <e8ee4123-b94b-4d7f-b7ae-55e02c18154f@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 10:10:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] interconnect: qcom: qcs615: enable QoS configuration
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260202070534.1281652-1-odelu.kukatla@oss.qualcomm.com>
 <20260202070534.1281652-3-odelu.kukatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202070534.1281652-3-odelu.kukatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GaEaXAXL c=1 sm=1 tr=0 ts=69845e7c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WrDRg_0m88nTcLYVVW0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: XPyHTtHtWH7-_jF8YgLkQWmVmg1FYiya
X-Proofpoint-ORIG-GUID: XPyHTtHtWH7-_jF8YgLkQWmVmg1FYiya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NSBTYWx0ZWRfXwxxb9y8MBWGS
 fsTJMe066LaEq8Mt7CivMO6e4qKcH5pNKSVqeLCUOXdcDciKmiJOiw4i8l4qcPsrewa2CDkbBs9
 dWF4lgVz6VLQ3urOY/qNtkttQgpmOLLI4rzwlSMNvEsmphFcUzbLbzqvO6AUAOz6O5+ANhnNS5W
 yYAgXEdKP5Nqi9E7KrFesQghultklFLvErVYLjDlqseudp6PVK8HYZsnWQ/NFfR2HCZUpjW2HWJ
 Kk3IqtD538B/1KUHaihPfMaAV3C2tlAFXGAevSf2Dd+GempmY8igSJ589f5rFtcuCmyiiwG5/JG
 KDR8xlbWFQ3tCO8oYCIEM6ayW9iY7qsN3AmEvZt5sleJ2twghD+OQrNiFzm42EwvmdIQHwk1WzE
 rahoxnXae21sXGS8ZVbIiQ0DMx/DN3A2+/zsT2Sl+ieXxDmKXHFtAk1deEt3NhOZFEGd3qhChcN
 15reCbbUZzdP62qex4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-91883-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3C67F0A5E
X-Rspamd-Action: no action

On 2/2/26 8:05 AM, Odelu Kukatla wrote:
> Enable QoS configuration for master ports with predefined priority
> and urgency forwarding.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

