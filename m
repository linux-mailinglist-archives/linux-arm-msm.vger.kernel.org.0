Return-Path: <linux-arm-msm+bounces-102432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IXGDOVg12keNQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:18:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F363C7A5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C91AE3002509
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3DA3A3E9E;
	Thu,  9 Apr 2026 08:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOQENC9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VdK8YVHK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE02E39B48F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722719; cv=none; b=rfY49YmFLZ2ElOQWEvOmMeJz61/YCfDye5epVF3r42nYiJwIjxDY9Rm1xx6T5PYSldYW+kitgZTFgsfgTpy8Kup5sWFh3J9eDhB41whlU00SuFjk6sQ99erlktj8rUUED+amdHDTC5seHKasPf+CZN2soC3VhBfj8K0SObrE56Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722719; c=relaxed/simple;
	bh=m5tFcopWBSKNdB53LAhal06l0yyzaqheMmMZSLpC6Hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L125e/dBl3Cv5Ry12zl57s8oRJiNjY0iWhv2vccTawQE0zGKE1p0ZxssvHY0E1Rw9tGbOfYSWQQGR42cUTXJ6NaZD6CVUl1HYJp6ocqJlB5DQrx+6a91l6Rzha4zoHz0D5TbjLUm268RZyL79sb3fWJoP4YMex5D/NBIS31O3O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOQENC9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VdK8YVHK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395Mcqb3715684
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 08:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8z8l8qSYfoO88CPg9LA+QREeSlAoVd+weN+GhlGYusQ=; b=SOQENC9Q2W7xoIA2
	7Zl+/EymyBhWDyDzQO4xyLCSdxUDHMw1OMMw7GLZJr/hJ1S17DoPcFTamBiljcN8
	TptuqnNopzINV7hd3cJGLuhOwxs44ZLOXxF17God9cmXbiDdz93koLxWi0ak4nLV
	YznZfd9FHhK4UM4N1AM/PltB2m10nVZFTFGpqtdT9wmOqcWMf5tRivbpeQvgkxIU
	vUSNCxF3q8NZu0D+ealf0sZ8qdKete2l2j2L5KeM2AnMKDCZvuQdj0l3FjGdTqBR
	umo+Byw+QHr8Pwu1OvTdyNQkbDHuv24S4ikPOaWFWg7tRgGpWWE5KPidBySr8okO
	xM5v0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74b227-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:18:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfe29579d5so8443785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775722717; x=1776327517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8z8l8qSYfoO88CPg9LA+QREeSlAoVd+weN+GhlGYusQ=;
        b=VdK8YVHKezToXzakrYf8LiFn056ktoQ0q/FehYR88VNQuz9v48/QVkKeDii6oPK8hW
         9jqpry94kb5mxHtsSRBOtF8r9MsDeIrJQQzmFGJNjsLGLMF7HFFwfhqMFGrE3AMvZ7gu
         XZ7eXs96N0SEIy/wVl2YvPMmmmZhW08MdfzTWsSketAby19siNFQ/9AkxT2bjGI2Dlyz
         xoF9ijXFXcEfYYTFvQmZnwvuGHx4aMK4mpWqMadObeVdxs67e7qlzD/q9M2XyOMP8QUZ
         qO3wwYQnxwWLgRnxHoQEEbNn1CKO2QBmaKHxetyDn29cF7LpUdNgDRFrP7Xtma47TBKg
         C2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722717; x=1776327517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8z8l8qSYfoO88CPg9LA+QREeSlAoVd+weN+GhlGYusQ=;
        b=QgzuhpNQCuUhCx0B2kuMqMZ2+Ioe+5wNPbAG9rRCghaXNUyz7RNc/TIwrcvnh9fhTA
         FuB54rRd1QEjP+qsyMvYvCw+3K1+nLKtz+64vBzdC239j0iUzftOkKhh+RrOXK2uRx5n
         BAH6bTN3mtrDAR/Btj5/76C/0rpnPBYO+dBz3jN1UP+24rqUYYun8PfhQm5EgU+4Zv+7
         QPC5k07eVAWTWEqfRNhOAg4BSJ+VJcqz6+H+x/4yJOgrjAl8w9vma5ayKhqmHY1j55fC
         UmKF0p/YRvCeBTDTBLE0Ehu9Dai2kbhNeRMrMGoanC++KHZd7aJ6MGNlocA7siMPrQws
         iE3A==
X-Forwarded-Encrypted: i=1; AJvYcCX+qI8IL12a5WG6KKIIso8N9zn9UC8GdiYe/XobakXwOLbYVUQeFf2MIuYfdGxHAD/wN23doq0MA5yvdUae@vger.kernel.org
X-Gm-Message-State: AOJu0YwMdqTY9QVXfKx0rtx4ccqxnkxtvl7VDbj4C/8MVS6ZoesNzZLS
	mmQweDnzXH+pfzoOsZEv6mmBV3+vHXYnwmWAyTZsg7XJLkwFdmlz4K79Db3KyqKhrp/KEUTFg+z
	K62vqglC9vnPWQ4H+MFYR8eDvIQQKKaXHIoofyz39u8qAD1oJtGNGviE+tkaZKWLdeSRiGmPVT+
	CK
X-Gm-Gg: AeBDieuHdlwP4fO7iDKHhKFY6D5zSk6t1ClXt42NZIooNw0MszItCjVAfAcYg1UILfL
	fcpjvugWCtXFI0jw0K42whyBtXZ5FSBzwrjK3fANCRTCqjWHiK+Pr1In950uCi+P0qbY8WnmbUf
	d2r6O+OVK2teIgixyruXQNmd3g6/Pi0bsSklAzzNE0PFh8FbmOPxumxdS01tZEBVq3PRLZ4n56i
	5cTdKrUu3C3Pyv17H2OLnbkotMYNf4y1DWzwCBzNw1rOAbQWBjs8b/Hp68cEx9GWebfNQbGVRYO
	O5TvRGiCp2hZrjOyaLkN8qYDvSEC+8HamaBTobAoo4A6c3JXf+4ZpTiMThmSi4NYP2+X2Xgm/sz
	mQUCrY33lSVhcs6IbOndA8LtEGg32HvWYc1jcPzCj9M6OFGwQcA5glDBBzYfBrfpMycX3DnZYMZ
	YWyEY=
X-Received: by 2002:a05:620a:2984:b0:8d5:bb98:f3cf with SMTP id af79cd13be357-8dadf2de6a9mr740953785a.2.1775722716809;
        Thu, 09 Apr 2026 01:18:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2984:b0:8d5:bb98:f3cf with SMTP id af79cd13be357-8dadf2de6a9mr740952385a.2.1775722716307;
        Thu, 09 Apr 2026 01:18:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034b9284sm5893094a12.22.2026.04.09.01.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 01:18:35 -0700 (PDT)
Message-ID: <e8fc04bc-5c98-415c-aa47-48f853fdfc2f@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 10:18:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] net: ipa: Fix decoding EV_PER_EE for IPA v5.0+
To: Luca Weiss <luca.weiss@fairphone.com>, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-ipa-fixes-v1-0-a817c30678ac@fairphone.com>
 <20260409-ipa-fixes-v1-2-a817c30678ac@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-ipa-fixes-v1-2-a817c30678ac@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d760dd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=CILkcpHQ0ZtWuLMSmlYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: liG7V0z5sBoTm6IH5f5fp2Ien4IOM2ec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3MiBTYWx0ZWRfX4onmyawKrC8e
 FugAsmxEKwFupIeaBa8/sfnQ3j2fwC1D+4OcuzUZNXDvBSPorkOTOK8CjXHFbpufJERmeTRU0SW
 vejkxuwYx45GRya1R69VMmEOvrZtFytBoetviVgYch4EGG54iyRpp840J3I4pUF+wXsbtezvXy5
 M0BwDFU1Y0JOJ5zAkbDfaUqob6wC0N73sWm/Y+hs1lcz7mVa2A1az6gklOI3Q9yFiO5pkjlyIyB
 GISE7QQASD6wwgAfVkJyoSn19e+In2andqn+a07qyfovftJYQ5ZdevWGmQTYycZBR5N+MlGBb4J
 OV+6jcD34UHKuzi3+2RXV+yLTVD/6xjHlpfp5iFyCuMOWDJ/FcNOr7QzDIECdkDuR2fnI7crBDL
 /VjDsYjgBL0nGXtQCG8HhnR6mduUbk1dhjyP/wNJxMJjWEjeqx4oenJuOjnz7x5LUjXYfSadPE2
 6UT2pMrxctvcsJZIeVw==
X-Proofpoint-GUID: liG7V0z5sBoTm6IH5f5fp2Ien4IOM2ec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090072
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102432-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,fairphone.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20F363C7A5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 10:13 AM, Luca Weiss wrote:
> Initially 'reg' and 'val' are assigned from HW_PARAM_2.
> 
> But since IPA v5.0+ takes EV_PER_EE from HW_PARAM_4 (instead of
> NUM_EV_PER_EE from HW_PARAM_2), we not only need to re-assign 'reg' but
> also read the register value of that register into 'val' so that
> reg_decode() works on the correct value.
> 
> Fixes: f651334e1ef5 ("net: ipa: add HW_PARAM_4 GSI register")
> Link: https://sashiko.dev/#/patchset/20260403-milos-ipa-v1-0-01e9e4e03d3e%40fairphone.com?part=2
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

