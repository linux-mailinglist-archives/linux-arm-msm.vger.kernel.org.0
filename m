Return-Path: <linux-arm-msm+bounces-98220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAFpNe5wuWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:19:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0B22ACDB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F24FC31886C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FA5343D8F;
	Tue, 17 Mar 2026 15:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9SpCG3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hcj0FiEo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724241D61B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760363; cv=none; b=G++cESPs6+DFrYBwa53SNvDZ98+HwqK8EPQT28L2zefrUBgnjkGrVAw1YHkOdzzqAyBVuv3EI9B9r/Wbo0qCXsY/mleftKwFEXPwxSptSPHn5EZNtdaZce3kkypm+uywdrKd4dCjKdBZZd4jJ7L9NphnCEgJJaWCA3Ob25eLhG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760363; c=relaxed/simple;
	bh=gWm79uxd3ZluIB/6XVJDHXXuzC0QYwymR6nGebDZo2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMB+5bB6RXyofntgoQzvo+sCjHE/aGpR+0QrsObZUK4dvaK6KUrhRWCsff0dnPUcM+fj6HdLWbmBJt50EV3W7q5Ip3t6cOpGeK3ncukv/XKEA+iVdcOQi7hzWWQ+XqEovRYYei71HKSumAXlCp9q7aSuQ/1eH6Iknau1i10ZNSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9SpCG3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hcj0FiEo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H9DdmZ3101974
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sUqEx+8VaizdPHOqwofR0gq4
	9ZRuOaLW06kvHn2bcEM=; b=g9SpCG3q0SPb33H6rIUbqyCH5OtKbOknIzgRgCtw
	Hjs6M4YZ5aJW8mykICS1jPhgZYL4tAeygChTKzOovZpOn5s9eCXwGeG3kLgCHLLV
	OiJTpBp8TiI00V+m5VxCBssRUFSRPcLtaI7i8XymzaVsnOT541OWCfYXca91rZSy
	pJ6OG9xuDdHVRYuyVF1B2z+jjZqgsSxAiuC93EXnv+Mc3Cg3QGIrpPSrZFdovDCG
	0YBKPe8Y0BRNsT0lqbBDZnFTCSNGlojQeyqcSSSCV6lXPwQwOuogTsKnxgg4u51D
	yXJ9e3Hoara+AgxNIwl350kezrH8DnQHJIt37fRnLjcOFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb7cbwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:12:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd849cd562so3732264385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773760361; x=1774365161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUqEx+8VaizdPHOqwofR0gq49ZRuOaLW06kvHn2bcEM=;
        b=Hcj0FiEoCIV0n0ddIYGdmcCYGmX/M9YlZvp8xwugjzhxkKeyiL0ysNLiiN24J5Dc7V
         aD80zWTMN1BkWc7NFvDin4e2X5jQeMVpgwzs1DWubUjRxlRX5juwYvl8mwCy+5SFW1xy
         0Rsh6SNzxQAmcnJ2uWAqrN4uOCt1SboAcBKydGCqd20LQ2qflGDZlcfKN+LJWs7gBmMm
         1M4RzRJXtKQtdMLlhZsbq3BQuM45UB94KHS8+IfT6CpzVsYFSxWxG5hOKJk11OJhRTby
         sBu3XpIBr299x4rEma22CgL99sHQfyrma9Zlik5uXQTNiH2OXuvo2IEXLmRJKod7HAJD
         HFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773760361; x=1774365161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUqEx+8VaizdPHOqwofR0gq49ZRuOaLW06kvHn2bcEM=;
        b=F6gFB6aArTQrQXhk7T+c4fkRqn4n9ZNLG6c1mcMxID9P29EXya7BK4NYdvivCAIwof
         FMbmf2QFH4PyUvwTcs4tQ/mCDb4H0InXD5oSPNX9+5cjplSjjAwNdh3vUXuaws4IqRSu
         AI1G9hvUdkuzRF+Bd2/I5QNIGDs5tuTEI4c3IXDuo25o9ABiQPIygfVuif5DP54vT0u8
         o4QBgdPYMX5NYL3Epulhpgtjw17qA/qlwBK4woY6R6zWnQ3AooVaIB9SwEfnShDQEsKX
         XDxZOk8NVvdkm0472CQp7/FFAVGpD1/SuMso4WLc/XOZNMUS6UPt3NE4Cqu0/TII3w/E
         jPFA==
X-Forwarded-Encrypted: i=1; AJvYcCVWg73doF3v9JEv411scHM/0XJC07s2+PLpO6mM2J8WtBYcjZFini6Yc5UetxEsugHHx1ocYUmKzzOa9F3O@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf+faU9Ru/lIzma5xkJ9Ntc1D41lOmm/KD6CCIB9jClpYqMtCT
	8bk5YXT5pGCAJetL+54BGHvGlboXyJevyT5LCMPniUYKZlBt8x0sPSYh9n8xoXC4cJ8+Ez0X9mx
	xmA4ITyYTZq5ohfXnMxIG9/g64g2ZR2OKNEEsk42cP6VJnMJhK8r/h875jW/xVrIDL3H0
X-Gm-Gg: ATEYQzyo/LwsKPje+uCWTTITdQ0vYovAXatbpjsvNZpv5EGGj2nqWFhnef6Gvr3PzQP
	1FUCrsIBRcfof7GEMjtTgtt9oHA9I87Un+5fZB0bGkB1DouUMmVUB4g4WZCAOu0/rLExtKkbw45
	Fc4cqoWn1avxvcCSVT9hiNt+c9HHSSzK0LomrDES/9GpCVsxtj4//S9w8onL67Hg3/AoWQv4IEJ
	yrgM2EFY4Ug0HBvXDrqRylKeZverMMr9QZwVyPEcrhzWZmc5M3QJ7D7kys8nTyH+d2p2Y63zzM8
	g67UvJrMAP+67E4+bVwBKZHYul0RDlyckN5y3D4NykmRrJtV4/W0ekuacrUjFg0pYfTXNd0aTKY
	AGsoUH0FkL9DmITbbGI1SU7rNhnrSRiilvISyaTRQlwaXNLqWN/BsfbBBVTY73q9srwhL++Dzd1
	KUXTlISI+b3N5gN3Ac80jw4UU11YkDwvWjZPc=
X-Received: by 2002:a05:620a:1724:b0:8cd:87aa:e3e1 with SMTP id af79cd13be357-8cdb5aa5810mr2149990585a.29.1773760360529;
        Tue, 17 Mar 2026 08:12:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:8cd:87aa:e3e1 with SMTP id af79cd13be357-8cdb5aa5810mr2149980985a.29.1773760359743;
        Tue, 17 Mar 2026 08:12:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1560348e5sm4165633e87.39.2026.03.17.08.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:12:38 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:12:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: crypto: qcom,ice: Allow
 power-domain and iface clk
Message-ID: <do62iaopjcahvn576gfcdbyo4yxudf4uit2sbifvjw3pwrlb7j@higm25fdesk3>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
 <20260317-qcom_ice_power_and_clk_vote-v3-1-53371dbabd6a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-qcom_ice_power_and_clk_vote-v3-1-53371dbabd6a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMyBTYWx0ZWRfX01wG2Lic8vLV
 VgXVpvy3pQdoCZteW0wX+akUhl06QPTF14kA+DgGkLyTenFZ3/fAoPrr9nmkvMtxl4dZjJ+Eg16
 aysa2AAqY9KIHQ1iTPOrT6vCvS8IK5wdRk5BHgi49btTJgbLeFWmVAOh2GpZT5lAn6lPSwEUaep
 CokVXYQr3CiUOAw1Mxgg4fTUYTDNMJyiE2AtTWY/QtZ63S9mB0rB5PW+8zwUMjghwGi1rytCzR1
 /Swq49yXgQKmBrH+gu2kqvpprMlj6tsWR9QMXKKZAbXHvjKNkf0GNwpgddECBz9vHduPLJIm+uk
 jKL+3OMNlElm1EqGFQp8UpzWh2qwEDqkE0HED50PkIkqSPvODi2vXgFNTk4vh+75RLvqn/hrlQG
 XDbWd42R7kNwMRGsCrFbgCC9BbLDYYtYwRTeinquVlNTtmB71Wkbkh9VFOUKlHsY3l1dR6385Ne
 7yqweFzihd2FVOrrR5g==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b96f69 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=X3mLLWgbv9ot8lHMMaMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XvDj64YoOP3Z9mM-v0znYI8dk1TKAPGd
X-Proofpoint-GUID: XvDj64YoOP3Z9mM-v0znYI8dk1TKAPGd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170133
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98220-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me,redhat.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B0B22ACDB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 02:50:40PM +0530, Harshal Dev wrote:
> Update the inline-crypto engine DT binding in a backward compatible manner
> to allow specifying up to two clocks along with their names and associated
> power-domain.

This should come after the "why" part.

> 
> When the 'clk_ignore_unused' flag is not passed on the kernel command line
> occasional unclocked ICE hardware register access are observed when the
> kernel disables the unused 'iface' clock before ICE can probe. On the other
> hand, when the 'pd_ignore_unused' flag is not passed on the command line,
> clock 'stuck' issues are observed if the power-domain required by ICE
> hardware is unused and thus disabled before ICE probe could happen.

You can simply say that ICE requires these clocks and these power
domains to function. Accessing the hardware can fail if they are
disabled by the kernel for whater reasons.

> 
> To avoid these scenarios, the 'iface' clock and the associated power-domain
> should be specified in the ICE device tree node and enabled by ICE.
> 
> Fixes: f6ff91a47ac57 ("dt-bindings: crypto: Add Qualcomm Inline Crypto Engine")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  .../bindings/crypto/qcom,inline-crypto-engine.yaml       | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> index 876bf90ed96e..99c541e7fa8c 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> @@ -30,6 +30,16 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: core
> +      - const: iface
> +
> +  power-domains:
>      maxItems: 1
>  
>    operating-points-v2: true
> @@ -52,7 +62,11 @@ examples:
>        compatible = "qcom,sm8550-inline-crypto-engine",
>                     "qcom,inline-crypto-engine";
>        reg = <0x01d88000 0x8000>;
> -      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
> +               <&gcc GCC_UFS_PHY_AHB_CLK>;
> +      clock-names = "core",
> +                    "iface";

We don't actually need names here. You can use indices instead, making
the change completely backwards-compatible.

> +      power-domains = <&gcc UFS_PHY_GDSC>;
>  
>        operating-points-v2 = <&ice_opp_table>;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

