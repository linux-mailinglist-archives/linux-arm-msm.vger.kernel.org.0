Return-Path: <linux-arm-msm+bounces-103106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGczL+kS3mkomwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:11:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 189843F87AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DFFB301494B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFB32E173B;
	Tue, 14 Apr 2026 10:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGjfhpLv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMgFTFr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F043C660C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161504; cv=none; b=CIyq+bWV9x/VgwXLvapIpVTz0Qf+LoCNKoXHpm7a6BtGjh6t23Kg6Vqam0S3QQCfbPpuxxP5yFj6YqlfhO5lRHRejULWnGUM2JVrIlg/VtRBcJoOeQbxEsXk0vfGtxEVTCnXRW4NxTjbvQHVymbSC6T1b9HJzDbn0G0RkLgWu6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161504; c=relaxed/simple;
	bh=jlEKdr4s8Waz/f9/mLTk9IYrGDA2esVA2MdqiJB+790=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ie71bc7YC/iY+c/zMlio+tSTiT5SbDSInaJcu4sCiWr343UfY0sLBOc2/dKj4aq6Hw7MlrZnERdCpRkPpiZ0ds5V9djJoRVZCcEFWrD3bARRwTIdotlxFyo8hIj1VZHHIILQSfQluhOzAQu5GDpDf+Oixc/dFY/XjPYvjDmh16E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGjfhpLv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMgFTFr+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6gYiK3505282
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nWiqz6dpgW2o0xfDaYnccn5KCh48alyf9JL2mYExWeo=; b=HGjfhpLvbQfVvclF
	wiWPS2QKuWCaGjgeJaSiT55vzar9hwyceMc6liY6UbQo9/Jq3CFHTTrM0XRKQJA2
	CHgy9sMUr4bDJVKp3PHr7eVofITr/CnKueri0pwmNFB/XkH6UiyOyla47vpKG5iv
	iJ0lFZziWWoD8GAF+zLMWJ1PzxPI7nAIsE/YUZ/SLdltOAd+tCEpEC4DlK2g4M7Z
	KZx9HpFZlCVq0zQaKMcHgHrN5LnM7jSUOe9eaX4bdMK94z4mKs4FsHljYE4VETws
	TWVoNfD2CZiD77i21ahLt13XhJBy8DWNeVxm4g9P2XmdiZLirULOQsPsCzlnaXXi
	exbMMw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870j9cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:11:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c183c2eso50841051cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776161499; x=1776766299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nWiqz6dpgW2o0xfDaYnccn5KCh48alyf9JL2mYExWeo=;
        b=NMgFTFr+JEjiiLa3dfr4VpR8yqWsFEijrVH1kS5eMlZ9DjzZQYTP3/tTkBm5Vz9Sgu
         xrkxgza357LplbOZ8OFQbfbsJBfoQfHVmVFufm+QAYVuhIFvaOcRJTXaEpQOgv6A9gPO
         wFjYZFWq55ormiaMWmygC57vl2h8jWOSsvEuih3oRuN7OxhXvvxmNyg0SnsFn6c7is0O
         kWFOsZZIGtGrejggRIYLZLDKx9kMDphkusPCMMah4ErsaaAlJAYm0bwNNnY5yjCurJck
         miq9DxF8fb4nZz49GPpwvIGSdekEuoRR5syksvsDwiQDiXHrL85eANkHT1qjtfCqYsPi
         8UBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161499; x=1776766299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWiqz6dpgW2o0xfDaYnccn5KCh48alyf9JL2mYExWeo=;
        b=OAACpcp2OG5Qgw66xKAcrXbRTwj09lBeSg9r7riScl3TsYvptaLqPSwClPGAWf95vv
         Wwq+J2RG62D4fkEZ/1Zlxj1jIBBZ3D2F3DVterI55xkq6+emP3uRfZUk6pgQ0mkPFais
         Zj35un4cZG5a1ng90BtLprh7Xe1GBIHMSLkGSuBm9lZV6sFI/xbhZ3DdKZQKNgtHAomC
         9yhowwQ3WM7KYqrnhFLEwxrJ+QoQf4OXuq93Ej366loMXnuGohmUFyutRtKEg17cJcYE
         jKlOdCZQmLIb0m09BdCef33xfpzO0S6W5Sabu8vD6ckxaD2vhrisU4eHrT/fypnz0UrY
         +ZbQ==
X-Gm-Message-State: AOJu0Yxgp8dXVNZPK64uWtY4y6r4QJ5M0ElIcUhRhQhsAhKNLo6EQi9f
	x6RCrvQGUvYIDBYe2SBWxdNo4jLG/OdT/Us+VGijRgqPt4qiaDxdxcL82uqUYE6XtFOplhsxjGE
	kVSqEDac/Pb3xlFqLOZ0D3icMNYMrDBY3HdOzb/hmAw+fs2hgQ7DLG/3RUappVlTVrNxy
X-Gm-Gg: AeBDiesD5ZopX6pEF6czS9sAdy6hhvC0BhO1juHpyERElYJYH3Rp9c70cg/SAMmLhRS
	5L5dfXxEoqvCYdP8eYC+7Z5QIi+JuhCPFnCg+sIi5Ah7LO9xXI7lXZuOn32yyiLkrOZUkuMPBsr
	gJiOKnJCqwJNCkyN3/jkeryWMOV1Hp/OPDEdTuteH87BHu6KcqRdMJGGufdME6Ske2D8MeImhUw
	y3rr3pAMNUCC7PUPfuwrA3BNzaJfYGkEdMz9TOv4EW8LPWFpZOKtFMBqOZURwRfuXbDnTy/JT5c
	PNFsGsAF9NMxRAK9tFaNPeOg/kX1GUbSUh+on3LtnzrrT9NCMrNKwxohLL33CpC++wTRqUlT80p
	O4i1zIuE5ly3kwUW1gbYiaqlRXqdqly0E4GrKj3LCUq4RVs8u9eNgCJYhDHBiQTocEwL9GWKWLC
	7gZwGtXCfU1K1Pwg==
X-Received: by 2002:a05:622a:260f:b0:501:5260:51e9 with SMTP id d75a77b69052e-50dd5bfc32emr174420751cf.7.1776161498626;
        Tue, 14 Apr 2026 03:11:38 -0700 (PDT)
X-Received: by 2002:a05:622a:260f:b0:501:5260:51e9 with SMTP id d75a77b69052e-50dd5bfc32emr174420451cf.7.1776161498201;
        Tue, 14 Apr 2026 03:11:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dedef77sm392310566b.15.2026.04.14.03.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:11:37 -0700 (PDT)
Message-ID: <ba1afa27-c3d4-40a4-aa7c-6364ee6f86d9@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:11:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: kodiak: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-4-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-4-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5NSBTYWx0ZWRfXxkSbk0fC/Nmp
 qZ/y+b6ArpQmfSn32YnE20g28Z4ZoNHS3I3LcA/ZH7pEoAkbyYTP2nYFVD/NEsjP2jGnoFtZgaH
 Nb1xpCMdGzXvOWaSCY6GchxYVZJmCWmaFvsGCBTp0jivKgTlD6HThM+cdxvSC/SHlQ9vSv2yFYl
 oBMcwx31atdre/k0nqU2niQ1IdQSEcfRBdFMnbq2rl8jl870G8Z9TkuceDILemn8prPQnGRgslL
 15L0VCpGg7YiLL8abs4KupgfO7TWzH+8crcVhdzuScmgH52g1pqG9NOtapm0jl5t9VsCX8VB1iz
 D8Yuc25gUbMSN5IG/kIICYKXwU3LOmX7/JgtpOAV41GIQXIuiCPI7ho3yBqa0yEdhTR1+SpAjOM
 Y8pQZHEVTsU1VyDJQzyEdfgv4lhGHwPrQfOlW3slcZhudikR0ykJjgHt7agTtCBjI8917RwV0zA
 FC7nYlxJPKB5gMn5SZg==
X-Proofpoint-ORIG-GUID: Ixn0C2UnI49TQnnbzkjfn5udFf2NwJP8
X-Proofpoint-GUID: Ixn0C2UnI49TQnnbzkjfn5udFf2NwJP8
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69de12db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uGyuuOI-cJ-b_BVNecgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103106-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 189843F87AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the kodiak device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

