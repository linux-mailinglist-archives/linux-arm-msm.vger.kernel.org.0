Return-Path: <linux-arm-msm+bounces-92438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDmIGT/2imkePAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:11:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C681189B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C44C63098837
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC3833EAF3;
	Tue, 10 Feb 2026 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpgSl0bs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SSkEJe7C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EBF33EB17
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714506; cv=none; b=J80E1uLnXDAdkzeVFqiQcMp1WA/KXR/El372/tlzaqDyehXOLHMrmBWKSuewPLpYgK550v9POeqpP4bldBXPVxO1blAU095QSippW4Eh/3FqaNCqNSp74wCCgZc0SNBTNHcjFE11MlPS321eSgqTMKBQw9bzDtrzZYkjOPut3fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714506; c=relaxed/simple;
	bh=8phweCTCuSE9/1VdxFMRPXiettcccLMsQxNnAgW5v/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YeCXjkc7IgEnqt+ewOTrgYDHKWiXWsAeKItpAwP9CxhkoixKjYtqih2mSD5lBiPaMrGt7L2Um5DNjAzqtAHO0abYNNIB7XOti8VmmURu4g6m7PMPBdzeK3/P+hsiMC+UfzFtfy9udXsL2tQXrckyrkloqhrxXmYO7Ot0Q94y9SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpgSl0bs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SSkEJe7C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A2OPZx1231757
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4ZTsxigu+39NKtIykvgwh1NpfGT1fBGZwq1IOP/Vew=; b=FpgSl0bs5NlaaIL9
	1u+aTJdu7inV4UgvP6QC5aQuRLwJRlZfct9d4FJQOE1jK+tq43lk+RcbXCDUC62H
	bG9WoWnx9CsHIMPw7stcK4DoP7rPmdMPqSY+ExX/VpFPZPbxUuRoUcGTXQjGwQtO
	VEWRqwRs781GTnG+Q9MExnaWOl+Rnsb0GTBpHaP2EvAWM0DuFUMAsGTIus3WpShS
	Vn1orEdcHCJt0QBchxWRXSTjp7w/UY3tyNzyWKhsfVmR2fr0fib+vSQdcn2z/WJm
	7TL+ujAJg/MEv9FLuZdL/brtBtv1LVDY2H8E/2xRxjcovmi6H9NFciP91D03Ftbz
	gYqQYw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7uv596dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:08:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8966be97747so12280996d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770714503; x=1771319303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C4ZTsxigu+39NKtIykvgwh1NpfGT1fBGZwq1IOP/Vew=;
        b=SSkEJe7CPQ5PqCQi2tUBxnM6GeAwkPgBMBMCYiCoN/mnuC77liQejxPaxLuhrwMbK0
         Q57z2/3eFWJsMaCKG/sQxiLRipilwfQloQV09Nt19iKCaWSR0ws8RBZt9Rului3RrqT8
         xPHRD01LhdZkP8QoQugQy18Uf06r07884FHGGmI3rhbZELA/IJqk0D/VN69Nw4Mwbt+0
         ykH3E/IU6+etwoMattkLI8DCnn5+Tp45kfu7HoSkP1CyerGvGKPJG6JCu7uGwfe4+dIv
         gZ1XPNHXAK3UcfVMSgSInPQH75mWJWHvVC3A8FbMEzWVgolhv3qd3+1ihYeNQZROVQBK
         cE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714503; x=1771319303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4ZTsxigu+39NKtIykvgwh1NpfGT1fBGZwq1IOP/Vew=;
        b=PdRjHD9738LLa2yMaFw827XwGyFJq4aiMGbdJxwRGITpARHesrf08t2GxA3pdlwqNz
         +IEncTON+SdLMTvRqCF/PcPeT2PSuOXWdwiA5+smcnLZt5PUsg4RpBTujSvb4eJVgp3O
         fv77sbwXv72NQeDEl+NDGRkV05ZQ3U/gYJ6FdFtAHPdxGvxD6l5v6/fqBjZ8eYavWVVt
         3uM/8FNJMo9/L7ZKHf6XAHHyzy51Qwn76NJA3gr4exHT/U+evD1tJMBzG1s8YeZzBXtR
         Xh6V32RFveqdcdlM42poB+N5NX/anj3BQqxBkp2dxN2FOGlKUpYWj8UxHgWknTudM02x
         Z/Cw==
X-Forwarded-Encrypted: i=1; AJvYcCV0xEqPEgcm8P5KUclIGSG/7R4a854A+3fpzH6xkrab00ZOxy9cPsUfnHqDPY8slr8Abrj6jehfNlVRb4zZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwreuLHnD3ix28VyqhJOhlreDFegrp+fQu6fcp8pBPNbTTvHSyL
	ohYpXwPEiAipuIDCFfzNoyPwtx/hpN5LJhSRcC1hyB+TXLdF1K2aORR3vCrGQZqijwkZvq+RjpD
	XDiYMJjoVfTXcKn3azLzT8hkq62mF6uUGb+j9zRE5aA4c6MRAUNtGuPZnbQifcsvWUna6tj8Zq+
	YU
X-Gm-Gg: AZuq6aLcdTsv5US7QRRPLQ3GiuF2fwLNAXWrj5vkDzt3vrTCOCOQ7nvVPtHwUMHQ/6V
	VYmxnlrfijqPP8YmzjcOUDhnzvQP/zDYY7Ay1EjNuLiyGOjBydLiKzhNZv94+bfqauKhfVwA6gt
	xJ/4fN0M135EPhcldMhzScTucytrqXi0akSx9h1vlNlaA4r9tc7FruW1qTdixk16CZazq3O6KLP
	+obXqsUiQl+xXX1jDxQZCuKQZ2kpD3eJtzXu/Y6W3gITx0cpzrU683ANKIVDPJOb2lNM5+2AFJh
	oPU7H9FaN7IB2hbJDI/RJUYLBDaYvgAMSnaB+DwmOhFthcBiL2HSFhs9Rx5cHfHfY7zWEA6ps/L
	Nyz5MwmQtu1nAUeHYcQTwdRmUdguNnI0reRwqPIs6fcHGZDtcNA466IbFq0HimaMq5A5QV6ib2a
	4FZAg=
X-Received: by 2002:a0c:e00a:0:b0:896:faba:623a with SMTP id 6a1803df08f44-8970fee2f65mr8441216d6.7.1770714503320;
        Tue, 10 Feb 2026 01:08:23 -0800 (PST)
X-Received: by 2002:a0c:e00a:0:b0:896:faba:623a with SMTP id 6a1803df08f44-8970fee2f65mr8441016d6.7.1770714502974;
        Tue, 10 Feb 2026 01:08:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983eb68cfsm3693616a12.12.2026.02.10.01.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:08:22 -0800 (PST)
Message-ID: <5fa188b3-d060-4513-bda3-6608a9bdd7ef@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:08:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: qcom: add sdm670 lpi tlmm
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260210021109.11906-1-mailingradian@gmail.com>
 <20260210021109.11906-3-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210021109.11906-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3NiBTYWx0ZWRfX41tzncWtgl1l
 GwlDiL+ZZG2pIPInMTwKItDbGpNjDUBxsZMyx7JGcOPj74VxxZZ03jMZLAkwhxLU5Jjfh9ebRRE
 I51V6AMmbU240x0dulb3WilYqbnuor+24Ji7fiGmtH3J2jZc0Rwz20H4RHq9vZ31wQuH7vUnoDy
 KaIl39hKdgcLamrXdfXzQrYOLRHH6WcRto+/TsU/qCzSveph2VMnfiAhy9wA430gWE0hbHxzri7
 8qFbKxii4dtMXL0j8MRrkZf6gD2+XnHaP1GxaL5XcjYPpdX16H0W6efPL1YzYvyOxAXPHffyhf9
 Zh5f2W8GwrPV9M1QaaQcV/3zLYYOiibyHtSQrMaQQSLduSTI+cFlKhN0zkB7GytlZPfu/q/TMnB
 m2ZTGYSSoozkf30XonaOxIFaJZw0Oq/DlaRTuHRKDgGJvm2vxW9v7T+qNWcFGokPbo8MfS6cMmF
 7mpycKxEG59kJVdSuTA==
X-Authority-Analysis: v=2.4 cv=P+Q3RyAu c=1 sm=1 tr=0 ts=698af588 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=nadR7umDcEpqB2gTw5wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: rdkwotgtmf9y0SD5XmyC1L-RWBFEFuVo
X-Proofpoint-GUID: rdkwotgtmf9y0SD5XmyC1L-RWBFEFuVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92438-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A4C681189B4
X-Rspamd-Action: no action

On 2/10/26 3:11 AM, Richard Acayan wrote:
> The Snapdragon 670 has an Low-Power Island (LPI) TLMM for configuring
> pins related to audio. Add the driver for this.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
> +	LPI_PINGROUP(0, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(1, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(2, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(3, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(4, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(5, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(6, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(7, LPI_NO_SLEW, _, _, _, _),
> +
> +	LPI_PINGROUP(8, LPI_NO_SLEW, _, _, sec_tdm, _),

"i2s1_clk"

> +	LPI_PINGROUP(9, LPI_NO_SLEW, _, _, sec_tdm, _),

"i2s1_ws"

> +	LPI_PINGROUP(10, LPI_NO_SLEW, _, _, _, sec_tdm_din),

"i2s1_data"

> +	LPI_PINGROUP(11, LPI_NO_SLEW, _, sec_tdm_dout, _, _),

"i2s1_data"

> +
> +	LPI_PINGROUP(12, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(13, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(14, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(15, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(16, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
> +
> +	LPI_PINGROUP(18, LPI_NO_SLEW, _, pdm_clk, _, _),

"slimbus_clk"

Konrad

