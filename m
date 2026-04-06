Return-Path: <linux-arm-msm+bounces-101995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4In+I24J1Gk1qQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:28:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 904E83A69CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F2005300A247
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 19:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87B53932C5;
	Mon,  6 Apr 2026 19:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3aT39X7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9YOzAY2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8323E39182D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 19:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503707; cv=none; b=J34RMmv/4MhKOJEF1awwZMjXRjWzNa81qBVG6l/2+qbCvEDWAFHQA3HnCrt85NURfOhnXUxsjVC7+NMR8f2D7NH5C5uFTi78QeL/1Qj6yKZF7xvAPlf6rsPUKmyjAs5wLGMSw/Pi/Ryt6oy4NxBIZ5GpJlNDzN3n59dFOm99ipA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503707; c=relaxed/simple;
	bh=5CQHjk8TxMPBOrtnMSVXo2rDZRTZx2RTzqeY8eEF4eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kR4FdmQ+O/P00m+yWQzCTTBu8RjIXcT8Gk3Gp/vUh4uI2aTYk674j+2bzO0C3Reekb0rIRcrf2oYVkV5fBDfs6UJqm5AlARxfxFG+cIRqcUGoSYPlNp8/N+XmSmyT9uqXXV5i96X91DRGySiDLqVIRbEQNyvtwxShcgPxSn3UHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3aT39X7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9YOzAY2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636Ig1ZR3472126
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 19:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TKs0hoZg7/Rf4Ax71tDzHhOn
	63+/78a1xhBYwtl24Hs=; b=A3aT39X76B8XL3aL3fKqK59Q/5Ynwv722zuEDiDl
	0kPTvjMaduAf5Jpk+PGh6UO0tHelloIQSY0Jz6PAgiX8nIr6DonlFVBCW1CfuZYE
	Iq57ScPaBiVI9EjIJt7j8PCFF4rtbnO2z1m+zMniVHkr+6AiXgqnDjPZaB3zQBdA
	q6Ez8frP43UFs4WJXiWVqAQSnIrK+BBeZQgxjpSVQTJcwvFeIdHihb8qpnyo02VY
	5+DkRzLdj9LAMxicUHCDtUMO4PKNaPFYcZw7U/G5UCTnmCSZRGwUb88LOIeRJW9x
	AQ9Bv8s66qLZj4HuT7bMsYPucidzDlPdOWpx8pKcDys22g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcehwh1kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 19:28:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d826ed6f9so45864491cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 12:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775503705; x=1776108505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TKs0hoZg7/Rf4Ax71tDzHhOn63+/78a1xhBYwtl24Hs=;
        b=L9YOzAY2kFzinQz80/qO2aRYk3AZFOlQ4dQoQHmz92+S/Op2krmamvfmUa8CxTzq2N
         l5LTX5UlXuGXZ5LtolJ6XOPGxEWiIYqDTRPo+LJ/0kKHkewNnsZJpKu8E8/4TyT1ZHE1
         eqdS04F+F8AB070LCcDpSLxxsZ7S3GN+Wm2ge39diaJtdgxHG7timXdFd5JVJHqn9Fna
         hsNKMq8215Pi3pKmNLT7rJkbgYGAVYEm7t72y9fcoTXyoNKV/5C8+NjEYNWpoJZUXSox
         dXHRCkxMMTevZDdhf1IIYrL1xGZ/w/ArXAeWHKfTciGD8Ub/k6l/7CPU3x4h4y1GiUu8
         +wYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503705; x=1776108505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKs0hoZg7/Rf4Ax71tDzHhOn63+/78a1xhBYwtl24Hs=;
        b=MvEuehLI6u+ULDtSs11NU35vSt0XVxe860ouBjCS042QS+tu/U8djGkFGW6Tr+dMca
         scQ1bdhoPQCnVTLIAbhhqRW9XjQbh12SLq2gPOAYJVfAVGaiOpfsF0Mvw75vmwa/Uz4e
         4XmC8/L8b8Dq6pivrzf8b2KwtEPApsaPIbyf3qcgGxehVto0pnYqV2Ekk869Kikbwx4F
         edFnM5hAr0LPUX8tRQ35NBrBKETl/zF4dmc+aHj0Xul9ohPqZaPyKleky6xsm7RLg/KE
         MGUK+nJ+cACc2ANhwZQc76pZYi+2SIJItyK4ANkP9G5V7qX9bZxvMFeAXqBp9ro5zMyV
         U63g==
X-Forwarded-Encrypted: i=1; AJvYcCXhXFmGHm2xI4NF4MZG3gtSERw/yqoAErok8Jna7Z8BKfMp2myfZDMNzIJA3DIS5Qevt2CrSHMlmowU+NQ5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ODKGWnWBQdtzZmHqAb2YwhbU5ir41mJPOGKoVJpFwm19hOQz
	ZJDS188PNvb6jvHmLCJpF703EmxrbqO8bATy+1k3lNAd6g6zAspIbgE1M0oMwjm4yuSoBmrbfyg
	/LBnGIYGcSK0KI/jG8brK8KLSqMWKASsAXSyx3bTE9KwcBV26OBIomFNQAdfwvSr+OUEE
X-Gm-Gg: AeBDiev18QOInM+ZhH4fK6aTh7gyUlyHhQBg9Bax4HH52VVed8xeiAYs6kW5AbaOheQ
	oy2z9f0ykNTAe7sYcle4CrFZfirgAMVqkmEkbhnUCI9aIHLTNTnNA4AiAx76gb9oopE+kO+Mc10
	1P/Mb39FGKGYo6Pe0sUTm/drJW2IRjTpMLFIGlCoohHjS26QnCUVrtlUM1O3XxPhJHBE6YNxWT2
	LXBPm+2I0g1pNhh4B4OW8uyfua5ivmYu1jsodqmiUT/uQxDtjX4HxeRfOXNsxCcjijRlkQaex75
	N3On/Ud6u0lNr/FlfTOc05ZXENvyV2EA6t9sfmFvfiAqjGVwh5wypknZJDQ69W0wGPY7CAiIDob
	KlIb6ClIuLjl5l8An87tPSs5pzDGVx+6KQkfKbvbT3pdVJ/efv1ceGKTZ0dN9yGrV21u+3fTh0b
	1dTS7RdI+B6jcs1pI3zLU7NNX5UiKYZozVuo8=
X-Received: by 2002:a05:622a:1487:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50d4fa37523mr202608671cf.5.1775503704932;
        Mon, 06 Apr 2026 12:28:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1487:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50d4fa37523mr202608361cf.5.1775503704361;
        Mon, 06 Apr 2026 12:28:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm32326521fa.39.2026.04.06.12.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:28:22 -0700 (PDT)
Date: Mon, 6 Apr 2026 22:28:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: kaanpaali: Add USB support for
 QRD platform
Message-ID: <f4txdswnaprtgoomdngtbmi4juirntclxzcbe7ay3vglz27osk@pepbn5mcuceb>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
 <20260406174613.3388987-4-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406174613.3388987-4-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-GUID: BbSXfrFD69TmBi7H3iujxV6X9rI9Y2RP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE5MSBTYWx0ZWRfXyQxC2oH2i5HL
 9MTriF5LpKKfafshgN+tdmgHsUacHG6RTABX+PcHzA3zUnIjk9B1XfF8YSsOSEdj7V1Rznt1LBP
 YPrDUvK1pwGf+q2s7yOO+26pvzoAutwaVLRKssVNOfTZzjUwHZllzcjJtm76oEDApF/WorUvU1x
 SdM/KMZ9YcckgAFfLZp2uzSHcNp0R3PMTqoA7Y8DogWDvdYQKMYWt09A5yRUxfmoMQaqTZ0SzOc
 KpxoJzeWccEi67y3JMNLFeLU2mnTivID7Gkwji/JVuWEwb+J68IMZDaTP5eYtHVHftB3oUXSdfF
 V6QBV3bUr6vWCp0J5FuEzGXiMx4cKW3wgGoARlpZRs2zHOY2WCg7DeZZNL/mTtwIef6e7qMWr8W
 HLRkMvehEUuSW7HY47W9g4WFeq/evUEAhrexFXRgSYuOf34wZaup0kkqFpk/UoXVi4aSLes8T9P
 ijCTVsW4kVavxJgEOUg==
X-Proofpoint-ORIG-GUID: BbSXfrFD69TmBi7H3iujxV6X9rI9Y2RP
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69d40959 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=lzcha0RWJE8jdVfZHw0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060191
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101995-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 904E83A69CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 11:16:13PM +0530, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali QRD variant. Enable USB controller in
> device mode till glink node is added.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

