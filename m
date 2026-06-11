Return-Path: <linux-arm-msm+bounces-112779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cd3dM9zcKmpPyQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:05:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2323E6734AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:05:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e17C5s12;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z8AtdzI4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112779-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112779-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BB4F33F3FD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 16:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13CC3FF1DC;
	Thu, 11 Jun 2026 16:01:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6648D3FFAC1
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:01:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781193681; cv=none; b=Nz6wgMcHiQ1hZbU1ioi/r5R8ntZF3S0bOgb/1UXbsi3vbXTHTGRM3UWwrRqypKShIjy7Xj0SKGyEyvqv5IJB5qM9OXZhCJgLj93z/s1Bg8A+UW3dvSqeOblg8i+eUZEtyGAnX5wDQvPN3bsjYcC1q/tB1pKV9bGImdo0JNntZe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781193681; c=relaxed/simple;
	bh=2FchrGodbYv/9qY2WYL8NeNKXHxKW64euQNt/BW9MZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYpOs7C/tw/jtJybz0nbMK7B2D55IDN3UPaX0EWmlAbeume0U73W2bD1KnXR/EFVHgKMQggj8SHkpnTXxQGa7MZQ8MjOSfefRmcLZ6mK1V3imQXsSDJG49K3pDp8WosqhbdRFyR5W2JosJxtcvTDm6lFtLlAzpvBVh6qgu6Jf10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e17C5s12; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8AtdzI4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BErmFp823134
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mpCQ9BJ8wTuI3Z6G1W3wDVgURRxmxkiof9xlWmEBr6I=; b=e17C5s12Z6qBA7eG
	IoZ/gx0NcwV/eosnyDeRMq9VGCfYcyN1Cpnm0tMFIarUYJmFrzI8xvCbZXUKUzdU
	rsuU9mH7WRtjSisvrTCt6E+bxVVe7HPqdRTRrVCXQHFVdytqiSAWh3SPq+75tUcl
	bzlJ79JHea4epdfw/T7oRLI4gjdyRFwF6Plu0V2dttgHFJ5unyjbUPGjohO6bnn6
	U7tyqShWbQ5H8ayUyXEe9PLMw7ndTvWT6cZ4dBIWHd1pzQp3zukTVdi7ftDvrwuw
	Tq4A1X0cR6oqPBKKKM00O/MFCfbhq4q9Hlrfiw7qlM7dutr9hOGz+la9IGjVCPr0
	by359g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6ucbpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:01:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2beff6b6e74so83084025ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781193674; x=1781798474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mpCQ9BJ8wTuI3Z6G1W3wDVgURRxmxkiof9xlWmEBr6I=;
        b=Z8AtdzI4gRVbuPErnmNASk2AISZgydptjDa51fFR7WImrUtNzI0QrJnNf5Rlh00GKu
         OUq3LbPNl/PYsy+pdO+JEA3y5RUd2h/u465HaP51rwy2qcOdcGHjyh80gfsFOLlxUOoR
         CXh0PTszS6u1LU8LtY189f89id0xRuEcC2R2/UcwyrS5MDda/zoFz7gTdKeSq8KqHXJh
         s4Kw4tzRL3UAJ4yjQcKJrB79b/Trgy1pqkH0oa5BDyT5FwWvhisrmNPkoesfAJX9Fwml
         IljWhpY1px7nN5dJh0Fmd39N/lH63r5RLYqcE4yBS3BZ/y6snp14qX/4e/+/MiFo5kNv
         uHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781193674; x=1781798474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpCQ9BJ8wTuI3Z6G1W3wDVgURRxmxkiof9xlWmEBr6I=;
        b=VvcsJr2YjE/+j9DUiCSkYCTJYRv7jgqXBUaFfIKz2MKNiUbW34JkTbFcE0WxWcHJQY
         oPxvGMhpCcT1VUmZysH5rAd7MSFq2WNXxhOGlQAxbTqmGREwQ+7bvSWk6zzPx3dicuvY
         vAgOG3yb7sV8//RII2ezUHZBvgh73M1099GjgRUguyZZtuKr2xx3xE8dqDRfwUWXdV/8
         80lMGzz0voIt5yH1akBKa6P/GSt0WctP2RTO2vJKvWIUgcYpbIGZDu0jHUkurUAV47lU
         HAF9JMsy1zghnC8Xa3qSd1O5WkOveGeYp7wDBQFPXzLtNcb47MkTOdlzcT2FI0GQ6AeT
         DMVw==
X-Forwarded-Encrypted: i=1; AFNElJ/xFWN0Pr//3OPPiYVJeQaas4K/mdcSC39qa/OU8KtaPzV20mSYeCR1+7s9J7l0c064PNFjubHSNx/dOh9S@vger.kernel.org
X-Gm-Message-State: AOJu0YxIVBep3OiR94qZvyT0eMKupDtwrmJPybe3Dy69/9HK3T53N/on
	PhnXm0Ih8lPaebCxLh1axpnd7llCK379gTu0D8QWtx8pq1sgTtabi42aJCnW+Wn1kgHDdYuChBg
	Y2stROzluZye44vWH22ugKlxU0Zd2U40X/KFK4n76byNaRWLyayZWMYHaDmUO+ssw5QMBfu1aCj
	85
X-Gm-Gg: Acq92OHVvNHeuhk6DuMLBuF31IqEkYbsAO6tFJHQwSKELjXNX8yi2ggt6HVDvkOobZi
	wQclSaObqX5E/VppoeEUJvQtC+w1lXCXCsWbgQZ6f7cywALFBrEtHNSkMyHuGvA+GUClu6F/N7X
	sEFL5+09HEfddo6/LitoLhgCCkZQkkcA5C1hO95Rn3y4WuRZK80BiZrfSm2L2M6DJ5oVL9owkd8
	BFD0O274LE1gAmN3a7DNEFqVLnUu9/vL3yNeEW4I5gJjZdnbptiKS4Ry3onQnIUN/JwmO2nvCez
	YrYtZYdnRggParjioSkCGFu7sAcaWwYJUjiDv2OKxTUEqMhUO3Uai2mASqqkk0fFxTuqfJWr5XN
	AKcQxRCVCV1ykjxkIGThEZb1PibdlHq92qptL8IYxqj1IiDewCwoSniabJQ==
X-Received: by 2002:a17:902:eccf:b0:2bf:e5c:d90b with SMTP id d9443c01a7336-2c2f3541affmr37502525ad.32.1781193673444;
        Thu, 11 Jun 2026 09:01:13 -0700 (PDT)
X-Received: by 2002:a17:902:eccf:b0:2bf:e5c:d90b with SMTP id d9443c01a7336-2c2f3541affmr37501885ad.32.1781193672779;
        Thu, 11 Jun 2026 09:01:12 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.151.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8429fsm348802935ad.18.2026.06.11.09.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 09:01:11 -0700 (PDT)
Message-ID: <17bfa853-d0a6-4f83-a164-a17fb02f67a6@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 21:31:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com
References: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
 <aip3_fyE8tMtJZIW@linaro.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <aip3_fyE8tMtJZIW@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE2MCBTYWx0ZWRfX1CxISILJ5jx9
 xlx9CURvbvuVMTLQ5ayDA5rhy+akY93OS9ds8TjIXpyUIV34n/btvk+KBEqu9njF3I59TsCkdX2
 sUsl+1N81Ppqc+ynW8mUbrL1pGstGJU=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2adbca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ziBI+Y3eO/H+UwYWWny9Hg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O-mRS134qTPuZNobniAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE2MCBTYWx0ZWRfX0qtz3fjnz1ZF
 B5KUt9i8OJBFoZQWHB/hJEtTxF1X1fIdeWHoehyrflhR85exCgAF60WglXZWTXEfRWlIwEb2+mk
 JSfNroYa0HcfXdCF4BfiuS0TgPbSRlrN/qeEgh/q+t/i9xpxgPnLfmveWoCo8tcxXHkRA+u42FN
 g5e7TYRJd8yMCzv5LoRVyCYhh4SMpNCVk6krviSb24L34y0OYHBdkQuNFA4ci7TIBSR5zjSMJZG
 QpusK4GapXoMo7wLt72JYD1wbnuqF2R/tYsvNnilkC6xI45+CU3iBB6nzRPjzLG/50L1yXma8fz
 ZJy6FJNsZeXjik+BxLRvuJ/fOPBOKlFGUwHIufA0RtahllqJtEOe1NAJfY0k4ijdmGkDAeUbAhC
 ZIxsyYvg8WNPlA2g/T1UBtVWGREQ2w==
X-Proofpoint-GUID: Ym5h3jnxIMJ-rojaZXQG5hP31pqTmiYe
X-Proofpoint-ORIG-GUID: Ym5h3jnxIMJ-rojaZXQG5hP31pqTmiYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606040000 definitions=main-2606110160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112779-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2323E6734AD

On 11-06-2026 02:25 pm, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 02:11:59PM +0530, Vishnu Santhosh wrote:
>> +	bam_dmux: bam-dmux {
>> +		compatible = "qcom,bam-dmux";
>> +
>> +		interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
>> +				      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
>> +		interrupt-names = "pc",
>> +				  "pc-ack";
>> +
>> +		qcom,smem-states = <&apps_smsm 1>,
>> +				   <&apps_smsm 11>;
>> +		qcom,smem-state-names = "pc",
>> +					"pc-ack";
>> +
>> +		dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
>> +		dma-names = "tx", "rx";
>> +	};
> This should be a child node of the modem remoteproc. See msm8916.dtsi
> for example.

Thanks for the context! We actually referenced msm8916.dtsi during 
bring-up and initially placed bam-dmux as a
remoteproc child. We then hit the issue that the driver was not probing 
at all. After some digging, we realized
that qcom_q6v5_mss.c (used by msm8916) explicitly calls 
of_platform_device_create() for its qcom,bam-dmux child,
but qcom_q6v5_pas.c which Shikra uses has no such logic, so the platform 
device was never created.

There was a prior attempt to fix this generically by adding 
of_platform_populate() to qcom_q6v5.c
(https://lore.kernel.org/all/20251223123227.1317244-3-gaurav.kohli@oss.qualcomm.com/), 
but it was blocked
because GLINK/SMD edge child nodes would also get spurious platform 
devices registered for them.
That series remains unresolved at v1.

Since your driver already manages modem lifecycle independently via SMSM 
state bits without remoteproc dependency,
we moved it to the root level where of_platform_populate() picks it up 
at boot, and everything worked.

Would love to get your suggestion on whether this approach is welcomed, 
since it needs zero driver changes.

Thanks,
Vishnu


