Return-Path: <linux-arm-msm+bounces-96375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEESB0w8r2mDSgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:31:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A17241B8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9F02315F23B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90F436894C;
	Mon,  9 Mar 2026 21:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAhVOMD4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eLrpxNXN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4394223BCEE
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 21:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091657; cv=none; b=SCJdQGumvXGpYevWzLp93GhZntbqYc5bKnqTq3xNMAfHaZTuZ7AbO/cbJmohka27QNS/ntmqZFvZ4k8/8vy159U9hjX5x76eGYs0LmmbV0iN6rwKpMz3gnjlyr+cMsxVJ1D1LVX5HGY2LgI1MKVA7z12ATat71lI68vpZoTMg/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091657; c=relaxed/simple;
	bh=Ia8Cbh6/+Kbk0y8gTmD1N8Hdl5uzj82V+GpajWlwRsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imDytqgpNt4qQB9kCcnpKwnjUYsUHnxYuNQa91ApbTZqoQ9XRcydVPHFhqhGQd92PCYPy/vNFHgSXppw+/jEljkzI+UGNNgu74OYfzBE1DBegIDHuuojuyQNeQug2A11uC0GXMd9GLBLsgYlfWq+fmws1CdZQO13Y5YSuSRtksE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAhVOMD4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLrpxNXN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCVeO1204905
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 21:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NffRds7Kdw3GfATErgD2BYuO
	9VlL9883uve+FpAdSz8=; b=YAhVOMD4sLCdGdkCsQPj9hbYj9hbLiaCIGouq/7f
	Lqk1Db6fNF1xkdLUr89TySHRsLlKAiLU/8yzXWkMOqmy2CnLr/1OmSDWynltm22E
	mm6f3Ai+kC4tfsXe4vsbHWUpdIM1gDdh/r4vN5bb3ZckWlHis/y8bXj6RBUMPMHa
	SqBgRwSAxKuxpUQgzw6qdKZFUgAMUh4XUSQELO/ark+PVDrRPBiRR9rkiVyCd/QH
	VIO//xZNIRYTCZEj2mGtfDCWq1BYc9CcsoDuIqn4ATPITWhw7hBGcX5pNTo29XeN
	0gjMcv2vjW5ajMtq36UzX3crjJl1WO3JQIMSMh9/TNlihg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct0329dv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:27:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50333a8184aso964601661cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773091655; x=1773696455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NffRds7Kdw3GfATErgD2BYuO9VlL9883uve+FpAdSz8=;
        b=eLrpxNXN72jd/4y+6CaJdcC1Ax4vwqtfvQ2arzGnfyc8gBCZ3KRnFlTNhtjNuV5wZW
         crT/6fRhlbYVIuqavAv1cG+25V4KOQPHFXgzfuMX0qXGiF1Kpz1RCkACG9P41thQoMav
         sm87wR/eJabfJlrjsCbf1+psoQOstXDJOsu7sCsE3PwZtLxvHlyAANTOxD5sLtbpQIwt
         iqbMPoHjdM2WHLj5r4qCJLPTMgs7YNMPMVLT+HjcumQYHunj1iEqnDx5ZdKr+eHA4u5m
         djM3Kau36vE4xljTAo16tnCgJsN6iMEYHm1/zlMWlHGS87raDWPcqeJVfQlR2Rj196Tq
         cj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091655; x=1773696455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NffRds7Kdw3GfATErgD2BYuO9VlL9883uve+FpAdSz8=;
        b=b8V7KjRrh1qkZJbTn0nZxf+X3UYxSXGSMjnAzJSYheP4ll1DikOrJrwqdsF6cOjxUI
         xAfAasSD0PuOy5WYDCpbREtApUCauv3diaE4xRKxngtHfyDM7W06YGiDIWdrSwQ7K2Ji
         P5gTCpzFl+HmtE4Beg2Zey4HQ8lT7FLltBpux5M+8LdNcZ2E+o9hQLuIlTmUw7qbzkJw
         Fa3DqRKhuia0w98uqQ3QNItt/K9Sz6fOGsW6twT2ScWEyUxuaeR8wVYsVBw9sGXPzKqo
         XC3T9IUqar4XKE5QnsQbzH+ccsOpQQ8wCkfJfmjjttbaoMald3rnVV+TII3NxqkInjC3
         zkBw==
X-Forwarded-Encrypted: i=1; AJvYcCVw72YICCt+RKjiVeMYhD141+1nuA8n9JY500qMoa8KV57FxSODLGNnKdERhxjeOOfUlXzN91QdOc/YtDQF@vger.kernel.org
X-Gm-Message-State: AOJu0YwcBSg0xMFuFl1GashV2EfkKRHreO5ERwVclqVO6SXgATfFcmEA
	Ul3JP+8mn8sqXMp8LsWb0ErvSWjP6bRhiF8O+eQ/Ln4DwBzgzN4HDPb9iuUo0idGI+VgGu7MJCL
	cYIFyL2MOWtKXhrWUuJYrRTs2czT9XHJ4s5MaDzsTwpN+o21+EuUli/21U9orwIzgFwiC
X-Gm-Gg: ATEYQzzYoMjQlwSCKn1ZgFxOHKXOkRiNDwR2OOMXxSRhIzaOZvb0Sh1OAQ5CgNco2Q9
	UL7ATwjhIgviiqdZ+AW2SbpYNO7wO0HDZHdk0TfqrIxhVO3QSqN0lTG9Pkp7xvb+DpjirgrBoMJ
	nas2sU+WS/3oZzDcJKQPDAQkJn340WqRMTjVSVI1KUc6x6xic/7mzgKELDcyzyAItzQZmHeGaK3
	4rbfR6fQNHb7HQxtRZqVLXy83jZ2pX+VelJZTHIa+ZYOPaTmIyyaONjBdDtvEoXcrGFvF9vEcOM
	9QcvBoV2Yv/k3dgLvRfC6rhj/1/xzfajbLbHyOxYPseIZDOaouG/cSaKYjIg9d7KLxCyo7dluoH
	CAfh6LJcrnWHfyLE2T7uV02S1PxHGzldnP4d/8LfWaTft1vNtA3u3mDbSd2EoH2ZlZCFfBFZJh3
	OIUI7FtSCZ61ppqa97vWEFsQEBJVpT7tvEVe0=
X-Received: by 2002:ac8:5a55:0:b0:501:b1d8:637a with SMTP id d75a77b69052e-508f4961581mr160517251cf.61.1773091654338;
        Mon, 09 Mar 2026 14:27:34 -0700 (PDT)
X-Received: by 2002:ac8:5a55:0:b0:501:b1d8:637a with SMTP id d75a77b69052e-508f4961581mr160516981cf.61.1773091653855;
        Mon, 09 Mar 2026 14:27:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d085efcsm2398578e87.64.2026.03.09.14.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:27:32 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:27:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing CX
 power domain and required opp
Message-ID: <qqizoxngoey4ij6757k544tssarhisyj4rh7jynf6srgoiu6vi@lhyhu4n6w4s7>
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v1-1-f682c82f116f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v1-1-f682c82f116f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5MSBTYWx0ZWRfX8SN+ytFG79mp
 ia4Z3GmEkiPZC1p8/go86lOS3P6I8DPM1KzD5mwdKlMaVhX0yQiSRWGN52h95lm15UrdmRoUAj1
 +ocgOG/smYXOxz4Zm7WL0JP5FPhwAkuqnft3Inr8R+1rdbFM6k4oQ4zTm6xNBB7g5aaOvFDWO8U
 5EDcm9zjFSS67imzQlPIzs8sEqz8GyQZMnEZCJf9GTiD60TP0iraDPeDm2Eqghw0E9rxS153eVV
 DkFMfXkVmOMyDMA5xPoVsWu6nj5tjCtUF8oqhTGAezPc4l8tQNEI46MIu1sw32DsouX3CC8PjZE
 ospg7WuC3czpfA9kMUTrADopVxN1nylh8BiiRS6NzNMbVhMqEEdaDBNoA3+3PY+F20fmiucIOVD
 9MD5sXSC+KtdpIaF+DAjDsO7DXwXUsdWzTZ9JmGmUVNXYdSOAC6D741uHmWNxvocR5uqbAPl/io
 dpkwTCOvZg6dY6xFHKA==
X-Proofpoint-ORIG-GUID: AOFFHtUWbv0dnadZ-D5Ee1AaPUD3VtUV
X-Proofpoint-GUID: AOFFHtUWbv0dnadZ-D5Ee1AaPUD3VtUV
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69af3b47 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=G8-z_bGVGM6vuBRgOwAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090191
X-Rspamd-Queue-Id: 78A17241B8B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96375-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.1.134.160:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 12:06:17PM +0200, Abel Vesa wrote:
> It has been concluded off-list that the Global Clock Controller needs to
> scale the RPMh CX power domain, otherwise some of the subsystems might
> crash or be unstable. So adding the RPMh CX power domain to the clock

Which subsystems?

> controller which will result in all GDSCs being parented by CX. This way,
> the vote from the consumers of each GDSC will trickle all the way to CX.
> 
> So document the power domain and the required opp to that end.
> 
> Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,glymur-gcc.yaml         | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
> index b05b0e6c4483..94a911855776 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
> @@ -65,9 +65,20 @@ properties:
>        - description: USB4 PHY 2 pcie pipe clock source
>        - description: USB4 PHY 2 Max pipe clock source
>  
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier for the CX power domain.
> +    maxItems: 1
> +
> +  required-opps:
> +    description:
> +      A phandle to an OPP node describing required CX performance point.
> +    maxItems: 1

If you only need to use CX as a parent to GDSCs (BTW: now all GDSCs have
CX as a parent, is it expected?), then why do you also need to case a
vote on CX?

> +
>  required:
>    - compatible
>    - clocks
> +  - power-domains
>    - '#power-domain-cells'
>  
>  allOf:
> @@ -78,6 +89,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
>      clock-controller@100000 {
>        compatible = "qcom,glymur-gcc";
>        reg = <0x100000 0x1f9000>;
> @@ -113,6 +125,8 @@ examples:
>                 <&usb4_phy_0_pcie_pipe>, <&usb4_phy_0_max_pipe>,
>                 <&usb4_phy_1_pcie_pipe>, <&usb4_phy_1_max_pipe>,
>                 <&usb4_phy_2_pcie_pipe>, <&usb4_phy_2_max_pipe>;
> +      power-domains = <&rpmhpd RPMHPD_CX>;

= <&rpmhpd_cx>;

No need to import another header.

> +      required-opps = <&rpmhpd_opp_nom>;
>        #clock-cells = <1>;
>        #reset-cells = <1>;
>        #power-domain-cells = <1>;
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

