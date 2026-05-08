Return-Path: <linux-arm-msm+bounces-106650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENyRCVbA/WkpigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:52:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BBE4F54C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B5B530566C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F413128CA;
	Fri,  8 May 2026 10:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqQc37Ew";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlYlxT9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B72B30FC23
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237428; cv=none; b=bmSx2QLGI36RytT5JSFl8Vz5gXwprlEIuQRSTUrX7bkA4AozGEYgAbWGGUQkxMdpQUTJsAgfTbo5mbBsI7JBQzNMHpISlw7v/IqC7aohunhMdObVkL4w59G9LTEI6wapxZi2uhqDH98nwqIX9unSGrfJTXiNHoox49n5vIwcl6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237428; c=relaxed/simple;
	bh=zZHfs5GqOlJsp7vaK+kGmAuoRStRuUS0XKmyUHWMTHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qA6a7YTR3qIjNYF1TessZrwwT2hZi3DhA8HiueBDW1YJJGDuxziRHtg4b5gFTRYXOyXsifuZ5s5yBud9oyXShkpMzvjLFLvs6RqOEjPFaOiz1qtvz7PWS8NCgEjSDlnZ0K5uBPsWJcK4HL2Z9RLEQDBaMjO1hcrzvGdyY/JGMsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqQc37Ew; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlYlxT9H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6488Ffj22384216
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DNE6piEGw2lRb1belq5Nv3ZUsROE8WFEZUcH4zeiyaQ=; b=MqQc37EwecHG7oGF
	IpmZv33ZQgAvRlqBF0x943IizNMaoNFy3t179oeKdRLjMEOXNEUWHm6Od7xC/l8Z
	H4qVdCcfglgTxhnvh+g0wG480kdcUDlVqjrZe54QJBhI/yhrLWI4DycVr4vLHqnw
	QL7sJq+vGcL3z6Np3zywjegN5D5ue0692cuX/jS17oeD554a1NIHtTMc3xhnwmxi
	bdrDVCnxrmTKe5oT7KPrtZAJ5TAgS5y2YlTFWlc7cknkJ91Q6JZWY1WkNaglWOrk
	QF5ry7eOXpK9UmZltHqC6Ne0Xv9BE2G/U68t7SZPdkNF6oImACQ/MCJdjTzgQ7ep
	5DLh6Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwukqdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:50:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faec938fcso3139071cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778237425; x=1778842225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DNE6piEGw2lRb1belq5Nv3ZUsROE8WFEZUcH4zeiyaQ=;
        b=OlYlxT9HxOfoq7xEnDM0nkfFrvIMOVKs3FrW3qm5wDboTZ9ZQ7wiYvrsxDySQSfetp
         JzocPFab6AU5zyUGs7oYGVfMC1qKhUCa+tXfdT02t5Pm5PhaZ1MgEsegkO+S+aw2/0lH
         GxxX2HHOpgoFWfVWK1rPzYFdiaaor5cQYFWLcKNUVgsi7eahFhHr5O6YL8l8R8MHtFSR
         sgaqUJCtTjcByoeskYDT4eL+UlVm7LdLZqDvg2Xfv4MwDtcrPCoOTmRzKRIqOaSlcTAU
         fbyJdwlOy0BcPWzydDvUIYfrnKyUXvrM8hWhbaBsImzxSE5z9OgIW2sAXIWu8Bxio70M
         rrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778237426; x=1778842226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNE6piEGw2lRb1belq5Nv3ZUsROE8WFEZUcH4zeiyaQ=;
        b=krD/qmje19Qbzvaok1jIvd+cYxiCSacLYw5SZ8uPmFzEd8kjS4CIu6UUnTAwC4joBT
         OIknJfdd7mNS0xi3ngQ3nmkEL2GDzrc7JlrAS5yjenCaKwMBZMSAbYWt90EzbW1EGARq
         gGXLYitAQaKHAYCae7wkerJLOeOpUK/539+g2Zaj3Dsj64y+s38XFsQMB5ncnsUGj//K
         lB9BeejYZByDFsfW8xJ9KA1/CGzNpJ+PUZklnfQpmCrHz35uo6tQBCi3mn+8wK3ejVsS
         Pp6I/l+BLFVFmdNstj/VoUySOc4olnpnNKYJGW9zftlbtTgPz/WczE0EkoiGIMffyQlN
         k7Og==
X-Gm-Message-State: AOJu0YwcmNzB2no7PaRpeolUR7iCpZgfBWpJ2Mw4jpiVW4Noo9VcLcxY
	/cpAJZbQkBBCbCAMvXMnt0DtpHxp7OWyfBS/X6pIMDjQbofuBlmmVfN+GDvxGt35ocDHRVgOmyj
	dcvgjPEHY7K8yRmxx3mK5aBdmNaPM3Bo/a0uSGRClh1m8iYB11/cyVLiuoc6pDkOj/WV55EfQsj
	yd
X-Gm-Gg: AeBDievUwaEeepXgECCv5tRmscxtUV5WfdKTsITvuKUqaQSnDU6YQFjr1j9Dv+pTZL6
	vMFKcFoaWGvnfsvjQQfv/4RJn2BjXeaTXYYZO5KrSFI4cRDTHf7QHkr8laRcpVwcxJzXmNNTyke
	dK276TeW5+kaxbMKyoEuhjz6TLC7+cvxusqQ9lcMyxvoPwSFTgf6hUfvauWNBZi8f20WG8JAHr0
	nYdKtGU4z2I/8W3Pn15m3eF3762/8mDoGvfRMgzw3MiI9t8k/TZzAo59NBBBOUpwQCgin5XEALA
	ZDnT+by2iVo4U4yXdO5hKKCj6lY7d3ml0hz/SNHhwPMlWVsWxbbaidjEkGltvWDTAchfz8RkgS7
	G7A+0X2ZTb0wyEbR5zdCD/JoYDkejP0BIxcwyUKbcvRouSfZtg5p2Z6JH40oaFQXwfcmA1l5m7r
	B2k+qJKDslg+cwAQ==
X-Received: by 2002:a05:620a:3722:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-904de77ef5emr1198221285a.5.1778237425525;
        Fri, 08 May 2026 03:50:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3722:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-904de77ef5emr1198219485a.5.1778237425036;
        Fri, 08 May 2026 03:50:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0dfd367sm514456a12.17.2026.05.08.03.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:50:24 -0700 (PDT)
Message-ID: <c0def708-4d95-4398-8a20-8d4a7533fcf1@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:50:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM
 property
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZHIR6v9jizVHl1gLVGgxwfrGm8a3mUZ3
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdbff2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eJ65ZG8ybeDIfqJBo1AA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMSBTYWx0ZWRfX9pShSBmhYOVM
 Qx/G2tHwsFU3B4bTphalq4WR7yYaoViijeLFVh1O/9cNY8FFRtUTneVJq7iopQW72GJXXf/o5qa
 3tx4S8bkssr+iAhroPPNlu3koVqkBqY7N8MHEyJs2mhSm+7UCWWUdgMv0HBiv8G5FAZfUssOqrx
 yd/ll6WYVkD3rt3Z2tpnhxYvIVRFYFA8CYmlJSJ7iUa+JbbtGOV2W8gFcSfaE5c4XZ5u9Fw3Okb
 uoSrrLwefOYUKcLE+1ISop6ucVQqrwuhgv58/vzUofidC2m9RaVQTPYSrsNr2k8w6JXkPwEKTZY
 JTrpg/DDLETWf21/KBlTWEEv4b7sWLtTL3GfoASTMY7N6kkJnrbfWpjOE2NCfD6HXZbDBPIAYqE
 faWjVa/oEjeAmEHBb0E4XfcJiBpMkfdweCkcdL1ThFNixI6s1itaGoW57G5ByOHqQoMakXBzZ4V
 RW8qwktiN0TV9LGN8Hg==
X-Proofpoint-GUID: ZHIR6v9jizVHl1gLVGgxwfrGm8a3mUZ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080111
X-Rspamd-Queue-Id: C4BBE4F54C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-106650-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 10:07 AM, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
>  to deliver it (USB upload to a host, or save to local storage).
> 
> Add 'sram' and 'sram-names' properties to the SCM binding to describe
> a region in always-on SRAM where the minidump download destination
> value could be written. Boot firmware reads it before DDR is initialised
> on a warm reset to decide where to store the minidump either to host
> PC or to on device storage.
> 
> Most of the Qualcomm SoC supporting minidump supports this, added the
> kaanapali SoC for now.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index 7918d31f58b4..6813081fd74a 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -127,6 +127,22 @@ properties:
>            - description: offset of the download mode control register
>      description: TCSR hardware block
>  
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Phandle to a region in always-on SRAM used to store the download
> +      mode value for boot firmware to read before DDR is initialised on
> +      the next warm reset.
> +    maxItems: 1
> +
> +  sram-names:
> +    items:
> +      - const: minidump
> +
> +dependencies:
> +  sram: [ sram-names ]
> +  sram-names: [ sram ]
> +
>  allOf:
>    # Clocks
>    - if:
> @@ -229,6 +245,18 @@ allOf:
>        properties:
>          memory-region: false
>  
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - qcom,scm-kaanapali

This list will grow super large - like mentioned in the commit message,
to list almost all platforms.. I don't know if it makes sense to limit
this. Krzysztof/Rob?

Konrad

