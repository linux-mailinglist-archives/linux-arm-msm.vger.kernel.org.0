Return-Path: <linux-arm-msm+bounces-112479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /5boElhqKWrlWQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:44:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1A8669E03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:44:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Y/a2JvRz";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Rxpq3JvC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112479-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112479-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64E4030920A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4078B40B6E7;
	Wed, 10 Jun 2026 13:34:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A8040E8DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:34:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098484; cv=none; b=i67MnXaL40dVtrNl9Z6IXBqHhHi74JROvSkVfWQ3pm27UEICTn+jD7StXC4iGxduTFr9soA4oLAHa+K8q8K4pDmCxZ1JTGnAgwYeI0DZJ9sa2zHV0bmAXCZ7MAmUtPky0nZ5SKahTOFFnOx21cCi5zmUOpD4Pan+QCJuWLCd9XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098484; c=relaxed/simple;
	bh=ND4tQ/H1rfG2Q/XT6UBt+j4YQ1shI+hbBcVgUETCydg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJHZT4LFRSorBbQ6iq0fNZlk/iquyJBQbdo5CPvmotDSuyqldu0+2XKwkVxo1ZUCu4sTBVaolexebHAYYfzTjYuomL71mRjjGqDntjGKE0Ge3RMbtjiQO3yEoGwrmcklKqPFeY534EGYaSCk+Z41HRSBJeqAB/IEd+h9dKlG41Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/a2JvRz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rxpq3JvC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBnBE1135318
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6/RLqbZmVOrKAcmQjh+udgmQ
	IrAjIBneaAs5twIBd9E=; b=Y/a2JvRzGDJYJI7R4QbLOwjE+/mwNgH+JqIj1II3
	j/nxWVo19m5Ufr9vV9xFhMmkzJotXWksQBW1TRp/UvHMwi2TwgUY+Xi2gYk1EcR4
	C7nm8tjJ4jLrOrsCeMagwPEcScgCEhHCASkcWSjBYIB4syD+A7+qfCBIhjSYh/Kx
	gnRcUYBy3aOTIwODluFFA0uCGIK2zTk7v6D95PuBO/xEPbDu1yAz6GeGWiPg+8wE
	xf0e9wnjSL94dInb9IeeGtaNQOWWuhHZdGFGUsLSinNOW3RflfovkdCoxMyIuJuF
	C+7p5Y12FSnotl5CnArVNRpUcxy9uF73765RjtJDRi2ubw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1t11k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:34:37 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-96391e58e62so8416912241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098477; x=1781703277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6/RLqbZmVOrKAcmQjh+udgmQIrAjIBneaAs5twIBd9E=;
        b=Rxpq3JvCcM2+tThGMNwEJNj085rgVnJJEI4eRHQUFAVFdlK8zbFvCgIv2dwfcIAzR5
         5AQqITcyqROj5PKBAftmoUvhmTbYogEqGS8hxuZYIbNDUeMdCmOtJBLhzunDwfeydvoa
         YfqC9N0x87TvkSJzgjcPI8mQI+Shs2cN7lbDzLvpKqDUBOCcdYkKCTD/fm97knxkVKOy
         FSOBflA3hWODkrkstQUljcADEhTIf0VZAzo5Efex4ZxF577Rj/HQ9dcFvfUeQMNTmH/R
         N9v+msFvSyETpU8P0/2XgqwQoSIBBW1jEjzIMyhlv0ICEPjznfoiXeX6KqxtP2LlAe6X
         izjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098477; x=1781703277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/RLqbZmVOrKAcmQjh+udgmQIrAjIBneaAs5twIBd9E=;
        b=Q7y5pJhqJ/g2Ak00KOJ9g5SinbN1KoxctX1o/0BQWJg5astJfsY59ysiRoAhMaogbq
         aU9N1YfSXySfx1mcR4Q69EBTGRwQhvGhYNCv0K5WZoWqr7iQIgyy31GnZGcDY4Haqzg1
         b8Cudn8KIzoIs3nAMvb3ekQ/3n4BIJtOwBjCQajb25PI/ExoRhW8kcruYdUuC9V5plMg
         GMA3OMuoQmA+KAQcq/Uu9vJgmWWLSmsfnTPdQoVaqB74gwBJnpLulln1PXXA1yDK1OtF
         Ik5iD0PEZoz7bJ4cklTvhDf3C55LGrGdNC73T4Pj6WBhpJT74haZ/waIAdtevf2dI3s8
         T1xg==
X-Forwarded-Encrypted: i=1; AFNElJ8kM0rBGQw3jEm/KCQoSye0IXNh67rycPpfzdZIiv/A9d6s7HLX6MU/pld9BTpTW3rCYPaslPsLjmbImGe7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt8tJEsp0Fw1++YCmi+8w1rJBYkxypgCxlmObig7nPgejwKI/W
	OLtJlpI9xBdbjudDrWvPgxP6lE8uXXRGYAdE9OISpNBdlpuM6tlFkCNyUs8NbQQlQru/scRdG6F
	HzOXgQClCC9QaZkNRTmhUsk+rfEv//lsbGaTMJpgl69u4jkQ3k9CPbeu6O8EQTNyw7dle
X-Gm-Gg: Acq92OEEuQvS49RJKIfVim1x3GQt5dpXRXvkXY+9TkvQuFnjUItJFlBuvaPNQeUw5nM
	gWwNaLGOLd+yPWEDAJZ5S/NYLYz3EkJqpkKsjPHGeKtVhyP+zVlg/OX2QnaCHVWjNnXRj7A5iD/
	NJZeMCWISV9Ipag7p9Nhg9Syo4ZD5DvIBFQ26KGGgDlmTxFNajTlRt1tmGqyurjZkh56nTZ7zYN
	8obCJYlNYFn/0rR7+iF1f+Vxq4QnOcXVXjCJmf3UXhX5rere0T93AIV9wIHnD16lPVRafEmHGtP
	yrO5DZCVkh7aR9ZE8ucGiNlc3nZUV/9wJah9UPStEcmP2y+vdgyUINbljRO+AoaE+ZNsAxdOhDr
	z87qPCmSrQQeehIavSRko1ngaDS/I0PyvGhOXENOgP4Q/s4A9GWIPF5z7G/EHNbTPkfr/bTQZcw
	e8Ke2ol43MHQVWQlc1j8rK/FqbG4/XdKdTI3TM09iscuA3TA==
X-Received: by 2002:a05:6102:6204:10b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-7001b3c61d6mr6100211137.0.1781098476586;
        Wed, 10 Jun 2026 06:34:36 -0700 (PDT)
X-Received: by 2002:a05:6102:6204:10b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-7001b3c61d6mr6100179137.0.1781098476165;
        Wed, 10 Jun 2026 06:34:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2adsm5386728e87.1.2026.06.10.06.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:34:34 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:34:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Message-ID: <cacfl4livqlkuk2c223hgapl45ojd6hsqg5sqqd7g5g2q57kk6@codcnqhfz3e6>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
 <5eaea87f-5fed-4869-93e5-55c9da5ced84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5eaea87f-5fed-4869-93e5-55c9da5ced84@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMCBTYWx0ZWRfX/BthtxR5h2fq
 F7sVmZs55RBje7cCYpyNXKhgTUMk4Fyd+jsvMOX/WFQOKp168IgMMWIaydpctOm5716x5tSBcbu
 euGLJkA6Pf6zYiFkLQ3JOxidqrE6iM58mPOG3BRfvIMWnHwq6CRfxEzpoD2LC+CUHr/OqshqzOV
 OvynMbjzlcX6HjqWCXPOIue1pm/OcMuwLyF3sq6ekZic7tUCUNuKzbREAP5ekulcykO8unQNMLG
 7RdnF2LXdKUJ3bTzSshd8IWs/zK0zjsiseXrtVVQ46zDdFszHeTE5rv+TQ8DA0naMlDJm/cgUVU
 vG/ic1o3oM2GwwvtIq6j72SLNZthpK2K0wVDGACGwuk7MBpITWkfYsTDM4HvJseb6o5yYlEA2xY
 IHb5ezTvp87BizTSmTdnA+eEe/SQr0eZfJfog6yTqeM19QIfDdATfm2Sr6rvg//0POXy5iP3qeU
 wij08mHRQG6lDLOiDbw==
X-Proofpoint-GUID: SlrGrZBMgC90wJKvp8tKFg2-2rufKF9X
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a2967ed cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=t_nprInajcUdtdUToWcA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: SlrGrZBMgC90wJKvp8tKFg2-2rufKF9X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112479-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,codcnqhfz3e6:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF1A8669E03

On Wed, Jun 10, 2026 at 02:24:24PM +0200, Konrad Dybcio wrote:
> On 6/4/26 6:22 PM, Dmitry Baryshkov wrote:
> > On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> > and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> > qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
> > MMCX voltage levels.
> > 
> > Add MMCX domain to the Iris device node.
> > 
> > Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> > Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  				opp-720000000 {
> >  					opp-hz = /bits/ 64 <720000000>;
> > -					required-opps = <&rpmhpd_opp_low_svs>;
> > +					required-opps = <&rpmhpd_opp_svs>,
> > +							<&rpmhpd_opp_low_svs>;
> 
> So the computer tells me low_svs would be enough for PLL0 to generate 720MHz
> 
> Is there some transient dependency that bumps this to svs?
> 
> Your changelog mentions you altered this in v6, but I don't see any related
> discussion

There are two sources of information. The "clocks plan" and the "pll
info". For some reason, the clock plan doesn't reflect actual PLL
requirements. See the info on the corresponding PLL type.

-- 
With best wishes
Dmitry

