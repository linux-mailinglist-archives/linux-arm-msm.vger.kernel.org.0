Return-Path: <linux-arm-msm+bounces-116283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0OM+KqqZR2rEbwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:14:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B0266701B39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:14:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nn9OUf+H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Cfhk7bqk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116283-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116283-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B14DB31110C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6BE3C09E4;
	Fri,  3 Jul 2026 10:45:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D903BCD11
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:45:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075532; cv=none; b=Ajpwb3ru/dVSKnJ8F6E6TFc1r00z2Peyd5GoeUzjt7QYGx8e3bhrZ6e6IzrBSKYr5JrdJsn7r1Kb6RWq7f+3gP1BSzVDH609pqABMCnnG7VDFYINAKd1K7z16T19mGL/s9U8nY6YkX0Oij1ko8C2S9gnIMQeX2XbdvH/2mRQtXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075532; c=relaxed/simple;
	bh=FnaKJmImowmGqbSAgvOkv9nmEuKFz9Ys7xzTu8ifggg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SvzazN/mWlchWUobPP/8/lIWaUlVO4grlUc5Et6HLISzKU6+JbipU8Nf0uuG/sJMB4IxMPePmxW2Ln4YXUozcosPJfODsaINXCLKFeGM+Rv2vV/XQnEas1hVbUBDoTtenlXb0Rs2wMGOtMWi8lbDwYzOmCEqSgwkxE9stLvIkBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nn9OUf+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cfhk7bqk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s0ru3124215
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ozB8G6UISpV5QQZObgxogT5e+/UOQlTdfSBPoDkLSD4=; b=nn9OUf+HiR6+dHKh
	LyZQgc8jaGGi89RzxRILnPKja5p/O4Sf1a4/mOlmO1nXPH1OBIeHt76ngA3lqTfl
	1fpAUIN79XdkQqeuYrbFUm8z/mIdkE8x699GnmqaWRMFalR0wv9RyxR9kqPlMFQW
	wvLo3TVvQqLTc+UNT/Q6T3t/bYla3idO5VL4bdwp78hwv5vu5B0cOgbVgW1hUoy2
	KzEQFdh+JAO+y7lAcFAXx+JMRRoBY5vkyNER3mDgDzbZO8SW+hUUUh3XnIL60b60
	gtiGoWrxmvIBeYNmdKTpOzzC/U61f6ioFZSa9VCCxqFgjijzb8wCsJNCXsmnDiJc
	BOOjGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpcwp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:45:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6415f279so7654685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783075529; x=1783680329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozB8G6UISpV5QQZObgxogT5e+/UOQlTdfSBPoDkLSD4=;
        b=Cfhk7bqkPhP6GgLP9jRc0wHpsFE8X/hj8Iq0IZahNRjTqN84Syp+4c37D8j+2o9RVg
         bMQUuCWN9jwG4XjIOf85BO9HCmS5WuBAxUib6RAyPNxqhRCdvFFI9dydibU01B/lWpee
         4rvGCZq5SXI4NSmQGpf50l/7C8UNInMjwQkYG7R7x6E4xlnQf7IfHJj6i8KUfdwXbK6Q
         7cuVP8K/mdG5lyA9dgDGYtumOeUfSIvz88Uyfe9o7pL1iDc88pSHmBPFmPKJ5voWOkzC
         Ki5n7H7hisviTMLdxfeLZaw6mLj0sOFD9rf2YGqf5CNJYTLcMCkK0PSLkqcqEyhLCkyj
         gCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783075529; x=1783680329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozB8G6UISpV5QQZObgxogT5e+/UOQlTdfSBPoDkLSD4=;
        b=qhi/NCBg0ngE/C4p0askhWJx6XushrMYb3VqceT1uANp+s3aJYZwhGNL8IfccBEu1r
         zEjY1FZ65k0DPf//zKWV3VNolEZCLOJkruHCXj9YokXj1RAB+ZmMJZv1MN1W15wJeLqX
         2px5XHgkBHHkWGZaO2Fh5Zo08kNj1LNTq9TESxUzhtU8jKrRNv54sWB+Am3RCW7Fg5/R
         Xtn734a7HsQAy+wNUNxPtAZbXxn61wL+dNACx3O8bXnZUYcozZqPF8E9PsbSQpRyFT77
         M6WnTs48g3Yugx8SHjW33wOBzASswd4S8G9tklwP86wXMBcUu2/Xw2kXyFmKoQc3pbtg
         826w==
X-Forwarded-Encrypted: i=1; AFNElJ87xL6Roba75+GyLDhGBV8/lgC9+7iXahVylMcpZcegFk4DomIaTXPT4d7XeQSUHngdALxOFwCoaLw3Xpej@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73CLIz4DtT6gAxhiRAc4iYB9w55VFtythIyjQpuoSilCXH07g
	IFrzFyZYWHBqkAkxVIIl8TKjMkxwCCwKHBeRW22A0Hwk7M7lvgLHG2FaDp+StgjtfP7SFhRqw4r
	r/Yb0xT+HJ1ibqBs4yCwQbLjlET1rRdYJja8mfKLJfVM3iAKm8EuiHZpOa/DcJc2KxwUQ
X-Gm-Gg: AfdE7cn+jNsU5wbkLdFp7tKbI/9ZdY8qhCrPDEfU8w+DUzIoPT831r+xjFkHEV+p0n7
	M5JgrFLAu6S22IcP9PWv3F6rdF75gDKPTZvVY/yPeXZY4csnu5CB+Fd73YVfkDldarb27xNAHDe
	kN8z6laQMPCEfoFuXPC8C820mEMZEYs3bKVkWAh4ojn8ZGvx/1bo0LExcCoD+G2B9Y0q/agEPg0
	8FQ4h7zq6mAY+st4s3RQFdcY99RXCpRvnPGAFE76kbp/Pwlu71in0p+xk+4m+obVyUFgq9MC4B+
	VdxMudrg+ilqaE4qz4hN906lCsCsH0/aYfzmBXcaSpi1u1j6lP13G8to7nj2I5Oin4nB9PrmguR
	titWvQK94tcezrvi+Rtg+k1+IzzDTx2AO2Is=
X-Received: by 2002:a05:620a:450b:b0:92e:46cd:7299 with SMTP id af79cd13be357-92e7852f4d0mr801162585a.8.1783075529408;
        Fri, 03 Jul 2026 03:45:29 -0700 (PDT)
X-Received: by 2002:a05:620a:450b:b0:92e:46cd:7299 with SMTP id af79cd13be357-92e7852f4d0mr801159985a.8.1783075528877;
        Fri, 03 Jul 2026 03:45:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5c52sm268765566b.58.2026.07.03.03.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:45:28 -0700 (PDT)
Message-ID: <d133a22c-fd6e-4f15-9aad-9732c878184f@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:45:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/4] arm64: dts: qcom: Add SD Card support for Glymur
 SoC
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
 <20260702094056.3755467-4-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702094056.3755467-4-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNCBTYWx0ZWRfX+THLypvvry5R
 VP2sHxpOtcaA4CSvGiyPppcQtrhBRtJQmiO5omHxFRqabkOSuwIercJNTwK6vQlxZPjm+zB7FsN
 3QlpLs4qdG2pFbRzuTiZmPPs/Jn8WKQ=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a4792ca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FZAofsGHiTNuLk9495wA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNCBTYWx0ZWRfXz0YKA37IhUkN
 E/8GDYnzSjkukFHGw0SOi0zOYNbLD4ulJdAELITO14EMpHLReChgwwSxWvSGN1J6kuUJ9LrscFV
 LdKiuWh/ZY+fII7TedLkGUgqzVSk2hw+W0eOmpxCFgz7bUXj+vhM5+Qep8mX2BS7+QAl8ze/oCT
 oTp1XX/uP11CHw57D7kBvFCz79QarwWZWMjZUZLl2D1dcrpUmz0QFH3Vvqe3BOvI+HJjCEjIg9A
 P67DrY2tcu7Tvom0oUcq0WM+7KYGqqV6D5V8XsurKQGU/whS9xUQjGMcjQTxbWr3XUThLu/d/fP
 T8G+Qg1NW/BOxCcWj+0XoCfNrdcWurL7ZQ+KU/dzr8BJYLm5h6FP2vtF8Qo4QHD6RfbM/mDMtF8
 /KNFkZTO4zo0OEB6wS1UtM9r4cbt8jTJwf7BSey7r5LgXtzj1zZfj7aICtkq5qfD/Rxcu0Tkq9e
 aWZdws3UjmrPTow//AA==
X-Proofpoint-ORIG-GUID: 4eafXEX_Jd0VoppOMfFHr3-mvJnoGj21
X-Proofpoint-GUID: 4eafXEX_Jd0VoppOMfFHr3-mvJnoGj21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-116283-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0266701B39

On 7/2/26 11:40 AM, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Add support for SD card on Glymur SoC and enable the required pinctrl
> configurations.
> 
> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

