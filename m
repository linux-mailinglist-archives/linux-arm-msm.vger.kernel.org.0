Return-Path: <linux-arm-msm+bounces-91550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF56ELbqgGleCAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:19:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C991D00FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ACCCE3000BAF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 18:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A281D2DF136;
	Mon,  2 Feb 2026 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7n0G7D+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHbkkzoU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2BA2D948A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770056369; cv=none; b=KYg39yEhTlkoP37VRBUIcjoWaDZI92lPrQW8ZSeweg3yC/2TmkK26ZQU52+DVQb2RPynWCtF94bEtQRJdz3P0iD12c2cR2o9eca4MhQhkN7BrQJEnI8SakzuMmW4GP3fDOiHhmvtpgekvH+vWaz1CuSLKdDhgysL+CKZv/PWo5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770056369; c=relaxed/simple;
	bh=a+7P/ZNsjQQls+/UvkziJVxaDQoixZ+gZo34/9AdU8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+gDl1bPmgoChoCLhhHi22sr+zPSrdXUrKBgYxY43gvYdj9qB66vBcI3kAVAic7bhHnL2IpfQ/bawh2ofME1NNZxv9UO4MgA+oPh3OaofYe9fICATaAEbBmr0TfKs992MeV9/Fc1KgZDUuiaS76pdJbIaYxuFkGD92c5x6lvipg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7n0G7D+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHbkkzoU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B4EO12848579
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 18:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ii0/ixH/O+xz+ye5GcMZOozh
	JxHdclj1uKQw0V46Olc=; b=P7n0G7D+H2V5l4nYFscEytL7eu3mAWuSiO646F+x
	UZetiqWNF+/HucmwKtENcqV1jlPsS+JztNFYE9W06eOjUHAuNtIYCJHG6eUhth43
	wHecV3dxaoowgPqCv9+986mhl1vodg2BhHgf1Dfs/EBv61oMEgKJhlOMqfFdVNA6
	E6rYY4/xSo9NCBMOVA1T/bN5joG3cQmUSC9opo976bCU5oUv/UfPGqT7mBTP92Te
	yE5P48NMx5sh9UIFERFs6NRcYeGV8tzahrlt5YnOmYf3H3Ijkqmf66jejYKfKKSr
	oza+6UxznhCrQxLgNYJEZfz9QU3+8ln3bvit1JqHiQdHRg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tqthd2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 18:19:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0a4b748a0so101033325ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770056367; x=1770661167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ii0/ixH/O+xz+ye5GcMZOozhJxHdclj1uKQw0V46Olc=;
        b=YHbkkzoUfUh1rE3PnvGGjfXJWaZeREPX1NqVSge6tJGXOwEctuQZryxM4DLtUpyN/l
         1RP5GQFfwjb5g5oJQiTfUrctW3lNY2HyfiF/H0lD881fxAKie2wXUEQM/rxf0VeJUlKh
         kxbKvl/vguTjNEuaCrEvJBv1E+wh1ALsrjGmNvXYXTiB6eXGhowSpsiITBZKFus/9xaj
         qCHyR+kiBysnR8n+394P/pSWUVJXuewGirSzXz3n2Shj+cdpTNTtzvSq966w+jdskYvG
         Hxug+uOKLjVj4J7hybtmELnzEYRBN1ZSj9gp8WezXmyPccdztatvFyvOiYkbVqHO7xfA
         qgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770056367; x=1770661167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ii0/ixH/O+xz+ye5GcMZOozhJxHdclj1uKQw0V46Olc=;
        b=Dk8DMBOVNnnH6Nm9U2p5wz5g4kgQCEQntHN48IJdx6v9tmdWSmgDGEDvubI9Om4p1i
         XJjQ+cQy1oqfy+Oty+lGXGd1DhmZ/s28wvKwknlKz+jXUtCn2orj1am69dwQiLU/mFqq
         bK0c3ESYOJRVsZQG5QKORGCLgKmh6z1dS91O3mgXNaIKr+Ohlh9zjeOcNR/itvzyqsLb
         ZGuujj+AWg1cf6wlu8qS8lBMZCeRkhaKg6UKw7zj6RfYJDFOkCNiWKhnO+A7vd2lb+P3
         u3Y2LiYxGpPNVddZFC+XXXN7Az1DYaglEfR8LQdx8MzSyE0Q9I+3T3GPdUghmjGKOyRm
         HhBg==
X-Forwarded-Encrypted: i=1; AJvYcCWdoHmVwwkt4dhlnFSkG9YvaQve7MRXvnSrHGbZgHLFIbSBVe0mO45w0Clj5IbcpeTcr2vt3+lmyndnqXXx@vger.kernel.org
X-Gm-Message-State: AOJu0YxdHqVr4NX6f5jA2qsxzen0KpMnsPCDIPSaJrYGTHlI3h+qHN5z
	iEZVBIfKRJN41St0UrdTfg8gUgbE2sS0pwbUnFievlt2AJeyJLyOdYxTRnBMXr8tLCqRsE/WZbM
	W1dUKWkux+09031+h3Q7qXgQ4iEiM3nxgdDvPF0u8Ry+avKnML6Vpb7i84e6pr8W5yqlc
X-Gm-Gg: AZuq6aIR9e81gg4QLdZWkYa8PrblsSxsHpJTEjlPIFccuTdBPCkwn4B8uWc7bvhAaGN
	OYJZ9oWt05T+QflhlJp3HYL8GBruhCHlxDEXMvRNUPBeOaYg0ZYHaur0mWn/ztnayGK/HTHAHh8
	nuQv6efAneAL+usSCrzLJpr/j1W08a87MjMy5CTRpjizNJx2Jhqj2wpCLhWwjs/+UnokL4vqko4
	UGJdq/23OSuZ5b0n6hYACjxjqfESQ72zNd30q6YtR9nM/saibnv5xQahIWdzncB5S3J9L1tMym9
	y8eVT+6IpwREO+0WRgpeISwFxhmFKHs+MSPbTq7hIxQkvRbbyjakOViNzS/wlTr0Xl1yIkNu1wA
	VJC0c3Iu55pOzVXj/voBTdObJQFuC6XAoANIR
X-Received: by 2002:a17:902:d54e:b0:294:f310:5218 with SMTP id d9443c01a7336-2a8d894cb94mr127379625ad.0.1770056366757;
        Mon, 02 Feb 2026 10:19:26 -0800 (PST)
X-Received: by 2002:a17:902:d54e:b0:294:f310:5218 with SMTP id d9443c01a7336-2a8d894cb94mr127379325ad.0.1770056366091;
        Mon, 02 Feb 2026 10:19:26 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8bd7654dasm126177085ad.81.2026.02.02.10.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:19:25 -0800 (PST)
Date: Mon, 2 Feb 2026 23:49:17 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        stable+noautosel@kernel.org
Subject: Re: [RFC PATCH 0/8] Fix TCSR representation on SM8750
Message-ID: <20260202181917.imo5lk3smwott2ue@hu-mojha-hyd.qualcomm.com>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XP89iAhE c=1 sm=1 tr=0 ts=6980eaaf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_u9jKQfyTUMrN_QHvf8A:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 1jJtYzqZ2kFDQyfJazSJCr0XrKA5_bfa
X-Proofpoint-ORIG-GUID: 1jJtYzqZ2kFDQyfJazSJCr0XrKA5_bfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0MyBTYWx0ZWRfX/kpucNfXaMXO
 U6xcO+UlOJxmWgL/4l1w+E7dfjsXAjMP5P4uMOJB5MiIeOefNcWeKUClkTb9q5/1OLLs4h+ycRj
 yctHtYOXkx2Kb4Qg1zDmqZUJvOl8gvlVeajb2XEawsN14pettrrPmKlouMO1e1UWtoFDZqTWVwb
 lP3yjuB0L/AqIOXJp5UOc82e4aKo6TXEq3kEShWS8MQyhNsyFw37IJVOAKdg2Epa8g7xSgEHtT/
 9Fwn9zMLmLKnNdyi9oeBJ/FN7gv7+CL5Fu84pbso7D9rOp0tvixmav0PHOCj2Jb2Ecp6HCGD6HW
 7XwjRqxock/pG7vU4xC0603Cj7i7pwoAMyguT79Jfs28MYAuZRvuIztxudHWzXTTU4MEphdasUo
 bfIMEISriRJ7tuIx7QAkQ2U7iq2DV5SNXAud44N7FOJN+jEFDXvV8ONAbtZ1aG0sGAS54WaPI42
 up0jAokAL2ctxMDsnAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91550-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,noautosel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C991D00FF
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:57:32PM +0100, Konrad Dybcio wrote:
> As sparked by this thread:
> <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
> 
> The current representation of TCSR is wrong.
> 
> On platforms post and including SM8550, the TCSR had a sub-block in it,
> containing gate clocks used for distributing the XO output to various
> consumers. This is what we refer to as TCSR_CC upstream.
> 
> SM8750 however, is notably different. That same set of tunables had
> been moved to the TLMM register space. This is made worse, as the
> sm8750-tcsrcc driver consumes the qcom,sm8750-tcsr compatible.
> 
> This hardware change had been undone with the generation following
> 8750.
> 
> This series attempts to unwind that. It's difficult to merge, both for
> bindings and functional reasons..
> 
> I think it goes without saying this breaks backwards compatibility, but
> it has to be done to represent TCSR at all. The patches are ordered in
> a least-destructive order..
> 
> I gave this a quick spin on (remote) hw, the UFS (one of the consumers)
> still works, but more testing would be greatly appreciated.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks Konrad for taking this forward, while I was also working on your
suggestion to make tlmm a clock provider.

> ---
> Konrad Dybcio (8):
>       dt-bindings: Move qcom,sm8750-tcsr from clock/tcsr to mfd/tcsr
>       dt-bindings: pinctrl: qcom,sm8750-tlmm: Allow clocks/clock-cells
>       pinctrl: qcom: Allow exposing reference clocks living in TLMM reg space
>       pinctrl: qcom: sm8750: Expose reference clocks
>       arm64: dts: qcom: Remove inexistent TCSR_CC
>       clk: qcom: Remove tcsrcc-sm8750
>       arm64: dts: qcom: sm8750: Describe TCSR
>       arm64: defconfig: Remove CONFIG_SM_TCSRCC_8750
> 
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
>  .../devicetree/bindings/mfd/qcom,tcsr.yaml         |   1 +
>  .../bindings/pinctrl/qcom,sm8750-tlmm.yaml         |  12 ++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi               |  27 ++--
>  arch/arm64/configs/defconfig                       |   1 -
>  drivers/clk/qcom/Kconfig                           |   8 --
>  drivers/clk/qcom/Makefile                          |   1 -
>  drivers/clk/qcom/tcsrcc-sm8750.c                   | 141 ---------------------
>  drivers/pinctrl/qcom/pinctrl-msm.c                 |  92 ++++++++++++++
>  drivers/pinctrl/qcom/pinctrl-msm.h                 |  14 ++
>  drivers/pinctrl/qcom/pinctrl-sm8750.c              |  31 +++++
>  11 files changed, 163 insertions(+), 167 deletions(-)
> ---
> base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
> change-id: 20260202-topic-8750_tcsr-e2dafc2f11d1
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

-- 
-Mukesh Ojha

