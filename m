Return-Path: <linux-arm-msm+bounces-99240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEDlEWc4wWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:56:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CCA2F24A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C604302DF7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33243A6B88;
	Mon, 23 Mar 2026 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOGFEeaz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu4Ylt/P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ED839C014
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270004; cv=none; b=TBRlryE7+vai07O+gS0M3sKt2b7nEX8rwBVrQssrlfnvl/fYVEuOpBDTHyUUMf7q2HcdOQ9LmVRgP75FzRlThLT8pTMosYYIZgMkTBJEY31TYebphD8J4F2IT/u7cIlwi9Oq5C4iPDBOHEG3UOag1FvNfezJ/+ObMTqyFK1JmDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270004; c=relaxed/simple;
	bh=E0jjYOvnUOby2Y7SZRlZDVbQQDz7XP5UIBx2kAgRPq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWjJ3WNkwXjitcz1gTF6xA0sHJzP273h5QXGmsBAN3q2IKPV+alb21szIlwVGn+9YdbhOilSM6NkfaaSKlXVhqc0UJk6qRSlbDOTUij5A+h/aIaqiS/pX8IRrWX+I8ZIJJiuOvvmQH+FsqzZQIz/tN6sEv1TJxLU0uAwRNSIaH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOGFEeaz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu4Ylt/P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCeiJU2476065
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OPpDI+20CmpGqDJiTGA01Z7mFkGhsPpUYB/uL5YaIfc=; b=kOGFEeaz6f27YdYo
	TjaWKrlt2Sl5gTShyzaqiD35ZRlIWR4XL3Cz+ktzskh2npxA69CzI6aiCAEykeBz
	efiXMmmPuWykPuggy5f52ye1Od+vJh6WuZ/bAfKhvVsy9hMj+kCCLUZtaJsD/wG6
	3NImOxUAk5jiymO917pz5ablhT3ohIcsQExIz72eKj9Yt9dIWLR/6dgoxgSYLC4n
	GRjyDssZaXZ1RovR4wCFOit9kB7gBEfC1WjN1C6WY3qY3GkT6NUWo6vRdbQ6YW6L
	fSCucSfCwmTqw/9yIKIgBFhziylE7Gq2L7vPnlcb2LMEUcaDi+CI1EaFADT7VAcX
	lhMO+w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r200qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:46:42 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56ce66c736bso257871e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270002; x=1774874802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OPpDI+20CmpGqDJiTGA01Z7mFkGhsPpUYB/uL5YaIfc=;
        b=Gu4Ylt/P9c2h7FajIK4CBp+HEaOuK+b1/7sLZmflKxKZgnp7eHFthHp7rJudQ0suxe
         XFItxoXIClanfFLvFWlB6dZthb31FjgbWSv8htjN4OVP59klzqf0x4Ti5sQ0K9cs5ujU
         zmNKc2xbU1zfpGUyKojyWDnDEH/qV50l1zainnErk+y+XQfZr+qvln0JrelWnhAhBcON
         1396zXx72uMwkrLmHFg+tuPguM8nmWBtCJIG5usp4KhY1kPqLcrl2asQi1Lwir6Lb9e/
         8VNn843ly1uI7u9hC1pICN7uYFFmmZjADnW3sLxU34WxTTV10rkZpUPc/m0kiq+UJlWE
         bPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270002; x=1774874802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPpDI+20CmpGqDJiTGA01Z7mFkGhsPpUYB/uL5YaIfc=;
        b=JOvbA0QQgQm3NxHJQ7yAYCfpiLA68S+Zeh2WhKBw+C8jiVNWgbXErHUD0RAPXgiT3M
         MkxpSydKCmO+4n7dtbn8ZK77INiFJKXqmCEsntde69mmmpwW7nFxD9B/i8qQvNNdOrlN
         bx4StWxCu4WypFVbPILq3pxCQjbQQWg6acnvKtmRKSOLZuXOkvKfm9jsBHB83SLFeNbL
         4I1WCjxcwDnwZ+WNE6iFTfuf/KrUp8mrAVebpS+uIj3T+QOj9+oRvKp5lTWRkk23UpX0
         dF+PjwSERfxVMAO6nM1TCx5NiTBiBEYq0xEN6Uzf1y1jnJKNgx4IOA+eA1v3z/VlXYbd
         VSLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDMr2CntU477Z+Oedb8JIcPBCRn35glHJgWGWxEvbwce7wzvTEYrNqR4ew58rixsZ7lbqncsmebLc3LbdJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxuUsSEoA16m0fz+BMTKTnxIPbQxMvqCU0zo0wRx1SNghERYdyw
	n7vtEyLyq7FSYlIYlIYiJ+ltN9OyAHWSEylH07/f5zomAfLAjGHlGsXlDNO2ZN+n7Mq0KUI4byi
	CNJPL7lJnfV7YRHlVGrZ54vPzjujQj2TQIKY/4XzK9mZp/FkeJrjVtvu419XZoK6TQZ+C
X-Gm-Gg: ATEYQzzuGmzvEUUVFitEofpt759Uur/Ld0pArI67PmJ+EfuzUIp2DWveVa/HBMtQnMy
	Ti/4DWvhprHXoKr8k4thIa4EP6t3gR1puM/OP4boueqMjqAym745VaV4lZsuAPbikGs16bDp1u9
	mGQBF+H+z+M/Ut+TmzJ5uikCTSN26TtVtd5xAqhsa0nk1NHFcp4OtBXr5rOSxj1/ntR8J4kykIn
	JhvqWeSpGkBNK97QeDZSuBtj1nRziIClJoQvx0Oek9rS3Pd9RFYVz6L5SJSEMGfsbjy8UfV7p6P
	MNSeChBcrpEgaBbcdBl9R1qXBfNyUpfuA9OKfVDeD8GvKLKX3NWNEbAIbM1Pkza/BBO946EeAq3
	ABakOIrX9YYmURyGdT90a9wqODFWqDK4SV8eYuDGwzBg0PgWeobT2Q5ujh2gejUJo2ZfBpqOYla
	/jiCY=
X-Received: by 2002:a05:6102:74c:b0:5ff:c831:b98b with SMTP id ada2fe7eead31-602aea86467mr2115657137.2.1774270001684;
        Mon, 23 Mar 2026 05:46:41 -0700 (PDT)
X-Received: by 2002:a05:6102:74c:b0:5ff:c831:b98b with SMTP id ada2fe7eead31-602aea86467mr2115649137.2.1774270001209;
        Mon, 23 Mar 2026 05:46:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871369sm486785566b.55.2026.03.23.05.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:46:40 -0700 (PDT)
Message-ID: <050d0156-1c4a-4bfa-a3e0-41984bfeeda2@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:46:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Support enabling interconnect path for GDSC for
 fixing Milos camcc
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c13632 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6H0WHjuAAAAA:8 a=_xFa7kLeCwyeeWSXsRMA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 31oPhjeuktWYjhkXxXUD4Oo_f75YpdYT
X-Proofpoint-ORIG-GUID: 31oPhjeuktWYjhkXxXUD4Oo_f75YpdYT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OSBTYWx0ZWRfX0XTgwa0zwItt
 nRyl4JzwhuRaQymU1ynCBCfFDaJrqR42wk0WiEDMWySrnr/9RxG985H6i4/PIn5r3d4EBSp9jzA
 kyMxuVa72DMU5cJcdVb3jn+ndHD+AL5UuRZc3tcSHgGXc06NlTWNLtxaZK8EAHjdvnwk8w62Q2K
 GEUFJAx3TDblQhBDRnxGI/CTU6DywdQxsfc/C7ayfjF937Sq9VTKKJo75I9dOxwFRcU4/MWFKne
 3no9YVWgQuXc/WMk7ybkpCKW7Sknz77Vq/3On9hH4ACUCpfpYqVAySeFFhzC6Lhyi6Yi1XIPpe4
 Xinc8oP/YALH4Io6dOI5u8pDye/BHbOSfn5J7AHr5J3GCC3t2lIn34d+dQTaeY9z9aRcZvZl4L7
 OoF7yZWuv4Lcbj/UKcTBa1C7fDeUK0HBSbX+IztnOMj6XDs6S7a4Z83jyNoBGuH+7uWGhfLAqMb
 Nc1R3x+xsvfWBnxk9DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99240-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,fairphone.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99CCA2F24A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/16/26 2:17 PM, Luca Weiss wrote:
> Some power domains like CAMSS_TOP_GDSC requires the enablement of the
> multimedia NoC on newer SoCs like Milos.
> 
> Add support for getting an interconnect path as specified in the SoC
> clock driver, and enabling/disabling that interconnect path when the
> GDSC is being enabled/disabled.
> 
> Then specify that dependency in the camcc-milos driver and add it to the
> dt-bindings and milos.dtsi.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

+Mike could you please take a look?

Konrad

