Return-Path: <linux-arm-msm+bounces-93132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFiuCo5TlGl3CgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:39:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BAA14B7E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E24673000FF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978EF332EB4;
	Tue, 17 Feb 2026 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5L05+bN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rd4sx2Rm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6632A333720
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771328395; cv=none; b=MU0fYbUQFQnopM7/bjWVKyDOKNznL5LSRjPfLmXqOG//jWvDtDRd5QYcFyqEwdjTcToD5SXR5+3orcqj/OyjHfGEUnubc9U4v3nYnB1K3sfNURPE3S0zE9CcrKwuGDi6tlVwWpxlu0Tu7AV7xISdsBceovJoY7STb5nF1nGNjKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771328395; c=relaxed/simple;
	bh=QsuwglBs+zRzTr2NV7KRHwtUPNxAO16CZ3Y0FqqRsAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uix54H5x6sdcXgPcjgO+KITX9904FcaYM+od+gIcBZ3h4LNRAJot/iefiI3RuCpb2C/3xDIV322M/dimqjd3WrcpMtQL8APLXlOVWUcghohuc7X4XcEaIrsakMm3QqS/l/cTnFGJHOLW+iGfyC7f7LbL+d+T+IfLqKN9eoeZKT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5L05+bN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rd4sx2Rm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8LjqV297047
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WEaN+TOcw45eckwzgu0y3RymRNT+PuKjJJFzwTDz88A=; b=i5L05+bNtTk4Kp93
	dGlKEUw9UMSKqJ6QKRUcw7saSC0kSLDcyny6oEczG65A5c7BjXQf4zwIEl9MM9xG
	YZ3yVAa4OVFMj3Q8C3zkC8A6Y91Ksjf9+0uJ23dqWmQDOsD/VFERJYfSV1l1R0m1
	HVqYS3HbOFvQ7tXuY5bZf+V23aQHfdeZJgha9JebYt6d76lGfiCRAiqhtpTSjRKx
	6e65t1LzusUCt5pbZzvojTvXlaPS9zPLGTDlSsZdb7k7VvosHXEBROB89veqhHlv
	JtO/7/e0qeIUeyfkwX9/0NiZ0pdR+o6NASzOf1QJpPRuHlMseuBY1ukm2WzAYkhx
	fVXkRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9t5q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:39:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3978cdb2so289050485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771328393; x=1771933193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WEaN+TOcw45eckwzgu0y3RymRNT+PuKjJJFzwTDz88A=;
        b=Rd4sx2Rm8fHEiKxxE3yATwe7qKN5QITMMoT+VH2iJfFuj+xhnFJSyEIZe7lHQq88vt
         7hAyBjJLRCU/1cSNQKlk2H9197HoYRs2xWxD6ADnsBbuP6N2owoDhLSRvP0pfBPVGx79
         1zw5pIC44tLGJX1NIDETbfCaC941F1OyqVUn5/1V3LQZz9sNwQWPadR2noeGbFsDzAOq
         4DS6QFpXXJVyNib4LiPRXPzK248+53MrVwWBXk9rlDKmhybbi+B47SO/h6z4GTuDF5IB
         wQTMZ4bG3uxO0n+9hhSTwN3H4zwD5Ow4Eh9YY7PbPf0R5D8ueLGRCIP7D9HF7/5cclD6
         piHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771328393; x=1771933193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEaN+TOcw45eckwzgu0y3RymRNT+PuKjJJFzwTDz88A=;
        b=iY4jeGXtMHk/cF1X8ui9YQFzQQy1dbFpreC11sLwCrWt0PZ1GSsbHcxakPDv20+ZWL
         9Q0c3INbXwZwqq21+Z2ntjN1ZrqY54cca4UuMehJzyMgbx+/t36MfGZJop/N1YlYEhMk
         A/3qpTapMf9q+kHeJYawXB6dC919JVONs7joscDe4TKluapTSSKsoQuhDaCOyjXZd/ac
         nh62qI9Tn+z+7bRRvFfOlWuAPnFdmvZKnzbgqGKTKRh9zU6GK7gfQM5xtloMp9MG3Hat
         Sma/bX70yuV4Jb7hZ+FVnVuQQ+24XjNAiKLjdGiLXaoxDjN0QMR6r6PwHljI1LgY557m
         x3Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXhkfvgMUYlZaZ8elwE+l8BwOlEBfANCe48Z7+8G35JWhU0luuDVvSG45pp8R2MSoCaNUor7diDiWx4zZiF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8rSQm72wq0vp32TMhUxrVNff9kUUtjDRMPIovDOk6bRpwZmN9
	yEIEf69bppib/El1wow/cUVj5lPfn4Ps+vzPKMZkiob4lloyIUg5G4i2XvwC10ssw3FdaDgCTYo
	KYCP6FJwi13NA1DMi+tdtRMaG9oYEg7g11RVrCyhtXolFm5nTb9UJuCajmiKco4pJJgiU
X-Gm-Gg: AZuq6aJaChpebpOCNabapbFp1wK6xqGTn3j/eivZqJryTjYOvjuIhgPwWcL87KX1lCM
	B5jnXB2koTP/+AvswZL7KT4jMJt9mAWkkz6tjqqh7US3HC0zv+gf4FIC5Pmn2BXLuXxa3fZo6Cd
	D5IRdoh9nLbOTPQ01j6O3jM02wLKjXPPS21uLkZaG/yldGK3O1E8Xm3gkZNEqzoEdGryTuiSPUr
	TE167ds1m/yU5MkQty7dPtPi4Vle8WVHlI9r9PRIIM46J8aNpnHvH0r80UldVmiprQrXTYe/SP/
	M8dwi3u9n+vUmy7pCeaiIqq0vQuBgWnIRrjWCCl0zA1buar1g/rjVnrIRYsgVquCg/lgoEm+Mew
	PcTZ/xR99S51oLCon7yWIQPJP/kANfvXgJeaWyf9A+kHga5j3K7S/ZIr74rdpvFTgCOsFX9Lki2
	yCeX4=
X-Received: by 2002:a05:620a:480c:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cb408b8285mr1323283285a.6.1771328392812;
        Tue, 17 Feb 2026 03:39:52 -0800 (PST)
X-Received: by 2002:a05:620a:480c:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cb408b8285mr1323280385a.6.1771328392353;
        Tue, 17 Feb 2026 03:39:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19bfc8sm2309709a12.1.2026.02.17.03.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:39:50 -0800 (PST)
Message-ID: <119f619e-9f3d-4c21-8cf1-a8b4e1024ed2@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 12:39:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/13] soc: qcom: geni-se: Introduce helper API for
 attaching power domains
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
 <20260206174112.4149893-7-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260206174112.4149893-7-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NyBTYWx0ZWRfXxCHJVePj3aPN
 umzCC729RprF5zW1Oy7ygR/ku/v3tnf76pk+U737gt9DqMVP61n/u1B8E69btTxWXSkufZ4FNYs
 cqJEhjWwwF7Bc/BvjHCMm1R/K6QGQdBj/R4RgsCqWf64yWmyOejFF7VL6s98KDSuvbr/FMAZxnD
 ePBO+jBqAdYCytau+yjXpVkuQDSzXiEtpmAJL/5NnyziX9QSkvAT4tZo13ak/+e4Yfas+fGsbf0
 nRnoftm4Eulo+AftRaBp3LIPe/au2432o6214vkn0b8MvJ25ozJvKuYc+97wJCM51cvlKW7Wyff
 dUX0QGrhxKvuMHpct27ngNQw9DdB1uBe9Fq8V3vW111zx8rbU91NmNdrzkS0vfST/treCB61zZC
 8n3Ker6oeI6c2FG8qVSzY/Qv3MQFMbF8SlVUTeOTCoS7xg/ukxGe5Hhf4Cx9aaKEwYoynUcsQhh
 cvrjZqaD1rExi6nKhiQ==
X-Proofpoint-GUID: 6ZVjiiWCAJZ0fH8c6DDVjjQA2a-vTuUT
X-Proofpoint-ORIG-GUID: 6ZVjiiWCAJZ0fH8c6DDVjjQA2a-vTuUT
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69945389 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Wk3v8SmLDDZtl8l8IssA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93132-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7BAA14B7E5
X-Rspamd-Action: no action

On 2/6/26 6:41 PM, Praveen Talari wrote:
> The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently handle
> the attachment of power domains. This often leads to duplicated code
> logic across different driver probe functions.
> 
> Introduce a new helper API, geni_se_domain_attach(), to centralize
> the logic for attaching "power" and "perf" domains to the GENI SE
> device.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> +int geni_se_domain_attach(struct geni_se *se)
> +{
> +	struct dev_pm_domain_attach_data pd_data = {
> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
> +		.pd_names = (const char*[]) { "power", "perf" },
> +		.num_pd_names = 2,
> +	};
> +	int ret;
> +
> +	ret = devm_pm_domain_attach_list(se->dev,
> +					 &pd_data, &se->pd_list);
> +	if (ret <= 0)
> +		return -EINVAL;

I think we should preserve the original retval for the < 0 cases

For == 0, this can mean a number of different things.. but in this
specific case (where we always set pd_data.num_pd_names == 2) it seems
that it would only be an issue if dev->of_node == NULL, at which point
this function would have never been called

Konrad

