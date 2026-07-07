Return-Path: <linux-arm-msm+bounces-117203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F5ujNiC9TGruowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:47:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 355AC719505
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:47:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PeVDUUfK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=E1cJ074x;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117203-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117203-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF2A23022A8F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F24331EA0;
	Tue,  7 Jul 2026 08:43:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA180330328
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:43:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413823; cv=none; b=VSYioY6/CwBf+aTOY8Y0V9i+urYKRfI5WPSbpXuFI9Ifd8nkmkyV3yYE0v3NO23Ib3IZ5WJn3PCYKyRa5MmfwtWyLwFOqNcjMHUtPxCFzuLm8ALaaWSHyzYQDmMuaJZM9K+b7hwS5dkVpo39vSO0folQmCOsUyBT9oaUdOZ8h1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413823; c=relaxed/simple;
	bh=ndLgSXx/mBdH+aIO/R/melqhTk5w4EmPGLL7fH8ffyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGQyiUc9+nx9rglIefg5mBm0uE0LQ2hdKzvE6jbm7fgcwFxx/aMHjN7mgXXwlJuGN/cwvUtrjQ1O7KB8eCIfDuqeZkGSybAGiy+Qea4J28YRSg06roTHtXgbSmFrefL4lVthn55b4fMt5ZpTr64/c2k9Ky1t8fR8zfIgugtTnOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeVDUUfK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1cJ074x; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dlsb3050576
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 08:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tz2heZwqcXE9G3TtPQ+L0V6o
	PZSaui8/wbpBIExE0eU=; b=PeVDUUfKU8Or2HWA2zJvNNCXoookpr8OqY8Zp6XJ
	1N6t+58r2et2rMHd+fXDcBxXLeEn5HnRB1jAbiEd1ogKt8ou037Rxkt6jC7fNlni
	ndSQYKBqBBF1OmcmaNSDZVAmMmvpakKdefgc8+1xV6BB/GTd+IOpDAsMpsdOT7SI
	ebWrFjLh2tBIPqiMQDDZbT688VIsXzQY+gyiaJLrWTEao2bFW4CInFtMu5Yk2fY3
	IW/i3VF5W1NM/dwWTnM0TyIEd8sm6JDBc28cjbzLhKlawN1O+JEglZYkXRV6bkIc
	He2ShxziCCnx3LIB7SNrxmDUifugAjI890xVpNUFpv+e8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u89s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:43:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7f385887bso62048805ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 01:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413821; x=1784018621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tz2heZwqcXE9G3TtPQ+L0V6oPZSaui8/wbpBIExE0eU=;
        b=E1cJ074xYwHV1nAy8FrwCsb/UnIk8EXm3i7IQbwIbfNrJNGOkvouUt+Vuu5MHEM26i
         qLGHgj2z0toCN6uu8Ek4kdr8KpOOX6FIvIrkDgYveim/7bTfmUVuh0AhLfG4/MWvCYIo
         VfpIIjaULD57fvUUVAVzhyUnhJWzf0u6vHKs+xLmwYqPH0AbdhtPCkL+P0m5imB1jsNn
         bWQ7lbDDpanVi8PV3LazLr6f7EEVRdfgSBdwWVcmYKYYC/qtwQoaZcb2TF1Z25uIwswi
         WOqXw6Khei1fxWQyA2+uVCtUcG5cnQmmjyHlj5Gnjt6b+jRlbL1tsYbipQJKoGxKoo/z
         EtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413821; x=1784018621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tz2heZwqcXE9G3TtPQ+L0V6oPZSaui8/wbpBIExE0eU=;
        b=mC8f03J5k1Ev6y2VL03nd9cGtVdqG87DO8ecAhIoODROSm4Bmg6bEqxQHZbFl66gL0
         EhsW641oQjg6r+QbnlMja5WQOeWxhgbfDdrSckI2sd0i5PDY38WTbRN6+kI+mUprI6yx
         by6SuT5DpePjkDvr4rzVKN9/3ah1UsCDC4gwJTSPWcsPFXbFcbdXFQU4YCyvAI/Dtukk
         lh+h+4qJwGTw8GMqzjD4AKqWZ12D9yO69/xl2bSKnM8kRSkNccfGfC9HM4LGjo//2r4x
         4sI/q0lwFgH7ypA9OKDHYhwRKkpQ+HCWQaYccAVwhwj+pRCTqAH4ZW81UP6cLxX/+98+
         eqrw==
X-Forwarded-Encrypted: i=1; AHgh+RrmygsJR4GErehsd8Eh1xbv5JaAt2XXdNX91pOIFdrXFE4MPUxSLJafBTM27n5t+SwZfoDa7F4KHyAOmV2U@vger.kernel.org
X-Gm-Message-State: AOJu0YxFQ3JGwRbbaUA/aES0r1USsKR27NZzqA6gytkyrgo6GWMWfwru
	MQWkKadmMLlas2oocDkHsSnBBVvJ/xQ1YhPltrOD6Kr5A03uUdYbjmlRfZX22mJUf/YrdoKUgsY
	mr/lC6qVRhpq2EG2uDS71EOsEAYz6wTQr8/gujb9NrCLfaVR3MEPAm0GegsL6AASq4H8s
X-Gm-Gg: AfdE7clmBpsX4AYldE267wwdlS3r/CqcB9s+yozobSJfPwE3KNQc9QPlpiQHNKkFxol
	qEDIDMW9DSEgm4yWVoTN+fsONKlLit9GfoUkpIapFMy8RYQoy/BZlKbr71G+INHt+y7tIJmqXrm
	0xEnqYItwuio8uoPiJGVYpREfFmA+VBIPQtqMvPxLNYm3mWyAarI5fvsoEAT90NYB9Y0PohjdPL
	mK5uIe9COOoyUm4dPobcWsw/acbn5YaSCEMUx3OEuNe3kB936L041sBdT0aaPAEK7+8L6Y0dilw
	Q/6JSjCqfqOwJKceID5dxzxNi0d7jD2HK9FNj2EO2Wan1Jq7kfcTexpWkAHr4mHys7QUs/2BWLZ
	JQkJCgLU1C8iX3s6tf1UfnCHS97jIF2i4L+GpqeHedXtQ5rMyNPTcIA==
X-Received: by 2002:a17:902:f611:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2ccbf087932mr43714735ad.38.1783413820765;
        Tue, 07 Jul 2026 01:43:40 -0700 (PDT)
X-Received: by 2002:a17:902:f611:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2ccbf087932mr43714455ad.38.1783413820227;
        Tue, 07 Jul 2026 01:43:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb56fsm7935935ad.15.2026.07.07.01.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:43:39 -0700 (PDT)
Date: Tue, 7 Jul 2026 16:43:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "dt-bindings: i2c: Describe SA8255p"
Message-ID: <aky8NoA3r7WsjLXw@QCOM-aGQu4IUr3Y>
References: <20260707080229.3795971-1-shengchao.guo@oss.qualcomm.com>
 <5926f59b-e0c6-46fe-a839-620a2648c335@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5926f59b-e0c6-46fe-a839-620a2648c335@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NCBTYWx0ZWRfXwkCj8vOpBXvI
 58DHQrJQ6C5ZVlI6ubjdgszfFrGAPp/T1XwQaErg97FY0IpAWuumtDvdUD+EDNEX5+1Rz/6u0hV
 XQmEIosyyin4W5Iyx8j6UnjJzbfT3aw=
X-Proofpoint-GUID: LCqPE8qkNk-F8DU0PuSW4EaeLyHpDFQP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NCBTYWx0ZWRfXwjA55uxUlypI
 RYsAhy17LpBovMdGY1D3nd1v6q+w2hSKBBT/M/z+Q+6R6sZB54EsSyId3Um0ivMQhbGxJGsJcBY
 rh9f+RkSjgDd8htkkxjkalT+K0oa3A0Q7NANbAlVPXMBQ2T6TRidThIknashmEv+z7uR1S/8xUy
 1Yx4abBGZSRHCsGUG3Rnn0szGWVMvsXBT86Q5eMvY/v8mcscLxpI3PH6JcVXkZRHXpPK09DJgQ+
 7IRHHeGEPYI6M8mtbYjLgTsXUTBdM/HWVoFVJ9aRzmWX/Mct2ejwu73GN1XuW+ZGAroOlLzOBaj
 YysRyBb1fzbMCLn1alS4Ti0c42/FKZLnqhcsiu8cGVbdr4ZeNH0ka+hGHQ8jW9kScLaSZCat4ym
 7InktHMVjMJu6kVCL2F3TWDP9gll3UF2zBF0AreLouiU2irgLMcXMcbANtGFX4LaxP2xmy39CUj
 SvCuhOD1ruTaNbnMJtQ==
X-Proofpoint-ORIG-GUID: LCqPE8qkNk-F8DU0PuSW4EaeLyHpDFQP
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cbc3d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=OBtQoVzB7WAZLZHqdN8A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117203-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,devicetree.org:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,QCOM-aGQu4IUr3Y:mid];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 355AC719505

On Tue, Jul 07, 2026 at 10:08:09AM +0200, Krzysztof Kozlowski wrote:
> On 07/07/2026 10:02, Shawn Guo wrote:
> > This reverts commit fd359c0272bb4078f3a7ef34c1d53ee0deb59900.
> > 
> > Compatible "qcom,sa8255p-geni-i2c" had already been defined by
> > soc/qcom/qcom,sa8255p-geni-se-qup.yaml. Revert the change to avoid the
> > same compatible being defined by two bindings.
> 
> This makes no sense and to prove it: are you going to revert all such
> bindings, like 100 of them?

Nord compatible "qcom,sa8797p-geni-i2c" was added to
soc/qcom/qcom,sa8255p-geni-se-qup.yaml, as that's where Lemans compatible
"qcom,sa8255p-geni-i2c" is defined. CHECK_DTBS has been working fine by
matching geni-se-qup yaml.

  make CHECK_DTBS=y qcom/sa8797p-ride.dtb

Now with this geni-i2c yaml comes in play, CHECK_DTBS finds it instead
and starts complaining about Nord compatible missing there.

  DTC [C] arch/arm64/boot/dts/qcom/sa8797p-ride.dtb
arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: i2c@880000 (qcom,sa8797p-geni-i2c): compatible:0: 'qcom,sa8255p-geni-i2c' was expected
        from schema $id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml
arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: i2c@880000 (qcom,sa8797p-geni-i2c): compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255p-geni-i2c'] is too long
        from schema $id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml

What's your suggestion to fix the problem, add Nord compatible to
geni-se-qup yaml as well?

Shawn

