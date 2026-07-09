Return-Path: <linux-arm-msm+bounces-117952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +98rMzOGT2oUiwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 13:29:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB75B73057C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 13:29:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=je4FqlXd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NxVqN75Q;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117952-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117952-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB83830055F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 11:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1326940E8EA;
	Thu,  9 Jul 2026 11:24:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FBD3BCD04
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 11:24:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596260; cv=none; b=HvARwxEabpB3Zas6jYGabG6RDVK+1m3R94v7JGSYkHzRSiU1Bb38GpVDQfPfS6tr/V6Nx1tnx50YxL1CI46lmpsAd5oq0TfvxzKco1UJGD+Sm1mWpbKwu3tp/oWkkH/MfKbmT/nW+E/tJEtT6RkRGqQYscbfmrwb65bqS3Grv8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596260; c=relaxed/simple;
	bh=CN5h3TyOwEIznSft0b8xErmSRMFj5sNT+X4d3LzCde4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8k9x6eMPWHZSWIEhLNAUiL/67HVOTAPLIrk4yiF/2uM5lIsJxvwtihgbH3YAWjBfEf9DruTZerkVbWMMlfwm2UIne6qOPJlzsh2/sFzf/QMPdlW3vAmnEozkNh1J272khPmiiqFpoGUcZUTA74IZ+pplLh/15068Lr+4hAbVog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=je4FqlXd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxVqN75Q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN8xL1668605
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 11:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TwEVV0cJXSPJJj4UNs7yhLlyqJbVus2sdd9Q6EnUG1c=; b=je4FqlXdnHKAyBSa
	rdZB8gfHe70pTHbPgRgOG9sP8j3x5sts4MwxSNQT7bXIsIM1uGpk3GgjAcVY7c6l
	3vH1ty293v5pcSZyvTNChSWhVeppFflSyFp7/Q/kqCrdABwf35CmVcCIZGRxIF5j
	gCNvYeF71p14zRkKw2kmo7VbxxyR7L1xrilY1OQJmR0RbMBM2JY+JXhw0uUfQayX
	sdmEJgBOnUc99YaSFcxwqEPfyy1LUG9YKsq5FGeHTBSkoVxKwbvCKdq0+EYySPIk
	srGLRZnvyvlPmqntq2/2ehf0M4qDbZcWoRislMk9rseudcHUtj2h2lH/Bn6YFQCa
	F2zmGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418htw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 11:24:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c069f73e4so4418111cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 04:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783596256; x=1784201056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TwEVV0cJXSPJJj4UNs7yhLlyqJbVus2sdd9Q6EnUG1c=;
        b=NxVqN75QFzInA6sCLgA+zEndUK9tiJ8dXVmB6y/ospDk8RSfmaegCf2bRILn/e9lRV
         jI2DDN7CEe0wNZe7uq0fKLMqAC4CW8w8niY4CWHHYP9y467RFSV2x/W4LgGW3BhPFY3N
         onBYTxgJcC+lcyX2mY939783f+62O72Qh/XxsSw7xfAisRXnqYtuZ4Uy3QChDKDTiLKL
         Hb8ivpks6TB/Mr/BKFs7ZawdfmV03zpVSm9LMOWtQ7uATC6CQayM9UQaUIOtz7xqSiAl
         EQ81vjM09PfXbu8WWlQBhGzwf1KMKWN6JS4GY7I2uPcOTtfTZSwxr08Itmv/TTMU7gG/
         eEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596256; x=1784201056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwEVV0cJXSPJJj4UNs7yhLlyqJbVus2sdd9Q6EnUG1c=;
        b=MGOiWDPn3YnjOKUhwA+TYQrtPA8vdAmzQctx0nrgIKhsmsO18mhxNBpMrxJu7tlsmZ
         VRW/qVvM6Asv1iFlrk6CQq5173r4aSBoH+11bCs8wkCaxa/2i0zsYY+/xmlfr1LjDsp9
         WAkf5nmsPsy/N0hN0SwZZIPxMk1f1g4eqPBm1h7VMVYK3KI96xOx8lm2vxKiJ1LQUP6f
         3PQ23Kcrcp+SNljiSyODhti5hbNG71NMtw+0ptBetmxn9Lb2f6ipN0nAiAwsbQ+h6JXf
         sK3FEAACca6tIQrNQWH3T2veLSB5cuMULkeMgQzlt4l8L5GOvxYZyV2IduS95zN9goeC
         l3bA==
X-Gm-Message-State: AOJu0Yw06EQGzmUy10tOVydH+WyoG3sGC6+oK01ZAFx7mVbpwRMV1ZKe
	NAvnDAYDp2FprRpnkutr8Cktx/wcruFYzbkta5oR0nXoQo2Uq9dvwUn05BJvTP1py5Kh3nzfNzi
	5zo13BbUnaNhICWsrcQoEeJnNxPGK1ELF6jY9/Xoh9N4Fj86V7+sR8P4ZqybtAM8/5wmX
X-Gm-Gg: AfdE7cl7iJ78HL/KEEceZMMVcJzPdoDqFtsyGcrQLppcdaklFP1/kDVAkXLfjqgPqIe
	s9lnYitFK8NoetZam9ZU1wtnYNIwiNYmwaZTkczVBVTrv71LZMiR7Gmh29ZQkjaKCtJYdUrTkCr
	65KaZlMeFXtZkMDcAIeddF9CjyDQtW1UoAl/9m8OkrNDwaMz6uW95t9sQ+6Ad49acUUSTCNYr+D
	01SG76eHJLRflWvGMq/JyPLFtRQEz3ses67Nm/7dBUA1Tvrq+mebJTU4mrmmEQKwU0Mhs1FvZgN
	ahOOOEzHxlEfue450ku6uHa0EgyAQbdNPQNoHQjzvgGcXZcakKIa7l+wYP3+LK+pyj60fiQXOEi
	Ga5K0QUGpZ5iBdU/Qw5uH4gQLCc2MZu87xyA=
X-Received: by 2002:a05:622a:101:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c8b512840mr54792401cf.8.1783596255909;
        Thu, 09 Jul 2026 04:24:15 -0700 (PDT)
X-Received: by 2002:a05:622a:101:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c8b512840mr54792201cf.8.1783596255474;
        Thu, 09 Jul 2026 04:24:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c3f5ca3fsm291927166b.51.2026.07.09.04.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:24:14 -0700 (PDT)
Message-ID: <97ee8a04-6278-45a4-80ff-29f1b38e0ddb@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:24:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
 <20260708-tcsr_qref_0708-v8-5-62c42b5fa269@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-tcsr_qref_0708-v8-5-62c42b5fa269@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f84e0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=B6dnFezVkazQL_yb00wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExMCBTYWx0ZWRfX/bFkpL8sItdI
 Iak6pwnqo23MXBbOOqCLFtj8ptAXtFVGt3NYtTjyuwpRe8Wbod2aBAdcnKjk268z0A/YK/LsZFt
 ZdWAskGeu+iohSWt1d65VqqO6k2uL9oahdPwVdnvkGDQBpLwULXjrqVxvd0O5B782bM0E87qiUB
 v2clOxxQUR1fzI19w/gPYGPqgsb32wRq74AKNOYUKb3PtBGm4guPt8Eprtk44i9utsmxDnAiV8v
 6+z7I3ezMfhutsTeiHjPG0xlt+FnV2GMnrT88oLwtpH3YfOzqseUytmQikW03yd2RHONb0kTzH3
 eBvN5nt7PkSKcwHJV0XbTMPEZ+Y6bnM9GaVzTMsQN3eJUnRGNWEoKCLZTTrZ2irfWZVmTwxQQR1
 sFUixR2sn9liY+GU7glZyLKr8s6uGczqDaXsAK+1iSX8/kcWRlkiwW3K68jshqONGntkwkQUXf8
 M6TzpgnGJia5cj6pCDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExMCBTYWx0ZWRfX3R/pvhrohFsK
 GbG5Ao3yEAP22danos1e9NCVgTPm26f9hOTpd9Q2MQIWdBOKHY8Vw0WflcsDWMyiff/EgqEOgbB
 cRAWhY7R1X/JT9t+PvFgvBWIbNYdBMY=
X-Proofpoint-GUID: auw7LprXrcDDtn9y8aH88Qte4o3oEmxL
X-Proofpoint-ORIG-GUID: auw7LprXrcDDtn9y8aH88Qte4o3oEmxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117952-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB75B73057C

On 7/8/26 12:02 PM, Qiang Yu wrote:
> Mahua is based on Glymur but uses a different QREF topology, requiring
> distinct regulator lists and clock descriptors for its PCIe clock
> references.
> 
> Add mahua-specific regulator arrays and clk descriptor table, and use
> match_data to select the correct descriptor table per compatible string at
> probe time.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

