Return-Path: <linux-arm-msm+bounces-116709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YCVtD3d2S2ptRwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:33:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B348A70EA40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:33:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Rlpxhtlr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QQpjwDbE;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116709-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116709-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9F5B3144C9D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EED23BBFAC;
	Mon,  6 Jul 2026 09:00:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85AB466B72
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:00:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328443; cv=none; b=EQKxtKpTXRjMtKwolrNpH/ZS2YVMZK66DpYBVkys9T1rPKx2/7nWpu641l0n0GudtkLrN32Yu4aWnPyC2JRfSeYFMB83muFAkV8bEgC54g/s5b0c5VJuS8t/xe05BAVql6rmrq1aJ2bUall8UdSJGawX5Wdp8BDI2CGujQH5L4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328443; c=relaxed/simple;
	bh=iNalMqxBJuKl0rvyboZOvliwzef4oPKxKnxNjSsH5SA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=joOdXk9tn+hsao2eKyXVbXP9AwyEWcvy6mcC0WOCZauvog+pKd4gNfHCBaGMICIvcJMRdXGCOrqbNNLo2koBCGBdTHxshw4RhJzqVKm+E4Ixaj/oEJvkLjC2G6z2XawxuFppPwODcyu+40ErjiGxiR9M8l9z2bGf7sJlY4F5Ir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rlpxhtlr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQpjwDbE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668N2Qr4072458
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNalMqxBJuKl0rvyboZOvliwzef4oPKxKnxNjSsH5SA=; b=RlpxhtlrzEyY/bep
	qrirL3MP0GWC4Y8C6Grlx2vXXVY2Zh2rRAEeh4KhiFijkwAug+ZMIAgyW1aFAjyC
	QPZ8RSlmo/v4WBAzPYxWUC4rJnLJ/nvzRqjR/wTkV5yoUN3pO9iipFSHomoJUZZ6
	Q0l4t9ir1+uZ4jwKgrI4ViGnDHyUHwfMV5OAkwduvxW3sJcMmBWEZjSIt70Ox4kJ
	IuEZyH8id4AXiClWKVjt+Dz7qkCbZVqDyLxGAxOd0w2FZii9aWg9/dek989RNGow
	HpqX+CnPD0Xi3vlIqLh8nd+68Y+A+T1mWCN9edYNNBPkivzpHSmr5nu19P2F0g+C
	8rMVcA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t884wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:00:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-846f50381a6so2169771b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328433; x=1783933233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNalMqxBJuKl0rvyboZOvliwzef4oPKxKnxNjSsH5SA=;
        b=QQpjwDbEgC3I4zDuBo93cJjw4FeyuRMnqF0uVndRAGh5YEFaB4kpwwK12ZmHq5sxmt
         y9A24xg5FROdsvqGJ9m8CzOSExNTcWyk8ZkeFVqjnHhHzejX66WrMYZoMxpcshEL57YC
         irMuDiAcsm3SmT1tCvRS1ea4sCZ6ge6yzRubrGkUEvr8eT1WXI44uoXq2tXeAoFRSH8r
         l9LNfwnf97zEi9g+AqUPZVvyL04tnO3qArmV81m14Npy7YZuz+xA7jc5CAVkiZPGUeeP
         nw1LS675dhj/vfRkj3wddeogEtOFfwJkmzUth46arZS7f/HBjBGBo6Cb4YuUpiOfyl2N
         FBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328433; x=1783933233;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNalMqxBJuKl0rvyboZOvliwzef4oPKxKnxNjSsH5SA=;
        b=OxZ+9KrvOwFeASTONUublpOPMw6SI0Md2tzG2j9xRgpxX3B3QkWuuKRuv8Z5dr77Z7
         vHetylqfHYQilD5U6wi6yeGKB/UZWdlS4KBPNj1Y0FxeQ/FAyfCwDJ6n9+GmBXgZteSb
         SA6WnYC5Q/3ghwRvdALMtdGfDfZu9oKtTDyJstRmvcaq+8LsgOsxPIr1mn7JcBHQhMS4
         h+NRErUYcrUjMC1gKCKNWGuGsW3h6MH9BL0TXou51AjLawr6lsfXB22BLAILaydy9IJ+
         w3mRhMVKHQzBnZY9XdcRNRG0P6ZZFtt/ZH0ndYLaDG9okSBCTjznf1A02a0+CVraZg63
         eBjg==
X-Gm-Message-State: AOJu0YxPYFsP8rkX/T+bkzubDp+stosBrS7MGqwM67IeKcSqJ9Z5SCeh
	9uvHhix6Vi7yEZJhwVIHSTzdodDK7CRCILq71x1cw0Ynj11d6TlKma2SLlmaFPJY62bReXhIeC3
	dfIu5pOHP61TQK6MND2y9EFznyw1yI8xO9CtyyeeZxhUq+DV/2EhgNJUun2cjwXzia9RN
X-Gm-Gg: AfdE7cnPzMf1MArbEG52AcLNHBL0CY7Yo/y39/ALYjQJv66gL3Gmtt8EjikVW91sYRP
	tY/cyoBeLDPajY9oExRGLVEwQaLDh5Fcgb1MbyWC2XZJesWE2Ouj7D9D9L4OHjyg+uwXXIbc38D
	++wOyZDo1gK3/UXG1c7iVmaGWyDCS2XjZV/BOBo8f8o/nnvIEygg2YQsWrlJSdmAdaErTclwHcg
	ns0hmnZJd+29e+a80RPvfuyMVnVJgCoUPoevtVANU8+Xg5ygEmrACpvSsKhhv7UdViIxaI9TupG
	O76sIT0yZJnyfnRpd90Ia8rdWfuoJHn0Tzi+RGgalLJhk5tC3pDEZDBifSwajGldewRIwCSqTwl
	rA0Pr6Ufm1AWil1HVCO0ZUErsyEXV6C5+dhE3wKAo
X-Received: by 2002:a05:6a00:808a:b0:847:c014:864e with SMTP id d2e1a72fcca58-847f6ef68ecmr8402629b3a.30.1783328432883;
        Mon, 06 Jul 2026 02:00:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:808a:b0:847:c014:864e with SMTP id d2e1a72fcca58-847f6ef68ecmr8402581b3a.30.1783328432453;
        Mon, 06 Jul 2026 02:00:32 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6952a0dsm3504494b3a.0.2026.07.06.02.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:00:32 -0700 (PDT)
Message-ID: <5602dd52-73cc-4951-8995-8ad72a9b7465@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:30:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-1-0aa0ec1fa83e@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-1-0aa0ec1fa83e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX3vZAWfo6S9XF
 3t1BOAPeMPU98xrzbQyOiIS7fvwAyvLAVJbZCZU9kQnKolVNLcgrebXnEu3vqve+mCmwTSlJutT
 8z1NFyLiAcBQNxzs15v7F14wWyQGe9g=
X-Proofpoint-GUID: hpowYZvQS7NGJ09Cq_mSCNeUcyldR9W-
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b6eb1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lf3haRiuEmTuc57r_SoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: hpowYZvQS7NGJ09Cq_mSCNeUcyldR9W-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX/m+XfLKp2reT
 81csVV65IolimfeBucOaeTjlYQMR/MBhumretR8fyTu9Q1skZua1WyP72kGnfgfaFhl/Di/nLyj
 T0nHHGP1n4DzCrY1525ogaFL+SBg9o3m3KYExm31bvDoYS5RHcx/qYkKajgIekrImKzGli43huw
 LDqWIagonfHep0ny5MC8MInEcwNohaOLLSCrYKGQMwflpXvpHFSOORZ8cEY+Y+DGYRpC+BDxUCv
 1FAdOFbvdAZSZbt86RUv325odpc7qMzz9GP/ASSOhEM57LWptK8EImQdqb358Qa88w3L89t8NR0
 +wQSh4T67DBlXKbsgFFwky/IXDdt3GCScDlhdS0i8MlUSfOfJ5DVqgqhUVvb1G9cdAqMpeYakrc
 DQV6htv9aqnlDH6FyQjyK3orvBuVni7w62v4emPt3uyReUNxxVKLDRiklxthLhqPG/pcLhWqdUR
 Mz/nsybELPCP1bR9mnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116709-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B348A70EA40



On 7/3/2026 4:43 PM, Sneh Mankad wrote:
> Document the compatible for Shikra.

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Thanks,
Maulik

