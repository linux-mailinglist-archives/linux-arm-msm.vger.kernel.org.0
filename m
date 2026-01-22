Return-Path: <linux-arm-msm+bounces-90266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHwyCwSMcmlJmAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 21:43:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8216A6D801
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 21:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 845B0300184E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0AA3939B0;
	Thu, 22 Jan 2026 20:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7ZXMa3J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1pA0V1E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4C127815E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769114559; cv=none; b=UJE9Nb8KAWZEBodCUiqQqvdE/For2UC36Biwz7xXS/7YDC0fwOJ8lPvlmcJfp4j/GmgvgdDNyJtajavrXU5dlfIPiB0l8M2YykkA+r1O0l2BxdRh0hOF67ehXyEM78vwbj1HrVQJPaMRkpyrRS+jspkSv7emZzHOKNYWFm9+gaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769114559; c=relaxed/simple;
	bh=AS36P5MO/Kxh/U7A13lJjITsHCMAjaIRsOLQhnSPn7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKzuTQDE8IUjb25Kx+lAbvk/fWivh6fAMFcGziZGDpib6UVFGEY6zysGrQWGg2SDfo54hWcfhsn+ghVtBemS/EFjdPwCoKnFL/7fJXqRaRWXlxNo2qLe/TRI8ajPAfHNTXtubAsxfDfVR5mbxoVTDE1Rxy16v+5TIE0spxQ4Jn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7ZXMa3J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1pA0V1E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK7qBL3610773
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	me0aNI4mMyLtzynN7Ng5NC3nt/AQTmRsMvXl0A/kGWU=; b=b7ZXMa3J5TEjIsof
	lIyIqMXcDqE1YU8OjgTRLwO/MuZlBxxwuNWSW8JC17dPJUZV7OErpL989S5QHtm9
	Wdj07vI2goFzzXuvGpLPCfSVIIFTncDVAvUYjw861I9WU56ZefQQ2CzN6IU4J5Ax
	pRbYhrBoW16MkGT4YFTDs50UNmHCITWZKI7ZyQYu/Vm8XMxcY9vcoXTNTPHZLmma
	vzkWevEv7em847wfsGFMISlnB9bgHUn+iWNkkN6JhcmuCc+XACoDUs+6rEaAkLct
	lgamRD8GlJ6ob5BDdZxXJBHPr+BWK55WzlHCmO4i8GUaCZT9rKlxnAVnhwhxL2AY
	3HShsQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pj47rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:42:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8888ae5976aso5254786d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769114549; x=1769719349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=me0aNI4mMyLtzynN7Ng5NC3nt/AQTmRsMvXl0A/kGWU=;
        b=G1pA0V1E7WKD9BlcOm9BKF9ham+k/vwFxvtMIOeZLegJnR1TMIEIvVizOqN5Q9Wyck
         wu9GwjNE4bYGq61m9Mo6acKBMLFI7rTmi9ESiESSzPE+Oa18VGs5hlJYtbgaM2mlZAty
         bOOCnAqJr8JN3eIjbFLiWYsxlf9aIorOXWYsvXRWljWsDQs4AiSQYbye9U0KpdkeX5/J
         6cMlhgPkcTjzdhPW/YQfPz6FHfRHFc9b8D0c5oEHIJE0fvkGrvm3qYk1msY+JUspZUfH
         ftXUApjuBADvvunzltqrqVFPIPaK2Mhrv21e0VAw2pxtVfzpJalSP45Wk0aKNUAEMFoG
         KGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769114549; x=1769719349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=me0aNI4mMyLtzynN7Ng5NC3nt/AQTmRsMvXl0A/kGWU=;
        b=o1y4ZSwcIrc1qj+q2eTXfrmAwaYumlPlLL4unihiyyiNkYXVAKn0JTaanO21C6J0ym
         qJnE434BOmrKMXmuj5xpLyXMPhhyymcgVlQ0nyGwFuHD/FUo1BnbTdfFlNSkskGQYpca
         9ppJrTILdAfq3BSeRTFOHL3F9Zq+C/QRjfjJPwL64yfZBZJOYXxy1tqTc3pTHcRVatwI
         yoQoNubicj8CZvH6CjnVwZQ+vVQRMexYRvG19fUC7MDVsa7JOxR1Zs8LM5ZJPHxuNv7i
         T/FtOsyH9GWK+mDiRmW21aZ+jpi3xdHQHmu5lLUKA5WAjArvR1Xbh9e1NJlJPAZnxDLP
         Q55Q==
X-Gm-Message-State: AOJu0YxE2PvixcXtPNF/o8aR1klI5jMKYl9MF7b8LqgvuaPhRyMqkC8d
	4+sX09bUbhkkQIbMqwPPkR3M2TUhMgixilVkl0e+JKUcJA7Lgny+pHTBybq96L1+BDcbGwSHqNx
	R9gQH1aLh2PxMa7ahi4CUAL7H0VjSOWXZyg55WM5TbwqsFy92opdVeVtn+FjW5zROlqFsFaDp3l
	Mn
X-Gm-Gg: AZuq6aJ+81Lfjq0ciDbjRI4IPpvnqoDZTHycCuZKA2d0k1syvsxOWlxX3QM0AZtgtZ3
	KmBdAU0zs4eEWAElMNjdLB94HrV4XLw9oTShtD6ApYMmq1n2EJd1opoU+XSaFgVcgyvhgjU0JJQ
	it7SomjcDHOREmO6nRuBShlms7tlcOO782DcsgINKGjz98I8NfdrCr+PPBeD54oCJZgIJdP3fbp
	z9QYmO4BAgK1kkME/V9UjABwVMsA8fQ/RP++aatUExjnqQ9kPXBAZzW2dvtLicfTs4tAxWJEu4l
	gA0NA8eyjCvp+MIyycvYzdszQCqq6TkcNnvNcVib7BpHNBFDDPGwvms8J/RxDrAChSQuWUlCdGV
	b9ZuuWoRgtccoX22Un7CVbwDQYXt6qWQmAyWcDcAVCf1jlzytKe0xGXgmvhZzBKQBoPk=
X-Received: by 2002:a05:620a:3199:b0:8c5:3699:97d9 with SMTP id af79cd13be357-8c6e2e24e58mr76816985a.7.1769114548638;
        Thu, 22 Jan 2026 12:42:28 -0800 (PST)
X-Received: by 2002:a05:620a:3199:b0:8c5:3699:97d9 with SMTP id af79cd13be357-8c6e2e24e58mr76813485a.7.1769114548114;
        Thu, 22 Jan 2026 12:42:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b3f6ff8sm194246a12.15.2026.01.22.12.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 12:42:26 -0800 (PST)
Message-ID: <ff9599b4-85d7-4503-b8b4-41d35a7d7584@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 21:42:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: glymur: Enable Glymur CRD board
 support
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <20260122-upstream_v3_glymur_introduction-v6-4-245f408ed82a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122-upstream_v3_glymur_introduction-v6-4-245f408ed82a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=69728bb5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=xIsHbWxzb7IypilI7YIA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE1OCBTYWx0ZWRfX/iAWUYMwtsZd
 f1WmHaBzbVNj0P8ZUAyH3G2CAUMBe1cgEmBbvm2NYeJXrzD0Bar2Dv2XIodxsmZpzHxJwyiN2M6
 bq+HxlTBjSaY99kdCd3f0GrD8MpAfyAB7cc0QjWOzrpQeHP515oSZVN6X8RfxR7qw3WCPrWZh86
 2mGbiGlNYUku5ZkHkzOE2uqB6mb2Sy+5MyXN5BigwHwRF7sqp92T6GqmgujPaZdAxaeSYNL8pfK
 D2AmnbHdMs3qFoKuEBMQ0wJFf1J68Vyk5IjQAXr+ptJZjOd4aRuBPdAoiW3chHdg2FdbX1TpILX
 BKYYpE8KbYPlmAfaCpAjmhBji002fir2YBn5NtdwKV74qzl69RRGk9TgNpk5++S114IDa66KEUy
 fooyzgoJTinn7LXVhaPZAw1zvhcaLEkEwBPPl0fvlJEo8FbkGNfiZ0iWWsuZ36ZvQ9Vwuh4zem7
 1i5H6IEYGLkqHSAcg4w==
X-Proofpoint-ORIG-GUID: HvGlI4JJnGEGy-UrQuXpruG1L7HWk_v2
X-Proofpoint-GUID: HvGlI4JJnGEGy-UrQuXpruG1L7HWk_v2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220158
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
	TAGGED_FROM(0.00)[bounces-90266-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8216A6D801
X-Rspamd-Action: no action

On 1/22/26 4:24 PM, Pankaj Patil wrote:
> Add initial device tree support for the Glymur Compute Reference
> Device(CRD) board, with this board dts glymur crd can boot to shell
> with rootfs on nvme and uart21 as serial console
> 
> Features enabled are:
> - Board and sleep clocks
> - Volume up/down keys
> - Regulators 0 - 4
> - Power supplies and sideband signals (PERST, WAKE, CLKREQ) for
>   PCIe3b/4/5/6 controllers and PHYs
> 
> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

[...]

> +	wwan_reg_en: wwan-reg-en-state {
> +		pins = "gpio246";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> +
> 

.git/rebase-apply/patch:624: new blank line at EOF.

Konrad

