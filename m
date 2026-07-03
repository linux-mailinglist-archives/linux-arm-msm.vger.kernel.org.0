Return-Path: <linux-arm-msm+bounces-116192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PvJrJaJkR2qGXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:28:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDBB6FF8AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:28:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AjhSE2rT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=apgWzzN7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116192-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116192-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C3033023A53
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F48E357CFF;
	Fri,  3 Jul 2026 07:28:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC43C356771
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:28:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063712; cv=none; b=t+BVAks8+7moriYBFASELgAfJUebgoa5qZfr69bHRIrsUkOXu9JuozWD+RR1IvZpHVA613Dx9tMEU2T0jGETEUB1yU3KVHqWHqpPCo+9etSD3FoKU127CiLjcILEedxMEu4hVxbBz2yZE6Yhq6xW1OwbxvbyGQGQhoe8XrAAJ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063712; c=relaxed/simple;
	bh=G91wVvJUuLS94VJDX6lLVmIRI4FU9naa3LbezLYsZqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FuljzZCaPmYu3h0P1dGM/MPv3P1j7QRmlm5dGO59LB4YEqiGZ0v7p1D4y170OtKuC5vOYxFShTMVhDrEinK8dpZ4XIwi6kVXvg8aVE0OQPPLbNiE/ROsCe42ew9h3acoNJ0FjVrFmf9FJAxnmOdhlmSVkDq5po+24eiBhIJAfWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjhSE2rT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apgWzzN7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636h0Rl3144245
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j3s/Lpz8eS/XYwHEj+6SabC/L38ujp0lZJpz7O7TgEs=; b=AjhSE2rToalKwei1
	K+dBtfqm8aRKHIA3gniRHtGmn9r7Xp19lXMN5YBjqsfLGJjX+IdHIpRS0qPBbRvq
	xr3wyTxeDIjk6bZFvIxbuhAxqeLOQjUQ2kYVagONhUeLDeC0GZuTEyY1ufd2DuE9
	1/MVEaxoYSGr8OIypbrC5iuO4ypxnoT9cxlRl0P3pfxQe9pLlD4yBtTLEyViccGo
	DdoaFNXDbYq1o/1mP6k7Pjjn1lRO/Ke2yoC1Z3lT3jseRIFIDX1aRSH8z+rDxta6
	2+klpM7NvIzknsxMN22ZIOIpEoW7+Bf+ZZtcRsHfBSO7KdhCy1Cm0SUpF/mm2H7l
	CSLhGQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682br62v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:28:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso7126385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063709; x=1783668509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3s/Lpz8eS/XYwHEj+6SabC/L38ujp0lZJpz7O7TgEs=;
        b=apgWzzN79VwiP0K5etY1JAVXATtBnIQvA/UmZ+q/sK7QdDHWRc/CR0mR31ZW8r/0xP
         i2f2KxxkdxmpEJSoc2DiuCwKVJv2rD33FGL+HVaIAZMhp0QuYa/M2ETxsV+BjGtgv02e
         b74+F3lQ36yUh++57qEG3ju7TOln0FcunActgds/roH3lbJE4R0Op0DWMj81+ar/FopH
         qSFpWHc7f+G9xjVZs14A+C4hV7DnC0qNi1uDBuAo1dKc0I7hseX3EABcHLaRcrSOjpOa
         w7UJTkr9yXEwtrreRfEFy77daf4IYDZfMHK9WMnKICbKDKHMwdXyqo0jAZPVeAkebhXe
         fBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063709; x=1783668509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3s/Lpz8eS/XYwHEj+6SabC/L38ujp0lZJpz7O7TgEs=;
        b=di4G2UIifiH5oikgzTfHf2hkaXYlqvpP9G0fq5Zq2mFxhJL4HeKMpN/OBvqRQy2Wld
         jnZ2LW3k4ivewXKgIG7Ydpt4TYtAHUw/M16b2Brz8Vwpit+hqpdRMLbnWfvvX8z/IddH
         wDiku2rNIC8YNaSMpHtV8wnZBb7sY1A+824NV4dKrENcTRL1U0aCXcLcVOgOJIn2EVMh
         qLENDSZtJ/tsamSIalk3KXE1tlUmaxdNevAIRyoD0IDSmEAaU75EgC7Ueq4zjTFu+25Y
         WCK1cnDFa+qOmsdGQ5LMWtR2NV2vh4lLwrmsh35uAzoRTb5Ne4ThPoedxTTQi94aZAyt
         Kh6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/F4YDFOARSnFOVuKAZrsxyXvTs9x4HH7yoISLFIchA8KIMWEhjHNIVVb54ouuxiVAb0MRAXJIAte/7YVpd@vger.kernel.org
X-Gm-Message-State: AOJu0YwZy6oaNmFAXGC1FsgOvVc4QNWj5j73QbF/rvWBqmSl2qhWlsxn
	8WKObY74xIEFcFySU1SgIfTEsEQS9n+rbxFP1OeXAFYiptTzRRy1uVhU9Jik4WGK2wIsFhbeoCL
	E5uixMvmp0jfhTqlSYjqYV+kjTLA4dtzyQKWTJAEIQjsLGRN2PRoGDW+eV4zxlwZAZwtR
X-Gm-Gg: AfdE7clQIhalv3nIRlWijmVjcZUtZ44GGAM84CaidlLNyys441WcrKSEH8mls0Psk7z
	MmOIDRsTsMJ74sAI9/imuMdAmP+w5Tty/ZU7rwxsJ+i65Yhpq339WvT866/zwv+qJvsKS18q2jF
	ljLhsC4blaEm5bCoqviHoudfcWpemcEuibL/xPeptsrva9VgpAMkq/AsrpUiE+UNf97J00pxQb9
	t2JxBXsUHlKqfyk112qM8JGFeKXcbx0FKH+uMG7ipLjGgl+J0V2SYiHbXshomX2wRnDDuZz1/tu
	J/mjSLXtlxHjC8lizTpNnfyrNbvcGUqzSs0mh5RRJVjF3jEP/6FnDY9DIO9z3ikpM4onBaNiIY6
	6pJFM7lRVso+WQxS6UiFA0gaiiqH0UkMfHdw=
X-Received: by 2002:a05:620a:450b:b0:92e:46cd:7299 with SMTP id af79cd13be357-92e7852f4d0mr764970285a.8.1783063708969;
        Fri, 03 Jul 2026 00:28:28 -0700 (PDT)
X-Received: by 2002:a05:620a:450b:b0:92e:46cd:7299 with SMTP id af79cd13be357-92e7852f4d0mr764968185a.8.1783063708545;
        Fri, 03 Jul 2026 00:28:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c779dsm237107566b.53.2026.07.03.00.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:28:27 -0700 (PDT)
Message-ID: <47a7d008-9ab0-4e69-8d52-bcf856f7cfd3@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:28:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/19] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX4C/XPZgPgZLL
 qOSOu8+hFeYuWj0Dkpe/XFIurGBG19/0YS7T8rJ7mQcl6anblWr1disIuMIv0w+Vb5Y6pOwFAIn
 viDhcmPeRKNS0f0jTlPSwFP85GGWw39O6J9iDrI3xaAT9acPHdUPbiVyISLdEvV2UdUaR7f/rTR
 DzRSL2EzRpWuvAyOiV8SHM1o7G1jrqUL7B2ZmKvhqJqkBCntM4h+8jGPkU0kay4wA4VeDD3Mdyy
 C2eTSgDCGWdv3FKp0eZec2JYMlf5l6dmTLJ0ge8xVJ50PBfachANERj1PbgrR50AsUDbtHJzMxY
 796hQo/rQmNNoucOMtykVNmOidbL3HnM7zEtuDeMzcH4P4o1UJVB0hgJfK9EYRQuX1ra9tYzy/Z
 Jk9Yc7bIfnBsqTzUwQviVT+laPLo6unc3ZDwPr1mVchubuVa07Rr4KHjFOS1BQL3mS/iQmwXKE4
 K3Cly0eY8b3xmz3jmEw==
X-Proofpoint-ORIG-GUID: d_vQfyiFX5gL7YrWOsOfNbyVR4ybgakN
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47649e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=wvqeoAhrr6bvGHU06gEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX0lubMM3m8uYi
 /eGN8nce3jYMW0pXyrdBFcaWWe2G6kIB8XjY1jF92d+URb7uPv3fhHzIeA2V/F94TyAP06Q9Lka
 ERanlxRqUpDXHloIF10MONzimD68ZRQ=
X-Proofpoint-GUID: d_vQfyiFX5gL7YrWOsOfNbyVR4ybgakN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116192-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DDBB6FF8AA

On 7/2/26 8:31 PM, Imran Shaik wrote:
> On some targets, the GDSCR status bit may not reflect the actual state of
> the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
> determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
> MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
> applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Downstream doesn't set that, but at worst this should be a NOP..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

