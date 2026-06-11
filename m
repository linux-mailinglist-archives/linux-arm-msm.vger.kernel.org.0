Return-Path: <linux-arm-msm+bounces-112735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H7HFM2mdKmqmtgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:35:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7950167161B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:35:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KJMEYbjJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bVzJEPMA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112735-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112735-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5A13302316D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144023E6DE3;
	Thu, 11 Jun 2026 11:34:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E6C32E6BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:34:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177668; cv=none; b=sSiYRqkKK91szx802Bci5uSTDwRIeKM6hlrQ2j5sj+Te2mtfCuuHIRzALAVstuuS047hlbQ+yLBNUUv7hWL1P7xhBTTAlMTySr3uuvBRYUalawjyqo+EVCCtGjvQxSRUNjpBZYQqZr5aWO2Z3/Pqn8u7rr7vYIxSwY3FOg614kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177668; c=relaxed/simple;
	bh=wxd0z1K/jMxfFNLgwOXIm4LHEBf7fMJ8Se4Mlgv2iBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcDt3mSy2ufuc77IjwrSg8App/vm+ge05uBGlcEkJihLKN3zDbNI5YsX4MNbXPfCPttuh8ONjWfL1z128UCk97s3BWP7pK7bsHI81fDxp2Xmhk6hoA3joTu5eyO0pA9qM0mGUUdJIl9iTQpZWrGst9LpQqQIJxbUxbe2vUt4Jy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJMEYbjJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVzJEPMA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xSLN174169
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=; b=KJMEYbjJhX1QjJIg
	qzimgbaUHeghco3qBZaeKx+eUTQqB6pYohFoKEgNGjue/bi2VYn0FjiWljfC88Yz
	PL+WKpId0oxytkz02xxNLnWmuYzncdKdTC+tWMJtA/y1ffnYab7hQWhWRpCbasdu
	8CFJMmsNbZzAfR1wC7FqQ7gnFc06qapLewpyVyHlcSmLLzyzpmAyruC5lNPOygR6
	pGu5IObLcBSgsX3C4VkB8LisJkl110QzjrBMWrTNYd7hc3/tHbI/W3N52bVgXzvV
	iFhsDTHQZH8eOo0pHngUGsWokLgLZEUbjGfiF/2ZGjF9z0EsMNPDvZpYNGn1Kw44
	kbp/QA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vb3qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:34:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5175bf22b2bso14803211cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177665; x=1781782465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=;
        b=bVzJEPMAlfYpYzHxfXKeqqS16KyHXcpX4OPTOX6m6oCd9ztmR6I01rug3HmzH3rY0r
         yzyqeynE6sZPFq1m2xlC4FEky7wWU5AUgwbWz9pWvE29eXVrXNknuxr5ibRiR6YTvyrm
         peXaDd+wl74BwVgH7mSqnRV9rL4HPVm7LIq88HoMr4oNCg55OVefwQZnfJKCCZ65oQCR
         PfgujfoR1BrUoSCaz2ungWYBOEZ1Mixy5bSVc05xWxqeHjW/Xjf4RtfqlPMRh2B1teuK
         /aH/Vu8B7LHPhYG9sEzH2yPysWHJLz3QB6y8k38H7gffsBMbuH+uEk1mUg5PCQx5Iwku
         4Png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177665; x=1781782465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=;
        b=Uwe14leKjX46ksYNiMC6ZZwheqJfygJuuYqpve94Bd/I6F9a86XA2bI9lXuBXppBn3
         PwcwwtGzJ2CWFxA6lESvCurKBBeOUHo4witXFly5b8WkpZA2uaYRdyNhRsP7Da2h7ry3
         7Fq03U4Se254LMTHNoC3ySg46ea62XeK6nFk0YDhOodOnYwkqIfiBBAAHqZIimIH0BXg
         jIP5qb9kwRrgGJ15mfslv/MtoCZtW1jcX94U7XYpKOQZxJyxxuxjaXxMBeX7RTpnIejZ
         26NSnONGxYkZEHwQYlEfEnWxJUxcsxRvgPyqxP2C6V8GRT0Bcow3MYFSIqPASmu4aOA/
         2XfA==
X-Forwarded-Encrypted: i=1; AFNElJ8mL7dQqY8pL6sIelYpqBJMBj6H9lT/WIOK4W28WNDgOzcQGrPXNOO29aAgqVJl9mNKxfLPKnEvFGR3QeDv@vger.kernel.org
X-Gm-Message-State: AOJu0YzbntCn+qJ7yX4UQe3BGNQ45vvhR5II5sSAxds/mU54NXnrfyCK
	8V9wKXB5uA4VmzD6rAVj/jSzQiLBj40kJ9sZEBRnfBSJ3aw02C34Vn9Zp2Aeqk3UF4E72zwSTGF
	uVulNvikbeqqncBnzdKkW3GSCpKVaGRK6QDnWfh5+Is6elGm8JUd4fbxh68fBcG5UbWiz
X-Gm-Gg: Acq92OF2UxVsozdM68L1AoWjNj8bklfishvTu5hL0NWobyvGLt+TcAuV5NR5gRfBY8c
	wylQj35WQ5J7S9jV10gQkB4ky8oviPtx5xKvASXGY+05jr4ZoR3aM0zGbbJMJfjqzrHt5wOIloe
	+JnBVCTX6l4CEYblU4vwp2AikmcWuGfE4J4pB12PdTYcHbN4b5dWHgQOJvR92tE6zbLlPFrzd46
	eqc/F/ICG3Baf8jbPysCaoL/gb1u47ytjEVQbUtjupHn7xIXit0ACFJJ4dqSzdlv0f9zxUBlM+A
	9e7SShU1mpQRKc3ssvPgwYlNng/4059viVFaFAlkw/tmaQp8arMIe/LUpew+STnah2s5TrAjd9x
	U44U/fasQYoiGt+GwjxxY0yxqGEYaOlkq1o7b94j22VNNUlpGHv+1YrcC
X-Received: by 2002:ac8:610f:0:b0:517:71b8:ee37 with SMTP id d75a77b69052e-517ed7bff68mr23801171cf.0.1781177665026;
        Thu, 11 Jun 2026 04:34:25 -0700 (PDT)
X-Received: by 2002:ac8:610f:0:b0:517:71b8:ee37 with SMTP id d75a77b69052e-517ed7bff68mr23800781cf.0.1781177664661;
        Thu, 11 Jun 2026 04:34:24 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585185csm10926810a12.16.2026.06.11.04.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:34:23 -0700 (PDT)
Message-ID: <1c5e6fe1-dbc8-4019-b88c-e7b4a45a1ae7@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:34:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/18] arm64: dts: qcom: sm8450: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-7-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J4vOrPqk5pFipe45XIWIviqJD879gSEN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX5v83TvHcFCPm
 ylpObGudT/9FpKsx0WkGCe1RHTbSxGmpCVfgNuXDihRiRwBtRKW5iD+jzzNnM7XywmmxDyK7tHG
 b7BE/pytHPvu8TuQcYZKQgMDpSRL3M0=
X-Proofpoint-GUID: J4vOrPqk5pFipe45XIWIviqJD879gSEN
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a9d42 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EbZ0H_4aSGrsEeNKfi0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX/wS6M/w++V1z
 EdZyATkVtaASj2msUu1tKwjf5rFhx+kUTy36RGJhhH4DRw/yLketCg7P2rXsLNnuro8hnsEAfrr
 WZlpwMePP5zZScgYU0+3WrtjQhYpj5P5md+OGN+r7cD6C3VMLU0JwVoR2+cssJZcj2hmiIrU/Bm
 OnEuP1qSEB+BU1wUeGLhbIWiFKn84Eqh5EanYSChO+ijn5lMADuKRrcec8lMkzPvX7jeHzZWH/q
 VXlgJwMXq4X2mP+6b1Mh8Vb3tjpds3DlBophKhH5zGuaW0ppVzcH1/HSaAQ5LXvTMHy2ntOhq6t
 G0KBEOFKSAefFuK0d84xLYEpAcybTPq2V4Lzx/MkWnMv76PPVPG6OdWBbNKZyyUDFH0dDyyv0jv
 UpFAx7xFCETfZ56Jv6DHFGT/0VvobW+HfJr8vdEUwY4ANWONgC3mFCNo+z2SxRjgkl5ONiAp/9N
 TW+8IZs23Imv+qmfcIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112735-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7950167161B

On 5/22/26 9:49 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

