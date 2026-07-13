Return-Path: <linux-arm-msm+bounces-118676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h/e2NFugVGqtoQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:22:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30575748A02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:22:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AzHn2qcV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TnzX3Eta;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118676-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118676-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 324DB3269327
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAF239FCE;
	Mon, 13 Jul 2026 08:15:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5914033FE0A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:15:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930544; cv=none; b=hHICSyRU0vGx0twfFx6G5u3Lws5w9+dydeFR6JWz3dUQNxpB6PJZTaeiSmOprdRrwZX3E7Nf9KQ1lyv2VRWOZS2wP49urvm83NwhH7i50eXZ9sIfFrSucZow3/U139vJW6qpCIsdtJAxCe78p/+cQUkeh+G5u8Qfhj7GStkMgnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930544; c=relaxed/simple;
	bh=EdjLsq9M6e7OqSkAmpQ+Nqs0l3gk1yzZXSScIFmIbhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLvOuiAA3iCnjhPngB8lYD0uo1iJJxKkB5MgBv07pXt/lKfjHW9ZWG9vfOGtcp2z5RCUcjp2/tuO81KFevwwXHx9DmQ8qATqPxXop4Vemqq+CtrFkiKt8pR6jrLQuU7zV2kQpt0HNgcV/Aw5VEkrtne1bqDZ1MWEvOa969Jiouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzHn2qcV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnzX3Eta; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O5uC674892
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYHFbZGRRNFT4amkHvvjb5FMBYFszZHEW6vn0bAyOM8=; b=AzHn2qcVkagJU5OR
	t6cv1tarXsnmnbbeHdvg9mMxYIfyJYmsD7EZTyS6TsRjmPvNqr/UadaC8kUPurf3
	2ooWfwx0l6C8JMx6VlDVbjz2Bp2MERbPVuF9gs52QwOWW7HXEGFuvy1Bv/77FoKi
	320vlf2PG+BYtGvMdahwCoLSrhzwGMmRFA9mjxDlYrli3p2yQTGVJdp4K0VpDDIR
	F4H2GKqVyxRrNJ52oVijhppdFaBWddttDA48+z2jPoUAUZyUaiopbNBQQI4o+ohR
	hgqNXE69A4g/36Z80sDlJCXMP4OWyurCqH/MeiMvwTx0ejQdd1X35qdnCtpBex+B
	V58RtA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgn5hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:15:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c2af04aeeso40105861cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 01:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930541; x=1784535341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PYHFbZGRRNFT4amkHvvjb5FMBYFszZHEW6vn0bAyOM8=;
        b=TnzX3EtatCQcIP2iAcDb22ALt1Vtdbml8L0Gq+4S5mKxhxdy0iXSDbaWOdtz+AxPLA
         CUjUCrFTqLxmLId9GSIgwsHpYzC+gV9UmGdo2qTn/l2REgDrTxaJpvTg/DY2IUXVEISJ
         XJHo0rmR8jtaWgeeB1zAggKxOMvPuCpWQB7Vx2PETiDLmjESyFS6zdMH9lVnAhXWeeFM
         r0MootYe86RBNBd2QCG7jIjYnfVAdi7ghEU3fiJeWnEaIuwf+JVUET5lbR88ttFTHMMD
         PLgyHZI+DvnoncyJ7UKqsh6uRRBlh/U2JPLzOsLbfKdfqTIqJDHhbV9ynxUam7zw4/Jp
         mvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930541; x=1784535341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYHFbZGRRNFT4amkHvvjb5FMBYFszZHEW6vn0bAyOM8=;
        b=Wk48yBwwxYXSl7J6J5+mLPSc+FinPyANCEeZ/GU93C0ntQeupzc1eUc7nt6syD7UIo
         6+d1znhr+bSeUqEMaIbWV0E8LxUy0p9iaX3RohjAyDm5BHoqjWbEzXCtuVRF6C8g25P2
         htl2VY5I+dyUr2BMAaDeJy+ep/2vdKbvmZojkVw6H15aTUjipCencTECaiyqtJe5lQYI
         iEID2pRPSamZNrD8US0xCY1RfFoR1YawQvmoIODI7e8NwEHt5yt8iC2w/J7ajFWfTySz
         sHWrGmHbmTwsDgTd5aEzsXBSgCU6hIs6aVJuc1Jhvgq2kVO8/zr43aIYdLqWkwXvSvTi
         gSYw==
X-Forwarded-Encrypted: i=1; AHgh+RqovOLHlmZwl/PdoUlnWedqtElIQRo7eYLVEQBCwrbC2Eek5S9NDNkvc+Nx3819suauIlenm9nR3UhmESOu@vger.kernel.org
X-Gm-Message-State: AOJu0YxkhzZmQ4FiY6iFpqF9B3jiQd8zfNTl7ZAXX8ox4ZkPHbflsJxA
	Zt/f/A+cmFtlQ8YTZ38UyOLL8Ocog6tsZyiTAayCUQwlt6ekHp+kd0yze1rcwd3Lu4tOaVF1sg6
	oLiraC3/+qw5uR1SN9//JsdvcSSlQ5RtV3EwnHMfWVBQCHVqk7BhyNrRfI7A7HYlwmbUp
X-Gm-Gg: AfdE7cm5KwE3KRcqHlnbkHffGGlznfJG1sk7DJJBmVY8N4JgttYXtktvHSXjwDNf2OX
	9Jyr7iCR/8v+UbKf/fn7bREsw32/HpkPyaTPhT7njzupaElun38pD4vFx+J4JIC0qdShu8WB6FI
	0VpbtiSzG1TH7Fbrrs6w8r46ZDpy6a+VOniGpjjDP9b5dCJvwo/tV+r6gO0PX4S9ZpmAm2q6pU/
	lkaksb0vljN/0HCDZLUntKGsTRt+RZ4Kxbc08f5TmWepThP1foNaq4bd0E6g31m3BoPr0HiCQ2T
	Xz9ebFpMPGXwb3euZHNtdrdbapZDB9BbvUbVLM3XhvDU3H70BfVl4u363mJ4TcWXwcxfaPDhKCw
	hF/e+rrUEiYBFoDlhiYorRcgSx2jdDpavDbBtCX1zUlY=
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr129267271cf.0.1783930541427;
        Mon, 13 Jul 2026 01:15:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr129266901cf.0.1783930540269;
        Mon, 13 Jul 2026 01:15:40 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e19cb6c0sm606414466b.26.2026.07.13.01.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:15:39 -0700 (PDT)
Message-ID: <388c8f3c-ad60-46aa-9ade-042bcd148dac@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:15:38 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
 <20260625133828.3221781-2-atanas.filipov@oss.qualcomm.com>
 <e65358b0-b978-4672-9691-705897bcf209@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <e65358b0-b978-4672-9691-705897bcf209@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfXxpg7yhOS/QlM
 /Dm+mafrDLI3l105gYRsqHSfCGHe7wgINi86iH4p5q/sjEUFvyv2Q8Quz8ScbuHM/ismECIBZV9
 /xBMN5iw25XYyQZDr414Q/atp5xXjUA=
X-Proofpoint-ORIG-GUID: atdsaSiF1-nqyCkoxrxi64w0PGju2avF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX7rl/6azy5f51
 b3vciRcX00YKV1x0viKbIMrbhT8X5Wh8bNxqvi2D7vdEGAAC2rf5hp+H1GXz1qZO4YNK4RN8FCt
 dkYLvK1IRRkDHSDJOx4kvK6syN/P2+yErW9Ydq8r/1zbAD/XuwnJ7XFLOGdcfz4xHoo2UNgVvPQ
 VJiHRkUd19ZmXxuRv0WzRfFMR3Y3W1k3w1gI2vRovTE2ROruRCU5Hu96g9HEQE4SVfkfPLj/E0C
 7MGzfZCBy/TdXjcrniFOJ75RqgPdmpwOFGurC3zhIweRGFjjsZU30CcDmNcDMLFqNbvrUvEFxDn
 pnC8Fm9zi7oXMg4ctaH1G6g1FYLpABagZ2Ib/qZsW673AB/FKY+3dVmoN71u9dm1P3fiSpjhJbI
 8nx3u3ePMPZ6VZpim60dOBMWYXPpM/yf+NBh/6i4ZkkG+FmVw/jR437kAR+MObycx64pyr5rQj3
 ZuNvDbqLlYrvncY7XkQ==
X-Proofpoint-GUID: atdsaSiF1-nqyCkoxrxi64w0PGju2avF
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a549eae cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zbDFh1kpPF1_w5UJdLoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118676-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30575748A02

On 6/25/2026 4:55 PM, Krzysztof Kozlowski wrote:
> On 25/06/2026 15:38, Atanas Filipov wrote:
>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>> present in SM8250 (Kona) SoCs.
>>
>> The JPEG encoder is a standalone hardware IP within the camera subsystem
>> that performs JPEG compression in memory-to-memory fashion.  It is
>> separate from the CAMSS ISP pipeline and has its own register space,
>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>>
>> Properties documented:
>> - compatible: qcom,sm8250-jenc
>> - reg / reg-names: single MMIO region named "jpeg"
>> - interrupts: single edge-triggered interrupt
>> - clocks / clock-names: Common clocks and JPEG core clock
>> - power-domains: TITAN_TOP_GDSC common domain
>> - iommus: two SMMU stream IDs for JPEG pixel and JPEG DMA processing
>> - interconnects / interconnect-names
>> - OPP table mapping performance levels to clock frequencies
> 
> Drop, since when commits have such text? Why are you describing diff?
> 
> 
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,jpeg-encoder.yaml     | 135 ++++++++++++++++++
>>   1 file changed, 135 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>> new file mode 100644
>> index 000000000000..ab8d8951d21f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> 
> Nothing improved.
> 
> You actually ignored all the comments from me and at least one more
> comment from other emails provided to you.
> 
> This is not acceptable.
> 
> NAK
> 
> 
> Best regards,
> Krzysztof

Acknowledged. v5 addresses all binding comments:
- "Properties documented:" section dropped
- clocks minItems dropped
- interconnect-names renamed
- power-domains added
- binding renamed to qcom,sm8250-jpeg-enc.yaml
- JPEG modelled as standalone peer node

Best regards,
Atanas

