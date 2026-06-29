Return-Path: <linux-arm-msm+bounces-114830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VEjHLEL/QWrlyAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:14:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 161EF6D5FB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:14:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IlKRsHAc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=crSxji6y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114830-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114830-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0689B30160F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A0D367B93;
	Mon, 29 Jun 2026 05:14:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996D4330D25
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:14:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710078; cv=none; b=dy6A8AVUVGDBwDiW1r7efzls6/iW6W2V8RHjUbwgjLuSqsmw62ZT65yaFWvpz6F8hzy21m/lWbNb8kvsXmFXqR+Sk7/8bz3J6k+TQWOz+7qyyDI/jzZBr0UEoiobedNU5+VGxNNB4/loQMTFUpPBOQqjxcqr/yTn+jkN65v8Y7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710078; c=relaxed/simple;
	bh=+tn+1o6uChGGmy9MifJpt9Dl3QZFfgOQz8utCxMmmsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzLc0Z/G0J5Ql3kIxvt1CNDXNhImN+LvWVC/v10H/cmD49ecBuXxhH0hzcdtlUpTXJEYN4GmPYjdM5xotu9woBoxBikEePkmxJyHfgxsfLOe+PEIpkU7NUgVvPIzSVVW2igDVf440t4MrzadR2SntpBn5BGNnBKNgIi9Gdt9JIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlKRsHAc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=crSxji6y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NJOF1724565
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KGKgPSlh8J3sY+dZLERPmW5B
	9cbOydBAljh4L69/H4Q=; b=IlKRsHAchYYvo2ZAuVBGHX4cm6fgx04dp2MsbjXn
	SfZyv+Rv3me8gl9wkDL1SyrIRTFG3URJ2j0GMku6djgxzb2iw8wU0TbIulHLpwAs
	YqyqruqFx+Dn4MgGCnTdQKnsSLiJMiaND5qm78t11idigFgq+UCyogVq2xYQbfpC
	B6c3ITb5oFqay0+m+ER4oDDzFOQZGD2uIrBkWIJyvT2YFBVH91RR/NagxikWbE2N
	BXU5aN4uWCMcx3EJ9cOkTVy66fbulTF0e35+0+9mzsbHfJhSc/8x1/zwbMExnc+h
	v+iP137R683Izy1v1ueyJj0TU8txB5E0uImrJvMCk8uGgQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26w6mkc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:14:35 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139fe708181so1276353c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710075; x=1783314875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KGKgPSlh8J3sY+dZLERPmW5B9cbOydBAljh4L69/H4Q=;
        b=crSxji6yB0jbsvFK+qmhEJEraY1kddmsKRltwQO3YpyWYbw6R0jWgb/Lvj97RfwVZw
         3hTfMA0AjF4Wtr1VdMC0NiMNm73CARrcbTTw6GLwvpSAL5lnSgn7fYZ2PPyOcSt7OhMD
         4qxqkFsu3aOJ3e6ItJClJXPsHkOObK7OeS4w0zemUlzATw5D+jxOJKtdTGH3KuAh5aQ/
         hz1Ya92uV0FSzqMzMbMBCJdFNmMiQaTdqJYqaEwoU1Yhxl1UYXP+F4ShiQUKGbbTwwMv
         7drVmSHzsI2vsV3+ctMG9E3p4sMnITL0BhMM8TnNMSgQBr7ycgtVJcXNeHvfyF6RYDyE
         SbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710075; x=1783314875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGKgPSlh8J3sY+dZLERPmW5B9cbOydBAljh4L69/H4Q=;
        b=JcxVVV3UyerhpvDvJOFACsHKm2zVRq07uB/0dAis3GFgnUW2tPlyc2Y6zo+dxN97J8
         +5EuewKhwms6OJUquFtfnj59okf/zXANRTDu9o9/Y0d1OQP6eRnV0MBknIMqTQ5LDmo+
         HZMZHw0GaYKIgy4r9Gb2jWQN3+jmiYgXDmxlv6tOjjfn5xY4mAbRA5IFbRRNm4YbSzql
         4iLsEi7+sR1NhuRjvtS5/jq9manrSPva07jwFB93C/ULcsxqzw8UkLCjYKmVFnoaj3nL
         EzUV6dR2LKoTL+d9j8xJm3XsJnVP/QOeyI4fJVu0i0EQ+VuK5wXIDDAS1OLi/cXLv/zi
         IKVA==
X-Forwarded-Encrypted: i=1; AFNElJ9J03D8gUwJV0/vhSwUYp9m2A5X6NMUUzSPqRsOEvAW2+P7XFkVzbAMi2lj892sNUC66a4fTbuWgoqe7VQn@vger.kernel.org
X-Gm-Message-State: AOJu0YxqXc/KTqnsjyvFI+T6IeAjRi3xme6qsM6DFdOOQBesJ7NcYZr2
	nRqDd1SkTxHKK7Fr3E543/NJz9hXN86Cf21vnMwHnLfY7FkJp/ViyPFomASpT6bQNxk1pdKxFvV
	Vg4n3CMH4kX24LgZMXzF/oum9sMqgbOFylS7ZB+GPV8R6znhWMwqVRZ/9xrkk+TlMPJiO
X-Gm-Gg: AfdE7cnybXnImgMVXQcGoKAv3WE2i98SHCYPo7a7PHZh5kwDJK4w40coYlHBvZXFIMz
	0VJ/+oeDjDW6EOLQIdZoXkYt6tVBoZC+XtT0hzRFiD8+2iM5iqOoudcFiGPTXFm20Iok4NTWKYI
	prILHocAcdZSCbR/k7anyauMAFDgDECE1Kxk9uIpW9rOrV7C/d9pbSocFUNo4GYqAsWINYx7LSl
	b3oU0BqP+oDICnvQVsGn6CW+DZ4+BLJlXi4PItXJTHT+SH/zwywUm4cMAUO0EA4ou/xCG2LIsjp
	8z1BBaXfQmflmFL6N2DJuaQIWlsnAYCYZ+RG/Bco2FnzPM/j66ubr8+uuHVc78b57v5o8uHQmo2
	xLOrvVPgwBcs4GVLso1igIzTxTd144+iX3Wf0QBkm7W+mJfcUK5ux7WSq1Q==
X-Received: by 2002:a05:7022:690:b0:138:4e1:4701 with SMTP id a92af1059eb24-139db9e612dmr12798846c88.7.1782710074568;
        Sun, 28 Jun 2026 22:14:34 -0700 (PDT)
X-Received: by 2002:a05:7022:690:b0:138:4e1:4701 with SMTP id a92af1059eb24-139db9e612dmr12798831c88.7.1782710074074;
        Sun, 28 Jun 2026 22:14:34 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318f3sm45044012c88.2.2026.06.28.22.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 22:14:33 -0700 (PDT)
Date: Sun, 28 Jun 2026 22:14:31 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 1/9] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Add glymur-qmp-gen5x8-pcie-phy compatible
Message-ID: <akH/N/ZwnSD5BkIj@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-1-269cd73cc5d1@oss.qualcomm.com>
 <5dffdbe0-cbb9-429e-ba15-0afdf6f20fba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dffdbe0-cbb9-429e-ba15-0afdf6f20fba@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hXxkJVxw6_OjPSKe8Hesx41f1f6AT7Xr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MiBTYWx0ZWRfX3lrBdsZY72Vm
 l1hmxCn2E0//uQBChmrpSp+SQhrndxSortSLdgeZ5F2W2GLg2g9IcwwTpZJPZM1RXp+H5ZCmKt7
 KfqjlS0kHtSYVNZMSQxQkme4XH8BMjY=
X-Proofpoint-GUID: hXxkJVxw6_OjPSKe8Hesx41f1f6AT7Xr
X-Authority-Analysis: v=2.4 cv=SuugLvO0 c=1 sm=1 tr=0 ts=6a41ff3b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-NWG6JK0s8FJMDO2LyAA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MiBTYWx0ZWRfXy5KRLl2tRPkC
 vnVpk+kxynB+nF1TS5h64ptSkbBk8Jx+Ugy3iipxTZajlEu9ymtEFcAoFzeYqnSug6mzbmBxMUm
 7tOuxJhWMw8nqtEZZINQH1wpIa3Sb5lqG5IuH15lNBaEsez29Roxd5HBnXMqzsKWMYl4lF10Qjd
 3h0ToDS+7AYzbvHxk6KFvWiMt8NVP0Bci3A9hw4fQd/5vVn5I5jHjXDwahpW4ipz3Nvh/lbO/UO
 vzPwEZlPZm6abefxOBpmTZALMR8bDqhGxEJEkKYpJ8qVMvwxBYdiLN5IZIReTtTQSU1SgP7oWYD
 nKoQ0zPdKgZE2KA8ThxEKrpuz2HFBjYnm5vGfkl9Y51/6PHIzj2sJZ46O/umP+0x4jwq1IRCwps
 sOC+4Xx/SetcjG7JGyYDBj/JsfJwvAlzIAOfhnoFB7NS9bev9n3GoaWD2pr1g15uYk3iiV9rox8
 iBVNfnMqlWWPpYsfZwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290042
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114830-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,hu-qianyu-lv.qualcomm.com:mid];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 161EF6D5FB7

On Tue, Jun 16, 2026 at 04:03:39PM +0200, Konrad Dybcio wrote:
> On 5/19/26 7:47 AM, Qiang Yu wrote:
> > The Glymur SoC uses a single PCIe Gen5 PHY hardware block for the
> > PCIe3a/PCIe3b controllers. This block supports two link modes:
> > 
> > 1. x4+x4: two 4-lane PHY instances are exposed
> > 2. x8: one 8-lane PHY instance is exposed
> > 
> > Add qcom,glymur-qmp-gen5x8-pcie-phy as a multi-mode PHY compatible and
> > document the new link-mode property, which selects the active link mode
> > via a TCSR syscon register.
> > 
> > Document the required clocks, resets, and power-domains for both PHY
> > instances active in x8 mode. Use #phy-cells = <1> for this compatible,
> > where the cell value is the PHY index within the active link mode.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > @@ -68,20 +69,29 @@ properties:
> >        - const: ref
> >        - enum: [rchng, refgen]
> >        - const: pipe
> > -      - const: pipediv2
> > +      - enum: [pipediv2, phy_b_aux]
> 
> I'm surprised to learn 3A doesnm'doesn't have a PIPE_DIV2 clk.. it does have
> a non-div2 one though.
> 
> Seems like it's specifically not the case on Hamoa and Makena, so perhaps
> it's better for maintainability if the Glymur list was separate
>
Do you mean splitting Glymur out into a separate YAML file for the PCIe3
PHY? I'll add a new file if that's preferred and Krzysztof is on board.

- Qiang Yu

