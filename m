Return-Path: <linux-arm-msm+bounces-91489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FIxLM+EgGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:04:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DEBCB712
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05F253055967
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB11E34D3AA;
	Mon,  2 Feb 2026 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WStFVmCN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/rS5ek6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650CA35BDC1
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029956; cv=none; b=uCXdHIHFdvRZrYpceBWCsi72ZYMG1YnGNIGjDZ5OOy6sJw036lFGf28mSliDWoqSC4klv4ZecZeRoSA0M/Hef2/J5o1AzuIhda38SUVvfxAjLAELB4axH2zfB928wiyhBSCH6C868Bs5iqK9JWICWplE9NQyOGoMORIoTkyMh60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029956; c=relaxed/simple;
	bh=Dl3BIQHNAZA9K8D96BWlluSdepdKUs7++yL69iWcfYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nN86L1SMYONXs7Id1FVF86LLreu0hguwrKQtDAnF3lKtGhdzaG+8KpvRNi9OVhmHj+Oy//VTtyQeRx2mIwTrggOutB712e8KTnBRA97Pd4qmHrVb6E4rsl9YtJ8Vv3tBLPAuEU55/s++OR5zt8xcjec/DMohdqmjMBg/xqaSs88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WStFVmCN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/rS5ek6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61285Ki51335376
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfSoshNIZuoUQWdGf72ue86p/WcMY/Y5wpUVJbZySiQ=; b=WStFVmCNo3BWrXoL
	Amh3mV1I5frX/XLbKPIOi3XWVTDDEQloeny7cTZ4bs+HULUUvDd8BnLTesXgtjRK
	l5bJXksoaydEWmG55Lnk17DIl6r9tNet6R41HWxGP7sebyHMjh5+k8CWayapGAt8
	rTnzcD09JruggIysaoda0GFoqdaiKxh0Wyta6hy/03LCsWkGGKnobiHL7DDac+aE
	84Ch3mQqYtWcD4w/+GjxURopngRnYPptG5ItjDdVkezPd3jX9Saf+FwHva6+o9qm
	Y/W0mj2KVJ1m6J4BLKspEgw8CswbXUwZBnzZSTslfqDhyMCLEYMCoIjNsH3Zd/bT
	rFVUqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0w60s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:59:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c710279d57so111693385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029953; x=1770634753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfSoshNIZuoUQWdGf72ue86p/WcMY/Y5wpUVJbZySiQ=;
        b=Y/rS5ek627e82qHf+xez/xhEifbmq5CBpBmLHKhTMlYROXRbigokaQ1mDdgdVKTmUR
         b7edMeUaDiXqh+uym8pgAPgmDHY3QsmMTOknFsN4R1u2X74sTFCfvpwq4CBpECIANYmp
         yCIDxiv+EwwgBDnPdbBmykO0080hfmUYDHTrIqRFFG48M4O6Gc9CE3q2xBP+SWU6EKr0
         hJzmGaMerT82M6s+IQAT9FSDvrwVZePRZ/V3eFRvxLtxeDYsu084mnvB74MsaXQdqB2e
         lTjp+MvFPTIIFz6oe8odXewhZwNIka871GypVDT4Yi/Us1D+oNUln/ppTNeGPJ55FIrn
         2QsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029953; x=1770634753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfSoshNIZuoUQWdGf72ue86p/WcMY/Y5wpUVJbZySiQ=;
        b=WuEs75ygKeKDCgOKs3y3JOsJEJTdm9xfwuPKRqd0IQl1nt0Zg1C3Uru+GyBjpsJJnK
         QL6fawWsJMx8m64p8YqvBlEDHdBYlazMGwSqThm4edKMfnp2nzvtHutrbpPblW4B8Dqx
         Ic8qtlz2mxn726NQUk6NibmYlJ+6u7svFJtZgb+Rd1rZ4syC9ShOJZ3iOCrz9t4uUhMm
         kl5V0qe03ayB7KOZu5+NkXoYQCtbib/G8Wh6ielQV+hTU8vhmYETh0mwZN3LgT1O6Gzp
         vIP5PUEr9i8eaCB8q0TH/D2T8wq57+ja8RU8nPFXDusSP4iCn8XCI0rzFGUAXCP9VVSd
         yKig==
X-Forwarded-Encrypted: i=1; AJvYcCUcDKOauWk/vq7tlkhZx5h21v1YBBgXx+rg24HoAlWCZM6ZjHSFL+mpRXWXIpIXLYrs6rDth5PR+do7Gy7M@vger.kernel.org
X-Gm-Message-State: AOJu0Yw24z4elTopW90dDW7e5TYiORRunaEoGO0svLVCXZetiD1ChMRY
	5F9ufwEldUHYoQJZcTQ30vUHGN/ts8ZmoP7dRwJYVIKkTFVoY2PcgEncp1KiitjznDRDkZuNRC1
	xuiaC4HJN5CdRwp7OXacDBahs3uLbVqYJQd6UVOHUCFx84ZaA+9cEwkXDXoWndgsxKIffcPOhWH
	Op
X-Gm-Gg: AZuq6aKzqadp52Td/qbz4lgvXbPk4/lqQumkCdvPGafJuddEXOuxt6K/49kmK0kuQqc
	ux7SjBbAo8Eqszs6BIq469jl/6oiGYjz8oH2EDWSFHjeiTrWVar6uqokyx+C2Rjq8ih79LwEeT/
	TotMSdmJl02bd+pSzzVczZ3WjSwnrYPAlxMy8UeG937SrZZvQ4CIDelsVf7q8l+ddlk/+U73GeZ
	Wu9e7LUPRmuZlNESRfellKXVCe2yqm2CRocc9B8jb/tJ3820BAGqJ7HwqN+AnvBYSXZ2QaBi818
	n+ocGODpwlehrBkC2Zvt1sMOiKW4F+6uZykvMX33LHAvLWeAikix86jgVcJ4SBaWpVBX9rllfDo
	W4L5h6yVubUSWEFWfi5PQPDqKAaim6enpL63kBDDJxxPmhiP9ekur7AHADI1NEAjSV9k=
X-Received: by 2002:a05:620a:28d4:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8c9eb34f249mr1055531985a.10.1770029953360;
        Mon, 02 Feb 2026 02:59:13 -0800 (PST)
X-Received: by 2002:a05:620a:28d4:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8c9eb34f249mr1055530885a.10.1770029952939;
        Mon, 02 Feb 2026 02:59:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ecc73sm868627066b.62.2026.02.02.02.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:59:11 -0800 (PST)
Message-ID: <0bce6de3-9e3a-4a5c-b9cd-ec68096f9f1e@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:59:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-glymur: Add video axi clock resets
 for glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
 <20260202-glymur_videocc-v2-3-8f7d8b4d8edd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202-glymur_videocc-v2-3-8f7d8b4d8edd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfX3uhg8QsTXNgd
 mIkuwpEJjWDsctj6JiiYwddQapd8ZvN3b6XGMO9DgzAmNPSVGyeOHsb0A2GNkEizQKzrpsuy4TC
 nXiFdIbHTgezey+Lspbu3W1/Q8+LUwNikA4bqNo2vMx3HPepVYBiURUcNOMSTPkZyZ4GZu0K5bS
 Y0TXCu2dDzNnZMLnS1Vt9O0uHsv2QJ3eNU5d4xuMiWH8GrtmxDSaZDTBUY+pqv9JPmhuJhBWwoJ
 3tOZ/KcgejWCToRHwBKwKu902wESk1HBraYkDTXYk+8eEoKJ12LgzRoHJQodgQOjfQQfbT6TZMb
 vcELNPE41uS9UjKagy3r7gz1J5+pwGNo2P/Mi1oCn5FtfDsEYTvoBjWrtLIwMLXTtek0MtiARqA
 oZWlDHMO4K7XAH6IHyhmNGgEHR6VNHR6rh9kzgevnGO0csZ5HPjet5omahS+0xDAYQqqIRiqWH1
 J+bh6LJ5qQhzxymy8pg==
X-Proofpoint-ORIG-GUID: XBiGkoziQjqxqRsZ6awU8UTR5BX7-eFb
X-Proofpoint-GUID: XBiGkoziQjqxqRsZ6awU8UTR5BX7-eFb
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=69808382 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-zE5Bsz_LXmV53O_SacA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91489-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 14DEBCB712
X-Rspamd-Action: no action

On 2/2/26 11:56 AM, Taniya Das wrote:
> The global clock controller video axi reset clocks are required by
> the video SW driver to assert and deassert the clock resets during
> their power down sequence. Hence add these clock resets.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

