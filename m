Return-Path: <linux-arm-msm+bounces-97106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKcuI0cnsmnlIwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:39:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D2C26C518
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFE14305B0BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330E037C10B;
	Thu, 12 Mar 2026 02:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NidlplNh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+mr5m2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F203A356A09
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283107; cv=none; b=K/w0ZnvY0AtggWP4QF2OZ3mB4ylb0LUnWlZhOCclK5wN1rHrwhZE0yNi+v9zskQnHWDLeCjfCf4020RB7Z3iESR//zBoTxvzJzv9Cn5GSXEzdB5yk3si2bGlnOyo2A1xQSapDhszNI3BkEatABBtQg5oE9Ne+LzJ/sJGs1Fogbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283107; c=relaxed/simple;
	bh=7V9OuUs/GZ9LAoR22G1yJEV3t/ofu7G0LbfU0uGw5Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0nUR8Fw82PKWS+ZygZWuQIvtAketJu8qc3bp+C21J6k/+AneHJQXNqEw6QZCIQMnK40ITcY5afRCbxbyeO6BUs7aeHTjsDjLcdBdy2llC+qsU0TIWdIdejdGyMC1tVNEMr11Xi9KaatScTSJTWPpNiIxjD5pfAjfD/vqtum4c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NidlplNh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+mr5m2Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMNd973536364
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s6KmeP8fIPrfCASKESv9JEH0
	i7o9V+Co84iwzH05YUM=; b=NidlplNhVuMlZi/eEghYNXKacyknkSG8ncCiOiuY
	0uGU46oDL86ZALLvV/0amqDJMycVXZFIkXKU1/jo39Guvlh1sHYSO1uzsD7JwteA
	ToRvrJggDcB1VMwPIj4dDhVFJTzGQ2t3BjRbyNTukgWJqesY+vuHiVVS6LJGszbc
	btC1V/XtDB5OyzO2Ac5Tx0N/qCatiflCPOOhJXIMn65aQIcRQMShDcb4PCtbzftS
	akfXVmYM3RZ1AnnL33DV3GAgFVB4LQcb1jgHH+XQlUzHqGI0N9GRkjBzh8kEa2fu
	s/I6ScUIxrOU0aUNrPXzawZGN8xOtv4a2UA/VUAxpf18dg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54rm4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:38:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7de0e161so338269785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 19:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773283104; x=1773887904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s6KmeP8fIPrfCASKESv9JEH0i7o9V+Co84iwzH05YUM=;
        b=U+mr5m2Yz4NxABbyzz2nFiRfhf6dB3bQk9nRUBDmdTHP+gOi7v19pmPutbSPaXUDwK
         r405+UY83OoNPZnaY1yJVt2u8Y7WkoRu0Rzo/0KE0RQfFcfNyOf8lmkb75gm5Xx1ys12
         8IYhe1qI6zFXu7ail+ClkfxZoTSM4aL/hyVYyBU2Du6zcQTXwzUk9eQmRamz8SNu0E9s
         Q8bsVkzOo7lbOy+xuDTZnR4Np9SlnHs98Na+eS4Fi9sZ12ECpgqJJM0z5kAznE9UqgOD
         K0waA+mrClXw7iQzONt6hesoeGNWaNb9CHyQ0Y8arCGK0OIn7gdrlftNhKAJWMaQCyU3
         5XWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283104; x=1773887904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6KmeP8fIPrfCASKESv9JEH0i7o9V+Co84iwzH05YUM=;
        b=sus5R0Nv6w4I5Q7rVRgTzhSyyCrDx6QKqayS5QeqoI0HMoWmBIZ+V1F8oikThuGHI+
         qPM7tvQ2rxYAuMwuxS79Z94KiUPlU8Nlb4+/cW4SjmC1LMsJcIzwfGwpncNTXRr/Fv5u
         5tENv4txLjJijP9k0uxmoc7cfGgoemFpVMipq6r3awgzs7WSqsZ4lqRVvyA2nicrrshv
         +rMPcXuWKXBIbF9i5Kmlbiih9DKvgDmYLt66PElGmyd5lJKd4JbgstNTBv15/JGES7QJ
         dyOn2/WwPUR/AUZpHouWJU0ri5ynRE58xd1MlJqaTfqFYJr7coZZn5W4umCG1176JaKV
         SlTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXstMlZhpBMtUfuGQ02i1IM94AGctj7vHpyvJIdSNbT0SHFASqhFfO8bP+nRIIcw29nNAAvLJd2Kp0Ct+s+@vger.kernel.org
X-Gm-Message-State: AOJu0YyxDtCpXtEgmNzkc35ty/bmobR9jLjB2jsrYH7W8+cMaksPJj1S
	z8XOLjqBVE6iqOPvGThcs8aW6jZwBYyLP8+l0TRXlSRipuDVSPu+0e2uwa76CWp79ltL6WL/P6b
	GIkhqVLDvDjd7LcAxF9Pov9DDD5UhXcLyGS6b2L1nNTnSs3nSvibLSGb4hL4GHZ6THxoZ
X-Gm-Gg: ATEYQzweqhohDSoGxoxZewDz9DX0Dc9UOcOiXqpRQvadfwt8Ag06bm804rQN6f94HYp
	HfhEwn1rl3f/SlbVFvsF3VgJOtIBEotCXCQa8HvILYA/C0O8WU5tn2ATxMAWlFCeE5/e3n7sKYq
	shjuVSkE0r/VVYd8Lf4Td5EEe9ndzVe7tUGKbrYMW+n/BWUbAqfVzRz/FGWh7p8thkJmAV4CYah
	IVv8N4n5/a1AE+QNXTJflaJsHPO9l+W1+76hGPXAfoHBFgFOTNAUSgiJzgmXbE7yQrHsX3jpttD
	0VN7DMqqg1tOMqHkb5qQ8IHcz2ADHXQzQtQvmJS2prqTeWsOv0DG8Dfw92FfsTkqha9wTcDLFlW
	zZS+uhIENUBUieRMM7VpQyAG8+a3AlD4v3p1dCGo4wrYguf3n9Rz+Sko8iVFes9SkdDx/veFHk2
	5xety5TjC6vlRyWXDP5oroaPuBqwwbEJyPVpw=
X-Received: by 2002:a05:620a:19a9:b0:8ca:123e:819c with SMTP id af79cd13be357-8cda1985809mr611837885a.35.1773283104152;
        Wed, 11 Mar 2026 19:38:24 -0700 (PDT)
X-Received: by 2002:a05:620a:19a9:b0:8ca:123e:819c with SMTP id af79cd13be357-8cda1985809mr611835985a.35.1773283103740;
        Wed, 11 Mar 2026 19:38:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162ba3sm685473e87.47.2026.03.11.19.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:38:21 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:38:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v6 0/6] clk: qcom: Add support for basic clocks
 providers on Eliza SoC
Message-ID: <wxvb55g4w5ixxkngtxzhtki5wx3eqqql5hy4pehbyhzz7zyazi@ljhceku7yyhx>
References: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAxOSBTYWx0ZWRfX8aDabn9eg8MO
 7r/BScxnFYsGag2O4o6MniZY/aoqFAqDJqEHkntlrI59y2YQx5taZBLSm/lL103fYKJCpQNr4nY
 fwLZD1Dj/Y+YmtsoOikX3i2MPXW9ts/md4r3hGcz9yrWUXfrbfOwIfh7pbRYcL9keQpVAmhFnwg
 Qw+GC9HX6sFNURyUxzWzYfHgSR59Gxb1LV2cL8EYT2hdlXpp0zw1GV4W7OLWhgQ95pj+tcy8CcN
 t/7bXmkkglhuZa1XObglj6DNtMiIe0KYlmX7E9nzc0EC64QYw84aIO5rsJIO/1agzqs4lL8Zw3N
 fXxHMYZngb7JtGzYsizO8/RFogFUjzic/m124B0JQlpkrHXzCyw0xtTqiQcaTbG+78DCGxAZhIi
 xMipZblcvi5i8kXkfCXWjNJNZaWuPMAuYMea8Eub80arCkf9IWEiTR1SjgafUzi7wdXYUM9lPJ9
 CV8d/vXXM0KV0ieTMDA==
X-Authority-Analysis: v=2.4 cv=YbiwJgRf c=1 sm=1 tr=0 ts=69b22720 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=R1Tt6jW_Uyey-IW2WNAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: t7xigGdGjHGM55-e9ppfePrwDeDvUn1d
X-Proofpoint-ORIG-GUID: t7xigGdGjHGM55-e9ppfePrwDeDvUn1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120019
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97106-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31D2C26C518
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 04:46:30PM +0200, Abel Vesa wrote:
> These are the bare minimum clock providers needed in order to
> be able to boot to shell and have the rootfs on UFS.
> 
> The multimedia-specific clock providers will come later on.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v6 (RESEND):
> - No changes. Rebased on next-20260310 so it can be applied cleanly.

If it was rebased because of the conflicts, then it's v7

> - Link to v6: https://patch.msgid.link/20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com
> 

-- 
With best wishes
Dmitry

