Return-Path: <linux-arm-msm+bounces-91277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KSrIQmNfGnyNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:50:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D64A7B988C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80D1C300B13F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245D0353ED3;
	Fri, 30 Jan 2026 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0Xo3T1p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ai+gK9pU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EDC2E62DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769770247; cv=none; b=Y0EeU1ECji0iMbjfQnLyqw8aTfquFaNpn8UUa48TASG64hQJPpplurbkN34/Ao8NQvBcQM3BwZtiBvhh1xJbBq4uGuXFqQg1tFqYa7L1dq3pj75ZzxrTWDCho3KeX1vasogFs4M5FRhvZb6idPnCZJFycqaomv+zE28JNs35GUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769770247; c=relaxed/simple;
	bh=g2SP34zbnE5SUp0dBfi9SI+eM2uNK5Mpq9WSEXJHnTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5wC2q7avM80cC4/8GQJXvG/vGVfcoR55PE7C/QKi/BJQcy+jMZiFVAqL967a8nxJp6x2CkXF/k3e27NDBvXmar1GjG8S1SrgciE1Wg+srzXQiCucvTip2vZTOvbdcNgaDHCyt9RLciJrfPvKNQqbxb2xAhLypO1uT7YnWHE47w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0Xo3T1p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ai+gK9pU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAlcIO2992837
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6K2nIO2HcxFSQAQK7Ypw5vh3
	ZYfv/aSlo06WGZswp/U=; b=R0Xo3T1pNB0X6kqe1bf+tKNsdUIT3c2fkbcHlt/E
	3gAU1S3YUGKa4J6l90E+h/G4K0TmY+E47Arjuf7eZ+r4IUW5pOJp/mq/fEZ3/IKy
	x3XpcuCM+TziCFfJRHpbZm09BJqw540/20aKMbgdmrneKEtHZmU/LZO5WVZOSqyE
	PgJ9L0U7yYjtjLHOqyq1TvM+zdXANayW4xB4XDeX8W+jTMWETD0No+EsBVTjdPEh
	DI9IltX0Qfdg8wc+jeX52pjvVJeO+G9F6HfkO1ZMlUl5Wz0fY1cmDCPlDA/nhndG
	4IFQIS5gR0ebHK0Jod5x4CFDGCbNryGioorTPGLU7GaQXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0db1jgwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:50:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a289856eso832131985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769770244; x=1770375044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6K2nIO2HcxFSQAQK7Ypw5vh3ZYfv/aSlo06WGZswp/U=;
        b=Ai+gK9pUw+Hn8rxN8BPUU2csyjF+DriuWr1j849t9QmZKu8Vke4GvDU59edcxq0VqE
         guQWCYsN6epeOS1EBr5qb89GJYO/jytR2Vk/dxU8K5lFIGCUzuLEJSQ1eZFv/uOrMAVb
         BUO6V2sPFSuXZzEZNSxe84I3i2LqESKKYUKiCq5SJ+a+UwcBL71Cz+P4mf37GEBZCk8/
         pBWiVOIFpqwrC4hIhcJ9jj363WAKC2XXn1wZ+pddBHEONJCVak+k7evpBl5AJTg+oZmq
         F5SeyyVhvWI3SnygLBe/q+3d34QPF/ievOZSs3CPMBXEC2cqMh2y4NETwlieSxPGgzwP
         p1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769770244; x=1770375044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6K2nIO2HcxFSQAQK7Ypw5vh3ZYfv/aSlo06WGZswp/U=;
        b=YHxz4ZS6P9SqBAlSlhwitWN+1Zcc2/6XW4y9fb3feloDlV00LhDI3Yr/VKaYbVQvqy
         X+xcN0AYZRMJd/gVevAfpDoOYwPh5XPsuRXsm5iySROfJCk47JnKV7rzwqYSZKaLJebI
         oC6TG2uAaWWy2K+BSKXiqafV77InIwTKmJ624YoM4eXoRHY4AoGFtnIoebFaEKyh5zYx
         Zcm/c11hKjQT+vv9B0stfL1CQ9pwiGLdPhTJrLEaqQjhQ4ermR/VD5aUGtAyiT0fbo3t
         JQ32QRVJFDoznAXEa036bPpOQ3jN9QPuUZ76drLbnzSk0Bf+lJQAw3eb3OrklZ6VsBbY
         y2ng==
X-Forwarded-Encrypted: i=1; AJvYcCUOSoBPQt9pQ55u7meGDy3SMNt4q3qchGZ/3qde1ljB8PHCGDB9+AGc7G9jaabLNz7p1OIYYs5cnqcrGgTe@vger.kernel.org
X-Gm-Message-State: AOJu0Yywo5KC9vLUYKIc9Ny5oRGnqanqzrE1rpJYO8hVMVkG25XPYS3K
	rnara9zl22YoNuTYpyAVIKR5KBji9QgND2ktTxMTZBtr+C4XjVaWxNPXV46pyaV4FB0AOdw13Xm
	b8TsWDF51AOqcCWqO3oVDdYKPq11AZ+TkHYgD5xBXfsWr3Felz1cDORJfIH6IT1ZOnRaf
X-Gm-Gg: AZuq6aJXQUlOhsOJ9R+UszDLAofhZs7qX3ZlkJzdOPXVcMeQIAZ3egWjYgHykKHCvGq
	wJT96bvuWu0G5E411wiz56wKAo38zLd6743oAWAcLxTKNjIApAuYFNNlMDIfQnWwnHbGY9tQRzy
	7Tq01g2QK5JfzFVLShu8c0hL990KFMxMZ2Y9HRRYtoeM92qEJABfdoQpge2aVBFUePNYe6NFEZh
	B7ZXbw++lN947HnYbahL7T8nZ2xUAWp6qHeDH6svRELChJdsHciJL7jc9b8wpIEYjUT3XvfegYk
	VhBt5pCb/3cIhMhWH5FK/Z2WvnLUx+hNyy1GSwr0PVCEiNh201D8PRj/IDaS/PQzGVO1QvmuxXu
	SP2GYw2xFvAf4nifdIkQq6u2zwfaW+PAbSVAWVsQGy5i5jh3NewYvWXgW2pQdhcsyIOwwgGFS09
	a/ZpJqvFQoYyai6w94Ww+IjUs=
X-Received: by 2002:a05:620a:45a4:b0:8c6:c983:dddb with SMTP id af79cd13be357-8c728723528mr712905085a.0.1769770244094;
        Fri, 30 Jan 2026 02:50:44 -0800 (PST)
X-Received: by 2002:a05:620a:45a4:b0:8c6:c983:dddb with SMTP id af79cd13be357-8c728723528mr712902685a.0.1769770243622;
        Fri, 30 Jan 2026 02:50:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625f8a5f2sm15449471fa.33.2026.01.30.02.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:50:43 -0800 (PST)
Date: Fri, 30 Jan 2026 12:50:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Enable lvds panel-DV215FHM-R01
 for rb3gen2 industrial mezzanine
Message-ID: <y65lkhfdl7omall7mo23llaeedsith5ujzgdkyjwej46zlbpkh@u5jaaphiaexi>
References: <20260130-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v2-0-a98714fa1531@oss.qualcomm.com>
 <20260130-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v2-1-a98714fa1531@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v2-1-a98714fa1531@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3q6R2DzWbWJQYMUCYc8PCOJq0oxcJTmp
X-Proofpoint-GUID: 3q6R2DzWbWJQYMUCYc8PCOJq0oxcJTmp
X-Authority-Analysis: v=2.4 cv=VMTQXtPX c=1 sm=1 tr=0 ts=697c8d05 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=O5SRHumhz1pJrrEzSA8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfX+a9MhmC1LbXv
 f17gw+jBx386mqak7A8dB+ppTwfD8yc4g0aK7g6Prvd26BIJA7an3MUStOdazT0ttJvuRL9oC0C
 O+atRXz0LrDhT6W/e5s50lLwryDjj/S4p4dvOnyXoFFr3hs2zBGmO51EemxWtVnaVmaUhP9nxgw
 DeDE5Pv98ESKUnKzvK3SCh0JIAHoM1gAfJbHM2PzXa+No3/vealSovHsxjL90k0Pfrx2J9UsZB8
 RPe513x7c4BqraIhYijQndRdI6TaQ4jgoCnBCkckJUAcNNNprWbQjYixS9LaSuO42bfSSiktN/e
 4BMyFjJjmeJuDiiVVqvn0kxK0mbHRjZ4+0Mg09rxyv8F4jjW0xKOqtvyXpxyy9LLBO7qFIi38If
 GChBrtV/CMgs0JUmdwxAg27ispMNP7WQgZ3qZs26vJScmkyMPQfYOdPOnkC0FSvBv8CuEUWJSVx
 GXKIU0zgHr9iS2tTbbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91277-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,0.0.0.2:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.29:email,0.0.0.1:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D64A7B988C
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 03:57:25PM +0530, Gopi Botlagunta wrote:
> Below is the routing diagram of dsi lanes from qcs6490 soc to
> mezzanine.
> 
> DSI0 --> SW1403.4 --> LT9611uxc --> hdmi port
>                  |
>                   --> SW2700.1 --> dsi connector
>                               |
>                                --> LT9211c --> LVDS connector
> 
> Disable hdmi connector for industrial mezzanine and enable
> LT9211c bridge and lvds panel node.
> LT9211c is powered by default with reset gpio connected to 117.
> 
> Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>

Your SoB should be the last one.

> Co-developed-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> ---
>  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 106 +++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> index 619a42b5ef48..cc8ee1643167 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> @@ -8,6 +8,112 @@
>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  
> +/ {
> +
> +	hdmi-connector {
> +		status = "disabled";
> +	};
> +
> +	panel_lvds: panel-lvds@0 {
> +		compatible = "panel-lvds";

This doesn't match bindings. I think it was pointed out for the previous
revision.

> +		data-mapping = "vesa-24";
> +		width-mm = <476>;
> +		height-mm = <268>;
> +
> +		status = "okay";
> +
> +		panel-timing {
> +			clock-frequency = <148500000>;
> +			hactive = <1920>;
> +			vactive = <1080>;
> +			hfront-porch = <88>;
> +			hback-porch = <148>;
> +			hsync-len = <44>;
> +			vfront-porch = <4>;
> +			vback-porch = <36>;
> +			vsync-len = <5>;
> +			de-active = <1>;
> +		};
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				dual-lvds-odd-pixels;
> +				panel_in_lvds_odd: endpoint {
> +					remote-endpoint = <&lt9211c_out_odd>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				dual-lvds-even-pixels;
> +				panel_in_lvds_even: endpoint {
> +					remote-endpoint = <&lt9211c_out_even>;
> +				};
> +
> +			};
> +		};
> +	};
> +
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	lvds_bridge: lvds-bridge@29 {
> +		compatible = "lontium,lt9211c";
> +		reg = <0x29>;
> +		reset-gpios = <&tlmm 117 1>;

GPIO_ACTIVE_LOW

pinctrl?

> +
> +		status = "okay";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9211c_in: endpoint {
> +					data-lanes = <0 1 2 3>;
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9211c_out_odd: endpoint {
> +					remote-endpoint = <&panel_in_lvds_odd>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +
> +				lt9211c_out_even: endpoint {
> +					remote-endpoint = <&panel_in_lvds_even>;
> +				};
> +			};
> +		};
> +	};
> +
> +
> +};
> +
> +&lt9611_codec {
> +	status = "disabled";
> +};

Can't industrial mezz be used without the LVDS panel?
You need to create overlay for this one, adding the panel (properly
described, read the bindings) and disabling HDMI / lt9611uxc.

> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&lt9211c_in>;
> +};
> +
>  &spi11 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

