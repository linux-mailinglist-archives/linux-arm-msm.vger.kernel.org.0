Return-Path: <linux-arm-msm+bounces-96059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEd2IWmPrWnH4QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:02:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE2E230D18
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88205300EAB1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 15:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299B6238C1A;
	Sun,  8 Mar 2026 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+aD/xbb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W01um0OO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E241E19A2A3
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772982119; cv=none; b=murBxDKQTvV20AJgYf32KU9n+sh7XF/T9vz+6e2eV7c3u5tVv4QtS4oee2Sw9xXPbvZVy+IKXasuOlMhN0EGglf/rBaF1BVs4d5FZPz+wwGaP1ktHafj1NYZhB5NvkTN2WE6Yi6tB+ZZVxS+URGcz3tja142Cp35ostpd+M4LXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772982119; c=relaxed/simple;
	bh=CsAcqgZ1zLO44aTm6JqflT0W6rXcO3EjX/0HQ5Q8Xw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZy/jXGifdUgN62UCadXwoW4CLxd32GAmLbmUnoRP9AgKnwpLaTwF9bsYGY9Kwaauh24nh8grfPfPuQ6oNW0v73tbU4WnmyVZ+GachCN79dA/c7WspGLpdmRfbgBiUHdokLid5UUIt7IzjX4QKyhGg0p2MMyAefjv8pIvbizPmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+aD/xbb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W01um0OO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628Bbma92108105
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 15:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BwabE/ZDUGVLXR5B0ijRMwfR
	m6xlXcpiu0L9ARNRamc=; b=o+aD/xbbiF4bgwIqiKNgkFdNK4W2eGuccsale8Kg
	igvwigaKcX9zTQywkK+vPvTIVd7mycp+/f6uldTYsaOQDwhwNL8MivVT7ZhZQCsz
	gT9+kAGGpknEbKiDz2EQn+ujTEQ6/U9i/rAvZyPn3ou7wD7hOQyZvjWVD6/ielPz
	qn3ObNUl08WmqGYF6qvlx4gqjSaD3Q/i9pzptxXs0W4ofL9oouFbd7pLA4ntTaqR
	6i/ypu4AngKIX39/D1MT58Eo8AiN0lZo9NiJS63QhqajfFaxmwL8idW2ugjcE2qA
	pUCHsrKJ3yR3cpzSNB5EO7gC5bzFTPh/321VgKzQnn8xsg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8amky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 15:01:57 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56af3b64246so4693388e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 08:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772982116; x=1773586916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BwabE/ZDUGVLXR5B0ijRMwfRm6xlXcpiu0L9ARNRamc=;
        b=W01um0OOHd12jIHhtr0dBLB2cSbsasvDwCKAeEUPeUfL66wDy0WTJsTOjzxRiY7SZ9
         ZWSXviNRIdRt/41HXyA66C05lKDEHAmJHbcdQfr5FNUrM5XXEM3aY0gzyUd9Nv+cX9V5
         lfasCACiJMC8mzDA3pVAvFYt9WxfHUyeHEXJRqdY7Jr7y0WuEFNTSEzZJChyBXibQ5Y+
         PbXpzKfpVMVV1uFBgwqMr/IEJg8kZFLYfQAEnBO3/hctYoW3GGyamNiOmA7elqKnEC2G
         qtfH2bhpxCrpip8NsBolNYovlV+YRP42migYv0ZIhu/vIyp+hPcz2YlO91Thr5G4GelZ
         HLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772982116; x=1773586916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwabE/ZDUGVLXR5B0ijRMwfRm6xlXcpiu0L9ARNRamc=;
        b=NGeACjVfYeJAvMTpjiJ9dbV8+mS7wKYnNofUmSkOATf+f+9oTGCW/pGGorS5js2unJ
         Jj/Lt9gvNuo+VTHCQqHRabJRqvvuUGoH4Me8vLEC+X7K6GfixDW6M3OmS5NLSfmFDpkC
         yB//hF6AAekMlEUTRay0toBQrAnfCRqywb7VeI6NeVmsEUTLCZ0IoyIMjzEDzT2jyZTk
         P4IISmked4S7IHpRt+k8vhJWAEvKSTf0dASLmqgo/SDD3Fzirwu4Ozp/MBqGCljRutyW
         h9hue1VrscpIaLVgWz8F09+l5TWZEAg1SN2+MZs8D91PQgqErj6/0oSe0fGMg1gxDL13
         LqUA==
X-Forwarded-Encrypted: i=1; AJvYcCUjnOZv+exuTCSt5lDLofzwD+sM0vMx80uTgDmRkmZTAlx3nlrk13IUR4/x9ziuaQjbEGaWTBUMXkUI5hOR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9au5HNLYLgd2u12SPDScCAFd7OtfaJClrAausingRPhJ5u8AM
	pjiM4tGhgYefP7XwqaTdtO8dMYyjlviJsyVog3LwVWvnJD3uuYqboLgcW/6a3eekRXwYA6WmBbW
	XiyeLpKsfVoqnDQT4qADMwD/XZa4xgxOFAGe6PbQ/DcQBewh2iA/J9zt5Lb1ubFfTdgs4
X-Gm-Gg: ATEYQzyYKRjSIPe8b87jyji04o+/M1u2DmfEwuCcrVQ25mdIbNjis8FaOWg+KrgWb+1
	QMzEhT/XdtTSqMput8G2Mvz36K8YknA1swtqba9F/17/Mr9PPlnek/vaccibGvl70VVOc1wqHNr
	3WamHpM3ebbJEHKrhqv6DsdzAAcI3CxMH0d1b+PcLll6nKbYmzmsESb4hGtO818zvuanKZKaZkD
	AwBFOfYj2iJuVRF45nXs4ruQXKR83PEhwKCbuWuppiXj8kILIWs+DLB/Bhv/dCEacb/IpdMvQRQ
	XTqse78lr3WnTejyK4xMj3eYGdM6SyCVrU/ExkkfLZtwQsw6QxJWz96c7mYB6NneMniPm1QKYnW
	BqjVjyTo8VgJzP6UCvA/Nd+wKEIdDMiIzG6c2MWcLdNhhmj0gKPPvUXVT4vZ0FIYtca/9LodA1n
	fuYIwtVvJdtuZb4Tgd6v8Ow3RFOLTud9VhzL0=
X-Received: by 2002:a05:6122:4f87:b0:56a:eb30:4e77 with SMTP id 71dfb90a1353d-56b07f721c3mr3178734e0c.19.1772982116331;
        Sun, 08 Mar 2026 08:01:56 -0700 (PDT)
X-Received: by 2002:a05:6122:4f87:b0:56a:eb30:4e77 with SMTP id 71dfb90a1353d-56b07f721c3mr3178693e0c.19.1772982115811;
        Sun, 08 Mar 2026 08:01:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d033ab4sm1503815e87.33.2026.03.08.08.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 08:01:53 -0700 (PDT)
Date: Sun, 8 Mar 2026 17:01:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Message-ID: <ne3i5tmvperssm4pivae7jhmqzvyy7ftkwnacpaf4ukdqojtha@53mhrxlraw3k>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com>
X-Proofpoint-ORIG-GUID: RUo0kHUqTFgnrIWdWk2ZFH8BQdNnMfay
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzOCBTYWx0ZWRfX4r57LBXEamN6
 b4gvnxYL9VTc8CZwXC6XR+cRakRfhrRhYvXGpFrdcaLR/Az5KsKen5gEdulc4k20u61f41l5WZh
 o6aOqQgS2OAi2XUZ3KOep8lnF1LPp1/I3XdyamyLyndhixWbqqDks11j+457tDhp4S2PfVRJWEv
 wdHwAZu/8g6YdGwZ9GvHPSEl34u3yvzQkdu+s9/DYYkt36X+O60h0xuRRYTqN6Bm3RBxIzRikUo
 Z8MINOSC52H34nEW3pJEvazthzTpViPA87rT2sByjWXGr7i/VKBA7uEMhfUnj5edDbLkQP+eVV4
 H7WNU6cGcHMLTvu2FxqItpFTPe7mVPmQrE2VLH7FWbrS4bJ7tB28vugBZFtMHjzItoIxfj+5r0k
 JcnbFvTilkS6x4DELo861sc3dv1VKWZr1NYOgiHZq1X8N6SUnJ5SPgyViM4myHmhxn7iuGwhQ6H
 U7wHsHtdhNAnfPxUOCg==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ad8f65 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=sfOm8-O8AAAA:8
 a=QiVCaVSgwpAuPVqWOeAA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: RUo0kHUqTFgnrIWdWk2ZFH8BQdNnMfay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080138
X-Rspamd-Queue-Id: CFE2E230D18
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-96059-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,protonmail.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 04:52:43PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add the description for the display panel found on this phone.
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&pm8953_s3>;
> +	vddio-supply = <&pm8953_l6>;
> +
> +	pinctrl-0 = <&mdss_default>;
> +	pinctrl-1 = <&mdss_sleep>;
> +	pinctrl-names = "default", "sleep";

It might be better to move pinctrl nodes to the panel device, because
they control the panel reset pin (rather than some kind if DSI-related
pin).

Other than that LGTM.

> +
> +	status = "okay";
> +
> +	panel: panel@0 {
> +		compatible = "novatek,nt35532";
> +		reg = <0>;
> +
> +		backlight = <&pmi8950_wled>;
> +		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> +		vsp-supply = <&lab>;
> +		vsn-supply = <&ibb>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry

