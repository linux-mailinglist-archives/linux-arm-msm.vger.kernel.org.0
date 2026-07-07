Return-Path: <linux-arm-msm+bounces-117231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e2G4JqTHTGqjpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:32:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3006C719D18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:32:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XIdYgaNr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=csGRIu6O;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117231-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117231-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6107F30ADC13
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16614229B38;
	Tue,  7 Jul 2026 09:25:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA5D2E2EEE
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:25:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416354; cv=none; b=bqssgekKJ2LrG8OF+Ya2IBzV+rilVZAT6nBV3JtY81vv/LpXPjL6jzxzbdU9KdtfzZOR42pa6TLbCyxE8copYnaiSOxG4tc6ZN0xAz6llEelPVihrRM3Os7EvFa1pBJa3oCQXWFTjK2ltmP/SO3KusVxS2p/52OCGLKLRpeEoyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416354; c=relaxed/simple;
	bh=8u5TXK8TOMHPdRbgVUVk6ykiI7ce1wWjUAbPMM7PSNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxka3ZNlId2r1m5U6KC0r07t+IlnLQqSixToixvPmVRF2bcjYLjHlwF0/rIVZWMThC/ZvrTmz1tdgcdo193Pm/FpgromYFXX2Fa0nxY4Jy53Ygvljo55S34dGmIKbYRplcqKne4q7e7NNqYY5tTIdEp+mjljiiocoAKpYtEj/TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIdYgaNr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csGRIu6O; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DiY13243253
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YwwEDgWEuwlmaDa5fWfSopuuNkC1OD8HXfqxYTcIzFQ=; b=XIdYgaNr0+eQbL8d
	rIaqxwIajMkmWM5XtQZVpT+9M2MTy9+N039DxzeRdbXBeuTFsG+BSMsyJ9TN/yLY
	RQPlomap11GJGvVIA88EG/my5sJWZ/EaXAXYsI/sSc8luzZcWYHOoPtGbV65+pJY
	hObbMQDYNPo2lCsVuCCXkJDOISI1QHA2vkdchVkdHry1hiLtm7bbZPS7PW0HjIhR
	wEkxg8DZeuel53oeDkdapO/2f+2iD9o/sBPpvzPEXECbsykNEQXhLl1quPDZTPk3
	2M1bFD3z2ySY17Fvgp+T8GN6doUbBtckN1c8x5aHERq8NrtYND+vb39yec7x9FnZ
	vKQ9iA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11rfsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:25:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6cb57d25so114395585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416351; x=1784021151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwwEDgWEuwlmaDa5fWfSopuuNkC1OD8HXfqxYTcIzFQ=;
        b=csGRIu6OvWUxsiMxE+E4xVx3TE0Ytn8kQq2LjpDRvtr4wROQXp76mPjrjBXTeGridT
         oNRFloCHLssrlNHQIc5wnFn2Yi5p7i/ono2joQ+Hfudo9ypBEQrOG48n70/9QMpLRrO0
         QVNypGftxpDiIhaJsnPm80tQqeBhl/6YOPvgeaU0jMG9OyAOHvAWBtCFxSAioHp4qBpU
         xDK6pBkIycfher2c8FnB+vRjmKq2oo/H8/Gn59ja9PJv/D2L4UdzrTcIgkCczoXGc3On
         V7dmLqESi8NZzrzB0haRV7fJcXL4zICO1MuiHFBHPJ3eVJ5PXZAp4lYsPNU5At6VZdB+
         PlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416351; x=1784021151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwwEDgWEuwlmaDa5fWfSopuuNkC1OD8HXfqxYTcIzFQ=;
        b=R53SHZQB7xwJfgR+HCmLAomykaGdW0eVB++DEnPd8QeWrZdqcp/uRiErpIFwNaCbf1
         SYsHseEhY5riZlt9y/h9UcRsCNdMIY/1f74KKAmIZXo+Hzd378WOaN9yEVujIDpBJnw6
         8/YjpM0xSXyAFTZPqqCT5f/hrbFp0ZKwI+O0ek+7eamPHAGxVdRd7J6pCRJg6v4ce5GB
         RbzcY/d3k/PiFbusidgqKIfmuQEnm1Au1XOqSf7Tprj4JR/6LSDtnmU2Y516GXtUkMv1
         q0FFLq+CqDlzCCP4WMafrap6TpepnivXAO/IzGDULWyvZyNFJ/M02m89pZ+9UnkfOP4v
         Xprw==
X-Forwarded-Encrypted: i=1; AHgh+RqCQ2G2g6KpoXL3pKmuEXo7JAJmG9q6/TF87LOQLcg5FCbWWsWNXiA8COnnfc4jTjnTFeeDWaWpbYOTXLTD@vger.kernel.org
X-Gm-Message-State: AOJu0YzztUo8HM1EATI2i+RJYc1lbCM4zYTKfzhwAmPFqH63esaaLg16
	GQWyzjR8YJVTorAq04tLBrC/wx8Non4dOYzJoCHufFLOkmA5bzuRm7BdlVchhxz5EpZ70bgW2lk
	fd3QGJNoZI8Wr7U7Os4QokM2usooKqoeiwcThx/grLgnm/JqVoWdupAnyRWqKAlchPZi3
X-Gm-Gg: AfdE7ckKgkHfCzvPr9lMjEz95MvpUI0sjxkZg7JhXNm9EeMFmvZp6ciKDXlpHEmZ0uS
	HDzcONsgI9guSjNjS3BoTmzdD0PLmW5fvQEa3S2REoIVGwPVc9rfzfst60DZt9ruBHyRXQwgUU1
	YCZvSg4K+hpWKHq03tf/4jIamKNouJFe1MA619/1Qx1XluO82Iy83gSONwrug1DMCzOtjLPjuqH
	mIp0g1b+ZBWtqq5kANboiOaDv6ENSmMAbNJx8GIA9Vs0JjKgJO4s0OofuCaBli80CDChYEB+3p3
	ET1K2ipfifQAJFMKyVidq1DtP+x0g0ww1lkAAMdMVABkL571EhxqmAxWYnPdL7J4Y4KSFgzLiKV
	fp3dzzOPkMm8jbgA3BUT2KiNjvQeARk1iiD8=
X-Received: by 2002:a05:620a:468c:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92e99e22b32mr1110581785a.0.1783416350975;
        Tue, 07 Jul 2026 02:25:50 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92e99e22b32mr1110579885a.0.1783416350399;
        Tue, 07 Jul 2026 02:25:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bca46sm92339966b.40.2026.07.07.02.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 02:25:49 -0700 (PDT)
Message-ID: <abbb47af-732b-45e6-9a5c-6b58b14b74d4@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:25:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <71tt4ete2nCnQuCLAao68H3X1IjhICYvh8a9Y14WT2pr_opABqQnPif_6w1Mmdw4cDCUUB7i6t4ApGyUdHPdRA==@protonmail.internalid>
 <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
 <14be441d-7223-46b1-9292-fa73ae326ac6@kernel.org>
 <20260707083319.rwtnt4l6so3kdduo@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707083319.rwtnt4l6so3kdduo@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cc61f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=SRwHIEZ_f2MesP5_slkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 8unp1WPAaGXdd_tZR6Clt66NQkDOg387
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfXwfDwE55uhVk3
 rebcqp4sXto6Mx6zKCiLYncNGotxyeCXtmSQQ+eA2zhhLaN3OZjlAsdACl6Q+k5KIMk9IG2FRFs
 sNzkHauMRadpOeyX67Tt0BOyISttKc8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX/UKMwpHHHFpn
 zYrQnW73aisvKK483nCWYoJ6TVHv8bl1w+qOXd4VLGP2EDJ5Wliq2ZCCouMD7NJP8Rise0M5z3+
 ofc7PxOt7k2v0XsKIaUQQ3FgRgJudtNnb6NVPUY8im/hYLNKFdrQuX3hnwpqJdty1lfuzllylxJ
 jmlURfOyYBry6FhQ3zD+h4l2IKzyXSw90/xXHDJE+rQzNcSnhyZ3zsL08dTf+FIaBz6+Kw1mtQf
 7kMGX2k9JGJfa36U1MbQnYfOQ1U0ZTl1uurT1JANBU+LsbJhciA6toqeZH5NJX3QNUXE4K9Fj59
 uS1U5cbhyPV+8asBhNEO3gV8V+7YpxoBJIcnbLqOvO8dFYWM8jaa3gP7276kItN1EPxWVDJ1Iwr
 g98jgaZRZoOSDial/gL0gcKQc3z31zthNJPA3rdS4Q3cqdSsWCawM5Id3akMzKsX5urbMBtOLVr
 bMLb6rOpJtQeg9RkPkg==
X-Proofpoint-ORIG-GUID: 8unp1WPAaGXdd_tZR6Clt66NQkDOg387
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-117231-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:bod@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,devicetree.org:url];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3006C719D18

On 7/7/26 10:33 AM, Rakesh Kota wrote:
> On Mon, Jul 06, 2026 at 02:49:33PM +0100, Bryan O'Donoghue wrote:
>> On 06/07/2026 13:31, Rakesh Kota wrote:
>>> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
>>> constraints in qrb2210 DTS files to use microvolt instead of
>>> microamp.
>>>
>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> You should break this patch up at the "and"
>>
>> One to remove the fallabck, one to fixup your regulator stuff.
>>
> I understand the preference for splitting at the "and", however
> splitting this patch is not straightforward in this case. The PM4125
> compatible and its regulator constraints are tightly coupled in the same
> .yaml schema file — if we split them, dtbs_check will fail on the
> intermediate state.
> 
> I've confirmed this locally. Removing the pm8150b fallback compatible in
> isolation causes the following schema validation failures:
> 
> /local/mnt/workspace/kernel_versions/kernel-checkers/linux-next/temp-out/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb:
> usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): 'regulator-min-microamp' is a required property
> 	 from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml#
> /local/mnt/workspace/kernel_versions/kernel-checkers/linux-next/temp-out/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb:
> usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): 'regulator-max-microamp' is a required property
> 	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml#
> 
> This is because the qcom,pm4125-vbus-reg compatible requires
> regulator-min-microamp and regulator-max-microamp to be present per the
> schema, and both changes are needed together for a bisectable,
> build-clean series.
> 
> Could you please advise if you'd like me to proceed with the combined
> patch, or if there's a preferred way to structure this that avoids the
> intermediate dtbs_check breakage?

This change is fine as-is.

Konrad

