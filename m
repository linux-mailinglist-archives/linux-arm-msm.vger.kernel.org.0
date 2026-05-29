Return-Path: <linux-arm-msm+bounces-110220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ERVgOis7GWp6tggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:07:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F535FE512
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 805E5304EC10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 07:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CC13AFB13;
	Fri, 29 May 2026 07:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnDSv3kV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jk6XU5I0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2808F3AE6E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038360; cv=none; b=nz2D1QULhnNDhra9i7puw0ZRM4J6cgMyAogGowQF4ap9fJFs0myqJ7MbXVNRdF351qvAT5ZXgezY30/NRdcd+b4pSTQcS95Wl7hyXpgaPETm5qXmVn78ap+ckbMOe+gc+QFEXcqkFqW7l3uwhQDW4TJCNrp6BloTBg3vQyT+SRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038360; c=relaxed/simple;
	bh=2PAalM6kKnFYU06xQ410VdOXAbMQi4bwcAFMRjokBhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFeexb2271QJAEkX5EZ6L9bC/ABwr/Fozv6xQN6h10RNxG6xag+mQV56rsENEi93lAGzK6DVCzKfvXWKo1aoftRjivRBL0wx4WmpDyjvhfMqZoi2pKhesOTrp/HXzzxUnkD9QXIK6Xs+A4yjDBs/NSusr12mKJR4B6A8Kdg6vsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnDSv3kV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jk6XU5I0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6Hkg31370525
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uggOyLdQd0AYcPA6LkUyUkRX
	QuNDy/j4iSP3iw0FYuY=; b=KnDSv3kVDKGz+GjdoSGlAYotV3tjaBLTK3MzYMLn
	kdp026GxURdxXe89mw60cWHYa2lQYJyY5N6Qq6ulJ1+vrf4F1cK3sR13jvf/h1Pn
	O5xf6eZbMzUE+yInZpDuAUyvAuyJFCzmhDgZq5mi9fIQ7EDYXjaqrdaNsXUlNava
	7uLINZAKzuL5uYBDYoXPlFEZgPV+3dQ71Q1+Ekeqjebewt8zZHZfIrTEBG7Ruwxq
	NGZfoUHZaDDzyIkjdbISEh/C4Zj6ISwKkIni3k+Dqz0IRTTi6ASInuM2yw8T4w1g
	9P0xlHEIsdguTxiUw7+MBuioZA3oauMxtIleSRQoZMLoeA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5tu88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:05:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so3638347eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 00:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780038356; x=1780643156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uggOyLdQd0AYcPA6LkUyUkRXQuNDy/j4iSP3iw0FYuY=;
        b=Jk6XU5I06hKOzEaJU7HG8GcXWaPxji/t2D5FGa29xWE6JU+frqEZTFqHzsVjZLFvwx
         l9FI+IKITTI/seO3g/mk57y40nzI64udwJlc0e2X6RICM+rfdcmzFen7CezqvJOtg0ub
         qSGp//JlAmabCbjkmjrVG429fRWsBoCoEEvSo+KYkmoUmuPhnBP7HySGKKIcTpYsam31
         LRpnwn072uy8XO/BEWXPpv8/TuyElksqfQoL8oRftQVWmyG0V+pCIzdF6Ws3Jh18fLuu
         lq9OGmJ6cp+0kgYnSG/zIzctTJMeKTzQ5JX1oEOCHeAslcF4hKkpsFJt1scO6pSoFCqG
         7KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780038356; x=1780643156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uggOyLdQd0AYcPA6LkUyUkRXQuNDy/j4iSP3iw0FYuY=;
        b=DF2UENfJ6BHCvj7SBA0BhWUewz6kI767aNFaw4qqMcvaEKttryChR7XpaTFA75NjaW
         N5tixXrTKncuEUuxC8MjF+rr2Qqt5rmjvcIK07Rd1CEHs+Zp2kt+mE+B1KYaQAmyyZ3c
         r300JHvTYwbPsvjNYZh2fVGFl+/erTCjVbul0WqSUojiqVCcscJibQSXO4oVGAooVUyx
         T4XPnKriyh7EIVQz6xGU2EVTr/n9dH7ZZ0mRZNqR+Db2HGjPnF0pDosWFcm0WMb3wPZd
         CChYpdkrwShAWlOrduY+rh4Y3q4Z3FuoPj6LqcgOxKm2kPpWHshq4zkzAqzXB66ANMou
         Hjgg==
X-Forwarded-Encrypted: i=1; AFNElJ/Y3btnVe/3uUS9eN6gkyCER9xqV2gozaMjStUPhiIN0iazHbbXBibkHhElNvufeSNMmq3Fn4Js25qVIiIo@vger.kernel.org
X-Gm-Message-State: AOJu0YwOIOf3IqR8tyjFln3hMVwHnfmOentsMD0oveRhkpNc6BhlfU5P
	siM5DnaeYUFvT11MNSqMBUBKbRKKV5Afg7cF8KjE/VTSrOzLkI2BhnOeTv2WPCPzmlAMfQd2gL1
	P6Y8Zmbb0zNtFMN+15Fe/bmJm7AmgnUzevzx2ax7QU3clwMAs4HuGStT9KoIndDDh3tYc
X-Gm-Gg: Acq92OGgPLBikt1VjbAVY2JxFWJw5zob57nHL2ogsNe+Br7m8CZ1KcCbW2yTbp906zB
	ltEXXGSYek68UkdKCuOYIX1M3Iw4mXNDSNxipBL8gpLsT2ddPFHsP87zt39jNjrQYEsoSPh8nVG
	IKse1hPATaN4VecixTms6f4JpwFVzByHuaE1HoJ+SdZrmOm4tfpPRdaDrHvFGmakr6aQpUWAITf
	ra0n4c74NxfS76WjY/HoHZ04K6pM3K9HX3kk3aiLB3gVNG+UG8hyMPPi7XX2ifdykUnHg7BFQKj
	z9Zx9CC/+JQ/wwshF08lJSb+1D2KKv5gBjz+6TfM5dgPQUkbJuMUIcy0PQfVjD6N+WonelHHS5l
	QQGGcgqGwF6rLytF2vJ3Mj5HPf28ropJAmHBo5N/+EgUdb3uV9FmU3U31APbZeuaQHgc4ufo4g0
	6e378=
X-Received: by 2002:a05:7301:fa04:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-304eb0c567cmr819259eec.10.1780038355902;
        Fri, 29 May 2026 00:05:55 -0700 (PDT)
X-Received: by 2002:a05:7301:fa04:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-304eb0c567cmr819240eec.10.1780038355258;
        Fri, 29 May 2026 00:05:55 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed30fffesm746891eec.11.2026.05.29.00.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:05:54 -0700 (PDT)
Date: Fri, 29 May 2026 00:05:52 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom,sm8550-tcsr: Add
 QREF/REFGEN supply properties for glymur and mahua
Message-ID: <ahk60MkNDYOgU55F@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-1-ded83866c9d9@oss.qualcomm.com>
 <20260528-adamant-termite-of-drizzle-0c39de@quoll>
 <ahg04dmgSWPuA4Tk@hu-qianyu-lv.qualcomm.com>
 <79515bd5-a1c8-4317-bd15-71569f43e522@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79515bd5-a1c8-4317-bd15-71569f43e522@kernel.org>
X-Proofpoint-ORIG-GUID: 1KjdUhk-PdtiGZC7hX0n0U7JDfGTK6wo
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a193ad4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=55C5z8EV8FhS1RBCIaIA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 1KjdUhk-PdtiGZC7hX0n0U7JDfGTK6wo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA2NiBTYWx0ZWRfX2SoknCyRbW5d
 MLVj+JIqqAFhYxMgbBtZ05tFZam45Tnzg2VaiMhMQ9kzr6EKiFcUfFpJ5esSoAewYKTJY8foJL6
 i8kCqrWHYYjNsvzgggdhV+EXhhl+vO/hKXMtcA7GrV2WhtUwGSxvGM8TXAAuW/Zns6urea5ekFS
 OKzscq9lAOzeHwRijte3RVujIVTM6xajKP6HEzkwEzGYFQqILl4Emm4pIiBB5SOfsFo2BFOXuBn
 Ho9NESXqyuQ83msTEtyFXqqt0vPzFLNFXSUJmP13OLs/s04+j5cXDnvCaXiycGq84sYvoJBfF80
 7RXkpRLvc0ri815XWPoYMKvaBpoXR/99LMbPLoc0/5eOJclhPLBAJ9ooLdQIJC6mmyMdBu270C4
 KfzfPyA80SLRMCuOGwqovXLEGRqxIY26Py1PDj/6kZvJaOlUStcTVNKqu1+pto0V7/ylReNQEJU
 YQlpkN8RtTSFg9W9b5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290066
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110220-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,hu-qianyu-lv.qualcomm.com:mid,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F2F535FE512
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 02:34:14PM +0200, Krzysztof Kozlowski wrote:
> On 28/05/2026 14:28, Qiang Yu wrote:
> > On Thu, May 28, 2026 at 09:57:10AM +0200, Krzysztof Kozlowski wrote:
> >> On Wed, May 27, 2026 at 07:29:12PM -0700, Qiang Yu wrote:
> >>> The QREF block supplies reference clocks to PCIe PHYs and requires
> >>> dedicated LDO supplies to operate. The digital control interface for
> >>> QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
> >>> QREF has no dedicated DT node of its own, these supply properties are
> >>> placed in the TCSR node which acts as the control interface for QREF.
> >>>
> >>> Document the supply properties for qcom,glymur-tcsr and qcom,mahua-tcsr.
> >>> Both SoCs share the same QREF TX/RPT/RX component naming, but differ in
> >>> topology:
> >>>
> >>> Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
> >>> has a single QREF block fed by REFGEN3 only.
> >>>
> >>> Mark the relevant supplies as required per compatible using allOf/if/then
> >>> conditionals.
> >>
> >> I don't think you implemented my last comments. You need own binding
> >> file.
> >>
> > 
> > Thanks. Do you mean qcom,glymur-tcsr and qcom,mahua-tcsr should be moved
> > out of qcom,sm8550-tcsr.yaml into their own binding file, e.g.
> 
> Yes.
> 
> > qcom,glymur-tcsr.yaml? Can I use a single file for Glymur and Mahua?
> 
> Single file should be fine.
>

Okay, will create a binding file for glymur and mahua in next version.

- Qiang Yu
> 
> Best regards,
> Krzysztof

