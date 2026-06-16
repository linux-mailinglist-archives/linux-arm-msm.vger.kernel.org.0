Return-Path: <linux-arm-msm+bounces-113387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tubVKb02MWqEeAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:42:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F322268EDFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:42:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LBwH4lPV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YHpQ6VAc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113387-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113387-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D73C6311E97A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3732942847F;
	Tue, 16 Jun 2026 11:39:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651333043C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:39:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781609976; cv=none; b=pdKEjoKKYlUc+Yhnm53NkpLGxIwMzgrqg0H7MRZ8n81c6KT9y2Jbas0hULSTOPUv945Du3jDdV1u+16RqMTz+F/q+EhlxBsVK/WsRVLQDd38nLp7bYP/Y+O6sLCDi2KiRe1Qp5w2J/+crzHhm71SPZm/hFVitB0XiE/efB/0tDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781609976; c=relaxed/simple;
	bh=cdB9n4zhfA411DFKBEmVB01R9yJgxUzu2Kl7rbYAT9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZHJEBTiordT+RiHALRW70SQq7yIi8ucdqhLEtpRAYwD0u5Aj4bFTNRpcDYDdIlwaADqdVeVTQ6Kyh9Zh8tSATIR040SAdoqH0JUXbv/p5WH9d5hzL161/UA4JMa7XEB+L4yEjsiqOaasdf2VInD1d784J2y1d2Zsmgc1y01HA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBwH4lPV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHpQ6VAc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABnkD3384135
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I56fOt3ysDTByYRTLiZG/A+YVqbSFJB8HPjJn/AF3ho=; b=LBwH4lPVLGAco/IJ
	lAlkVXGvKHsq59IPHRmrz+wBWuK7+TrDUV71qxPnizvzEqqu8+16vRZUKvG1H55k
	/9dBMyMK0LBAR7Z0iQeAgPEIdSIMrO1OPu8fIDqZIhARUXkMEchSmOx/93mbVOE+
	txkCeY0TcqGPQWUNZG5SQ7hHTW8nJR0hKenn3YNaVpz7Av+WBbvEPZQ8r3b2lans
	t/WRunBFpNmdqvf/X+WXSnXXzSsPuSgsdR6l9654qMiHkmdK7ryVjpFT5EGWBUD8
	wJUk0i5+ZvIlW5eS7ztXa4Lu0irf02nMgoLEMzPyQ8TaMB8OTsg6+Fth3kRq9w+M
	50ea9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep96ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:39:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915a547f4b3so42886985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781609973; x=1782214773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I56fOt3ysDTByYRTLiZG/A+YVqbSFJB8HPjJn/AF3ho=;
        b=YHpQ6VAcwsug7elOUPDB7rIhHhtoWc1IcAS6b18VqCI8+CL2l8AFBFgjj07v3exaFr
         BxhQGXdiCoBl/qALpuHnOXI3Mxk6J0+rxCQ67cq800zvOisMfO2MOxgYwAfakxs/08ky
         Xv5lZHqsH+6chWDT43wd3nQ1jLrLPuUx3cbMuq9kv0pgJhyiXho9cKB7chn0P7A+ZJ8V
         rwLEJL/QtFarQEvRAuDOpvk3WugbTn5mEkqSA5NUKB+9YxHgYdpJ3znVKahQ0ltJc990
         NfHOS3/SmxjezRnJWi+WdPmrx5HYUiRMjzqvC9YfXX0xlHFVURsvgrauOJ2D5ApNVezF
         aGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781609973; x=1782214773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I56fOt3ysDTByYRTLiZG/A+YVqbSFJB8HPjJn/AF3ho=;
        b=ZG4jlgaSD02CwJ+E0Zd25EbGFZnYe0TSD2qSt8s5S73z+ZYePgCYv61+qNyPPYhiR9
         ERncfCrCl81yD/S8EmpKZmZDAGtcgMqFmZ+X1vg83jgdSKAcl2K7L8DR0XViaFRdjO2l
         qPMYD+cI+wI/yB3bUh+8P1CCWVgDbrndbKiOpgg/zNK+ENJ/cAN7ibFP3MIXq3IeTd+Q
         xArSwlBDEDl4DjWYFPhdLFAmjLM1r4HG/NiPyRQwJ1Wje89sdT/FvtrZQMOz9rx+g656
         zPjVsUEvhd/eAfYDdn39qbZoijsqkffOILcc3bgorL87rjgf/juc8hbNy0H/P/RkSgt1
         skvQ==
X-Gm-Message-State: AOJu0YzEHHwJXgNuD+fNbOprrJkWRMCMPUb8vjMoHFGxnQn5coopeJKW
	88TmgpR+fgli0UwKjUOFs/0PNlfeI/Xn7SJIcAP6ft31ju4XzxuLTDokAxArERi9LfXRG8/vMXa
	BEbEhb1Q+odbD1tMnXBmLFZfWEx+oMe5wWqBxcehd4YDAqfCJKyVaaRNGnKLlm+/ZPyLF
X-Gm-Gg: Acq92OFt9xxPsLrPgTfPpSRDJVaNICXsId+U0HFrN1KgBfnk1pGMmrxKHSfdtSCmD1X
	CYhkMfXTSRQBcO3WnEuB1HH9iYbpHnasS42yKUB+3bR78/4D8v4e5K+CGC5DZHUE2uTb66yfssB
	tnFzR+BCDuJ3kqjBuQ0XCU9lzBgbC92ihuGrpxU+NM5rAknL3HvkfVvNfowG1IARxM1HWNHyQZn
	5lY2z/Drs5E92fobUXpYUZsXE1bw2eL8pp3qmG2pOD9R/HWSfZTo6Qyfm/wj761Az8l6lo3moll
	ENijmy/+asZ0nCC39OyI7XO+Wwh8uRgyH5Gg6s1+YPE+zKRZWZOFJ8erQqTDzHd4/al4Wxpb2iO
	4YtO4Q4ba0hq6BZWj6VbbTQIBaGxbbWDUTboFi/yM21aWoQ==
X-Received: by 2002:a05:620a:c4d:b0:915:4ca0:1210 with SMTP id af79cd13be357-9161bc725a3mr1781373585a.3.1781609972706;
        Tue, 16 Jun 2026 04:39:32 -0700 (PDT)
X-Received: by 2002:a05:620a:c4d:b0:915:4ca0:1210 with SMTP id af79cd13be357-9161bc725a3mr1781371585a.3.1781609972307;
        Tue, 16 Jun 2026 04:39:32 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb531896dsm625714166b.27.2026.06.16.04.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:39:31 -0700 (PDT)
Message-ID: <7a92ca6c-cc66-486f-b297-cb2907e1c0e6@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:39:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
To: Pushpendra Singh <pussin@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
References: <20260227111051.1789439-1-pussin@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227111051.1789439-1-pussin@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a3135f5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=fIRz_ROpwzs29qmCFkkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExOSBTYWx0ZWRfX+t9lYYHgRzYt
 y+b3RaCZUZfuw0UFmIMEH7Mjc3FOkrenNMsaylz7DgRJ/KS55PaQB6XddA1kTQzdqcSJHf0fMcH
 oBfI15tSwaNQLewEoX6hXrV5PnmKCFQ=
X-Proofpoint-ORIG-GUID: HkBFqxcgfC1TYPT7db55Snyp1dg2Veca
X-Proofpoint-GUID: HkBFqxcgfC1TYPT7db55Snyp1dg2Veca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExOSBTYWx0ZWRfX1obLYl1DIdeg
 lazttHm6Msk7u6upJfB0kJysOM0Q5MsB8wFmDd+1eiauXRXYkNoHW7brRW6N2XXsnBZG835Dgwc
 0RjUjfTSU1nOllqccSXRUJ5UW6J1av23x4cFnxmNqPArwXi0pjAakbq4I5vtYKkDF0jNQdxZQ3X
 4cd9efH7JQR/5jgiueiCXN0phIYVRv7QMU0xMqJwWQT1wFOpHdTnYuMPRwJYbJtrDeIob9gcRYA
 F2Zqm5a5bZ0JICq/svbhupt1KcHAXXXKUkoMeegruovNhIlD+p42UPva2JIm1h0aRjgk42IMf1E
 oRMqT4e5UH+1xLEzCp0j/G2q+y9U3z0Fxgc830mvX2OuN+CToA8NUyiHIF8YvF6f7WkpfwdsCOs
 Lj0AdaT5I1w4qgncn7QQ5fXc2v86vKFiYiBiRqyQ2atYVX1BwcZs+WIRrg0t8JJYNmmZZQCYu/Q
 4smvmBkbuvwsyU4/Yaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160119
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
	TAGGED_FROM(0.00)[bounces-113387-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:pussin@qti.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_kshivnan@quicinc.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F322268EDFC

On 2/27/26 12:10 PM, Pushpendra Singh wrote:
> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> 
> Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
> vote after 3 sample windows instead of waiting for 16. The previous
> 16‑window delay (~64 ms) is too long at higher FPS workloads,
> causing delayed decision making and measurable power regression.
> 
> Empirical tuning showed that lower values (e.g., 2) made bwmon behavior
> jittery, while higher values (4–6) were stable but less responsive and
> reduced power savings. A value of 3 provided the best balance: responsive
> enough for timely power reduction while maintaining stable bwmon
> operation.
> 
> Significant power savings were observed across multiple use cases when
> reducing the threshold from 16 to 3:
> 
> USECASE			zone1_thres_count=16     zone1_thres_count=3
> 4K video playback	   236.15 mA                  203.15 mA
> Sleep			    7mA			        6.9mA
> Display (idle display)	  71.95mA			67.11mA
> 
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Pushpendra Singh <pussin@qti.qualcomm.com>
> ---

Since this patch does not seem to be moving on its own, I will gladly
hijack the discussion..

I was wondering if we could transplant the bwmon devfreq+governor+memlat
setup from downstream. It seems to be way "smarter", in the sense that
it keeps some hysteresis information, unlike icc-bwmon, which is purely
reactive to immediate signals, in addition to (in my brief understanding)
sampling other data sources, such as the PMU 

Konrad

