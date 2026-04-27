Return-Path: <linux-arm-msm+bounces-104731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK2WAQJc72llAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:52:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C5472D56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E5CCA300AB34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284DB3BA237;
	Mon, 27 Apr 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0SCdai1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fI95fiJM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A72D3B47D2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294329; cv=none; b=BliG3AU/tbSSVhK/TZuPHxCP7xdBERk517tuKRu/RqY3NNVa2EzhKmkhfKb39CWFKKI8isyC9Oe+iRWSpdBDe9Ko3Tr2Bw5nyvAz3jxoBcAwgrytTh19iP1X6jUpNQijOJDsNtZiW+eARHNWVjwXydBZ5+uuRcY2X71bhfq6KTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294329; c=relaxed/simple;
	bh=s0X/oNtxwUdmyCVyWktNtKMFUbuRfQD4WViCsZVk0y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Er4f0FIDk3Rs1cIrzk13A1QKQFsMn/7oEkrvA41stiRWsDuCB57sU0zUC+5TACLAjvn/akYl045xzzp57mEunAneUPSxlV06ZoJz2F9xotz6gWQOuRU+3+bwLw5ZV/HJrSQ1pPnQhGviSxG82PE7jB3dQq2ZYGYOasEIGNdJj9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0SCdai1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fI95fiJM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TEgc2913944
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o1t7Ar7nBvrSlYgzLnazs7rl5oHVGXn8P/AHYILE9m0=; b=i0SCdai1BCRmhkuX
	qxUVkKUSwK1/kUM388kyryLOT9LVDbHWb2w6DptC2ckJ4g685MVbEMIHdpqFMoxX
	rn2Lad/qhdTZMrskkQhSFw+AuXT0xa6wi9+JJvF0DNsIyWWirRlNia2UMMVZYmk7
	Zbdi/XtgKmdUQ13GAdxjeHQW2if/w0LlYxYmCODg74XAm7JJjiOtiZDI10fVn9Sx
	Mpg74NvtT7GfZl0Zz/NzcI6lbkF69YiX7ksa6wwbNrm5zPBV4FV2zTy6vDDKx8Is
	kNuatnzJfdpisXcGCDMoC18uC+7y3d9kT4S2IYwbVAnW5Xe0TWqowpok7mc9MNyv
	Hr8wwQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xhgja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:52:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f1b94ac9dso19654101cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294325; x=1777899125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o1t7Ar7nBvrSlYgzLnazs7rl5oHVGXn8P/AHYILE9m0=;
        b=fI95fiJM6FHYtTDumNwgOunuJWQZGmJTeRcATfUnlJUF5HN/0nLd3XgkAJa9wHtJ2p
         WP9DcrFhvsFBo7PPOg9/ZhwnGHsvfHHvkLlOdR7mnv+/yT/84W1ErrDEJW4MafsBnkrz
         NYZzogx9IDvFXd9QN2+vJDuuiE8TI+/F4xRJ9hCKbN8EaJNrGIupN3fBPnoy6RErO3Sh
         ApuBkUvLS2OCCa2agQZuaKDxMIllrYZ4DBJuOgj/PGHgYGJPiNCf8pgmIgFCUW0ztR6u
         cLW/3ru/E3ijSpSje6JFmD7thbzrIqjL2K3ouHPgrf61vpIJvyQzwECEhmjMZysbCOHH
         eAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294325; x=1777899125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1t7Ar7nBvrSlYgzLnazs7rl5oHVGXn8P/AHYILE9m0=;
        b=NmSFUnPbJGEoVbVmdd92ejB1LKsKq7UgcrKjhfsQTKshIlLMN7c44OJJzrfShwisb/
         sSNacJckLHb6DzguqCN+eDGaAIHwnbvWdbpws6QtXQj7I22p0BS+RLJ+Pvs7X+ZbuM2R
         Vg/Ve+pze4afGJw1Zv+lDE5/fww3Wgklh3BxGwhFjWA4N83TO6qO5uChqENtVzuQ4n2H
         1kAllQCLTY2EjSUprN0FwlKfvjh41uqc6MUr6AP7cB03yKvyB4XHq2aMbxWWc27AfuYs
         fRp8eN74xfZYjOy3dLJjF6mqm2lDvvjhoXhP1aGph1sVK3ofJZsUiEQLUbPG3hd0axpo
         dIaQ==
X-Gm-Message-State: AOJu0Yzv0lnOo5jvq5HReS0fsh19XDoKQlUPKoj0xz8uvMrGVneaYIpQ
	SZphefkGo9F9XlYVxPvyrjOVA/F3dXiX5IS6dSf0oa7BAjJR16HE5sdA9/o8QlOEWys+XweNJqs
	2lzzxH4/NQ7H3AqdOpFE+o+2JqhIbrXwx1A9pwdT5VAz+IbX5l9dFXRfd1IjvQDDbDipGOd5lm1
	1z
X-Gm-Gg: AeBDiet/RGixJgDI+LUaSx9UtyvHBXSb5i0BPbD3H+GFrgkaQdNVyi3sLk4ftITqnaj
	ZHszvzjL4k3DYsUfNTYorHL63+WytCYMmQenweA/+pHLLN19UyfVH2PdWErDySxzfsWNIDDYBIW
	iryotP/eeo//g3S04dw1LN+r0tQv6lDxE5rvIhDpluBxOx6pyONqv5Ng1G5aRmVJ6BqgQA88U5G
	RF9LPNFSEcRGYxlcHpBPU+QUrIgq55tdUSrBg3XMRzFR85sieKEmpJsi3nIJqs9c5iTO8LXX+QV
	nHyQKrOvs0cIgviOJLYDh09/h9dt7KFXacLt1/+sENmvnOocIxUQ/nNC6ISBzAf445HnNxSkz3U
	GEBKLO7Uml+++KPctOsDvIoHqfAOcwEou1yEXMYMQJ3gGE40YW8E5LtYYLiPDLpvkieXJGNGznn
	iTJVZZy8YWe5N1VA==
X-Received: by 2002:ac8:7d14:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-50edf3b0365mr304289781cf.8.1777294325510;
        Mon, 27 Apr 2026 05:52:05 -0700 (PDT)
X-Received: by 2002:ac8:7d14:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-50edf3b0365mr304289411cf.8.1777294325007;
        Mon, 27 Apr 2026 05:52:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e1bsm1103157866b.3.2026.04.27.05.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:52:04 -0700 (PDT)
Message-ID: <6b016355-24fa-429f-8558-68581ab8e5ce@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:52:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: talos: Add memory-region for audio
 PD
To: ekansh.gupta@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zc-9q_4FKCUmsZWBfapKsPn3VYLw_fyn
X-Proofpoint-ORIG-GUID: zc-9q_4FKCUmsZWBfapKsPn3VYLw_fyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX6iuFAybz40ci
 GaXsK2458jb+OKG47k7f6KDbi2jQRyLq8qag1vovkKUmOEIvLWPw+4TJ8RbjvzK7sBuU8csPTG6
 Ursu4R8AgtIQQNgEv4QlUkgnfzsSyuNyS1882RfX0vhWrUjM8bBmQ0002UN6jCYNPAUcp42k7a0
 VkGTAffvytH+qG8ltQOQJj2j3Wy28QBOLIk0Rg8AcvlBdQCoDETOKQr240NXrbBT7EDC7BEi4n5
 vXJdnLOywpKC7SgtoSu+oPZNAkfha4liMjxLbWCyvyhE6GJcDkGF0aY4ip+MKZEPiqDiFgY1nSs
 v+WxBiqlDMKIGgtluTQT3iE2SpoKRaTnMv47E4G5cp1wGmH/jcMo/vHBYuoPuFgOZf3i7C6EGjk
 63V0eR9mcA1QIWi2dCXOu2qz3FfxHUnydmNEzmdhv7Afa0+rIz5l0Ci7bXO9YvlxT56WfMoXW51
 J0tikfvZiN4hWlUVZyQ==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef5bf6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=X6ziXWecMEHV84DmvM0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: E24C5472D56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-104731-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/24/26 12:10 PM, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

