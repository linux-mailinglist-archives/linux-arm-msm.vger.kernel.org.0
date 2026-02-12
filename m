Return-Path: <linux-arm-msm+bounces-92651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFJYA76XjWkt5AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:05:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF3712BB20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 234043013DFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F152D6E78;
	Thu, 12 Feb 2026 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fpdrd0Aa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JROHkkhU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E70427B359
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770887098; cv=none; b=BA1O487RXWj46rd5QmFqlg1juzTjmBpzV2s8TcrHOrhHWW0m1E9bNMJF7JQopOZRHh6ENoJNykJxelAy4B3UepFQCOLnd0DdH/HRArvNprUUtOYoG2DDH1ntaV/o79ZzNOT2/VF3kG4BcrsprV5oKIGNdxlCv7TE3E7gQb0G3ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770887098; c=relaxed/simple;
	bh=5sQ2jJqOX1/LwiHPYiKSNdCWIrPuuqX8X6sC8tPtEBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NR/KPUhPgbtVJ9PRbjpoauiQeh7OxCjY4oD1SaR5Fdg1gBiRaxMIoU6L3kpeFEC9RJvKAmQUnJyPeBzWjB0IExQ6ucnoMLL7BJoieWvFJfNsf0+0qmw24kljOS0cAvZWiAjWLAhZDB2lgSdmhjygVf5MY9wpQdBzjG/lGGExuq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fpdrd0Aa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JROHkkhU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3S65f2396939
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cH9yMO90bndi7L04SC5MFFpMq8JCLTqAqJegxW58Uw0=; b=Fpdrd0AaGKgV+q7n
	7m0IsqPj09meoshC3Pv5zLALQQSyRLqy/s1tDuKBOcAnKuVnrig2zp0WP/cIRTTx
	OKdCJpD4CBgEJHsOB6TU/H5OQJdTLr1H2m0pFd7ixbI47l+o7VnGhY1P5xaEZw1v
	1Qs+RL3KPRa8MTcNDaYT3rZghazdqWGMPf0uxp/WWxcGOHS0YIDhaNbARr8wqenj
	Xki1j4/jPBgdaHx4iVZWzpPDn8HUhVHPTPtQVSxWri4auLSffneQgCyVHRx+837F
	uvHP+peVL04IOj92QPnPp0J7K5VBn+TlUYtYPriQbycM0L01aKin5K5ej2VKp+HR
	2mgSXA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8supbhu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:04:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8960257db65so17921716d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 01:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770887095; x=1771491895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cH9yMO90bndi7L04SC5MFFpMq8JCLTqAqJegxW58Uw0=;
        b=JROHkkhUUdpaBMOgem/k10DlZwROuJJnZ7rLv1eaDs4vUg9gdUXxQczGAFSlKFCG8s
         bKiZZNSXju5EGARtgdeBB5LSnDnn1cXyALTWMR1/dg9Yd0lgwX5JeZ5cY1FRAK0Tv/Sr
         b2qiPn1tl8Brh+mUg9MnodlWE+tp1QhCSNERxAzQ5HSmamw2NjFIoOIRT4cYBcXb8Vi8
         jmrlsOrOW8NesA8TXGaehyDOzYtkKsb86ZzYRVcwMkAX56Q/IxohtBcO0Nwso56BOKvC
         aZa7wSgGzCN4tKfJFpSWOm2Dah1CG0TF+Ugm8DZtFLqUCq+gHSRmqVGRthPjy1lIyd5X
         mi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770887095; x=1771491895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cH9yMO90bndi7L04SC5MFFpMq8JCLTqAqJegxW58Uw0=;
        b=RkG1/J9ITDdtN9EjDgrR+cGvOIC53l3qfQ6edFqbqYeyqL5LG9N8zG4UaEYAp8kqyo
         jcoE3QpnIk2CbtxkkB68SyQCa0eOe+XpcGoyEROlp254MquF4YELOIXeh7Jw2cROKN+b
         UlYmAt8Uiiq6PCICxZXGmFstjNRVpP4VCJvVEl8KoBSIg330veYZ8m5FT+oeZz6kztu8
         qmw8ddA7B0PUTRX05E2fTyCXeOB7lVVOnRTto2Fn4J5WOkD6IoKFopW/k/kP/FRMAV8/
         JezTWlib+goSOtEadmWM49mbrwTCtwZ+uqLEnAzoGdNe+Qn5V6mynff+AO3v1lSS6Ztf
         jGRA==
X-Forwarded-Encrypted: i=1; AJvYcCWnEk1DE62zDAqkOpICckftBEMPVeB7TgKbEoatb7b1ys6S8AjnEQr9vp9bzJkfycl+LIufJx+eqe4oVGtf@vger.kernel.org
X-Gm-Message-State: AOJu0YyvghuRgjSpbtqTmI8g5+LeN30I+l+H4OSbTtcxtSpRA8Im3Yxn
	D056FFp/bfDR4ghwpILY6FgFEMsDqD65iT4cGSsJqhb3Pzp7qP/vW2wEBilI8B5X+CUbTHQQFGU
	3P/MBCa+Zf7QdvE7ZDBbKtQAeOHCMONVLMgS1s1eO2++kRbURvKtkuFCJxy7+QOQjbe3g
X-Gm-Gg: AZuq6aJR1lrZ8/nlOk1fJ6Pk8sAw+bwvw1VrloNPQa9w9OBXKqyHBipfXjy9JBdY40K
	jxGENkmFDan7ICDWRXyRPId0qtVe4URpNHskQOZeKJ6KgmkFyxHP3i4boZtjV1CUom8p45oe0Zu
	3mlHYqX3wzmPRSd0Q147Xx5cpmM1ukKgR3a2ZlXSOtQhGS/0fVzZXAiKZlBM7YYxo7jSSKEcRuR
	BUM9e0+Y9jrZTEKjv/mCfWfBAzUrMV6EvV59fmsZnmcOL0IIEYK1O5MhSFGzgtGP94V7VH4X3jE
	wzI4+LLwW3ENPw5TOvanU6KON1V6PSV5ijBIKlMO8tj/d06/2cBvDkeVHezyR5rMF2eLxKj7a4e
	tnGCKIEvs7JX0OAQISryRKhkp/Oclw/fqysEA+6AlnQjtHwgcDxOZi7W7wrKRXKj95jua/3ifjk
	ljd1o=
X-Received: by 2002:a05:6214:8111:b0:896:fe6b:8bcf with SMTP id 6a1803df08f44-8972797232cmr23393656d6.5.1770887095510;
        Thu, 12 Feb 2026 01:04:55 -0800 (PST)
X-Received: by 2002:a05:6214:8111:b0:896:fe6b:8bcf with SMTP id 6a1803df08f44-8972797232cmr23393366d6.5.1770887094940;
        Thu, 12 Feb 2026 01:04:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf506c8sm1585773a12.32.2026.02.12.01.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 01:04:54 -0800 (PST)
Message-ID: <f8016c0b-1e64-412c-a8a7-e09eb677e35d@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 10:04:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1
 IoT
To: Roger Shimizu <rosh@debian.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <6cd569ad19ae8efb5f4244b3aa185754@gmail.com>
 <eb9c1489-4496-48b3-8709-739cd45c11b0@oss.qualcomm.com>
 <d398cd57-41b8-4646-834e-ff0c0b7ff749@kernel.org>
 <CAEQ9gE=kH4Np32xZdp+jzaTo9TMjtLVRD+xaimuKWxdag2Whew@mail.gmail.com>
 <b1d791e3-849e-4d76-bda0-816418f98e39@oss.qualcomm.com>
 <CAEQ9gEkA-Gw=96LJe3vf3S6ada5o-mDqjY9B6NNpSaO8saSfvg@mail.gmail.com>
 <24cfbe35-c611-4d52-8a4c-b437287717f0@oss.qualcomm.com>
 <CAEQ9gE=p_94p5Rnn===2qMq9MNUePbGaRgJkbkoLXg6X5oywvA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAEQ9gE=p_94p5Rnn===2qMq9MNUePbGaRgJkbkoLXg6X5oywvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2NiBTYWx0ZWRfXyGAbrajaEu1S
 X4VOdrDNOCVGAO9Nyrl38ZoO5H1HEwK52swbsNw21u4mgH2+xaHHgUfOpJpl3BhfZP5WI4BfBqv
 3omYulZ+GCYiLWHg8A+aBe1drK1PrjwhkTeTqojOCXnsT7BIxiMJvnQjNI+lIg3k4FtFMXVl9Nd
 ApHeWe/3FStoscTj2Lahn5LYAicFJV1F8t7Q+la0sd90y/5m098w0WS5u1EpR3QTzh24iI44A4x
 ez9ZuFiIIOsQffDeDfkkRSQW4r4yEgrJ2dw8j4WAN6ljgO119DH66gtwxJCRvuOYterofNSfbM8
 SqlBNxtyXXFIKIrnrqqBFyxG6DHAEhdYx8M8xz98yDJUUtxOWWBBg/4syaiu25n4gr2T5QBnJDH
 Yu2AWnxrOgsdCTwJBXkXpNgXfXeNyMks5j5m4XZBO3eHEhiEAqIvkYLsPdeKD3liIkfTs8+k3gP
 DQDj8DMc7UYCErJZsxA==
X-Proofpoint-GUID: BP1GvApkOa-JA2MSMewBei2fBeTH6Tk4
X-Authority-Analysis: v=2.4 cv=Uslu9uwB c=1 sm=1 tr=0 ts=698d97b8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8 a=wH0ZIneqvLbjNBMju9UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: BP1GvApkOa-JA2MSMewBei2fBeTH6Tk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92651-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AFF3712BB20
X-Rspamd-Action: no action

On 2/11/26 8:27 AM, Roger Shimizu wrote:
> On Mon, Feb 9, 2026 at 12:31 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> It may be that your version of pydtschema is wildly out of date.
>>
>> Nowadays the general expectation for using bleeding-edge python
>> tools seems to be for one to grab them via pipx
> 
> Thanks for the info!
> Sorry I forgot to mention that I spent some time last weekend, and
> resolved the issue in Debian [1]. (patch was enclosed in the ticket)
> I prefer to use deb pkg, over pip install.

Thanks for being an active contributor!

Konrad

> 
> Now I'm using locally built dt-schema deb pkg (updated to latest tag
> 2025.12), and and run "make dt_binding_check" successfully.
> 
> [1] https://bugs.debian.org/1127460
> 
> -Roger

