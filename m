Return-Path: <linux-arm-msm+bounces-96475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 734uOMCVr2n3agIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:53:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F96F2450FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 424713004D2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1BF19EED3;
	Tue, 10 Mar 2026 03:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+PAQR0p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHiY5tGo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC15399007
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773114810; cv=none; b=M/Zx773/BTE9j6D/Y8td6hLQg6kDg62QP153v9DNLeOsA9RMNhUcb6mL4Y9KAwaqK0XyFL/a64kUyEkNx0xn5oS9X3WvJP91DUTPGb37b3wXhr8BOtgfpf+8ZxAvdOAJsPZtRPoOyuLHGYmKz58R+VM7JmTd5aVGKaQ+CpomUfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773114810; c=relaxed/simple;
	bh=105v4TdQrrQ/uMIjR5Mp5MhQjg2dne2mJ3lCAkK8Q0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWJJyC6g+NkK54nA3vW1IlDlLMCPkt6hrEFezS8X2UEx3FnXzPxMDi8RSmEAplyyhtkfZgFl4P8wNQFvKL6tPorhTToYetzZTIMObIlvsYzPYV3mTiZM94wVu1TzHteiCogyi79Hygnrv3NgIBqEyt36OIZ/aP9ojVWYJEzzJXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+PAQR0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHiY5tGo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EOjQ2020612
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fd/vYdqYtmFWxQGITEepV+hYM3+te5NOpBRtXH774Ck=; b=k+PAQR0pNt37xGKL
	SZgXbNFGLqykyzcI7w6wsbkmnsRVBTZOSgpFJsDLswqNN7wTmiITQbSMRt2qV26/
	iBn2X9LbHHoncWaSDwK/9UA6yci45d+6MCMYalRy2QswQ3Hyb8BsPLshJgd/aAJk
	1YP30gMR96klqI54MnmQZfpEVygOXDdlMA/jkGx67fzZ8gACLdbQ8SSyvQuteUc+
	QUBUaO0w5+BLC0gd/tV9yWOJ7yf2vwJKTavTtrpNS5pzS6SUkCRra3aa9dXSdevD
	Eywd08q+7JgO6o2DXDOOtCinXGBHG2ff3FdXjLfbFxB84OEfmHqv+QnZBUPW2Y+C
	GWdCbw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbtenj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:53:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso10566541a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773114808; x=1773719608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fd/vYdqYtmFWxQGITEepV+hYM3+te5NOpBRtXH774Ck=;
        b=YHiY5tGog0Lsh8mgBIV/OsfQeUXDk90xiXkgmfCKxTWpm5Byea6BSq22uOSR9uQ3ym
         VUiD4sgrnMHh/VXhweMgSqEU5ERm98IYAEfkLrdlr8OIoGJdnF/IueGJde49AtujvWVM
         xrfnBbQmFXFUWWvRygep1eVxiE5/59xLTRGJq+FbjRvim5x9BorB59Z87VYIH0LaTTzu
         AAT11YP9xcoXcTGcOqXmv+jCuEh90KAUSPnux4vKLVrA75DmGc+r9zfDpxzumCgefuMJ
         y1T0qAWPl8VqOYOcqdm1fZSc0/AFL8BUT9OnrzBVE3MNafRDfgGLtF7yfFT1dFO+Yku0
         ljTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773114808; x=1773719608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fd/vYdqYtmFWxQGITEepV+hYM3+te5NOpBRtXH774Ck=;
        b=Lckl/XvzLefO4NGtuMah/LRmA+J09SSeqX8nt7upF+XWRlgYUFUWYyfqAol0x1Go9Z
         LAthtOwGPUMPlaZ07g8ZzdhFqobdDQczFZz+N4+oOOdntuCPDymYZfVPcAMDgOJqo6hW
         CMZbixOsOsMnmd7+emWhi2dZ77FtPanMDDHzCRMixKDtamAYUtsIwskZYdynLTcNwTFH
         A/8QZX0zugZWvFDAhk0TxDU1HynRnPYJp2irFX9VfF6JT6XfWNisDBOteoKvO9AhQbCP
         cKvxFWjz9rU8bThcDKW67sJPj9Tmko2a4V79glH3NJKVlI//ClJ7FGzWgqzX/mbJEq8Z
         AESQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjKmz4cFkLLn09Li9p/uhKurbEKRjKWxl1R5bn8mKJI2+3dnzqn5+FnRiJ+SlugGhba3wVEIzwUt5sfOZY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn+EGuXFBRjdbI4CSYp82Qu9okEU/LMDBjnfzGtfqaA9IcnPVt
	8QBZ9gOFlajHftb8oEk8ZhZK6W7D3Lte9qesArUuRa2qFVKSoayGLNh2ERWUKHcD7lCUpr+93cG
	DfX3znLTwtPrC8jHImnTuA6YMjT+K1teIqMLn1A4QWwa/oAvlN4iSUorIGenlXVArRnxJ
X-Gm-Gg: ATEYQzzTwCnHay6Rmp12D8ThLQgja2jP8HqzAA/oLzgMzONheMlTxLqdnvS5DWFN7fm
	rVM5FL2mKyDCHBD5gd9CEFlgKDBHFnc0BihK/iZ6FA5ey0A9JJCNjCckjVrhzqd7otpWj2359zA
	sWUtfc9gW/VZhHmjb9FvfbInRD4g5qtiPE9ShvVQwSQlMRdsBk+SgfxEum6/Ab4UkHVII0x0cug
	/xdQkWjOlWG8j51Ij6YQAGd/yNERSFAQzFyMwPyIQMqrIYZnFjJv5+kTG+lJOWJjHWRnQvVipxN
	FowhzjZXVuZmBKGm8QvMPsd9tFLl7HRjh0z1Nbk+Y7bX6zwH/cx0tDNcxbFjD/YBMQJnreyO1VM
	SQcKf3VhdZUAaBZmh5VCh/iG83kdLn7lNAE2XehwQvvuny66ahA==
X-Received: by 2002:a05:6a20:394a:b0:398:7949:38fb with SMTP id adf61e73a8af0-39879494e67mr8280838637.54.1773114807606;
        Mon, 09 Mar 2026 20:53:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:394a:b0:398:7949:38fb with SMTP id adf61e73a8af0-39879494e67mr8280804637.54.1773114807109;
        Mon, 09 Mar 2026 20:53:27 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e184f92sm11379844a12.28.2026.03.09.20.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 20:53:26 -0700 (PDT)
Message-ID: <12855948-936f-4762-aff2-1777bcaa5638@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 09:23:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing CX
 power domain and required opp
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v1-1-f682c82f116f@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v1-1-f682c82f116f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af95b8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=g3FZPDIDENTUAh6yQDIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyOCBTYWx0ZWRfXxy4XCiMUFFF4
 mxcUZ3UR65YQs8NfrbhHxzshMLW05RIfvw4pZmjvvSC5HU8RWznfylBZfifhk2khYeiuG+Mg8kD
 7f2FB1Ui5rkByxOAhu8VX0ZaL2SpkhzLsloytI5wZt0pTrWp+peayZAb7VytbIgboQKzmpj7QfD
 HzK5ew8kufkoB0aWpY1Ar7WDWraXxhwEUl2x9i9zItXXMATy7gY3mnlnw3Fk9wSM3y5RcNBoOI4
 v09MJa8AIsnA8+17FA9xH18KtAp91sHEw2VliXb1V0l3bm8PG4UpiSDqWLCgMCIg1cohipyYBGV
 XBSzki64YRBM3nhOG6pZUCqShjHpph3nQkjs8UUqREllupHZkM9w2oQ0fQ2cimjUuWh1gOPS9Al
 uGhFCcQg/tJ4OFlPxaiM+1nV315QO2Jt5idfkdU2YEn9/+039IhlFmxrCiWbJ4923309E25N+mg
 GotW2nkUzvPJkzhVo7Q==
X-Proofpoint-GUID: 1J1OqVb8m0USO5gr_K4cI7hftMX0FaKo
X-Proofpoint-ORIG-GUID: 1J1OqVb8m0USO5gr_K4cI7hftMX0FaKo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100028
X-Rspamd-Queue-Id: 1F96F2450FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-96475-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.1.134.160:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/9/2026 3:36 PM, Abel Vesa wrote:
> It has been concluded off-list that the Global Clock Controller needs to
> scale the RPMh CX power domain, otherwise some of the subsystems might
> crash or be unstable. So adding the RPMh CX power domain to the clock
> controller which will result in all GDSCs being parented by CX. This way,
> the vote from the consumers of each GDSC will trickle all the way to CX.
> 

Are the consumers not taking care to vote on clocks to take care?
GDSCs from design of hardware, never requires a vote to operate. It is
the clocks which has a voltage requirements.

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
> +      required-opps = <&rpmhpd_opp_nom>;
>        #clock-cells = <1>;
>        #reset-cells = <1>;
>        #power-domain-cells = <1>;
> 

-- 
Thanks,
Taniya Das


