Return-Path: <linux-arm-msm+bounces-94733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC6vBt47pGlnawUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 14:15:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2E91CFD3A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 14:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 318983014C46
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 13:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB7232A3FF;
	Sun,  1 Mar 2026 13:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IlopAkYJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BbDSbxLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7A83290A1
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370904; cv=none; b=MWPZZUuzmFpy19P09gxTgLIjAUJyQOMzv5TA5XmFTNxucpTPCCIqYK8VQvrZ41ET2jXBXAhlri4QxEDoyhG8zXxnHvHxsIlvt0MwnaRqcAMLakpoA9qR4aUDaGmhAl7KOwCidwgciNKqXNW8n6ZxsMXVeO8tZfK44ivIgdtdrwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370904; c=relaxed/simple;
	bh=zVnMi33A7jqtHMgzAP055qUVoI3UcFgJfvOX1I1gXIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daxu17AX5D8NSAto1VQFUKhjHMFZeDC64aNQGHMHdzDuE/oFdWR2E7SqgIPCrZT34d2i3l8th3kQELMY6vkqTKeImQkKECTBzb/Bj/dCHMyF6GSLDOQefxlMSKVZGabLOfhCYRsYZjdhc7oykTVhefe2INFTSns/vZ8miua/j/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlopAkYJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BbDSbxLd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621CMkaj1536328
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Mar 2026 13:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=snWnqEIa83hX0FQ2t7CBWIOr
	s8QBakxpAZjHWXPwAmk=; b=IlopAkYJhK9GESsMJD1HhSTg1HhZbsGE1Ez62Wtx
	6zUHv5ZZM/93J3Bkr9T+HTMU1Faz/eNlG568xPAO3yT6yUb36avVFlIe6ssXhctj
	uLaJXMX79P6SiPVXGLOcGQpvCi6YRwVZXeWVT5pQiOE/WD1jGU0ueAJfEvJ1Mndl
	XkQQzJhAZG35+Vjy27k6uQlih/Rnq8YkdOodx+29riirSYkc5neTxH49mjn9OsDv
	w0H3IFKTel6D/Jvhvi4RYIySWJjbkpPq1c9m0l64Fr2xrRh+ZKwZi3qCF5C3YOMd
	Zm19T2FpZMmmBsKmGSaAFjHDTPduWvan3IZDjwxNJaGMtQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbardkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 13:15:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb390a0c4eso2314039485a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 05:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772370902; x=1772975702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=snWnqEIa83hX0FQ2t7CBWIOrs8QBakxpAZjHWXPwAmk=;
        b=BbDSbxLd6nT6LTQ67RNQpFZzmgdLPcIkO7yaphSE/TG31H8oPfIgs+xx5eyrxSlR3+
         97ZbhzYgzqSPu2XyLt8bk9ziGZCoh6KZBrK4xqFEFz+5hBApzJZgYkckqjFJezKLkhNj
         xuT1UnQ+q1Jt6D11xMddiZyBC3wfYiEXl9NQ52NnsD5R5jEdTi+EpwYOWGMo4iEn9OtG
         bwgfJ111F1cCZ8wflOiN2SyV02gqKt0lfoQX3S0MAkYSruUQac1azHuBIh0LrqWWG6/U
         vWTnNB4MLMyrV/Y3dT2eWb8L9W1fR3TuBWdI/JMob2qTUibzOLalnePCV5HdMJXqlEmj
         WGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772370902; x=1772975702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snWnqEIa83hX0FQ2t7CBWIOrs8QBakxpAZjHWXPwAmk=;
        b=TgXYfC4QOH0ivXs6RlN/yyjEq9ByvedDhLEq4gV0RYQ729V3BMF7aMyVL/UdudIpbD
         5aa2Hw/WGbYSQ7lPYWEWxitqZtXqLozUTv4B6ECmhYNIEM7QG2TDjPvs74dvX2uMy8YQ
         CmD+mJm9HIhjccQaFF4njttHpxKCb9kl2mdU1kZTOb28dkQxBIP+XRfP+FjdCB2icqpY
         iAEPFA+jt0MaFS63j8jA/3my98roBCO64/8BszhCLDvia0DXG4MojymEPgwTmG9qd3hh
         L/as5zz1+C9ENkbZmWj7VqfdUG1YgMP8QonYezkE9ypiPF3QQyVQ77Xc+EXBbm+3tL6j
         laPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5SHhjyyBbxtJH9Y7Sx0bFRnlJPkMdAoWg1t91fNRmcqT42ly6h7k+db2Oms2BzyCorUh44uN7lFvHJ++o@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1sS7/A1T2MKBcjJOl23k0cHvMUJf3iFt5o9l7HriSm6mUXKYV
	470VsH/MCk1/Z+9FH6GcF1+wRfZ0JtsBfbV6Of6OcFbU2+jVI8dGJn8pxqftjKCO39KOjZzr0/P
	d8y9pkFY4fQ12Osu7fJjyZ6nWgsZ5RAF2mQy6DOowxquqt3WyioNxPgii16t4YQEQeWbW
X-Gm-Gg: ATEYQzzv30s671TSMIXyi1lU0JmrljbfBZwR+mYHHTGI/5FKKpG6SMI3XpuqHPJZGCi
	uk5Pso1h4eit6uPGbvNjti4hAHTFnbHo/Kyx74aadgxUNXiFGSIdFzbBy4MFlzMCuv02hb28zK1
	wxcjrUMzZZzZX9qksJqxchizNuhmktkuOtbPzwhgv/uQuJ56isiqhBLpnQOzBofagBeWFijytHS
	WHud8pkevcSgayx2bSuDEl4E+oXeq6ggJjXTtZddIxKiW1kdwEIdWRqdf9dwaHmB2Rq98Nasy1Z
	dEXZoNsjxxBYpe4IsN17gSwohLqlggm2QieTt/lFruwQLUIU49sLgjXttUE9KA2DaOobARisFK3
	dyVLJu2EUfiV2J3A+UW0FiQ1eayKTSyK20hZmmRTlzgPAYBeJ1hgtxVtHhozxCUTWhl7X4la5qo
	CYA4sZ8Ati8HZR4lnkfWQqUy18CX4FoFp+Agc=
X-Received: by 2002:a05:620a:1a21:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cbc8df092cmr1150155185a.38.1772370901709;
        Sun, 01 Mar 2026 05:15:01 -0800 (PST)
X-Received: by 2002:a05:620a:1a21:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cbc8df092cmr1150151185a.38.1772370901258;
        Sun, 01 Mar 2026 05:15:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11577588csm1092335e87.67.2026.03.01.05.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 05:14:59 -0800 (PST)
Date: Sun, 1 Mar 2026 15:14:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom,sm6115-dispcc: Define
 MDSS resets
Message-ID: <uqfdlsgc3ct23hgpul7l5towiry3p2ouneuaikbzi7x5h6hxy4@5l2hhc2m5t6l>
References: <20260228204638.11705-1-val@packett.cool>
 <20260228204638.11705-2-val@packett.cool>
 <20260301-sophisticated-quizzical-serval-ccbf8b@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-sophisticated-quizzical-serval-ccbf8b@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEyMCBTYWx0ZWRfXwDCLI7cuGxbz
 jQF3E8eUSxfiDq8KsA51CPMkbS8I0os7LuhiIfiOyNVZdeeZYjpFnUn2eDvrYSMjUC9c0614T4W
 pO/KV6w989fQVWHEkHCaR5uAx7WEUiORWdhoqQN6vuqUxjCOC4NM5uOqh4/C8JpbjM1HEz0kjMG
 lkJ69plaBQ0sQkHlXekKKOeN/Jxe/0gghkxHeSN4ldzhrecq6zYVWwzEXxH1BiEJXkl87HYk8fv
 i1d29o6sTa/HGewAjgBSyPhUNQUmn2SnTO4fSp8KG8p9T6yqggozxqc9ERPqsCGsrbnt6kyKLv7
 AeVMJbFpCCE1vqRuxjWQ544hRlm/TU/YWzNSB/NAk/Fy4P5SsrPSpyVXRR2LGO+Gc++3YXT+3iU
 hmjGpNMc5vsphQZHefKeadjEBqDc0N3HItrlHy7jO38D06wlJMXWCd3E6fXUtl2x//P6gNsiCTx
 CNxjazW/YsNMS/PFPZg==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a43bd6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=c1V6_AEUxpLOshWVZTEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Kpj8ocmUnF8qOhp1MKKQXn2OFl4lrxwB
X-Proofpoint-GUID: Kpj8ocmUnF8qOhp1MKKQXn2OFl4lrxwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94733-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[packett.cool,kernel.org,baylibre.com,gmail.com,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB2E91CFD3A
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 12:52:57PM +0100, Krzysztof Kozlowski wrote:
> On Sat, Feb 28, 2026 at 05:41:27PM -0300, Val Packett wrote:
> > Add the missing defines for MDSS resets, which are necessary to reset
> > the display subsystem in order to avoid issues caused by state left over
> > from the bootloader.
> > 
> > While here, align comment style with other SoCs.
> > 
> > Fixes: 38557c6fc077 ("dt-bindings: clock: add QCOM SM6115 display clock bindings")
> 
> IMO this is still not fix. Missing feature in original posting is not a
> bug, it's just incomplete posting which is in general accepted.
> 
> Your commit msg tries to explain the bug and I see nothing relevant to
> this binding. From that explanation I see nothing wrong in mentioned
> fixed commit.
> 
> Please drop fixes.

Here we have an interesting situation. Patches for the bindings and for
the clock driver are not fixes. The DT patch is a fix, because MDSS /
DPU can misbehave when switching from the bootloader configuration to
the running system.

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

