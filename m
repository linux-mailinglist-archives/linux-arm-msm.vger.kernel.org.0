Return-Path: <linux-arm-msm+bounces-118759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3kjoEL7WVGqHfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:14:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2571674ACF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:14:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UoHR3eNd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VPZpgR7T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118759-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118759-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A977A30188B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3576408619;
	Mon, 13 Jul 2026 12:14:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5F5408604
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:14:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944886; cv=none; b=uxBwyYoFsnTXSNl9ugFV9H5S36Zj3gvMgw3ckVuaygsTjh738Oox6HRVjrQVXHa5IuVkszP/ckDmXiUoDVcNmsSgd/VpozCDD59DTVwK2VJa807W/lvINBvJ9ZesEVescqz3m5iLZvKrhqnWUWoVbSmSdK1IPODUDc40wQ5k3lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944886; c=relaxed/simple;
	bh=xaxtm/Dpnz+4KdGAJI2OS+JIZQ5GYHVCqxmLysD4nMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYAFWrpQL4ItWe77fJrUpeSyaurj1/YTtDgDU0R5njECycY2RuKuJuieXQyj7fOcZtGoRgp0B6I+1RGRjgTt0LTv/+mo2wRHuo4nvSaABa9TSLRSR0Z/DJ5WF7vpAW0+TnPgVUsm+zWKRR6ATj2Jby5CAfgg2n+41zAtKOIfvu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoHR3eNd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPZpgR7T; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDuvJ1209911
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bj2ppbc4gGykhORbbJec9NB3jEgKloyl92m8waO1PU=; b=UoHR3eNdGIPOeVg0
	KsHOyJ51TwiQhLZfHy3iaYcPeErYtD6S3VOfWzkZjy62jO7WL3Ru7lWenpGjb62h
	vxtQsoGXgK0q+/YiglkHPMKZybNFXWqD/nlp65AuJO9zGIsyecm9TSKbP9Nt7DBl
	vkEFvNbh03uLvy4OrA3rs6YncpOdtGfN8+4l3Ulyr/teMGvws2i15XyjW2MS7n7U
	/962afWx/U1KN6UGcvQoEYattFGnsvdrpwbslgEouwAS2+wbc8520DuwkDD1cOWU
	lZuSCPKlHBGRolTzn9YlbS6AzDIhYxsfVNX+xAWG+P559YS3bn/XRhiyQuyk5ott
	oIkWMw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qrn3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:14:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso76324365ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944879; x=1784549679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bj2ppbc4gGykhORbbJec9NB3jEgKloyl92m8waO1PU=;
        b=VPZpgR7TubTwpoJVGFPgfa82GgkFcNi07gxjNrK+id3pqoMdNlL0mOuifZ9Tpji5Ym
         RzFyJsmiFYRRACQhP0cHJnQCDETgbNJ4XL5H1qTTRbYM1InJXp2AayS1pCpMUdW+SS7o
         9oetUEipydcpkOoXqyZZkEazf1F6RRChAddFFSAKtgmhOoKxMAJ+HNTPJ0Mbz6Cnu/RW
         gpM/OX8AhvqUcV756mxArgwJzorPZOuUHWWPPsp0khlvEowikRjmnuCjHzLyZT1of7mi
         fRy755Cnma9ZI0cMd47vpPGoLF/cYyWPDGgbLF01PB1u2GOR2gbu8alPSoqO5eGDCDms
         2BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944879; x=1784549679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bj2ppbc4gGykhORbbJec9NB3jEgKloyl92m8waO1PU=;
        b=IwkQe/lwdR/a9SUkG1pKDtVj/DGaYMjAGre5Ep3MRZQheElr6o9yAPrkAAxeMPIO9E
         xyEVfdCNNf8IwK2mm6j+fFVIupYkNKGXelOvWoEJhcIK6UHAvCL4KXMhykZ+ZETca7VR
         TBksZ/WubbjmeXUGbDccl9CEzh4Cm6BOn5GMVBKEGn5d25Ha0EYjSZj5OwmWbZj03Cx4
         jTMYmrEOkF39PPuByRUEsoaI7VdxMfNZ9N1bocgH7GmzN5rhi53YZ9EUHGNiCxL684B4
         pIrHCD9EFff84mwdxiz0RDABRULbn3AMXgmz7tvCW8Bg/gLDQaMAlX8VU5D1B5k2ILlt
         4z5g==
X-Forwarded-Encrypted: i=1; AHgh+RofKf835cUw+DRdklspkgChTW5i/ZGNauZO4fq8GwNmVofzlqf0UyE207gYdmXlKpTIOrKT4sCaW11IKHap@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Bmd1nKSpePEoLvNkArWVuxfCSk+Knl8aKEmyJcKHw77YLfa4
	6F+/GuJFrh5le5sg/PaJbLndszjWXtIXQ3YvviIvMQ/pOGV6b2+5X9xdSyVDZEmDPUjN7aXFLVr
	AyN2RJHcLsFgJBaZiBrCbu4OW4prqbL4MZlbDBchW7/QOAPqlzeLm5SlfckHB2Ao9NoEb
X-Gm-Gg: AfdE7cl/0HisDlzNGhegKaB4M1edLDwj8zoaHJMmgT2IBAWUdhYjt6SBjlw/4mUIW/I
	BcELLc/r+fYFyXoXWSx81ZAbL0SJtjTo+R6MQNEGBGcZJwPZy2+AOnLE3Qp/nEYpWZydyYY5k4A
	yZSpUTFrEgq5vFKOnHQw8o4t8+lgbmR7Rqg1heREq8aQmk+SwcicQQSH93VOqPUk+kc9p71jEOo
	VrTLBCkpP+2G4EXWxFzSMMH2QW9GwH2E3wRJ8mqYmCuy1P7jIHyvYChA6M5DTMwo1NyiZLk06mF
	mLTVfU6y/fFwMdn7gZbCt7Bf4oIM9jthghEYxEYq3snKkrnvuIC6dKrpF6LHjBG0wUn3mCNWLG6
	R70Kq/3O0FbmgWcN3Eh5xmhbN0i3gzozQtyZfYw==
X-Received: by 2002:a17:902:fda5:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2ce9ee16623mr91362415ad.25.1783944878671;
        Mon, 13 Jul 2026 05:14:38 -0700 (PDT)
X-Received: by 2002:a17:902:fda5:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2ce9ee16623mr91361995ad.25.1783944878253;
        Mon, 13 Jul 2026 05:14:38 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1ecfesm98917475ad.47.2026.07.13.05.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:14:37 -0700 (PDT)
Message-ID: <b0ed37b4-8279-4d8c-a4c2-3e422d799767@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:44:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/19] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 DSI1 PHY and sleep clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-2-cc13826d4d5a@oss.qualcomm.com>
 <20260703-imaginary-quokka-of-resistance-c06e8c@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260703-imaginary-quokka-of-resistance-c06e8c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX/xbx4DlomD6K
 WYjCawIRBRrhg1GExvZajiUCm2ptwaA1N2hxSvqXWCifZw7Y+OtM1wL3Y9HsE3UQmCLqlrkH07z
 4OwfKJIT/ffHdrunmy505gb41AJ8+QajtIrfzguJi/ULVwrLcuPZDaXW7dmUjNckjmXvMg8pSTn
 O0XJ14ZrliHru0D+p66+EYeBPbNP3JeVTQd1fvFym9Ov4tCw2d+g4FgZk+Vvi1V6UrlvVgxqKBR
 2O/u8WpcMe+VKMj2cff/j7PmuQ43vVBYtp0/6xRNI6+Geb9tbXyb5U+740ZyfmZuoaFVrRpSfBC
 WWfumn89Jiu6rHLZShr5gt4LvWiTM32PSHzYjW5kzyRHFSJZfV1OVwK+Z1qgQaTVR1XmZSLk2cT
 U8RPdKiQxWX75MzPiozTp79M5rRKwQbNZ7qzGgQj3tmvUKNe2QsEDmpwYMwN2oFAPGP4U5QMKvq
 fZKOuzg+CyFz516926Q==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54d6af cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6Xi6mpGAEk2f3eWU2LkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: R5-YZOHf0GpHHgzhfQgNhdfN32_YQ7qq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfXyuEy49kIDQFM
 sqGcfFPTlPO1/M7cEPGJSxtgxsanFeUN9+InbTRm8g8olSCFXJZhJhdLN0vU+XK1mDn9txRpgH7
 ULy1k9giO2zVuQzLu2SlaVxJ+Ai3SBg=
X-Proofpoint-ORIG-GUID: R5-YZOHf0GpHHgzhfQgNhdfN32_YQ7qq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118759-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2571674ACF1



On 03-07-2026 11:43 am, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 12:01:24AM +0530, Imran Shaik wrote:
>> Update the QCM2290 DISPCC binding to document additional clock inputs
>> supported by the hardware, including DSI1 PHY byte/pixel clocks and the
>> sleep clock, alongside the existing clock list. These external clock inputs
>> were missing, so update the binding to correctly represent the hardware.
> 
> This sentence repeats the first one.
> 
> I asked at v5: you need to provide reasons. I understand the clocks were
> missing and what does that mean? If everything was working fine, while
> the clocks is missing, there is no need to change the ABI, right?
> 

Sure, I will drop this patch in next series.

Thanks,
Imran

