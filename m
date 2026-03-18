Return-Path: <linux-arm-msm+bounces-98367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPC5ATF1ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:49:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0580D2B962B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29D1A3043729
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6189F3B0AE3;
	Wed, 18 Mar 2026 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="krDJyi/p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyjsCvzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6611F3A8FE8
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826327; cv=none; b=Hw0IWLiQzOJEOQoxkjUIJC37BMhYyH1gmNJbmnHGl90F1V1zGhVeyCr4pVNOdIdsa692JDdYD4N/qnqV1mWvodia+f+9TwHCp9bmEDketcSSOqHASedt7agng6+I2BnEyHMMwRr10wjjKNp49v1OEQzLPyt1vP2SNK8ToeeGKr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826327; c=relaxed/simple;
	bh=m7sKiZPj3SO+ZMld7la5ZQCKUA11O2/+oIVQrdIJ5A8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jISsTSh8ZppsOo8mCqch7I71zWn/sYLKSvpPLkpX1czgNqTGTQZqtahASgFBiENCgH2+WLaHVx7USepaDGwefcOYcU41hnYb3VHCzW9eWEuHmyKYgbUZ1L9QfuiS0txjuCvdJMK814OVwee1Dh8jkt8jmKz2HxTegG0EBsoMIrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=krDJyi/p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyjsCvzG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9DDx03281289
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rU9r6GK2AYbjb46aZ6kaVHJJ8hcMQ9WFGGRTQl1vss=; b=krDJyi/pzQ0hkcB8
	Xe5KKZ9AX23pA3mGzmJK8ZX9JmMROwRKr3ppOsDC+ZgPMqxmz3tKzpM4bzZcgxap
	LNfk5MLnfDWdpFzm1iRHOTBBNNrH+TnZV9uuyMcfjTbIDe3MNfZykYKt6inFW2dx
	SUOx/nZq7aDNezHznyx/D63PQXVHOfI3fC/KyWtpPO/7ehac5oZ9+LeVEsWr7XO7
	sFV05JXZWq8hJqb35AzjzdkCAZxovvrNB8Jai59n+svunv2BZJOYdLDrwUGQNRgt
	z9gsTzuI4r0ZET7QPscT/AhF8X44A6NCShTByiqZRzQ5CF/z3Kjgw3g4Zo1MnOa6
	3lJd3Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62ut1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:32:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so441948785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773826322; x=1774431122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6rU9r6GK2AYbjb46aZ6kaVHJJ8hcMQ9WFGGRTQl1vss=;
        b=LyjsCvzGdUKsecyPK8zJ4955So1A2TyKn9MaRZgSQEnspb0Y1UnrqLVYRi3uRgGX2Y
         E6RJD3l8BKlwyioTGjEhRAwA9Vvf/FdWoKc1pIs7z99qFHKzKQa9gXt9SmTvGINQx5S0
         oYPOmmeUyCUYaJ3sYp/tlQUQDSThxQoaHmDZmg36FTlZkdeXJA1IV52FKQ+Y0BEabOw/
         kgLLFLLIBClvxoT3+n3VNDCh03NeHcj/XhXlnALbZGELeePIB/BweqJS0vOEkaEVUUsN
         FSm5U6JNhqRKgrmbMidxUpdDAWroSSsMzJ38a2LVJqMhDEBXfNFhmsTcY5jektkBuHXm
         cP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773826322; x=1774431122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rU9r6GK2AYbjb46aZ6kaVHJJ8hcMQ9WFGGRTQl1vss=;
        b=EJA1xl0H9odmoPkQT5DFPvGswIQH0sTBWqn2Gg1yhQyXlU8DDrO4U+skSRBJQhn3I3
         5/5HG6igiHmnzs696HMNNP2MpxyK6tNRHEsk09rsiOYIrmsUyUOMnkzRjy+LwkPo60Cw
         G3kFzcG+LLuKMIbkZWBOe8+VEXvhcQM+PuqYrf5Z5BdOfVqu28Ap3AB96yIjRhAcxDp0
         CdZN29IlJVUjCOlTGXZq8VDM8yJTVjshJ8E0PiELx+LXJWvNyQoGbM0fZGDMJPAuTjjc
         SsqI4iZh6Osxnr1JELSGEFM72AfLnBeDgaHo0SCOXy8sOaZGJiw1ahkXYH3yqOjUoErH
         sIRA==
X-Forwarded-Encrypted: i=1; AJvYcCVmL/8U6SJvgsXYV6zyNU1LTKfaBDuYgN1/bw578VYnYXvcjM7sSY0bRwyBUUAAC2dSq7o7jIgT55e27psF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv8CxuiVgdzmKypdjMFz4lvzdCwVcdOlmi9o86Wxmqa272cuMv
	ngZOrcvyZEEGlT1JMcv0E0iv91DAz0lKGK8lhGfor1qMfFoG7VAMmxrbDYfc8PBpDlC3uqVExyA
	ki4IZR1ftRBUPmsBfzXmGNFMGdxnwXo5v6g6A3vAeo8cGTzPUfV2FWUnGEA2aD4PkIfWn
X-Gm-Gg: ATEYQzyscbiBnhMIc/FRFo34h1iS3Z7j/UyhYSc8xuSQRpR9tn25cqYLDYIO8Ps98px
	rNU4lnB+E3GSomfn6cKsLrKXWYmEZu+aBtZxmOZNjV5frP+OBgkr4mfO1ssEp+fWOdtB3Au8xYw
	hP2ZDMSAl3wqo2ZvJfhKrvYug8IQzRzbEm/D/SU9v2UAJtgCZzKrofZoKzUOL/9D/lGuIzoNwxD
	PWBhFDYgy9bisl4VB5k9YDU8A/Gqozgiugo2kkhGwiQVtF3z7vV+VJukrqJ+Zz9G7cBdKJQStSl
	8tbjG22PHn5Cp67Bx1l5mqEFELVDBYVyInlx9SFdHo2+YyKDR2ZBHAs3GjBzOIWsnZli0sDjTSE
	MQDjbwU+OPJt179lKS4PrII68KfXPSi3tYA8opuIyi+IRi/P61OHuMANrtrmS7ouJVEoWrQ8ck4
	YxuGQ=
X-Received: by 2002:a05:620a:171f:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8cfad27373fmr254278785a.3.1773826322553;
        Wed, 18 Mar 2026 02:32:02 -0700 (PDT)
X-Received: by 2002:a05:620a:171f:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8cfad27373fmr254275385a.3.1773826322008;
        Wed, 18 Mar 2026 02:32:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9b0asm1287145a12.14.2026.03.18.02.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:32:01 -0700 (PDT)
Message-ID: <4ac195f3-0241-43dd-8e67-41b56afae8dd@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:31:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] clk: qcom: gcc-sc8180x: Use retention for PCIe
 power domains
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-5-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312112321.370983-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69ba7113 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rY4xH7PTqmT0HzfHl3EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: FF8ECwBazH6Z2NQ0Xxzq7Ch2shKRAV9u
X-Proofpoint-GUID: FF8ECwBazH6Z2NQ0Xxzq7Ch2shKRAV9u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3OSBTYWx0ZWRfX0pc5GgqXnr6U
 kiGSvLJGIncrKfCz/vpJrMlO6QM9ySTI49o9GQRyFaausR8A/nchCQtAnpu5TxJakEGNkjdSht/
 teMiiQ5LkdgS5J4HLQOYYW/Eje/hiU9LKKCTgednWUqCoVKlzRI6XwRheE+OMGFULgN8R0oyd/H
 IJMG3fUGols1RngnKN6keGF7lsoQyEs484D93d1mx5wRPeOCaiXKCInBUyMNEc4gNouIC1aq+1x
 B+Ar/pC9NXbtU8RV5X6oIOz3YDAur4MnljftFf6fRO+QVG56Nm2rIlraiYxKqxeW6nr7PrelnHY
 MJbGH1zbkjQpto2b9vciY/K57NPIZ4uKDsqOjIlYJ1HRT273hPsoyLgKCPn0sXSehQhJv4q/Iry
 UJaha60qqoGGH7kJ+kaba7puB90z1zq1+eMr0xoAs6Jp/oC5DfjcoDGXMr9NS0Ts9G23xB67fvP
 UfZNnYA62G5gUyh2PvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180079
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-98367-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0580D2B962B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 12:12 PM, Val Packett wrote:
> As the PCIe host controller driver does not yet support dealing with the
> loss of state during suspend, use retention for relevant GDSCs.
> 
> This fixes the link not surviving upon resume:
> 
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
>     nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS read failed (134)
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
>     nvme nvme0: Disabling device after reset failure: -19
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

