Return-Path: <linux-arm-msm+bounces-103888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCo5EaYp52mo4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:39:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BF7437B7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C5CF300362E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 07:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA78383C9F;
	Tue, 21 Apr 2026 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5HaO2Ld";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eah/Fbst"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024BB31F9B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757112; cv=none; b=jCE5PgWdHofcJtm2FWV496QyAtgyy4iyXN6klf7s4bpNS/EFMPG5i/c3qAuagZzFmkoNETaGpv7sOau4l5jUkLjN0S6xu9Jfa3E+iI+DnPZRssj594kBenjanVWyR50sSXswyYZHYaHLbaalkWWEkiTx3t+Ewv5e2CjnKLDh/ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757112; c=relaxed/simple;
	bh=wjZTcd93cD/Gn1mlEqajarXrdExhXlDw4BM9DJe8A1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxIHpG+6sx6zBrBdyNqEmY1h94sTAUt/7wRyVuDT6pzRdgw//WZbqdMb+VtapKWcOgGwb3R51dR59Xev4dzzNIEnXCOcio1rfFPUe7jrd2aDHUpzVMHN1HYVkb+SH7/7EOZ7CuHnNghUT85/Fj6jLdKud3oKoZvC6ry6pEmPR/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5HaO2Ld; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eah/Fbst; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L3Q9u84168833
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GIXG4RY6c17Up46qA/mgjCGl
	PBb37O53AFXQ2rdnLLw=; b=n5HaO2LdoHrLLJwjsxEM3/IB1/P6cgltzxTSo+V8
	D7GZBzVolPGymlm0nJ/Mby0NI0yHWSrQamBCA4rPMxkT9Yb7W3rO9MJeetcOA4gV
	lPmNCG+I1RG5cVVLn3KRIOnaqqq4aL73s2dYZBvxZWZRnjZZvCjF0Sf4mKNC2+K7
	biizt3lGVhz4dcMaupRPftzw5EWhsAsKmb49HgHtMZpxuq8tNgKZMqJdzl/2M7qV
	LIxux/+PyVM0O7Lo/0dxcElilV38bGkr8QXVjE9OOFMo55GkMEdz2DH6VWW72jut
	vZ6r+iRfbm+Vt4svVuwkeZNSETNB4i6sp+637lZJ+sR0mQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au0vyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:38:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2de07c12745so2382599eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 00:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776757110; x=1777361910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GIXG4RY6c17Up46qA/mgjCGlPBb37O53AFXQ2rdnLLw=;
        b=Eah/FbstBnWUbGYeDdbZUM2HvpdWnGKZBTYIiksxN0V2e9D1Pj8dULw1a07rT+YEBP
         OJQGWfZNsXwRAnWfCiJ37ZDzz9pCK+rr25dHGaGQMgzEx2pIZMLOzFu+HYOCVixKtkC8
         +PyhBUZOZfx//xTULiKtFbtHS6xXyjOqRBZuXEHs7mXOf1psiR7a9DToV4J6Uj8Hejb0
         cKCOMsNE12PHd7QJAOA6EG5UArx9jMMMkjxBcn1qg+jWEbZyF6T15W3l1hUfti2eIReV
         wM3IBqQ90Uqj/8i9AGZ/PJ/oSdT5Gc4t/3oA2kl2xhXId0GKfHLm2fhgvbwr8hM2nTni
         SlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776757110; x=1777361910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIXG4RY6c17Up46qA/mgjCGlPBb37O53AFXQ2rdnLLw=;
        b=AzNpOk12yAVBk0sbkCgf1in+NGop2mBnMYNr8VkeRwwrgNuxd0QPCYLMC6AG7sIu8I
         P43Z4VUBxXpy4cKHYyo+TDy0WDX8RKvcTBQkxFZ+zzJoFXmYfV6zn6WFOr0uIrKKB54u
         sZTfe1EHpHYA/cKrrv6plLdLwmTN+tdxrnb14hkCq4x1jSgWkaQvGeQ9+v1P5IurUAtu
         Chj9BRPHeGWG8iUZdgrLMJ8svpQbuO466AZpgOqemTU9xIhwnoibJmzFprLQ4HsbewWC
         2Mg7sGk8XD184S4zS0umBJHpZ4BDtnmUhkBxGF7q9ZCP25iHyGwSst0WIwW9jsYw5ZG2
         Cs4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9qcf11CGEbmFaFyQOOHOcBHK9yzrmdEQ4s2kLskd4vkULnL4ATdD9hLUvWhRCfN70Xj8O7ZPtB2NBaQqjr@vger.kernel.org
X-Gm-Message-State: AOJu0YwgML8uKatZZoTlNAVpLfUZAN+xwCOmAWIeO18XOcvObNo0rIp6
	DX29jr+YGjQ8McjmMOYErg2RMzj8DfI/81xhSgb1ivQv6MFEeypNMtvqSWq7SUexN+cME5uydV7
	fFnVhvj8bhzBDKajif4Lf4EwCfC4dmeoWjc/69m4aT6svVgGLemZLMTWZUmjx2YMppklv
X-Gm-Gg: AeBDietGY5+3rOsgQRuDuReZugbzJasMUQv8c5XmWSpRIC3OiSw82HsI+Yr59L+8X4w
	uIQRrKlMFUY5h9pJXtoIZTLoMyZpGQ/R94TrHn9BtBCYW2FMotJkMDzJFhBmUXGwhH5qO2CFvj8
	HAi+uiWocnksbWG7UUJSumD4w2qFTN2sGkYGGR0KCXZYbtNSSsDS2Tad2Kba79zVwcxv3H6WYbA
	ixb5ZdMs0jtb/YPPkQPqEPIWydTGut78uj5nn4UCZa1qdjnuACP9qo8+WkWMTmDGig1eOL6vdim
	uhfHvYeNENnNoTh28EbgnZ1BJGMwXQGqjv9IsMjBUj2Bp5Lxcp0lsRcmXFYu4wB+JkRxSITgnUe
	1pcwdo5rhiRLfYye59QHGIlUaLFHVjhZatKFEz9dKIwXYZrxIcba3Jo9MH61tYzF9SSJSEXcg5m
	s=
X-Received: by 2002:a05:693c:2b15:b0:2d8:97d6:6abc with SMTP id 5a478bee46e88-2e47a105b1cmr10260802eec.22.1776757109519;
        Tue, 21 Apr 2026 00:38:29 -0700 (PDT)
X-Received: by 2002:a05:693c:2b15:b0:2d8:97d6:6abc with SMTP id 5a478bee46e88-2e47a105b1cmr10260775eec.22.1776757108969;
        Tue, 21 Apr 2026 00:38:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa5c38sm17526024eec.5.2026.04.21.00.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 00:38:28 -0700 (PDT)
Date: Tue, 21 Apr 2026 15:38:22 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] Add CPUCP mailbox support for Qualcomm Nord SoC
Message-ID: <aecpbjIVy_oh1c2E@QCOM-aGQu4IUr3Y>
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
 <0c2425dd-0ba4-49ac-853b-b157eec1fdfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c2425dd-0ba4-49ac-853b-b157eec1fdfd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3MyBTYWx0ZWRfX2/f2r9KOfZAx
 gcWXXtIslulHvftOTpgRVotC7v5d22Ago2zNw7imtwMFuwox1VFjacJP5CNT2py1SCUYJMrc4TH
 9y2ipXVKPbKmRWap+HDjLobdDY20hD3dlsf+aYhUFmQIVCqaTQ4ewWUPqwoPuGrJDFU25X1w6SW
 +3R7FsdyuZnM0gAHEMx1QnaBnzaLSneWmKWi5PanJAvW9T+w/VEj0r4Pfg0yscaYvW+Kh0QohJ9
 GQOESCmBlsq7OKotS04SirJsiyNFAD0XylNt4QAa++henLxJqAFVhtv9NA76qDEOODzCHGpOEIb
 1zevXSivYZYM3s2W71KQwytrneEU2fHpqR2kpSndbm+iUr84qQHupTYudAxOVBMbpwD1dTyiej0
 P7PBWTB0lGmlwYdUq5FLa6WPnCa9/i7VgWIzdEx+1KZAFdjGKdRzHmTYy++RrU8mpQNSLZnJ3rR
 dY6egczXvDH5o8WBcUg==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e72976 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EzMJCGVPsnTdBwCGCsMA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: qGqyddtopPPzXqdJOOzbN4vOsbugrGZQ
X-Proofpoint-ORIG-GUID: qGqyddtopPPzXqdJOOzbN4vOsbugrGZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210073
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103888-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9BF7437B7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 10:23:20AM +0200, Konrad Dybcio wrote:
> On 4/20/26 5:49 AM, Shawn Guo wrote:
> > This series adds CPUCP mailbox controller support for Qualcomm Nord SoC.
> > 
> > The Nord CPUCP mailbox is functionally identical to the existing x1e80100
> > implementation, except it exposes 16 IPC channels instead of 3.  Patch 1
> > adds the Nord compatible string to the DT binding.  Patch 2 refactors
> > the channel count from a hardcoded compile-time constant into
> > a per-hardware configuration struct populated via the device tree
> > match data.
> 
> What are these channels used for?

Per my search on internal documents, it says that more channels are added
to support following communications:

 - Between Hypervisor software and CPUCP firmware
 - Between TZ software and CPUCP firmware
 - IPC between CPUCPs (Nord chiplet design)

Deepti,

Correct me or add anything as needed.

Shawn

