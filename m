Return-Path: <linux-arm-msm+bounces-95477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB5VCFbPqGlIxgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:33:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A01D20970B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACAE53020A53
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 00:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638CB165F16;
	Thu,  5 Mar 2026 00:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPNx7E1H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/ABlgAi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720C414884C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 00:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670803; cv=none; b=ggXreyGZvLCW+OVM9Z8ODDyQM5CpLMdGIFIWFO5ELwanDowMHC0n0IfoKbfuZbq0DggbKOKB+gIMYX4DMpk78xbFjC3lae3vlmZSC25oN3jV++Yk48EGY+fhVTNyw6/CibasIni74oatNcqPWVMG6V5062Ui0xObXPcKQp8FmGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670803; c=relaxed/simple;
	bh=Y0jfqBQVatLtNuRSdbQ1VmzHYmO74D24CSlx9dTBF+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJydnzYPH0F/5RR0gsSQ93E3sm6uFu45v3hARq+eThdlDYaeKg5HSFZCo6DG89dHX+W6yQ7zLaPGSoMis7LF9+Mf3Bxi8euw5NeLqv2fVOEaaGUm9ym/jHy9OJr7e7a8QVMjAb01QLwUTclq0zTkDLpXgJyfnOdK96Mw62ui2T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPNx7E1H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/ABlgAi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624G2Cpr035685
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 00:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D9mKbU7aWwckv8b9CxSJssvN
	s6rUpcRIxYBgm7x0puU=; b=XPNx7E1H5jVwmVL0ka7/Q8hGcx+2YkxaDvNhNGPd
	WYnQJx4Pnjgakuay2wXPMHZ1qD4j++XC09+k3S8Otk3NrCV/qnW+QJdkzy+2IHOq
	F/f5d1Dq9SkJ3QDis/rNAH2FZZpb/Fx3RgG/quUmYvGUbjaLK4bmdcv8wlxtz3Uj
	Cr7XAAirM7hnIKqeRBMpNa/lMxOOyd8zurn0jR2OYs9SqTmIEsKK4cxkrnxJK4gC
	1H1vBUeXYAV07SInikLzhKv4fHx1TSxPp3af5BEKDtuBn7dHdMesXabDvoN6f5v2
	CG6XYhyK5jO7pAneURIGPCbpgq95ntPy4WJJLJxQMOKHQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwg9bxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:33:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5075d3ee219so420616371cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 16:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772670800; x=1773275600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D9mKbU7aWwckv8b9CxSJssvNs6rUpcRIxYBgm7x0puU=;
        b=L/ABlgAikLFfsMteLIn+bHkD70vEyA/FERByBGmJeqmvS8ndhs3M66TB144LEAcuGB
         sZ/ak0YO8eEs/A2lkWlceux/pcmxC7WUW5GPfbrpD87kXVpoYOPQ+DR0s/Ze4I671gHJ
         mlrcnXV/g/cf/8LkCdLsRIW/gSXa25iLaaXK/FKqz5P2lhFWfdaXJJktW3G1uXkhBCT6
         S/WI8sJkiBs2ld97DJunH37HAI0ZsxW3wEOCy3ZUHjHZT0sZz6GS4v5dFxoaWh5UwG78
         J3D4wEdUv114VBh6rq7HQxhDJ9KgwXWX37oIAR6z4gaaXBwa7dY/PzU6ntwGapgnV7Vh
         pqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772670800; x=1773275600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9mKbU7aWwckv8b9CxSJssvNs6rUpcRIxYBgm7x0puU=;
        b=FVnENLjplQ/lZVawBhAzrdSmAp7uCE1uZ3PYjrFE55FZLTjjhmcT/UAj6PUY+Rdiz7
         vAiNB+uVHnceJsxGC1piLnZ8hCyQD5S2rpvUkZDnqECGhr52gA0xPj/6jAL38FiM/UkL
         aNVtSkbNLTsJa3KMn+8pA7Fagep+qqBpcCToigqKC5uWZBtOoNIUCAu+CxOhirR18kPx
         P9XffZ0ZPp8HmiR/LvjkVmsasvyeNsMnzc3s7ttULzOVR4m/OG4G7nawGhLVxtC0g1Xy
         uQ5r+/gdxJanDjbogdRCdMjZaS+f+wYKgaFMH4utmXW+oDpklCpvMdjzcO4d7mZ9p6AN
         PWMg==
X-Forwarded-Encrypted: i=1; AJvYcCW1d5aWT//XaimuyG9mXRQWmJfCr+YVnTmdeMYRlJo8N20UpphXqoFMk4552KZk6m0zx26+UO+nS+wn3Rzl@vger.kernel.org
X-Gm-Message-State: AOJu0YwRvd0h2cGTl35cXO9WYSTxezHAuhgtKlIgaOKfDEiL3mCnOG8f
	aZHJ9GNEdzMDLHOvIVZeQkyJLUKIod4nWbSFDnG7UhllTMXwcOhofR/Q6fgriSODteVqtMk5lEM
	c+JbJ9xsFNp2IHRVx44Vtb+ijlBrV7ESMmrb1fYGmMpvHTt4w090SC4MUJK8EkXOiRqg4
X-Gm-Gg: ATEYQzwlR/a5/Ctx7KtQepBOaGhecGERc/R/SH2evGxhGeHTj19OqEnKNyENI5t0R8B
	zf82apIpGeEDgyJhxBMCF0ybPemyhBdyZd2/fgMy5JzFaZO4a5pNiHCDGTVqkPOP9Ajt2HSf1cI
	CwJk+iq7JBJ9x/PZjmp7ExyAKZGQYFr1lDMik5ZjJOIIvXpr/kYGl5m+8S5hw0LT6/B8Zvug1LI
	T6EaSqxsQhpII8BNajWgHIALqXN8PT2iJxRtkIKRwcLTQzF0ubTfqE7RQwPN8X1/ZdAE5C7iZJz
	saHuWFG/RVy841SJTj1iOdxHJFkRqK3CrypIiVeWAa4e/vVifAMEZ5hSf8X3UCD/zg4LiO9E/KU
	lqQbdrW5jIM8E2KY/lS33j0FQkUGRC8JCQB9ab76NZalzztqwaOgqzM7kvf+ZM9Kt9fUFWgQI+s
	h+kY32B/p7yknkj3jzPUSyzpadSg+uGJEw89Q=
X-Received: by 2002:a05:622a:144e:b0:501:40af:96bf with SMTP id d75a77b69052e-508db43b8d6mr56480241cf.68.1772670799735;
        Wed, 04 Mar 2026 16:33:19 -0800 (PST)
X-Received: by 2002:a05:622a:144e:b0:501:40af:96bf with SMTP id d75a77b69052e-508db43b8d6mr56479821cf.68.1772670799187;
        Wed, 04 Mar 2026 16:33:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12358ef25sm1631204e87.3.2026.03.04.16.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:33:18 -0800 (PST)
Date: Thu, 5 Mar 2026 02:33:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/7] clk: qcom: camcc-x1p42100: Add support for camera
 clock controller
Message-ID: <2byedzh5w6ymnoebve74a2a7oezgich25wdh4pdsqmvv3jvpkf@kyk2gz5khibe>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-5-dbbd2d258bd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-purwa-videocc-camcc-v2-5-dbbd2d258bd6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a8cf50 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VpPMKPZmRKeoA34dWXwA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 0hPLYNMUNwJH1FG7TkBixeM4bzeJ0J-N
X-Proofpoint-ORIG-GUID: 0hPLYNMUNwJH1FG7TkBixeM4bzeJ0J-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAwMiBTYWx0ZWRfX3RSOhV00j580
 /KQ3ayn0xOhunSK603jgzXsrx76OAv1HCKhTVTiAgYOS0PncNWauFgQiVrI5czk9HYB9j82qVi6
 h8fZ0pHv3ZTizxzcfzyNKq0XWV/ZxVrHZWiO6Gbr1x49kZBXzIOWRb6b1rDrkZD67GQRAAM8vse
 XLqHCvwEJWFnixJuN7RtFf/nXe+/0cBOq7xRcJCHu4ttEKvvOkdwqxnZsHDC2gNvWflNy25OeSY
 jtNUgEwwySGqewxqw8b5791x6zLZZIq42JzfCKwJtgyh6vQSmIdWdQUSyUmPY0G05H+nH9yc/q7
 m1SxsBCk9uZo7kkIT42rztMZJL51Uiq8gAUISCmATSpWknJ8FABbNQgeaWsug+ODJ5bzyRwVSgr
 0x4YQvhW451VASKvf/RdDtfKjo8wGiIl84sY5EiXa8OR/MVeVlb2O0vWwbhNBEyCAIxBULMfwSp
 wV+0BaaXgMzQC3TYbgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050002
X-Rspamd-Queue-Id: 7A01D20970B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95477-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 11:10:55PM +0530, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on X1P42100 platform. Although
> X1P42100 is derived from X1E80100, the camera clock controller driver
> differs significantly. Few PLLs, clocks and GDSC's are removed, there
> is delta in frequency tables for most RCG's and parent data structures
> also changed for few RCG's. Hence introduce a separate camcc driver
> for X1P42100 platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          |   10 +
>  drivers/clk/qcom/Makefile         |    1 +
>  drivers/clk/qcom/camcc-x1p42100.c | 2223 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 2234 insertions(+)

I've cross-checked this against X1E80100 driver. The main changes are a
drop of IFE_1, SPE_0, and two PLLs. However it also:
- uses hw_clk_ctrl for several clocks
- uses rcg2_shared_ops instead of rcg2_ops for several clocks
- uses hwcg_reg and BRANCH_HALT_VOTED for cam_cc_camnoc_axi_nrt_clk
- uses HW_CTRL_TRIGGER for cam_cc_bps_gdsc and cam_cc_ipe_0_gdsc
- uses non-AO clock for cam_cc_xo_clk_src

Are all these changes expected? Are any of them also applicable to X1E?

At this point, I'm torn between suggesting the merge of this driver into
X1E driver and ack'ing the current form.

-- 
With best wishes
Dmitry

