Return-Path: <linux-arm-msm+bounces-102700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFWmEyAj2WlrmggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:19:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C4D3DA4AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FD4F30591C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015CD3D9DD6;
	Fri, 10 Apr 2026 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NpGZgy5o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxwQ0o1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38CE2C11DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836599; cv=none; b=K/fz62T41c5FRWR4Xc5GyGM0AT7WKCFNV4fJm0Nt7ZRW0Yz5R1UpWiTOyaVwWcmf7kdPra8zp7X5FU9UF3fnicyYcS2qOzVws5tR64EBTGXn/ravrZqrmtpoMmEh+pjn+HQMXb+mP+7mRoNEyTc9efEbfoQ4yn2pewrbhNWBs9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836599; c=relaxed/simple;
	bh=mj5HSvzKwu773ANUeuPZBe6aniUvoWWSP6E0fNeBdI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfAooZTKAu0kiuzwQAjuV3XnWnJyGKdVNGEfBvoOKo5xGTnP7f7CW3L+smI8sg/dySxFWfDjmwkrsBEnN/kpB8PjUd3yqdxc9cnRD7Pj1zgFlwLF/1b34L3qIeM7ZGUxwgGS8Z6/gZXsDeIAOF2g1bqADoM2MwTGvfdp/YhyJSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NpGZgy5o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxwQ0o1l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAD9FO2698253
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k8QL0W9coEdW5TOsLL/sYcM2
	Lbjzn2rZrwMC8N0oE6g=; b=NpGZgy5olwpR3ToGAH9tR7QTuDD5bHXgMB22rXlv
	wnUF9zNZKF8PGdE4KZqZ9B8CL4jv2Gd+ZD1cnmA1Lr9OEQbLkjEx+aiDL5mIGEQn
	NZU2M2+ZWMEp6W2kGDjWipi/8dyl+IOmeFhT/1HzWEPXpEIb+VVvwwqChsDhEHyq
	S7zKbJwlWKZNqc4yrskzF64q8Rx4oEdptPiMG4CTOmfpjW6IfWxYqH3BBjeKPlYM
	aXkAdCiS44S3uUPHQVShuE0LEyQuS+ptEhCmAUXuRPHTdski88En1e3hD/3kl0We
	d5xYIBtArflt47BavcA3614E/9x4qw1eZx2cp4NjgfM2CQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9usdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:56:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2cc75e79b97so7589714eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836597; x=1776441397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k8QL0W9coEdW5TOsLL/sYcM2Lbjzn2rZrwMC8N0oE6g=;
        b=hxwQ0o1l5hIJ6dJCPG39DnwAOQpnFzDhuDIs2HO0WEw4G3x6YldajUVbXuoXgFAqPJ
         SKpz/NWbTBHBNaqUc0pzoNd8Fy3CMZ6XXoyglaoWOi84nqMqr/fs38pzP3k4Bg3wM+W7
         jIYFvMvNx64TwmP7PRy/QNooRmHWoUitXyArRI/udrJ2eO2v1eSKLWL+YaQvASs0EGjM
         g+xst/us7Pl83TzdFx3NrUFoOu+7KdwvoWC5Ld6Kh0kVqbATRdJ/aJGjrbk8UJek1wbe
         jb5+ZqGr5VdiUR7+q/1441xhFAx5NYkwmU3/mgwIyPsWeKvG30Y1+8J8OiQgCZNpBLJu
         XSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836597; x=1776441397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8QL0W9coEdW5TOsLL/sYcM2Lbjzn2rZrwMC8N0oE6g=;
        b=gaRefaZrwEzL/a3vKe2ywAnFc/0sKHSNdfzHCmrRX/FhAqoVc1G4KccqxxrXNROwM7
         eZcGSmk4/1N1Od41HHsig1h7hoBF/ZMpr7nsFwJDHnM2PUOHjZsN8kLpejF07DsB4YfV
         WQD/fpj1zZdFH9R9xILzOOpGBuqPvC5E9n7r/TTGa5aSX6BJ7kxlaSWZFeHye19AMMXt
         JK3Nxo4AMSchdRK4+fyXEWmnNvj6MmmsBh5fi6d7DGIsRNVm5RI0O9rI222S08cvOfnJ
         VjLPNgOWLpVtNgiHOtfERuFCNZ4VK/zjFWEn6+8SWm/PSfxjliKpKNR+k/5EpTCWHBrv
         RByA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ0dx09SiMyLuixE4wHETJEA/413eJecSBQ3lEOLqvli9WNkZzoNA81W0e4w2znD+qYZ+OuR8i3b0ZH149@vger.kernel.org
X-Gm-Message-State: AOJu0YyIyUgk8AX7UCTPYi0j6Z3UObYcGSD7URHUktPG3QOSsCJjGcdw
	uDIiD57l1QTjz4g0eBmyBHVr0cpVOy6+dfrywUFvH7ZIItIdf+UE7/yoydBxltVkszdeomTQdSK
	id/RP3p8YMPeQ/IkCFIdKvjVTXhZxBOa0ast4tTi2s8+VozRfJRdZ/8Qk6/OHzXKbairV
X-Gm-Gg: AeBDiesTg3Yz7RvZQuWFX+55Y1i5OX9bhmq4o2RIpAyfXVrOT6lauaT+crv/00NtR1h
	AbcncHWJEFVtJtC91w37fQZsgpsPSsFC/iFDGl0iRnE25GXwZo+W3qmvThNITSuhHwar6EvlwZs
	b0tB4g6BsX4npP5fEUt1/av+KNE+XUrFjgyqbg09GUHeLx1c0DYQxCbq5jED91HrYutCTDf8FVQ
	K6hvW6FxzYD7q1VEepgDIdPu5bZkg7gRvbr8l1mNnh8oCGm5UaWsA04WTLKpiNz3wtpOrJ3dTFa
	GSEKOVrwXSQcWUhZAj4KQzeA77a+7irzRN94o/10G/IFuEm40t7MMcZyBL5K+LNfSqpHBDeAUEf
	t47TUuMLKkCiO9GHVHqlilj4vLD8n2EIGZB3uhCFyiN01higiMUaFTNYg3+q+jin/u0avzNArBC
	A=
X-Received: by 2002:a05:7300:a194:b0:2d1:491f:41ee with SMTP id 5a478bee46e88-2d5877a7fafmr2198862eec.9.1775836596836;
        Fri, 10 Apr 2026 08:56:36 -0700 (PDT)
X-Received: by 2002:a05:7300:a194:b0:2d1:491f:41ee with SMTP id 5a478bee46e88-2d5877a7fafmr2198825eec.9.1775836596203;
        Fri, 10 Apr 2026 08:56:36 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde68bsm4817855eec.17.2026.04.10.08.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:56:35 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:56:34 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
Message-ID: <adkdso29+7ecTsL+@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-4-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-4-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX1B6HCkFL1lM/
 l53RZDWv/JNWOuy14p4tgP68NR/30hIVrNyIwSvSC5TcJyPQQn7E3mRfNNgcDJDZ+FCcwTXSYmi
 WPGgnz/KCXxEmxNfeSlCNe2eW7aNK/9Jrz8gtR1+XeRzAL/elbb+qeksRnayazI/SkNLR+BsKcT
 UmMSMokyCmGPEwoGfmmg8bWpYPRRLFfS3ufHYjcabWNATDN8dUAHfoPF6awS1NYIgdil2Le8A4x
 JC0Zw3CLBeYkzMJXB+s+dpMjOmOeJg3rnqJaJurBOk5e7mLfpoK4DtGVodf0k7xVjcCEq59Z+4w
 81zjIS2BjMweusbqh7XIAf0L3ZfYmwrrxaLKCQD6H0pN64JHcNG/oomsuONcb4otJcaUh5j4J82
 hJ9chJi6q3KfXVbNrfOriCF9Wbti1HF1q8mvzTmTU5uVrVZeCEFDZFj0ez/JHKHWgib/ErVnjFu
 SlhBjoHHlrwJIyA3fDw==
X-Proofpoint-ORIG-GUID: Ix63BJDabOG0sLruVBjE_J1qpdexHGDb
X-Proofpoint-GUID: Ix63BJDabOG0sLruVBjE_J1qpdexHGDb
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d91db5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JDKdR2D3zIFFAMo1GYoA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102700-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,hu-mdtipton-lv.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77C4D3DA4AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 01:51:38PM -0700, Vivek Aknurwar wrote:
> Add RPMH clocks present in Qualcomm Hawi SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike

