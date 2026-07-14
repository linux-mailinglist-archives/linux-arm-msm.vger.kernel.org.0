Return-Path: <linux-arm-msm+bounces-119024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zsKCLPQoVmps0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:17:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCB775467E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:17:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dbuyVAvY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=imDVR1bt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119024-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119024-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA50B305EE36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F87F3BF66D;
	Tue, 14 Jul 2026 12:16:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5AC3BFE41
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:16:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031383; cv=none; b=cBZi5SpTAWFFhHx71H7+Pg+tnHvv8ZnY3+Q0qaQtSrhYrmWj4FuIoRF29Wbv2LNEJ6UKRB3MEG/8FrefnQ8jbjFRSl9t4/CS7Q7xy1C9zunIp3q7oU2IgjqfDPk2S9TcRR1RXCxAnfaEtBqRfoHRFnkZneWcSWfHKb0pfc0NxI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031383; c=relaxed/simple;
	bh=cBkiKuV/tBtgvxHXjdq5Qq8BR4W6hZWhNad7hjmbIhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxkZoOiSGQHou8vT0R9/NhYW3VWdfguOnpmI5881f4rU7lA3wnR+wIUu+B0/GvnOx29DjJB96qezBKk6WkJaAfid27lvviPRKCVOWrnYXOFNMbJMRbiEPcNjtcCbWRys76PhkehH9y7Of/17mBJFvP+9uuRHbUiW4V3v5C8zGI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dbuyVAvY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imDVR1bt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNqCe328459
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vgjnANe3FHbYOYSktm9426t2
	tYNOf2YtqzbfrG0lk04=; b=dbuyVAvYr1VkUoSS0vBF5D8AZmf99jNtPiRS/SRd
	C6N/ZHFg1ndx1QHg150JcJnAtboDqFtPvvkbD4ru+EjElK6K8VPjoo7LqNRWUdCU
	49IHzQdbYm3hU85AFSgLYMqfP/R5jOQaEZVc9hNPwk1jfPs8kh5+T5S+x7CvSA5d
	jckmNK+qmOVijp1s+k13X5Jd916KBPQDF97LRSUQitnqUwFSUAx2kheE/00oKE43
	ZRV1WV9aNEeX+qjK0yTcEgULdyropBeYguQmxF+kda8hJWaOfOVO7HbAgMBfSgZv
	BnlXetgkD8eSCadPN1+y4qEwQd1CJV+cXF20UPkuA7ppYw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq13gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:16:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce14a21faso17814985ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031370; x=1784636170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vgjnANe3FHbYOYSktm9426t2tYNOf2YtqzbfrG0lk04=;
        b=imDVR1btkATLntC0gpccc/L0u23+tb6cXgUnPrXy6lA6W/CC1J00XI061y1LyFz4K5
         Sb9TicXHSrWXKpEeyi/konKeR3L29eQj7VcnKlsHnCbSJXNRovPW8pOkgyURXPsEwww2
         vCik19qUYL+rRH7uQSeiRBkjyWsSWgFq7+rBALNQ+HdFUUK7FcWFAmeQ7V5vFrjU+SxY
         NzM9RATo7AQJofVULJ1jt3R6vrcpYtBAKOEsGwl2v12Ax2La4GPeQ30gq+5UP7FwWd9k
         tndRuf6LiOGESNE21IlXQhb9wlAGRnm356kl/8lmu7ieG4hEmod8UfdeRPsn3msB90Wu
         e+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031370; x=1784636170;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vgjnANe3FHbYOYSktm9426t2tYNOf2YtqzbfrG0lk04=;
        b=cfNOPGtPwqK6tThVYGJKAVBCs0g8/wthMTi1JtsL3lJ+OKXoklOE2tt/HX7FRGth0N
         5L0Wtc4OENeCIgMt/IpKq5ERhKrD8r1uV1p7BezSIA0CBm1NYM1K3M6uz74ll/i5KM3l
         LONhwyJ72rLnAUh8mFjqeCaHzG/eS5GIMNfLQV7Pvc5c8cqGk9js8W4z849cTtDwGVk1
         zT2idSkgTaYqjGs/EOj7S7pLf2gv4MrYtAjkHbXCR8rxZwueqG0SYlvfYxDItyK39fVt
         nAPd0Shd7c2SBcSwoREA/R7cYXEq8VsQC8vnuXddjcO/0V+jEPgrABd0NH1p6JDpQCxt
         P8gw==
X-Forwarded-Encrypted: i=1; AHgh+RozycltFsFnFgFP4lcxAgJZpunQDSAfDmHzj2SoH4OhmxvJtW+5nSqOB8mV+McuFp73wAbwhhATjmRiyGwC@vger.kernel.org
X-Gm-Message-State: AOJu0YyTkbOHjZu8PSRzj+eoas6/vhwbwDZurSfP/XgbdRt9AzhSuypy
	HJgIShPVRQr/PnmQCLnhXt1iITMPa4QGYhzgrL78E7VjbMNffsG2smRdmtZOeVN4jBXOljJTrEm
	8/9eu/pDfHyopvr4EtgYynBUUQJBIwsuCB5bgk4dPCxr3DGhI1GFisFVy5aZifIS/ML31
X-Gm-Gg: AfdE7cm0sE+vj8FyqIu1xy7BhThFNfRD4hmcdeXC8Ltz3ua2z+MVR/5+AeSForWNi1R
	oRa7e6kIfLxe581sTsd3yZIE9T54AZT7hLnFMC1DeaXgao+SzkyCNtFD4oTEKCE+4gJSKb0e+7/
	j/KiM4fUTp7Tyq3mkgJh3Yhyt2e4uqaWnXzdGTgBPs97bd/S6pysquFI+qrx6HDgXMzVwnxPQSQ
	VJ8hK+fb6KeD76/nxJOuGt5YHtHI0Zfg7/bTi+fysbnRuM0X2/Ssrw6lfO7x170DyBmfHkFTxjG
	LdJ1awNKzklBvy8JRBRATa6atW/ZzuM9EE7+WsKAgFWadYkhCIY6M/2T+KvXzo8FnjxnNrIZNrD
	o0XXPbKzx430TdZtMyeSymyA7d1IdY9bvJrirvCNbgOFUjYJbNlckiA==
X-Received: by 2002:a17:903:110f:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2ce82970406mr160410675ad.24.1784031369738;
        Tue, 14 Jul 2026 05:16:09 -0700 (PDT)
X-Received: by 2002:a17:903:110f:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2ce82970406mr160410315ad.24.1784031369221;
        Tue, 14 Jul 2026 05:16:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm36384127c88.6.2026.07.14.05.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:16:08 -0700 (PDT)
Date: Tue, 14 Jul 2026 20:16:03 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/7] dt-bindings: arm: qcom: Document Nord IQ10 RRD
 board
Message-ID: <alYog0QKJpp1uNEh@QCOM-aGQu4IUr3Y>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-7-shengchao.guo@oss.qualcomm.com>
 <20260710-adept-lemming-of-superiority-67e928@quoll>
 <700807bf-7227-4f9a-bd22-afa78c58e44c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <700807bf-7227-4f9a-bd22-afa78c58e44c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyNyBTYWx0ZWRfX96NPrcUTOLvk
 3zVRo4Pi9ocbLxqXABvOA5zs1yp/uQHzLFOZi4vFO2jCd5UDlxdrGo4oMk5R40BxvPMOJ7SRmak
 rBFvYjta1YLeEgy6Jg4EDAdKw8OSUaGtZhkFqucw3ikZGLvxAvj5v4e+BPSNaNTZjz8eOQiF9A4
 OJu/+LmwVg+1LljZoJnFhsDLTUUTkyBGM4uNVbP3WiygfXfLVBdKAv8U2J70hn05AUMj2snrBvX
 1rhgEcWNZXnk+NP9go/3fsKDNpJDV/B7ZTc/UDgNPHBc0WttxS+IhPIEclu8gjmpWU98aM1BSOt
 8jSdOQiywDL/i/6mJZPWkZNapo3Ji4dxcrsRSIjPRL39RZS+GXrqr2RsWoTSUsejj2o4rLHv4il
 hSQFtqAV3sx0Fk52LnH7VbfwB2ZVnRV78lwxC3P4BBIIOnIdww2/bVn8s1xk+XfiUNnxEavugY8
 2H0mwsAHPqyOuz5Dc8Q==
X-Proofpoint-GUID: FIq50ZKkGXcRH-oLvPhnBUy7EFlRtj-M
X-Proofpoint-ORIG-GUID: FIq50ZKkGXcRH-oLvPhnBUy7EFlRtj-M
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyNyBTYWx0ZWRfX3wXL3xKu4Knk
 EcbRdUAtekJwFR22PV6TcuWgMTJk8kBmBlduFVFr0fObWL2lfIJEkTs+tJs+j6F2xNOH8+mk0ob
 nDIs1vbromwQXTXzL7N4ozzsCZzZd3g=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a56288a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=etiA4oEk7rotVbtgFccA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119024-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,QCOM-aGQu4IUr3Y:mid];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BCB775467E

On Fri, Jul 10, 2026 at 09:07:18AM +0200, Krzysztof Kozlowski wrote:
> On 10/07/2026 09:04, Krzysztof Kozlowski wrote:
> > On Thu, Jul 09, 2026 at 09:20:12PM +0800, Shawn Guo wrote:
> >> Qualcomm Dragonwing IQ10 Robotics Reference Design (RRD) board is built
> >> on Nord Embedded variant. Document the board.
> >>
> >> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> >> ---
> >>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Actually this should be squashed. Adding trivial board compatible per
> patch is way too much churn..

Sure, will do in v6.

Shawn

