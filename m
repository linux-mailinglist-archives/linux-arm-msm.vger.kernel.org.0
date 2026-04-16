Return-Path: <linux-arm-msm+bounces-103331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC1yBshW4GnyfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 05:26:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A892F409EE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 05:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 995F2306EC7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 03:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D32A2DB79F;
	Thu, 16 Apr 2026 03:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRCnIbgV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGlfSF7g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B49E2DB79C
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776309895; cv=none; b=AXohGpG5rHslvFyKm7g4gmb7MW3urWF+zouuKUjhWE4D/IuWedZpvyX4ZUdGEMjB9pv2WWs6Hm2cmsTCbD+HLHL/+ErWyvU3eTwQfgU0dP8IKL4qyvqWDvbbsde1ocEgcGrbykogM5uaj+yUB20yX61C2NU+v76b1YFnPd506yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776309895; c=relaxed/simple;
	bh=CAC7hcpHXFceWsFhsW7uMUBF+QFiX7aNtehkuo0bxTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=augsAEeKQSoozf/PWDt+xEVDF8XgFyr2JpIAYwds7+Wn3igZyzNqfWtdP1uWU85w+azOoCwtlnSnkOhKI1BOzMN6H2Ntt5sZM1nSCRZGpDZfJr7KGi3o59npLd/4Fp8Xg68gIsha8gAIcBr5TBTcxMa3bCW/NaQy3HT36BSThhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRCnIbgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGlfSF7g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G2J0DM1702367
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kCRrk9J85EIL+MB+vk6NyTlj4gicC7h0alWG5teJAv8=; b=DRCnIbgVO6xiLyRm
	huXE13ofi2fd/qfgmnFatHl4Uh/a13c+oF2FGYQLNpg9S/Cq1bRYHffPTkA71rQu
	lo8M/58ndz9OfwYLLAjDxq5WfEW0oLPqHFXnmxITEoGJe3fN9iY7OPPfPWG+npCd
	kpWWkIHit8yUoTkoq0SCPqDRBobqyIZcVcLSPN/oPQfGbWAhJLE5zTdBWT6A2beU
	z5LOYOuX6cf/CfzgfxxazeLWMLe5jnM8vpkZhmt8wym3JeeQKw19P43KhLDu2KOQ
	yPbvWvvZcauBJt+/JF5Wp/vMEmIqrjUev3mKraJj8YzzE7C56td2Z2wrmTop5XkG
	lJoWUw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamhyp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:24:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0ba59a830so9657867eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 20:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776309890; x=1776914690; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kCRrk9J85EIL+MB+vk6NyTlj4gicC7h0alWG5teJAv8=;
        b=aGlfSF7gbIzvLtOnV2eFiJDPDbFksKViMvEM5bQljbEN9yABxhGH+YRxWjgrxLYX0D
         MUJAaIhSEJbU0JOMd6VpYpoOf9irHJVVsGg5POLiS8QrYX8kFODzheyg0vJ2C853YV40
         sm+bTajJoE1rf0Nsnw06q6+bGoIRoGAVE+gKKfc/6omvbVBYbZiccvYpnXOzYT4QCAry
         f4/rbHuAJlqYNPxAXdoBLYF8dDQyVpwg0miLN/o2MQV5Jcq72QSvGtTVCn+I+m4zGN5V
         iORsRXOv9JRFJqo1ppI/sgJgsnjOpliyS1KV6Uz8BGhNjRiwH63tzbArBBqKLwaT/Ani
         L27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776309890; x=1776914690;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCRrk9J85EIL+MB+vk6NyTlj4gicC7h0alWG5teJAv8=;
        b=TmbG2COKpvFHXZxYvcK6lvJY94VuaDMmTOHNWrBBOBC67OYk7JoEgw2iH7dgwz6tCy
         +rudylu3kLSMMp9byBXbjeMazVEEEhShs1JvFf6OyKZMxW10iiBhvky9LMVwS84Hv90v
         xYA489zcInL6oStKjzkmMpA04W+NRIpcsSBOfq8ONdAZE38W0tHIiCCsddOMdS7ZSDZp
         LBJOqN8UP+1p9xah8mNX5IugUkNHDtwORjaPHrwfYpxLWGZuAMLQhPEVDUfpiwGpcAgM
         jG7EqGHVuD+G+RaiJz+c8OxxNsH7bSQ6PhSRnMDCMSqrYzgn2PanQZY/R77GTHj1EgTC
         VD5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+eaQRIW7FWqgpkU8uwTsSyV1Cm5YhVxeA0VniPrD4FSC1yCC+6MZDwfyq0YQOTGnLIqK8lW6J6Iu8DkyVP@vger.kernel.org
X-Gm-Message-State: AOJu0YwIhFA/bRPFC8KGBDpUEdp5drtk1+oI7Ds4PaVLOkopXk/u1hmV
	6bSucznETZJxL8EjNjZccZF1DuiCESHdZCfsXu9c+t3AVnRqwju40K5xmUOr5lZIrOKE6fkfsq+
	5GWKDB8LRqDS1SuhTO8L+I+CcdRkwh9xmkue5c3s7BGlLXCPjroIoTHsyEenV0xz31qa+
X-Gm-Gg: AeBDietxbtj9XrlcNjyBhx3fxuim8lortD/bUBzglD2m4w6eL86Gg2z9X5RPcs07iM4
	u5WwyN6wwOxkxOYDfOXJ2hS6pI+uhATYVR7tOCUkTOBM1epljq4z9mr/lbu7bOgQwchEFtoeU7x
	hNxloUpGYO1IvhWGk8MepGAq6rG39hoNg00NUV/TSKE6U/CuqAwJ1JC/9wRl3xtxQ4FtC7g17EE
	J5HTZFelxvapclp11EO53MKGmJfLtzGNuhIpaWAgcUeoLp7RtXr1jdFvcspta/o3W3tqxZxeaCr
	zGGvx8p1Oaz6eCW58mq2UvrUdldhocJOoLKPPx4Rp1AAbUvX6Wepknfs8J586cbCnRFgOYjztUK
	2JdVZDL+jMVsffOklO5mPg3OA/h7nIlT2Ekt5aEICKoaPwBNcB6DVhSzmfcEgTId0P9vL3bqc3R
	amisQ=
X-Received: by 2002:a05:7300:7fa1:b0:2dd:2ad3:f799 with SMTP id 5a478bee46e88-2dd2ad3ff90mr4699465eec.9.1776309889839;
        Wed, 15 Apr 2026 20:24:49 -0700 (PDT)
X-Received: by 2002:a05:7300:7fa1:b0:2dd:2ad3:f799 with SMTP id 5a478bee46e88-2dd2ad3ff90mr4699435eec.9.1776309889204;
        Wed, 15 Apr 2026 20:24:49 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb84813sm5427848eec.18.2026.04.15.20.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 20:24:48 -0700 (PDT)
Date: Wed, 15 Apr 2026 20:24:46 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arch: arm64: dts: qcom: Add support for PCIe3a
Message-ID: <aeBWfv1oXnSQC454@hu-qianyu-lv.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-5-affcebc16b8b@oss.qualcomm.com>
 <20260415-pragmatic-termite-of-attraction-3dbab5@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260415-pragmatic-termite-of-attraction-3dbab5@quoll>
X-Proofpoint-ORIG-GUID: SAGg4bQ1aLtMzoycKEUEULsZ7sL00biB
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e05682 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u3NGOs1Tg4bIGv4jLNkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: SAGg4bQ1aLtMzoycKEUEULsZ7sL00biB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAyOSBTYWx0ZWRfX+viT0B+wkDxC
 BVkm/nqroT79Tr9Xsdx3MTCGHwKZa5Nz6HTCOc6P0+stWmrfuS2IPolzBUMnS6D8YNc6lZ80wTO
 gtagNoSiBbPb/A8FJMui1C3Lp7Zaz1wbnn25ws70ngY6+6a4MrjNzFfLyXs8VSbfl4Yaj5fG8Va
 P5vMr/m7BgqBbjrbslz3XuC9j7P0Z42qid05F2oR1hjCMEBk9roi7VdfOow+HKR1cne7ZEXXyCF
 1V4XGfe8C79qDB1ZALsaRRVFKCPO1jeIjJBGNjLYO68ZlRU30GS8wonssEtYzTtpB92/nuSI+aj
 qZqUXz4wjNn9g9c+2J9tHIVySjRyyd1jZh0Y3d8qI+iztYIs7Qr01aAiEfodhMFsum0VZQCqxMS
 va/HQRxmhTl1qiKi2vUjAsWj9GpoWPfkV6VfUNP63NmAIzaZkej52D70aD4bF4N4gUHOxYlTCtv
 o5EX+7wOSQtNf2So4pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160029
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103331-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,1c00000:email,1b40000:email,f10000:email,1c10000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,1bf0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.1.134.160:email,0.0.0.0:email];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A892F409EE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 09:44:15AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Apr 12, 2026 at 11:26:00PM -0700, Qiang Yu wrote:
> > Describe PCIe3a controller and PHY. Also add required system resources
> > like regulators, clocks, interrupts and registers configuration for PCIe3a.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> subject: drop arch.
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>

Thanks for pointing me the link. I’ll drop arch: in next version.

> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 316 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 315 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..c15f87c37ecbad72076a6c731f4959a1a8bd8425 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -736,7 +736,7 @@ gcc: clock-controller@100000 {
> >  				 <0>,				/* USB 2 Phy PCIE PIPEGMUX */
> >  				 <0>,				/* USB 2 Phy PIPEGMUX */
> >  				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
> > -				 <0>,				/* PCIe 3a */
> > +				 <&pcie3a_phy>,			/* PCIe 3a */
> >  				 <&pcie3b_phy>,			/* PCIe 3b */
> >  				 <&pcie4_phy>,			/* PCIe 4 */
> >  				 <&pcie5_phy>,			/* PCIe 5 */
> > @@ -3640,6 +3640,320 @@ pcie3b_port0: pcie@0 {
> >  			};
> 
> ...
> 
> > > +		pcie3a_phy: phy@f00000 {
> 
> Same comment as before.
>

The existing PCIe/PHY nodes are not strictly ordered by address. Current
order is:

- pcie4: pci@1bf0000
- pcie4_phy: phy@1bf6000
- pcie5: pci@1b40000
- pcie5_phy: phy@1b50000
- pcie6: pci@1c00000
- pcie6_phy: phy@1c06000
- pcie3b: pci@1b80000
- pcie3a: pci@1c10000 (added in this patch)
- pcie3a_phy: phy@f00000 (added in this patch)
- pcie3b_phy: phy@f10000

Do you want me to reorder these nodes to follow strict address order?

- Qiang Yu

> Best regards,
> Krzysztof
> 

