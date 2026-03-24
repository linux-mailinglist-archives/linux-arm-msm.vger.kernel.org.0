Return-Path: <linux-arm-msm+bounces-99592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPDMDmFdwml5cAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:46:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC20305D67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98B7630156CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1F53DCD88;
	Tue, 24 Mar 2026 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBYikzRF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQ/cQhTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3ED3DDDCD
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345216; cv=none; b=Aa6APHIiwQHrn5R0AWLSpB40i5/cemM/V2IprUO9bA4qz8DlvMQIsSAF61CJcDJ9E/1JKuaSArUhHYcxkoL4is7A/V/D5lIL+gpI/v8GDXjpGxf+Tqeq9qXG0N3CcZQvyWFgjN8jxx1ohPoWpUh3HodTlT9DkJo/siEizsNyDrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345216; c=relaxed/simple;
	bh=3Uc7ynKnBa2cVdFR3AoM/dcdGWzEDbLy6jc3DroJZxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1JWTg2uOjirkhW8iMHmw3R4fg9+HHfJGKp85f4pjhl31u/L3O4PxoI9KwlQ3aEBszytpxAyobuNb+MKjfsd9QWhxC5fEOXAHBnBgKigRgfJxxPexpwZ/w19Zb/S2zT4kKR8soOhpHyt0aiIzIothZeEv/cEguiD6bFbIE+45Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBYikzRF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQ/cQhTr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3kWFd3170748
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Uc7ynKnBa2cVdFR3AoM/dcdGWzEDbLy6jc3DroJZxQ=; b=RBYikzRFVWKo1wAd
	3dLqM9UmVoyINmCuBRBa4N2rQecXgbGq5vbwARPO9H8rBCT8XW2OOcgsqzwXkFA4
	OcNoSR+OdRb5gYL5leBnjqsuA4/qF7wBnxNXJmWaGajp8lJ+kUYFgSZB+yfoFxhx
	o1XnAQfQX6Q5aeHkADrvap2VubKWugr9Y3tUJZj/S7HJ2daYPQyYw8Ix+F63ac8W
	LFShuCZ7g7HpwGdxfww4z6PrJIga+P6zyrPQ/NMdqsLS5lIJ8+aYsMM0vAMiqaXK
	n+L1P738qfm8g3nO/bXdlh06bWG68RpAkA15A5tyUHnQGxBLthC3VBX4G4gFR80n
	IQvENA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r24219-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:40:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb39de5c54so415872685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345211; x=1774950011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Uc7ynKnBa2cVdFR3AoM/dcdGWzEDbLy6jc3DroJZxQ=;
        b=cQ/cQhTrrFvDdt+rN879SKTSSTvxb5ergkisBw7uwSBFvDx2jwYRMML1TIwljO/H6w
         T5J9DJqSvwmHhgYV7faAKFLonXlaPV2+y4MXkJKQcgUXZAQZpP5T2gK87l7hiCRvhOlR
         PZB3CasnjEvSf9OaC2+3b8x8+LDf5B6E0PWX8WQbb9US9M+Xas3aloo5ehnGCTTTIQi3
         VR5Oil6r9HJf5yeuYFr/4gC8Phb5RqsNfFdP5LSuwdltUSlWAgRdK3ZQGKvYygobZi3X
         LCgezMyfKGEfp5Sh5H02Z339+XbWrfFDcCG4Kcb0W+jwi/dMQd6ijoZMyz/EoawSewhk
         V9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345211; x=1774950011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Uc7ynKnBa2cVdFR3AoM/dcdGWzEDbLy6jc3DroJZxQ=;
        b=sNmcLEpZzuAqQPsK8SW/u3wy45yTV9TMTnuM9Q52f+pTqzysD143q6GeTuWJuPxL7v
         Q/FATdPzyMRBT6/VdyhctGUGZpLfR9vsV79AHYTpqGRWJ0FEe+T7lDgeaNfilDhWqo3p
         9IRzgsp8QrmH8BcN9ZVJjC9yMWO4W6w/gJ8aEs3J6opxwumTOS/pRsh78C8NJoobKjiu
         +BaGOkNlIpVs8BkMSOe+Q+XfuxfgpuoJI3tq/+J4OwxAkS4SHAh/DmjgqFg+u+xZdvG6
         PIfFvb31YS4e7+AYscn2MFjI9nG8xf7mjAULk2Ejg9Q1r6S+0yraHj7zS+ofkiuCf9hy
         iWJw==
X-Gm-Message-State: AOJu0YznmrFEY1EnwNTkNtYXyeOOOltIH3y810F8JLAIdHyTd3L7aTto
	///qodKPXeytuQF2M8BcVAKzbHU+/prVk899zMbJuzkCRxulX527+cvnD143HVSMBOH0hnH+czz
	DAtNzRHD3vmAPvdjhlgGNK/iaZUmwo4WwQVIBcKx0LieR1TwQRXHIJ9EDhnWX2pvPMGPz
X-Gm-Gg: ATEYQzwlgVTdcpPWT2LfWpWmUAoWz7hKPVfcs9+RSyB8AZMNty8tImKEOn7divH74VG
	dRRdyiMXiAQum9qkuGANA7HYg4Y2z1AM0tylglY8GMOTCMryvW0UNaDPwS/ik0k583Yc6tmaKVj
	45ltAYlUy+KLeu4zOfdIqEDOYYV6/fKSmk8VE5w2oBg2a6Mv0F2u91+IOhyo+X9OMjBrfwfV7S/
	UfbLRHeXwjY6hLpBxyCTF/bQ/NCMuafQ7z4tbL5PQHOHK4E83q3DryteL1FWwuAjzi1rpbr/9oE
	KggPKErsADBv9jkVxKptBpW/Df6yz24oCr4K2LomJGFDKfebEwqXtWqXz3xqPgxno8Bg5HJhDzj
	xSMMSe8THaZgF7HqEMN+Og5Jq8I4EgIO9eAdLBaFDR67rwKU2ibHsVihTvOI/SXjw3By7RPjpUU
	QXhcA=
X-Received: by 2002:a05:622a:148c:b0:50b:2875:5782 with SMTP id d75a77b69052e-50b37503d15mr182543411cf.6.1774345210714;
        Tue, 24 Mar 2026 02:40:10 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:50b:2875:5782 with SMTP id d75a77b69052e-50b37503d15mr182543191cf.6.1774345210210;
        Tue, 24 Mar 2026 02:40:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398d82dsm613580166b.62.2026.03.24.02.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:40:08 -0700 (PDT)
Message-ID: <020a891b-209a-47c2-a769-77197a257098@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:40:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/15] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Amir Dahan <system64fumo@protonmail.com>, Pavel Machek <pavel@ucw.cz>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <8d0c3d305197730a53ec9ca95b28f8df95c777a3@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8d0c3d305197730a53ec9ca95b28f8df95c777a3@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c25bfb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Vgcxg6LKE1OHo-dCjS4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ZeROIhWgKk73nBhDfTs8LBzpUJ85MYkL
X-Proofpoint-ORIG-GUID: ZeROIhWgKk73nBhDfTs8LBzpUJ85MYkL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfX+YWN6XNAnVKc
 reHVyrHnjPVZ2/TJX7giCxBKFUgQrozx08iu79P4o5Y44mXEPYeeJvR1ZfxREvKfWweIB/Ng9CN
 fy6JNAkmBOTD5yNbOBRjSyxeJwWxQNN6J6APaQ3mYT5ZRXvm2VxWip/D5/c4W3OF1CLEvP4cy0N
 99ZaK+/e0WoTiVQin2138q01yYAkkFhsSVWLVfdYylDBtD/rCykp4EXprKGaGw+RqeQ8DWiXC/0
 BY7EkNohkjPIycqj0Rj4J6OhTyTf06EkFeht2T750zzbDTxtspr+QqutokCsyTL80gTZh4RXrTv
 tUb0AxUz+gnbxP0zoduMcvNWb9D/KpAMlkfvx+lmUorexDgAvP9JAXmvxOlxRzF88fR7pfGUrs8
 tLGn0rVoBkIvFnOo6Jbe7QK7t4iCQZnbRjl6s5v8JcgYHM9MlY7RouJ6KFIK77ySFvyTobhI7Q2
 EuOPHkZOdLQuQ50hW9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,oss.qualcomm.com,protonmail.com,ucw.cz];
	TAGGED_FROM(0.00)[bounces-99592-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDC20305D67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 3:13 AM, Paul Sajna wrote:
> b4 got rate-limited by my email provider for the last 3 patches, I'm not sure what the best way to send just those is now :/

Send them by hand, --in-reply-to the cover letter

Konrad

