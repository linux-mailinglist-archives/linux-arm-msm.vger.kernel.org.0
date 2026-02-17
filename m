Return-Path: <linux-arm-msm+bounces-93142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OVoeFFhXlGkXDAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:56:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D12F014BA21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7788E3000881
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C6B548EE;
	Tue, 17 Feb 2026 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrCXI1oP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vtqkiw/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3509D324B31
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329365; cv=none; b=VmIA49tfnayHxaqO8w4GMmCpvxTkCfHsM9dWK/LY8mpC9jxBZGKS34lm4BcCYPhLxzMSIHEzLL1JwA90BcHRXNQ4Kjjqs0EjZWQNKy5fJ2FcUP6T3k0qRXzmj7N6JDpV+9j/yIwBKjSG8HdvBXrYluk4EOlAUVZa2IHYou6/rkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329365; c=relaxed/simple;
	bh=IHpTnHZt7SzXUK/S7kX+tVLZoFmFUaqjAJBhLbkKzBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXbNtZ0gAarC+EnVaPlL9wHDCmYHS+k1xNQVV/mJQ9mdVEG8OPKacgjW2jDMjwYPdo/IVN6PnlrLnJ8Ys7esxwZGFhY/8gVA9oMqj+AlZxZJBKpXJeTU1Gou9ZVSBTdvMQrMud/HNrErOFWWroIB5n2WRR38I6Eo5m+owMqJvDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrCXI1oP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vtqkiw/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9YJ3k2802092
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ci8ERzFPh/SxO4CXB6i8rjaINK9R5am3AqF7jJdUFgU=; b=IrCXI1oPXv0C4YD/
	fGzBQe8+C4rOxiuk3phBVlrbX2VpvjvKDwAMO3QHJbo/1ORm7CYJ8Z36LcDfah1f
	RaPk4dVYPvQynlvLuhv3N5bXyfeVJcCfin63kzGra9m09/lF/K3LwGXbl/zIXKTR
	yJD1m1B6Z0dYfH0csXLxIqBmodn1+hNmLvG21TigcwOM3470ks0IB8z7jkiJwO6L
	jaxPNp7/nBCmVTn9BiWv7vkUej+yB68dtnkhCGpQQNyEDNdV37qDdhG5SXf04mIJ
	XJzjgF/+pIi5KZNVgS1XLKbmP+F04k9te7h1RX00Stj/Ym0fCB6hCUED/GYnzzAb
	m4PoOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxuka1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:56:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506b3baa69eso36924281cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329363; x=1771934163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ci8ERzFPh/SxO4CXB6i8rjaINK9R5am3AqF7jJdUFgU=;
        b=Vtqkiw/uSuD2dPaOepS5CNZmX30OlTV9znA0yWd1N3t6BbCRSoo3PYOuLEtcVhgZpU
         5xIc1R99fUs0pQBkCdfAVB+v4EBFnLvgf3ptnzZSe/q4onHL4tvYhwJZcZ2kYPyXg1O8
         aT5wBKdsL8y1L//mZVH9Un7jQzwlYRWKXbegiuX13QD9yk4bUsWR9ZKoLTvSbX2g/K9Q
         E1QulsBbBLNjDBeecZYScwfzS/smPAYEVe5UjWPVNc2S3e8J1YrF+aKCJ2pkgbWiaLq4
         Y1mxAbhU4Z3Q1szmSjxX9MhiXTj0cZrKuTh5v3+npsNAaLUBRiDh9JfeNqhDaIYCuC2y
         4LaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329363; x=1771934163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ci8ERzFPh/SxO4CXB6i8rjaINK9R5am3AqF7jJdUFgU=;
        b=utfI/8FmMdXbZkl8aQMJMk3B/aUZYozKAuH4V638oM71hGGerp2imwLHmN6wilbrIl
         2wqNX3Cu/4cHFnLi5Ahxy4C+bf/g3Cg4CLgGS33QKe6wKJkNltU9gc2gHSF+2bmV2ORx
         7JlAczy2hD1wVDNyj0F7GO5Tb5EjItnSn133ZepSifAnSEauBM6FTEleE9t2sk147+3e
         xT2cb/Gsx5W9POIeD7vATvUPm89hk4Z3Kh0bu+HAGnUSDeuTg/wabnJd25rA840ZFweZ
         IsJ4dV7OLNAip/LRvQkGUxkpkuKhiLPBcKqPU5zlq3P6NGwWaM9R2+nx5Q3HglddnDLF
         Lbdw==
X-Forwarded-Encrypted: i=1; AJvYcCU+0FnqXn3elUCZBlAQxHNcXYZP56UTyvStpz3dkH2ACyTYaES1fxS99cGrsby+JufsSW5f3XpdUy303CKd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+6Q8KxzwIJlyD0EHIJSzSoQNUfCoy8aPWW7Rv49MKGg+yK350
	MALM410XHecemJZfp9oXaOucj6pKbuZb7/oh9O9breXVLpoD81Qq5upmg+XjlsRtNWBzF3TOUmZ
	/2tEIwh69ZnoJqF7wUF/tn2Bgz28nYG1UKQLnKWhEJupedonahmCsgCLSGwBqzc4dzeVr
X-Gm-Gg: AZuq6aKJGcOijS7H98VYL7gNajEau8vUArUj6A3t5CjIiZgfS2MzhUILgEyUtPba/Ki
	8v0RYLULmW5Jy5fG6YrmVigJJhjfphZ4KNQHdnt9Eks9y4qcGtuS7LVqEO8pkufK692zW4pDeWf
	PMcUwCUoUjsaI4wk4BNJ8DLJnZH2hlCCeECosKfvu1BsAojCjzj0a9CH+0ubkQLwb+HUfuMvKaO
	nE3rPBdnue/sul85qsauV7YYAno4g3aF2066kNrm56QSDDlqHz6gU1ZYXciRgSN88ekNnEIAOEC
	T6XMknA3S5vBrPLbBp9QdGevqBDLPlPYhTqv7i9oNeAf+DFbz9XC2Eh5zHVJsYdDwNxF8AJpI0R
	86xvoU7nJS6sPHkOKs/Rm+5d/gfQjkNquhUqBiWhkji6csy+0ga5ePLh4GLUjgEhCRcwLGPg6YH
	4kY6s=
X-Received: by 2002:ac8:5890:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-506a67af949mr130225781cf.4.1771329362569;
        Tue, 17 Feb 2026 03:56:02 -0800 (PST)
X-Received: by 2002:ac8:5890:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-506a67af949mr130225521cf.4.1771329362067;
        Tue, 17 Feb 2026 03:56:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e39ebsm2333308a12.18.2026.02.17.03.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:56:01 -0800 (PST)
Message-ID: <8f52d9de-2639-4bbd-9ae1-4d55ba13422c@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 12:55:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/13] i2c: qcom-geni: Use resources helper APIs in
 runtime PM functions
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
 <20260206174112.4149893-12-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260206174112.4149893-12-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mXXA0WsmORxulESYnr_wzhF0-X9FOHen
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfX7kj/IoULcFOt
 td8w4HgMfOBUA+msuzRBKO3MS1to9QhZrCdHcRH2jUqzPLn6h5X6b1KVQYKOko3jof0v/5voAfo
 V0BQ/z61ODOPc+B+E//noc+nj//hHjYZOTQ06n7ufjUqjEoCmWvbfTBrnz+UpH1hW+6VWqvHiTd
 xKTCS3WYRLvY/ZT9GDe7OiRF6c0XPPbwYgbVS5oNamsT61ZLBCd+zlmFXnbJJLwqKloyigo1Q1L
 logmoazDUQNl1Tr09CMoiBuQpYrVn1SYBNqEwZmO/TU0LC74NF53Q8dFjYjJAvr9O3xCvDyTjVD
 qRwmkZzr2T04oljOxWiw1+2WAZDbPL7zIkSga+VEcF4rA7dmhuWa8XDKwCJGqbXIam0X8UE/MD/
 4ZGwpt+YF436jV04agj9aETvyIf+MColianyLnGEkEZxu2hI4lzGiril14YCozUpd3zGz9r0+Ez
 aAtv0plV9NSjcqtcp9A==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69945753 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=gzD-2WDeCj_JQFVUwcoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: mXXA0WsmORxulESYnr_wzhF0-X9FOHen
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93142-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D12F014BA21
X-Rspamd-Action: no action

On 2/6/26 6:41 PM, Praveen Talari wrote:
> To manage GENI serial engine resources during runtime power management,
> drivers currently need to call functions for ICC, clock, and
> SE resource operations in both suspend and resume paths, resulting in
> code duplication across drivers.
> 
> The new geni_se_resources_activate() and geni_se_resources_deactivate()
> helper APIs addresses this issue by providing a streamlined method to
> enable or disable all resources based, thereby eliminating redundancy
> across drivers.
> 
> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> v3->v4:
> - Added Acked-by tag.
> 
> v1->v2:
> Bjorn:
> - Remove geni_se_resources_state() API.
> - Used geni_se_resources_activate() and geni_se_resources_deactivate()
>   to enable/disable resources.
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 28 +++++-----------------------
>  1 file changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 05f5705b0319..0ddfeef6d1b2 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1160,18 +1160,15 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
>  	disable_irq(gi2c->irq);
> -	ret = geni_se_resources_off(&gi2c->se);
> +
> +	ret = geni_se_resources_deactivate(&gi2c->se);
>  	if (ret) {
>  		enable_irq(gi2c->irq);
>  		return ret;
> -
> -	} else {
> -		gi2c->suspended = 1;
>  	}
>  
> -	clk_disable_unprepare(gi2c->se.core_clk);
> -
> -	return geni_icc_disable(&gi2c->se);
> +	gi2c->suspended = 1;
> +	return ret;

Both of these functions can now only return 0 in the last 'return'

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

