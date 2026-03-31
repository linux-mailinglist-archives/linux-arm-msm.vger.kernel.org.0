Return-Path: <linux-arm-msm+bounces-100961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFCSL+SAy2kKIgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:08:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C234365CA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5AE93015D27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0D339B972;
	Tue, 31 Mar 2026 08:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aqi57tLs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6WfrqZu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A425E3C0630
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944075; cv=none; b=PIr73tjj0jmZGn16mhkJx2iAUO0wtJtBmWeuhZnaQkGB6Vlg7Aq/N9bnmZZaWvzlfITCEOj/ktDNIo2P6M0a1n88MdVy64xHDe34PHNhu1ZoHXU6zJYgeV+oVx7tHXmHN1aRNXfEsrRpZybj3Y+PAvUSaW/HPWUH8JZdZj6TynU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944075; c=relaxed/simple;
	bh=71D5q3LnwShAxYqxMaE+yJpCvwEkx0ggRNjfGlVCQ3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8FS0KzKDdx1dAvYvRIr60Uz0pxIbL1egVJmNr02LKmdQEuCoC/JKWdMeqcWD+ItqGsgQHBKeO8N3yRBVPvKBwfICklvk0tHjAGM8/Yu4FTNjuHsc+VFMmVVTs+5/jov51ZkTER1MQDRpfe3ur3qzN6fvZT7/7ewtaX9Pdq74YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aqi57tLs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6WfrqZu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5oU6E1841960
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cUFyAnWnalzdlcqrIiIlSnYf2f8KbjaujscQYXFddmA=; b=Aqi57tLsTxJbstn+
	64s9RVVObvhQo/WuaXBah/DS12xXh1tfRsibD9veQW0xzpAOPA2dH8tsNddW4RKE
	W0LytxdiWL4EsGocln6OvuDmyib70L6kDtYwEnY2gu4RbtsD5cnLiDrerM8qEwnp
	iKs/q751XRw0ejfvACCHhQLQRabxdnvqZ9Fz0gw753DJp5tlV5sHpIpfIai+ioaS
	zKmQEA1itRpIEK+GughVmlxENZ+XmVGlTmdauf0hbMi+w01afJK8ggXvR+HMA3H5
	T4Vr/nyXfs1dLpf9LW5EdAe+y6iKqy8+FxMn5LB4ioGLDlkpYzSkaqdVGODQGSjT
	rqUMZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rshyjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:01:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8ea43d4eso129723285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 01:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774944073; x=1775548873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cUFyAnWnalzdlcqrIiIlSnYf2f8KbjaujscQYXFddmA=;
        b=I6WfrqZuSmWatRpWx4EpPTXRaZ/3LX+x7GOK+tT+4Y5G3/TrOqxwZtSJqVu+ZqR3LW
         Q3BmhC3cfJq6SImRUScUXsOK9nuVZJkpHrsVd2PJTycjVWrc7QJbA9FcTGWFeG2BFVGV
         FF7v4QSEpTOi/Im5OQz+V/Nj0BtVbOuXfpNaTegzawtoczf4xQlWivOyYJNVmQPI2auP
         PctjIIR0Eeqfn9KitJN/2XumjlhUCND7hVHyfU+Ub5/WB3saUrx0STViYwrGYETGxjmo
         ha91dU9UrhpQ/fY5SpvxfCPMmdNw+xus97ptHAifs+GTNXLqLiBmMB8z+0TgWCHxelAI
         F/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774944073; x=1775548873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUFyAnWnalzdlcqrIiIlSnYf2f8KbjaujscQYXFddmA=;
        b=kWLKu5SmhueGxWFZeKvuLlMRIRkLmQ7X3xcjON2/s+1oj/XJ6863nxfFG9SHTkkIfB
         kKG7BxNL7pOrqBsmkP7hVaQi/r774fez7BVLi4ciknIfWWf3B5dqOSoCkEMsjlldPRjG
         7G/7jQM6kujzUH9IrYSuMsTfNNVnKUtirEKeNNkcnyLy/R7HjhtLvllMOHDfNhiTRj62
         s2B5/OWxkKSB5ee4DkMFs1bsOtbrz4fqnZrjaEdVQV4NrzTYSbam2ymbBiv5FkCNtAxa
         rgImTx4Z+10JqqgQZWddln5iybV3m1z6Fv6Z94QUu1HEvKmtFI1x8SI9ZYsSfkh+GAVk
         nkGg==
X-Gm-Message-State: AOJu0YyvItRMlzqf918OzkP+JuNIWBXufiOiFntPZ4uvRZd6eqhvN7BX
	HFexWYxJdRazPqpF7wlObl5UNvPl9H8dpis7jLIv5cegNxi8vqgI7RER1Ezcr2r1s4WRx615IlR
	f6Xt8dREUs+PhvPCOcIgKgWu4U5d9yxjkqkJbIBXnevx7V6JKNXkRr2CSSB1Dj9ZaKsAp
X-Gm-Gg: ATEYQzxD/4BSn65bI41vCaJDCMveme7u3ycazJSssd14QHtYB0X7Qc7cvvzTJqIlcvJ
	Kh9g1jHcJdMAGHklEsCcGXZ2I95cwjq/dSW/EMNGFlV+QMNpYh7AsXc0Ev3MM9oPquDqnglPJy4
	5uJ9CTo8afUzTGQQNNf6akhPxOafN1BCrlC1mlpEARUqiyn8DjhLjjjAn2rK634g6RCZbE9GH14
	sxnKvwfSGf6L+NJfqKdRPI64C6K/qDEvvGTjBGTDNx6vBViKxct/QrtyJKdwqeD8Icj/qy0rrnP
	DjoftEi5saWMrzzD5P+oKXJYClaKPnD0vsUfGCNrNltXx+ANQbGP7Wsn6+HLv43l9whwuh3y9C1
	DBgMGgJ3AH8kYZjfivGtiNPtFtU5QlKFuXHcLBnyECbCQU4d1KItq1cTnGeAZwYRaya7KmUmd1d
	Ov0LE=
X-Received: by 2002:a05:6214:250b:b0:8a2:18b4:79cc with SMTP id 6a1803df08f44-8a218b48708mr50473726d6.8.1774944073083;
        Tue, 31 Mar 2026 01:01:13 -0700 (PDT)
X-Received: by 2002:a05:6214:250b:b0:8a2:18b4:79cc with SMTP id 6a1803df08f44-8a218b48708mr50473316d6.8.1774944072693;
        Tue, 31 Mar 2026 01:01:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae23f18sm372898566b.1.2026.03.31.01.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:01:11 -0700 (PDT)
Message-ID: <aca0c679-654a-4c39-8ff9-197e820653af@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:01:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] clk: qcom: Add support for global clock controller on
 Hawi
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fx-IfBfD5o_BLdretn42WYAuYVMrTdnD
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb7f49 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rjm_ucXa43sWr1tRvOIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Fx-IfBfD5o_BLdretn42WYAuYVMrTdnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NSBTYWx0ZWRfX4dFRAh/YeOyW
 l2G9NJr7mG62UmzzTNJXAS4P7RbUEM3Ml6aEY9FzmfaXjDSSO3qOU2xTvR0nsI6/AOOUOKeB+Fi
 fwq0G5OlZenrF7u/57rn+AAZCE69Ckgnf7UV+Hkl46y+gZZZlkmlNlDNXfxv+Ii2lNOp/Jw3+K4
 O40ytVM74zom4NEmNsEgpcKeXNvLLv/MZRyWi0qnUPjrheJ+cwNdC8fetWgw/WTovTCO8j/PYsO
 RTlg070x7fqGabhn5KV97E1OIoBrkhbjcmEc9H2gkSk7T7GfWhwi6JWhqXkCebVqNb3J/TYP+2i
 U/r2TKyx/kGdfhXYcnDWkDGxSOnNkfrSkYeuXy/cmUSEjEkgbPu3JBGwovUzuDzd/qeRvKia66t
 3IW05TF48Z/Z9Ckl7kHIBA47DjncN40DsdM0fH0Kl2tuygBTBUawWDqvS80Hl9iUYeWLbfxVnCI
 sO7IgfvjDUO7HskdmeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100961-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C234365CA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 2:35 AM, Vivek Aknurwar wrote:
> Add support for the global clock controller (GCC) on the Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

