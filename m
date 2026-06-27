Return-Path: <linux-arm-msm+bounces-114737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id trNeHJIcQGqNbwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 20:55:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8616D2813
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 20:55:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="O74Xr/rT";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N2rfD2YL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114737-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114737-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51FF23009982
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 18:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E654530170F;
	Sat, 27 Jun 2026 18:55:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986B62BE7DC
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 18:55:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782586512; cv=none; b=iaJuRBKTWBJ2tTQQxZqBQKmr9Dy1kZn56nUoBnYeTYBz/7MIDj2xOwc0+XZV8aHUigsOCypIiMN6Bm43/OQrVze+DIBkF3oLkPunFKuXEG9qe+H0TEQnyk1qHIYQgspaR2t2VNLnInq8l4dbBCEgHYzrBXMmyf5F5IM40MWPXEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782586512; c=relaxed/simple;
	bh=M2uDTEaPETMcjGHX9m53MCs7/s2AV/t2M14/4PHKTpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hR9eoqV+uC9W7wL1SCzcNujtgWbtCcSRdPOQeA0R9VQP5OP98tXRP8l43qT3DVIVkU0rRcxTm8FLTMf+rLahkL5oBEm+GRqZwrbHMFV2D9ECa1pzjB7BBtmKMXYROnJvwgAeoEmTxfKzTlhT7LuSYvqeKKNiue3fSvThnrp0Ra8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O74Xr/rT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2rfD2YL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65RHntEF1737145
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 18:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pDwBHMixHcG
	VFUUcNVdok36oM75bvaMbaiO8a8IAav8=; b=O74Xr/rT2Ttp8aboSpRuBP3OtAS
	66ELj19MAN9TOsoLJi2lEsQfFTu7D2BUbmE7MDAwsl6Kjrawj0eoUVk7GB121IAz
	DwqdkoqiqQSF06OMw9bjBsmM7tIH7aZByzCsGmjjPYe1kTqqwTfA2wja4F2V53W2
	v7MmBEYW/B5USHT8sVYpoG2edts8EEw+0cbUisK6EpfNWf8i88Np+XP0wiVnbnXp
	9p78SbqRZlqlXqb9kl1hrLkQZiHM+GvlOHDUDq0MA62wdJzyb+7/p9Jw3Ip1XsWI
	dG2w6arsqa+mPGK/r6TlpEVRrLX5OItmxrF/iP+2k1k3zNEyMryC00lJ4EA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u71hjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 18:55:10 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7ffa2b66e3cso5560817b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 11:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782586510; x=1783191310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDwBHMixHcGVFUUcNVdok36oM75bvaMbaiO8a8IAav8=;
        b=N2rfD2YLfG8qXYxnWmxiabRq4oU85HT9vlHg9+fwxYN2oa5rwtOKtkRCp7JxJrOb4/
         oNRTht+yWQvTuyfNg6VSQoupo1Tx3bQBC1pyZtGMUQwODBeUbgCtr/seIM2HFUz8iyiI
         cOvEYBSFR3w2mWSdpPAPSjPZnS2/pP0WtwV6wo88OJNkGnLwIDOZl+scEGrybP2i/kdZ
         aITEso3BZO/TFAR9/bWveIscHwmyoHGnMumhDdrebZW/Oam8O++Rzfuhr6AW+SU5IEkG
         YUlqzaJe/Gt9Ihxz+dZa1JaGLKlcW6Hu98NHVn1Ie+0sZzN8+vdMMV97dxWfWM0P+EC8
         h9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782586510; x=1783191310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pDwBHMixHcGVFUUcNVdok36oM75bvaMbaiO8a8IAav8=;
        b=H8d3kCJ4J0uDLQob7F6LePZJ41qdhgu3vNXIODktUeH9tiNlbvuKJyNm53N3rr7xmg
         2jNIk9NA66HdwOZgGk5wjWvcR8IPE4L1Sf9+Ou08W/uPz6s4uyYTY6OKIZZDR8rniWLV
         tGUa62mPySju1P8ZVYDy8VU53jZIu97dwhxMaSF0+tybyn7tNVWS8uSsdX14H3y5BvJT
         TVWYdruo5E/EvjobRQUdy+Q8Sd+2stkRAdHdY7tOCJbNIUMQsv6d8n4SAzFNpShM+hJ6
         0NdaI3yn9onB2xSuVw+NlHnJy4X3gKEsWy3ZQ6gnsI7PU7vwiDe+4ZrJHbvmanvjfK+d
         hIGg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5fMV+D6Z8gJeit622mkavSe7HI1Loe2Nbb5EwQPfjM/YyhsiZ57d/EEvNJVrlesjizw8gtrqgZcpSebwA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy+hwlsDgdUQR7P3nKwkI5wYoYkZwwmchSILAuHqPzG/7cs/B0
	9znh5/+bK+FGgjBI2qg7cQ1/nIfNfmGmFq41hjGhmnyxhQeTs3ghhbI4KoK5V5OyLL8blj2E0v6
	sngaiuOqokVS34HJJXgLAmf2HWqpUOuJ139SrXIH2mCS2dQeBihvvrH/bKEEB5toUeiaf
X-Gm-Gg: AfdE7cl3qh6yEfd0sNp6N5VC3j2vZ0nNay3W6eUyt4HuZa/SHuZJbRQNVrQouu0ECya
	QcBaisFIx+DoZf+iZaHyl06NmZdFkApt/vthdg4tH2cEG4Sws7ydSix888XIuilYY3iSKbC4anh
	XlmIo39Qs7+0o8/RYMrCu5LlFyD9JW+B2P3CiTgFSNrig1MQs+dWbSEhtg2tQVKh7Yd3ojMqICQ
	6ab20vQEeUcoG05qfX0OGFO+nEE6Lbh0VD+CJUHhBGmFfFf3W1VN88OWjUWvp4Pp4/PfV0c4Ysw
	fwoiujFl/l0dtNT+XtQJ7j1e7Flmz1MeAs3HjQ83vd8uxxh/b+MOv0mYGNZE7NXjcbMqhrGj32A
	28PB+C0M2USByLYrFmKFJ8Y9w92XyqNjpBN0AB4z1CjiuPrHwtG5IconyTXH399B6S8xbtfezUQ
	==
X-Received: by 2002:a05:690c:4989:b0:80c:8596:464c with SMTP id 00721157ae682-80c85964b48mr56512607b3.62.1782586510022;
        Sat, 27 Jun 2026 11:55:10 -0700 (PDT)
X-Received: by 2002:a05:690c:4989:b0:80c:8596:464c with SMTP id 00721157ae682-80c85964b48mr56512427b3.62.1782586509532;
        Sat, 27 Jun 2026 11:55:09 -0700 (PDT)
Received: from localhost.localdomain (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025ffc2730sm97556937b3.34.2026.06.27.11.55.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 11:55:08 -0700 (PDT)
From: t <jason.pettit@oss.qualcomm.com>
X-Google-Original-From: t <t@t.t>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Date: Sat, 27 Jun 2026 11:55:06 -0700
Message-ID: <20260627185506.26974-1-t@t.t>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <e6c95342-b3a9-46bd-aeb2-a1384234476d@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com> <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com> <e6c95342-b3a9-46bd-aeb2-a1384234476d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDE2NiBTYWx0ZWRfX/v6t548NT/Xn
 7wUW+h4jB6M+snqIhjHz84Ga06D5+6l3W/SqW9rfdmlhrsMELymMJxDe9H9Myc0ws0uXFDXhAMC
 kzETXMrSXp88KezBkqgtccjDK8rB93c=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a401c8e cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=-S1dkTAofOBTlHLHEW0A:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: loS939PZJ3X67hzuWhthZ9tX93LioeO2
X-Proofpoint-ORIG-GUID: loS939PZJ3X67hzuWhthZ9tX93LioeO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDE2NiBTYWx0ZWRfX+J1pnillXvMp
 xvIMVSF2Q5fhMLyAnuTGH1Y2aYDtQMX2PCo8u1ikeyhOD3n2+jT5YfI9J/OvOgDIYHVC6p9Q2yt
 XQ85bx15ugSodD49+FbciwHR6dRZcF0u7aLikNrXdjWFZxa714FwObHvkY0tRxGuFO2XUFPhWGa
 8kAnAo/NuPOz3gFaGghYF/zAsIaJqhJ61ZNKeORJqsMXF1GwQPSZVoaRSnEuiQBLE4HW7/FodVv
 UjKqRQlCSwjT8U2q+FwsfwRiM6wtvtsWwr51EEhKkgURBSLgPKl0GPAHxCA4s9E529fL9v+2hbb
 YxZJ4mAIC271P2YVLRIsQzt4whIv3P2vi4SbHFG4oufHJ3015/6JLbTbFwlIAfb2Vky1H+bmTN/
 SaHV2TgRtNYCpHUOiIFcpH6+uA/qIG1DKQQn2Te51YEqxf6rd2IsGi9PFtrlWq/QKFC6c7FTKfd
 of8Ktj19PrW3J0u6ZBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270166
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:jason.pettit@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114737-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,t.t:mid];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED8616D2813

From: Jason Pettit <jason.pettit@oss.qualcomm.com>

On Fri, 26 Jun 2026 13:26:14 +0200, Konrad Dybcio wrote:
> I would assume it's simply not present (as every SMB2370 is a separate
> physical chip) - perhaps we should just add status = "disabled" in the
> DTSI file and enable the nodes on an as-needed basis

I'm not sure if the chip is populated, but I tested whether it enumerates.
With smb2370_l enabled, the SID-11 SPMI device (2-0b on the SPMI-2 bus)
fails to probe:

  spmi spmi-2: pmic_arb_check_chnl_status_v1: 0xb 0x104: transaction failed (0x3)
  pmic-spmi 2-0b: probe with driver pmic-spmi failed with error -5

The SPMI PMIC arbiter can't complete a transaction to SID 0xb, so pmic-spmi
can't read it and the eusb2 repeater doesn't bind pmic@b (only pmic@9 and
pmic@a come up). I keep it disabled.

Defaulting that in smb2370.dtsi would touch the shared file instead of just
this board, so I've left the override here for now. The comment in v3 will
be updated to read:

	/*
	 * smb2370.dtsi enables all three repeaters by default; SID-11
	 * (smb2370_l) does not enumerate on this board, so override it back
	 * to disabled.
	 */

Thanks,
Jason

