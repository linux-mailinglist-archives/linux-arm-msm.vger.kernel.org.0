Return-Path: <linux-arm-msm+bounces-91309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMF9FcSlfGnROAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:36:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0033CBA93C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1A363045015
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1DD378D9D;
	Fri, 30 Jan 2026 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHL/mtrW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hp+9EMU+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74B8372B34
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769776495; cv=none; b=pw4gLTOT5kzRPUw4dUZFnV1cgDB+AAoz8IX/CVX2K5TzBpN/dyvsC1vAjXH2k5WPgcGxFROXwUZc673W9u204JAYY982tfs7BSy5xdipKqFYNYRj3Sjo0+gTLaSnoTdgac4MfDZEx+aJk5wXFA8Qy/AojsEKLvwMZSA/mZipHLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769776495; c=relaxed/simple;
	bh=9bVtYDJ82LcVsDRivF5w5HY9lRNo++pZxqNM35eQX/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wqm0eMelRLGPlWKsbkEGo57IB2s5aWotb8n2ln8HWgm6zA0h2YNY2wU95FBFE08ZstIuMaW2ves9tCkCgs0NSQoxeKDBDnspdt82XmPgJ8JCZX63D/SKZpEdrbFX9zPPqEvaC2ybO0364vn71jCg4T/L9fdvsAIYslAAgzV4AYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHL/mtrW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hp+9EMU+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UBEFqK1826609
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ul7akGCgjo+5jjsS/coxz7CBPgHvputuCOrKBFbRED4=; b=OHL/mtrW/xwJLnZy
	D/HGDOWVCMls3K5aArXt+HFtIo3hS8M1gD4bvGfg57VzNQKJ7//Mlg4SorR++++t
	zsPQ0SW4yGxY+mpaHVkTy3dubtnecmO82cHbAtf0EH0KE3ZvobgX3i9MgutczUmu
	5IfnEvfLtvvYOSJa83wWXy9OsCnmdLi8ngQt70TjKBXvXGlqXlkRFmXbmF/sXxlb
	+eCoJLB0xDWGT3N1DSACqBOJiGvBZ6w572OddSRqiFNEZD9ahtl7uVmUqinIpKR+
	ahg3JZLWMKA3tCzt/CyU1505hZOXQFayr2klLFf3uEo1+4584dIaK9CCRC1pDJvU
	qp/5+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsmsayq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:34:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-502aca58e75so6652391cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769776492; x=1770381292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ul7akGCgjo+5jjsS/coxz7CBPgHvputuCOrKBFbRED4=;
        b=Hp+9EMU+ec6QaFullTwYvYSxXdy4uJUKxnLH+uKu4xXiavNRyHWsD4s2knDWvGFuSI
         KYafxOGyXID4pcHVAUFTMOUIFCEx1YZQt31wwltCdJYAfYbjRnwiyjh4Y+22eCZiWevn
         uM8bM4KjVkR/dLMRcksmdIpyooDKq00xSlf0dUy1tthqcW1vIId8oVgLLwB4lhtwlUiw
         k1Uh0+dzP+4nPoN2ytebunesNckDgdK5VOuO9h2llgPAfIQ66gphO8rN9gxB1YQNFR5P
         B6FfMh2bLeH1AZIc2omDpT5O/kweMvUZQfxq97LkidFa16frpOfAhMySu2upaeKZnJ7h
         8b+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769776492; x=1770381292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ul7akGCgjo+5jjsS/coxz7CBPgHvputuCOrKBFbRED4=;
        b=Y+ppNB5EDl4uCeJlCx9qfD8w9q4mVJOo9fSHUkqwmVrwzCRpYI/Uyy4SRU1rQ9cNHh
         mdF8qacVsZ1RWVlAb7akjKwgyn1NUiVu1MlsvTfqYOR5DK+IGjeR8okZB4gw6a/gvv/r
         xqCK0y69lC8Uu3FZ8xRvZ+GAVONC02xhl6chFAsaemsp6CqyrKQTm7QyscfXXcjWkSjz
         fwKTdVJSmrKJEcmPvjnsr1l9hC0ZuuLZeWo4ZJ8+ocTwuzw6S6s6HvZVoJJp7JOy6Lmx
         v4HZ7/uz+5+F0nZkeATtBovUYFZb3h0LKPetnhGv80JeCNK4WSGUdDd21p6TMfH9B0I7
         aH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9JNaRpsqGLv75tfmMOkn8QrPQL/fpVViLfxqyXyTBQ70AwEzZk0eIKVk/3kmDksvdmreD8xgmUH8C57wF@vger.kernel.org
X-Gm-Message-State: AOJu0YzqB7+v3dbPQeP6GnaNDAGBwjsrrfsITNAcy4MJloyoaXr5iAYU
	zU03itzr1Dd0mfa2BwTdEl+n0i5jgKt8hD+JLkJNiO3cqlZJ4f+FuXq9LcDxEhwcwBADaAP7uuF
	7Bo+mEhaVFVhnfiHDmodMSjYoCMP/TrN0pCYmKfNlbxn2QR3MQAlpZrALNA+jlc5T11fm
X-Gm-Gg: AZuq6aJEF5LCNmf+D5dYeZWyZxPVzogQEuD2bCBixMwnwuU9uFrKOBbdz/ZYbnkqxUp
	+ZQgU/fTAk+C3AR4YGI/hyjkWsaJpgE7+hiyVLweuefvBpN1hxyCDimj/WrFiozXJVe2A7FFhGi
	U4bkjkMBSfr4os/TrfGvksL5tpPBqg/HmXqcDBwv+i3Z6e/QG8Ean27EJ8d3B6Kyk6vcHN5d+68
	hZ3MYBXX7lpnSAPUi9MnS25pvxkYO1ZHLiE4Q9vPTCNiUooJUt3yGzmFORUhsu5loMyywGg/oJR
	bfugT48ZnX1T3LSbGPVRZHO9N+MYf2+ISvav5HOCPk0y29RFKHIOOFSVVrm41gKCHwBzYSHUrLE
	GxLBhc+KOk/NDGYseUWWdj0tF30yjgNnMdjDK3tfPL9y4MbY6aOm1cAQrtLKiHk1PQMw=
X-Received: by 2002:a05:620a:4005:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c9eb33fba1mr291464685a.10.1769776491890;
        Fri, 30 Jan 2026 04:34:51 -0800 (PST)
X-Received: by 2002:a05:620a:4005:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c9eb33fba1mr291461085a.10.1769776491417;
        Fri, 30 Jan 2026 04:34:51 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c5b38sm410530866b.53.2026.01.30.04.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:34:50 -0800 (PST)
Message-ID: <8e410852-37f2-452b-b851-19b7c4222727@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 13:34:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-13-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112104722.591521-13-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwMiBTYWx0ZWRfX7mRDibpYeHvL
 at5RLBTbR1SQyhzEi1dGQbHvyg16raJ2jZaqXlnXAkQIgqDhVeXsLNMklU31e3tokh3i9HBO5iD
 Hic1S3aAT8xq4bMTPFiGb+S9WUtXwVOTdRUzuXPGKleepgY4oImllK+6veoleQO7QBnB6AGLD8g
 BF9nHKM5bmxmWrAsXK1wy8FC7sTzplEDXu2vAOg8WvI7VXAiJ+aOSX/4541SRGl+Pcn5mQZA9bq
 IePN9otES8HMrLVhloncu4v3hpvjcXLZuiUm+3uCfrLuIlVPRwMRQbFhrp5NWFypHgJmnDg/04c
 CtYZgAJxvvgKkVwbxn0dhca7nGFVJUV4KW+oPgfJM/61QT2/CwNlrGy3jIZVnBxqGWi+nev7Tfi
 CWbH+k/aftNkS0psXXDH+bIErYMZzI1pZnhW+R21FOsFClf74CAIiwqlHkQlPVb17Sp0Ich4HEz
 zb0WJfiTSWgXNCCB7SA==
X-Proofpoint-GUID: lI8Od2Dhb3uEcGACP4NjtYiz9x2WlVih
X-Proofpoint-ORIG-GUID: lI8Od2Dhb3uEcGACP4NjtYiz9x2WlVih
X-Authority-Analysis: v=2.4 cv=HMbO14tv c=1 sm=1 tr=0 ts=697ca56c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_xJWht7u3x9PW1fQUNQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91309-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0033CBA93C
X-Rspamd-Action: no action

On 1/12/26 11:47 AM, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power on/off.
> 
> The SCMI performance protocol manages I2C frequency, with each
> frequency rate represented by a performance level. The driver uses
> geni_se_set_perf_opp() API to request the desired frequency rate..
> 
> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
> is obtained using dev_pm_opp_find_freq_floor() and the performance
> level is set using dev_pm_opp_set_opp().
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> +static const struct geni_i2c_desc sa8255p_geni_i2c = {
> +	.resources_init = geni_se_domain_attach,
> +	.set_rate = geni_se_set_perf_opp,

This means, on SCMI devices you won't don't the vote on the POWER
domain (or PERF for that matter) and switch the GPIOs to a _suspend
state - is that by design?

Konrad

