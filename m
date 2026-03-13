Return-Path: <linux-arm-msm+bounces-97583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJqPCAA7tGk4jQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:27:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C01EB286FEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDF0C306249D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1A83A256A;
	Fri, 13 Mar 2026 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jy3sPAiC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="btevF08+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DD239B96B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419015; cv=none; b=R/mP6GKGyGY++Hyn/zq2iw7359XOLz/jLoGwmfsk2+51I6bFnI7Ca4dKiKi5Lhr6EGiF2rGW+I8BNedf9fbDZr/Pcu3Uuqzdbvzz4dX5Z0IbfzEFfb3o4ulcgJZiqmOMgZQ2hTyK0/23lkr6o1FPi/nNaZtEOV3IvlgFZ+uEhXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419015; c=relaxed/simple;
	bh=tHbcA0byu4Y8ZDGc88V2vxlZ2JIf5T/Ft1pA6qUaujo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q46ijArzrQ2Z7SUJRl960h/Pk3VdMG2jswsxqwdV5y8cxrks3uAEXBh9fV1qVOTiBqjO/vNXs5CFo7bRPzLcStA9//iJ6xSdQFS8+pe0/DnIaH1PJFzHnpRewNCDFM6dsXPvwPlLwgLOWte5XyagmtMg/pBSOvJT0xCLpAf0m8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jy3sPAiC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=btevF08+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DFXOeN437911
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RiOQjyp/BmFXVNg4p7wTJxHnEmuU0vEYGOEkg9dtv3Q=; b=jy3sPAiCmNubecU9
	N0Wn9/88GrssM/d6B9HmWrxnjI+leHxHMUBdBlhrCkHw01ZYon5u1NWkewLd07sP
	4cWTFCVajprXmwRTbzl43Bc+kcKME7XcehmbTTJvznfnBppSWYkSgwfBnbImk2E9
	IW78wId2OPUOUBE0c62i+2aoIlVWvBKwajP3TpF/Ol3YOUexAmhpJgXWr0tTlang
	FGlv6wlypM66WHxUBSYzwkCzTDC2gIt50B9YqCW3aDMAfpC7bjk/Ac2HOx9f+3bu
	hMzQ7KInu7NhSOtrx+mmkobU+XpkPTXXYrUaqanHcrNA6sAy2wdYJhST0DnLnFqz
	rRfQcw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvnax85pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:23:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7774be64so1318598085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773419012; x=1774023812; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RiOQjyp/BmFXVNg4p7wTJxHnEmuU0vEYGOEkg9dtv3Q=;
        b=btevF08+xcNG3I/gqZzM1J97NLLgTiw9T8C7kVD4Nk3aC5XvLF7nz7HHUkR+in3eOX
         UpPw+y9PdoyZGvmS8cmgPRa2RiD6nDuF1nF/K3Qo7aPbk2zuR2m5ue8q40QH/WPbbeoC
         4GdG4/U0aYbbFPyq8MIuw+oDuhwc6l4mwOnqsd1noTTfvitHh2y/ejczS/nMftccJIZY
         VW3owJiGpB429O225s5X+0+G4xXId+twg0BPvEv/dAXQIesC1YF4pbbDIaFlYu/Qmuns
         bevRBbvKAlzpmlNauNPKyg6xfVd7NvosXzGbOpL8lBeCgV0ewjIWTBYNDqzOnl3vOpND
         S6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773419012; x=1774023812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RiOQjyp/BmFXVNg4p7wTJxHnEmuU0vEYGOEkg9dtv3Q=;
        b=a2UTFO4rmiTHp+D4T9PfrwWrW+Syjp/CF/HM0FRBiR2os9eOMb0mlORKqclz03B21R
         awwIfvUrq7vQLHMPYRVa5eANBxYI/DnXsTxZEG+WXpPHz1tlSIEVp8eprHR0Ju4lzthv
         CVAwVJrt4dc4/WoI3WPYy1ETwTlRW1mYIZkiPJ+4zc72bwfWu9+ajIBBcbV8VyKRDdnQ
         J2gf4u5+jNebkmy84bXcLmPVN7jzEbXUcW90yD7HlGQZT1WWp+cOp+wJxGsP/qisNmr8
         5UVQD01yks7dXtLCR+1XRlfpAiaNmtzWMv83FoJu+ygpDtPIDGLr1eZxr1lW4/ti0hB6
         selw==
X-Forwarded-Encrypted: i=1; AJvYcCUyCMof2fG1Ywo7bOf2zU2f/0CQUnfcdqVEBzD/9QkIct5K9hc2H/ZC2k3+KZuwaTW9hhvSGXTFyv9dVuRh@vger.kernel.org
X-Gm-Message-State: AOJu0YyF1LFBQ6+6QJQvGUD5lbVL3y1jk53sQ095wVsgICMz+VQKxopZ
	RylNjjZLT7jW+mavc3W67Umyjjjcux+rSZwjd9eKjU7n5J1PYZoeN/pEKkynBgWKs/RUaEUlomP
	jpLfiwouJRnMN+iY9FcdTvfi/1hOPWG2p5/KgsTllH7i15+4OjzP+UrrOFpukOO7CqXD8
X-Gm-Gg: ATEYQzwolRJ1ryC5f4Bdvy+kp8YNyW3mGjTepGw+Dtf7hsL6Of4Wpz+mfTvu0srHnx2
	26cHdc6EI2yd7RL0WELM1f4prsQtDV1j9Oqyj33/w8DYtKGW1Ypfpu7lQAXC+sTT2PdbxuyPO4q
	5tsapwRok+fhlP5XQCJJEAFC5NrWDN28Tl2uiCBl7M33RN34NrpGTv/RSPd1KPRaLM7jniFm6XQ
	F4FMHsh3hQ/g62npK/vP+P0XgxTqdSf0Xti3oEJ6UaB2KzkzNFSmpxzemsXDY2fFPIfACNrTy7X
	jGC7EOvPV4qeLiKO7kZGKnEWhJodcxVmB/qevAouzKUoR2XTTvSHMWR0eG0aSbHGf9bhkFbZ2u6
	/wadzLnAW8hjzY+OZJHaEvCCeuPJSwcXXbHUToEr0Z2kaRR4D9I1ifmM+2Pe/xR1Z4XD9w76w+u
	9q2gMgmdYvmdd3Bg8L7o+FYuOTBwdXMxDg/gI=
X-Received: by 2002:a05:620a:4482:b0:8cd:97a7:a334 with SMTP id af79cd13be357-8cdb5a17627mr538294785a.4.1773419012253;
        Fri, 13 Mar 2026 09:23:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4482:b0:8cd:97a7:a334 with SMTP id af79cd13be357-8cdb5a17627mr538290485a.4.1773419011740;
        Fri, 13 Mar 2026 09:23:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a74sm1632878e87.75.2026.03.13.09.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:23:30 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:23:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        r.mereu@arduino.cc, m.facchin@arduino.cc, geert+renesas@glider.be,
        arnd@arndb.de, ebiggers@kernel.org, michal.simek@amd.com,
        luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add Arduino Monza (VENTUNO Q)
 board support
Message-ID: <exq6gd3hxf32frza57636a32asftp22ufledjo7qq5wow3lvym@2kyhucp5mqxq>
References: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260313103824.2634519-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313103824.2634519-7-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: zv9mUf-psytfkjufUh9bRrFyKLbin4Ze
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzMSBTYWx0ZWRfX1Xos8NB3Tmdo
 d2mAtehSGcI9RSHIdQ3FSxJtPTonBNg63tloTn/4uVouOFuV1G+zzsEYmFtBKIbnmSd+fdwBEWw
 YW/crkS8FiRUINnCPSCC8fxmfouYV2RIUKCc/Mt5C2Ey2KfJbaf0tocNwKEFs816C5JgH6jiwrh
 8pQ37Z/wpHHLOFTz1vTfhldoGGLJNkXu30tN0uNC57bXvv+pHMF2LYSR8qAapaRXlayBngGQLsG
 D+1Uu72pdxHbqev3d2D2WiImKiXYuA6H8f9w4UpMCBe64FtpLYtMk/ZuZNUqOPtvf2XhH3C2sk7
 PkTaZgIFP9XjARxgslIDUzkIXgo/SV7vjkYBCUCJlXYWPpuc4q5Hp8A9Zqhhf6StX5aBIYrrS0H
 ahnMKg8ecmw0pIeSQgbvAexNWnEoFBtWLYaFEAl9OR9KgakhPeXpWfhcsy7Uy77QHmwvRADdTIm
 NmP1j/xZAYxRR/3hBkg==
X-Authority-Analysis: v=2.4 cv=X5Ff6WTe c=1 sm=1 tr=0 ts=69b43a04 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rta_p3Q9v_S9YyuTENUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zv9mUf-psytfkjufUh9bRrFyKLbin4Ze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130131
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
	TAGGED_FROM(0.00)[bounces-97583-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arduino.cc,glider.be,arndb.de,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,0.52.125.128:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,3c40000:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C01EB286FEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 10:38:21AM +0000, Srinivas Kandagatla wrote:
> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> Add device tree support for the Arduino VENTUNO Q board,
> based on the Qualcomm QCS8300 (Monaco) SoC.
> 
> The board features a Qualcomm Monza SoM and integrates various
> peripherals, including:
> - USB Type‑C connector with dual‑role support
> - ADV7535 DSI‑to‑HDMI bridge
> - MAX98091 audio codec
> - 2.5G Ethernet PHY (HSGMII)
> - PCIe0 (to onboard WiFi chipset and USB bridge)
> - PCIe1 (to M2/nvme)
> - Button (via GPIO‑keys)
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 466 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/monaco.dtsi          |  55 +++
>  3 files changed, 522 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 53cbc08d4df4..837adf569485 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2885,6 +2885,61 @@ lpass_tlmm: pinctrl@3440000 {

NIt: this might have better be squashed into the patch adding LPI TLMM.

Nevertheless,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



>  			gpio-controller;
>  			#gpio-cells = <2>;
>  			gpio-ranges = <&lpass_tlmm 0 0 23>;
> +
> +			quad_mclk_active: quad-mclk-state {
> +				clk-pins {
> +					pins = "gpio5";
> +					function = "ext_mclk1_c";
> +					drive-strength = <8>;
> +					bias-disable;
> +				};
> +			};
> +
> +			quad_mi2s_active: quad-active-state {
> +				data-pins {
> +					pins = "gpio2", "gpio3";
> +					function = "qua_mi2s_data";
> +					drive-strength = <8>;
> +					bias-disable;
> +				};
> +
> +				sclk-pins {
> +					pins = "gpio0";
> +					function = "qua_mi2s_sclk";
> +					drive-strength = <8>;
> +					bias-disable;
> +				};
> +
> +				ws-pins {
> +					pins = "gpio1";
> +					function = "qua_mi2s_ws";
> +					drive-strength = <8>;
> +					bias-disable;
> +				};
> +			};
> +
> +			lpi_i2s4_active: lpi_i2s4-active-state {
> +				data0-pins {
> +					pins = "gpio17";
> +					function = "i2s4_data";
> +					drive-strength = <8>;
> +					bias-disable;
> +				};
> +
> +				clk-pins {
> +					pins = "gpio12";
> +					function = "i2s4_clk";
> +					drive-strength = <8>;
> +					bias-disable;
> +				};
> +
> +				ws-pins {
> +					pins = "gpio13";
> +					function = "i2s4_ws";
> +					drive-strength = <8>;
> +					bias-disable;
> +				};
> +			};
>  		};
>  
>  		lpass_ag_noc: interconnect@3c40000 {
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

