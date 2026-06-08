Return-Path: <linux-arm-msm+bounces-111791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QYPKF8uVJmqLZAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:13:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D6B654E8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:13:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oAWYhHr8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Tw2s/qcc";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111791-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111791-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE2D23099630
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669F93BAD81;
	Mon,  8 Jun 2026 10:03:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7C63B810D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:03:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913018; cv=none; b=QeeEnDdQbFk2g911RKKasZIrWtkM8XK9ozK17OWf/jH/JhAKrkS+5BG3y5U+WqKhca8XRl1MRXG08E+SOahXkMs/xPJ3BrggMD1FCNYY9CMWl8EIToPvdi05NR5DFGnhTRT1CzmHSQ+g/A8RwfnxT7rDEBhhKpalj/eljb5bNX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913018; c=relaxed/simple;
	bh=0RqPO6GIvlMDAIMSc1YJlbk9SnAioPbSM10IwBfxWb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HW4fKmrmirr2b4hqrQReqi9pdbTuiTakjNEPdmhHDV/pGRsx92rs4HXBzS1PQuI7zuBNEaKTuLM5xy5AbcbRnO2hBFf3GteFO7unrbqooEOphLXJOgPg9DOAsObUmLd6MIDFKEt56NYc5GtroNKHWEYk73PPMfVGxVbB2LxKgzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAWYhHr8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tw2s/qcc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65890rKj3164093
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apHApQ1MhOPI/865u/RSUKkrDZhgXzK8ibYysxGxV7o=; b=oAWYhHr8AwIQQUqh
	ujIGiVtwd2p9tBDOrbi0C1Lx3EAmbCIpdlsDQK6pCeiSHSJcveBQeRqVyHqkXNKw
	Xa4rDTQV/drm0i2Gi2jbTigfeE4kw36k3B0MXFwkHrcX1/BXuf0wcJGAiuSFUhkZ
	XxY8uRWkwyFdjgva8sF51foIWKyQjPs9mzOhwO0QZVOp5YmQSrzqTX/Lg3r4j5Tc
	Fn4QNqxYLQzJ0b0ebTJu+kS7ct0VLIHL7lfYMzGOmcAVJLO8IHjCmFSlneq8jBcO
	yJ9z3VexHOTzydFZR2bdO2t2ReNqqwg5HDPOlSt99SxUToMSgIgJfdMYYar9JkHG
	VGrKJg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0g8vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:03:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c857fa2706aso1829240a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780913015; x=1781517815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apHApQ1MhOPI/865u/RSUKkrDZhgXzK8ibYysxGxV7o=;
        b=Tw2s/qccupOlKjFZ0OIjL8tLotmwOQilP0/bpht6NDkbcwH62LLy6xGzslBm/qZhpx
         PP/myWy2QtPr9TIgSliTZQqA0cBD2ymHj8QYLutxhPkesWQpXQvRDnO1SM0F0481jOg9
         tUXCKiVfXW9awxvDLbuKENP1/4hPF91hQLsqGEggg+723Cx4bFDdGfXS2E5Bp4ai4hBb
         X2rKh8jEqte9IQ4dxTL3TDOvdXNAGb+tViFtV4aETdVyQLYq7dRCAtVv9gNmEaygDWH3
         xeO9WtnFQj1M2M9qtipPZxsRmQRVmGb5kjle96zZApql4WBqztk0GT3EN9JgVA/Z1bNy
         yxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913015; x=1781517815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apHApQ1MhOPI/865u/RSUKkrDZhgXzK8ibYysxGxV7o=;
        b=nbCmGxs4/YTPiCUbJjF6F8PtdVjFF1CmXAAAB0CRyjr0bNp/S5xDqayNmVWgPdRWwH
         mnjKZhgcsEEJ2zVpQoB8WVPr2l7jPAFRWqZSXkt3Lj5p+EXadUeNc9TkaIutyZDf8nM/
         AiIYX4gqrYqW5aVZrwnzOZRqQ6PfWGGJVv/ooMw/9ilAhvWEOu+PNgBfy/ODT2kn7vtr
         TJ0IamASmo6TCbNUe3zNpgRS0DgIMLqmDPmbE7RpwvMI4+aWJILDpgFZIaHsKTHyiNjk
         6ODcN9ZDLMidauDFR1KAvMzL6INzcFZDYjjAjcRe0q29AzocUTdKs563sfw9//VANWFI
         aNaA==
X-Gm-Message-State: AOJu0YybUanbyjJmqntxp91LBbp6v9bp8QnTe7jcMvskxkS6qzfQC0m2
	LKB9iUDKzOQh/DiFhKV7drnMpIV+I0F8aoOsodw/jq0Lp5lsg/rJ0rq/sM/lO4cBtCl43rYLb3D
	K1TNG8usaEFPsePJtnKly5908bCUvGW8Y5jt3L/PnfpPPhIwXD5RtqPQzLxVK1oDCVDXz
X-Gm-Gg: Acq92OEq7z/9QQltf8+M65+JjHbtmACypt2FWKpt9sURT2hwrKHSktTtBNKlI+C2oSr
	B2cKJ/KlOlG8vHGux1iBHOlUfcIEU63X6DbCrICW+tj5TqO3vf8siWN8wiJZwVzuhEzSsd+jx4O
	wrNVtTMxEZ5KRxOYhouAi+z+X0kqEjlTCcf9jc4rzEeSTuVwa+M8CMFkIXQz4KmRlbcnKcij2nx
	Q+3KOtqZL7aA98TYQnwYit9fhqrUTcO4/CC5UkTUZ1cFaN9myMvJAxRtG+CO9DhiW4TDnZ6GbrO
	ACZXtwp/p8+uEohOZ8oM3c1RUI4xUKRmNqppDxVpCqvsNz7lbj+0xVD38ZupKpqnN8xMp5+++qL
	JJX0wbFK9S66tYQK0B17NKXkDuiq4UD0+hixJ3IDy8M8WCMyYD/F89kiO/pmrFrE9B2ikz3/9qc
	h6ZJo9bLir7tIDBba8VNqTo/KaeMs2lpBR0zk4I/w4NAn+5gfIiNP8QDv4zg==
X-Received: by 2002:a05:6a20:918b:b0:3b4:913c:296a with SMTP id adf61e73a8af0-3b4ccdf46a5mr16250835637.21.1780913014969;
        Mon, 08 Jun 2026 03:03:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:918b:b0:3b4:913c:296a with SMTP id adf61e73a8af0-3b4ccdf46a5mr16250796637.21.1780913014445;
        Mon, 08 Jun 2026 03:03:34 -0700 (PDT)
Received: from [10.79.138.73] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm17716145a12.19.2026.06.08.03.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:03:34 -0700 (PDT)
Message-ID: <b61ec109-92db-4dc1-ba7d-a5ce79fea08a@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 15:33:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: Move common board nodes
 to shared DTSI
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MyBTYWx0ZWRfX58FnHWZWy3Ih
 kEhjKxYG54pzM4SdZgnb7PAnwvZNFsVVqY1ttGX865HJUtan3xC7jQ6ONyRKD0Iho+1Ii2uibjz
 8v8Vc9EPGk8w+s5bqFHDIRhciE4sMVoSPzI32/wb/LsM/SQBOrL/TLZyl6fNjNFxW3DiWA3Y7MB
 owc2/SVTqRY7/acAHLcOMh4xboJKHEvzMuSmOOMNpjLhAz55w685nP6ZjeA20AoHsz9ptj5Qs5f
 Vcv+txQaaLk+zX06b/rbGtjz+PlNZwpB8IOq99TunaqN7wUEvEEAemHu60KaSUS+6JUcsXDC9yX
 eIqMkRBqus1ftRUhfDK17kIYM2ZocdeywYNWv9aDA17QNimN5Ul7Qygo0SB+HG0Vl1p/Ntw48w8
 2KW3E67ViY9bqeOZYiRkTU6rC6PywzDaQiY4uR8tQNh3QugU2v9+S5TRdaEuMvwItH0klqNeP0g
 crH0rPFFbGHUhz+6xkA==
X-Proofpoint-ORIG-GUID: RDMbD1lKMNq_lUfkRebpduimQP7-YXjv
X-Proofpoint-GUID: RDMbD1lKMNq_lUfkRebpduimQP7-YXjv
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a269378 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ArSBqUEsZOOXoIw0mWcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111791-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9D6B654E8D



On 5/19/2026 7:55 PM, Gopikrishna Garmidi wrote:
> The Glymur and Mahua CRDs use the same board-level hardware for the
> eDP display panel, MDSS DP3 controller and PHY, USB-C ports (via
> pmic-glink), USB 0/1/HS/MP controllers, QMP PHYs, eUSB2 repeaters,
> HID peripherals (touchpad, keyboard, touchscreen) and their dependent
> regulators and pin control states. This has been verified against
> both CRD schematics.
> 
> Move these nodes from glymur-crd.dts to glymur-crd.dtsi to enable code
> reuse with the Mahua CRD.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased on top of next-20260518
> - Updated subject to include glymur-crd scope prefix
> - Rewrote commit message to describe the actual shared physical hardware
>    rather than the code-sharing intent; the commonality was verified
>    against Glymur CRD and Mahua CRD schematics
> - Link to v1: https://lore.kernel.org/r/20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com
> ---
>   arch/arm64/boot/dts/qcom/glymur-crd.dts  | 399 -------------------------------
>   arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 396 ++++++++++++++++++++++++++++++
>   2 files changed, 396 insertions(+), 399 deletions(-)


Hi Krzysztof, Konrad,

This has been waiting for a while now and already has a Reviewed-by from 
Dmitry. Could you take a look when you get a chance?

Thanks,
Gopikrishna Garmidi

