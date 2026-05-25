Return-Path: <linux-arm-msm+bounces-109603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C2tBxgWFGo4JgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:27:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B92745C8926
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F40863007C82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A443E5EE3;
	Mon, 25 May 2026 09:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmOJRszz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvEUM4wb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C48B3E5A2C
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701266; cv=none; b=sqvX933lQ7s6/em8/s+YvunR7P6bjMt8iiMFZXptw8xxOn8h0sOmaNJAj/+uRWcotcSQ2487Rc9snKdmixDBM06pjP/kzbyYbK+eydkE3NOpg8Lrb6ZMjfxN/GOgyeMV2HydRRG/5RnxVC5rl0k8o8n5MGLWeMDMzmzOnQhlNfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701266; c=relaxed/simple;
	bh=mb83qbbxTmGxdL5OR5cWgWlR5gSfuaef+L9b3Ihqdd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIS27ldi+iVglHqO/3GPozkXe2UsZIAaJC4XNCE8Y+8D/3wYNKpMvcqbgZJDGkEulSsy6A2+TuSFPlqlxHgKbiJCCTIANseeDAiELbkoSOZl3WuW5HoK0xB0kU5fjirbOmbzYLjhzfBDjbNeXWYO+W8NkObnQpBGPDKHKROnr+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmOJRszz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvEUM4wb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7dwPf1594683
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x2UemusCsMVtYZL72zrXHcNp
	cJp6eLVEC6vKKsQ8QBo=; b=mmOJRszzSuMpo7ZhjzQDWwbvTKpTkIkycy39pmpP
	ipxraPadlmA2unYtt0f33C85tZXcowA5qSXv79/iNfgy0ddZmEp5sdrkHTwvVPiM
	jDMb4hDV1kfVeGyIO7H/txARoku2Xu3WS9lZaZlaeI+atQOlIXrsBYN8LjBaXF7q
	x4yCz5EwOgOkZHhbD+lMipY7Tq86vxK2y0tlXpILRjj0QiCjo6jUg8H5Um2fXZ6P
	mn0rl9f3EXINXE5QDwyE/fAZpwudnDFnuWz0UAHZYEEGNMDe6NAahoBFtkGRFFnt
	ujacOxGq8gYxujTfPrcjRQMqLVy7YLeKEki+WF/QBrVUIQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w5g00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:27:44 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575427e5360so8368377e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701263; x=1780306063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x2UemusCsMVtYZL72zrXHcNpcJp6eLVEC6vKKsQ8QBo=;
        b=gvEUM4wb43wIK0qiMlM0C0417PtzJSiNdFSnUPVUkgGTc0qG6tdNB3/69ilwa+x9o3
         1ciDjkcdGPceLQVDMz3juhZZPmsLEhtGqMxFBHExbLfiLG4nT+lFluV+rZ2I3Z5Eeupf
         D7MdWfC3nTKBwG+5w6YbZAgG7Wb0s+hgFfxNPsDJHoBh9Gie5hIrR2umeZdJw/olN3lG
         OjVDCEPz2rqF+c7jGaNYBKVE1w5XbGj7dp7GgWXsdKhmggrc//O1375k3MlTRV5tQiqv
         DKQAWSYU0z2ETub5dKgfFhGgObLSOJtP/0Ld5Jpv57jTPDRocoFOOZn9koixltXGOTDQ
         +Omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701263; x=1780306063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2UemusCsMVtYZL72zrXHcNpcJp6eLVEC6vKKsQ8QBo=;
        b=mNY71TLPfAU3X2ZRmzdcwdEAydErNIe3la3P/dZ2P9R709uaNMdPK4I4CXD59+185l
         Ay7306hj0VxGa54UIO04VWKgC49W/WkpOS27e/tpqjJ4QNkm1oA6PGwOkYLq0QmKsAMG
         uM4pi6k5XypNzI3K/ZbmXrwX/UWRD3G36GjEX24z7LpPBdjAj2J1fluq8UfMqEGYDNx2
         jXde18CyXFD4fnOuhJvtLT2G7qpA8Z2Tb6yf97L2L1BlUqfb5pCbdRBBy79V+z2nIilk
         VEoWjVLANrQxEfARDgLuDoKnEDvMuTHTnodwrj8Q/bsgAHiO0DLNu/y9rhWEO0xpcS3Y
         X1cA==
X-Forwarded-Encrypted: i=1; AFNElJ+YmVTWpMfFeLA3bXkoguD+8soW2HK1vvdbiEdTp7f/7psV75RXWwyZ6AimDzOB9dyzCiD++bDMhrZd4P5C@vger.kernel.org
X-Gm-Message-State: AOJu0YwE2S8IDa5+pNyubqFG17t7HDKj1dVbdJQht4YE2LWRpUv3ygs5
	EYEzSoLuc120D7iUK35P5q+DZgzbjjTsG/koHLf/mJ7PJo21l6CeQuvm+UzCKWY/TYI49Ns4PMe
	YLjaYqb11d65xYgWEKD7c3PBzLZBbB5Wa+0ME/0itJzn3JSbIgKIhQ5DZ67FBngTgrSmJ
X-Gm-Gg: Acq92OHp8OMlTZuhNw3hmWjE6y7X5pqwqqgKugE3ZyDS0GGSsj/r+zBgJGMaWuKBwwj
	GGhlZTMrrkdjYdajiVk5YsBSB93oSdTvJeNoktfy/O0vya2fJeQW7UX1KVZa1GkXwmmE/8dIakB
	66cgYJedfd8j8d9vlMO8tIla7rxRU5WRb0+6LjEEurGoNC/am2lo8BqtB1kFwmWNz45iye1QYOi
	wECIVDCyKERCdZHgU0H19eNHfDCcu9+1naSAQLctrsdCS6isgvJo5j7gE0QW1X1QPYovmrztU+I
	jbkoSnwruqeZvapbXKlBVnP71UzGs2JGbVO/ishpKpMDdxkAzSpcjT1RMANPi6xUDofsJQpq+a3
	Pg1ICt4FlL4WLweWXTi4QkIJaKY4sne2VoQqv9yWaknUOfjGXY6xnnLWYvThKJFmghcKPjBORD7
	+X0X/HNMuW3/D0GaPtcCIzBeto+PZyZaNS4zsnFStlnyxBlw==
X-Received: by 2002:a05:6102:809f:b0:62e:c54:fccb with SMTP id ada2fe7eead31-67c85c33d2emr6532612137.28.1779701263293;
        Mon, 25 May 2026 02:27:43 -0700 (PDT)
X-Received: by 2002:a05:6102:809f:b0:62e:c54:fccb with SMTP id ada2fe7eead31-67c85c33d2emr6532596137.28.1779701262751;
        Mon, 25 May 2026 02:27:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb37a7sm2564336e87.2.2026.05.25.02.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:27:41 -0700 (PDT)
Date: Mon, 25 May 2026 12:27:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH 09/16] arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS
 remoteproc PAS nodes
Message-ID: <4guumv7ve7rshw2pjvumenopxsefha7hvj26tw2pgayz24ytxk@iry6qyqqqs74>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-9-f51a9838dbaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-shikra-dt-m1-v1-9-f51a9838dbaa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a141610 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6L8jDZTAue_LqfRzy1MA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NiBTYWx0ZWRfX7vp8shJfTTJ7
 At09xoFwHWkiPp0Z14I7lLQNlCNVn6XtUbemoBklfEZ74fwHyW6n6rCGqxkrSHfdcFul5LV2l6d
 jq0aoyaiwsEe/6ymFORergsP8bpTuZRFyOk/W9P+YJ44/XavYcnJKodL1Y2mygCIbSJcxF87U2R
 4jDnyJY+HPpjzOfjucub7eioTU7uCK55zYm83NF+ATOy2TNVJnTu7LH7adxaaA0/KbmhE5eqPRX
 bAWIFlGoC614abkaKZmQvbSe0Dx4m8W5ElHJTtubcX4k1DGFo0PQgKfNDe8TJKDk+Tf0QjGTsfP
 +d69mN1Q5dzV41nPTnmWQJogCvxrResx+YtofYUsbOXwlLpcwnBbc7+zTaKvvVJ54fmlwelEKN2
 EqQgnqZ/rpss65VICCcvVicVpJWeqKYYHy8teMUu5dksns2WX5tnMUz8srefMDVgtCa7LcUeRzx
 hO4F//uKZjiJuXXRbuw==
X-Proofpoint-ORIG-GUID: LYeInCxpqzoxFQJUqVBxXPdd6m5sLWuE
X-Proofpoint-GUID: LYeInCxpqzoxFQJUqVBxXPdd6m5sLWuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250096
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109603-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,b800000:email,c11e000:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: B92745C8926
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 01:19:13AM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
>  1 file changed, 164 insertions(+)
> 
> +
> +		remoteproc_lpaicp: remoteproc@b800000 {
> +			compatible = "qcom,shikra-lpaicp-pas";
> +			reg = <0x0 0x0b800000 0x0 0x200000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
> +					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
> +					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
> +					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
> +					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;
> +
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
> +
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names = "xo";
> +
> +			memory-region = <&lmcu_mem &lmcu_dtb_mem>;
> +
> +			qcom,smem-states = <&lmcu_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 286 IRQ_TYPE_EDGE_RISING 0>;
> +				mboxes = <&apcs_glb 9>;
> +				qcom,remote-pid = <26>;
> +				label = "lpaicp";

No FastRPC for LPAICP?

> +			};
> +		};
> +
>  		sram@c11e000 {
>  			compatible = "qcom,shikra-imem", "mmio-sram";
>  			reg = <0x0 0x0c11e000 0x0 0x1000>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

