Return-Path: <linux-arm-msm+bounces-111669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6k0RMv9OJmqhUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:11:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AD1652BAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:11:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R0oZPvnB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fERNWleg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111669-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111669-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A3F2301905C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 05:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79E335202C;
	Mon,  8 Jun 2026 05:10:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C3F335566
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 05:10:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895450; cv=none; b=uwcyp0A7wZpRo3g/OHFltQyQVMImou//SW3VGIMQnBJOu84Jm6Tb9Gf3WCAncO05bEBvMAXm8EzTNH7PtRRFhX68dJ6v+ci/K548ZZ0xiRwNBkSNzyIuLnl8fC5eCjtKc6Do1z/D2oLX+rXrjdE6Vtswrd4lilhqGQHeuDoFNDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895450; c=relaxed/simple;
	bh=5UnxAS1f2bto2hiFQ/buNCHdrvssL7LrvcSPElNNlIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KndRsxvLoEqjS9G1K5rkdBz6rsTKMxmZLLg+VOOlv0FbtK9lwmi3rlew+FyNd32NZsL8xjFK+Km+dBeGc5soMvKA+tBMgXzrY3eJDgHj0fSaP1gXM+NVXgq6aEX1tBo6pzbu9TMY6xBOvRdhI7EI2b9HEMi5ZHA8O7i+O0yOVYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0oZPvnB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fERNWleg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580Hcau1993574
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 05:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FxqlvcsonSm7ptmbEFKZdpmj
	PffTqZSRGJCyY3Agbf0=; b=R0oZPvnBLFWDjtoS1g7ceN99pmAF2unU+xWl0u+X
	u4mvAmw4TVpDCYTbd3vtR6WGFDp2oHnGZ41AZAwmfKEZmAdAPLStcflGjuvuqlcM
	33KBHp/baRa32FVHkn6ICdQNiAqpBr9w3L7MSszI44YTwK9b0C78CYxsmhTiqcYV
	9bw7klKM8kk9+/RP/ICo33lnoKYGun3poUefLR0SF49QZ3U+PMeQqvrQIRznwHYZ
	2pjoMCw9u2zKQFphYKXT2NDm7ZyWngln/+M0iwxJQFF04Nrq17TuJ/YmXRTzYfv8
	cKgjVsppr5Jx0Jp6XQXmFnr92NzSuYJ1ZQ/WzrfyHXNmog==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3pa9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:10:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3075fa5a407so2005695eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 22:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780895447; x=1781500247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxqlvcsonSm7ptmbEFKZdpmjPffTqZSRGJCyY3Agbf0=;
        b=fERNWlegBDHCJI4v3FHoKwp3mEYjG5xdWVQCahSuejk+Oa24oPmqPi1W2DS3F7nYEW
         bAyhB7soQUOOWW6YAVVFBAqqIO00zMNlUN/aui9ASpYe7zL3MiH9mEcOVhgtTetvgUJR
         G80ljIN6qb3aCYWCq7en7rZY1koCvPR7tolggRRtX91xQ0ahgAl+j/nOSx3TOerTO1jl
         2qcHbzjjnfcfWSoSsXxQyiV5hnnbB6p+mNfutMkjPZqVTMRa53NJI/lebClmuUcRJtTQ
         dOOU2nB8FQTNWmMbSne8u7R6VqdeS8ZjctcI1tXSLFhPJ6O0IvCDbYXMd728Of4sOOIQ
         Pf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895447; x=1781500247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxqlvcsonSm7ptmbEFKZdpmjPffTqZSRGJCyY3Agbf0=;
        b=CJSOy7CR/kyZbQCUFoJXqbGBT4CUSrHRaPreTwgQ+fzyu2wUcObEBUxR3SKdryR0Bz
         EXm4bwW/LlOUK86rqx89u6xoPm3Yc8Blo5vIa7CTI9Au3zET319OtDFxvuLyuzTf+9Dz
         dXjUpBqpoXwrQHD2Pyb/WavQX2AU/fyn++QyDu7VLC+jruW2J9jT4W/yfmhG+4yDptt7
         ee3Bw8xfGGlaaVURUkgg+G7bxqiqDSQr9k5ZEBKUz2kiIK3DdVPYMp6tuJ8YT7FRBcHa
         4gtHyVuioEKUvwEk6IUt4zFcYWE6EIM0KuyDZg38unSMt1SCoJ3nw1s2aFEw3bSQJ1f4
         0wBg==
X-Forwarded-Encrypted: i=1; AFNElJ/MmQA2rMLUSZYxBE4Gsz3EMGODL1uTo4AtIP2S/dxSHpM6sfCgco/jY3XqPYhUqiTttf0BQrTGsGsXtnEX@vger.kernel.org
X-Gm-Message-State: AOJu0YxtlOyNgcl0cYi6YtRKkja6CsKht8gGOzxWR1wy5tOHLY/JtD59
	D6lPto8H7Q+CXDuut/Fn1PKQtCAMQpGZ7jQPvEzbvehNXgnOHQkLer/K6YN4Vhr/B4zmKaUfOw9
	OoLXAH1BBnuW6YFT3w1RNhOu1VE39HYCKigTOXXRmLpaYu9mtK3UeggK1wkV3boHxHhcs
X-Gm-Gg: Acq92OGNP3ra7mdTAIPDsxcKqoJSq/eyBKBgArvaXgUgf1fPfhkMOxn+dCodG/yoBk5
	Hgg64dbvgl8cXYTt/CHnVgciUN+kDuRRs8GvQ9Z1q+g4oLKXtJwWKwNDvtznfi/Ia6rxKe1zzWQ
	g4KttWDR6EUlozQ/NuWagMrCVKHTWiIac1kKYDY5w56ShbAExmIyASYEhDWQNTYuYwmWPmeKATx
	8L2V4Q3JcFYiMnC9F6k9I6feXdhYRHOuWb7UZmzyt4yLc8yXcQrFp7YhA9QQfuR7OQd+zR/4Vf9
	pxr9/Vx6FoZaNp9wAN6fKjeMtk3VjGSKhDKBFi5aOHqzkOfKjQZkNrK+RpGfUJjZJVxo30zJkJj
	VHiExw7AAhE2/+g/FOXC0tnt8FHQ5VuGal8XaDPb+xOwpYqO3vdQVidDYiYRqWu9UczDBAt/ZrC
	PQkuM=
X-Received: by 2002:a05:7300:4311:b0:304:d32e:65f5 with SMTP id 5a478bee46e88-3077b7d84c8mr7306354eec.26.1780895447502;
        Sun, 07 Jun 2026 22:10:47 -0700 (PDT)
X-Received: by 2002:a05:7300:4311:b0:304:d32e:65f5 with SMTP id 5a478bee46e88-3077b7d84c8mr7306326eec.26.1780895446986;
        Sun, 07 Jun 2026 22:10:46 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df48671sm16240828eec.24.2026.06.07.22.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:10:46 -0700 (PDT)
Date: Sun, 7 Jun 2026 22:10:44 -0700
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
Subject: Re: [PATCH v5 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding and add mahua
Message-ID: <aiZO1LE2wktznWG8@hu-qianyu-lv.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
 <20260602-tcsr_qref_0527-v5-1-8ea174a59d7e@oss.qualcomm.com>
 <20260605-married-elephant-of-aurora-44daf4@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-married-elephant-of-aurora-44daf4@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0NCBTYWx0ZWRfX37jkNKLjPqip
 3wmYa6ykv6vKPNvr07vKaCFa+374suG/yHF4cKJT8WeE5HtdQ7hjAYttnNbTi8jWfX6kVUG90yM
 GPNIvyO+oEldNtULBfc+J4dLMU6wij9v54hlLXjz4oIvwGYQ/d2hX+tSxLdbfsYsnsZ4mNyyWHb
 KdKiwoVrG70WP7RF67zl9RJAeRCx3IfBpJgpu0QW2vEmaned8Matt2+f71RwXKM0Da+b7o1Suaz
 iGN/Oc6ugo0UWzWHA98/GDaDNYWbuHnoVeGFgWmdORbJVPxB0ebnvJkdj8WCe7v3B5dedWaPLhp
 WHYTG3iIKxHwNiovj0exipCDv4/RqIwyysd/bMofSDZ4BI5+yCKZUCVEHEHPUdJLH/i9ouED9ug
 i61FPF4CzTKk0igyfNdJCEyRdVcEveBUVyKWWJTrCEaCqfxUfu38q0MBdgqkTIEdUoSzCrvqoYW
 YXWqvqlsMo1sIpoJW1Q==
X-Proofpoint-ORIG-GUID: lGCdw5ji4NaB6U1486dCswkmO2Ia0qxf
X-Proofpoint-GUID: lGCdw5ji4NaB6U1486dCswkmO2Ia0qxf
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a264ed8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=k8043wpKZZKsePy-DxoA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080044
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
	TAGGED_FROM(0.00)[bounces-111669-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,hu-qianyu-lv.qualcomm.com:mid];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 24AD1652BAD

On Fri, Jun 05, 2026 at 12:21:34PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jun 02, 2026 at 01:02:17AM -0700, Qiang Yu wrote:
> > The QREF block supplies reference clocks to PCIe PHYs and requires
> > dedicated LDO supplies to operate. The digital control interface for
> > QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
> > QREF has no dedicated DT node of its own, these supply properties are
> > placed in the TCSR node which acts as the control interface for QREF.
> > 
> > Add a dedicated binding file for qcom,glymur-tcsr and qcom,mahua-tcsr and
> > document the supply properties. Both SoCs share the same QREF TX/RPT/RX
> 
> I would prefer if adding new compatible - mahua - would be in a separate
> commit. Moving Glymur while adding missing supplies is actually one
> logical change. Mahua is a second one.
>

Okay, will split into two patches in next version. 

- Qiang Yu
> > component naming, but differ in topology:
> > 
> > Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
> > has a single QREF block fed by REFGEN3 only.
> > 
> > Mark the relevant supplies as required per compatible using allOf/if/then
> > conditionals.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,glymur-tcsr.yaml           | 146 +++++++++++++++++++++
> >  .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
> >  2 files changed, 146 insertions(+), 2 deletions(-)
> 
> Everything else looks fine.
> 
> Best regards,
> Krzysztof
> 

