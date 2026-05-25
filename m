Return-Path: <linux-arm-msm+bounces-109639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL7WHh0wFGqUKgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:18:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E6C5C9DF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 700E13037EC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69B337E2FE;
	Mon, 25 May 2026 11:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2yHIfND";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XG6SE1gO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A48E37DAD7
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707601; cv=none; b=s2FkArg7d8YHnTLGWECPck9VuhE6Oqu+divJfXtMGn3+vtNUjlbqJzs9ejC2ewdE8qNAzcdByum1QmSeOIUNlOqnHrTzsi0W1tKfk8L9ryQ92mi530SjvYHSaWjbu7STvpx7sQDuVe+GIZbLqjm+sNBeki8WkhgAqcIXq4u3G3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707601; c=relaxed/simple;
	bh=+NxNyrIsbXGQxnCdkWuyCIpL6w5IfhLl10ImMpqgRNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTgbGqdLkQDCM+NKPi/TQYgX788fwG8pYu6RucC0yrqbOUJ4D8fV+Q3mqz6jg14IJ6SnSR0x1fq5Yatq2A7oYFY2Vfig8bVNR5aMkuuPjtFA2nIO/Gx98TBHV5qS/NOPKWXQmP21Y5h2L4Jo1wcLX+mIlXHwVQci248tvbtfLhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2yHIfND; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XG6SE1gO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7MUZp2904634
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lCcY67VRp26KG8gUmXkaFmQN
	V0bN6FhsAAQbVvffwoE=; b=N2yHIfNDPCAoU0qJJ2fS+P/o1mscfVDZ+owL1O4v
	Y+7ouHnArUgFXSk2rhBHYgWlhK03pGP5KcHUcXpPMw7E+aasiyFr89PIYkRjWBcC
	uKjqRp9CjY8ofZFd0/+8BsdFrcvQo0avU50tH1CuxzGhBm4qcyxd870uHVu95xCa
	XtQl3Gqc3H1ePAJ+WFqfXkBbtY/biq2K1NwCPdoscGDceFTjyKyP/w5StkiyogYc
	LbgiVCB5SgFcAQFhBtiv5aLMEk3nOoaQlqY7tcnLPorgW3fc78PnAknMcLQLm8Wa
	s9s02nwk+R8Fv9ac+UcsZ+kGO6g7THNY+WjkTGG2Fg3E6Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t6jky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:13:19 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95cfe3d4c16so15765519241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707598; x=1780312398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCcY67VRp26KG8gUmXkaFmQNV0bN6FhsAAQbVvffwoE=;
        b=XG6SE1gOo8jqcdZ4ipeYAfIf3ZnAX2mvgJNhsViQ9UT+uGWerUrf8itHMitLtck2a/
         iwvFYY6jwFkHvzQdBlpEHfPZ9mMRUZwxWwo3V4mrsPdIlkvtnE8ePLqS9HFnvrlE3sOA
         QYz4koaGPKu4tboHkRH58IwDq7PJSsPwH0V8etbVmmDsp7ClPJ7am0QeenQHNpla2cI+
         dsAXGKFFLqoeJQ2wemyxR0LXd5p2UtcwtagbKdQaXE5XbbY8Q+L6cDECO9Mx5orcZpv8
         RU/sZLX7Mpc0O3Aa3bRWlChqdKtdPnB/LYJSvmxKRWPDkrjUetW1G0Ti/G4uJ7pZIB39
         cTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707598; x=1780312398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCcY67VRp26KG8gUmXkaFmQNV0bN6FhsAAQbVvffwoE=;
        b=lddzfedeYhKyr/W3jkAUnw62uPAZKc8af1PDZ0nv3oNHEFmfTBlLxYmfSK0d2Cm6SI
         tBKfOOFiMZ6iysAJ99k3BLEE8HWwbP25aPTvFZVwVs2jMx+HaSebKlZjUK4V+g+6XsPC
         82pRoz0Nmzy6u5DetBpCBfuCs+3hAi8ERR6TbtB8ZjmVg6wJwiySQapLqJ9iuRQa1jZl
         yhV09rzGBJ5kg3GpKMKbdCZthr/fKWqTvZhmn5vLglE308LOsIgDgk4RB39qrGAZCUT2
         aBsURATPF/bhBg5Yz6aSwANKfjPwVt5RuD7ThRZPoPPPdPHHtePbgpOUy/C0LqLWUILk
         tK6g==
X-Forwarded-Encrypted: i=1; AFNElJ+J5X67djuNThlCIsJIo7I3WdDckZb5zt+isn9k7e7Vls82/HoMpIsM8/GqmYfrir2VtMl6DPWsuLSvJnzn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4LLs96EJFGZozMLyPR114fCZC8UiFZeplxed6tg6UVMTPcN2j
	0niDd1VomU7soF1HpUEcGLEdFpe4FA1rVoUeFZr5DmT82S8PY50knumAhE1rSGi9hlXuI7CUEYc
	Dt0cu/F1NpXgDC/2BGGI/JDDOxBVKSFWy7VmbbxWqtgZYjqzUfqqFvS7DSN3vgohSJojZr/KuyE
	nZF+8=
X-Gm-Gg: Acq92OErRTAoVFb703BjSAwcM1U+KM+020aYu4QPM/17sfNhMycn7tQAq0Ty20Zjx5L
	Xfri42ZCv9+2xwQxuUQWB1a59dURPheBzHJjQncZaj/r/GtE+e1KhieyeSq+iGO4rcROcSE2yN8
	7kaQpj0kRaWfoebAMMNWWbIWc16a09r/mTprtqyo+wKSt7ApGFjQ5l5dNRdGkKDroUYYthX3qfp
	POYNMYHS0lQ3Vq16uYkbLzeMS5f9f8QMw5K/ILF6aaPhERc0DV0I4aVPLGzIq+Q9dUkLDSDNCg/
	yZIg0a8I3IhitP+ynOgEAv+WwqfggjB5fbL5UJm094BEtfsckKQQQHuzwA3SpR9iS7jC1ygTw5Y
	+nT4N9gWLjRb5jKiOzt9xDXCU7KuT3Zkd9pT0gCBjjClYXIZ1iCbxN+zW9jF1GwpxjJtXM5YDtq
	aXRQejuCeY8UDulglApH6bsDUETe4gCt9xTgo=
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6786143137.27.1779707598219;
        Mon, 25 May 2026 04:13:18 -0700 (PDT)
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6786125137.27.1779707597811;
        Mon, 25 May 2026 04:13:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf2ed7sm2648170e87.68.2026.05.25.04.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:13:16 -0700 (PDT)
Date: Mon, 25 May 2026 14:13:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Message-ID: <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-GUID: -AF913hS6ITcBlzGAuuIVXz4-ng6GtHY
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a142ecf cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iCjoXWfrZ2YzCb4Nau0A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: -AF913hS6ITcBlzGAuuIVXz4-ng6GtHY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNSBTYWx0ZWRfX0PxOuJMfZ3tN
 mB9cy9nzNwGAg9HNYtd2RFMok2K4Y3YVE6kSgbb4BdHlxPGeIIri4+UL9KWqeagQd8fhBffuxD0
 XCBNlqNCCoVlpqW4WBiqAdsRt/SN2KK8icSUl3bg6K2ol6U+1hyL6e4mciUC/YtejUrHwpmLjfQ
 Nynpu2yKU0NyjXOSLzxsfONV2Y/I0dxToxuC0U7XqW9aNDZ3JAtM2ufa9rb9CfpK4gvGTCPR2nE
 ugefNvSBQkK5SKfGXL6K6b3Oycmiiwn2fdu1syyq9xn4cxMP2kJzMxsXT1A9T0GZDu2xlaNwp/T
 6ZjDkXJHRArq3dONnESClkONsaXSaa5GYgmU6EsPDuWxnLKeNQMqFWc2107WX74WLKxMpTJGMq0
 48AUT9fARY+cQJ23TqNZwr4iQmF+2E7cNU/5bjXlL3lwlVsLkO8r+CIfiKEpQtXu1g/iJPy3gwY
 5dN7aWjG3Cv7T5riFlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250115
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109639-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: D7E6C5C9DF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 04:16:02PM +0530, Taniya Das wrote:
> Add driver for Eliza SoC camera, graphics and Video clock controllers.
> The camera clock controller supports the cambist clock controller and
> the regular camera clock controller.
> 
> Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
> and MXC rails dependency. Since CX and MX rails are already ON when APPS
> is active, explicit power-domain voting is not required similar to Milos.
> Hence extended the Milos camcc & videocc documentation bindings for Eliza.
> 
> The patches have been tested on Qualcomm Eliza MTP board.
> 
> Changes in v5:
> - Taken care of comments from v3, v4.

Which comments? Please be more specific in changelogics.

> - Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
>   as required property in bindings.
> - Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
>   bindings.
> - Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
> - Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com
> 
> Changes in v4:
> - Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
> - Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com
> 
> Changes in v3:
> - Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
> - Dropped the defconfig patch and included the drivers as m from Kconfig itself.
> - Update the header inclusion in the milos.dtsi.
> - Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com
> 
> Changes in v2:
>  - rebased the patches on the latest linux-next.
>  - Add new bindings for Video and Camcc.
>  - Remove commented code in GPUCC (limiter code).
>  - Add device nodes for the corresponding clock controllers.
>  - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
>  - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Taniya Das (7):
>       dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
>       dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
>       dt-bindings: clock: qcom: Add support for CAMCC for Eliza
>       clk: qcom: videocc: Add video clock controller driver for Eliza
>       clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
>       clk: qcom: camcc: Add support for camera clock controller for Eliza
>       arm64: dts: qcom: eliza: Add support for MM clock controllers
> 
>  .../bindings/clock/qcom,milos-camcc.yaml           |   12 +-
>  .../bindings/clock/qcom,milos-videocc.yaml         |   10 +-
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
>  arch/arm64/boot/dts/qcom/eliza.dtsi                |   61 +
>  drivers/clk/qcom/Kconfig                           |   31 +
>  drivers/clk/qcom/Makefile                          |    3 +
>  drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
>  drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
>  drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
>  drivers/clk/qcom/videocc-eliza.c                   |  404 +++
>  .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
>  include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
>  include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
>  include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
>  14 files changed, 4666 insertions(+), 4 deletions(-)
> ---
> base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
> change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e
> 
> Best regards,
> -- 
> Taniya Das <taniya.das@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

