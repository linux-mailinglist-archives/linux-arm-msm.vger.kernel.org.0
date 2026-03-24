Return-Path: <linux-arm-msm+bounces-99482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JCBFp7mwWkYXwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:19:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DF03006CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B51230C29E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6335C365A0F;
	Tue, 24 Mar 2026 01:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2ud3huv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ModrWPIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4DB34D4FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314866; cv=none; b=BPZtx9VS9L+ukVApRu2r5pdHvrz81Te+DgglxPhfkZArT13P837+i2qHW11kvpUo3qbEnL9h2m6i9NXlStPMGCMHPxuiwnvH7oIBrXEextY9Wk47hHQkUIC+ZEGhIWYDrikIlmlYk7dDNQJ7hWWDDcxXMeLR2gXuN34SU7RKtRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314866; c=relaxed/simple;
	bh=E60p/XLd2wt1Qs3M3BNdbNcsj8EJqIagz23teRTinqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUHhQWLwDqqLoMTcaxLSjQ3tqWXzC7iIQk6n9sN/5f2TkrjekaYr2IWPnhwiDIE/dEUI78SgpZntsywzXWTEpKZFkngcJB7WjBIhDdFS8ku4WsF53vZSU6MvibSE2DjMiIbAxKg1747jXNPCmPCjUWuocHjA8DHC15ItFLgq570=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2ud3huv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ModrWPIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqlBS3634578
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6w7JDMSPr0QCxoch13oi+DSq
	lMSpjj7+yOc3GsWWRgY=; b=P2ud3huvSl7GVvh4IGrwiygacSBSXOC1i36ZuHe+
	4LX0wKauIG0I4wrQDcZEONo17wm66pIK/JkzmnUZyj7O6s8UASqZmGi/TNxZK0Dk
	MLCiCKCIN/hHko9VqBsBFiC7ZJwboFOHBNPcSPMfdXsxP1b3h9iIoI+mLCpR+Fea
	yTEBlzekNrI69zrHviObpPe/CzqNuXZxfwUuH/MHTRPbQ8ozIibeHBC/i0w10Q2r
	xtU8o2qo4JvN96R+GeEqwElNz5vkzF5NAxNVl92WLH+0oHvAIUkTlkSc0G+T0ctE
	+Jsjmw9uN66JtFqUbbKKU+lthFTVt62BuS0eJV6JuA8acA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4jqc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:14:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090e08dcfcso47474511cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774314863; x=1774919663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6w7JDMSPr0QCxoch13oi+DSqlMSpjj7+yOc3GsWWRgY=;
        b=ModrWPIQ+POY3QQisF01jDCReI1iTBXHxtEk1DF9ZRH1J8Uaudne9STKYRV+8fmrGM
         u8o/3Nxsc+09o/mmmaleAUDSMY5RjXfOFQ08Fe7RGd9ktSu00ypOlCKImQpfqRKkt5Cq
         rY1tiG0vqCuxlZFE32LeyIVHMPQourUXnOIMxd+TTD9lGR1lV6FjWTB5Oqssn4q7A7eu
         SaTk03zCTs1afofoqrAbwGz/U7T6vIglD7dVw2TtALFYQ/fnEE/kyBDKHbxJzpub3mKN
         5MzAHIYjRkZPIVZZAN+BmDRSlf13CmTga6czeiTvD11OCNUsJov0lJ+1iM1kx8nyQlZN
         IWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774314863; x=1774919663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6w7JDMSPr0QCxoch13oi+DSqlMSpjj7+yOc3GsWWRgY=;
        b=biz+7Uy5Fpx+tN+/etF+uh5VQ+S2rDZtLJ78VXoAtFanuVk4uCnsqyklrTGf2SRRJI
         priG0Xum+B9sIyJOBxfBWsp5RjN2wEqBx9VXjpJ/GQvXaB0oej/uDWGd00k9nbB1mDVk
         w2WE/4jj+wmj/tzCCogtSkNFTRXK0wJW2Hd2gYUZVGbV60Re1WHBPBhjhHAoDx6mtarR
         W+dpqNxrjouJwv0DiD3xWteMiskq0QE0bR5vO03iVrtdMpqefD92ycVVJMws+VUVVosb
         VWNtFXvYrYu181Pr6e/DnM10vmL9oyiViZEIQp1qsMYhiZy0AGfoHgikoi5gDWmjrZX8
         +syg==
X-Forwarded-Encrypted: i=1; AJvYcCWsYf0xykInSvB58i+S4E330EQ+5Ckj55RGWyBtrur2UB8neMfYifCZtyXnUWnn7GQx7SGn//4y83uS0HNX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7b/DVkn3keqoXTDxJS9r7OLSNrLMMnOgvOEtwwYQx7pSK5XWR
	qsyduJh4onSwo9sDbXT/KNtzhL36UvCP3oGgI8G5t6LcrYGMRsnRJnthgvN5R6ZS/aTfDDipI79
	VcSaGTX7n5dGMU0IUddjZOga/XZwU0UHXR68QDM0DT0UH10WhuW6/8T3IpVXZSzqEp463
X-Gm-Gg: ATEYQzzMw0gImHuAGN6qbLCdkd/1TRUu2Ey+4LVEu4L3SRMp7Tm+Hw3fsxoh8upvHUH
	57JImYJgRdB5Nce1NGAyVz9e/lb5iG2IszNayG9faXAqIL3KJLMqIJQ+jmP/WnzzkqoS4q+riAP
	gbGhUCrNDQ6AlpKciJI1Q5/e9UedIM9F8BhV5x+png0Dhs02DBUjOJ36OMBe0PZL8V4Hi7dibsi
	AfdiTZJIUBzOa8dNdZcPV/0XzVt64BbEkN4YJ2fnyvRrRxaUpce7bIaDEBSuZp6mpAxWh+R6qKD
	ZLCko0Bzr5GM7x5lgpd8kKsvc+p0Tp8ZdxMdrfyIWBxXQstf1TKvk2W74UfjYcUUXj33oDo3BHj
	nios1Ly1ljcEdvgPBlcxMBAkIJvWZc2t2yD3OF/9VlG+MLEEdz/DNPKERbWr1CoVV0AY7EX3RUx
	pxgNDqrOLism6XPNXuS0t/rXEloARjFeZuo1E=
X-Received: by 2002:a05:622a:4c0b:b0:4ed:b2da:966f with SMTP id d75a77b69052e-50b3747c69dmr206683151cf.31.1774314863418;
        Mon, 23 Mar 2026 18:14:23 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0b:b0:4ed:b2da:966f with SMTP id d75a77b69052e-50b3747c69dmr206682871cf.31.1774314862968;
        Mon, 23 Mar 2026 18:14:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207449sm2873618e87.44.2026.03.23.18.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:14:20 -0700 (PDT)
Date: Tue, 24 Mar 2026 03:14:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: kaanapali-qrd: Add PMIC support
Message-ID: <szcplkgjtom73al5aqjdv6xf3ggc4sr6vw5xykygp2xbfwa232@qlv6otc5zb5r>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-3-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-knp-pmic-dt-v1-3-70bc40ea4428@oss.qualcomm.com>
X-Proofpoint-GUID: OHWPvR0r9Tj7Yk1t1sMwhk2p593RTKTF
X-Proofpoint-ORIG-GUID: OHWPvR0r9Tj7Yk1t1sMwhk2p593RTKTF
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c1e570 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qr5xLvqgsvf9f8GRTAsA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwOCBTYWx0ZWRfX1OoYcHnG0Rhs
 CRIt9N2qxwf47MBv2G4P5druUoPlAgWbD1sKjgptp4FcyQ61WW2wEHpd2Nis6fV67eGnoD7g5AC
 749uc75L5ira2ENzlHfGLTzkTlfrxH3/sZdBgbVW9uLRqvGjlZFA/2Eu7JssA7xzwZJU84arcm+
 7z5dp+x5g0TFcYqRoEfX36B6au2N6xcpOCuBglR2pG4pIEDaTFJcOosPIIhsxFiAQLoJr4N/wuO
 WD4SSHSrIq+VOzPUnIZKkKK87rndyXcdzs42/rjiAFoqAyLLZlrqnOqcqQYiiAhJp1ESQBPqFpO
 KnvBcmW2r3LqJjfrKnyqTgx+LrTYIWeas+5fHf29P3dwpEU1gMM7EFUUrF5iAvM907MMfoMHwG8
 KWbfmq2Q0LDDgYl/DAQ109Gn9zbF0EOSCcIVBP9nAMWHMYnfa6Y6IRRNoGgJvRSkXWhuuMHJXWB
 lVckWePZ7R1tdt4wtsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240008
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99482-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1DF03006CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 11:19:43PM -0700, Jingyi Wang wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Include PMIC files used on Kaanapali QRD boards. Add configurations for
> keys (volume up and volume down), RGB LEDs and flash LEDs.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 92 ++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> index 32034eed03eb..da0e8f9091c3 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> @@ -5,9 +5,21 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "kaanapali.dtsi"
>  
> +#include "pm8010-kaanapali.dtsi"     /* SPMI1: SID-12/13   */
> +#include "pmd8028-kaanapali.dtsi"    /* SPMI1: SID-4       */
> +#include "pmh0101.dtsi"              /* SPMI0: SID-1       */
> +#include "pmh0104-kaanapali.dtsi"    /* SPMI1: SID-9       */
> +#include "pmh0110-kaanapali.dtsi"    /* SPMI0: SID-3/5/6/8 */
> +#include "pmih0108-kaanapali.dtsi"   /* SPMI1: SID-7       */
> +#include "pmk8850.dtsi"              /* SPMI0: SID-0       */
> +#include "pmr735d-kaanapali.dtsi"    /* SPMI1: SID-10      */
> +
>  / {
>  	model = "Qualcomm Technologies, Inc. Kaanapali QRD";
>  	compatible = "qcom,kaanapali-qrd", "qcom,kaanapali";
> @@ -52,6 +64,22 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
>  			clock-div = <2>;
>  		};
>  	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_vol_up_default>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};

Again, this is not related to PMICs.

>  };
>  
>  &apps_rsc {

-- 
With best wishes
Dmitry

