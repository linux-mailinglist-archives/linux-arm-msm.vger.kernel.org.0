Return-Path: <linux-arm-msm+bounces-113085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wQgfKwWVL2pTCwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:00:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A64C16839FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:00:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NwdzT6wV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KeKLWUNd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113085-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113085-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9982F3002508
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AB33AB5DC;
	Mon, 15 Jun 2026 06:00:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B9037648F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:00:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503230; cv=none; b=Gn4AQaIZOq9XHwSmxX+w72TOdrj+iPGeu9+faJs4nQHSeAh1JTNJswKi2UKmRZ30hfiJ1nZK06+RghvNEftzn6DuBe61gcr07tHSkCeSdCWxh2lHFz0Tm/lY02cTJuMDr/tynJjrWdw8/SbnvD4a/S6Mxn/V/9ibds1s1CY6BxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503230; c=relaxed/simple;
	bh=nGxWKW29W2AOH9Ky6bfSCGDBZeSZKncm4gB/k0IFftY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYGxIikaADVA0g60WBM3ETiRdYQRmoN63iK9Mv15LXN/CMxIwPN5w8QxRQP1sYimN6jhiHCwyoI+LK3QnXGatHGsYa1aVjMbqMTtq5A0JviSz7YmcpRwW2yRxYV2MyhuHREuv3SK1pPfavMprvskRzfkJjMReICoyv8y5QIn5uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwdzT6wV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeKLWUNd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kaG93287316
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7vJFgXBfX8hCngXnHeKMpasfyiLgstCWDgdNuIMGu2Y=; b=NwdzT6wVhr8wqnW0
	iWoYkRcefGrrbfVMcfmgzXTZSv9XLheXZRPxHPa5sT9qQFnDOSYBX1ZKQex8AQhx
	rbrlQjzHP5IOFZkQJUEo4oCwFukGnF1/3DzikNBBwrws7cJQLsZYTm0jrRoTPVEp
	75sevAWXOgQl9vp24ggILJG0SbD5pGuHaSF/UlUoQwA4zkYEGYZ/YGHyL56ZEhpW
	LPGpvJtC4tM5p7Ox4cUie3HGFjFH+OpQ67INlJ3EQoesU8JfIRwo/DKfioFvswHf
	REGW7DigduKYpuiHfEvMRQHeBM0u03S+7YiEL3dptVB3kklI+OxhnNxheqVwKIVO
	vkCTog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wwsex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:00:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915c364ae3bso596370385a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 23:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781503227; x=1782108027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7vJFgXBfX8hCngXnHeKMpasfyiLgstCWDgdNuIMGu2Y=;
        b=KeKLWUNduZscqlq9G87aQD1O4v8Uu0kveEJ3XiBr5FQVlBjOcvNqCyllSkuwkntNKU
         DW+EtgFjX65kgWskKOEsj6Di8EhnWd8JFVf39kqx2RTXtG9i2ERnpFjDsA7DyclTamva
         endkx1vUsqY1L6apOoj6T4WUL1uPg+KX9+GTwxBU1b8QCKLu4Ju4lqpdLcprU/9ZCnvX
         XSmH8vgzJlK2Blmz0KgltCEda8juzhIvn33U/nLhWu4dL8tQ9K98lQTNUMZ+vuhsne2+
         oBXqbzZB/07evPKfxTLmTdEwzE4RepgkuW7fnlhus/L2y9H9l8Fztoej0Aiut0DYcTpT
         hk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781503227; x=1782108027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vJFgXBfX8hCngXnHeKMpasfyiLgstCWDgdNuIMGu2Y=;
        b=iyV/eHg6269wp24GmygT8mTJ/bGsDYm0rP1qd11Z8Rb9TeptJYzpVp4lOG5w0OSclo
         Ch51X0bV+tC1KO4/TqTLf0DAAs0HcMY6IJA3ZCx3nuKwHFxDykGvV6h2uzNdoNo+/0Uj
         UOW9W+54DM6HEvoZGHJhZquJI6QIK5Xl02HPOPFf2z8R6QlJloJ7Brc3YA0TXx916bX4
         6qfEd3hVVY65RtJ3rDX78rBIsP24LK3xKkcoimDXN7IhifrqQP3tx9aaX7V7/oYZjBMT
         th4i3Da2IsEZSCtP24hvmbSlOGLVzkxMw5flApmrb4RZmUojvIdok+Z5DYhEOvDMfdnu
         NdzQ==
X-Forwarded-Encrypted: i=1; AFNElJ90FcYgDAV1ftRDacvSxOBMbQPcvV1yiYVrzhDAfstdCK7oixbNskenIsrG2r6K1riL//9QrXgoOJzBn96B@vger.kernel.org
X-Gm-Message-State: AOJu0YwB54XPBOvAsnwgxL4JW9bG0UZjuKpj8ccO6Z7KdnunnTDCz9Ut
	j1odo7lPtdXU4/dk0c8Rk2CV55oPSIuTNLz4uOo8Ac0JMD+qTldiIrRNk5yCXWLeDBm9Ebc9fmP
	NnDAAYh8VBBtcFGafQCp9E1GXlfZQfP0OgfksezFjL72VJqm9KTOo1bdD02LJlrtbDOOx
X-Gm-Gg: Acq92OFf6fB5WO7QDVuc3EzKoaJN8USdHKod9JcRWrzSGIFva3K74+x5r1+bIZnMrQS
	aW3P1iD+Hh1nZBYMPPx3WoqDBpdb6AjOcAh8FMdQsf4hfL30gLl6HMgZ9iYza6o9UqfPJPzUEun
	gc4XesGEQnPY9ibz5QQmeFNHdnGx5kvU8KEpdJ3DpkkpaqpYJ9NJOZNqY76OAWX6fOLnYvYgQK3
	jfC2dOIaKA+naGlnWDnh8wFw4Khi3MdbSyn9nXsxZzbC3v5130DLaC3iJYOz0tJYn2eQn8DoJyJ
	07YNnpdvPyvCWBydQ3/RDS3qf6m9xqj9n5jqfWX7u2Wwp6DK+mEds6aKKFrj2K8h+3sTXt5GWq+
	x39MyHuXFSHuhjXyhv8dhNinRA888u1OHhnnb7ZqcpFQQ1XQi8zkhl/ro
X-Received: by 2002:a05:620a:6312:10b0:8ef:1157:6a05 with SMTP id af79cd13be357-9161bc5a818mr1340000885a.19.1781503226361;
        Sun, 14 Jun 2026 23:00:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6312:10b0:8ef:1157:6a05 with SMTP id af79cd13be357-9161bc5a818mr1339993585a.19.1781503225780;
        Sun, 14 Jun 2026 23:00:25 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693794aec29sm2731556a12.28.2026.06.14.23.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 23:00:23 -0700 (PDT)
Message-ID: <21bd4a12-01de-4c4c-a094-a39c330a4b1b@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:30:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <5YTsRTMAUGw0it3GAWHhKIh77_Hk823-xRJ4WxzQ-ENpdnC9-ttUvWhJI_CqFEetmFXcRel50GK_o2UMGzwZmg==@protonmail.internalid>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
 <f793c665-ac99-4afe-a64b-bbd6d40044e5@kernel.org>
 <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
 <q3sr74ncqnmzsjrd6jdbkpplxpnsnifhnvxsdplvogr2kf25p3@taadnzd2qrcu>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <q3sr74ncqnmzsjrd6jdbkpplxpnsnifhnvxsdplvogr2kf25p3@taadnzd2qrcu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KY-14A5OmswFy0D-gJ1Q--X1cVYeNykT
X-Proofpoint-GUID: KY-14A5OmswFy0D-gJ1Q--X1cVYeNykT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1OSBTYWx0ZWRfX7Eon1xGGtprw
 CQxmRb81aUE8hFyLC9No0okYrlVYXlSoWysoYvKz6PRQHwIjvyo3MWX1hJ7ljkSQyMky6QKB9ec
 4XjqjnLC6WPiEQQ/o1CjtvPrVowJU2Q=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2f94fb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=1BxbLvcILuCGMxPr/bnfdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Qmn5Ufgt5HZSozbDxzMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1OSBTYWx0ZWRfXxLjrdNc9smNF
 cUSxPZCiI9vr61NiiVDQuVjOYieIXaQTAcaxsOG/F529J54PMQ/e8iHbFFtpEj6wPCKutco1C1X
 C44jpeNW5o7A22DC03P6B7rjFnddFxvhge87CHg/yoKERnI48QZkMSL3q4DJ+yr6iQGpuYrYj8i
 VAvJQAa/r0AWF4/Naj+fRQN3PI06wZu7X9YbF0CsDEVlUYXsqcXX249VLA0+XB1z0+1ijYXp+MK
 5pssTAWWwsPwdwt1TWnnHFF58GWMwx63dkzyxOLyCHfgq3DGB5ys6eZOgNAXM16HfTwzh6RAq37
 hYhVbOOqYjE16xX+XVSt09aVKlqyBBgBzXDP9qyAbjN5ve6aFhnHOl0bzCKHVI+jHcS9+8Zmlnn
 gmUWDTI83wPO5xWKT2fqS3Zh8fJv3h6FZZDjkQj4AEe4mdexT1Z0Gi2w0fBdOxxAEAN/zJXo/OI
 fFBcM6W8hnT3nV9p9rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113085-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A64C16839FC


On 6/12/2026 1:19 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 01:20:59PM +0530, Vikash Garodia wrote:
>>
>> On 6/10/2026 2:07 AM, Bryan O'Donoghue wrote:
>>> On 09/06/2026 17:15, Vikash Garodia wrote:
>>>> Document the iris video accelerator used on shikra platforms by adding
>>>> the qcom,shikra-iris compatible.
>>>>
>>>> Although QCM2290 and shikra share the same video hardware and overall
>>>> integration, their SMMU programming differs. QCM2290 exposes separate
>>>> stream IDs for the video hardware and the Xtensa path, requiring two
>>>> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
>>>> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
>>>> and Xtensa isolation requirements, such SMR masking is not applicable on
>>>> QCM2290 platforms.
>>>> Since shikra uses the same video hardware as QCM2290 and shares the same
>>>> programming model and capabilities, it is added as a fallback compatible
>>>> to qcom,qcm2290-venus, with conditional handling to allow either one or
>>>> two IOMMU entries.
>>>>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,qcm2290-venus.yaml           | 20
>>>> ++++++++++ ++++++----
>>>>    1 file changed, 16 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-
>>>> venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-
>>>> venus.yaml
>>>> index 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df
>>>> 100644
>>>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>> @@ -15,12 +15,27 @@ description:
>>>>
>>>>    allOf:
>>>>      - $ref: qcom,venus-common.yaml#
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: qcom,shikra-iris
>>>
>>> Should this be "iris" in a venus yaml ?
>>
>> given the vpu core was first enabled on venus and now it same core on a
>> different SOC being enabled on iris. There are 2 ways to do this
>> 1. Add the compat to existing schema which defines the binding for that core
>> i.e existing patch
>> 2. Write a new schema (or say duplicate it) with ...shikra-iris.yaml, but
>> again, the shikra compat would fallback to "qcom,qcm2290-venus" compat.
>> hence even iris yaml would then need to carry the venus *string*.
>>
>> I followed the first option.
> 
> It is a correct approach. However the block should not be called Iris.
> If I remember correctly, the core is still named Venus.
> 

Indeed. I was wrong in associating this with the driver enabling it, but 
it is much better to tag them to the core. Will keep it as 
qcom,shikra-venus.

Regards,
Vikash

