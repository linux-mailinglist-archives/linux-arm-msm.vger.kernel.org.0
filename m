Return-Path: <linux-arm-msm+bounces-92928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPLHJgj+kmlD0wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:22:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB9142DB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 968EB300A77A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7702FFF80;
	Mon, 16 Feb 2026 11:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g68PPAUf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPLwW0LS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3A22D061B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240965; cv=none; b=rK7xZ1ritHhNe2Tz80p4o/n5TNs3fibqbxn8YMtzTnJX5V8EeySk4RzMuFBpu6g5vEtsf/WlRf5G9UIGS8R3DIpOsaFwQPJ7kNNUNaFsTwSx7zVcYaD1UhAQ/1ARQf0Va9u8/QfsNqoI15a2sV6VI9fNfJZrwTcE8ih3Tzb+JjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240965; c=relaxed/simple;
	bh=5hrACRB3hDD/pJ6iyQ3N2YU21gLCUgwHaCLqdNhwOW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mThk5E03hc7d/C2bVqfqY+GMTfjPXNhjlD2koX/xyEH3QDsanUAAE+nkvSXqijTYTU7xZXkSgca5mKbO0/ox1LhZJt3eNcqXDZW+kD6MODdWRtUd0Nwrt5MVGFsP/s6LLuNKzXse6MJ9kdmViP7xm08DXxSBsnrOpgHUsompLiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g68PPAUf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPLwW0LS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8I0e32118021
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	45igm9hsNPxlMn0CSvLm4f2gzk0L7UTXPG9RemyqqCE=; b=g68PPAUf+zSq9N57
	zIsgbfXqtk2iiFfIYDrxxuDesHXmpEkcS9YX1h+qc/khxYqX3L1AgNuy/Ez1F4jw
	QUGF4+BKXYSXl2pZSVyrFQw5SAdJ9UqGdK13lkh10auka9bWA0tpH7MWgKhmyYjy
	G04DzfpUkFFkGwdBAElaYsHwarGcfyWO4CwjbtpWuuQFazm7UJ9QlSq1btl3W9J9
	+Tl4/cusMTe9SaWAx+Cqu/tpAsVAuXKAo7NuroBFuVo+1e3xBqbh30Ir8Q/iE75g
	jPMumEQm8CyAZcNqJ1dzPBGdRsUzLjeslktZy5mOtKS/aWQL29ZzoKAvHl4gbkwg
	0WL8MA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caj7jc68d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:22:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5064fbe2babso22443381cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240963; x=1771845763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45igm9hsNPxlMn0CSvLm4f2gzk0L7UTXPG9RemyqqCE=;
        b=VPLwW0LSxB3WH7NTqv6jnzMym1yqsGLO+8NBN7CMwIsL36B6pEJBWD8AckSwdhfiuR
         ED6NUAW6r6dH24T1O3NBI2dfG/gqMT+xMjxq4VTfsIwSAOCG8rhYFFi7f1Ft95/PB5tb
         HVVNUb9iroTzWkDxPLE4I+xD5d7ORDkH78mKNOiNYvEnwOGitQbxxiyicJYxm3tPQd3v
         1e2slzb5dWEATfMHUcn4zY5hR8031tKa9Hk1TnjoSjpjLkcLkOtbz8+dXhggyJ9FhtNn
         gWYosNBaOSkUJp2qCzZVVH9aak9suwTtn4ZYMcVHPSsUhUzZnATc3VjzZzbAR0ruTDM5
         YY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240963; x=1771845763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45igm9hsNPxlMn0CSvLm4f2gzk0L7UTXPG9RemyqqCE=;
        b=j+1M9BmPbTt8Tma2hOP+n79Q01HQ/w3s3yPxr69u0H6mFnJmkb00+vrcREi9EKqmNs
         NnHhS3x2e68CaEbnDtaGGJ9XT7zGpwIQtC101BsV2o+uYqvpM6Td9XfZ2SQduXcOdMme
         WHpIcVW61grCuTTcFfnIq97k5+4dzEQQnbv5jruO85tHaVIZ+M6aYYWRhFc98z2qepRp
         9Ku/81eXUMg5hnO2goiI9EuDUY0Duy//F+6mZMySD6pac7b8YYP9A+ws9YdIsgMnRDwi
         wHLOdLKIxpYoRset0oZZywp3J+bMoto2xjazt/Kb+KpGRCOcjPm/zDtuSSfpyTvrAkZS
         qjIw==
X-Forwarded-Encrypted: i=1; AJvYcCXsYxLvof3/RsuGc1qikqcT9JvGKvzosC2Y9I4Oxw0ItdOvvH/AWAmIpCmHU2uQAkIc3YLaWCh2VyVhQ5fG@vger.kernel.org
X-Gm-Message-State: AOJu0YyT8YkK/tatd5Nd3zJ4gTwk68Hv215wly1xMMlYDi8yVUNdR86U
	auGO98ra8T9baonnNv50a7sJWY3AdrXasgS/P/9WSQ1Kyg4RAXib396UX0AsMxI5umZ4WmkgPpu
	b5no5ymf9LfSU6N4he3KFYakLuRXLGd/NQVIUB+oiQ7AtrSC6/1dZp2GA6p8MKOYMqTTE
X-Gm-Gg: AZuq6aIIZQv8aVh0gP2dEz5rNdRZwB9yLh1v9O/4Vu7SPthzTN9Nt6gJzZgoRCCppzP
	t3uIQEMEUeg9rUjkqe66UVIucnblr/2m+Lv/rkmpF3khR2QKtVqKS3dVmLqOm3GELMMGjG/RKse
	Knhfk9/zDzdzmbMBgPnsyza6JxInkTKp6QPHk/onYH+44M6I++o0Qclw4WUH9Kr+Hp0IctpZih5
	+3j94stLb6r2fHOYb5+Whe0+to5nuVk+6d6i6sxbVq5F3NDpOzzi8zzNqb/Sc+0FGo2E/ky55VT
	bDdPYvY2NXnIhDwXHn6vP59MCzk+bAL3/dlpS0qQ4CMaSeuyMskMHiWIRKlhU6InId7Vh+B+Pt3
	SvmgRo+v5U7o2L7qPS5wkCk8eBYJE9WuAP6cdmVOUHYaLDUHxFyUkxCgyGG6GfYUnpv6Tit3km8
	JpvpM=
X-Received: by 2002:ac8:5890:0:b0:4ff:b757:1210 with SMTP id d75a77b69052e-506a661e8bemr101174181cf.0.1771240963011;
        Mon, 16 Feb 2026 03:22:43 -0800 (PST)
X-Received: by 2002:ac8:5890:0:b0:4ff:b757:1210 with SMTP id d75a77b69052e-506a661e8bemr101173891cf.0.1771240962574;
        Mon, 16 Feb 2026 03:22:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad4fa9absm1827201a12.30.2026.02.16.03.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:22:41 -0800 (PST)
Message-ID: <37ef3c4b-3009-4f8f-a109-a04f6dc257f7@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:22:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] arm64: dts: qcom: lemans-evk: Enable wakeup for
 primary USB controller
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260215183325.3836178-1-swati.agarwal@oss.qualcomm.com>
 <20260215183325.3836178-3-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260215183325.3836178-3-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIurWeZb c=1 sm=1 tr=0 ts=6992fe03 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=HJ4sy_SFjw5f8Q_JKwkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NiBTYWx0ZWRfX9q2hgIzXG/sN
 AEXbfwgvcp0X9iIh+Cwuk6XHwGxrvuJ/2LoUuJK8tije4wm4gRZELpltS2y9tglY4DIzCLxwL+I
 6OeAgd1MNedLhJxdTo72MZLd6oakdqRMnHmDPXzmMU1gntBzqaOmDCqyYwJwvg6KZ2ucnIiXucM
 rJQcq9pTMRwCxhb/o+mqFEg7n0Kzl5l5TiqkeP+/zPkjq4owEPPAKWeYarSjPhaaC3Prw1nSXqR
 PDUEbk/4cAB8lwwoiRu6MDJsKUm4WETu30H7pHdSXo80qWA5aJG66R9jMP7DoHV5iUPMnkNNyTl
 BxPvlKfQ3er9Bf6lKNZVGfrTBptXvjMdyoK7DzEm7vgT7TH0qk6gEAAqhxIiy/P02i6WdcqDMj6
 QLmh8D8HZ8nzoU2nEJZpBVaORlGECH6HCYegJDCDBi1Kq+Ti4onXVUt92dYaADTakglOXTogwkA
 ASdXSFMuX2Bt9ztJzew==
X-Proofpoint-GUID: 8RD8UMZcOHGjIyF9xS5xypx7vlaN0BWg
X-Proofpoint-ORIG-GUID: 8RD8UMZcOHGjIyF9xS5xypx7vlaN0BWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160096
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
	TAGGED_FROM(0.00)[bounces-92928-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDEB9142DB7
X-Rspamd-Action: no action

On 2/15/26 7:33 PM, Swati Agarwal wrote:
> Add the "wakeup-source" property to the primary port controller node so its
> interrupt can wake the system from low‑power states on lemans EVK
> platform.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

