Return-Path: <linux-arm-msm+bounces-92354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEmjLs9BimmwIwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 21:21:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD82F11463B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 21:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B824E301AF65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 20:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CEE33372A;
	Mon,  9 Feb 2026 20:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+wisYFs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MPUichLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7447334C20
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 20:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770668464; cv=none; b=bukYCMf3QPj9gRctPVORlS2/tX6qrkDHU0INODu8COdrsR205+mSi1UDN0l4RMiYfH6dmhe7Vyv09ONTWwOOkG3bLqrO2BtKEk4eQLIo5kwVx3u7reLWTGLblcFWkXoe7RL6ErN3cphjsvDjzbOJHfKmVAlUG22+8gMEpTl8ylk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770668464; c=relaxed/simple;
	bh=uTylKSae4rEKd14vAPu6TmGF8N7Z+T5aujgHwVsdlKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBf5Ei69dk3RGJyMX2EA5bsIStW+NJYy4++d/KqZi/8NGrU/BHUlaOOw1w0a7TAy5wB4pdNaNZjW/vHzQLO/7u8QKgwak4tXmytbGtKF3Wt4KWos5J8tFn3cYMiNqbjjfSGUD8d2qzBoawm32X7PNuFPLYmxPstt1qQdu2KKM/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+wisYFs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPUichLT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619I75k73454422
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 20:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x2WxRI+UoUwsJdF1vuJUF3Qt
	vcNuAogQYm1wTOMdTD8=; b=U+wisYFsLTYdKYkLM4XfUxQynBCAVFl8RS2fbcoY
	mrkVfmRbsjFMj5asAIlPM+KzXN4ij+tBUCeOnOXuI//RPZ2pCMp3gg2vaGk6Qt+M
	YdsndLK/b4yx9dLTueRhmbW1o/tdScGBq6GjTbqakSg6i+xeZVq3FAs3PTDByHaO
	tte9ci5ziv/YClsjWddlKHREmD1nGAwmAd6kvG4MVqlpu0/RfDV14WWipQ/RAjCh
	rJ96yTkSyXflfYwXXmZRDemGaC2a8EpiW0jenkddT/9nHG6HEJe5MhiNrN7d+YCd
	wvPB6UBd/DsGoHhz64d0FGzKJzJv8mWQwYUN6Yt3oGFhZw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e7g9s27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 20:20:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52f07fbd0so1435952885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 12:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770668459; x=1771273259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x2WxRI+UoUwsJdF1vuJUF3QtvcNuAogQYm1wTOMdTD8=;
        b=MPUichLTIwFZBz0g/VYtC7/aE8U7uRnTSxkmkRIbPqe03QO87Yzn2Da8KsJeazSJyH
         gX4nzcEusLJhx6E+uLfV+YUCZauG1J/rxq1BDo1+k1DtE1aCJ1DY8Dxike0UuByBy02H
         t4bomlRaWSBfNgceRsXhpGG+PLOJZ7aBfeT0eG3CG+1Pea77eai5fDWellZOI5xYMazP
         vuJeMA1CSGaSXwzFblPgE27oKvBlzIqOj7lnVRujfaMrs2d7j/FHOrJ+B6WTC/z18O9Q
         hxLWVcsgU5Lr5s5JU6GVOc6BrQ1YYEr3SOW42ib+hXwZ99TZw7BIL3F0D2YgreZPLXtA
         iTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770668459; x=1771273259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2WxRI+UoUwsJdF1vuJUF3QtvcNuAogQYm1wTOMdTD8=;
        b=rBG0Kn0jsOPAtDCQw+cst+rcU8/h9Z6ewBc+ewRw1ImutAPMSl7NQoSztKMaMuCU2k
         rRMabEVTMiPWDCvLo3gY+hwaufGqLUQn40FdCCqNTypxcTEsJBcjfvO0WtzHe/DW2m3D
         TNpYUA2KJp17qwL4Jjl/v9iNn0sckILXLds6Spt42C0eer1RSitmf4RO5mK0B1narvnU
         Grz2Ay1K8sE+wZBNH3WIL+ObjdqK9sciJtNVwI6pX7tiaqGOdvbC/Jm/lrNHmSkD/fv9
         /W82IdqgqSCwa+qs9svPJiEXevewv0CjdNbkZUkh2w92ikbfTauwuCT1gSeP9toOBvKs
         kX5w==
X-Forwarded-Encrypted: i=1; AJvYcCXhI0tr0ZXrdmtYXrDJHkUd4BOtmM4xVcrMjy3l5e+C9GBJETwgYMM7kPiecHCve2VxDMaQHfTbFdN84WBS@vger.kernel.org
X-Gm-Message-State: AOJu0YykDsG5zTx/q2ftHpZkO5CXRidn+f5rLFNxhbqDN8zmnd5waJEV
	vLyQ7n82HFq9LXzp23zpiro/nKlyCvW5SyTGIeAKcXhKD9xfhOo+Q4ueuZvEreTtwvulEPB7qw+
	TSZgZMlQcC5rxQN9dqrP1A/uHJZtWylvab+Fhsh00+hwakZ0NZEY+Pckm2LIDHeUBXjcW
X-Gm-Gg: AZuq6aJp+8+hCLqWpionKC9kIrNNNpbB4pKiCnbJ5vGZ12J/NExpQkHBUgpBRWC5V+T
	VaKpLlaiQzEDYdf49DuYQlrNsZjB4BrklxU1uFa+cpcdkM2nS6X2S8lcQyy/UmK9i6IaKpek8w1
	Ja+74TI0TwP9SjvlvJsKhCEA6VS09IhNyb0+e1d9bwUQzq2mM9Zwk4NWDYT9uAj6qbDbo9VHxWU
	0owUTg9ereVQJfdA2pKDAKux+1jV8Rcd6YoU8/JkpP74cw37h6gScg7PnFlkB1cVdaoyX9Qf8AA
	93EwMdGJbt3Gejy1pL3rU3BVEtPcfC+wF5N+V0RXtHjKc6suribaMK6BaOAOfvuHS5D2rapvnJI
	TS0LlMFB/mqGy+dTfdTMBTPe4+P6BM2w2spLhmgISm1gFinDrsopFiqdGDt8KBOeO1aSAWnzQj7
	gCVbd7LnTqrsQKOF5EqlsyOII=
X-Received: by 2002:a05:620a:28c6:b0:8c6:bbfa:36af with SMTP id af79cd13be357-8caefebe3f3mr1594683085a.40.1770668458933;
        Mon, 09 Feb 2026 12:20:58 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:8c6:bbfa:36af with SMTP id af79cd13be357-8caefebe3f3mr1594678885a.40.1770668458406;
        Mon, 09 Feb 2026 12:20:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cfcdecsm2855799e87.23.2026.02.09.12.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 12:20:57 -0800 (PST)
Date: Mon, 9 Feb 2026 22:20:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc
Subject: Re: [PATCH 2/4] arm64: dts: qcom: agatti: add LPASS devices
Message-ID: <ews4iqb4wjvrrn4ofqizp4djo5cnzehyxgis6kki2ymf4g6xjc@irnt4rtrvikv>
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260209142428.214428-3-srinivas.kandagatla@oss.qualcomm.com>
 <pybu54sir7vxjlrgfqlplulxgnafyemnpebrf6jl2qeldax6jk@icoefmculftb>
 <da4cbbf3-d558-45f6-9aa4-fcbd5614b653@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da4cbbf3-d558-45f6-9aa4-fcbd5614b653@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: G4fJqjtA0W8XWAY-3MEqVI51PnnNikdO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE3MSBTYWx0ZWRfX+uYieYkRJlPa
 YiZVJonNuPc+fkh9gDozS6b8/Wf0bAmGN3mV9Eb0vUvZtiMd8MJ1CKm+tAwYdG7a2835rmP6QGh
 O+Lft2zUhk7rBzFi5e6ymEpdjsEIsRXaQNwiOUTCk091yAbyu1dK8F4rwCQOl7vqTdrSepGy34x
 UZ4fpZkvJXeKtlh98h9t2zv5BlNn4SJVEGPVrKdt6ZXaMrPti//GL+bA5M1mnE+EwpH0sJS+0Pw
 QwhLkqtZ/EsEBgDYs+dtXftWjcnpow5tik4AZ5v23ykeRH3AR22+IycgNSwlWFQATN1QOFjpcjU
 J3rHkT/kBUxeo3/aUqGQ6KfuD387Qn5rzpp1f0WLv4h5lnFJ7kaQEW0zP/hN/cf9s2wX38HGUDZ
 qmjltyl4eP2nLj8IsezlQA8Rto42NsiU5W9+K0dFjR8kmuBMmOY1Bo1j4jen9yXQU29UWjzSFh4
 SuUohUHo4e8y+q04mNQ==
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=698a41ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=XOZu41oMYFOrro9VgIMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: G4fJqjtA0W8XWAY-3MEqVI51PnnNikdO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090171
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92354-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,a600000:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.21.92.192:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD82F11463B
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 05:12:51PM +0000, Srinivas Kandagatla wrote:
> On 2/9/26 3:28 PM, Dmitry Baryshkov wrote:
> > On Mon, Feb 09, 2026 at 02:24:26PM +0000, Srinivas Kandagatla wrote:
> >> From: Alexey Klimov <alexey.klimov@linaro.org>
> >>
> >> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
> >> controllers are required to support audio playback and
> >> audio capture on sm6115 and its derivatives.
> >>
> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/agatti.dtsi | 189 +++++++++++++++++++++++++++
> >>  1 file changed, 189 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> >> index 76b93b7bd50f..79cd8bb8e02c 100644
> >> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> >> @@ -758,6 +758,42 @@ data-pins {
> >>  					drive-strength = <8>;
> >>  				};
> >>  			};
> >> +
> >> +			lpass_tx_swr_active: lpass-tx-swr-active-state {
> >> +				clk-pins {
> >> +					pins = "gpio0";
> >> +					function = "swr_tx_clk";
> >> +					drive-strength = <10>;
> >> +					slew-rate = <3>;
> >> +					bias-disable;
> >> +				};
> >> +
> >> +				data-pins {
> >> +					pins = "gpio1", "gpio2";
> >> +					function = "swr_tx_data";
> >> +					drive-strength = <10>;
> >> +					slew-rate = <3>;
> >> +					bias-bus-hold;
> >> +				};
> >> +			};
> >> +
> >> +			lpass_rx_swr_active: lpass-rx-swr-active-state {
> >> +				clk-pins {
> >> +					pins = "gpio3";
> >> +					function = "swr_rx_clk";
> >> +					drive-strength = <10>;
> >> +					slew-rate = <3>;
> >> +					bias-disable;
> >> +				};
> >> +
> >> +				data-pins {
> >> +					pins = "gpio4", "gpio5";
> >> +					function = "swr_rx_data";
> >> +					drive-strength = <10>;
> >> +					slew-rate = <3>;
> >> +					bias-bus-hold;
> >> +				};
> >> +			};
> >>  		};
> >>  
> >>  		gcc: clock-controller@1400000 {
> >> @@ -2188,6 +2224,159 @@ glink-edge {
> >>  			};
> >>  		};
> >>  
> >> +		rxmacro: codec@a600000 {
> >> +			compatible = "qcom,sm6115-lpass-rx-macro";
> >> +			reg = <0x0 0xa600000 0x0 0x1000>;
> >> +
> >> +			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK
> >> +				LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> > 
> > Plesae correct the indentation (or just use single line for each entry).
> Checkpatch was not happy with more than 100 chars, which is why I folded
> this out, I will fix the indent in next spin.

Well, the first thing that caught my eye was the LPASS_ being slightly
out (this one is misaligned with the rest of the the lines). So, if you
don't want to over the 100-chars limit, then please consider aligning
past the angle bracket.

-- 
With best wishes
Dmitry

