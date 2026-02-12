Return-Path: <linux-arm-msm+bounces-92670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKH2EjKujWmz5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:40:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5E212C9CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AB2530191B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6269C2EDD41;
	Thu, 12 Feb 2026 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llZr630d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHpAkyD4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564DEF4FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892836; cv=none; b=tb2HoJSatcsD6OX+KbZ4m2TLLSQkxhdRrFhm31uKsr9ncbKcUIoVX/9r5q3s6eHmkV+vTK/CNih2dNh97D5tCKcGyCPBQ22BTU8sX8yaI475l2jnVmCU6oyJa4Rii5lMxxPaZ3kWcWAP5gF393aWxuVooqiIr9xlNw3tNgfSVHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892836; c=relaxed/simple;
	bh=+hW5ajGSF0hVIU5OydjoDIk/SkgeKanNlyIsTvgtDgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4ujjX+cmMuLhP5mjwqnzaNpK6ZDRJRlk0j4xat8A/iIWtaldE2xD/gOq+B3GM0zXOEnfXCmlRQD2iCOMW92uoPhyJSsRLjdXPq3OoWeoi0RtMyjSazpIHkGDzP7mJx5X3UBA1CJfoflOQBkTB+WjuSdoAN77P2duHLYoLeml/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llZr630d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHpAkyD4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAc6TK357709
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zk91yuSKkTLevHKT4qig/gqolrYcjX2jLgr44ov83Lw=; b=llZr630dM+7ioW3t
	mw+F3zALDeP3QUI3eQtYXZIdpl+rZs1XvXd/v0zL9q/KAPZ3CY3gmz/iJXIz5N14
	JLJqclxWllymXjYb4Lds419nrwzzhI+OBx3e7AYUUloaU753c3i1tFLh+cEU0asw
	IhCrYm3C1is6m22VwrBXOkM5vQvaU6WPp9fQdKzTlV4F/d1V5+AZij81UykPfRPl
	ZDMK+Lt3OGeWJgjI5A+8H6y61VcbVBhph1+ZrJDzlQNnp83SATGzHMh9JEZCmmBl
	YLxowVZc7vqoBo0473zReeLzZqA+DlqoUuszslq+ZEz8pzXVTW5Z4/eKG6HisGX0
	UfkMoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8uy6beb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:40:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52de12a65so149112885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 02:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770892833; x=1771497633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zk91yuSKkTLevHKT4qig/gqolrYcjX2jLgr44ov83Lw=;
        b=GHpAkyD499pVjnsZ90N7xCEade7VaROpAssB4MXyKzubeCzTd2vMN7zURk0/dOYSVH
         lIcPr9s795xkTBuEuk1IRNSLIhZc2x1BHhhC9kM4ITwtARsPdue03a1OEU/zgTaGBjXr
         UyTXdJ6tk+Nx92cqBZwxacLPQb4xFZ9zGBhnQgCxuAd4fdt1FjzPNE2ixAAp6JguPQYu
         1EVPHagvjIvM9q9kRMcOxanEk0phaUee6cgjjxa82H5piOLbbIBsd20dR2bi58pa1nWo
         fP/9WwwksVujLmXBu72TaPI5EEBRS+X1RobZVCLRjptaYZlkRfaeKNFbfg01wPtJSJJA
         8fWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770892833; x=1771497633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zk91yuSKkTLevHKT4qig/gqolrYcjX2jLgr44ov83Lw=;
        b=qZQcVy2OpWHeZAsssnVrMrkmfbS8QOSkbmrN2EXwxOoIxaOJHJq+SQuf0/4ZUgwwZx
         fNOBfF0mxhOQAxDgBcJh+GSumQTrJH72PAIUs46QVnohOBbw2GcrXKD4YdhVwkUB/we4
         qV3nmvmj19a8Bjnp4BgmV1dCakPJzMb4qpXjHpUkDT1kTXt9kGbrofLkTrg/fbkjlNJe
         qYLhC6IeR/h4aLzQwGPCQhGy81gakbOl/2/RkMTTST1laN5xy0ZN7zICkgJxq1FFb85l
         MEOW/p/fJUjGWrZVgtjIxBnb2DCOr1MmofGgEcO+Vo9uEDyXJRvGWMr1E90Nlmk5DciP
         olVg==
X-Gm-Message-State: AOJu0YyWlfB0eLVI6ME2mRi2QjIPe8EMFyg0KReQwkKpuaWT+lv3m3ef
	sZoE6m3WDl++cr9+oN3BogcGnTDpZErTOncTemW7xug0TymTi/P0x3PVOIPzw3a2MwNeDv5Hbm1
	x/XfXx+LxmncEupWNbTRuobEHW8q586wFJW0F09zBcOLqHhcD6l1CHtB2+t5vlX+Y4k3z
X-Gm-Gg: AZuq6aKYzAmkNuq8DRxRyQKs4TTxpAGIjDoIVloToU+H8I4XpFsA3E1OnOpuqgtTMVj
	+T7N50xn4ZQAaX60D9DdvKcoWQeiclsIScqdxkB/imDMJRTq9F3FB/PQY3ceskmmR+2qgV8Br3v
	HUclxvMvbOjIA+tA2Cp+T9JSISRKRafwX8CAVBjymwrsuTdQi/ph8O4KgMqR4d6gfxQb0hIl1XX
	x9vFKHF1+IFl8WqqBfoZccGTsIJHXhcYLz2uj/f9gg123N+XGcYctgrDZ4ox/0FkAy65WVOy0JK
	18+LuG+v+71EQ5DREboluCIz2iJ22EEsU4ocHqFgVlr6sJ+6yilFRrD2m04sJeoP7fR72sgUtfs
	uw/uCuIeb1wuhZgTryF1MXdRVvL31wXnATAmErAOGy49abhZ+cuwQxnzvDRP9dvkD4L7l0Sq50I
	5r0e4=
X-Received: by 2002:a05:620a:1aa0:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cb3315d0f0mr214787085a.9.1770892833383;
        Thu, 12 Feb 2026 02:40:33 -0800 (PST)
X-Received: by 2002:a05:620a:1aa0:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cb3315d0f0mr214785585a.9.1770892832995;
        Thu, 12 Feb 2026 02:40:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3ceb1d6esm1669599a12.2.2026.02.12.02.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 02:40:32 -0800 (PST)
Message-ID: <417851fe-821b-4806-8f42-70d4f77b4321@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:40:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1-asus-zenbook-a14: add HDMI port
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260211-zenbook-a14-improvements-v1-1-d970af6e25a3@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211-zenbook-a14-improvements-v1-1-d970af6e25a3@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3OSBTYWx0ZWRfX46xZASNyjdKr
 iT3+sNLlP5XQWYR5FD8veYNL2PaLCF3c4Kr9wRWUqJARHdx4zB1tBb/h9f8Rw5JFwmnPG4VDYWo
 jdiXamOnNQBDRPpnJyh8Oi5OuiXDPleaW0hSqhqJFKM5soeZxNmXTgWDI06DA8VCDuQHWyvW5UV
 7Ai5UV3LrJoIQGuleeCbt0UfSQ9+fz0nZX1y8DD3P8fub5e7DvoMBcXfj8sz90629BylxwGpfIK
 fiG3o+oBgmbVlyJ66ZUGqToBi2B+qE0W+YyiR4r1lwhV1Sd2142PtItoozPW2slr5Xog5Qz0z94
 H1fQJDxi8ElM/AQ4fuOyXymuqtp/bLaUj7Vo9eFyyhKONX/LgZYVXaYw21QcfP5/a84XMtlrGdS
 oyC9437tlHKh94TtsrI0JYjSURTsjbFeoyCTOniK6ADPCY89EiIRtVyjzF/9ikX8kQcCXe+kToo
 bc3pl6ow0Lf7tl99Olw==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=698dae22 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8 a=fxmWPyp_P7rxp4x8eQEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: Hx9GloMLxj3KLiaZhAget73GYiMOc7D2
X-Proofpoint-ORIG-GUID: Hx9GloMLxj3KLiaZhAget73GYiMOc7D2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92670-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vinarskis.com:email,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B5E212C9CB
X-Rspamd-Action: no action

On 2/11/26 1:16 AM, Aleksandrs Vinarskis wrote:
> Add HDMI port that utilizes qmpphy via Parade PS185HDM DP-HDMI
> bridge.
> 
> Based on commit 34d76723c410 ("arm64: dts: qcom: x1e80100-vivobook-s15:
> add HDMI port")
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

