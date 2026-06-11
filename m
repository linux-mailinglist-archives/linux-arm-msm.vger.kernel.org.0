Return-Path: <linux-arm-msm+bounces-112741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tYEDNDueKmr2tgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:38:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 342366716AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:38:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Fg03Kk6P;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h3bGnM6h;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112741-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112741-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E5253095408
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C143B9DB6;
	Thu, 11 Jun 2026 11:36:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E2D3E6DF4
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:36:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177817; cv=none; b=QjXmUcsL71o/e3MRuiMUvcgfo+ihE8opEb4RZhSDdX++j6Rl3KaXAOSm30JgaTjFZlqcOQLdtwokmRwpy5QodF9ym3tGGQCPrg02VvoFEoGkt3kK9bH98lJ5n1KqA2Zu9NsuJKnuJDrizLvh8XvvO3Xj2oQvAwmaL9fsfnho4+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177817; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJbOHJS1Hl+rb1w6sJ0dUGLLaeakkyhub7o5Ut2un5LERS+O3RlCmZ8uGcWlncTvufwpPXiWmwcakgEs5P4UWyV1mKJyd626vhvAvij+DtDbaYONLz/kt6NjFPkhwgsKl2YAmTxYWnvBA0NInQvbtya+pXdz7X+qDO76J7pCegE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fg03Kk6P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h3bGnM6h; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xplU214485
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=Fg03Kk6Pdm+HlNRe
	EncTXRHJFVMBTbOj/AFr/PnJfz8AqRl7nMnDxy99hAoiv+M0/PWfazWVhNj6txrq
	jMHRahQqS2CsbgqFDRdg88+hkvyGiQjC08GfpQlRqtsxp5QdyBK8WxVOBLYjwBxQ
	LWt2syjmMBM6FtIi/ic9nGaHFvolv/dsNEaDqVN7MYcy5JAC8kM7R9U90KBJId1D
	cdfDpItiKcNnqTkFXQIFXuPqo18Y0DOvya7LD2/mwrktr/4PJ8OKU5Uti+J9p0nm
	+AwLh0Uf99i09FC4PGwu6nDOLCmaa6H4fVbD9fe3wjwxW/U3I9fGfoYWMw30iMD1
	neCfIQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk8cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:36:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517647fbff1so25961781cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177814; x=1781782614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=h3bGnM6hJRLnxHy/xYMzbPWqz4fNkxWHlsDmSoUbkRTMSZT+kC+Xedb+vTGDQ1ekVo
         X8ofIgriKmw+eWR15qJWCljE/Taq7B9RMa1z3lOkiMA0jU7CSEvozpoPEHQAdm1hqael
         aNINsTyBPp5oZs0HI8eAJ98u7HrzhZSwKfQspCzehofKM6QOpUUkhiNZI89IXWF3Lv1q
         SnzNzWvojWS5DwzL8NdCVzLeCj3XLTFtMMCApRaOktbgcI7ltUChT4zJQE//PkSA7I/T
         7mTEBkreCKTIbNzq3BvSmFCf5vQtQVSbv96RW9vnxqT9Fa0nCjpDLFT4S8dWpS/Reg+S
         AwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177814; x=1781782614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=AT57QnU11BWGQz7hzLK09geXws6Fzi8NWxRgWtBkZkGX4ReMzqfoWC+KhXdEwsPPTT
         YFAg/DickQmwANPnNJ8F/TT0wOJ+ge5xnK5KmdEivS/YHXImlQGlAbqGR6ePw9Mcq8sO
         qFNfcN27Puikyv01rxu3OmV7KDuGGGv4SYWNTFGarZPHlWr1NgnPaxQaOmEmKJ0YpgtK
         x7LA9+f9wxzhCzsF8gHyfdC9DN1/WsGC5jh8qhOgcYmX2khQCUM55c93BCGyvE2HPtT2
         w1Dcp1zDldyi5FPQTyyXLWIdxkF2XbQ1g/c7+N37zXxDabplvF77NsJKBi2DPTC+wEUK
         Fn8w==
X-Forwarded-Encrypted: i=1; AFNElJ+ubFHQ2gWFycwD2+n1QetSFEdsWgOp87kuF5148zzepYB3lODRkrUJ6dOFyhfTdz9dvJ/olA6ebmFoWRK+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqiy+r3cvKEEDiv+HEhVejBDvor0vA/xDhH3MgKEaTbhZb/n+u
	mJTCg8hOsut0w0BU/OBMbLdfPyx+LCnBBiaAaRrG6FjDf5QxqVXkyIdmB7Vvs9cTVmUVH+f5Lzp
	FSqX2Xx+ZDUvKP3p7U4edpAcB6BDZi2vJdsAfgewnm/rqlG88fX4VkWzWxsGw2i6RYsa4
X-Gm-Gg: Acq92OHaMNenJZyUtJsx3KgdEpZxirmxMTRGvdQpPQR2ffQGu4UCJP51YqmEElY29cR
	ytQYLAChkRadY745BwFlSODDlFh3T/9T1SSr5sZ1i7/dhLgt00NzdZnOPDRNhYE2sjaAHL6QCC8
	jROqjjdEtIM56K8OItA4UzMg4pzLbaUzM0E8tzJAAVpFZbnw9gXmma5D4cRRdj7xSMjtd8EMC3x
	Jj/7FxMsVkPmYBLDm3Jyjzd3yqnSoH85rCsmRiU4Ui5ouI76+xSwI9DdjBPpLvDDZbmwzZnkVeh
	hZyZ2JYYAi9MB64RGpcBgl3fvEbAJZ7cW2vPWGgOBX1FkZ/C3oL9trbkdq7/aeXu5jJexJGc36d
	fH980FnKVz7rnwvFh7r0vtblZM1+YQAREPve74+sVYbodqph4i/ndZIXO
X-Received: by 2002:a05:622a:4813:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517edcd7197mr23306681cf.2.1781177813856;
        Thu, 11 Jun 2026 04:36:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4813:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517edcd7197mr23306541cf.2.1781177813383;
        Thu, 11 Jun 2026 04:36:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f147e2sm53745066b.7.2026.06.11.04.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:36:52 -0700 (PDT)
Message-ID: <1a0e4b34-1b39-4def-890b-0057913f1b41@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:36:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/18] arm64: dts: qcom: sc7280: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-13-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-13-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a9dd6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: htX10jfvSuhBcEVRwM-l-2-tZvIZ3b0V
X-Proofpoint-GUID: htX10jfvSuhBcEVRwM-l-2-tZvIZ3b0V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX+IQFscC1WZCN
 ljXbeYoCT8jyqr+yyTYLf8fhr6jYI3oIILcTVbtroZfnFWSVW5GorpitcTRHmoJcAUlcolPmaBs
 m9bYcRdTOF9TRA8mZq2WJaJzUXQe6kIMRu0yVTWf6utZBX1W45lMb8b6RmFh0+Sw1gu/kNeThxC
 JyhdqD656zimg0RAUtra/rVagmHsYfHXxiIRvse2cUqpSgfcTxTlfUn8QNm7Wekc2Iada3KOx1l
 4pE68b5v1swZQq7J8ScfbUic7tYkmW0oiPWbASD5dHEuh1piBeTuYHmhIcwsYr4DKCiigLrSPTu
 QTuKAj3e2QQ6xlDBmXsCZx/5s8A45gEMkljuNTCqnhcUbYNcnTE6fwKCdU5Ok7Sd03iiMlIErBG
 hxGJH9pYzm4WxBRniwKkw93dN6sqbCIJ8th76cQXLOdQHD4pPmUnFzoHPP8DgSV3EHGNJRFLCAX
 MrXBNcKK8BBeQgL80KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX0bR6DSoIH22r
 Izz0NNINKkIptWaQNNM7REWh+LDj5vqLFM3L+W5PYr64/xoGq11T8ZDc8Hm/v1aUDm1KnbW6NIz
 o6ohmXhj4f+dM2vvZVNJ7CXBgbXZ9xY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112741-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 342366716AB

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

