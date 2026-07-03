Return-Path: <linux-arm-msm+bounces-116285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GHhpJNiYR2pqbwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:11:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8152701A6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:11:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UE3vIlnW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BszmisAn;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116285-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116285-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74CEE3128B56
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6A133A9CB;
	Fri,  3 Jul 2026 10:52:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99F437883D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:52:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075925; cv=none; b=UZ92WH3W+C/Fe7l+tnKiw21jkWyImRF4uXEI+aUB+L7+xOHYwsmBnNy2O15hGp2Lq+LqsU27tKblt5yOdkiv8pLLiwOxv5uIXVDjiAaAQJPmUhF1Ba6S8zGeriiHztf2BKXo72rUdb1N+DpnwA+b970JqaPxaDz71t5Y1h/DhK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075925; c=relaxed/simple;
	bh=xwO3YwLdpt0ZtZZS2qczyw+exgxev8bh0799Xrk0ags=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TSZKVZ+GBgzmP9z66m9ZpMegxQDD07Ge1CImydHuOkUXMrm6Vut57MtJSOyK8shGLLsD2Nlyo6kZnACg0VV5LbMv886vKSk4JgtqtoNCkASkAFZAauZvyuVNI8eIdDHwDaFA6eaqrX/1NubI+em6F58RHc1BxLPYRJY7RQ9bEsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UE3vIlnW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BszmisAn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635roPL3108984
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FgYvglaMrg+U1E+P+K00rNahNQw7AipRBkSiHE2CkC4=; b=UE3vIlnWFaUmla5c
	xXWqoIup1/FJaC+J+YPhp+WvVhtroIV/dol24s46yJYZBqs3oELdnjET3fYF0YrY
	hNtuPOxp63PoUzqZbua/gd48LgHc8btvDHp/5QMHxaryTLswvbIB1Yg6BZ3Vk1fr
	OBPF8nMqN19URLIfdXcbEIxNfeMpXTpOQazyyFCttX3XzPNojfnwrYYV0sGa9wdy
	E35Cs2HVjAbAEy9aIKaP/yjxB5jOjnX1llhoRqQ6DPeF5Ch3+SUvWUiM8NJUEqyp
	qFKbsM4DY43bftV8XR7Wnv+U4DKKhu3zKNWKvgKF88FD+KmP4cB33+K6bjou9laK
	xlXVKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eyamb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:52:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1fc94a11so1369561cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783075922; x=1783680722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FgYvglaMrg+U1E+P+K00rNahNQw7AipRBkSiHE2CkC4=;
        b=BszmisAneIoAKE2bYyySmWtHavMYZe/duPeaL+SZxHQfgoBaXabTGEx2VZbGPY+iaU
         aPe7zoAvDIVEDNx1n+TLUcClxSpHAWiFtOkknbnLxXuQhhk45ZPI9wv0UIXntcYR7256
         8vwrnvvK3AO18QHjkxd2ux0Ka/aQDFf+JFKcH8EsOHnkuvbpsoomdVMy0voDBU081CA6
         GMquWjyO57qRXrRv3zWzhgOznLmG2maNd6UTk3L0nXbr1PutOIoR3ZVYopaR4eEksq46
         aoAV/VYt+dWghTa8Zco4/oDS0scSNrMc60AIdhb8q1BI7H40PqzGaY+HSBMhnCgnko+n
         E/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783075922; x=1783680722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgYvglaMrg+U1E+P+K00rNahNQw7AipRBkSiHE2CkC4=;
        b=UzLGYLQtxEw4tAgj1j1cUj4yMfPgo7ejvci7rCQtGFmtBLvVlVuDFomDsC2Iauh5+7
         6KoksbgWCHn6PtxN4qV4V0sf5ba9KQ5T/UD/3Q/qGB5Y81PHoiEsveuf2oC0d+yEp/up
         EeccQaFQYw4n9k5suoBa4YCdrtYCRm+UP/TuviRlYpUNTshyGWNxigtHMh5JgMXcA9QE
         KxOB3zLvHhJzKW/pzF279HEIx7YmtCycy02wOybRWM2Y+2ZxuQD2b4Ef+55gbuepTbg/
         8kAnvuyma+87Y8BuIzshVPcjqldDrMLKBh9vkZhC/IPX9ZjJNZyr1R9MJ4n8x3BXehq8
         8WsA==
X-Forwarded-Encrypted: i=1; AFNElJ9+vQ3cAg58W81Z4yOmiPS2XhBrk5sBxQIM+zeIQvu2wNHLRU6i6dml8MXjjAgl5QC6hxkkNK5VW2um3I54@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx8kUt+wm2J1vnRvLCIFZZiiiXwLQKrhj9tJQJ9HY9taA6dZB5
	GxShxNsasijJFCI5tjyGrcCcp0bTqwVY0t7plHJn2dQ3/7OpS/8J/SPf6yKwhXJ1RBNwVaRTwyv
	/vJpxYkXzb7nd5FzLR6pwFYdkIMxhsIqNPabQSfBvI0yxsYXwLKY+B39EerR/UZ54Qh8i
X-Gm-Gg: AfdE7ckF1PcyshyciYI2qFdxgd3ydUE/vuDigAimhuRZbgGKWo1wh1AmJ6BkC2rJDaC
	w8O237RFp0ciuxccDIxhHc/GgXVYqXuegEhJl9DIan27GBZ1/sOkSBBvQwoTCLT9dZOeuk7VERJ
	Q+6L2fDNBy8BPgGh0x6dbGWmIIzpUqadszNQGncaPcUfBk3ICBlWPQ5csDqKPJ3SfzhlRmHArS4
	PsKmz7lDHBrvD8Km6y7WqxDW4ZqrNsL4G4Ot/k9COjVYuptSfNomUTjgJVigKDGdmFQaGeYQccq
	pDEu0XVMDDcLueBwXa5CxBwljGdV4n0xIPovhGHv0T5yYNpSwNJt8VSUTi7lwtMpISXWSmuG36F
	3IdD43l9ul2aW7E0ZfCQY3IlXndkdsZ3OUFc=
X-Received: by 2002:a05:622a:118a:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c26a55a4dmr96352341cf.2.1783075922266;
        Fri, 03 Jul 2026 03:52:02 -0700 (PDT)
X-Received: by 2002:a05:622a:118a:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c26a55a4dmr96352131cf.2.1783075921914;
        Fri, 03 Jul 2026 03:52:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6093786sm269939366b.20.2026.07.03.03.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:52:01 -0700 (PDT)
Message-ID: <84d2f764-3757-4d25-80e4-50a0b36c0c2e@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:51:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
To: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfXxfOaIq0uesp2
 81JLlSeogYa3JJEqNmJM6bDcf2+0VhELBmSwmpIQtdxdVwhTUwSuOQk4RS2JCasDeoesbj94uz/
 ir97BhxkkV1NG5L1DKtnLXTTxW3Y4hSCYwfXkDGknxcgFgaDgpS3q2ck6bcXvc4PyfQM0jeFTGw
 8FZRQH6jsuIlPBJoYL6o360GPJAMUNPXE5/fTpFY3lt8xFxsZ+mzDUtl9UoCJzARe5TII4m+wH4
 sbPn0gr8Q/zoVjCKEln5Pr88FT8fajwwoOhSyB9C3HwbVYo6WZ0uFRIby3oIvabduC6inQUPkGP
 k3zYOkkdRCWCIfkQrDClY40FzvB/HokUr50Wq1jfXx7DLCsxZSTR/Lqb/F7wtb8FTWS+/xIXy36
 iVoVRfaaRG7s3KZLUn0pwICMuT4xOS/ljHtjLQz5Gr760TYw6z7uvP9ra99Nc+6ioOD7tAFFIqF
 Ej7MPRrGyt51iV5ZvuQ==
X-Proofpoint-GUID: mxwwAhZzy1YmWWWFvbnPwtgyFcITW2DA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX+Bbn5XhWyJ0j
 Q974+ummMmiT/8IvrYS+OgwtgH/l9pcmP8HQ+ye2AHy36ZDN56HGJtQKdCqcouDhCvoG4x6j9Jt
 FPNlZf6JrAKstjPyeEkMN20cKHyNop4=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a479452 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O4NR3KnNvlTAEidytREA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: mxwwAhZzy1YmWWWFvbnPwtgyFcITW2DA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116285-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sarat.addepalli@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8152701A6E

On 7/3/26 10:58 AM, Sarat Addepalli wrote:
> Add IPA nodes for Qualcomm qcm6490 board.
> 
> The qcom,gsi-loader and memory-region properties are provided by
> kodiak.dtsi as part of the IPA property consolidation work, so only
> the board-specific firmware-name and status properties need to be set.
> 
> Link: https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/

The link and the paragraph above have no business being in the commit
message, because at the time of applying this patch, the referenced
patchset would have already been merged.

Konrad

