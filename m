Return-Path: <linux-arm-msm+bounces-104638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBjJJVUO72kq4wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:20:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 184A746E45B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA0CC30094C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B85371049;
	Mon, 27 Apr 2026 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIMErKLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3X3Vfch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197963644CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777274450; cv=none; b=aMesGCgOF/V4jr7dAq7HDYLYn4J876kHchXyEI42ZAtulQSWlvCmVIoRbIZEzvrI3Gke3i5L0alCmqv1Zt9yQz+tCkqXOk9cpWFC3KrbgLfglG99O+FRVA4Sx8N/7WWTQU4ZRh9QvLdiu6YgllpSH3zrIPBefen/Us/kPyh/S30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777274450; c=relaxed/simple;
	bh=o9f762Gf9TU4Xcf3RUmv4xe1w+G1LPDPNbt+IgF6tjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uGFrAzwiALB2eptpP9rLlKz1YJzRlSw0Bb6zitUtmiTzRO95IRP5oF4cnxGxp5C/vCrX/o3Pd4I5yB5IMcNMll73bOQWLi5dSHkie97yd2rcxHhLjsUeZ8BkYaX+6g9aW70YwYsJHiM/6jy5vFLkBIl6hySOetOFNT5bRkDqmi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIMErKLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3X3Vfch; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R3MntF2526400
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7PmnkfFyBl7ajnSl177EBYWpYk1Eo9oHSOysxEGNHNM=; b=KIMErKLPlETn3HjY
	tQNcunp5B8oH67/o/f6xIg/G0QtRFQCrR5oyZ3PL5CFl+rTr0D2tLnMLC16sMPGB
	TcrdJufvPgRux5+3PqPGblfGIY9yXhqVvpUTcqO/UkK1/5KGd4gBUZWxY92V8cVj
	G0lSN4MNK5jRDNkHekrNFvfpt3bdMMUZDgNCpz2cnJ3v7L3r9aQrbM2YXYDyAodP
	efIfc/YutxSBHG9x49MFtCTCGtZCdhhiioMvnPBpaFG8ZuX98H/lUJCgrqepcu3t
	Q1m/ran42opvHcDWAiR/y3V9J0xeDgfB6nDugHQL6gcouk0DdZ34uOjkgb9zhxnz
	M+LLeA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrmv0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:20:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24af7ca99so135123145ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777274447; x=1777879247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7PmnkfFyBl7ajnSl177EBYWpYk1Eo9oHSOysxEGNHNM=;
        b=D3X3VfchKNl0alXmYl8L/L9YlVY+3LNkXzm4NvqaiXs8YpJXY7GucyVM2oJi2ZAYvq
         pVc3iHvqb6NyPMaLuFDxZQviaTBmyD8k4W2yQNJdaw85BiS4wqQ9I6Oftl4apLip+H1L
         FkFpkD1b5KSIm+TZos7ghzUVRsXOYTpIeY5O5m24zmBu711n77tYyrB6ZELhZeJ+zUcf
         L+taxGo2qJKmm21diqv3AdUD3QZTdmyiLKxuU7O9LjialIvObF59THOIhnyivYlClOY5
         V2x8nXPfyG1SQokwZirHdzJ0wnAibPedfWFCyt699tc8ZCqWNy5/1lFhJhOo6CXvAptE
         xjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777274447; x=1777879247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PmnkfFyBl7ajnSl177EBYWpYk1Eo9oHSOysxEGNHNM=;
        b=JOfZQbigGUWRSzxwoH/TzdtvzBgpZFJ5SYobQSExpbgds5LewL4rbAJWe/s0kyZJNL
         5X9fXN3BfFxS1YCTQyTFiev7SjckX9Ug1B08+Xf7rPBh1AD7MWb1KNPUCJrbkMUA/mfP
         YOY7FKa6rmEiSbhJwiocGmBNfpMRABsbxpxhQAlxbZDb0RO5ZNif736X1gXwX0qBggwA
         YcP+LBQE0OCqs5HGuTRKAXEOU2TVcfkNNBy29ekpA4YP6WFMC/uzCmhgAy5KzERCcMHl
         GWGVAAwVJRUoiG9ml+SbZARjzR0IEbm+ExlZsty/w5W9NNdBOeRtrqwYAoOgMDKKzdt4
         k+lg==
X-Forwarded-Encrypted: i=1; AFNElJ8//YXFBmwhFgroXIZyhMLtNCCZLAIp74l2R871049/BY+h2wrCP/4jt7+yn8lsUkbkNMJMTlvSClRHdOAr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy99mjnNrKzrhkRyf8UXDdeX3SUbmDYaiz4GpVoBt6xvo+L7uvm
	TtwnkPOKn5XYEzHXvTdCaRjU/kkOhV0d8KU4ke2dY8tyhV1WNXfFDyqpPcuASnUeqHD8ZanamIG
	yeuWsXBm3y+9LCSkGyFqEIkn91E+PexhUqdwxpdG7RW2Ud/4jbfcC16tkGa8VClNQYfgM
X-Gm-Gg: AeBDievUXJXCMXyyGkC6z7Hw+qhgf78CRPyE/4iDAmcsCKUNk4yWO1LUbjBzrBvtHC+
	iciqK1HRiITf6sXdG0/bQti6RKLKwMCfO/naOQv8DGALfgArVkbiqRHfdheu6oE8QG0sghAJJDh
	VMNGqhJMaNs16Wrkh/88xmLoV1oRh7C9OUJMcy0uDpbPl/zSA64zz8liKn4/+Ry1b3e/XDSbuMc
	TkQ+CMBvCVd4CMKE/AQRz2F8DayVC2Ds/7BzaehYPBg3wb6uPV9CKCH2Rf64yEmyN4xPzY7yPXX
	UU5XRQUg/jAkrR8tHgFr4M6/PLEM82evl87JC3PYn5xLPPmHkfHxL9lnTf97rrMXrEg4WV3c8Zd
	QMSmlwDu0XuG6Vlh4zyf2zCaDwkAGmP4LEpufBWbVHJJ6SGIZwipWFDyucfOtyg==
X-Received: by 2002:a17:903:8c6:b0:2b0:c45a:bc2 with SMTP id d9443c01a7336-2b5f9eddc7emr446294605ad.16.1777274446565;
        Mon, 27 Apr 2026 00:20:46 -0700 (PDT)
X-Received: by 2002:a17:903:8c6:b0:2b0:c45a:bc2 with SMTP id d9443c01a7336-2b5f9eddc7emr446294365ad.16.1777274446032;
        Mon, 27 Apr 2026 00:20:46 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3ac1fsm315877045ad.70.2026.04.27.00.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 00:20:45 -0700 (PDT)
Message-ID: <f3e83bc2-36ef-4628-af1f-d9465eca72e3@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:50:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Nord ICE
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260427010527.230473-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260427010527.230473-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3NyBTYWx0ZWRfX8oMrepU+vUsL
 SoRETFsTw67ZHdaBBNwAM3uV75ayl7gp4Y/mh1oZrQdLNmoCgV2mgxiR6yTPnPkq9OGgpxWCdGl
 2Xgw6ZVJhe4cng0YAkxbr2h+Wuw2HXf6yIq22ImMaf1p7FBT6fJazKwQ/WfyI1myoN2sFAqHSnG
 sMujb3iDXRh4+PuZ54Y6Vs9LbSEH2A34SsW6DSoAK3hf25SjNllEYtgKdxPXjdZL24vqvOQGgB8
 xRFtkqLm65mACf2ePTkzRGWgQa1JO1DMd2UaNsMjj94UnPbfUED9kPHve8YxgPaY5yG3up86Vfi
 EMly+7IRUkn4vnEiOi1n+cR4ohyObLP66xGB3MFb9mmQvU6hPrHy4EUvhIw7pGGdpdhQIuKTlX3
 8vw9Xi11LEKNLxKS6/mdjRabA966iOpMxNtC4t17S++9TdrtVD3ztbfz6nxQiVy807BEAvyGyOZ
 HK2xtpBmHr13mIsIssw==
X-Proofpoint-ORIG-GUID: N78-qLldVOidXbnsovbTHgax8yS1KrEv
X-Proofpoint-GUID: N78-qLldVOidXbnsovbTHgax8yS1KrEv
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ef0e4f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JrGBsv4J1yBW9PuSV2wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270077
X-Rspamd-Queue-Id: 184A746E45B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104638-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Shawn,

On 4/27/2026 6:35 AM, Shawn Guo wrote:
> Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC which is
> compatible with 'qcom,inline-crypto-engine'.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v2:
>  - Improve commit log to make the compatibility explicit
>  - Link to v1: https://lore.kernel.org/all/20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com/
> 
>  .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> index 876bf90ed96e..9251db2b8fcd 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> @@ -16,6 +16,7 @@ properties:
>            - qcom,eliza-inline-crypto-engine
>            - qcom,kaanapali-inline-crypto-engine
>            - qcom,milos-inline-crypto-engine
> +          - qcom,nord-inline-crypto-engine

Wanted to bring your attention to this patch we are hoping to send for 7.1 fixes window
which mandates the iface clock and power-domain for ICE (from Eliza/Milos onwards) to avoid issues
seen when these properties are missing:
https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com/

While I won't ask you to adjust your patch immediately, if our patch is merged, would request you to
update this binding to comply with the newly introduced ones such that the iface clock and power-domain
are made mandatory for Nord as well.

Regards,
Harshal


