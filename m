Return-Path: <linux-arm-msm+bounces-91628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHl8FQO7gWm7JAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:08:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F58D6975
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99FC93071825
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25877394465;
	Tue,  3 Feb 2026 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDfSNuTE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LK8crCn+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67BD2F39C2
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109450; cv=none; b=iALCculfVAa3bHE4vFvTTuY/Im0VBmQLKMzE3DTN5TLF93Ykxzm1ypiFgFCAQ5+U4hrgrSfgrNNLNUbxURSy6Rkials7Twp0ZnYdDKnR6z5h1cjhnVSrZyrPg5F4Z17jPDhc1qIpt313wfKASlsQPYmSTo8egZKKB0XBr9nY7Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109450; c=relaxed/simple;
	bh=UuYMHxTLfM2fyfg9mxmD9oROYBJosUT9xY+ok6mD8g4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTeEC7Cq50MP3yxY/CnoWhLbd1O5077vFlPcxKzWLTf580ITbsAODmtQTq5dZ0GIGuO6gdiFK/se99IGZ7mCD/QnryPa2WInWP7ubBjK0qeFS5DjG1ZrJzrq7mENVq+26uRenlk7VUmJDLv5/0C7buE9Lr7ZhnEDoPZMSkac61c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDfSNuTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LK8crCn+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6137F2qm2884359
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDd9sU/GOi0hof6ytSwymn2c6rYVs6a2ClA1gto2mEs=; b=EDfSNuTEanSVftUv
	80vQnfi9PWiWqZgPPdfFHS+fDZKJoxWzxmvHIrRHSX9bTM8mxtiOeDZ6ayMqSN9r
	sitTDWDq39x0TCzh6lRD20jWZbEy6ObTcl0cip7T45YrfZ7oxZL1qRk5m8sabIkE
	tZJTBPq23iGCljr5Le+hgAD40b4xc05yTGGtpeWlVNzWIZdTrIYNkKWT5/RCICkn
	3S1tEBzOIMwl9YRtFcZDYeZQK/WnwkhiyY+rCLzcsjPAiQZooZIWlS4UGf9Ub33J
	asH7EJd4I19zniz6MFeZAXU5aCeVq4s6hEn6cpGEVzX/+7JV+HqN52jNVqMmng9h
	UttrRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3kfcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:04:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2fdf3a190so53758685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109447; x=1770714247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDd9sU/GOi0hof6ytSwymn2c6rYVs6a2ClA1gto2mEs=;
        b=LK8crCn+a2rYsFCQYgMJ3WmGOR5PYlTAUdXmPEa2Jbdfvokt31swB97vWCdNJgTEOD
         nt5IamMRd/XeQHnqNU0iaAfHipEb66pHfSZ6HcIOQt1LpnXLM5nAIGC+cGo6mZILoPIA
         HYsuUCxo4GCPN8LUWhz+Onh2UeSgN8lMEoha+DdmmnSFDCZetUwh+CpXoUNlX/Nf21A4
         Iw17mwhslBzkQxITJZpjhYEZky1Vyqr2Jr4Xu788zEZCDZLJATNqOnDY5TdsuSVMg8zH
         2wUyOtoZ+fKiDD95Vs/ekfATsVO3xT/tIkv8jbkObDbQK061AnJ5FpKm+9XC3v39Dcdq
         DLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109447; x=1770714247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDd9sU/GOi0hof6ytSwymn2c6rYVs6a2ClA1gto2mEs=;
        b=kPliB2LEKlfKWcQFUpyHUS2b58a3yfd4fazy1lE4F1z9t3TBVwvJGJsIo/KZXTM8pI
         EIz/iv62yC2kV7/sVTnnUJjb/AiXloV73R0seg0FT2l0a8L2lSrZfp82Qy8Lwv3Dvr7W
         6bw/Tsx/NNc6O1lnv8xCMGZpn3A3+rBrl5cy1CjQHRnCjBqnaCBv5B1p3IQhmlb5TW3l
         VmgAxolIMmhBqmz421qbneSo4s2e7HgPCkn3C0gVQgkxYkbMgnAXijmQBIJS+lgDeQZz
         N5kx7aJBu71+tVW4sajbUmWKiBUtwi783VQ+4vjUhFmw9U7zlC1RhRKSCLI+dmiNKPbA
         iEcA==
X-Forwarded-Encrypted: i=1; AJvYcCW0aMK6KFto8NDQzpj4X/2drwTjMmpIbwlWad5avw9nAJDet04RddfhYDtGRmK7BiQaWZZyBgfG4qZw3RwX@vger.kernel.org
X-Gm-Message-State: AOJu0YxYdI7FHmUgqoA6l/IZLMsDekXBr0Tf5D9A2W3B2hZZtlfvFTXM
	rcrpa1HYtpFGWvbEawY4dpfjWXu0/EfB1ZHnvoB9sd27iuEMVA+D4wRzXwgJqZKIZEchA5zHea+
	zbod1/W6XKBPecICipkYSBcF1e6lWluWaPfIUFFwEIZciZAI5WcDjkCMf1gFt3AEHO3GD
X-Gm-Gg: AZuq6aL8J3FVx9rgVtCjoNa3VoU4KLY3A6tHuOuMpv0/Fpr2Luc9pxCR7dXAOHBrQOr
	baeuXEI5SAvmUIquYEbkcRNesO1GdFzHJ6njM4G8swEOe2P0Qug98MzyYcePDpMdvSfhISRFOh2
	tBmZPpJXvUuwWyXYeglJWW1kqGYqWvFsyGfJ9rUNkDPiEIXCIgYOvPaeV2UAF0uQW5cr4ROp+gD
	hpaeT40/FKxVIqmDg2iBu75RSEF1oxSyCG0LjSXaumGdzX5HIAW35wmEak8HPq/gDt5H8SyoQ2d
	PoUUjApgkBdSxq/DaVNVWDh8Drl+eU1rZxrOwPen7jSUdRoufgscjYJcqLiEuFqCrsHPH+gQfCw
	sy/a2r4WfNR+omyu13sZehxmsA5szsCz51QXJX9IARmUyZuY0gYq5+CtFvMuNbZP/zBU=
X-Received: by 2002:ae9:e710:0:b0:8c9:eb7f:b6d with SMTP id af79cd13be357-8c9eb7f16d1mr1137890185a.4.1770109446899;
        Tue, 03 Feb 2026 01:04:06 -0800 (PST)
X-Received: by 2002:ae9:e710:0:b0:8c9:eb7f:b6d with SMTP id af79cd13be357-8c9eb7f16d1mr1137888185a.4.1770109446494;
        Tue, 03 Feb 2026 01:04:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4452d67sm8778846a12.8.2026.02.03.01.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:04:04 -0800 (PST)
Message-ID: <7a2b9a1b-97d7-4c4b-98bf-61176badbdc6@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:04:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: qcm6490-idp: add and enable BT node
To: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203071807.764036-1-janaki.thota@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260203071807.764036-1-janaki.thota@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pCz-NcfiUdDzyqsXYtsAYEwNiDadpVjt
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=6981ba08 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=urrX6pSkbUk8ZukRZgoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: pCz-NcfiUdDzyqsXYtsAYEwNiDadpVjt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MSBTYWx0ZWRfX/B4gLr+bqW4S
 heM6MyydInWQ7bEdSmdh/Rkbp1Qx/m0QfBqNdwsj2eggmmDERrQRNwaalf33S4ssxM/cuxUeCGZ
 Er4CgYrgi5GJN5yCmwtpW9up/xy2ea3yyjuC3dvvRyBWV0g3rLmLtrz9p1M/9u8zvbwU4qiOJ/I
 /AMzlSHwkKIWjjOO06sIGmd1A95lvajN/K7xPVKkBhiwiCRyJ/qilfGLp8K/pTdA6aiAVFkBKk8
 PPfdI3qgHKsjZKc4Dv1bXJpVcLmWsF13wqagNirninwFolVB0rp7OWcReHl3t/Tz23LUfCdgyb0
 Le0Ga0W8XY6rZgSgE9UGmN5HJ3mmJw1im78xUgGSvK9IAkh9VDy53vI+GrNpETenodWv66s5yoD
 H3HBvuWL3cwKB/3GBaBThcD7CM6b73c+lCPbXYTAmHeZxeMaZS74CqGyzh/cGfIlcfr1XXRgSIj
 FFPbpFWbelnadjzK6+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030071
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91628-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E8F58D6975
X-Rspamd-Action: no action

On 2/3/26 8:18 AM, Janaki Ramaiah Thota wrote:
> Add the PMU node for WCN6750 present on the qcm6490-idp
> board and assign its power outputs to the Bluetooth module.
> 
> In WCN6750 module sw_ctrl and wifi-enable pins are handled
> in the wifi controller firmware. Therefore, it is not required
> to have those pins' entries in the PMU node.
> 
> Signed-off-by: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

