Return-Path: <linux-arm-msm+bounces-113438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id udTHJUxbMWqnhwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:18:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F40690636
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:18:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HMneu0pg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bLGZaHMy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113438-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113438-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92E14305E176
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F18369211;
	Tue, 16 Jun 2026 14:10:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF40E36AB7C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:10:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619005; cv=none; b=rvo9YXnwW4EOdMZIk8IjB+QaU1cMr7hFdaT3xsrkOtq39f/JTzOeqnaQfjlZWgYgYPjy3OZ9/MEY0rctayyxY9QubQnemGlTq2mnReIykRpTz7mvJSfMw8sdYyCwVBhQlCI8bj8gnDoXu/kxsJthutRN7fI56NHeD8oMRwDe89E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619005; c=relaxed/simple;
	bh=KC0LAXSuuATuN8kofJWQOna/09xZpjJ2YqbP0CvMu9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtmjDA+2KiEjIUpDQyfV9Upv+qd7lIvPeb+oH9RgX+7OANR6bAkbn+DmrDyUkvZagr07B9rnYWz+D3ompov3g4RD5R8D3ZbxXF8HJs+dYvCCDhjWbebdscEhCQRBxTtHLa1TFrgkYTwo2QmoeXR7E6foRWKLOzaasl1TB9ST2Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMneu0pg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLGZaHMy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GDxNUP769039
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	338RdgWm1BitM42Z3JFZaugzdFiKYaCi/SPfFLI4+Ek=; b=HMneu0pg3oefqv1z
	t7RtBfX5ubhVdhiSGaWVhIaCKNBlwBOOwb4V1eSH85D3VpsLLD8ClC5b0swlRgsO
	ZVzl9vXLFIdFIKBdBWSOcUXp/Sw/cK+/hV9fslRPg8xiSQ9yIWco7dtcz0EHabUR
	KtvPlYVhnMExAfranlRDlKvU4VpQrrdevrrUIEWzYMMy1LT/eAgP7MXEAFqjlrKw
	OIFjiIm9RGAnUGdo9o2qxc3GRrI0E2yccL/ziPcSZsZFoFeVUSUZbOlKe8q8XvML
	Ew8y5xi+4pDssJaPwqoOpqvShZ6enwdYcRARU8nOeic8swpvNp09C32RwXgOjV/b
	cKLkLA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs9hh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:10:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c5a5133221so157257137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781619002; x=1782223802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=338RdgWm1BitM42Z3JFZaugzdFiKYaCi/SPfFLI4+Ek=;
        b=bLGZaHMy+ZPqfbiSE00jhubVLq/D5Ku8774yh6nKF8Jx02rRpawrOhLCgWHv0ZY/rC
         4YFY1728Kkkay2gDIyZMzaFtuzpfvsYj23pMimUAdZxoEGIwA1GqEM+/QXZPGwQmJ+kN
         vUqrvTiN4wjwrpGDTXFZxAevU0/MYntmQev2rAObNR2F05H8vPVzAJ38lurR3G4yiTYv
         Gzjm4YtvNNmxWN3RXpV8BZxtkqnPdlRmvViCnVkGRF4pgY0Sly+WXhneGxtjFx6SGb9k
         hNDQjIWDUcXbXf9fRyzzbbOtbWjLvbjKT1YdGwT9lauBV6feWA1s9AdAYdCYw/RYqipK
         3cbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619002; x=1782223802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=338RdgWm1BitM42Z3JFZaugzdFiKYaCi/SPfFLI4+Ek=;
        b=Ez0ykagIZd97VTBGZDLCrwSu2kFzBEl+f5CwLtrjDpC7ZKR3QNd3cF78E0HvuaI4Qp
         c1PCVb1ruGRA7JksM+25jGgzxjIDAx29S//xWzrR077m7wp4bCdm4InJLVgVV4xqnDqu
         Xc2fs+QvI0RCOY7euIkkp7LuBqTQSJSRuQQ7i28r6wjWwu3DUqxi5DSvAvtQWZscovyl
         FG48aLy7xNSg4lfmjduFvjMtsenUOJOLC5hDAc+u22DrhY1PXVRIuUhz9XLnJZg82fIu
         vbxxEAcjtr4mNANRXYTxlH+Zzk3kUgJ6LPheksYA2W8yNl1G9mKwpsDx5wMOjF4hOJin
         7eWw==
X-Gm-Message-State: AOJu0YxF/fwFTao4vCJDXIRayYF92srzPiSu3B2qajM/zX9+PyI7ILcn
	XCJ9RTtZP9sF+iNgQH94NUG+qvUJDm3rBQvQh45+h+9Mp86ndabPuGGbYqV4eeORHFXNHDgZl0W
	SdEd+gVhteI1RfgkeBU++p6M+TOhxPJHHLrQPmfo4ZVdgMvVSwW1GKg5Yom4vXnIjT/Me
X-Gm-Gg: Acq92OFIfpCa28f5H9C2Hq/sbKblbH05Y/CZCtI7fnm15pdtfcjCutNZNCdni5UlHTT
	/aIEV48j6/nQBGULeF5rn3B52kZ+bCI/6Z8GafxKb79JAQ1s+X68UhTx/riVpQinYSz66vixeYC
	mZriyHJAVroc1cFMY0GJH5N95hyZnDbZeiiYiCBZrzdo29x1cAT6W78H1esb5ZTf9NTP0EqRmdS
	lYmlxEMzNqj6VeESUrku8GE4z2CY+s+PnFJf8FTPZikfmZfyiNxygIFygjjJxU84JwbwhDP4gIO
	KJ9+fe5C7wLbZtahVTUoEjbdPBqRuHuXs3Di+FGbg6p96fHGZzj0JHrcWTgCKd5CnV08kwbmvE0
	iRfBeFZu3aJlFynVtrfAOfR9IiXKxzZvBH5kqg1xf7BZK+w==
X-Received: by 2002:a05:6102:2c13:b0:62f:2f09:6039 with SMTP id ada2fe7eead31-71e88e2e405mr3405732137.6.1781619002200;
        Tue, 16 Jun 2026 07:10:02 -0700 (PDT)
X-Received: by 2002:a05:6102:2c13:b0:62f:2f09:6039 with SMTP id ada2fe7eead31-71e88e2e405mr3405703137.6.1781619001783;
        Tue, 16 Jun 2026 07:10:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5318d8dsm631878466b.26.2026.06.16.07.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:10:01 -0700 (PDT)
Message-ID: <c3943f60-8d74-4192-9bed-1838e81a4a9e@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:09:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: purwa: Drop the Hamoa workaround
 for PDC
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
 <20260616-purwa-pdc-v2-2-8dda7ef25ce5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-purwa-pdc-v2-2-8dda7ef25ce5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LhIzylgL-ZTrAi_4fTz7Ru4H4EyEVBNL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0NCBTYWx0ZWRfX/F7vqqWfw/p3
 /cA3tRBE4b+kf7kBy/pvq0LG3uhiw9TuM34FtphJ34zB7VwKgsEtA1tCmpDyYL2QA0UsBiEVvrb
 zEoCNf9b9befDTVsRV6abbk1HS+ou1bhDNYO0/YPC6mj6ZRNyJ7B6IrgJqQqGOFdTW1Ym2pQk/J
 JcRiXq1LPoU3EVz57z2V+PKjaUWcOlsRbSRprqdox/HN3wBl+ogrcj2TMZtGbMBUnLmpGVHgJCB
 W6mDH4sICTCTG2+DtKLyUqxgBel7xXUb4U06SS81i7t5b+fgVz5LtNXdp1rRUpsLFWGyFOX1FiN
 E25V6yJyBHejZwdEO7P7RsvnVBvDDCs5lt0MHKOGbClCiQkEY1ZmjfurZWvRdyUKeMFwr7nOjV4
 AoEp+L3tNHnlCmvdk+Oalqg0nAGfKDpC/6C4gx+8y1n+bSr/NKpask5zDqwNrxOLSXjKcyexQGm
 rliobjKKUDFs88r3uEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0NCBTYWx0ZWRfXw00ehXqzIbIk
 tSxsfiC3QJV5lc9NWN7m2bMlmhD6tfnKpfgOSYrvfGOYBXutbpycWOvURnqoF2u23gG2TfC7mNE
 UBJeAkRxf0P1fabdl+ay+CEppQsghwA=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a31593b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=px_f_vAfgXbzbh29wf4A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: LhIzylgL-ZTrAi_4fTz7Ru4H4EyEVBNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113438-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61F40690636

On 6/16/26 12:27 PM, Maulik Shah wrote:
> X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
> register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
> Workaround hardware register bug on X1E80100") is already fixed in
> X1P42100 silicon.
> 
> X1E80100 compatible forces the software workaround. Use the X1P42100
> specific compatible string for the PDC node to remove the workaround.
> 
> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

