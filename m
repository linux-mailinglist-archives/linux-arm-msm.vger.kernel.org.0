Return-Path: <linux-arm-msm+bounces-104415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PfNA7E+62nFKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:58:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A917245C9D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3EF43015CA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002E335CB6B;
	Fri, 24 Apr 2026 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mp8vjZZn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/XlAD5u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5732E35B14B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024681; cv=none; b=pDgKVcskil4KasI2FVTOtRNNRnzMBJNriR0XIYZjhXis50/IRXyDix6hykOoF0Am5/dLa/jDNn/r/HXNv2vGcQUW1c0AghxyTdKgncyQ8a2Q0QIomSwas8pvaVa1EEZLE0RnGyOilbnuYEBGqqq3O5iPXYgR9z8g5ZW9wLenCt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024681; c=relaxed/simple;
	bh=J16O8mbX3f9+o+eGZKWTF1OPBmq7iglLoR6+YzVSKUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+r3gS1J48TR/DgFT3CVROeVO9sjun8ctXd2DTzgbQen7pc/1HyH4ZBpSfZDIo283Ti7Q+OOamb/lqDhQASO6W6RFYnmPrNE1iFt4FhhgXkvNV4pkftyWAZkf34XnwiqbzshiWBoKjVLOBHwhRznqNpLAulON3FVQJ3TKE3hOJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mp8vjZZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/XlAD5u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9NiCO1533461
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1g1GhXKxL+7LIrhpcf0hbguoDNKNxB/noTFJ4NtJis=; b=Mp8vjZZnMucCsJqr
	XP/3Hg2eZa/6abuUttAMRfM9RLhaNqJLrwMWLmjTUztFK0KNgTbNjv4X5pWWDsud
	O7wqkIx3pt9lTHqVucLKydA1s4vBEgbCz4zm6eXovEOtSTtJZo11ZiYNAnvYmkQf
	zAjf1+8cQQUJZcxynF5j6BV0bNagnyHKh8Ek0h/5+B98qs7BDiQLxgAMR26n8Djh
	KKToFbWm1LwmMg2e+M4J3hBzcCsqtkN70DN9c37RNt3IhSA/QbbZX3C3o3KGz8M0
	xO/mLeOZW7cgWwrZXkZ8fNyiBdJ85RN1OldUpY+ba9T0jKkbaLNVfRmeJFqk8gR5
	mDKWzQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26kg8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:57:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eab2831ba2so104189985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024678; x=1777629478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M1g1GhXKxL+7LIrhpcf0hbguoDNKNxB/noTFJ4NtJis=;
        b=J/XlAD5urAnNH4G56RUEOEFMaHO2S/rXjKeqPlsOujqFzU12GHWgs8C3BxLILz036m
         cImKqYVyV3YKm4iIBz+YgS0T/hayPky/rpYo/1XJsQ3bkl/o3DQLWXKVu2mg6Y/nHPgg
         8iKp3XLpelErm5pGno8pxX2oAUZzvo2IADr5fr35adLLUy61sbKxzQuf73fg6zs8yYVa
         6KSqlRh9sWMyIqGb01CrgWVz+RxpjdW5UbGx4s+tzJ8fr5uavrmVsCZoJpN7O8sZ9W9k
         BdREHmZQoQqaeg7vpIYMsSb51BCApFj0IKFaPzKIMG3Zl2FhokwMGByDTe3DC3Nj3FXN
         5bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024678; x=1777629478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1g1GhXKxL+7LIrhpcf0hbguoDNKNxB/noTFJ4NtJis=;
        b=dcvTr0U9emqqUFtLO97fSfOJOE/P6ncr1reCORFaXgVKXr9zeVB6oqpgBlL4jt5iv/
         WZP94zSTsHt45qTcuqDt0oOLfXPRqLlMG3TyhqZj2AaGFobab5aiEatolg9bx2vTwIoV
         y1BFv833hFasTlU1gIg0SFsquuih9Pg+6fWbHkQw587lF2GyZH+AsL/+QIEQXO8D9+pv
         JztjVNIcRO48xaxUChIkCva/ZYHWuKTo681fs5RabR1TB9hVj2NN8+XFn903SpjThRiQ
         +QJLTntB8Nhq47KyVUCnmmVzn+Mqp0lPmL6NP/kAfE2f5wagblpAVxed2GBq04wJWsJe
         hwPA==
X-Gm-Message-State: AOJu0YwzSy4sMKbb1uGN8lfNp7U2cthmixoehRBLSdslw3MhBtd79c04
	iKBevGLTWBdyrYFc7BhsZIn7fMlKA/TwfY2mzNFN50poObSkazBPIYKQPI7bhmaAzbbsrAuk/jS
	JwqLvp+zwIfTy+uKoGIQbpnqy8DyREfTkhbhNRcIPlDgeMq4AuTUHcq5zY90m74wcMFys
X-Gm-Gg: AeBDieuMv1CY5Wdrb/reulyPqVIIgsajS/lRDpwNoLKIXt7M6Ujb5DNy3YBfWcyNKL2
	tqKRnk5E5HAzC2bzg0KVBwEh6KiDhLT9+y+iHFMe+Ynu+bY4kg54E/KPlA1I7obpuYv9XGXQU5r
	rtzdSZQ5buMDxP/U0h57pCj4NIcUESQv8q30DFRB6sbmOgOQpkVhgJDv2Mvemg3RUM91x+UFoUq
	LKYiWKA0hF34UO4ZmsUje2dVbDY92eXUknZbhf0nNrZpS6E4hzmah3ADFYD1d/LdX172+hG/fr6
	UDsEPqh+kM1QeMUB/eRqb2Kxeh51tAhaDSbab53zHktt03WuHlpI8wwCQ+Rd0QNT++P9lOAp6uY
	WJyLLc+KxZ2AlPq6ipOzpD86Gdfanm6ByBiv6xgEO0/zwSkpm2x8hV2ywWcGdzCD3grx0XFsDR0
	ha29lc8gB8eI8IJA==
X-Received: by 2002:a05:620a:4408:b0:8ee:91d6:cd34 with SMTP id af79cd13be357-8ee91d6d432mr1427460985a.3.1777024677654;
        Fri, 24 Apr 2026 02:57:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8ee:91d6:cd34 with SMTP id af79cd13be357-8ee91d6d432mr1427458785a.3.1777024677271;
        Fri, 24 Apr 2026 02:57:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe836sm4861717a12.3.2026.04.24.02.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:57:56 -0700 (PDT)
Message-ID: <4ac1d868-8b78-43e1-8a3b-66526a5e7ab7@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:57:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8450: Add missing CX power domain
 to GCC
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-4-4b6e09d532ce@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-4-4b6e09d532ce@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7rtgqoUvyOQb-dj3FSRjYZRI6wTU-6UC
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb3ea6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7rtgqoUvyOQb-dj3FSRjYZRI6wTU-6UC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MyBTYWx0ZWRfX7j7v03fw9+/m
 6no48mdUYXvBDA5s7uUPhTf5u/w0F1bLVQ5+ey8Sccv7f2vGNCtCP/bC0bCM/wrpBdEGo9EJtLD
 4ZNPd/5v0YpEDsRFgdbnfS+SMhTBANL3pH7Etv8uY7MfEmdOV5VEGpEwL8AGxvlZX5JWix2EOlI
 t7RQ3ZrDfQUle2ypvBv6WQfhpizBwUrxBHeKn4Y7YH9LN9Su80+ctyQvSlR0/1jsLwkN56C0lEn
 D6bszR4fSdlL9k4vGiJoDNAZ0+sRIucWGh07JjjWVjAIL80u7vfya357pjWn59WzkpxZRRZYDTd
 aykJQv873WKEgzW156WUOH1N8/OhAYsC9Pc71S+f3J4BuvRTBCRY5yeko2avY4b+euAgN8PQAwh
 EfIdCy0eRAe0bTzEF4e1YvD/ctapFHgl9Pwi7VWOmJmn2Ygk2+oNkuKakx0nd6fK8NKw6yvdgL6
 UDDp1Z3FDzM0wk+A1KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240093
X-Rspamd-Queue-Id: A917245C9D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104415-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
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

On 4/24/26 11:07 AM, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: 5188049c9b36 ("arm64: dts: qcom: Add base SM8450 DTSI")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

