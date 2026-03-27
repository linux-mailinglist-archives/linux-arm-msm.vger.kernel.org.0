Return-Path: <linux-arm-msm+bounces-100199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE4jGJ8txmnEHQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:11:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D89340374
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B9DE304C49D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 07:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85273C061A;
	Fri, 27 Mar 2026 07:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6l6YLXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBleDxFu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CDE3C3C16
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774595344; cv=none; b=dlbCroH3Z5UZIX+qCM2+IY0MRIG09FVZDcDEhK/Mfs2R+YNprlZY3rh1cZnduZgMhlsDhWevlDmIHeMc4+Jz0M4A2JUoE2fU97jl5Yk6TQkw4JHyJmtNGrkf7F+7j4gb6s+jVFCTvyG3qAncNYo2XhtBZXcH3HoGbZZ1HzXLNkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774595344; c=relaxed/simple;
	bh=9TxmuY/zdzq4/I05KRKA5AA8xMcByD8B7t96xzHGptE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6HsGp0gqh4xMeCP5vczdig2pY+XeakAaRTqqHYP5wYSNzNPVox6qliq4GLktXl8Ieai4eNacsXOJDEq85M6yjV1igP87euVFTk8EX67Pdgo1XlfptDD/TWbNU4xISCV20hNZok3umo6nsK+PanTXyqbvDuaYRgz8+V5SitDlRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6l6YLXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBleDxFu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w8eC3132274
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 07:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TaG90SVyb5AIepabbeQeF8TP+ZDwmTzW9c1DEzvGYD4=; b=Y6l6YLXCazICvbD6
	tSX5VJkeNF69GOc/D6o6j9CPQv/b7Akmua/LT0TNofDrO+UzpHWB/7Mmw5KIqvvt
	WNyiSy9VDfQRxv23VUackjAPXhQ8YkI/U2kz6yNGK0+KR5vRGyAI93NYXaQgHye4
	9IxOebMue2NWpa3UKQ+R7a4ZMTlw41vIXpeqI1CgfB62aocupzpTZQc2cyfk+Ax9
	5gbUrzj4zYMLAEIsnR7H+DVBmjpdvSNDo4MPUlAxMjCuirXJK01TwqD9Rxx4ZdnJ
	1pWd/vLp5uw5+EHuy5l2KLRHRWGif5KLE56zOcvahov+8bhAjM+X87NVjaQiu54V
	bDWrWA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s429dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 07:08:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0c954ff58so27077285ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774595335; x=1775200135; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TaG90SVyb5AIepabbeQeF8TP+ZDwmTzW9c1DEzvGYD4=;
        b=FBleDxFuOAA+ntFPDDkGLl3U5EqM0VZiT62oR50CGTUuueNlhdfCHsV3y7UmhhhY6o
         VzAdVMbw6tHLBkUpTwX/gIO8PCF8KRmmErJPdeiLsxUyswVGPRPl8FIfaV/jIStTlS9b
         sPVNs8VSU7kItUrmMAXYQBiK0E1Xio5XirNizHfLYLnssZxEW1DJcDrf8FlBMgnvgQAD
         a1DJlEZi+N3VFlsd2eGqs8ZZw2RIZtJo5ZzeltCazG0Y7MNt7GfZjCjo68Sndqu6eWnI
         FXmJ9f77BA+kw21iCcr4Bi1PMkG7m9h19Si9MGfJSS0g/ndF8a0S9cuxHDZNeaIFY1Ci
         CezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774595335; x=1775200135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TaG90SVyb5AIepabbeQeF8TP+ZDwmTzW9c1DEzvGYD4=;
        b=ZfeN1lofPInc2hUVp/U+i1wBTG6YQWEU86NMLFN/C+u1/P/hK+J27ZVW/jfNUUJnj8
         Jg22o5CpDVgnjDJ6nNF0SkmnCo0L4XDIhomnAb/DHu/dgxMD4OVuz98rdCswRUEIv78H
         ovQfEggwIuS4ZJiGcxxZxyE5d5CWQ0paeMzBYuUTdTdL2pM+pixTVkXFJ6ot4YTOzTTj
         3IiTJk4ssctS8J61LlEguM/1gc8RFzkkhCME9inSbqoe1lqloIhs9nG6EPcVPS7Wsk2c
         pDALDpH9k7riV/IGMNtgPSm4/tyYNWjLt8pSOrjr7ETmemXt00Bd5VcH83Yr8erSQdxi
         Px5g==
X-Forwarded-Encrypted: i=1; AJvYcCWvMA6mwx7MtK0x4rOSHIPCVoDNF9EXyLxg2BMTo/SQPIi66h5EdE71Zln0sB58y+dsP8TFb5/bhCVyauDq@vger.kernel.org
X-Gm-Message-State: AOJu0YzGKwmraGvTp2j8R5St0LVNEyk+lZ9pn0BpfGsohg3sJNvkGKs4
	Xdo37E0VmwdKtql/t+w0aP2hIaMbC5GZC4BU/4DPHZQIsoDPYGXIqaleBw1r58gdg6WfmoGspLm
	fdvtFKttUAkOcq1VgMFjduVQPJD7TTaUpUviqnL/fUepODOenbw1zPWHqPTm9+QY7cUXv
X-Gm-Gg: ATEYQzxCq7hSSs0q/i5tmQ2HTr406hHwMvrLkp/U5tqnWxMo8ehMvKU7M6dUXTpxWCi
	m3ago1m+tfh5jGW/ItgQ+/mSyt4IW0dBT0495HqiNjj2Hfz7dw+n2SlQOKS6xcLp0rnESaVEF6p
	zoE/NYX4VeR8UR3JwRTz/cMH2o5gag057coX9ankqFL45BB1r2EsJlw0J1G1MGEFY0nlWOLJHlK
	pIdxbrYMVmlJaCkTziEeTY35rvo4DAvRtKUXUKr57VjXxWQ6P71R5ReZSjUeaomr5m+g5/NizXX
	kxLSFihMXhN1obxwKv37XZmJkHo1HP4y4UblIrO6jAZjTxK44BdMP2dY0k6XyHT0U3hRIUL3Jqo
	MWS3D8XO098i8zd+1rynlj5BHDlBLuy3UolPNbRhcLSZccYqMDWMhALLs9nj8mQ==
X-Received: by 2002:a17:902:f542:b0:2ae:6133:d170 with SMTP id d9443c01a7336-2b0cdc3ec8dmr16769095ad.20.1774595335219;
        Fri, 27 Mar 2026 00:08:55 -0700 (PDT)
X-Received: by 2002:a17:902:f542:b0:2ae:6133:d170 with SMTP id d9443c01a7336-2b0cdc3ec8dmr16768755ad.20.1774595334731;
        Fri, 27 Mar 2026 00:08:54 -0700 (PDT)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76b6casm51125775ad.16.2026.03.27.00.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 00:08:54 -0700 (PDT)
Date: Fri, 27 Mar 2026 12:38:48 +0530
From: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable mdss1 display Port
Message-ID: <acYtAF6RkUHlEN+k@hu-botlagun-hyd.qualcomm.com>
References: <20260219-enable-edp2-3-lemans-evk-mezzanine-v1-1-969316806538@oss.qualcomm.com>
 <d54f4b17-a137-494b-b103-2734987c4f14@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d54f4b17-a137-494b-b103-2734987c4f14@kernel.org>
X-Proofpoint-ORIG-GUID: ChSPMiMFN6KeG7n_MjNxSlO2PDdnqy9A
X-Proofpoint-GUID: ChSPMiMFN6KeG7n_MjNxSlO2PDdnqy9A
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c62d08 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VUyFjh0GlgUWf4IQGBsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA1MCBTYWx0ZWRfXynDvWxQrJ7IX
 dohxvP111XrrXN4SHKzV0YQPD+Wa/MmqmVsycc8Vu7D3aYtqDjj3xNBieTK0pYZRqKIogmTEpoa
 y7MEZMa1skx87L0Zvms3U/Gd9lbOroQf/R/H9AdAFdlIIl4lfqjKwXI6cROP3r8Ra3/iFM/PaLl
 yHrVAPC1+bxHvS3scCVcVbiQu+70VD4jePU5IlwZPtNhiJplBEeAEUuK0uwfeMZZZW/praIIVBg
 oIbpO+sW4f3MDUmzXrLCfhoZ4EnIqfLA/C+yZrRh4l18wPnqhwyIU3M2gFl/FVzPMT0aVwfbZm1
 09ZQl66y1gqHDcaWijHVPXgKmdjRWJh9UX3TK6+Ue7X1Cxygle48fmFg/pVPAPcWs86e2kneOLv
 y/Br1NIwF7AymQShMc+o76Lqn/x/WsC28DFE6o5VSsTMwUdeVWc7RIxbwv9GGgXaakMBErADilh
 ccMRGSO4W9Dj+AWByRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270050
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100199-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkata.botlagunta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1D89340374
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Feb 19, 2026 at 03:24:24PM +0100, Krzysztof Kozlowski wrote:
> On 19/02/2026 14:36, Gopi Botlagunta wrote:
> > This change enables DP controllers, DPTX0 and DPTX1 alongside
> 
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94
>

I’ll update the commit text in the next revision.

> > 
> > ---
> > base-commit: 1a0829927afbfe654c632eb2e779fa32df825b06
> > change-id: 20260219-enable-edp2-3-lemans-evk-mezzanine-1bef9932ee6d
> > prerequisite-message-id: 20260203193848.123307-2-umang.chheda@oss.qualcomm.com
> > prerequisite-patch-id: baf07fce333b86c35c3d4cefbba5800a519952a3
> > prerequisite-message-id: 20260217071420.2240380-1-mkuntuma@qti.qualcomm.com
> > prerequisite-patch-id: 74a76fd6a1129cdbbd32d91d2a119d693dba78a7
> > prerequisite-patch-id: f4a858f7e707c8e330daf2ea1f4da58b4da00f05
> >
> 
> Why do you have so many dependencies? Why isn't this merged there?
>

The following changes will be included in the next revision of the
dependent patch series: https://lore.kernel.org/all/20260226111322.250176-1-quic_mkuntuma@quicinc.com/

> Was this patch tested (see internal testing guideline) prior to posting?
>

yes, changes were tested together with the dependent patches before posting

> Best regards,
> Krzysztof

