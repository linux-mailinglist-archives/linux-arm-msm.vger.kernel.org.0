Return-Path: <linux-arm-msm+bounces-92947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIErO20Tk2nD1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:54:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B265143761
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E8C930088A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B377D225390;
	Mon, 16 Feb 2026 12:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQBgG6i0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSt7exKK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C34C2248B9
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771246443; cv=none; b=u0uoHi8V/VjvpICyL2SQw2OKMPfLqK02xpXqtrpajGsSshs3S/hvuptXoyjygSrBlhWaA4Vwd0NeVFrt88AWali/Ld6a/7Rn/kPscCKQHc4d/zRD/WOO4lTD4rjgHSXKsPqIAPnwWDbHLGii1vdFWvfgKk2hU30Og3F+JXZkwqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771246443; c=relaxed/simple;
	bh=rIEiMmJGKtDGNHZ9N2gOgPoqyXupIVbIxMUp5L9UweA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8Njz7Hjsmi9dQOYPPpQIeG1QBvVxKqobvEU7XO3GGzKxdklaN1mZXRQa828l7xJt6SgqK24X6xnGm7FMmpf16burrquALL1Oek0OOxUY6Ajth/x11NQwn0rmIoccgX1Nk/dZ92HbXIiyzMsV+s8ari7WbOFSug6ZXN6Pm7TXnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQBgG6i0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YSt7exKK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GA0O3p1127987
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMNR8hEnujSifAH2GF4aIm8O1bdh7oP2lvHQiXEDssk=; b=DQBgG6i0B8599gMr
	2FTU1RroYcm6Nqq94daFq22LkwuGTRprVy+a66U1R1cBU8IU2ApsISYJrQsTnrBp
	ZYosvlp3aT+QGeYhmPzpd4YshpMHNzn7XJhdEqcV9xGmCBZfK17ORDk1KIJ0yXVk
	nmoyQyDaiVnLbQ7RZzD0qaXdiRZGJeu1jptFbbMCvR0kRo9LxxoWxY59EoLOgb58
	BbeEWAAryKO4MWjarOvyTlvT94PBLCtBAcRD2TaS5h41o5pH0D9Muu+stWLuHDvJ
	LeHGXgzlYxRPoNV0v09TsZ/EbbcbTVkwt5qRjWiQvF4/2q3rSqH9TX3K6cHtEtw6
	J5KiCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cajb8vef3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:54:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb485c686cso219783985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 04:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771246441; x=1771851241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMNR8hEnujSifAH2GF4aIm8O1bdh7oP2lvHQiXEDssk=;
        b=YSt7exKKniuml7zo85qIjYJ7KYqEbGPO/8Q1e7vJnuSSPEnXygKgL/a1qBTe440Ndp
         /PaoasMtQdFSOcGAph/2gY+H26pYcqAK0inw53/gruzsA3s6OlSACGKfGyQ90X/0Q9tP
         pAtJF0zJqdvTBrgzRzuNnntKqDs0Wp6fMygH3Vnn/iboP56613AagpI/OOd558mKAY8H
         p2ufjS0g3bh4ay/bNakCINNAmSDXWQfZEWeWIgdgtz/NrBxzrZ8fOMl9tdGUrn7QgMsM
         QOt/HdofKWikBWlZg6oiG2rlwk/1WYI0edr94CTLUjZ9ES5cKlIqVsLL+0ovIT4YcyIb
         Betw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771246441; x=1771851241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMNR8hEnujSifAH2GF4aIm8O1bdh7oP2lvHQiXEDssk=;
        b=j6Q0Jo//L69XRA7BH4k2yDyTSj1h9R1S8e5I1FEG8zeGCwCGPBleIEAz/f6IqX4rZ8
         7JU1aZiYo/vBI46b6WmvzQTXydGpMd/B7II9aifzYltnhbkIFICUrEnQ7zRcRYmzx8mJ
         SjTkk1WzO+EVC8SV948SYZajIsug+c0Rymplqrn8iEbep2FOk0J8hyd3nOkw0FNCoLDr
         MJsLHKpxBMo6INKxg4B+urtC3Cvzcetl6ipfo4bs7vVVaPu8d8+O93iKSJq3O3CC70oJ
         36EuKDIlr34ge8m32CfkgxM1DNH6aAIdTC479IDzZYynrHoy6a4TIgtmnjsjUX7a6lru
         y/qQ==
X-Gm-Message-State: AOJu0YwvaJpmCLj8kLU7J3sMlH2/uQ7cclhvHBJkMgfOQgl+4Cq3NBkt
	Iy8A2N8LOLnN0cikg1jjduDpBfJofjVMD6Hn7dDnUbHf4PGTPXsHeRony0kvgOXrfQWedBFsSPA
	PmLnvvq634NSYGPFQy4Z8Ec7V73dEl48UwaxM+qEdEu0xoWODiWAbFnRH6knYTZgeluP5
X-Gm-Gg: AZuq6aJdpC6lRHNTKiTHqof99wZOj9Xf6Atf+xwjU5hxaG6LZMIyER5Z2sxU25m9cZz
	EuRZSeKYN8btglixpRu453i94fJpeJOufax/us/UAL+EJDPhiXnJ1Mkl8GzF/Gpb/VjCob2EpSK
	aYitFDQ8k7Mdsi2LJ6G0gtisjCOOg0Rx5/12O0U3pQwI9p8GSPBTzUAlvbO3zs3Aolgecnedinp
	d//EGDI73cmdzOf8JlvKrTqFZsSdWqOG6tACVTjvfA+yXSUnZk+8X+qKEYrwIk8BUDpy8gD2j4t
	RETQ0e2JXToiFW2p0tTb9eKfTphgv5eI2M9BY6DLGbrU10dknI2SlhhnP9AnKfg/Pc+0fd/VJAt
	303ojSAtN88v+B/zv31lwzuj3V9QqkinI9pCb+xAmLrqElhbizdy0tL/nWRPH7opi79ERY9Ezrx
	TidEE=
X-Received: by 2002:a05:620a:2905:b0:8c5:33bf:524c with SMTP id af79cd13be357-8cb408caf28mr1039578385a.6.1771246440943;
        Mon, 16 Feb 2026 04:54:00 -0800 (PST)
X-Received: by 2002:a05:620a:2905:b0:8c5:33bf:524c with SMTP id af79cd13be357-8cb408caf28mr1039576485a.6.1771246440551;
        Mon, 16 Feb 2026 04:54:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627fa7sm256229166b.38.2026.02.16.04.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 04:53:59 -0800 (PST)
Message-ID: <ac78f12a-b10d-46e4-97b2-57d826ebd893@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 13:53:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] arm64: dts: qcom: hamoa-iot-evk: Add SDC2 node for
 hamoa iot evk board
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20260211093045.2595126-1-sarthak.garg@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211093045.2595126-1-sarthak.garg@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEwOSBTYWx0ZWRfXz/IkK3L03SMR
 BOM+sUm4taHBplMKAWIz58uFxhfsUwSVNZ6ApfUT7UiYptxYApvSxGeFMmlmCG02otOaSG7oQH+
 Kguco55dIkOvo90O9u5Em1F1fgBsPpbbiAoZJ76lTzjEbKRwZZt4yyhgAnu7N2jWiO2K3EuyJA4
 2JeWBSXgFR9m3rIddk0vEy+PW1b0phIZsW5CaI29vqfIZGxCkXgDnxnbZj5gKdYsVde5Fn8daUr
 Cq+EHI22S99pfuO1WjVFGK5OuP3becXwxEQoTMWEp4VDpIiMRPmterD67lGY5iJjtvQTbUu3GLm
 qkZ5iXO2no+vMeKV/H8IdP1lLKckmZc6pWJ63mJG66B7piyIKfUc4+WXlZO/kH4ZIhENNoIrGGh
 nFhog32q6p4JWdZTEm5RhCYkeqOr8oDTJSgL20bl85Vj6uptvPCBqGaRoN8MiH+pZvnwr5Ts/49
 iSdKtQVYtxaJg3twuUg==
X-Proofpoint-ORIG-GUID: MlhDKr_EjkvFUeTINXmx_BEpc5tTtg1s
X-Authority-Analysis: v=2.4 cv=Pe/yRyhd c=1 sm=1 tr=0 ts=69931369 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=DTfhBfxf_OAATmIgOtUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MlhDKr_EjkvFUeTINXmx_BEpc5tTtg1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92947-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B265143761
X-Rspamd-Action: no action

On 2/11/26 10:30 AM, Sarthak Garg wrote:
> Enable SD Card host controller for hamoa iot evk board.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> ---

nit: omit "V1" for the v1 in the subject

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

